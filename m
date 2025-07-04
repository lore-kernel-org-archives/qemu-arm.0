Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1251651dyc;
        Fri, 4 Jul 2025 07:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ1tLo6eBFF+FOQUXyNwlOZf1SMp3LtRN4PoIMDDhDcqMaELKImt0RpiFWaKB82xClpvnOjrSDl9viRA==@linaro.org
X-Google-Smtp-Source: AGHT+IFL4h25TDGqPoE6gt97D4+O4aDA66OcaxkkDVMEvC5xq4Ip2s6H+5j4zaeLf1jLZiDWmp6U
X-Received: by 2002:ac8:690b:0:b0:4a7:ff6d:e94c with SMTP id d75a77b69052e-4a99649afc5mr40628221cf.22.1751639132603;
        Fri, 04 Jul 2025 07:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639132; cv=none;
        d=google.com; s=arc-20240605;
        b=dZQsxDdGew/w6TbSS7OV114Sz1Q04+Txdkc6RRIimMJYYCwvkwM8pZKdQB2RS2oc6S
         S3iYcVBJB/SJmOKzf8f/7ojTlcZ/EN4lC8fOSIKf17m2NSDCZ1ffz0vm+DKaUmR/qkOY
         rhFupsfc67KXWsEvCElLagLi83MrI9vruwPxkGcCdxMQ5X8Z8WvOrfq2kgBJ6zdsjr0C
         A2ehmkpEBXL1WKFUV8u9y0sTu51/7F6N6r6asVMKBM3rg1rn3x+Qy0EEBbiihOUYc3ED
         WMoAoEADF19jWfAbRkO57mLS1tFrPJZnLvAchyU6f/DSXGh05Ye/XCoGEaCseRTMSSpd
         ahug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QZHxsghFcUANhQ9FBp2KHEXBbIHriLYmgetebn62l7Q=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=S8y51EOiIwghmt831mvvRp/Aw9E4c0kFXjdx4j1PW/W/PnBvdzwOBIcWmxmxDPL449
         MKartgk+36DwtNRTMAeGPfwMc+i+5qgFiCGhOtm1FBL+qfblLYYsvqnTCRBJpsoWBpFW
         KV8IaQ8HVsugdV+lGji7uJZ5DIAld2I9sBAC1UczZkwZvdxnCoa43cTb/P6KUwz5HPmc
         RCxZIxf6RVZ8ZZh1QHJLu1UkBucNAHaoooXF4Th1ffGKxBGnaFdyFAW0EN2+REKg5jU1
         i2+I0ycoUXto0X121v7dOYn+EG6gYdkat71PSE1JhgZlyLaii/JT5OrYpAlwSlT4X/cU
         YvfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AU5Muo+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994b04358si21155101cf.536.2025.07.04.07.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AU5Muo+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhL5-0001xZ-Cy; Fri, 04 Jul 2025 10:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIP-0005MS-90
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:47 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIN-0005zj-7J
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:45 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2ea34731c5dso859405fac.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638902; x=1752243702; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZHxsghFcUANhQ9FBp2KHEXBbIHriLYmgetebn62l7Q=;
 b=AU5Muo+cllVXb82wznK7Eh5JTlDNlTmbLyZfG20giz/yx0OE/yBYdeGqaPkgVGNZrH
 FtIKufpEu6y633bi4h6D0/pstDxJubMGRV5/h/VvUW1ayB2iNstaIogqOkUjxKCy3ENu
 Qi7CMnZ4MX/Nlo49k9miWJMX1lriifW6EWOabjnWzlnD/dHSqYlDYvoLjKe5PjI7fE4a
 /rZairNp+n+gzhYjcHBOGKLaKitAyMQWXiNjugLYmHf6/JnV1V/WuuJBASYseMM3iNq7
 F3pnbrsisuR5EyspV75I7MQLqyC5XL0ZmQD4tZv9zv2C8F4fcBlyXSZkkA4SziLQlkRw
 wYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638902; x=1752243702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZHxsghFcUANhQ9FBp2KHEXBbIHriLYmgetebn62l7Q=;
 b=Pt+Otzyzr0ZJGyg1huHSSfRjIrHQrTbm5rTzJFaZr4BnD9utTB2zGWT8THT9nroWYP
 OtyGD3TIHcZTfbtRtoEvahoSB0i1/z5h3/3lRNcwsJcFSq3Mtqy85kTu4XrAZrEzlSrF
 KaMCcrppMt6SWlcLZDfzN22oeonWp0xGA8qcdv859gSf+HlMWrHSwm06JvB/xnt/H2QP
 Al+t+wJLnGx+vZdb8MQ/Nm50hiE9TsVth4n5x8Vg+7Fx7wKHRj4pS2EA5RzXyKA0PIPE
 AVH1Jghwie0s6TO5qrMHL7rkkbcm5RvPc2IWk33GPkE5J1w8pCeG0n92x2fK/Ig3jGBs
 WQXg==
X-Gm-Message-State: AOJu0YzCPqO3/XNCJVpW+/R7leinlHxKl7pyGd6O7om7dRmQmdAlgDxa
 hoA9kazhZGlDiOwKTLThu9ySRdp4miDB/wIbbe3PqKjCHwuBZ2ufYE9EBhgSTAXuLtQ3BLmoNAX
 TAIkpc9Y=
