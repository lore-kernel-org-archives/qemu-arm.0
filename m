Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2878181ejt;
        Mon, 19 Jun 2023 08:44:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5i1VLI1TT9WyfhODaWfFZf7n7f4vv1cP7hCpxGUa+InF6WQaSrss3bEFQW4OmWfAWqusaX
X-Received: by 2002:a7b:ce15:0:b0:3f8:afe4:575c with SMTP id m21-20020a7bce15000000b003f8afe4575cmr8183903wmc.29.1687189448065;
        Mon, 19 Jun 2023 08:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189448; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMA3GlwNS/l2ddp/nwsaBjHwNrGPT/o2Ta9+qKMErYrEklpoyKAwFFELo0AsCy1S9K
         hd8d8nncUUOkPXKzBrLWviU6AU06Td1+VrwDdGssfX+/M51au+g3TfsIY6cQnR5x3qT2
         EhUM7VViADVtDWS5PknI4RSQ68CJ7kLNypBu7Vpm/guP6ZvbCkneIq9RElro425dZv6n
         XrtTSuxzDNWSXS+1P7JvStSLa4LvxVpxyzYgNy3ot2fzZ+14eeUWu0bpyNezXcPY6tIw
         AyaerXqNEEqwk1oPKn914wth58ZGeLd05RaKf9oW8j/wLJL7qRurqzmR7lXq1ikUDgKP
         qdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PL1Zih1O88caRvf7sSFHzFYcTBs6PNvq9qmGaaGGlCI=;
        b=PzuDWA6U6KW7AeSDpq5YaExB44nPGEH8uDzl08NbQW9B3FRv/GMhsobDM1FEJ5hQx/
         KoDcYFQ5TlzmG8i0yaLaVDGMrvVQxE2NVQ71FsEIpjsALV5B8mAq+mp5xveLx0S3GFq/
         aqGgKAEzAZkfBuAGMDJMFf3TlrdBTIS1Mac7e5oQMGMwc7/cIhkK4TEWTG7UxdaoePPF
         lDd2fcucKUDBOymFx6VltcFJ/p3Mi/EIN7A0hwA7TFPelEgyMgGSd1VRyN8I5SuVk058
         UDivuSVnXVCt8v+QDExstsA/MHcl9RTSGC6nQIXxyMAKZ1WHeW+EfAyScPIUBn38fsYA
         2ljQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F3p1GJvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l40-20020a05600c1d2800b003f90bdce62asi2044288wms.172.2023.06.19.08.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F3p1GJvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBH2v-0003eU-En; Mon, 19 Jun 2023 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH2t-0003Q5-7B
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:43:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH2r-00017x-9e
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:43:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-311167ba376so3346330f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687189436; x=1689781436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PL1Zih1O88caRvf7sSFHzFYcTBs6PNvq9qmGaaGGlCI=;
 b=F3p1GJvOBzRYX+oQcB4KOcPwohuyiC/NwphpH6cw202L2pMbS/VpDmgY0p9ntiSoPm
 7iBr5Yt/+X/1JTQxkgHktCCQIbvK9hDw756Z1mpFNWAaugidIedFX+LMI7XVNNwiJE8j
 UxjMYvKurjlVt+c62jImob2r2Y75v7hsUxFhKG8JF76gy4BTfO1POG+UIeBw7XoE/vA0
 r24EhkVeS3tAZLRbIanQVylhuRfPoH0Vj3shMc8/sfRRf/gnBjf37QgWp2FbD7mTjjqM
 xe/hxAQheHw8wfNE/CwunRb0Mc5NxtT4ZPCn3UZvMsb/B9zVfRjzv8CNSHVBkdM6E5vC
 DHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687189436; x=1689781436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PL1Zih1O88caRvf7sSFHzFYcTBs6PNvq9qmGaaGGlCI=;
 b=Zbs5uvVMY6+gZsz8frhvVgYXoGoxiySOosEC2LndIeEiFzaEvghbd6cEyFYSclNhJP
 s7/x2U3uM59LBI3XDdE/LRsh3HbXgepljHcZesR7oDz+5pVKgEfLDUVDh6cl/zt4K8Sc
 0WaaN6cbv4Xv16YS5zjSjGB2IpBNbVUueS8KIHi0PGOZM2z0Gl/lnsSNfCJ7jjsca9nu
 JdGJZX0R74DnAXJkJNqY4EIIUXjay3KvhCh4bsmIe6xG0Rk7O5b2nbefNRAS+GxSDr73
 iP7JE3pOxkLMaQY+WVg+FYF2VITLISM58xTZVs8xdJ62LkL5VIj5nwrO/1R5bTTVqzl5
 VXOg==
