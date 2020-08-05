Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp984933lfy;
        Wed, 5 Aug 2020 14:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG3aG907DAmISKimi3rXxSmbQI9D1D1N5YPy2KskgpyyO6zZmGF8GMEv6jYgBTpcDj8Bpy
X-Received: by 2002:a25:7b44:: with SMTP id w65mr7853181ybc.243.1596661786782;
        Wed, 05 Aug 2020 14:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596661786; cv=none;
        d=google.com; s=arc-20160816;
        b=nqqYwfUzFo7hDkpJQe/7d7ENOGzA38TxiLrn+J+n2doA4VARItuOY2RH+wQgauJsqN
         nxvrH5z9MAfPUkew2X5BV1iqs0ZSEXbIEb99MIfvrgnox3ClV/ckhv4n8oGvR/f4HgVW
         G+37uxWA6AZvT8djgbkHxQ6M8sapm6Wvga755N8cQ4ri6a/pbij7yKxdTQBRdjX+pCdy
         T1fGvTscI9Muu+R/BA91qvmtzTKLUCO6cZX7Ze0+HocfIOnU5xBJ9LfG2vRRV9lUtETa
         rFpXDPkkrMrJaR0uXgw0NV0UbCFEpD2eqD/paBLw9AVcKLVPZNcqIXRUDskf9javFbkG
         AhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZETMc4CfZhy2eJWBeDKW9CaWM4uEKiDWd22Cf9UUe+4=;
        b=q/Mk13pfLOBjFCx4MsN+RD8AY3uGLrrSD/ATmMJp6vTz6tsOgqRBK520TWU51oFhNO
         XxXpphfFvPXMLZ/VHWQB7KFQz3JoBqB8P80V2lCOgRLVPXVMWJom7subkqNo3j+c4faD
         J25RY8G6iHge3IlAdSiTjmcy7Lvdq7P5tiq+wskma2W4zw1j0/pXTIbNcEzCz3IioiDR
         k5MeFkvHAaIDeJbdZw7x9XyrwDmK9H6x/7VE4UflPnTJNFqojYUi5k5cblylYp9zgjTh
         znga8S9kCB9roOAo7blT2TfCcjzl3/MM6aLr39S/UWyqL+LfWXJMurNJ46AJPs2cTu3i
         xxww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WXC0RE0Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i32si1947914ybj.125.2020.08.05.14.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 14:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WXC0RE0Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3QfS-0005M3-7K
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 17:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Qec-0004sq-AG
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 17:08:54 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Qea-0000SZ-GN
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 17:08:53 -0400
Received: by mail-wm1-x343.google.com with SMTP id f18so5178420wmc.0
 for <qemu-devel@nongnu.org>; Wed, 05 Aug 2020 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZETMc4CfZhy2eJWBeDKW9CaWM4uEKiDWd22Cf9UUe+4=;
 b=WXC0RE0YjMx6zRsnBzS9LBHXC7DJcAIEdnwb0hA1iRPg6/rV1pDorzahdjWVe5l7C2
 mazAf57PKjS69G0oMbc6HYMypaQKCi+bxlD1TIpNEvdT6gGVuOhX45LNBa3EiXL6KNkr
 yadocEyAmvcTUFRK6RVRuKAAV2Lzr1EdkSyEAFpCi/Lahfp1RoAxqbTPGNcpMUyndJiW
 715B4OYRN1na4LQWN2Rj09+xLcRYId+zJQoZiwtwEouOP0eKYRs9Q1NLn5OiNtHl/gPM
 SCRlgY7qQ0kCuEPe4orJ+VV0XfiEs5W7P362kuTHZGrqPdiXB0g8wo+KUPMQD6/QLHR3
 2opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZETMc4CfZhy2eJWBeDKW9CaWM4uEKiDWd22Cf9UUe+4=;
 b=mjfJgPgpvfnTR3zAhJPqo53duEr+E7smOJEYtjITtoJONJPYLaXwP7EixAUFdCX88/
 eYicECwJI3mW6R2LLMBfnLG1fVJ6q4ChtIoqwDaBD599fNpur6cqgT38orUtDAd2pSZ5
 g4Mz7qa8Sl9KChNb0VK/+/PWNN6gE48diDhACghuZYdfdKtwg4m0bikdBfaBRec0djLY
 XkCNWd5J+te7+dz0z46KpXzDThwR6ykfoMrPaDwCF6uehScBqgpYbUveqVgmvra2yShr
 gxY3Md+RgCP0X8NWAK8M/dI65JvnVb75aANqvQ0UAfXsBeiMIKSdi9zuh6zHtMpR8abW
 4Szw==
X-Gm-Message-State: AOAM533YjOBAheIugW0byAb3x9IHDxMG7zy42CFzkjzywPZjsJoMzfL/
 kSJ2PXVcxNnyrE8LeEKPVyzb5w==
X-Received: by 2002:a7b:c1c3:: with SMTP id a3mr5047842wmj.111.1596661730143; 
 Wed, 05 Aug 2020 14:08:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y142sm4398690wmd.3.2020.08.05.14.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 14:08:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Delete unused ARM_FEATURE_CRC
Date: Wed,  5 Aug 2020 22:08:48 +0100
Message-Id: <20200805210848.6688-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sT9lbFuWIRN6

In commit 962fcbf2efe57231a9f5df we converted the uses of the
ARM_FEATURE_CRC bit to use the aa32_crc32 isar_feature test
instead. However we forgot to remove the now-unused definition
of the feature name in the enum. Delete it now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9e8ed423ea1..9d2845c1797 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1950,7 +1950,6 @@ enum arm_features {
     ARM_FEATURE_V8,
     ARM_FEATURE_AARCH64, /* supports 64 bit mode */
     ARM_FEATURE_CBAR, /* has cp15 CBAR */
-    ARM_FEATURE_CRC, /* ARMv8 CRC instructions */
     ARM_FEATURE_CBAR_RO, /* has cp15 CBAR and it is read-only */
     ARM_FEATURE_EL2, /* has EL2 Virtualization support */
     ARM_FEATURE_EL3, /* has EL3 Secure monitor support */
-- 
2.20.1

