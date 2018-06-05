Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp206389wrq;
        Tue, 5 Jun 2018 10:27:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIgBbBZo/ff6sRLCNbe3N2MYEH/0KtTyd+fPE8sNMvKKg3k7LZgkpKTLqpBysuRK+MRbgLP
X-Received: by 2002:ac8:2f6f:: with SMTP id k44-v6mr26604915qta.33.1528219677217;
        Tue, 05 Jun 2018 10:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528219677; cv=none;
        d=google.com; s=arc-20160816;
        b=rdbVne3bsMAQIvxco1wi+7XIqvi2AZhjMXZmdAYnSKdjN+0Hc+vIrbFB7aDWvxOgZ3
         ycnIjkoUDwUT3/EZ82EqtUnbHsNKbTCLjnRk2v07MGEPZgs29g9nTKONhMfvmpVQ17H5
         WdFaNSTYYcGMB+ZLt6j89TVdXhvStoGg8VnA7V4DXgNYyiPpJbNsvBICIZMlBuoUX2eO
         7OQPyquUQ4RZ2br1EL5bbF/zqiWhqXfBGwko2O6mVDhWj3UgwQpSlCvk+/d9PCOsoqYO
         e07CY5ee81VCXKER+m9iSgkLAwDKyeTFVMl+/lfnu33aocqXcaQZ9SyHnCyXvYjWuiM3
         Zo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VG08ZqbYOPwSseAwg/jXcOXHI3WlDTydJjMO92snXr4=;
        b=H4On5YJB7Tr6IA1jkPEQi8giCVGmroD9oS16CvQ6476vBMyk6VZDXlybUP2zdI50Tl
         StaUE9LMGb2uzRilyHVF2eCVKUYVZirnwDhTf9u+h2n9LLHATpwrp+0uUTVty+KuQPF2
         dg4uIwnTjKSLXqmNfau7KrXY2dLJD40o6xqZVByBv/vQwjZ15mGugTwCfk0hb2OH6Sl9
         H0mlCpd9vHPS/jnggoIAs1SEyY42v8ynIFxK51bKYcLVppYa5gn7iJy1o9RKCEnthg/B
         YGEkNUfoGYNkwwmgv6QRTM80pnw2XAWJGzEjbR3jYb8TffycVs0SRsRA5f5vEscVEiYn
         bmPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CcLShYhj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14-v6si3631284qkb.0.2018.06.05.10.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 10:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CcLShYhj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQFkS-0006hy-NT
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 13:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQFkI-0006hW-Mp
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 13:27:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQFkH-0004Ek-Pd
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 13:27:46 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37115)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQFkH-0004ER-KY
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 13:27:45 -0400
Received: by mail-oi0-x241.google.com with SMTP id l22-v6so2835114oib.4
	for <qemu-arm@nongnu.org>; Tue, 05 Jun 2018 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VG08ZqbYOPwSseAwg/jXcOXHI3WlDTydJjMO92snXr4=;
	b=CcLShYhjD9iQ9ML7LUqCZzHaU07jNBBMA3lgo0VNXHx8NzS3bEesITX15tuQdkdRNJ
	wBgp9NaBSLuxtPeafMlx7gJvLk2C4Mq8qH22+VpfLreysYfZWhhZzAi9PNViF5DfX7FZ
	VsFPzby0VZulSEaUEy58uLaAlvRBp+tmgWvJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VG08ZqbYOPwSseAwg/jXcOXHI3WlDTydJjMO92snXr4=;
	b=km/7PJxKQvPpFsufhI1tAuEvM08iNzHo6KI/8WXSfQla8N0SMYyZgl5xlFNYvoBC32
	nreuVeYY0mrEWClkgsegTqPX4VRkQ+YqmrETxXMlLRBEdi1bkz/IGtjx0o91b+wJYcuK
	sPhPucL50RZXSVnp+PS/4cRfnQc6ZTyN4iNjmr1lG0K6+NFPpSVYKOj2nHhnUXs61Lrm
	aDZV7zdTaVEj1bFKPb4rfbQw20skfyw0CTYzaFPfLeOP2YjH2lWca4zCv7Z0dSj2o0oC
	/7F8QaCB1tXoKQ9V0QQ1G5nE7sz7CqQ2LgiHVX1oL+hHI2086NICm55IF/if8UrTfpkw
	+CsA==
X-Gm-Message-State: ALKqPwd/cZcJrpxgZqeaj+WOoFyAwg9nViOx3sBp87ornR/tXdzFBvFX
	AjMiwed5s83C6UbNUDpLIqdx6eo7jf3zA2JHU/MvKw==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr15678575oih.80.1528219664929; 
	Tue, 05 Jun 2018 10:27:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 10:27:24 -0700 (PDT)
In-Reply-To: <20180530180120.13355-15-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jun 2018 18:27:24 +0100
Message-ID: <CAFEAcA_x8ojrswLGUwJ7iJ1voQf1Mr7qexv0NvnYRdfkanAUeA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3b 14/18] target/arm: Implement SVE
 Predicate Count Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kw+qLrj72wQH

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |   2 +
>  target/arm/sve_helper.c    |  14 ++++
>  target/arm/translate-sve.c | 132 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  27 ++++++++
>  4 files changed, 175 insertions(+)

> +/*
> + *** SVE Predicate Count Group
> + */
> +
> +static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
> +{
> +    unsigned psz = pred_full_reg_size(s);
> +
> +    if (psz <= 8) {
> +        uint64_t psz_mask;
> +
> +        tcg_gen_ld_i64(val, cpu_env, pred_full_reg_offset(s, pn));
> +        if (pn != pg) {
> +            TCGv_i64 g = tcg_temp_new_i64();
> +            tcg_gen_ld_i64(g, cpu_env, pred_full_reg_offset(s, pg));
> +            tcg_gen_and_i64(val, val, g);
> +            tcg_temp_free_i64(g);
> +        }
> +
> +        /* Reduce the pred_esz_masks value simply to reduce the
> +           size of the code generated here.  */
> +        psz_mask = deposit64(0, 0, psz * 8, -1);

isn't this just psz_mask = MAKE_64BIT_MASK(0, psz * 8); ?

> +        tcg_gen_andi_i64(val, val, pred_esz_masks[esz] & psz_mask);
> +
> +        tcg_gen_ctpop_i64(val, val);
> +    } else {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
