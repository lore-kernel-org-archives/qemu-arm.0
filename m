Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193945njb;
        Wed, 11 Dec 2024 08:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWb5jxFsX/PzIkdL8qF1VplR+s5+okylQ3ploQPkSkUibNyIhBOSnYOM5Vez192vf0h/Z6CUqyw10IukQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEK4pheEUgE/Hu1qNRuPgYO5zCZms8y0Gt5vTlVR4XElttuhPjLdhbrHKRAdw+OvzBYcaU5
X-Received: by 2002:ac8:58c6:0:b0:467:6ead:66c4 with SMTP id d75a77b69052e-46789610daemr56372231cf.27.1733935078882;
        Wed, 11 Dec 2024 08:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935078; cv=none;
        d=google.com; s=arc-20240605;
        b=eMc1GbnT+qAEmMUWCBJv/pPxiI6VIYNyWADIhcwkwIKNIhAqYKChC/jaevTuS9ODEw
         6yo4mJTb7wfOFZaPNCuee3j+YyhT1BQfqksnojhMmp8agde5KYti1eJ54dVSe8TikBU+
         WL0krONJWFSJi8j60aOpLkl58+DSiEB756leAUJQEgUFW6Q6s5C/e6tW7SYX7hrreVpw
         pXWBwR797L1YTfAyNF2dNNmK6UXAYHNL0ZkwLngJibAjb5k8fvjR0EUvgCcbzlNM65mo
         pz4twk9aVVQWgB+BHpEqiMhN51AF1FLbDpYSPf51HU26Lzl+XAPBOy43XhjBOkm4/jVE
         myYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BT2CQNAxIU5n7++J+PUBPBasEOAUptPVV+g3YGfaYsg=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=US2HXLqtoq8q7M2A24sh8H99dxmq+j96pUoxG+jZnwGpPoadYU7s8mt8U8vwF4sgu3
         jHeR/BXAHVLXTkEuzpU5n/wcyXtEIw8Cv8yjGfELxvOO3RbWAHueAN0dQ4RhF5czuOLS
         t6LZTQ4OluHdoc9bmWNRY0FofPLGIZJISEm/cHDUD2xRLEQ9jZkFYuHR/LhbPaS435Pn
         RQWDsNOTCyHiilegkFtxcsvpwnla9S/tvdKHAHlEbhCFCLt+2ErXhv3/xdnE90ZC/gzW
         1SB+BPZEhwxPqgMps42HEbLXVFksRyP4N4wwHN8eL8uEXoNYl0fPCB6eHQQPuUyQIEcY
         b26A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mkXkYWAw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46764c5f93csi82171701cf.692.2024.12.11.08.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mkXkYWAw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPh5-0006Zo-6m; Wed, 11 Dec 2024 11:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgy-0006LY-RZ
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:36:04 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPgv-00025u-Uk
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:36:04 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6d88d3d1eb6so8339366d6.0
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934961; x=1734539761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BT2CQNAxIU5n7++J+PUBPBasEOAUptPVV+g3YGfaYsg=;
 b=mkXkYWAwMp0+HyA3WOx6vH4aTsyVB7Peve5Le0LyBTZNbTriivCQ5Y5RoXnNVDhehN
 XOEKZGTYOr8lR8yl5DyNp2oNb+Ij5y4lt2BYiXGDNUKmIv7gtlzYPj+4ReWqAS8Qnz/f
 FvUbWXdIW7/fcmPTBTFNuYr7AK+exLd1+cOFtWmjGOLCqduinc6ino12APVn+xBVI37e
 +CTQO5BozMR1XF9Bvl6czPvCGYU4QWtDF8ZnGhjGIaj8lNHjvcSilHtqxanX5DzjDA6V
 3hRRP9JwmYdDxYPdEDxKtPCMDcmz5RVGFo2UJaNPFSm/kPDvfw78mUTzggufs/OJzFd4
 2uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934961; x=1734539761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BT2CQNAxIU5n7++J+PUBPBasEOAUptPVV+g3YGfaYsg=;
 b=EXgiYlq/MXmPLCvd5vzSIxIOU+l7wGNyh3mf6vkpUcfCPbfq7A2uXERgaO8Pq/OQLF
 ccguG4LnB9taOrj8YSXm2bvTCdOjCQPNQ84e3VtVyKiTLcKfjzBvmnCcEjmB8hWjyDF1
 ZGcmYJNst2yev3bI0TsbxinF5r807Po5DSvCWXHrTo9y20ImKiAmIJ5GfmuORv45sQJW
 UjA6LagfOaVp7gXgC4Hti09O+9IOfJ4xVh70zKHhbwMsKlVjM7b85f3xbQIM3COXwXDj
 zZWBBHwg95eMxl8TMgISIMCyn83o8DX+I5d7xxiJOwumQ6k9R7ilSnEy65GWVQXweYEG
 7koQ==