X-Gm-Message-State: AC+VfDwNowbNgkavQHtI6HfXHDbzlMkr2apZ9iEmC7ss+dSBj8aOw67j
 6CnEdfPeWb7rdhv/TaWD2EPONLJNYQl3YT4HtqsgtA==
X-Received: by 2002:adf:f203:0:b0:30f:b65a:e5a1 with SMTP id
 p3-20020adff203000000b0030fb65ae5a1mr7603171wro.38.1687189435752; 
 Mon, 19 Jun 2023 08:43:55 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4643000000b0030fd23381ffsm12913966wrs.11.2023.06.19.08.43.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:43:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/34] target/arm/tcg: Expose some iwmmxt methods in
 'translate.h'
Date: Mon, 19 Jun 2023 17:42:33 +0200
Message-Id: <20230619154302.80350-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vILLKSIGBVuH

Expose a few methods and variables before extracting iwmmxt
code from translate.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h | 6 ++++++
 target/arm/tcg/translate.c | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d1cacff0b2..3d7c55d3b6 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -165,6 +165,7 @@ typedef struct DisasCompare {
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
+extern TCGv_i32 cpu_R[16];
 extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
@@ -298,6 +299,11 @@ static inline int curr_insn_len(DisasContext *s)
 /* CPU state was modified dynamically; no need to exit, but do not chain. */
 #define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
+/* These are TCG temporaries used only by the legacy iwMMXt decoder */
+extern TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
+int disas_iwmmxt_insn(DisasContext *s, uint32_t insn);
+int disas_dsp_insn(DisasContext *s, uint32_t insn);
+
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
 void gen_a64_update_pc(DisasContext *s, target_long diff);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 3238463f13..aaa479521e 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -45,9 +45,9 @@
 #define ENABLE_ARCH_8     arm_dc_feature(s, ARM_FEATURE_V8)
 
 /* These are TCG temporaries used only by the legacy iwMMXt decoder */
-static TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
+TCGv_i64 cpu_V0, cpu_V1, cpu_M0;
 /* These are TCG globals which alias CPUARMState fields */
-static TCGv_i32 cpu_R[16];
+TCGv_i32 cpu_R[16];
 TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
 TCGv_i64 cpu_exclusive_addr;
 TCGv_i64 cpu_exclusive_val;
@@ -1490,7 +1490,7 @@ static inline int gen_iwmmxt_shift(uint32_t insn, uint32_t mask, TCGv_i32 dest)
  * Disassemble an iwMMXt instruction.
  * Returns nonzero if an error occurred (ie. an undefined instruction).
  */
-static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
+int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
 {
     int rd, wrd;
     int rdhi, rdlo, rd0, rd1, i;
@@ -2509,7 +2509,7 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
  * Disassemble an XScale DSP instruction.
  * Returns nonzero if an error occurred (ie. an undefined instruction).
  */
-static int disas_dsp_insn(DisasContext *s, uint32_t insn)
+int disas_dsp_insn(DisasContext *s, uint32_t insn)
 {
     int acc, rd0, rd1, rdhi, rdlo;
     TCGv_i32 tmp, tmp2;
-- 
2.38.1

