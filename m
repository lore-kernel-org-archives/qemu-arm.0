Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3847945lfb;
        Mon, 16 Nov 2020 08:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlujAaBa0M5TQtzWjQ3GmSVwz6sXx9aWK2S7ew90ttW0RrXVWmb1/ERffLbcf3sj7e5TIv
X-Received: by 2002:a25:2f84:: with SMTP id v126mr22194465ybv.509.1605544255610;
        Mon, 16 Nov 2020 08:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605544255; cv=none;
        d=google.com; s=arc-20160816;
        b=NKEDcpLwf0flbjh/158O5To8Tzw84smHVnE/SS4UAUUw+60bsH7QSVNIhaiQdDoD6B
         9wl24ZRtAat2UOMZUcQeeDCnAZmzTbdCBV0WJp59nBDt79oosnBHmhzpfJsVB0pq8PFW
         k1QXseUawfXnMjB0uF+YWCvqGMuECndtjevRVkQr5zidCU3sBnQ2+LNxsSGGrIPzNRsA
         8WMSdU6BxGMmLHd/IGeMeKdLh86AZChdPHKAy5mVsvioDzJQqBqiy44ZYd9F7wUwQnMf
         4nDgd1izNE7PJI6BQplvSugRJEM7JyzaiTKDJTSAIGN6CmVkTFbxaBcfIt8N+XsY/+ei
         xt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dp5OeL6zHEFo/uQpmEKWaIqQytKKS/VgbFkbBy3hcaw=;
        b=LO4gU591V3r6d6Fj4crisJOUBno9VMlHsxK3DkxxNfmXPX9AnCyzetaoaMupLhJ+ct
         7fTJbMe35Ew0nMD3pcQ2KkV1oVQh+sOmReZqG9/j6bCvlmbm1c2LBNXzp+V85Sow0znY
         0b6Hok1o5tXQcpx6KpBD1KgYyWNkynSfwlME4hh1XsQ775G7qe9sjvF+m6inyTj7gzAS
         Nu/4Dn2vb3Htvr8hV7Rr87INlNT9SYoH8k/4PTQ6YhF8gwc9/255rTwd4iZtp5TPIZYz
         MaQa31XhLgzsjZoSCQ7EAI89fTqCIKj5skOLKbx0eENRG9UvW5pCrhTiC8bow30CMwMS
         5KvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdU4QEqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si18871078ybm.436.2020.11.16.08.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdU4QEqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehP3-0005iE-7F
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3l-0000M1-C3
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:53 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3j-0007un-DB
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:52 -0500
Received: by mail-wr1-x441.google.com with SMTP id m6so2089771wrg.7
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dp5OeL6zHEFo/uQpmEKWaIqQytKKS/VgbFkbBy3hcaw=;
 b=IdU4QEqqmWyARGX4JKZYUnL0BsVET5qYtXhvbuzAbSFX7R5I0lGyweXso7QJq3AeuM
 nt42dP3t77zQqIUDMulTXZO/3feEtrMercIRFmhHu3WgaYXYa2Zlx9v8n/uE6DczH1gS
 hqmZVMcRZQh4dFHNHDKBW0RD6D2FlWBnnFp3DDkncw8uUnLzzSZ06PJXR3twAb9bs0Mg
 m93f9pM+/0zVX13Jk/2/dgUmF7OPq7Dtt7kpS0gON6Cbo0hKBwDVtYBQ1rpQYQIPswUt
 62JVGMTM0WZNXZscJSwGSQ4DBFR+lWx5IWFoS5w8H9b8rXyaO+fseviJuoB6brYIrlJv
 kEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dp5OeL6zHEFo/uQpmEKWaIqQytKKS/VgbFkbBy3hcaw=;
 b=NID0pxkcGCeuQ4GETEAmK7S0UK/hi8la7RanJjrCvEC7BJn7h5NsZIn/Hzwgv15Dl/
 tbh9KEWNx28FUKG9IeVuUAV/RmoqxNYM3dYPN3B4EVnXcHBAcIoxZvNBNOvdAYK0SUuO
 3WjGnhVw4opO9JhNnlVnGVPMl4K4RlKcxXAtFighsU+ca+nLRWNWGlL68LLN+7reOMag
 FgYNjAJPfhCwSMYpQrbZg6I+gdwhZfnEnUzFItcWCJvPcb4GTaOskCVpSftn43Peg4Zs
 8Z3LZUlWAj7aqTFHVUO9+AKCB/MbH4JwnP8wKTzD2eSE+CraFmxNFJy0WbymSYMs3q+G
 h3oQ==
X-Gm-Message-State: AOAM532RXLfHiyhj5HnyQa4/oAfscuG5ibHZTXA4l+v5sd1pLmcA9af/
 trtn1u7zQ0w2QnzALOILc/VjZtlL+zcH9Q==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr21212627wrs.170.1605542929780; 
 Mon, 16 Nov 2020 08:08:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/15] target/arm: Implement FPCXT_S fp system register
Date: Mon, 16 Nov 2020 16:08:29 +0000
Message-Id: <20201116160831.31000-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8bcqLhTMmFBi

Implement the new-in-v8.1M FPCXT_S floating point system register.
This is for saving and restoring the secure floating point context,
and it reads and writes bits [27:0] from the FPSCR and the
CONTROL.SFPA bit in bit [31].

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 6bc07992eb4..c7ae306f12f 100644
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

