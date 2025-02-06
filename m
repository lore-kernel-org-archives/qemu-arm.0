Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1778685njb;
        Thu, 6 Feb 2025 12:00:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDfVNXOWYzphD6BLib215Em6OgDS45NYv7FcUBCbiZAFzbL/kYmJyYMMbMPhICOInb3t5pLn83354fdw==@linaro.org
X-Google-Smtp-Source: AGHT+IF7SOzIMnnnz4Yk1cuaa0QKJ3wiTCSwRMZswy5OtwT0nLp34NZ25dNNsmxHjyPHh7n5lwG9
X-Received: by 2002:a05:620a:4626:b0:7b6:753b:9b5d with SMTP id af79cd13be357-7c047c74fd2mr78227585a.36.1738872046500;
        Thu, 06 Feb 2025 12:00:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872046; cv=none;
        d=google.com; s=arc-20240605;
        b=g+VX7UpNir+Y1rIOST/lClk4K07+/M3dUJmoL5VLYZIa8pal4MYdU2xOROn7Tn/C/i
         s+hyfJW4K+75yeRUwqyOO3YT1x3HzlLjFk81v6JLOcfx0RxKROBgn1AfUTA7AEOXAg9z
         60riD65BPLJF7VBmNuic1LtFkk8ltDGMmn3cgCiyMP6goynEo7z6x0/joPEURt4Gjp+8
         c71Qm4PTE0v7cw+lYhVQg7AjIbKNhck2AJAYIkcmslvWFtC7v7QnQA50+wLAGOqwVwns
         WrmakzuBBfPq65dgdwBmxkJu/P+okwR6Ww3Jk1+hLdQ8D9dey2Z2u5RiH29VDduopl8X
         NNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4vCaHxxYIkSj3q0UsyKH2F9kl7U5ibwE8cj80OnY95U=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=c8LSFbhytIX22mzbv9KeYpA/8troH/UBLhuLqTSr8rU72nHi85E8uibmkRCYAA295G
         DcmAg6IhrGR+kkx4Sp8z+TBvIJoLZeqsuBWSzkufHC6A5q8cKySQipx+OZI3bUMl+HAw
         xY/KvPZgi86wStMjg5QrtZErVKojhud3fNzKQkead4B1jlRR2lS1FuhzMJBPNv6/dUXz
         EEP/M35Y1zFGd7bQyapK0F+RqbFbJrTTzzSD53idYTlaxgiaJKM3/OT2ddeazYBFXHT+
         Ads4o+XYt4KefDIBchj6GQImo3hLkhKg+p0RoMXHbsDl6kFxoGybl9iUvgZSOfy66zEw
         KcRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U/TbSCg5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed52ecsi180125785a.518.2025.02.06.12.00.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:00:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U/TbSCg5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg810-0000HI-Mv; Thu, 06 Feb 2025 14:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80V-0007Od-2G
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:51 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80R-0000dy-7C
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:50 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21f4500a5c3so16087135ad.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871866; x=1739476666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vCaHxxYIkSj3q0UsyKH2F9kl7U5ibwE8cj80OnY95U=;
 b=U/TbSCg5JmDlRnFNivJkVqi+fTup93/Z3mhInHYLLTWPBsCqhAdSps5TpGuPsbUuSm
 zDtOfDT1wIEcXXSkPYachgeMymxSbK3SfFZ/nyJHjnUnJPzRlUq3FLue35e7AX1dvhTR
 GQ/GVsOC6yeLOJdp/6WrhDbBVd8DNjDisj551ee+UCCojax2M51n7whWl7cPc5vAC7uB
 lynJhgOhKVt/zOtV7VOGNe8Il/ru5IMS4uISwVdNPfe/DxT0dqLnVp3J5qbQEAUvMBEn
 Rp45AsVi0HFM4Qij9Tm7ZSJ3vkA4FljgLYNyu8L8FH6X1JAp96Sl2JwxC4yqfT5kdoeb
 pG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871866; x=1739476666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vCaHxxYIkSj3q0UsyKH2F9kl7U5ibwE8cj80OnY95U=;
 b=qOrc5+Hoils29X5D4A0k1ssBP9cZ8hd6gHgwvLQKqzpa8SMlrS4SInuZxWB6w+Y+zK
 z3mMPdmRIJ4b4YmW056h1wrpQsXga+1Gj10AFD8Hh+rbhBAcEWcUtxN7nDdNzjVqsBPk
 WBvfjP6HnG7DYvnaxGJzf3cDvIGh88yxdpY49KGazC8uH2EuTbh9rjE+pQtYRxTWcY0V
 mj1XmEBAO2q2jzoOh+TUjgcyxFIW+WwNaEZM/Hnq2DJMAZJ5Nrpj3WJzCjFtJxL6+zk3
 4Qfyqun7sVmFWpH5rul5UY4AS25ciGsiqDwAU3cOgsZ0z3fNwuDmsLrec2EWceEm6SUz
 qEyg==
