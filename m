Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp854915lfq;
        Sat, 9 Apr 2022 22:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4ocXdTh9sLuOZAFZb5CYuKBKMR32f/iyIzzAK0nzxIn5mQDCLdXwt2OkuvXt2qTSDo8Ky
X-Received: by 2002:ae9:ef8a:0:b0:69c:1015:3383 with SMTP id d132-20020ae9ef8a000000b0069c10153383mr1118448qkg.492.1649570300135;
        Sat, 09 Apr 2022 22:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649570300; cv=none;
        d=google.com; s=arc-20160816;
        b=SQZrKFjn+6RANt2S/mad/l0tSH8E1DIvOsP4l0x1JUP8Pju7zcY0o20qP3WnvfVKHP
         O1fwLyEn2V8BovzjOxAa6O9ZNd1/OzfMr6EXzPttp+8avs8fLmO3pkYDmbCx31HHbOro
         VnPII7wJE8jJlvfbNsq/RjM/v0tgkPvV82FfNy/kYwYiWpTORdjSyNF48py2pdGJYMun
         6YLfmxC0Iuuwk1+cmfXIHBYoBhUEMNz/v4Erp7xOdmWgu7FVTf9MDCoJcNl5krq1ryHx
         Av5BXqPVdeBJ3maBXUsqe+FWEhL9MpQAnMqnmKqgibd+rUJsXDg7EjK2BMLCVnnWiLJB
         dyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hRUTijrX/dWDGgF7d1LOxJ77lZwiKODTAAz7SOC7SIQ=;
        b=uk+hu9fs6MSi49egAWS2JTd75Gj77ARj0tfxar3aq0d+CEha3tsrXjvg59EiMtPsQ1
         Ud00AtxP32OYlvOMrUdqfq55szWWgtWxbGG2rNbua8YxiiojgZZbowzMlx6wjCMNRw0N
         mAfYVHmF9spxycJ6iTucHP1joot/A0265eRCk/ztp3s7eJqLFna+4SmZEMk0AdZTJGn2
         rstEei4weaLrgREUpNS2Zsl3GLoZENbGu27f9MSyjGRS0D851ymsKoeyCytY3paiH2Ov
         8RRoE8nkb7woaXyXyJElOuxYAxCVz76FmS5ZWNcn09v0NYn3M9oRJmJZj3kLcJOtF3Hd
         z1mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bnU455ss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020ac81e0a000000b002e1fbf3c0eesi3201871qtl.735.2022.04.09.22.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 22:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bnU455ss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndQaZ-00021E-K9
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 01:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZo-0001x1-7H
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZl-0002z2-ST
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a42so5373736pfx.7
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 22:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRUTijrX/dWDGgF7d1LOxJ77lZwiKODTAAz7SOC7SIQ=;
 b=bnU455ssQErSvA0G+tCdBo+iKZ6v9JPpgG+JPvJDZ1GhlYABWzkKTpCVA7oHiPfpxR
 o5X73YHfr3VcHRe0E18zsVFTex24vYhxcVeIaBPuywzq87Hrb+nRi/ZQ3doL6hLQ1gfM
 8Z20Y0/DJkTjXguYvYNsnB0zIzJt3vBmPoFfuQMDRouiGC2NKLoxOeET7NsJqBgxTK0I
 2iEJOkU18OOSkItsn3/YyxWtEu7cBvQPw+49WYVUd+cw6zjua3agHnMsvqdiu4kEf6nR
 3V0BE0bhIG+jAuIOforNedWyu2iaqP0a52eExE/+8hxXkjcYq2jPtkaYnKi7Ua2fKntv
 6puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRUTijrX/dWDGgF7d1LOxJ77lZwiKODTAAz7SOC7SIQ=;
 b=VmOXsD+3xWGkNnnwex5lqtmLRE7BLuuDDJvDrv+xgjomlqcF7qcl9dVWLxNzG9r+WQ
 RBfWFliwRtAnBJd8PfCZP9LBMh+0nUKmfSMaIJtMyaSIBK15i7/PZBX0veL3TenVRvln
 U7w611wxvdKgAodnw3xDg5GlF4rFwszUvWQcKLktkhnHJybWH2A37maYBlpnGICXhgap
 p7s/Tn9ckSqz/2G8cWwvLCbStBVBiFvvH9A5+sgWvkM6fiSZM7HJgM5px/bCguLDdZWF
 idZh17Y1BVRRLhHAbkET+8qnkNi2mhHh1g2LLE70hh0NSjAtAknuW98zbXyLccDu3zoz
 aB0Q==
