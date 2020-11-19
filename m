Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp756570lfb;
        Thu, 19 Nov 2020 14:06:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGXL1T9veCGxpH4/xXfQe/TCM/lkZRC+eHwpvRa/wi5iGqkFfAb3IIHP7kiia381VIyoYl
X-Received: by 2002:a25:c711:: with SMTP id w17mr21013142ybe.132.1605823596303;
        Thu, 19 Nov 2020 14:06:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823596; cv=none;
        d=google.com; s=arc-20160816;
        b=hKxhXlXs23+mw0div/uPIa2mY2po97pEIaGELXG/6/ptYzRJOAqldDKecOruUIoTzU
         W2MogkKnFzQl/l5Wz1pzxBF4ze4nVF/LjitoWp9X2V7gf6iJX0GlKYLivOwgxp6riddt
         npO9x7fCzTZ6BO+E+oR0GOizDWyago0uhw5UTaUfClk7Jjzd85CEwLzFWceE/llwNNwO
         FY1qMEJD4XK/XNxeAcI+gY38Exutx3r5uPCmvcQn1+W/PNetQFb/WqoU9hzHJ+fhUVIh
         3F3KPl75GsD1Iw/FPDL/MYaMsgGpUYf3cmcPM0Uc6p7YIdCKEuvjG39022io3A1Nts4a
         0yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G9ItV+eP1VFQWsVotetxM6YhffQ3YD5Q2yWIGtJOv7I=;
        b=BojKTC1lvfagjagXvmvqUWDXgJZ2iU5oZ/AuPZUXcfzv0A0Cv9qQtPc03eOLAIN4zb
         Ao5mIATI0fD3cD3s/GZkXNusvEDNoywy1b+q8G2U5tOCeFTjyDZfu6Dxb3IzC+MHihW/
         ECg7F1dxlWfhd1qQHldxtBjVRIR0X+cp3rhn02YE0iBSeKD9UeBOHtSyzrHQgH3YZ/xp
         ujLDOL5BUctklhy4hWNyJyhov17WILcRuchCd+0p9shYcDCQiP7LA9shx2TMfOHfdZgo
         OFwWQL6cnoLPsTHHrJ2YG04onXWUBhX0dtjULFqo5NiAvUIlIC0H98Fw/nVOtUVaKsN6
         L7FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fmtik6kg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si733727ybl.140.2020.11.19.14.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:06:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fmtik6kg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs4Z-00045d-Lf
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvC-0000q1-Sp
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:54 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrux-0004Ca-9C
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:54 -0500
Received: by mail-wr1-x442.google.com with SMTP id p1so7954309wrf.12
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G9ItV+eP1VFQWsVotetxM6YhffQ3YD5Q2yWIGtJOv7I=;
 b=fmtik6kg+o6mS9TDPqbREWvIgts027IR0xq+jiDAOCNdl0+DhdY4txojPZa3shZ5E+
 x2Jsgo4FQ2zXHdzPAyWPHYVy8N8wopLyHcIZPgfp6dLCF6vt/blWNGHl+tOZJYHCJru+
 vLt1fEugXfKVapznfcPvFPLxEWt/uQwz3G7FHTw5FwOixXs3pUrKrwmBOp1r2hAPrkTN
 YQIhAptlmBpajuYaSoJWAyvd3PFYWYlNBzy60ubLsOD/Cvhp8/OmLA+l5VnxPTulGPDU
 QMbGWEg/w3eLZmD26AG+a7OTRLHYLGq59E2Zf3axINApIwnNyxLHu98jry43WUQu4ZV5
 cO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G9ItV+eP1VFQWsVotetxM6YhffQ3YD5Q2yWIGtJOv7I=;
 b=gqDTKYgfY5eQifUX3OYxXCenDODJU7Sf0MUzIy7RKS1Le+nbBK57gi6TMIqoiYPy6m
 zJp2VTxuU42xIipbTgENGL1zEjeOk2Hyvosaci957/uM8bWPufMqMdifjw0UtcbajR4s
 A0Puu8adt8F0/Q6nXrWToly1Zh4dhUQsci4VB22AeBN0+DJydVpQvNWQy1Ri1dEhzIB3
 DDEHiuibYrXkYcf0cmB/EDVHEDLTCRrr0jrHbWX49EwCTFQW+Bl3UvHl0rRaCxGYJcZW
 EdY5OIYK2JDNUZk5IcAi2G/16m8sSNRUKbOmkuqD+XTkdFQv4GKyjgkfoaYYhreFVCrE
 b+mA==
X-Gm-Message-State: AOAM5320UJvEGbD30KsJbnOz+ijT+3CFkAd4neWvYLi7AbfpsHZXrALg
 0KkiqR1i7cd0AYRj9nb1Cdei0YkUSjITmg==
X-Received: by 2002:adf:e912:: with SMTP id f18mr12331065wrm.79.1605822995509; 
 Thu, 19 Nov 2020 13:56:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/28] target/arm: Implement FPCXT_S fp system register
Date: Thu, 19 Nov 2020 21:56:02 +0000
Message-Id: <20201119215617.29887-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MtVrSr/JzKTJ

Implement the new-in-v8.1M FPCXT_S floating point system register.
This is for saving and restoring the secure floating point context,
and it reads and writes bits [27:0] from the FPSCR and the
CONTROL.SFPA bit in bit [31].

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 9c90c0647bd..ebc59daf613 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -662,6 +662,14 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
             return false;
         }
         break;
+    case ARM_VFP_FPCXT_S:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+        if (!s->v8m_secure) {
+            return false;
+        }
+        break;
     default:
         return fp_sysreg_check_failed;
     }
@@ -712,6 +720,26 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(tmp);
         break;
     }
+    case ARM_VFP_FPCXT_S:
+    {
+        TCGv_i32 sfpa, control, fpscr;
+        /* Set FPSCR[27:0] and CONTROL.SFPA from value */
+        tmp = loadfn(s, opaque);
+        sfpa = tcg_temp_new_i32();
+        tcg_gen_shri_i32(sfpa, tmp, 31);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_deposit_i32(control, control, sfpa,
+                            R_V7M_CONTROL_SFPA_SHIFT, 1);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(fpscr, fpscr, FPCR_NZCV_MASK);
+        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
+        tcg_gen_or_i32(fpscr, fpscr, tmp);
+        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_temp_free_i32(tmp);
+        tcg_temp_free_i32(sfpa);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
@@ -755,6 +783,36 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         storefn(s, opaque, tmp);
         break;
+    case ARM_VFP_FPCXT_S:
+    {
+        TCGv_i32 control, sfpa, fpscr;
+        /* Bits [27:0] from FPSCR, bit [31] from CONTROL.SFPA */
+        tmp = tcg_temp_new_i32();
+        sfpa = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
+        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
+        tcg_gen_or_i32(tmp, tmp, sfpa);
+        tcg_temp_free_i32(sfpa);
+        /*
+         * Store result before updating FPSCR etc, in case
+         * it is a memory write which causes an exception.
+         */
+        storefn(s, opaque, tmp);
+        /*
+         * Now we must reset FPSCR from FPDSCR_NS, and clear
+         * CONTROL.SFPA; so we'll end the TB here.
+         */
+        tcg_gen_andi_i32(control, control, ~R_V7M_CONTROL_SFPA_MASK);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(fpscr);
+        gen_lookup_tb(s);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
-- 
2.20.1