X-Gm-Message-State: AOJu0YwdIAhfeSzx1vG2IqnuG6mg+eVg6ZnQnldB/APvQ5vh2WvtaeJp
 Rb4i2oSJtV03ALNAxTjP9WSJev05v8JxL/t5Htc6McSaYqewZR9wnpcXAhslFdF6dKkMLHGEdSC
 m0i3Kzasy
X-Gm-Gg: ASbGnctVL1UuCrYsKVSKx2NGgRfX+bIagMtvXhEbSC5gmVvLgU+U44m5ftCaq0SfYjd
 wd8UfvuqVIJpKf2Wd8+3XDv7lrfErMgKn3XTrYP+rnf1tlby3n0L+cR4OpkwmpVLtFk8LhRKD0h
 y2Tw1F4maU3GYzkR5hbJ3NJrkk6qOIv1Jd3HxPzIh+wtKgLga8HMLFnQHj56eysqZ9CmmLbe3ZU
 PaQqih7VyIJTI94/uzxJy4EPq+gOcC32FlkgfT+PaV765VGUQiRO7TQrDpNSg==
X-Received: by 2002:a05:6214:d6b:b0:6d8:a9a6:83ef with SMTP id
 6a1803df08f44-6d9353193a4mr51936416d6.20.1733934960779; 
 Wed, 11 Dec 2024 08:36:00 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 48/69] target/arm: Introduce clear_vec
Date: Wed, 11 Dec 2024 10:30:15 -0600
Message-ID: <20241211163036.2297116-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DXBdxcFMOj5V

In a couple of places, clearing the entire vector before storing one
element is the easiest solution.  Wrap that into a helper function.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 717d30dd5b..0e8e867058 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -628,7 +628,16 @@ static TCGv_i32 read_fp_hreg(DisasContext *s, int reg)
     return v;
 }
 
-/* Clear the bits above an N-bit vector, for N = (is_q ? 128 : 64).
+static void clear_vec(DisasContext *s, int rd)
+{
+    unsigned ofs = fp_reg_offset(s, rd, MO_64);
+    unsigned vsz = vec_full_reg_size(s);
+
+    tcg_gen_gvec_dup_imm(MO_64, ofs, vsz, vsz, 0);
+}
+
+/*
+ * Clear the bits above an N-bit vector, for N = (is_q ? 128 : 64).
  * If SVE is not enabled, then there are only 128 bits in the vector.
  */
 static void clear_vec_high(DisasContext *s, bool is_q, int rd)
@@ -4851,7 +4860,6 @@ static bool trans_SM3SS1(DisasContext *s, arg_SM3SS1 *a)
         TCGv_i32 tcg_op2 = tcg_temp_new_i32();
         TCGv_i32 tcg_op3 = tcg_temp_new_i32();
         TCGv_i32 tcg_res = tcg_temp_new_i32();
-        unsigned vsz, dofs;
 
         read_vec_element_i32(s, tcg_op1, a->rn, 3, MO_32);
         read_vec_element_i32(s, tcg_op2, a->rm, 3, MO_32);
@@ -4863,9 +4871,7 @@ static bool trans_SM3SS1(DisasContext *s, arg_SM3SS1 *a)
         tcg_gen_rotri_i32(tcg_res, tcg_res, 25);
 
         /* Clear the whole register first, then store bits [127:96]. */
-        vsz = vec_full_reg_size(s);
-        dofs = vec_full_reg_offset(s, a->rd);
-        tcg_gen_gvec_dup_imm(MO_64, dofs, vsz, vsz, 0);
+        clear_vec(s, a->rd);
         write_vec_element_i32(s, tcg_res, a->rd, 3, MO_32);
     }
     return true;
@@ -6307,7 +6313,6 @@ static bool do_scalar_muladd_widening_idx(DisasContext *s, arg_rrx_e *a,
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
         TCGv_i64 t2 = tcg_temp_new_i64();
-        unsigned vsz, dofs;
 
         if (acc) {
             read_vec_element(s, t0, a->rd, 0, a->esz + 1);
@@ -6317,9 +6322,7 @@ static bool do_scalar_muladd_widening_idx(DisasContext *s, arg_rrx_e *a,
         fn(t0, t1, t2);
 
         /* Clear the whole register first, then store scalar. */
-        vsz = vec_full_reg_size(s);
-        dofs = vec_full_reg_offset(s, a->rd);
-        tcg_gen_gvec_dup_imm(MO_64, dofs, vsz, vsz, 0);
+        clear_vec(s, a->rd);
         write_vec_element(s, t0, a->rd, 0, a->esz + 1);
     }
     return true;
-- 
2.43.0