X-Gm-Message-State: AOJu0YyuXO4JfyZvvOfRKLqG4IybbLFNxopEZGg6uOclkJpUQ22jNK1q
 ehGmbU6XPV5vgTZ6VOZ3BrGDgIBJiT144yIO4KMYadsMmLH5Ep5JE+6heMkoK8cW8G82oQjPzfH
 z
X-Gm-Gg: ASbGncvz43/gp8NRj9FGlzYeqfKTXQzxG8xTrOY+lLag632hA2YXHEYDdy1xNoixfpC
 YQbVuYBaSEekWkAy+frv32k/Ev1oqXmv8JERgu8uz3IjH+KQpg3u+InqBHWa8apLUZw/ebl38FO
 jwd9p2gUH5bv+GzAMBZaKBysHE13nxaqx3Iyaa2IdJ18o0+9eJf9w3kkNczxZWhfIKMeWYl1qRy
 2w3cx0sLpPUBhbJp6xRpLXYx10OY5/C8RUHpaJibTGwqGYp6kCKIOK9HK7YAKuybqK2MSg+Znan
 fSZDpUeW8OcUGqYfhNOvdNd08qgfyxdd024W3h0S4T0aPiA=
X-Received: by 2002:a05:6a00:929c:b0:729:597:4fa9 with SMTP id
 d2e1a72fcca58-7305d53a88fmr849788b3a.22.1738871865781; 
 Thu, 06 Feb 2025 11:57:45 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 39/61] target/arm: Implement SME2 SMLAL, SMLSL, UMLAL, UMLSL
Date: Thu,  6 Feb 2025 11:56:53 -0800
Message-ID: <20250206195715.2150758-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: jMk+BhkdyHRY

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 29 ++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 44 ++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 492933d42d..f43511335f 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1003,3 +1003,32 @@ TRANS_FEAT(UVDOT_nx_4h, aa64_sme, do_vdot_nx, a, gen_helper_sme2_uvdot_idx_4h)
 
 TRANS_FEAT(SUVDOT_nx_4b, aa64_sme, do_vdot_nx, a, gen_helper_sme2_suvdot_idx_4b)
 TRANS_FEAT(USVDOT_nx_4b, aa64_sme, do_vdot_nx, a, gen_helper_sme2_usvdot_idx_4b)
+
+static bool do_smlal(DisasContext *s, arg_azz_n *a, bool multi,
+                     gen_helper_gvec_4 *fn)
+{
+    return do_azz_acc(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                      0, 0, multi, fn);
+}
+
+TRANS_FEAT(SMLAL_n1, aa64_sme, do_smlal, a, false, gen_helper_sve2_smlal_zzzw_s)
+TRANS_FEAT(SMLSL_n1, aa64_sme, do_smlal, a, false, gen_helper_sve2_smlsl_zzzw_s)
+TRANS_FEAT(UMLAL_n1, aa64_sme, do_smlal, a, false, gen_helper_sve2_umlal_zzzw_s)
+TRANS_FEAT(UMLSL_n1, aa64_sme, do_smlal, a, false, gen_helper_sve2_umlsl_zzzw_s)
+
+TRANS_FEAT(SMLAL_nn, aa64_sme, do_smlal, a, true, gen_helper_sve2_smlal_zzzw_s)
+TRANS_FEAT(SMLSL_nn, aa64_sme, do_smlal, a, true, gen_helper_sve2_smlsl_zzzw_s)
+TRANS_FEAT(UMLAL_nn, aa64_sme, do_smlal, a, true, gen_helper_sve2_umlal_zzzw_s)
+TRANS_FEAT(UMLSL_nn, aa64_sme, do_smlal, a, true, gen_helper_sve2_umlsl_zzzw_s)
+
+static bool do_smlal_nx(DisasContext *s, arg_azx_n *a,
+                         gen_helper_gvec_4 *fn)
+{
+    return do_azz_acc(s, a->n, 2, a->rv, a->off, a->zn, a->zm,
+                      a->idx << 1, 0, false, fn);
+}
+
+TRANS_FEAT(SMLAL_nx, aa64_sme, do_smlal_nx, a, gen_helper_sve2_smlal_idx_s)
+TRANS_FEAT(SMLSL_nx, aa64_sme, do_smlal_nx, a, gen_helper_sve2_smlsl_idx_s)
+TRANS_FEAT(UMLAL_nx, aa64_sme, do_smlal_nx, a, gen_helper_sve2_umlal_idx_s)
+TRANS_FEAT(UMLSL_nx, aa64_sme, do_smlal_nx, a, gen_helper_sve2_umlsl_idx_s)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 4146744a46..ec011d9382 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -311,6 +311,22 @@ UDOT_n1_4h      11000001 011 1 .... 0 .. 101 ..... 10 ...   @azz_nx1_o3 n=4
 UDOT_n1_2h      11000001 011 0 .... 0 .. 101 ..... 11 ...   @azz_nx1_o3 n=2
 UDOT_n1_2h      11000001 011 1 .... 0 .. 101 ..... 11 ...   @azz_nx1_o3 n=4
 