X-Gm-Message-State: AOAM532XNC0+eOgKoWKTZtcZ9q92fUtCt9wcfd+QlZYltkzopbbdxHDI
 Tk6t/ynvwY8Iqm5HGiGEKReX8Q==
X-Received: by 2002:a63:6c04:0:b0:398:54fb:5632 with SMTP id
 h4-20020a636c04000000b0039854fb5632mr21383554pgc.78.1649570248620; 
 Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] target/arm: Update ISAR fields for ARMv8.8
Date: Sat,  9 Apr 2022 22:57:20 -0700
Message-Id: <20220410055725.380246-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/LN14WZGxTY

Update isar fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index eb8cb738b5..c6c6d89a69 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1941,6 +1941,7 @@ FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
 FIELD(ID_MMFR5, ETS, 0, 4)
+FIELD(ID_MMFR5, NTLBPA, 4, 4)
 
 FIELD(ID_PFR0, STATE0, 0, 4)
 FIELD(ID_PFR0, STATE1, 4, 4)
@@ -1993,6 +1994,16 @@ FIELD(ID_AA64ISAR1, SPECRES, 40, 4)
 FIELD(ID_AA64ISAR1, BF16, 44, 4)
 FIELD(ID_AA64ISAR1, DGH, 48, 4)
 FIELD(ID_AA64ISAR1, I8MM, 52, 4)
+FIELD(ID_AA64ISAR1, XS, 56, 4)
+FIELD(ID_AA64ISAR1, LS64, 60, 4)
+
+FIELD(ID_AA64ISAR2, WFXT, 0, 4)
+FIELD(ID_AA64ISAR2, RPRES, 4, 4)
+FIELD(ID_AA64ISAR2, GPA3, 8, 4)
+FIELD(ID_AA64ISAR2, APA3, 12, 4)
+FIELD(ID_AA64ISAR2, MOPS, 16, 4)
+FIELD(ID_AA64ISAR2, BC, 20, 4)
+FIELD(ID_AA64ISAR2, PAC_FRAC, 24, 4)
 
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
@@ -2015,6 +2026,10 @@ FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 FIELD(ID_AA64PFR1, MPAM_FRAC, 16, 4)
+FIELD(ID_AA64PFR1, SME, 24, 4)
+FIELD(ID_AA64PFR1, RNDR_TRAP, 28, 4)
+FIELD(ID_AA64PFR1, CSV2_FRAC, 32, 4)
+FIELD(ID_AA64PFR1, NMI, 36, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -2041,6 +2056,11 @@ FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
 FIELD(ID_AA64MMFR1, TWED, 32, 4)
 FIELD(ID_AA64MMFR1, ETS, 36, 4)
+FIELD(ID_AA64MMFR1, HCX, 40, 4)
+FIELD(ID_AA64MMFR1, AFP, 44, 4)
+FIELD(ID_AA64MMFR1, NTLBPA, 48, 4)
+FIELD(ID_AA64MMFR1, TIDCP1, 52, 4)
+FIELD(ID_AA64MMFR1, CMOW, 56, 4)
 
 FIELD(ID_AA64MMFR2, CNP, 0, 4)
 FIELD(ID_AA64MMFR2, UAO, 4, 4)
@@ -2067,7 +2087,9 @@ FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
 FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+FIELD(ID_AA64DFR0, TRACEBUFFER, 44, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
+FIELD(ID_AA64DFR0, BRBE, 52, 4)
 
 FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
 FIELD(ID_AA64ZFR0, AES, 4, 4)
@@ -2089,6 +2111,7 @@ FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
 FIELD(ID_DFR1, MTPMU, 0, 4)
+FIELD(ID_DFR1, HPMN0, 4, 4)
 
 FIELD(DBGDIDR, SE_IMP, 12, 1)
 FIELD(DBGDIDR, NSUHD_IMP, 14, 1)
-- 
2.25.1

