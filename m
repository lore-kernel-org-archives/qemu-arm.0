Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2211672lfg;
        Mon, 21 Jun 2021 09:14:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM4L2DzcwQeQmpFm4WI47WpG4GDSxOeyd52SrzFqHUpXAdaZkLgOhewZzyZ7D8k0HAQzkq
X-Received: by 2002:a05:6402:5191:: with SMTP id q17mr13875319edd.321.1624292074877;
        Mon, 21 Jun 2021 09:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624292074; cv=none;
        d=google.com; s=arc-20160816;
        b=W/foWGlV5qUKTIyQq2/U3A9W02O4n8ZZ+iqJuyi+JL+2XJgx15HH0XDt0zJOyeEAqA
         XpU4SnSGpi13G7rYDhgfiqKNXT/25XnTTyM4nnasefpKQDN9dvHKdBoe9dGXAWU8cq7C
         4svfGFPbaKeO8tKzONmLGvTq+QqX3xmdeGhSMbj3QNcb11b42ea3LKyaANgd3CEWNTUX
         y+mHHk8T8boBdRwUN0HnhSKqLsaAtHZ24Y1OVDKDLbs9Nm3oUEDjAZhAu99GJ4yEXHuW
         jAPYr//KnNu0Jjao1HRejpXLoB/eb2ChCcp6DyLXNurg4JxNdrHp2ngQ5Da0/n9krJvj
         hdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0V89FAcdiNZnsrsuQVHiqzxPDdpNn/7FrKSSoOLeJ9U=;
        b=SlHNO80Dlg2G1Bpsk7Nj6f5Gfj9Tn0i8OnVERJt7bIXBWMdlFH9yOJTW3HDbmpg2zL
         0gRjC68xRFcLnMCj08TU8TBhGnSa9iZfPWseH7/DybPMeZv17eO5L33K1D5qoLp08Dw+
         SVne5Y7AfJSMxnwyURPcHuPguGAIENq0N4dwiz6mcP9oST76ymuZwbZTIjQn77XH0X9v
         IYFpnRwwTwgVl/Ha+5AYp6dz6NTYmmD+N8vJB9jscoiLGB/gVklrP3fbNcOnbbjLQON1
         LtTioGM7+hL0ouxsRBtMTy9TjIdr4/hOHqcOyezewkM4z4XVo4wzCAbnsNJJHB8xrqTg
         SiDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCsIvLEo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si4021850ejl.510.2021.06.21.09.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 09:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VCsIvLEo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvMZF-00083n-Vh
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 12:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMXd-0006gd-9n
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:12:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMXZ-0005m5-Hu
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:12:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id i5so2289320eds.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0V89FAcdiNZnsrsuQVHiqzxPDdpNn/7FrKSSoOLeJ9U=;
 b=VCsIvLEo9x1LHO4Xwrh4svPGAvlTKbihfr4UZ6PysFnk5HGBmHrSjsVYvOueeiZxPH
 CB/c2qf4ND9m5Qk3av6qu4p4Pb3xe0I3BXaa12FjFf0Ugtj5q8sYHUlc4O+8HEnRFu3w
 SLmhZ5la7nYcu+Ley+WtwZahIh/dDSFGBAZOOzZ40m7BfXOD8ZDix36PZaS6ageL/PKp
 sDVogxh1sfvAkrhYgV80reQdgn7V3X5AJHQZ1xmYTc2dvyMWeHKNDNw9qfblzBpG+AOR
 xAgqa/cnvRLhaIieixNc5BNwq/EgEHcqF8MLQIAehIOjrMIA7o39IIqPxCfZ8wZVzB3h
 NQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0V89FAcdiNZnsrsuQVHiqzxPDdpNn/7FrKSSoOLeJ9U=;
 b=WDbFEGkZY5DnYKJrUBUpaj1PatYzSJjnPW5ztnJsc2xbjkcHuoZc7y1CYaHZ+eR8zm
 FYUQ61jp72MP5eIrVgir5d/jrRyBlamKyGdOexjXjipLGPG5dzvDAcxPnX/DPCQIb9A2
 DC3ZAdAnsCbDVton/LAvdzM0Ii4iU6KKzyCSzDoWjN9vUHwxPJQOeYYfIpbachzV3Ojp
 7YXNsdTpwGHlU63FE3G6iDaLD59OXAKWLBc42govDG6wppvp7evfRlg48TRKJ5j6dK0g
 0SMcmZUCEojhVqQMBpXRrl6fHokNBChiT0xmYe+sclivb/2haxwyqP5zno2pPyrLBO7V
 2nfA==