+SMLAL_n1        11000001 011 0 .... 0 .. 011 ..... 00 ...   @azz_nx1_o3x2 n=1
+SMLAL_n1        11000001 011 0 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=2
+SMLAL_n1        11000001 011 1 .... 0 .. 010 ..... 000 ..   @azz_nx1_o2x2 n=4
+
+SMLSL_n1        11000001 011 0 .... 0 .. 011 ..... 01 ...   @azz_nx1_o3x2 n=1
+SMLSL_n1        11000001 011 0 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=2
+SMLSL_n1        11000001 011 1 .... 0 .. 010 ..... 010 ..   @azz_nx1_o2x2 n=4
+
+UMLAL_n1        11000001 011 0 .... 0 .. 011 ..... 10 ...   @azz_nx1_o3x2 n=1
+UMLAL_n1        11000001 011 0 .... 0 .. 010 ..... 100 ..   @azz_nx1_o2x2 n=2
+UMLAL_n1        11000001 011 1 .... 0 .. 010 ..... 100 ..   @azz_nx1_o2x2 n=4
+
+UMLSL_n1        11000001 011 0 .... 0 .. 011 ..... 11 ...   @azz_nx1_o3x2 n=1
+UMLSL_n1        11000001 011 0 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=2
+UMLSL_n1        11000001 011 1 .... 0 .. 010 ..... 110 ..   @azz_nx1_o2x2 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -371,6 +387,18 @@ UDOT_nn_4h      11000001 111 ...01 0 .. 101 ...00 10 ...    @azz_4x4_o3
 UDOT_nn_2h      11000001 111 ....0 0 .. 101 ....0 11 ...    @azz_2x2_o3
 UDOT_nn_2h      11000001 111 ...01 0 .. 101 ...00 11 ...    @azz_4x4_o3
 
+SMLAL_nn        11000001 111 ....0 0 .. 010 ....0 000 ..    @azz_2x2_o2x2
+SMLAL_nn        11000001 111 ...01 0 .. 010 ...00 000 ..    @azz_4x4_o2x2
+
+SMLSL_nn        11000001 111 ....0 0 .. 010 ....0 010 ..    @azz_2x2_o2x2
+SMLSL_nn        11000001 111 ...01 0 .. 010 ...00 010 ..    @azz_4x4_o2x2
+
+UMLAL_nn        11000001 111 ....0 0 .. 010 ....0 100 ..    @azz_2x2_o2x2
+UMLAL_nn        11000001 111 ...01 0 .. 010 ...00 100 ..    @azz_4x4_o2x2
+
+UMLSL_nn        11000001 111 ....0 0 .. 010 ....0 110 ..    @azz_2x2_o2x2
+UMLSL_nn        11000001 111 ...01 0 .. 010 ...00 110 ..    @azz_4x4_o2x2
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -449,3 +477,19 @@ UVDOT_nx_4h     11000001 1101 .... 1 .. 01 . ...00 11 ...   @azx_4x1_i1_o3
 
 SUVDOT_nx_4b    11000001 0101 .... 1 .. 0 .. ...01 11 ...   @azx_4x1_i2_o3
 USVDOT_nx_4b    11000001 0101 .... 1 .. 0 .. ...01 01 ...   @azx_4x1_i2_o3
+
+SMLAL_nx        11000001 1100 .... . .. 1 .. ..... 00 ...   @azx_1x1_o3x2
+SMLAL_nx        11000001 1101 .... 0 .. 1 .. ....0 00 ...   @azx_2x1_o2x2
+SMLAL_nx        11000001 1101 .... 1 .. 1 .. ...00 00 ...   @azx_4x1_o2x2
+
+SMLSL_nx        11000001 1100 .... . .. 1 .. ..... 01 ...   @azx_1x1_o3x2
+SMLSL_nx        11000001 1101 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_o2x2
+SMLSL_nx        11000001 1101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_o2x2
+
+UMLAL_nx        11000001 1100 .... . .. 1 .. ..... 10 ...   @azx_1x1_o3x2
+UMLAL_nx        11000001 1101 .... 0 .. 1 .. ....0 10 ...   @azx_2x1_o2x2
+UMLAL_nx        11000001 1101 .... 1 .. 1 .. ...00 10 ...   @azx_4x1_o2x2
+
+UMLSL_nx        11000001 1100 .... . .. 1 .. ..... 11 ...   @azx_1x1_o3x2
+UMLSL_nx        11000001 1101 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_o2x2
+UMLSL_nx        11000001 1101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
-- 
2.43.0

