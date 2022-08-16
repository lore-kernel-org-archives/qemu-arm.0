Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009185ejf;
        Tue, 16 Aug 2022 13:34:57 -0700 (PDT)
X-Received: by 2002:a05:6808:ec5:b0:337:ac3c:550c with SMTP id q5-20020a0568080ec500b00337ac3c550cmr149787oiv.262.1660682097390;
        Tue, 16 Aug 2022 13:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682097; cv=none;
        d=google.com; s=arc-20160816;
        b=umWZroczC5/lRfClx1gposVcqC3Qjkw0PsjSPcPG0mYHX4TY9i5R3+5DHRi/bDGCTI
         RzaWNUk41yJXzqf5/ukRx6yPMPrAr6UgpISfrqFDefriMFvrB2lcl+B9NEEefGU4KlXE
         FULVcMi3crOUWQyODgTPUCvLQLCNR6UWv4x3qvNE+N2CQquA9IVP5sBkq/PdpyA3sZqg
         b1tUZYeM0yFdZLuP5gqrHmkcqyQ2fdCh5tSQOhm0gPGyJfQVzj8hrHaTtpfSh0/QLU3g
         keiZUj/YA2zQBQlP4wqjSHjgEadnSindh64boU6vcfq5+IGmEw8vlX8OqyO6nfKP/yyT
         KzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
        b=o9F2vF2Oq1jDNZaiILS6NjPh4dZkJ5Kxyoy6ttHdNfiYLnlJjZjJUDji9qMFXXxGuy
         LmByQ5pyeoDqQy7zN0d6e4pocr2qBKlIY1hNq9zKr16rgbdLWfftK9TqgZp7EUoGcXKa
         84ZafcpR5nDCX5cKcB4b1R/b9c9IeXq/qMLuL9bGdEcm17/lWxkvYeasuv3wo4xfE6vO
         aEs4Ybozi6JeLiRnPxp1W3/i9Sv8oryQEOonSwcJw7rEIiC6x8d9pHLUn70NbIeMSYuK
         zRZvQ9lXf48RuU/h/XPxCHKmft6/snTqRxVnRvGnqt10Uy6oCEfKwXGcam9DBTJb5KwP
         Becg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u22ZyIGL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r33-20020a056870582100b0010c2edc723dsor2250327oap.36.2022.08.16.13.34.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u22ZyIGL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
        b=u22ZyIGLJSrcJgxnhNPzQVYdrnflr6ghpy3rqUxNUiojETvR0MLU2apMWIRvYjEqHi
         IbfNQjJzUQjxMuO360eVSutUCJAcJR0wTRC3kEh3hLn/ycSvUm+j9A9TYnN0YddoOMLI
         nblCG8PihdVMBqA8l2/Ullw5RQEPYj2nd4x3j3Mbdd668TtvXkf461QhqP/7LyvLxGPQ
         1xawIPiDCcdM8R7KAa1PardmKyjcMQSUMjTnCfZEMw/9IZxyhDTFdxAxs23FS/nF1HWE
         zCH9c0+2buSn7uxHKIW6XJWI4O6mZhpoW2EV1XYvJ0KW6iPgSTVahf4Ee/jtsQTPqoY2
         rGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qdoo/EFfZ9+xL61qXYRJd5BN7nP+QxbxeeGNggpMDL4=;
        b=Me0gweFE0Zax4JVGfTHK998QmD8f5YNEQYiGVjwrVDkopRMLkGgYZUIBdQOfOQDuoq
         F5hTQuY3BOOMfJHltWcuc+F40BvYP4IQlid22GCDhiotKzAeec/V/sWtQ0KYSPrz+7rQ
         SKOYUwzlbaz28pw0+SRxJxOrKIQI4ZH1j2Y+/a6qM6M1gx3+Q4DLT9PCxn5vxUdqdFAY
         fgpo116L89vK2vYARd2fXG80eelp1lIku5LSKD3HB+Shi+bMQUl3jNXe94OcHZ/ZhPTq
         RwgNlXCZ/S/4nZVMecJIFb2JeQkrYfw8873BgJ/PNLuvcnwqrzNScpTyW1yoAHIX08mR
         dDdg==
X-Gm-Message-State: ACgBeo30vWG5hFpk9ip5Bvyq0kuT23AKLb0XWMa6wtK8P6S35Yi64rCh
	uI0gdFoxmf73KAsjXug8b8rEK1i3
X-Google-Smtp-Source: AA6agR6KekUm+FhkES1zQq5teMKAOnDNUYbcnFJIqtIOOzoY/ziSfNKrrULXyCi/1fylMrKkDLN5UQ==
X-Received: by 2002:a05:6870:a2d0:b0:11c:3148:c44c with SMTP id w16-20020a056870a2d000b0011c3148c44cmr166044oak.38.1660682097001;
        Tue, 16 Aug 2022 13:34:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 25/33] target/arm: Introduce curr_insn_len
Date: Tue, 16 Aug 2022 15:33:52 -0500
Message-Id: <20220816203400.161187-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: f4VFeN2fPTcJ

A simple helper to retrieve the length of the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9474e4b44b..638a051281 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6660,7 +6660,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9825,8 +9825,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1
