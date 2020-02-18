Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6437085lfp;
        Tue, 18 Feb 2020 11:11:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7i9Ef0j/XQd1smLGQoibVgtzwsINt6qKDRwqMRVFvqWDR1Ukff4r4kaiyc5V/a6Cmi1kR
X-Received: by 2002:ac8:835:: with SMTP id u50mr18749227qth.15.1582053083528;
        Tue, 18 Feb 2020 11:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582053083; cv=none;
        d=google.com; s=arc-20160816;
        b=Tisxo0Bj0s2e7HmniOJaMjaYDb1jom1eWuKCIscN/CImSQ6zRIvZfWooXmpIIaUA7G
         XXY3bhYmEBbytEqnm7HESyfOt9B0HuhF/OZPCiPXYq62exMBaXP49q8Oe+WyGvOReBdS
         Piqms2mJv0QyskdoSBE+q6nnPtoq+kXFsqoZRQlhAqPDP9FPNmrxCk8Y9XvXijFz0JbR
         gO3QBfAVCL8TaHbZCmKjC2/ILGohBol2LFYK44+mGKXq9OBvAeP7U/qbqsqULuhmoXoV
         hzYyjBxhMMgZXdTpPJX3Mhaf5w6M0UcZQ/pV4vYSucxoP0rkbL/y4fMbwVknJMe5+9Rf
         diRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/9wXoDEsxSRqmYUkdBOvS37ZtLP9FiINAczvKHAmVVI=;
        b=T5xxaxuoJ+nkNeSt+9OObjSnDQKRRvs8H06SBPcTCL2db7MgKWEYg4KXJbaRscEylu
         N5iHaR5LAGdGvlzjXGNZ0lkrh0Qc0LaHkkZEKb2/2PXBXTa6IjZGNGixwhKkEFCAt8tU
         OfK8l8leZMc6g4IAqbEun6uRsHHqt4OdZe1LEDAXQlRk+cthg0B6FcOLKOg+cZWXgpK3
         ZGvkdwPqOPp3Sg4eYwN8Li1jcfTXuNholaQB4ille/Lklp1PEmaf53lZFdZCW88Awjka
         8+ScBR66RHzCNlRYBxtKX2lNXk361XxrTrTPCS3tAxiJAuEJJXIddGXEJrCfghQwfYex
         vs9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEHSaFma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si2169430qtg.24.2020.02.18.11.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 11:11:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEHSaFma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j48HC-0005xG-Tk
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 14:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fw-0004rO-GK
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j48Fv-0001ju-KO
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:04 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40147)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j48Fv-0001iJ-EU
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 14:10:03 -0500
Received: by mail-pf1-x442.google.com with SMTP id b185so792490pfb.7
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9wXoDEsxSRqmYUkdBOvS37ZtLP9FiINAczvKHAmVVI=;
 b=aEHSaFmaqt9CFosgT/kRgfwaWvMLlgf5q66LGeQpwPZ5HnyvrtsdP4PSUY/eK+UwRW
 P+JG2oHhdfvb2Gmcrr1BjAMmtV8STZL9o3ulG10eNKdXLq1DYg8Vklo2chMa0bGln01Z
 07oT1VwpjM76KnjAy9OODZ8XpoBg2VzICDjTjVp3hzh7But+dFfk1ex/5SLhrwtSOL58
 UsSWjkJnMMJB7yVmbRPP9OV/dMwbTspDbcfh1HBbo6yBEgttNDktUdqyuPgHdG9nzZLi
 SYuxaf/Zd96gCUeB45PeX/pBHwtDYpjdwGLpeE3eijJfEosEbx0AvuHztjX45A2l6Bwd
 G75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9wXoDEsxSRqmYUkdBOvS37ZtLP9FiINAczvKHAmVVI=;
 b=cT1aL/ekYN+SCzQYnRwBHZ29rVCALQr5q0klYHNef4cDJpyQNMw2KFMA/aGpbKJ07g
 6nIgl3vzuy6pks1exUlxaQJhavgeC+7CNnQk9TiNJqxNtCOOxIRfdRABY1f3ECFGCoHs
 xuA2BrIuTYjbeV5JZLfa3i+FH4UCP9znc08hMeR/2M5btXZFvBugslYBcm0jhHcX48Aj
 Q9VCFex6eWAILH/lNL4t9jlZ8PAi14MbQuzoKgH8CN18celqBwbvG6yFgfu0XXyQS3r1
 fiMc7kHobNa3Ytc7hMn/Sry9yn4SFjolsTkUEZ8pdXP7wyWPZ2qIgebfMVU6hL170Rzr
 eR3Q==
X-Gm-Message-State: APjAAAWb0iOFsjpLilVFWEPMkAHQx1sQLaR+BeHqTwFk2q3yf5fHnNPu
 ilYW8PNoKlAW/JBIZqMsB4VN8Q==
X-Received: by 2002:a62:6409:: with SMTP id y9mr22994459pfb.30.1582053002266; 
 Tue, 18 Feb 2020 11:10:02 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id i68sm5139399pfe.173.2020.02.18.11.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:10:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] target/arm: Set ID_MMFR4.HPDS for aarch64_max_initfn
Date: Tue, 18 Feb 2020 11:09:52 -0800
Message-Id: <20200218190958.745-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200218190958.745-1-richard.henderson@linaro.org>
References: <20200218190958.745-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-TUID: Gch20IL4gRz8

We had set this for aarch32-only in arm_max_initfn, but
failed to set the same bit for aarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 32cf8ee98b..32c3e24a3d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -704,6 +704,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->isar.id_mmfr3 = u;
 
         u = cpu->isar.id_mmfr4;
+        u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
         u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 implemented */
         cpu->isar.id_mmfr4 = u;
 
-- 
2.20.1