X-Gm-Gg: ASbGncvZFBX0lan4dOrCNishib5hdgFbP1N5PxJuTE0sBn7OoZ6wrDdKvMwZlMxVpHW
 Kgm/UB/8mf1LIrY0mMwVG/1DZxnOPrk5z2OeFQjeVaTBBOJDHJYhmCiXaq3XiEXgjyykO8fV0Qw
 jZ6z8P6zrxqz9QXVsN37/xJDD12ZH4ft6YFgVaktMyn6YVeRa7VsjxHfuRU+d4SZ1y0LSrSRPai
 XzKhgI4vA1sYipF6nWqoIMM5gyVZi6E8RtlvIhJa5w4xGja4X1WK6CbDmFs3Gwp+nIKGojdsRQB
 WPdy3hSCg2UwrR1fOtBImQ+ZnDIuND1jrxTgaAJKKTKI1oEvL9QhLkRDkJXOMiyeyv+8apzLIKb
 8t05egqqU9wnBVagVFQ3DeN2v3g5BhWZjSDTIAweiL6Sqz74+
X-Received: by 2002:a05:6871:8308:b0:2c2:5f8c:4630 with SMTP id
 586e51a60fabf-2f7919c7ba5mr2222541fac.0.1751638901935; 
 Fri, 04 Jul 2025 07:21:41 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 026/108] target/arm: Implement SME2 MOVA to/from array,
 multiple registers
Date: Fri,  4 Jul 2025 08:19:49 -0600
Message-ID: <20250704142112.1018902-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6XXgU4U4f5mc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  5 +++++
 target/arm/tcg/translate-sme.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 12 ++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 7336b7db72..a18d07540e 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -210,6 +210,11 @@ static inline int plus_2(DisasContext *s, int x)
     return x + 2;
 }
 
+static inline int plus_8(DisasContext *s, int x)
+{
+    return x + 8;
+}
+
 static inline int plus_12(DisasContext *s, int x)
 {
     return x + 12;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7d4c7d7e85..7b275dd2b8 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -298,6 +298,36 @@ TRANS_FEAT(MOVA_tz4, aa64_sme2, do_mova_tile_n, a, 4, false)
 TRANS_FEAT(MOVA_zt2, aa64_sme2, do_mova_tile_n, a, 2, true)
 TRANS_FEAT(MOVA_zt4, aa64_sme2, do_mova_tile_n, a, 4, true)
 
+static bool do_mova_array_n(DisasContext *s, arg_mova_a *a, int n, bool to_vec)
+{
+    TCGv_ptr t_za;
+    int svl;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    svl = streaming_vec_reg_size(s);
+    t_za = get_zarray(s, a->rv, a->off, n, 0);
+
+    for (int i = 0; i < n; ++i) {
+        int o_za = (svl / n * sizeof(ARMVectorReg)) * i;
+        int o_zr = vec_full_reg_offset(s, a->zr * n + i);
+
+        if (to_vec) {
+            tcg_gen_gvec_mov_var(MO_8, tcg_env, o_zr, t_za, o_za, svl, svl);
+        } else {
+            tcg_gen_gvec_mov_var(MO_8, t_za, o_za, tcg_env, o_zr, svl, svl);
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT(MOVA_az2, aa64_sme2, do_mova_array_n, a, 2, false)
+TRANS_FEAT(MOVA_az4, aa64_sme2, do_mova_array_n, a, 4, false)
+TRANS_FEAT(MOVA_za2, aa64_sme2, do_mova_array_n, a, 2, true)
+TRANS_FEAT(MOVA_za4, aa64_sme2, do_mova_array_n, a, 4, true)
+
 static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
                     void (*func)(TCGv_i64, TCGv_ptr, tcg_target_long))
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 5eca5f4acf..37bd0c6198 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -27,6 +27,8 @@ ZERO_zt0        11000000 01 001 00000000000 00000001
 ### SME Move into/from Array
 
 %mova_rs        13:2 !function=plus_12
+%mova_rv        13:2 !function=plus_8
+&mova_a         rv zr off
 &mova_p         esz rs pg zr za off v:bool
 &mova_t         esz rs zr za off v:bool
 
@@ -88,6 +90,16 @@ MOVA_zt4        11000000 10 00011 0 v:1 .. 001 000 za:2       zr:3 00 \
 MOVA_zt4        11000000 11 00011 0 v:1 .. 001 00 za:3        zr:3 00 \
                 &mova_t rs=%mova_rs esz=3 off=0
 
+MOVA_az2        11000000 00 00010 00 .. 010 zr:4  000 off:3  \
+                &mova_a rv=%mova_rv
+MOVA_az4        11000000 00 00010 00 .. 011 zr:3 0000 off:3  \
+                &mova_a rv=%mova_rv
+
+MOVA_za2        11000000 00 00011 00 .. 010 00 off:3 zr:4 0  \
+                &mova_a rv=%mova_rv
+MOVA_za4        11000000 00 00011 00 .. 011 00 off:3 zr:3 00 \
+                &mova_a rv=%mova_rv
+
 ### SME Move into/from ZT0
 
 MOVT_rzt        1100 0000 0100 1100 0 off:3 00 11111 rt:5
-- 
2.43.0

