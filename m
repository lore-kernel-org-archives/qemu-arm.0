Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4248006lfk;
        Thu, 27 Jan 2022 09:23:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7j8JbfU3ECWGv9yMipORzAZ4uujLntTOESsaqKuyo+tGU3mCJxUlfJ0nAHf6zXYR2bZub
X-Received: by 2002:a05:6e02:2163:: with SMTP id s3mr3144435ilv.244.1643304229766;
        Thu, 27 Jan 2022 09:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643304229; cv=none;
        d=google.com; s=arc-20160816;
        b=iVFqWZH7veie+o7v8by69e7fJcZAr3W74D1KRlUbMfatBcR2WsaIdXAQqwYQmzlIZm
         BwJ+PxCdV4jMTfTiQ9E78rErlEz8w6GZ/quUMAq0UpKWV1ssxSFoj+FntL1qUodrLuJS
         Vho/ul/dd5lhpVAuhhutFD0iZeb1mjUwAzK0ut45B85vkAQ5/V2KGeUrRo4XpBm7KY0W
         LsCbrPJN1DQbNmyPXCRBywORq0PIpJi5aP9govxa32kzAq+elKrmgFuyHtNWuXQOyEjw
         lL0sDLJk+Llc9o/w+Fvu4NFM5Fg3J5nSN3JSN/Sf85S3XYwhLm2dhcpnW8koTmyMXTEC
         QdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1EKftSqPbTE2cj73sSgFhaPxNMghmo4WdRClxKMHw6I=;
        b=RUkBR3LS0lrSso/kSlg2SwDt9VqwSTYSF6vOuA0pHI/gFdkdWE/MfbC6QhK9CueiLS
         7yi4NnQyyqMeU+Ccf1zQDx5q5rBs3EcvvDger+dzwTg7sScpguZ+YAwfIYSVrPT82yyO
         xnd0EyC0LR5ynaocfNNZvitJR1hylTwknfEkiM1k4Mc3C5N/jMvrqSXdra2weFbBA8wv
         lszSM3v6JQml4inPmd4sKSw1tLQ3yenVtgxhUBxI9Z7zuPFLq/OQousijbQNM+7aeWRU
         MB9Fc5TdroskO7SqfvQp8uoNveZuiwA5c6H3BqnUKPR0r46SDNYt8XQc5zKAT8Rt2NU0
         zrZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R8Kd09Av;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si2011111jam.115.2022.01.27.09.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 09:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R8Kd09Av;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD8Uv-00057H-5k
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 12:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zU-0006qb-J3
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: from [2a00:1450:4864:20::432] (port=40802
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zQ-0008Ol-Ug
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: by mail-wr1-x432.google.com with SMTP id s18so5557528wrv.7
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EKftSqPbTE2cj73sSgFhaPxNMghmo4WdRClxKMHw6I=;
 b=R8Kd09Avc8C/f1GhlVyDLp/WK5GWmU076hO7f/3B6cOBvVZvhRrCneKAR6g2zYuGvS
 hlkr5kz/maqF5hKngaL+e+CRbPlZqwRXXTHp47YeEIJiIT1icbzp3g/fQ2YUu+D7LRxr
 rFlZ9bG2FO1mFBB5v+8SmG3pXbyb/TOwaPtCw7uZyC5/SqoPzKaPOINNvvdMyXJ/94OA
 FRVN3vDbWrEPZXm25dAzUFCe40vI/fEBAvbqOX1dmmDKfZOiO5ph3Q14Vu9bPqTlm7K8
 xIUehGthUDR7eJkfwAeTG8Fc9gz9+Tww0FlhSCiUgq5ET957njMHZdGWY7DhXMm9lO9S
 Unjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1EKftSqPbTE2cj73sSgFhaPxNMghmo4WdRClxKMHw6I=;
 b=wDmEwwdYN3NqKal8Pv5zzjjwl0ZALAlYfnyu7X6N/D1Iw6vxwfLMdg+niNOFX4GCPo
 BECNKAKoOl+NIMlzYIzFLorGp3hyojCgd88w9ZDVFhS9pZxeJYT8DJ2b7xIVphMxN/BB
 u1IpZsILvTb7U6UMOf9uuAgWqhczjU8sb7ijgDOPQimaJoywx6PGT2YYReTYdDsSecJO
 diN0OAOgZI+4R5RtEp0IiQBA/QHkmjxdk32p4bVnbmu8mcU7iEVr1vc8YAdjnW9+D5oH
 a5c2aIkKH4Kbg1HS5bsXbSTNB1hXgKAx0v4dyjPM4k722RkQXiRdeCblkhQaxvOwljtM
 lPtg==
X-Gm-Message-State: AOAM531TyEIgcV0CwNq1qU6cvBa24QM+aCXFDvV+1ZFXiNtpur5nuduW
 QzeDHwwg/V0l35v/cLzGEOLuU4T6gy6J9A==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr3525373wro.7.1643298426087;
 Thu, 27 Jan 2022 07:47:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/16] hw/arm/boot: Prevent setting both psci_conduit and
 secure_board_setup
Date: Thu, 27 Jan 2022 15:46:35 +0000
Message-Id: <20220127154639.2090164-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xi9C/E2YW1m6

Now that we have dealt with the one special case (highbank) that needed
to set both psci_conduit and secure_board_setup, we don't need to
allow that combination any more. It doesn't make sense in general,
so use an assertion to ensure we don't add new boards that do it
by accident without thinking through the consequences.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 327e449f831..0424c178305 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1339,6 +1339,16 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      * supported exception level or in a lower one.
      */
 
+    /*
+     * If PSCI is enabled, then SMC calls all go to the PSCI handler and
+     * are never emulated to trap into guest code. It therefore does not
+     * make sense for the board to have a setup code fragment that runs
+     * in Secure, because this will probably need to itself issue an SMC of some
+     * kind as part of its operation.
+     */
+    assert(info->psci_conduit == QEMU_PSCI_CONDUIT_DISABLED ||
+           !info->secure_board_setup);
+
     /* Boot into highest supported EL ... */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         boot_el = 3;
-- 
2.25.1

