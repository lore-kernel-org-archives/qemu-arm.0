Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4314199lfk;
        Sun, 14 Nov 2021 02:56:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlneKhkP4xvdEDvxWRgRlr3G22dhUs96cRZEApW0V0Yxt2FmFyCrdh51yf6dUn/+I86pG7
X-Received: by 2002:a05:600c:4f14:: with SMTP id l20mr48833553wmq.164.1636887406991;
        Sun, 14 Nov 2021 02:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636887406; cv=none;
        d=google.com; s=arc-20160816;
        b=LLVC1QZl0uWGJktWR8imH/Jr+b4LbnsQCh0Uq0OSK/I/OzYPOkeh5eFGbh8wk3eRcp
         c9cs20wcB12O8oWX/NVF3wxop6H0sg0FkVjgxc8vmd+dhX5dYhPCgAzPO985tkiZhjQH
         NSSHyBVn4Va3WAexxDGEorsjghx+vozQMxmoTArDr7WA0czdSlGm5fzhrYlXjnuymTFQ
         UyBd+dohKPGVyBsPmeaVIF3Mr+lZ06omDQRB9llkZCMMN9iiqYoGskEC7OiztnpPesLi
         AA2d24ojDg1I0bHIYmSy8yA4fNYXFwpW3LrlbXOnXrW/5seUlPtTWq6r5Mx1XbmXmsGy
         DUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=bHHIgW1obRBGQUJLy7bqvG3nmvmp5Fye1AGaBQMPyss=;
        b=Gq/Z60jcoATW42dhfFs3GXpEFT/smCxYEWASsmOJWqkRdaVO6sLDQypDPqqK6NpcPS
         N6TT1YQ7NUjzTN72QIw7fY2N7foqXtdTHsCIWE9MRfPA2Wm0MOnmpDbDWdB5dJzRVtm3
         0nP1hgfOsqjXANAmzilSdDmNb1y2CS9OJFJEchIFmHGIYBMlXxLqh+cqeEscnmUjB2XQ
         zxVPuePwJlHnsLZaCUccXo4cQsiWt+RfD4yo8osXAACbK+FpwQ9Uyvg1u8VC9ELTceh5
         fJDwc4A3jyw1K8a0uLRDsgqttUMDlkC4Nx5cBCiqfC3mLJVecxG1P2knAA/VRuQLcbAs
         Oznw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id i82si20653192wma.126.2021.11.14.02.56.46;
        Sun, 14 Nov 2021 02:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from localhost.localdomain (dynamic-095-118-029-131.95.118.pool.telefonica.de [95.118.29.131])
	by csgraf.de (Postfix) with ESMTPSA id 27F376080090;
	Sun, 14 Nov 2021 11:56:46 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrei Warkentin <andrey.warkentin@gmail.com>
Subject: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Date: Sun, 14 Nov 2021 11:56:45 +0100
Message-Id: <20211114105645.16841-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yDHdNiafRgYO

When we expose an SMC conduit, we're implicitly telling the guest that
there is EL3 available because it needs to call it. While that EL3 then
is not backed by the emulated CPU, from the guest's EL2 point of view,
it still means there is an EL3 to call into.

This is a problem for VMware ESXi, which validates EL3 availability before
doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.

Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a211804fd3..21092c5242 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
-         */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        if (cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+            /*
+             * We tell the guest to use SMC calls into EL3 for PSCI calls, so
+             * there has to be EL3 available. We merely execute it on the host
+             * in QEMU rather than in actual EL3 inside the guest.
+             */
+        } else {
+            /*
+             * Disable the security extension feature bits in the processor
+             * feature registers as well. These are id_pfr1[7:4] and
+             * id_aa64pfr0[15:12].
+             */
+            cpu->isar.id_pfr1 &= ~0xf0;
+            cpu->isar.id_aa64pfr0 &= ~0xf000;
+        }
     }
 
     if (!cpu->has_el2) {
-- 
2.30.1 (Apple Git-130)
