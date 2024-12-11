Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4195944njb;
        Wed, 11 Dec 2024 08:41:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTy74D5AdAvBhBREmSx/G245NbD2YZnq5s4xqu1BhzSG5z1AbQnUePqd4o233VwywOzvdPM2e/1HPWiA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIRCpKWWKIxq6mIsAPksIdPRjl02XLJ6zUmuSFHpn7homrn6AlERIRtyuX1tkH1dGqHmv/
X-Received: by 2002:a05:6122:2a41:b0:518:7d3a:dd13 with SMTP id 71dfb90a1353d-518a5bca00emr2384977e0c.7.1733935272202;
        Wed, 11 Dec 2024 08:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935272; cv=none;
        d=google.com; s=arc-20240605;
        b=j9WtOHGNTuAhbAL33JyoCZi+yXMlkln+jgKMHXH+HuXJHCYRRfil4D+7efabGi25Ol
         lA4Y9V15GMXX48oayWPSLrk0alL93tjvhrG9++5E7UfuokcA7anLTcWtvY5B9BWdLjOu
         mX/FXCibed8jPr45/pFZe2fiQELJKXw4HRR5GzxijPI6N+QlE9xeQhMfz0++JXi/b4ek
         jDhTWGzCICvRxFJ2i+gqCRNwL9Jpul/ZSsNa7Rw+AxfmCFuA2QzJ+RhGbfZjhUoEeNus
         cLYJ7b+sg0MHiBjeUV3tPoS0EAT+cB8lbc2y7DWFbuoBe2Z7OWh1gijdo5P3l/cfp97J
         4AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fQWBBpBVBB2pYpCBMt9NLIFTJDB68D9O686ayP1ZAos=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=WhKkbhLExSZdkU3nQJ82bZch5Gv39RSKrEWlZ/KxKuJIgheT0RFPYyMnbgdKA5ADJP
         iltUngTBSTqUOl6UVpwbExf7kHseyA4j1obMLlc25cuKpGWBwVcUedRcqCL7MWmLE0c7
         VAQAl4aKxl4rKbmExVLzAEHBOJpSt3SUQ70tUwOSJSafR6E6vJNUzKpR/w7pDj15EKtE
         uPiKRp8Ab33QXelhpjHPcv/58wrEmfB/x9F4X9hRilHVzvmEmr+ECQk6xxNVsO3nK0OW
         if+JC6c9KodsudgVSo96ky2EK4b1YGqxYwtxtQveLauGg4Vk7/WBxayflaDtr3QeiOom
         bcgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pexgSGfo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5160fd0e692si2805997e0c.231.2024.12.11.08.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pexgSGfo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPcJ-0003KR-6H; Wed, 11 Dec 2024 11:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPc8-0002vG-PL
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:31:04 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPc6-00018J-Qh
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:31:04 -0500
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-46677ef6920so7770611cf.0
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934661; x=1734539461; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQWBBpBVBB2pYpCBMt9NLIFTJDB68D9O686ayP1ZAos=;
 b=pexgSGfoGiFGF4tK2G2wFw0awlMKoHqDQzu89k40sgyCyMQrmxbbqnCsm92DvJfaLF
 8dAAZXZP1NCJ72nCXCqsDLEnHstyJs6D/s8ZhKMxMq3UiecGA3l27b8UFngOQ044EhBn
 xvGKCzD754daGKmHdzDQRNCRWStgULNTgaWU8dqBy+7bDhbDwpSg9dWqJZv/8NNLpV+i
 allaU8u8igRZDVNhvRGfSfFevpz3W0VMKAblpMwqfMwACW4jC/sn1YEWhwYIwSM/yhAX
 cAQGlAe6Y+HAw0FfsSIjIGQ0vG9GNYxL3+BIYLGChgbSZkeo4DHlpLMUzF68x81gGsB+
 UQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934661; x=1734539461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQWBBpBVBB2pYpCBMt9NLIFTJDB68D9O686ayP1ZAos=;
 b=R2nfCpTVPp3YG/c+5yRowTvRVdPUng7Ty0qjgO35ADmpumKbogF1K/Vk6g4NCelwGZ
 ZQoRwItGgSgmeJSmbuNTsFABWLQo1OfnRvSuCKpdCiVvna22V9jq1vpMKPS7ISpDQKzj
 oFvjED+uCGJiEareujbhGk6ssPPwgHdiMmMsb65fgIrc2VprFDxSbS+X5Ni6FunPk7cp
 Pg31RuENpF3yV681Qscw41R7mofAoRFIKBWujtJDTXcH/5ZlXKdGvSkf0jbUpVCE+O+j
 dMWoZYT58R0HU0lNk7CMcvM/ZtXqSzHgVDSe56N/f96fGjsBtcNrLqPuxkdxSmM+9+wc
 yISQ==
