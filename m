Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56806D172B9
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 11:38:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnEjf-0002wG-A7; Tue, 03 Feb 2026 06:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vnEjd-0002um-7p
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:38:21 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vnEjZ-0006Hq-8X
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 06:38:20 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b8870ac4c4eso860415766b.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 03:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770118693; cv=none;
 d=google.com; s=arc-20240605;
 b=QNQnIjiBGwJBcseLkFigwrGV6KaKg344NY7SxwSn3pCqgprILchZ0bCSdBWFpMh0qc
 RktYqelMO+Jxakx2fInzhuMv+PtqJCB9glyitiU33/TmvLiCkbSlB/FO/jVON0wcKtWq
 0CJXoaYoIj/I7Oal2opIG76kHkdpwkn3XIcI1E61TEwFd5LvQLsYQgwgkvDj+TSkD8z2
 zyNCkftPapvrT0x6kcHAx0R4ELagp0XNXU6iQOaPnPicc1OaaD+467GBt42uojXJeXjS
 KuJtnBODf3EKd6Y654hX0l56cUPQjYVGKJ60Jukzd+LTav32x2zLyZ573GOD8J9iF2ss
 8Q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aVQv6CefGtgIOR20D4RlnBWnJXe3hdMZ0MR5Vo/DNJM=;
 fh=qCFbztO3dhnOhG6Pt66yv+nu+y+qT59A8ZMkB24Ec0Y=;
 b=C6pS9+j68Ux4Ytpjl5rKVdUOSyho+Y1Bs0nkYkN8n+pmvakvY+H7JFg6WhvRVORE32
 Zr3oBDVZG0oAOWTJa2peLgmQHxCvSjvx6vzUy2J0rKD+/FEC8z1ynSKR3+wZA2Qh/frs
 7ZO5SubIhL9vGvVTdQolVK2a2c/+15wC20Rqpbp41EtMew0BrXa+/4YTwpksuxTntwn/
 K6vrbW2MN+l2zuKP381VZdlgH7iDpBS6smNqs/JtnfWbjnBALigwH5UjAM5X4eQ8K7FT
 5aucLWL8xwxr5v7LWcvWbl9ux4vMzfu2OoP1SU/FwpA0K00LUJsmh858RftHHxUHtsS9
 NRaw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770118693; x=1770723493; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVQv6CefGtgIOR20D4RlnBWnJXe3hdMZ0MR5Vo/DNJM=;
 b=ZF2fdEhKxzUcYok+M8YNgDYkLg7qsquPko/pYxbuR36atIoWZ1QPOnelnInXgcXxpe
 ihY4FdxOVgOnTJE5GVJdrQ/RqwpDJhXJ5+//rGxFUZZ4MP+u8CChWSqA0osdcv3/zBCi
 5RcCerojAw1jpqfz7ADARuG9hxtzbXM/khqfzf7l7pmgaaG64PKLZtueMt5wAilyEKwm
 u4lU5HbpKkM7VFUYdTLytTMIDjmLdiCKzyVqgfRiAyWR0ubWNPj/A0Pjix4u3Nw776cA
 +rB53hfuz5QTf5nsOaHylQSrU30vu24Hlzpb+wvBhA/svumfOLphoyYhizmMEiKB7bA4
 yZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770118693; x=1770723493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aVQv6CefGtgIOR20D4RlnBWnJXe3hdMZ0MR5Vo/DNJM=;
 b=Sh5qa5m+cdTH5rIDG3gOYY1GARo+ZNhCSMjHLLQa2rXH3Xkb+YLMfqN8QJfPhGZNlg
 6kzq86wr/dI7m70vsQlFmEnQYYsnUroVnR4bCtM7bIZuo+bfuR+Ql8Zlgty8JrAkbZ1N
 hg6ypIaYpWWhWdVUXl7iv++F0dteMnb7z9sIQyb9xO+ChDapV3O/CTz1ARa7J1DpDonE
 tT6iRrgZQgf6l7g4kkrX6JYQkYycBm7GLjUHWEYRgKhFJZ9usz7Lx8Iu+oeSDv8dWlq5
 N3P5MGZjkcpP/bBABuExIPVNY/nPFSNf2Eu5U/yGq0e5Of9QjwYREKEELW//uCo46B01
 IpHg==
