Received: by 10.28.91.67 with SMTP id p64csp993877wmb;
        Wed, 28 Feb 2018 11:43:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELtPwxjAp6zlbgR/ZsTYure+J5dMofJWVVlF1Hbe5FQnhAOtMleSoHTjDEaSopedEDZh1Q4U
X-Received: by 2002:a25:f607:: with SMTP id t7-v6mr13086273ybd.124.1519846995029;
        Wed, 28 Feb 2018 11:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846995; cv=none;
        d=google.com; s=arc-20160816;
        b=CnsrGbERu1y8saTMwWdwEYoWqyVnRUejCwG4RImsGOlRU3UThW9osmJpILQYO1/4iR
         Vz6j5PNaBUBdVwZevI8fss7LZfzpa/oXeUF27ZYdCxH6HJO+IMHjpVKASO2ksJ2n18Me
         JSuTVp1eCjvlc6AEgn24d9PBDAvgpf6AtxpJRzbwqwnIiUrjmxEZe0qvQwjEr1TQkpJP
         MIZqbp4WeT/khoSjX3N0K31jzZ0kM9VMeicDp4kqpfjP9gR970tQEGoqVmv0EFWKIVOv
         ik5Rp2+eQuAppjpmsba9kZxIIGZ4LnMdHe/n/7NJHFVm9eBCDp59e8+r4/vt2wW1njGx
         uQMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jJ6CE3xc0WzrR9rdC8JrfrZyPps0vJLzi6MVauEfbYg=;
        b=eHwBWR4kTMqUGnuDmOi1p0FBSBPhriZ+Dc7T6U2iFUUVpo9acvJEjARVatGeyj9V5/
         0c/wVFvxp+Ru2uTsO03833yjdQRN7Aljy/bnysc3zEmdPvffiDonCK4RoGWkmHiU1diz
         o6gjj7/NVGIy6Y8NL8hUUHL9JKoAROWW41pFEeBWMg8Bi8lmFxjIzDlxC/N8XsxyqSec
         SoP2es78pRB8HLvvpm3u55CWDPTU1NljPKUFSmkLoSwRAzl5T4Uj7s1oJd3uTksx3AMF
         rUim4xdCqsHiZjxw6oTAjwfQQJN2OQkKPG/hpgiNwKlQqvXyiiMfG1ANWdABCXZo3Aoh
         djxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KIh/WMeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si374695ywg.749.2018.02.28.11.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KIh/WMeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7dC-0004pZ-FN
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:43:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7SD-0003aA-1i
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7SC-0006WI-7P
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:53 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:40113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7SC-0006VT-1u
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:52 -0500
Received: by mail-pf0-x243.google.com with SMTP id m5so1412708pff.7
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jJ6CE3xc0WzrR9rdC8JrfrZyPps0vJLzi6MVauEfbYg=;
	b=KIh/WMeUsMvKX9I7miKyu9iYx1W8hgYMyM/UlGnA8bFSUD8ctsllPrWPuNHps/1pCc
	cHOzovy0slKFBuhKvT5wIIsK294PhJatQNsjFCkPNgMNEykObrDut8M3LMwQCtktAhjn
	A/2KqWx8+Vh885okg+PHDPhPsbEgGi35KGLgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jJ6CE3xc0WzrR9rdC8JrfrZyPps0vJLzi6MVauEfbYg=;
	b=hVCdXQkHAYQL2AZGdYP4ZZ4LD363ng2J8iLojuLli6xNqqmrzC3dV/3nKowhPXlF9I
	5kVlSK7v0Q0hVLLH1lGA5wiVP4h13rxRoYLSok5QL38oxPI7F+7eir7QP3eq8l/WoXCb
	LWHE58OKCNumEX4ALDYRh3v5V19D8zUPZFmUZj6zXIw9Rz4iIvIJp3uVQyUH2Kp51par
	sF8SMXQPooYFIkJnQ1GVA698NXIEDsNUpV/XDwibT1cSlVcmv3yOy0mCdtoI9/xftx/h
	YZc3cDH8Tqf1MPhnCI3kUrv65EY+MjqgNW8TlG87OJWNTk/oaxHISNGpENijymfHpfm+
	JoiA==
X-Gm-Message-State: APf1xPDAm18mXT7uTpnEUkvZRSHKmmWZNbZzl+6KBbNYSRxlPYMlQ4Bw
	H33qWRDNNtUTf+yYXujWGy5rXw==
X-Received: by 10.98.223.143 with SMTP id d15mr18863422pfl.208.1519846311113; 
	Wed, 28 Feb 2018 11:31:51 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:25 -0800
Message-Id: <20180228193125.20577-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 16/16] target/arm: Enable ARM_FEATURE_V8_FCMA
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VLfkgo6L0EP+

Enable it for the "any" CPU used by *-linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 1 +
 target/arm/cpu64.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ca5fb1162a..452bc32f10 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1651,6 +1651,7 @@ static void arm_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
+    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
     cpu->midr = 0xffffffff;
 }
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7246866e7d..4228713b19 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -232,6 +232,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
     set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 }
-- 
2.14.3

