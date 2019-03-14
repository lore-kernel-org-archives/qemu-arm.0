Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1098660wro;
        Thu, 14 Mar 2019 10:21:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZ40y+ly7qznAxGlmCu0uy3arUzMTnLezI4ZYxwMY7QRPCCIWd/a2je3Z9UJVKbHagMqXb
X-Received: by 2002:a81:4991:: with SMTP id w139mr20162338ywa.14.1552584095405;
        Thu, 14 Mar 2019 10:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552584095; cv=none;
        d=google.com; s=arc-20160816;
        b=N3RVAMUK1wQ2grZfCIyqiDnuGDWsZLFU55HLDK9cs7/YoSbXedPi+NPKwAqenfs+/e
         DQCOvwDm9F/WHlyewlQgtFBOTKlOS8yMzxAdif0FsBYr14NAPAn+wCMCFzKJ8csDjmI6
         XaEBeji5w89Cp7+a6DCWRFV9OcEEHkUNbtH3i1qtNLpbUrOzt5Wxn6zK9bBcwHxdtm2p
         NN7Gwb6KJ8zvRBK4xdxpiphrpApq3qqbJNI9x1NpNRZJI6FpKbbicFoFi6OGDccsImdd
         31fJkihkhZzkCRDkhpb3LJbZllqJGchHM0Ft+AMuH7K2TAv/nDKEwz2iqsHB25CJHapk
         Hf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JOXumHjh8EE7Eef4Pe/DWzHaYqh64xsFqGhiWwr7mm4=;
        b=LCWgA18YDoE2E5XCRz6IzGJsbOah6Z0Osezdgg/SrSCE8Ofmu7ajc5EsWHlV31DTFh
         tgZK0DE7L5VoqabWeDAsSLkCkUctjDfULvL7drThyCPHwIJBThN6EZZBFmr0gh7i3L0U
         b0wW2JT4RpnNN/RbxsVjWG6r4Fqd3LAm1Nl5kQOvvnxKAjKk/PRvPfPidJg94Dk3reTf
         XlrnGyEdHJ3PEH4QauUh8DlVee5USSM4p1g42hmPLWWFrwUJiAO3cvEJT2FO9Oat754i
         wbKLLFg9savoGff82ey4PpGoTPAV16polixw5Be43jOU83G8kod7A9+kVIb/dK+XYddK
         ok5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qv+XxALV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a200si8852127ywh.365.2019.03.14.10.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qv+XxALV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4U2w-00073X-QL
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:21:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4U2d-00072G-Rl
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4U2c-0005WP-Mh
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:21:15 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4U2c-0005Vq-BV
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:21:14 -0400
Received: by mail-oi1-x244.google.com with SMTP id k11so5057812oic.7
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JOXumHjh8EE7Eef4Pe/DWzHaYqh64xsFqGhiWwr7mm4=;
	b=Qv+XxALV+VzJktNVpY35tcNhgAFMadqw1wijxJJXrK/4hyR7RLdA/QSeGOlrsAEqCx
	P/RoFYVwtVk/zTtxW8FTvxCsAfYc8nypJBdw4sxfhjHvBmQd1WHEue3g8cwiq8t1DkhR
	I2UcRvT9aMy+40w4Tovp/70HmQrh4D1WXNq/GayhS3+RbIEW3I2jMROOHx5rJIT0+gvr
	bD6UCGvyp7Zsm6d2ERGuGBqNcNj6oWBJFVZQN44iB12696EgCeFQiJYBq0cnslT6xIqD
	IeLC76MdNAF5sp+wKOvq6VMfVRFtb1r0p/68Wjt64UoT2vH+ExpZGQcUJvONEg0VGbk5
	W8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JOXumHjh8EE7Eef4Pe/DWzHaYqh64xsFqGhiWwr7mm4=;
	b=oipkSOm3NKxHVfUcRmkez3Wc5fdE++izI4BZVjws7KgG9/rHtU7aTuxGgi+lriek9D
	m651TMWxVhjaWnfFaxIshQS6V/l691DEz8yxQgUD00S3e1WNm+1d6+Np8tPzFkDDycRF
	/tbl6H5CV2SI09U7HNgT/YXMDfvHCLJLKEz95cA4kbOJoje/29poHRlMyI1W2TpaL7yr
	+igZQbzqN2P86PxPrMmWP+RIMbczs0HqmZ28G5gfGG5IuDQTWzjPMhKT726gZhkqW777
	kLZ/qc/Bv9u5DNBvq3XMXGLu288uuLxCKXgckux4ZcHvWQYzy43DhI2XyszA1vrsLStg
	FEqA==
X-Gm-Message-State: APjAAAX+J+bQDp0ZqcB7Wugl0wCp/kDN+4U0SCjhir9G68yn8iK+sV2C
	HHn2d/LlgCvcquNVMbs9CPRh/l1Frx/TCfQsF3dHsA==
X-Received: by 2002:aca:4c88:: with SMTP id z130mr1488664oia.170.1552584073137;
	Thu, 14 Mar 2019 10:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
In-Reply-To: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 17:21:01 +0000
Message-ID: <CAFEAcA8dGr6gPGUcLhMqWKoC7aS40A4NssqFzHiKu0XhRKyE_Q@mail.gmail.com>
To: Amir Charif <amir.charif@cea.fr>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] Check access permission to ADDVL/ADDPL/RDVL
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O5T4BJRHtkxu

Richard, Amir -- it looks like you both sent exactly the
same patch at pretty much exactly the same time. Any
preferences for whose version I apply ? :-)

thanks
-- PMM

On Thu, 14 Mar 2019 at 16:41, Amir Charif <amir.charif@cea.fr> wrote:
>
> These instructions do not trap when SVE is disabled in EL0,
> causing them to be executed with wrong size information.
>
> Signed-off-by: Amir Charif <amir.charif@cea.fr>
> ---
>  target/arm/translate-sve.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 3a2eb51..245cd82 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -943,24 +943,30 @@ static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
>
>  static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
>  {
> -    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> -    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> -    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
> +    if (sve_access_check(s)) {
> +        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> +        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> +        tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
> +    }
>      return true;
>  }
>
>  static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
>  {
> -    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> -    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> -    tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
> +    if (sve_access_check(s)) {
> +        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
> +        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
> +        tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
> +    }
>      return true;
>  }
>
>  static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
>  {
> -    TCGv_i64 reg = cpu_reg(s, a->rd);
> -    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
> +    if (sve_access_check(s)) {
> +        TCGv_i64 reg = cpu_reg(s, a->rd);
> +        tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
> +    }
>      return true;
>  }
>
> --
> 2.7.4