X-Gm-Message-State: AOJu0Yz/nE/DEB1YolVaepo+P0PmwyrEOC+c+YXyXn/CRdGCzXkdRd4K
 gwGR5tura0NIpG53I7PCIcNgkxs352EvqHpAscetvIUxga0e+kQT/BNPtS8cer1kK0QMSc2OZj2
 GjxuuJfY4oxS8jqyIULHrFC0BaVsgt4WTCAVC2wnmog==
X-Gm-Gg: AZuq6aIrAVG/HkeCzLFZAkgzTVPPo3Cx0vznCZKLTmaTW+IC2113VGHDnEvSu23hkwp
 SYef3h1nJM0Vjx+tQATMUwBa5pVpsJav0jUvVm7yze+V4JguQGwjehKN0URsR10ZI/g1CcHjTGz
 2RgP1mXs+CqnV+BMKVCQyLMJp8d7sSAj/6EIxOVjmozCujcILO/VJxNeSdet7Gyxjsr+WhiQDMI
 8xw8jrkNSp6w6POGgJu6vPFp5LQfqT7ZcQ6d6IEHaL5L1/PTwWapD/ZRoB/ZLHPDO505BI9W3ri
 XK2+p1YQbPtvRWiCtvTR/ZOCtW16Fcg2UIdL
X-Received: by 2002:a17:906:c153:b0:b87:6b9a:3016 with SMTP id
 a640c23a62f3a-b8dff77a8f2mr893267666b.60.1770118692559; Tue, 03 Feb 2026
 03:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-4-peter.maydell@linaro.org>
In-Reply-To: <20260202133353.2231685-4-peter.maydell@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 3 Feb 2026 13:37:46 +0200
X-Gm-Features: AZwV_Qg3w8YcygChAX9hYqT5U9S30n_IMvFlt-wTMpowhOAn_j1gBzTlOgDAfIM
Message-ID: <CAAjaMXapsWd1S2waeJ5rOx9rEXREboa=GkFE9Z=z104m8k5qFA@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] target/arm: Fix feature check in DO_SVE2_RRX,
 DO_SVE2_RRX_TB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Feb 2, 2026 at 3:33=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> In the macros DO_SVE2_RRX and DO_SVE2_RRX_TB we use the
> feature check aa64_sve, thus exposing this set of instructions
> in SVE as well as SVE2. Use aa64_sve2 instead, so they UNDEF
> on an SVE1-only CPU as they should.
>
> Strictly, the condition here should be "SVE2 or SME"; but we
> will correct that in a following commit with all the other
> missing "or SME" checks.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/tcg/translate-sve.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sv=
e.c
> index 64adb5c1ce..81f487152c 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -3769,7 +3769,7 @@ TRANS_FEAT(UDOT_zzxw_2s, aa64_sme2_or_sve2p1, gen_g=
vec_ool_arg_zzxz,
>             gen_helper_gvec_udot_idx_2h, a)
>
>  #define DO_SVE2_RRX(NAME, FUNC) \
> -    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
> +    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzz, FUNC,          \
>                 a->rd, a->rn, a->rm, a->index)
>
>  DO_SVE2_RRX(MUL_zzx_h, gen_helper_gvec_mul_idx_h)
> @@ -3787,7 +3787,7 @@ DO_SVE2_RRX(SQRDMULH_zzx_d, gen_helper_sve2_sqrdmul=
h_idx_d)
>  #undef DO_SVE2_RRX
>
>  #define DO_SVE2_RRX_TB(NAME, FUNC, TOP) \
> -    TRANS_FEAT(NAME, aa64_sve, gen_gvec_ool_zzz, FUNC,          \
> +    TRANS_FEAT(NAME, aa64_sve2, gen_gvec_ool_zzz, FUNC,          \
>                 a->rd, a->rn, a->rm, (a->index << 1) | TOP)
>
>  DO_SVE2_RRX_TB(SQDMULLB_zzx_s, gen_helper_sve2_sqdmull_idx_s, false)
> --
> 2.43.0
>