X-Gm-Message-State: AOJu0Yx2eTcqk4dxcJOZzy40L1KR7IgUVCOpmWqrxumOQNhw/TkSljed
 FhkGILL8+0dDrLxxJEJ62nfQTro+fl+GAYCFU6ddlG8474i6SLg8D1hV339r5+TsT0VbhG0js44
 DgO7Yy2uC
X-Gm-Gg: ASbGnctn3qT2azTXUKB4rjy2aaxf/muqoVSoqiblN6KV+ivXymlAUuUhWrNq2urN1A7
 uj4VO3helUpieNlcNmILSF8JclE78wGhb0U5wfNGiVCzyxqBXv4e+0hvFo1IeUNuswthTFxGZVy
 HJRFFEn0+dM6N19gVT6RocExVhTmQTplvbDsBOGPhp84oSYCQSCAnAE94YmV6ZmuU5eKytbCrgy
 gc6HKDyNjpeCRm2Rl/16FNI67BtKQiMF4Tw9RltQOjeXlNP9Adbtbm4m1D1JA==
X-Received: by 2002:ac8:5ad4:0:b0:467:51d7:e13 with SMTP id
 d75a77b69052e-467894ef032mr57636161cf.9.1733934661380; 
 Wed, 11 Dec 2024 08:31:01 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/69] target/arm: Add section labels for "Data Processing
 (register)"
Date: Wed, 11 Dec 2024 10:29:28 -0600
Message-ID: <20241211163036.2297116-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +R5CVZeH9rv0

At the same time, use ### to separate 3rd-level sections.
We already use ### for 4.1.92 Data Processing (immediate),
but not the two following two third-level sections:
4.1.93 Branches, and 4.1.94 Loads and stores.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 331a8e180c..d28efb884d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -161,7 +161,7 @@ UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
 EXTR            1 00 100111 1 0 rm:5 imm:6 rn:5 rd:5     &extract sf=1
 EXTR            0 00 100111 0 0 rm:5 0 imm:5 rn:5 rd:5   &extract sf=0
 
-# Branches
+### Branches
 
 %imm26   0:s26 !function=times_4
 @branch         . ..... .......................... &i imm=%imm26
@@ -291,7 +291,7 @@ HLT             1101 0100 010 ................ 000 00 @i16
 # DCPS2         1101 0100 101 ................ 000 10 @i16
 # DCPS3         1101 0100 101 ................ 000 11 @i16
 
-# Loads and stores
+### Loads and stores
 
 &stxr           rn rt rt2 rs sz lasr
 &stlr           rn rt sz lasr
@@ -649,6 +649,21 @@ CPYP            00 011 1 01000 ..... .... 01 ..... ..... @cpy
 CPYM            00 011 1 01010 ..... .... 01 ..... ..... @cpy
 CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 
+### Data Processing (register)
+
+# Data Processing (2-source)
+# Data Processing (1-source)
+# Logical (shifted reg)
+# Add/subtract (shifted reg)
+# Add/subtract (extended reg)
+# Add/subtract (carry)
+# Rotate right into flags
+# Evaluate into flags
+# Conditional compare (regster)
+# Conditional compare (immediate)
+# Conditional select
+# Data Processing (3-source)
+
 ### Cryptographic AES
 
 AESE            01001110 00 10100 00100 10 ..... .....  @r2r_q1e0
-- 
2.43.0