X-Gm-Message-State: AOAM530kXbY0oXloKITc9i1UXqkLdyFrK/u3fq9taTqsbtJ2CqBI9NSD
 L0OWg2PQpKDWTGPSuDUTh9CHu71MolmeZv19PAIuAQ==
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr2018265edz.44.1624291967727; 
 Mon, 21 Jun 2021 09:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-4-peter.maydell@linaro.org>
In-Reply-To: <20210617121628.20116-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 17:12:11 +0100
Message-ID: <CAFEAcA8QLDqzHOUQXaCx4hTqyus-xOcvjH1NTbVn4GUvjDkpag@mail.gmail.com>
Subject: Re: [PATCH v3 03/44] target/arm: Implement MVE VCLZ
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpyCmuwoePdD

On Thu, 17 Jun 2021 at 13:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Implement the MVE VCLZ insn (and the necessary machinery
> for MVE 1-input vector ops).
>
> Note that for non-load instructions predication is always performed
> at a byte level granularity regardless of element size (R_ZLSJ),
> and so the masking logic here differs from that used in the VLDR
> and VSTR helpers.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This is the necessary fixup to deal with QEMU_GENERIC having
gone away in current master:

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 91a9366e281..f2fae523e24 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -185,7 +185,7 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
 /*
  * The mergemask(D, R, M) macro performs the operation "*D = R" but
  * storing only the bytes which correspond to 1 bits in M,
- * leaving other bytes in *D unchanged. We use QEMU_GENERIC
+ * leaving other bytes in *D unchanged. We use _Generic
  * to select the correct implementation based on the type of D.
  */

@@ -234,30 +234,16 @@ static void mergemask_sq(int64_t *d, int64_t r,
uint16_t mask)
     mergemask_uq((uint64_t *)d, r, mask);
 }

-/*
- * mergemask() should never be passed an unknown type; catch this bug
- * at compile time with a link error if we can, otherwise at runtime.
- */
-#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
-void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask);
-#else
-static inline void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask)
-{
-    abort();
-}
-#endif
-
 #define mergemask(D, R, M)                      \
-    QEMU_GENERIC(D,                             \
-                 (uint8_t *, mergemask_ub),     \
-                 (int8_t *,  mergemask_sb),     \
-                 (uint16_t *, mergemask_uh),    \
-                 (int16_t *,  mergemask_sh),    \
-                 (uint32_t *, mergemask_uw),    \
-                 (int32_t *,  mergemask_sw),    \
-                 (uint64_t *, mergemask_uq),    \
-                 (int64_t *,  mergemask_sq),    \
-                 unknown_mergemask_type)(D, R, M)
+    _Generic(D,                                 \
+             uint8_t *: mergemask_ub,           \
+             int8_t *:  mergemask_sb,           \
+             uint16_t *: mergemask_uh,          \
+             int16_t *:  mergemask_sh,          \
+             uint32_t *: mergemask_uw,          \
+             int32_t *:  mergemask_sw,          \
+             uint64_t *: mergemask_uq,          \
+             int64_t *:  mergemask_sq)(D, R, M)

 #define DO_1OP(OP, ESIZE, TYPE, FN)                                     \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \

thanks
-- PMM
