Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1089674lfg;
        Mon, 24 Feb 2020 19:12:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/obQZuZdKYT0lzk5vf3NjQBCxcX3zW1wixI/f1I86gLEGk+/WFBjKYvsOu0zqcFemp1WB
X-Received: by 2002:a37:aa4a:: with SMTP id t71mr11060543qke.220.1582600356077;
        Mon, 24 Feb 2020 19:12:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600356; cv=none;
        d=google.com; s=arc-20160816;
        b=bba6oezPeovN44CpEMtcHjyh0uCUlVdWYtnxyA6F1kiA862Y4ISM2NZjCUmqYloj5t
         1Ai6oj9WUgIzrU+aKHQAMRKaoeNd58hvuBR1KUODf6Ccdcvf6P2MJiV79zv/uJ7olZNW
         XneXd17Qrety/M5j++UbYQIb/Xh1pHMUuVi7uogNRxDEgW1JoTUb7uHKs6JTkHhr+p2R
         mQVSEBIIK8V2OeB4/t5eRnAQY3ulgrXuPnQYXFXaxooqhwlqoShtPg21Yh8REdp0UCpg
         opL3j/CLr/k5TjIguC4rIBR7XKiJiAnLesP8s714lbIDhsGYvS3R7futUq5WQdM6neve
         yEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d8Ly0VNJpFv/+M9S/VrUvn0S3jXRNy+PHg7sk7apA00=;
        b=pCpg39CP1Z9oIqxT8znu6MGBawd6Xd5k3lsA/ERGZXtmUO/KXa90noZkcDz2uXnN0N
         YHFJYtxQ0mAAMjQUBXKRcux2xGajqTP+S/801/S9QHSMCLlTguqFQn2FFjZSymGl2cvJ
         8JH9l6DLmtny3DpCmvQCqz0aGJUwFVKD9IQFZYGkcgup5lEgq1L+4DksHMKV25KpHZDE
         T971Hudatoipe0PzGzF6Fr+TpKVB5krRhGbCUas7Cqg8YNH2plcOrMcaSnvO3uSxf/y8
         D/o1QzKng2k6MEUDbgguir7lRuAF2H+Zdszrzge6GGTceWJrajoKt1h7Udg3gVICOCKk
         DzvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rd9NMi9o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w190si7298838qkb.100.2020.02.24.19.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rd9NMi9o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6QeB-0000tG-G3
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qe4-0000ss-GX
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:12:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qe3-0004ip-FZ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:12:28 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37465)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qe3-0004if-AA
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:12:27 -0500
Received: by mail-pf1-x443.google.com with SMTP id p14so6417116pfn.4
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d8Ly0VNJpFv/+M9S/VrUvn0S3jXRNy+PHg7sk7apA00=;
 b=Rd9NMi9oUWRVQxlAOTEgLYHme8Hu6L3UN6UD2TjY62tP8sDkMTTBGIw9OiaU6MLqhZ
 xYR4+BZvYxQohUThPJsPrkHw8IfpQUybJJOIdIJhqNaFRzzLB9PWdHZk1cjDRwIdzNps
 0bc6xjHoPgtAbhJfKZNwDbIqXgavmOlDF4syKarQ153gEp9yjyPVhXQAHy+HB9l1v+4G
 YX8KZthxfwC+C85lgtK7f0JBcNxKmmG5ysp6PU0PNBWlLC6MI7TKUD8FCrnY8JU6l/2k
 ZtSR7fbJkvV/jqgLtUi2d+9pUuf3UPlfrfmTzpMbBWCNWD/AKxWD5QRpc2hKXSVHXTxI
 jXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d8Ly0VNJpFv/+M9S/VrUvn0S3jXRNy+PHg7sk7apA00=;
 b=TxL2YugIfdqbjuJbVEipfshfrIgHEq5w/qtRIKhl7TovVeoW2gOoaZ7koXrgSHA3ae
 72IHdMKuUSqvl+K5A9ObRYOn6bCjw19cWlc9ZgMyKe4NWVjJ6MbPUgzjUj9xDqiOmaO4
 fD0jmg33bU2IytvjC4bqltPqMhikEwXtsTOOezXkSHU5u7Fuglo9N6sRd34++5zx01uC
 O5y5rfWW23wOfVVPn0M4yA36ecqAe7CQC0vpj6FXrMw0IuERVIlcIU7u1yK9GKoMALnV
 jIJBb74DqeTRx9J9ABdQXWWYr21ko+o9hFB53yNj2xMUlu4SWy6ebA/1pGVVChFyIBsK
 rfgA==
X-Gm-Message-State: APjAAAU3w0P+2iqB4pwmqn5nEJmyPtYt9h7QgG1iIp09qMZ1DG1fnMSz
 UYPNpEEiH3xAhXRMR2JiYUkQjLzftrg=
X-Received: by 2002:a63:d18:: with SMTP id c24mr56127799pgl.218.1582600346167; 
 Mon, 24 Feb 2020 19:12:26 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id gc1sm884747pjb.20.2020.02.24.19.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:12:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/arm: Replicate TBI/TBID bits for single range
 regimes
Date: Mon, 24 Feb 2020 19:12:11 -0800
Message-Id: <20200225031222.15434-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031222.15434-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kZUG4y/hl+Xj

Replicate the single TBI bit from TCR_EL2 and TCR_EL3 so that
we can unconditionally use pointer bit 55 to index into our
composite TBI1:TBI0 field.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 79db169e04..c1dae83700 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10297,7 +10297,8 @@ static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
     } else if (mmu_idx == ARMMMUIdx_Stage2) {
         return 0; /* VTCR_EL2 */
     } else {
-        return extract32(tcr, 20, 1);
+        /* Replicate the single TBI bit so we always have 2 bits.  */
+        return extract32(tcr, 20, 1) * 3;
     }
 }
 
@@ -10308,7 +10309,8 @@ static int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
     } else if (mmu_idx == ARMMMUIdx_Stage2) {
         return 0; /* VTCR_EL2 */
     } else {
-        return extract32(tcr, 29, 1);
+        /* Replicate the single TBID bit so we always have 2 bits.  */
+        return extract32(tcr, 29, 1) * 3;
     }
 }
 
-- 
2.20.1

