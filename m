Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp427078wrp;
        Mon, 11 Feb 2019 23:36:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYw3pNdrNJA2rYsXJ3w+5JAr78JqYos2VAa8TZPAT4qnvBe4E85lf08BtL2hysh7sTHXLpd
X-Received: by 2002:a25:dd2:: with SMTP id 201mr1782035ybn.399.1549957010341;
        Mon, 11 Feb 2019 23:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549957010; cv=none;
        d=google.com; s=arc-20160816;
        b=BdPtaQ2q2UP7wABHCzcq5G1lDLJUpGZBIfKeKr0KcFwLT7HMLs1Q0n8yqeanLA8lJc
         0EdArbtHSNppNezeoomiQqoHRwALexGAVLuVw5ECeq7eBLxRusyzy63+MK3u+iI8n8X1
         jo4f9HpfVPJo5+UjxGTKji4zJ8IdUA0AViLaQEgfm7P6rNREMg2Pu1aE4bZ8iQrRg1QJ
         Calk1v/HKHxJ+TkIqa0u6xneg4iPm6J1T3CkHH9v84we3MnbRI6YqTnnMoUqKQ/8PeR8
         Z58pZrx4YbBgnOHrOsv9cB2WH/IyXrXP8DFJ2I7fm5RnVqPY3YR6Zvu5oZthsXtnj9cY
         I7zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=A7FVe37+4EEKy3dze1bujYPlELqLCG2EDLZl1vW2TcA=;
        b=WLKYaLN8qbGUfm3k2GxRkMjsKS9iO8gTK4voy7LaDFCSS8q6wakLZuToed71htD9DP
         7A8V3bOnd0UlReWXh2n2c+qQ4NBHkItQSD7pc/rKmntrdK0ItnSnhQrpsapk1V5vxaPZ
         IGUakTjUWym5hIv1ptOxPKT5C6h7am1gRKQIpsr4dec1WPU2spuRKFb3skqDCp+N75G4
         LRuOLOHIPj8Fne3D99Zf2cOUHfcao2isMFUZLid2/9pGitiv+3zfuJk7V067ePJltDaA
         9buXnm6VVdWNTH0TcT5sHVTCcPJ0VHiWmy20xQt8cY1FURpnKUmmKXtiZ0sqnlLyh31U
         732g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l4mEV8Qu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16si7409243ybk.427.2019.02.11.23.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 23:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l4mEV8Qu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtScb-0002aU-Rt
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 02:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtScS-0002Z0-70
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtScO-0002Tn-9j
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:36:37 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtScM-0002Nm-QZ
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:36:35 -0500
Received: by mail-pl1-x644.google.com with SMTP id r14so874770pls.12
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=A7FVe37+4EEKy3dze1bujYPlELqLCG2EDLZl1vW2TcA=;
	b=l4mEV8Qu3tredS83Ne2lYcw25ASqKl2XCXFqsKtchS4/1sJGSctvu4rRbUh2FC9bbb
	jHv6JoMu6wi7ydqTFynEpEOp2lhu8t+p+gLX4yExsDF1S7E2JENcfjq5WdtQC+e1nTkb
	64Gv4eS6PaaHFjRWImoT2qJvkr2QB4jU7c8P9AeTcYFYs29E0H2nmkqd7XyQINgKsk6q
	bPqGhiW52lDvczNBdq0iHG1gTdLmFjiCmFUSNyOw2lCm/YluO4t7yesSw4DcSnPt+bD5
	bOuwwQS7nlQhAuiWwrtFu4K5EScLCR1yAHGUhmUlTmHK+OVNWZMUXorbG/XLfSwFAeRG
	G06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A7FVe37+4EEKy3dze1bujYPlELqLCG2EDLZl1vW2TcA=;
	b=KL3+RKavagkl+eKL644Hy991+rcsuQR2ZAJLnaSnPDc+jjHboWXHpCqMIjSTEz26b7
	ivHnsig73tj6kvV/GQFE7FpW6lf1mUh7RGWHRC0wZqdRR3RAAQT3HbenfFDKpr48lpkA
	UsoQAxOQ5JYGvkKBSx6AjpawWFEzuOn01673uZ4GZV2s/6HnOJt/M3fDx6VBJYE2QFfR
	PAKXUtrjCcMKtZAAyuaX5Y4eo62KXf7oTWr4X03mhAwHtJvQIp1xdzpzTJIAWRzEu1jP
	zhzZWFUIaE4+fVvmkrnKFpkOUJyTGg7LxJ71C32uaZJhPONyC7L2PlxnnREOFB0+IGGk
	ehSw==
X-Gm-Message-State: AHQUAuaxZxJudz4tUOdzlSPAPlvD8v6DUU41to2n545Y8zqhyTNxpKRm
	aVysQpu6C2taUtJgbCgigPAKRQ==
X-Received: by 2002:a17:902:449:: with SMTP id
	67mr2655517ple.310.1549956990039; 
	Mon, 11 Feb 2019 23:36:30 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	s190sm24703304pfb.103.2019.02.11.23.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 23:36:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 23:36:28 -0800
Message-Id: <20190212073628.9665-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH] linux-user: Add AT_PLATFORM for arm
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
Cc: 1813034@bugs.launchpad.net, qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpWz+e/Fs3EM

Fixes: https://bugs.launchpad.net/bugs/1813034
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 775a36ccdd..dde640a2ea 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -500,6 +500,35 @@ static uint32_t get_elf_hwcap2(void)
 #undef GET_FEATURE
 #undef GET_FEATURE_ID
 
+#define ELF_PLATFORM get_elf_platform()
+
+static const char *get_elf_platform(void)
+{
+    CPUARMState *env = thread_cpu->env_ptr;
+
+#ifdef TARGET_WORDS_BIGENDIAN
+# define END  "b"
+#else
+# define END  "l"
+#endif
+
+    if (arm_feature(env, ARM_FEATURE_V7)) {
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            return "v7m" END;
+        } else {
+            return "v7" END;
+        }
+    } else if (arm_feature(env, ARM_FEATURE_V6)) {
+        return "v6" END;
+    } else if (arm_feature(env, ARM_FEATURE_V5)) {
+        return "v5" END;
+    } else {
+        return "v4" END;
+    }
+
+#undef END
+}
+
 #else
 /* 64 bit ARM definitions */
 #define ELF_START_MMAP 0x80000000
-- 
2.17.2

