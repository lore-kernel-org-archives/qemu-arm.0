Received: by 10.223.159.74 with SMTP id f10csp2934634wrg;
        Mon, 18 Dec 2017 09:47:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBot6KbHVp8CrxSB0P6aOXV64A7r5DulOjv65FVwUKWKy8x3xPDjNiay373X8ZwlysYQBNCrm
X-Received: by 10.129.160.200 with SMTP id x191mr398965ywg.365.1513619264288;
        Mon, 18 Dec 2017 09:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513619264; cv=none;
        d=google.com; s=arc-20160816;
        b=wABcRS/F+WrDEvPWfgkyCsEU6zNnfYdErVklO3o+YEiybQSEOCyKrhc2QQHwPoj3pE
         mXYNTopsFi8nqcJKTxSZddE/cL+AopUWKuYb72oTcwRJWGs0rzNxybQcZk8xJAWOmqTB
         gvmGpT2JEjD8pnGGtKK4vpga3wI6/Nq7fYYB92s8O1wljYdIdF1WSunOTZ3UbJ0wfwkG
         wVZZmKmaiKuL63tbEK2K0bh1C3UmsJUhkmrWyE54YModzrRaPXyfGA7b8jhpvfsg4NPZ
         PCW0f+IYNbvJKgMABJ3C6/Pc8vlQJh9mjIYhXANO3t7AhkRZIIPt1BiCQnbpTf3KE3Ew
         W2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=A1TpEFUQcAIAmbbKhGXHC/lApCYj1Sah5xccazBdlfc=;
        b=LEHv1EGYzsQf1/JMluPVeBMlR6T1ns7Xh+YqABfeWjGtgWKqjH7pehyO/Oz/k74dKt
         I2FudWauoZ4EALIALfCbc0qfjfBkWC0iO3RVTHhNShvTa6YPjM9FqOJ63V2TKb2KfwRd
         3v3F8mdvmpudWYacI5PeJIOSVloq7NxcPDL4gz4yxV+cWv+0lAerAlRXPaongPZh3Wxs
         vkmMH9+Te4bwWaxcBk+zHZ2L61HsFJ+9qz8mIzmgiVb7q2v0g7pzbCKyWwcSxFkkCeFy
         FxQCqxbkD+4/bb36RUnIQQ2F6mbnuHLX3APZOnQ8/sh+7PbXunZvbMCofY7Rwah/e2OV
         31Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J7IOR1ZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d123si2568998ywe.744.2017.12.18.09.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 09:47:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J7IOR1ZE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzVv-0001Lm-N1
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 12:47:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9a-0005wL-0P
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQz9Z-0008Bw-8t
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:37 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:42815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQz9Z-0008BD-36
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:24:37 -0500
Received: by mail-pl0-x241.google.com with SMTP id bd8so5205770plb.9
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A1TpEFUQcAIAmbbKhGXHC/lApCYj1Sah5xccazBdlfc=;
	b=J7IOR1ZEtWexRQi/kNyvNmY093KGnvn05c6+lsSdZmewdWjfBNm5Ao7qb5JwHBGqpb
	N15ZeuniGzXkMQ9quHSAkOrHsuDPmFCZDvG/SVP61jqX2lqR8k2l3jtI1ozEU8s4KDMS
	ELTG9EMgEf/0DlfSxbSPrED7qFE6m4LhiwaZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A1TpEFUQcAIAmbbKhGXHC/lApCYj1Sah5xccazBdlfc=;
	b=pFh3VHpaEv0N/FaAz7C+mP9hbp7fLo2lpjoyUhGxID4/J+FddVBNwgZFR1oTiLmoHb
	yvxr93uDjvPJ9iBi3YL8Dv4aKVwcD1qoVOrovbNe087X0NdQbAbqXsgrgoV15V5fdTwb
	fSuVK6FL+KIBtst3Yo9lgLY8Z9Xo3UyO5c5/E5e3on7ABjHJKUhRugO1jE2k56wCARmH
	LC9fQFyOBLGIeacIeSmMHZHQZb2K8bAFOfI9Obg3zvUwGJRHc2orifNU875xynn1pDiZ
	PlC4HMhaRYroRJ1wINM8xhU1ug1jasge3BqJwltve/RLeiV/ijpXxOGoWzfbeloY66Fr
	vgzA==
X-Gm-Message-State: AKGB3mKuKfC6pLktybOHj1Xa+AQC1U7UMZy9j3Uy4jUCRBBLzns7Xju/
	OFzItWONxkM5fScBL05qYx4cuw==
X-Received: by 10.84.164.104 with SMTP id m37mr412808plg.29.1513617876251;
	Mon, 18 Dec 2017 09:24:36 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63])
	by smtp.gmail.com with ESMTPSA id m10sm9260469pgs.4.2017.12.18.09.24.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:24:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:24:20 -0800
Message-Id: <20171218172425.18200-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218172425.18200-1-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v2 06/11] target/arm: Decode aa32 armv8.1 two reg
 and a scalar
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T1RcFmzEPM0I

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a9587ae242..1a0b0eaced 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6973,11 +6973,43 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         }
                         neon_store_reg64(cpu_V0, rd + pass);
                     }
+                    break;
+                case 14: /* VQRDMLAH scalar */
+                case 15: /* VQRDMLSH scalar */
+                    if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+                        return 1;
+                    }
+                    if (u && ((rd | rn) & 1)) {
+                        return 1;
+                    }
+                    tmp2 = neon_get_scalar(size, rm);
+                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
+                        void (*fn)(TCGv_i32, TCGv_env, TCGv_i32,
+                                   TCGv_i32, TCGv_i32);
 
-
+                        tmp = neon_load_reg(rn, pass);
+                        tmp3 = neon_load_reg(rd, pass);
+                        if (op == 14) {
+                            if (size == 1) {
+                                fn = gen_helper_neon_qrdmlah_s16;
+                            } else {
+                                fn = gen_helper_neon_qrdmlah_s32;
+                            }
+                        } else {
+                            if (size == 1) {
+                                fn = gen_helper_neon_qrdmlsh_s16;
+                            } else {
+                                fn = gen_helper_neon_qrdmlsh_s32;
+                            }
+                        }
+                        fn(tmp, cpu_env, tmp, tmp2, tmp3);
+                        tcg_temp_free_i32(tmp3);
+                        neon_store_reg(rd, pass, tmp);
+                    }
+                    tcg_temp_free_i32(tmp2);
                     break;
-                default: /* 14 and 15 are RESERVED */
-                    return 1;
+                default:
+                    g_assert_not_reached();
                 }
             }
         } else { /* size == 3 */
-- 
2.14.3

