Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1146154njb;
        Sat, 1 Feb 2025 08:50:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtXwE2Mq16xyvMxM7fqbGRH8y+4la0J+q+l8eg+wlPM8M5BgjXL1lQFn7amU1CZQ9Ca2tyzE0OTDdidQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHEnNaVvV5NszaLOL2Q0wMHCgiBorPRA/8jjuRDAavLBCUUAgJBFpPQNu4SYDZNzMESSZuu
X-Received: by 2002:a05:620a:8394:b0:7b8:6331:a55e with SMTP id af79cd13be357-7bffcd99ademr2419988685a.44.1738428602224;
        Sat, 01 Feb 2025 08:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428602; cv=none;
        d=google.com; s=arc-20240605;
        b=fCnoPj7fFhlx+GR76dTvH8mbYHBv+UZ3OeQt0i4xanqgQKfqBzXKZ0/mQzudY/jdsz
         XIW6OQZyUNSh6x8c4Sxz0LqT3I+UJQOkkOP5pDS9oAUeVLYwxhGr9rzjcI16AaHsUlyB
         3BZlhmiJ/TNZJ1oqXVMUvk5vIiBIEJVFIA+DnfEEZTijudS+6rttEIqMJqI09XAnRbpU
         aV1euT6CQ63Jhg3u/nQitwXIgqaMPzbUV2Yu7OMnFWMtnl+2iu7zb+Xh8yL81eMwgBKn
         BYCtbCCPfeX5vLFlBkx1ndccnEAWdiBqWLtWLd8U60xS3ibB/xnLiLJ8wmpfmioJzUrr
         b+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j+IEg0CkEoamQo7lN9mBa6LGDBjZtlXQ5vioOX8GKig=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=IgKfe5L14r0Rt/dMZlCxnh/5mRym6F8j0bXiRVB7i2Dt7J9PU1aHljU0gULtVKuvYb
         fCYnRl1EanjOW4XexWS3o0qiqWR4v/uCbNtMcyZJp20wNQwe20q/pEX46Aftb9IjbXgm
         18Y4KMeZ9IPD4smAq3iRb89BKY5GId6nSRQMrFYunQ6A+8XuEKGlPW/Zdkxc3reFz2Zx
         md4ijoqy030CR2i6nkNl1yz14u9+C4qJTDksL1UHeo+agA3XPhK1BKCU8XHg0hjgATg0
         vvzan75/sn0chv5uPnv/Yv7ABFgs5BNuEg5fU1hcYNuUxZDuraUJ66vt7828TWg32hXw
         ptCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BX+sf3YN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8d6c6esi619190785a.137.2025.02.01.08.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:50:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BX+sf3YN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY4-0006Ch-Aa; Sat, 01 Feb 2025 11:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXy-00066a-WD
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:43 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGXx-00017D-FM
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso20561485e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428039; x=1739032839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j+IEg0CkEoamQo7lN9mBa6LGDBjZtlXQ5vioOX8GKig=;
 b=BX+sf3YN2FCCkxVcVAf+qTTHZIVJeKHqvWVMixMArhLhrB+umGu86Jkn4QZ7x/VfRA
 dlpqzAr8PbeYRvE9CjI8aGYq9UcARJTUQtbf8QG2jYDN/wrZcSrRxbtv6NHqWg7wmPi9
 ioqhdDe6F4HmnbO9PMv9A4c30nqR2RsNrSFYsnv+LnMg+pY59CeZy2s8CziN26IFyLXb
 KNAW4Ov3NfR3xhnpTzNQG2rXHL93Y+o3x7f9C8iNy7EpSJ+YwYO4SvEcpOZ/M6zgntrW
 /2HUTVWZ1lUohv4w1ERZV12gGNPzWgRaywxohOJIFfzA1+hdXT8dWBXvJbGsw96ETcbq
 /pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428039; x=1739032839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+IEg0CkEoamQo7lN9mBa6LGDBjZtlXQ5vioOX8GKig=;
 b=E2ihCsErAvxsWOV8rye5YLWmwYgGF38jNrhlGK/O+PaGB7pM24azJamZlABTJdADSh
 7vmc53EUwHYcrtEKt0cufJ2v1L8WOkIuOmvDxdEBwbCbTcMGEOdzRWdc2fanO7RbZQKE
 kPqJoEMqODHjUJb14s2MVP6MxWmasq6bmpEABEezd49Z1wLYEXLq5SunxysDPuqHkBj8
 saTF57wVxacbFgNjDd+e+EIQeAqOEcJ1zTK2m4V4/t762VtrbLbIZcrgFmVIImWlBTZi
 7FXt86UZpnOgsqCorntYrVGCnY89pQPI9oto2yr/MRHWb78lGMiVTwct5iVaPdgcq7BR
 DLlg==
