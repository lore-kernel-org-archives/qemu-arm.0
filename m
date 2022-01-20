Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp859033lfl;
        Thu, 20 Jan 2022 12:16:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDvKtc5KTeTL3u2UIwFp5Xqi4vXV8UNZnCAYMFhRYZTxRDUjV/g8bxXfv0gtTCbzree33U
X-Received: by 2002:a25:908e:: with SMTP id t14mr1208810ybl.636.1642709818305;
        Thu, 20 Jan 2022 12:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642709818; cv=none;
        d=google.com; s=arc-20160816;
        b=Ava70FyMKENRndoGsbPIbRoJ/zd88Vvqm/8iE2U3VgIUBSU2PPatGD8/LaTEOl4cs7
         l/j6U0iUzjwwWuOCVMCO37P/OTajgNmZN4GEsCXkxa8kD/0N2U2pYk1DYu/sKW9J/+rJ
         XXTx5N5zcryx5Ts58oqBwrJ5Ih/KDWEHlAl9rpv0NMNESLZmNagVGGk2kk+prXR6WVPg
         a1nncn52V+AYKv290G5AoJgQo5ColwgvvD4nUKylKAKspw3H0bnYRICxpibIg2063TMM
         1ZXFFn7FVphWZ7FTY6Bif2+krFuyXCt6ImLy166xJvuQ1C7Jqs1+z9guE0ZzmmyFJ2z2
         pfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FcNzRDDLqUXh8SKulDhEdj/nqpA2o3Dbwbq+sgN0vNg=;
        b=ohAObwvULAzbEbh1nYIAdvVjWNc6ayrON+kbvgfDL/IU0A4Nwp1HefICjTUT9nhAp3
         UX6m5qlNPQNJPlMnG2RKYiC3K/z+Sa6znbAUyGLBGRsA2KmL+SaBmIGQfiP91ygrhCfQ
         ePaBnJin9d0pche9/YG4S99GBQhPaDf43wQuPSq3tEIeSaVeHaseyK3TY6OKNbtTmFn1
         geucArha5AOuYPtSG2Y2s/YxFJ9cK/B8ENRotLHbP238XWArdTI9DW/ESrYDCyveCXfU
         qe5oYL5ARYYwUfgAu8miu0L/nMKmVVmI6I/3QqfWqs6Md+rXpyIn73h6S6KQp5rIbX0C
         KcEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZewIxEA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si4008381ybm.623.2022.01.20.12.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 12:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZewIxEA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAdrd-0001u8-Nd
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 15:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZAz-0007i2-Vl
 for qemu-arm@nongnu.org; Thu, 20 Jan 2022 10:16:44 -0500
Received: from [2a00:1450:4864:20::333] (port=41523
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZAj-0003OW-J6
 for qemu-arm@nongnu.org; Thu, 20 Jan 2022 10:16:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so14629184wme.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jan 2022 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcNzRDDLqUXh8SKulDhEdj/nqpA2o3Dbwbq+sgN0vNg=;
 b=ZewIxEA1BzNUxoMoJEmAuxr2QDpTFmGWoYpJhbBxjTHst0Z9BhlCyAEfmvybhhiPNW
 pwBEMEGdRcRBjDWvAPsMG7GeZyv2Hx3FHcW8Z6bMH3LO2NpSzKL7oHCwHN9f8sZEQoIN
 NBgjUzSj67EPZacOugUlRryQ45LqZ0xtoQivt7rWFUeF1KEzpJm1AftJA6r7vx4E20L4
 xRNJ+74j5R1437gorGJX3I/NDNFiIUlPoDvE2zKa/8+GlI9fafHWu3787kIcXWz+UDn1
 QePcpkpEAW+tsOHaCJC06ZRax3M1/CaiLJYVTyDn/PwxBWDjBvc6N7Uda9lwKV85Emy6
 r8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcNzRDDLqUXh8SKulDhEdj/nqpA2o3Dbwbq+sgN0vNg=;
 b=Kzk7o+0M3JaL0T45o0YnLomQIxy++g6lHrgUiWAgmpJVhbrmtEnviR0+IFgkw7O/Cz
 Y6xsdgT5VWyjpXsmqt0/pczE7UVfr7q7Ds2JvDSbok5b/RbHRWt7HQxcH1KHhTIbbojL
 8rLYxXWFXOD5sL6ViIghNZ/PJuBCmexOD84dkWA3iIg/E+sObQQ7lvqIxmZ3dp/XX2Nh
 pjU4MtwEMh4uQZ7hkEb3bA8lLdoAWomTZdLX56rhZaMOgosX9LbwBagrNvZmq/uhxrMc
 rrySaPk/XbkxEXFfl/q5AfdxGG260QL3ICGghnUG1dLrmyeEQmvXMGQQbgvjsCpZ91HY
 JYJg==
X-Gm-Message-State: AOAM531GkgNnpjqOgsSm9uZ15KeQiWmOjuiuCuVENPwjhSFBOSv5y4eJ
 EL/ih3VYZtAA7mn1YJ1Uuc3fxDdnlqzOTQ==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr9331490wmb.5.1642691771507;
 Thu, 20 Jan 2022 07:16:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v5sm3984750wrx.114.2022.01.20.07.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:16:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/armv7m: Fix broken VMStateDescription
Date: Thu, 20 Jan 2022 15:16:09 +0000
Message-Id: <20220120151609.433555-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: qemu-stable@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27O732ZS1a++

In commit d5093d961585f02 we added a VMStateDescription to
the TYPE_ARMV7M object, to handle migration of its Clocks.
However a cut-and-paste error meant we used the wrong struct
name in the VMSTATE_CLOCK() macro arguments. The result was
that attempting a 'savevm' might result in an assertion
failure.

Cc: qemu-stable@nongnu.org
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
Fixes: d5093d961585f02
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It's a shame there's no way to type-check that the struct
name used in the VMSTATE macros is correct...
---
 hw/arm/armv7m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8d08db80be8..ceb76df3cd4 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -520,8 +520,8 @@ static const VMStateDescription vmstate_armv7m = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_CLOCK(refclk, SysTickState),
-        VMSTATE_CLOCK(cpuclk, SysTickState),
+        VMSTATE_CLOCK(refclk, ARMv7MState),
+        VMSTATE_CLOCK(cpuclk, ARMv7MState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.25.1

