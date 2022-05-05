Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1307031lfj;
        Thu, 5 May 2022 12:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymbuFCcpTs3Ss1bBXagS+DjM+U1WjxJA/VCnmz8YdqmSVJObUkrAMPTUGAm2WRi8G40HJf
X-Received: by 2002:a37:9204:0:b0:69b:f7ea:4638 with SMTP id u4-20020a379204000000b0069bf7ea4638mr21305163qkd.77.1651778949062;
        Thu, 05 May 2022 12:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778949; cv=none;
        d=google.com; s=arc-20160816;
        b=nPiXAK/Fcbvoq2hAgMqZln1GtOtmhav7ZmHdp+s+1eJ3xMc+yZoG4//e47wehxG+oZ
         OjS9ktV0pO+di9SYrUBCcxwqlV3NHxjJsnp/kjMDtOp7wmre7Zw8Th1KBHb7vwnythE8
         APjmTCisH0ic0uA0SWulwvrR7+qa8B6MDGefsHM8+h85yPGea89VAKguNq4z1HkCU3bO
         aHYlmW4a5RvuILBn4IsS3sn3KulMr7G5ngMt+6Ze3m89uE7JxOZ7eM76EAGMjd1dboDJ
         owQkahw8UnjiNAd4HNZjUujJVD4JGHIDndeRNG6fkdIzl33zLXCfqTNx+AsFnmwtAzJF
         f6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
        b=hWEgoQvR5ozoGpEUyLotfTvr5AXYFX2d7NvxpdmorGEO7XhZTMScUugz7IEL5WYxsS
         MASR6djdFOaiNAikUaaFIjjYcmLw59a+cp/2U8zGkgQTaMaMx/ELw1E5jhsiJVmUQ+4h
         aNoulK/sK92F0X8ioJWLlYGf7yZ3vv70/uomAADSWmlxVSKM92EJMB/x3slkaWrrNJ2t
         T92fyYmdHCDYgAYMqgbGNLzrzSrsmm6bh5tGy0DpsaAlo4NT5EtmduN5MORMC5dtWemN
         znM1hbuRC28ftHjBf2/PWCzVUgTTUt/Lio5zdQ+DJtl/z3TFNrDRXHhPvcYO3ADadk26
         Gv7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wlmt+Svn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020a05620a409200b0069fc79d86b8si1447485qko.46.2022.05.05.12.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wlmt+Svn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmh9w-0001cf-Ij
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYf-00035C-Fu
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:37 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:40518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYc-0004O5-5l
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:36 -0400
Received: by mail-oi1-x22d.google.com with SMTP id y63so5254914oia.7
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=wlmt+Svnq8jPhiyQRsqbd/tMWpAxLdCmQXH1j0TLzSQ9vIv4uUhQ8vBx818C8k4ejw
 nYV/kBdUyXGDTbdE8qqNGNNjXlXVuuPk8HM86p615JwnagIV8uw+gncTtAT2rOOzkIDu
 JQsooZmlz0s6fIB1ojSB4m64qsnvV/EsyFvNSRc06nlQtXhO9ueTnYkKdBbNXMqFkCDG
 IUWV5xOzFLxyzoZzPhgrfUqBS+rmvSpWiu19okKDp95QG1Bc907J1MWU6MNSwTcz5HtA
 VLqE05hZAh9RD7waqOE/YyEcmANFRCbrhbtmyWUeL3Vlv8VA+SOyhTOsVY7hb1h/CxZB
 WAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7uvCKLLLjt6QC4udYfjSRWYfdLyPP29aktinhFaEDs=;
 b=othL8yZNHvQMNSdZZsh6riWMOo5Uwb1cdS/oyBvOWbbsmHqioV/LfvF5rtWQbl5bSA
 x7fnpMkO64bQX2cJEEShmRPZSezAzQIId55fqjeGR0/tYuLzWhCy+TFMWG8G4+ndVd2l
 PBQYj+ay6H9wrN051BOSjj5fQdFMgVKA8FKHiMWLmKm33HwEpYfSbJje7lzNK50p+N4T
 wzqZv/KrWqreiVRcgg0x+wPoHtoEQopuF6z+MvrwMJOOEslRfF3FIscJP+i2IQTt8Es9
 Mt6kKf47lmym7enXxFhphLQRWjp3pLuazB9t4LxpbnouTa7UMPB0/ypUBEIpIYmdzeU3
 CfUg==
X-Gm-Message-State: AOAM5320HNPGsl9s75K8TYhOwCniIQ9T2Jhgtax4tjate2wVctk412Jz
 ShzPCgFyMIRbS6IrZcKjDnJfFqGSkOFDNxnO
X-Received: by 2002:a05:6808:1889:b0:326:7464:2858 with SMTP id
 bi9-20020a056808188900b0032674642858mr2208458oib.159.1651776633465; 
 Thu, 05 May 2022 11:50:33 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 17/24] target/arm: Enable FEAT_RAS for -cpu max
Date: Thu,  5 May 2022 13:49:59 -0500
Message-Id: <20220505185006.200555-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vam4/LNJMR55

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0acac6347c..8110408000 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -42,6 +42,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 88d3cef93e..35881c74b2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -744,6 +744,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 337598e949..c5cf7efe95 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -69,6 +69,7 @@ void aa32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.34.1