X-Gm-Message-State: AOJu0YzE4+KRZpBpSzXqbWXD/kEDIIDnfcI0FmEaSm5OGAXR+bKGaCay
 xABJxS4QHTwYHQOhH8PcLBNhU5WLEzEKz72epkJibRWFQvJoKuND00tmtByY/icCfCgSjexlDJK
 9
X-Gm-Gg: ASbGnctoH4bVOl6PFQ7U9H2FITTsbR4ezGOsgISiZZ0n3m/UgKTVO4Y9kniDiPqvvzj
 m8zwS8nOP6vcLgUZu/qey2C1LFnqGl6/GviGmoFFJQHpjbMPKZg5pSHJguPAZN6Vgy+up9iFqGf
 xjPtNj7pEFLsVFiEATaEk+HmU9MtdaZ4J9wesDNAYy6BdyX3ktJzhFr6c/Qr3TM4k1CE3V7mHns
 WcYhDxHM81zNGr8+Y045bH+2oB8j/b8Qgx46g85AQRsGVFjyGeXTj+vm0ZHuyy5lMGJkYlkfHGU
 PL8PN5dg8rkR57ZlqMho
X-Received: by 2002:a7b:c3cd:0:b0:438:e231:d342 with SMTP id
 5b1f17b1804b1-438e231d503mr78993105e9.1.1738428038991; 
 Sat, 01 Feb 2025 08:40:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/69] target/arm: Handle FPCR.NEP for 3-input scalar
 operations
Date: Sat,  1 Feb 2025 16:39:20 +0000
Message-Id: <20250201164012.1660228-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: sOwiUeEZRman

Handle FPCR.NEP for the 3-input scalar operations which use
do_fmla_scalar_idx() and do_fmadd(), by making them call the
appropriate write_fp_*reg_merging() functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e45d96763fd..96696c342a9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6356,7 +6356,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
                 gen_vfp_negd(t1, t1);
             }
             gen_helper_vfp_muladdd(t0, t1, t2, t0, fpstatus_ptr(FPST_A64));
-            write_fp_dreg(s, a->rd, t0);
+            write_fp_dreg_merging(s, a->rd, a->rd, t0);
         }
         break;
     case MO_32:
@@ -6370,7 +6370,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
                 gen_vfp_negs(t1, t1);
             }
             gen_helper_vfp_muladds(t0, t1, t2, t0, fpstatus_ptr(FPST_A64));
-            write_fp_sreg(s, a->rd, t0);
+            write_fp_sreg_merging(s, a->rd, a->rd, t0);
         }
         break;
     case MO_16:
@@ -6388,7 +6388,7 @@ static bool do_fmla_scalar_idx(DisasContext *s, arg_rrx_e *a, bool neg)
             }
             gen_helper_advsimd_muladdh(t0, t1, t2, t0,
                                        fpstatus_ptr(FPST_A64_F16));
-            write_fp_sreg(s, a->rd, t0);
+            write_fp_hreg_merging(s, a->rd, a->rd, t0);
         }
         break;
     default:
@@ -6867,7 +6867,7 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             }
             fpst = fpstatus_ptr(FPST_A64);
             gen_helper_vfp_muladdd(ta, tn, tm, ta, fpst);
-            write_fp_dreg(s, a->rd, ta);
+            write_fp_dreg_merging(s, a->rd, a->ra, ta);
         }
         break;
 
@@ -6885,7 +6885,7 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             }
             fpst = fpstatus_ptr(FPST_A64);
             gen_helper_vfp_muladds(ta, tn, tm, ta, fpst);
-            write_fp_sreg(s, a->rd, ta);
+            write_fp_sreg_merging(s, a->rd, a->ra, ta);
         }
         break;
 
@@ -6906,7 +6906,7 @@ static bool do_fmadd(DisasContext *s, arg_rrrr_e *a, bool neg_a, bool neg_n)
             }
             fpst = fpstatus_ptr(FPST_A64_F16);
             gen_helper_advsimd_muladdh(ta, tn, tm, ta, fpst);
-            write_fp_sreg(s, a->rd, ta);
+            write_fp_hreg_merging(s, a->rd, a->ra, ta);
         }
         break;
 
-- 
2.34.1

