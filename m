Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5357074lfp;
        Tue, 11 Feb 2020 09:42:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxA9A9eL3ASHm+9xg0/vvecqq1BTnxEGzbfb1Zyrg6xeOotGMGq3MVyWqPDA/bn5Y9K5GIk
X-Received: by 2002:a05:6214:4f2:: with SMTP id cl18mr3972170qvb.89.1581442943872;
        Tue, 11 Feb 2020 09:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581442943; cv=none;
        d=google.com; s=arc-20160816;
        b=FJ9Xj9Wj8Eb54GUlJo1IMD3CFgF/rqGrSoFDDktTd+4PwzIAMtC44vo8QGv4l68BBQ
         5ZAJ4wbmyYUf/HdCVxPodfnse4+sYc3ztVrlPfJ3hLiB07MWYjvnln1D7noOtufan9Ul
         uRvYXsWqwx8MtD1DQM7Rjq6hRAYBX4J0lHsdrDVN3VqDbdF+8tDmAfXx9fFZqKXMauYD
         pjcOqUFo7hCNrUkmOZdBoSiAgkv1TghqgiNdmIR8g66/WkJjRmR5126s412YAv7iIse1
         AE6fSZukxisUMDaQNlftKjYs39o5im3CiEbdvD6//9iQFzaqHPVg1faVhFpJX/hREJqT
         Q2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JSb9oHrSYbgGp44mvDk4b87Si1MyKo6uTVibb795S44=;
        b=t2OdUTQYxks2jKQOVZG8/Vv2WTgYvOcet3N6NvqiS7+QWPpU4Uc++1/dQV6f1eIJ4F
         cJHggxA4knp6B8fhrDo2hwvg9QtgvuO3rIeRG95Nn7fm9FR/BAHMA3DapnDDQdzzc8Pj
         0Bp1A1hfctkLL8IjqXjrB1MXjFuwVDz3AsRAwuR7V/FCLbxiK5YhmP67BIGloZhrsHCi
         Cnbf6Sry9T4r7IK7OuLZB8jJIsPzjUrL/kjF3qBAbN8sryZ8oXoRO6XkbtQAdGkk1p80
         I1Nwy0w5MP2L3od7q8LHw6gmqTGdrkGJzYbdHwy/rJ1+4WEN/aKoXMZJqcnxH5SlnGMp
         ishg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KdeyNqLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si2120118qtn.58.2020.02.11.09.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KdeyNqLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZYF-0004k8-9u
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTk-0005me-Vo
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1ZTh-00047s-HT
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1ZTh-00041M-1z
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:37:41 -0500
Received: by mail-wr1-x442.google.com with SMTP id z7so13425143wrl.13
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JSb9oHrSYbgGp44mvDk4b87Si1MyKo6uTVibb795S44=;
 b=KdeyNqLxNRrctXOU0reSvDdXp6NGfQg7f6hSUk9aRbusiSG9sNsOUnCk6SMN/M2JqP
 XERnMDwo2friCZIdQUq6Wmu8xWzIkZChGfqaAT6d2vDpKdMhppkKhYDblc4uibLU0H+E
 HvErkYM1w4qnj7ir3hNCs6wURUTagP8rSLkwvZAYj37nqzVVb/3pfW35VzGIvOwS32in
 AHS8soIyVBrzlY5JzztGPDUXKorbacNLcgxyKC9Gr8EkBz/gO56SegcMG9lxF+rz/PGa
 ZuyT2rp6TGsq7HnF3Y1Q9K62lC0dC5SxwHChlD/eU54oE2TREOtnvK+4fMMVasMWWyWx
 H93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JSb9oHrSYbgGp44mvDk4b87Si1MyKo6uTVibb795S44=;
 b=B+p5PwSklkec9qT3pkXmnSxeii0jQWriTKX/NPQ29ZYaI04PaZFAhqL3GosZSWWCdf
 5IF6r7g5iVYfo19J0ZILWcxJk3DCEzZrQ+yzu3oc149LA8u8J1RhdS/mcX9UEaU0lFdV
 bhzx9qnAw0gPxK84O/ZSx1IF4O/0KCBgtv3r39ek14/O53UYk1W6MddT0ALv5Chbck3B
 iARE0xOIZ58jDzMTPZSr38yANyELMTXggLAKmTxqclP05A37tdx3qnFOtxABgXIP/X56
 CZOgzP9Iy52GYGhAqMxK1WOfvuD/EXMZxGn5lzjGyaTIZ6UyJSbBmqYCNwd34XqkbtRf
 g8cA==
X-Gm-Message-State: APjAAAUHSnyn8wKwNWAnbfshfH8Hg8Maw0Tcnvytul3MhsX0vBwVW3Fh
 Sy+gNdCKrwv8Zpu5PUIYdiQbMSEATsU=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr9526289wrs.184.1581442656249; 
 Tue, 11 Feb 2020 09:37:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm6109675wrq.16.2020.02.11.09.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 09:37:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/13] target/arm: Add and use FIELD definitions for
 ID_AA64DFR0_EL1
Date: Tue, 11 Feb 2020 17:37:18 +0000
Message-Id: <20200211173726.22541-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173726.22541-1-peter.maydell@linaro.org>
References: <20200211173726.22541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aNWqd+kDfNnI

Add FIELD() definitions for the ID_AA64DFR0_EL1 and use them
where we currently have hard-coded bit values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/cpu.c    |  2 +-
 target/arm/helper.c |  6 +++---
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b1f3ecfd942..f2194b27ba3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1806,6 +1806,16 @@ FIELD(ID_AA64MMFR1, PAN, 20, 4)
 FIELD(ID_AA64MMFR1, SPECSEI, 24, 4)
 FIELD(ID_AA64MMFR1, XNX, 28, 4)
 
+FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
+FIELD(ID_AA64DFR0, TRACEVER, 4, 4)
+FIELD(ID_AA64DFR0, PMUVER, 8, 4)
+FIELD(ID_AA64DFR0, BRPS, 12, 4)
+FIELD(ID_AA64DFR0, WRPS, 20, 4)
+FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
+FIELD(ID_AA64DFR0, PMSVER, 32, 4)
+FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
+FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5712082c0b9..dc582da8fa4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1602,7 +1602,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 cpu);
 #endif
     } else {
-        cpu->id_aa64dfr0 &= ~0xf00;
+        cpu->id_aa64dfr0 = FIELD_DP32(cpu->id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
         cpu->id_dfr0 &= ~(0xf << 24);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0011a22f42d..2a57bfd9e86 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5771,9 +5771,9 @@ static void define_debug_regs(ARMCPU *cpu)
      * check that if they both exist then they agree.
      */
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        assert(extract32(cpu->id_aa64dfr0, 12, 4) == brps);
-        assert(extract32(cpu->id_aa64dfr0, 20, 4) == wrps);
-        assert(extract32(cpu->id_aa64dfr0, 28, 4) == ctx_cmps);
+        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, BRPS) == brps);
+        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, WRPS) == wrps);
+        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) == ctx_cmps);
     }
 
     define_one_arm_cp_reg(cpu, &dbgdidr);
-- 
2.20.1

