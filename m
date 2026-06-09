Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ECDCD98C5
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 15:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWyn8-00053f-DE; Tue, 09 Jun 2026 11:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyn6-000531-UW
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:55:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyn3-0007lT-Pf
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:55:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-beb8a08a6c8so820497366b.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 08:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020496; cv=none;
 d=google.com; s=arc-20240605;
 b=P8VSVw48XUkO1beVs0l5P/jS1FXziKG6H5n1On8rvTwkHcKn2A80Zgetn8Ywhw2MnY
 AmnejdD72EBr278cpxSmJKc2uCtBGjNDODN8/XxSErPoPleBlnOIiE7uGVEah/c9EBBQ
 tj9NtRmB4+7yVGJ1tCAYQf5N/bKOAOGDYuXOjCQ4s/oJtYK7qP4iQWoQhmPbuarnsog9
 JjYJutzhOWN+Bh+Zr7j4olr8oPE2Xq1AyU3H1l6WmEHtQqIuLY3YemeJt61woMe274dS
 q3g319iU2i9Q4jz8Hu/3/wqJZXGfusDAE6Y2i+m9goHmcwy7e5eHwT4DYuiMIqJtkoZ3
 EL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ByLWAy5t3hncFFGF/gnIjagVZZ6PIW3TT14Zn3l0Mys=;
 fh=Y8/+/Ks8Tbgl1vdzJDvCTQfVH6lgjcuFKlWk3pfh3pU=;
 b=gK0kCXLL9JeIZVP6XMPpImEahy0RQKQ/yrxlZFqs1DUI0f4W9kxj1piPOCp7av4r3t
 R1fm6RUX3Tx+tsB2WqIY+dfJvusvTgHqaEfIbkLCdi6NT77/xKm3U1Giel5OME0tE5WJ
 1EyvF1pxqmbbQtVdWc1/umBS+xXpPHx5BR9Fij2j88LeIZA9y3+15MOYQ2KkWywHZfe1
 R9+Vp8XmFXGIVKpjt91akCWZERbobSPvS9yTj+DOp+A1OEL/D0XazN4flSHntBCa9bzI
 aOGbkYGRc58aGMD8IPa+8LV1p9gv+ES5Yn29GS48KtWsTf1i+OzycEVyI2aV4KV3t1yQ
 9e0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781020496; x=1781625296; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ByLWAy5t3hncFFGF/gnIjagVZZ6PIW3TT14Zn3l0Mys=;
 b=dKyc39ENP6zR8Ji15RDAdWuRYjvAEBZNXeEKM6BHGZJsOzvlFMncUEv8DE3Ij35mm2
 hKvCaumhnj5sGvQeWC3wFGZxpz/yGjahIaWVz87phU1gD6TLM5F6guwI3JMIUz1Wmzmq
 IF9nE73S1FnAAL9EXtFXOq3u0lf3WlQ+R0czzdA4fTfH4+C1vOi60x/xTm/rpymVn1rX
 V/mV5XVUTxG6S2qLJhww36fS0fpW9VTVYkqO6nDf+VVVmNMXK42395pIzBeUUuGMzoBZ
 aJyzT4SpSGaQeRFrH1jLq0yDWyz8hd/0Q1rnvE6dGSDcSUAfGmFvrzAHr6Y/d5h5Y3I1
 X51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781020496; x=1781625296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByLWAy5t3hncFFGF/gnIjagVZZ6PIW3TT14Zn3l0Mys=;
 b=UgRYGiURDU07EMyyXMJP+mq2yrEu8XLuSvzLqksCzyCAlM680ZyuNVyGo5wzGydrUf
 TSxWzR1iz5ZjWGADQhDNoIPN4ILUBecx8K7FoxrznGBUzIOLg3n3neRX53KyRaBmTQdS
 Gnlbg5zWUMi6V4+r6NN9bUClHzGX5Ai3YdKA9EqCwaPIbtR9uI2mE45aqtZP3j53/ciR
 vufwEHSisl/kKfP9+CiAQH504fqpbtAf2vPyrqIuKRvOvBf4QIamTWYguR/7Ta6Xomm/
 PEF1TlpdLjU2vpTedyxLZt9iz0fMg/E36tIqPnjqZBz56RzC/Ya8QcJKik3bx9K6yX+E
 HKnA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vL4BCIXX+WD3zilbK+dAggS9hHZFP1WIlsANZlTViZ8+BKNsSXOIkyrDhLjD4kK4izQLrU27kZw==@nongnu.org
X-Gm-Message-State: AOJu0Yzq9/2J49zsr8qsZyHSbJ72xwyz56baviVvMWNYugvh/GdSyyUc
 oSmYi2tjQDF0pCdmTggJUfYODarDSPZBevzYMKv4xr7ULcGpOsmDoM/efWlKqwZhDN+1WK2klWk
 kcLiC7heTtSYEZFHfteV9sZkRMwFbKviv5vrv34ubyA==
X-Gm-Gg: Acq92OGzHJF1W2PvpUt04PHyiQrd0TLMabAlB9duvD00FnqycVbRospzjIV9lEmpgAd
 Q8sRr22CplA91UnJsNZuy7Xbx22Xz9dK61S1AukpwRkVv9+8hRrEINDxt5zGFQ9z0+A10SEE1QL
 g0Hik5S++LnU3wdL1w+mLoV0xGzgBexTCCbMQsrVzilLDIzH8Y0v/jkDwJ5YJ4ikcZ+Gx877Yod
 pYmPzbtAiDWxzybNatmn/vrrnVODTz/Ic07dQibKRjov5+EgowP3Hkx4SWJEGV/Sly071ZTbASX
 OehRSQPg3YiI+S0dbYB0N4qXMoeeKZuPK1vDe0/MdnmeHnKuhLkvTUXUPjIjewUgOc6qJFTrDpc
 BHg==
X-Received: by 2002:a17:907:a44:b0:bee:1e36:876c with SMTP id
 a640c23a62f3a-bf3748d7bfamr1091447166b.41.1781020495385; Tue, 09 Jun 2026
 08:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-30-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 16:54:42 +0100
X-Gm-Features: AVVi8CfbR0tI_-6-sfiGP1TvTIUm9jB3KKTGQqLfcEFJDRseSzjLkt9RmWzpvnw
Message-ID: <CAFEAcA-JMfOMt8qhtXHb-brs-gLUnzL1JuBPNidY0ej-rRoHMg@mail.gmail.com>
Subject: Re: [PATCH v9 29/45] target/arm: Implement FMLALB, FMLALT for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Wed, 3 Jun 2026 at 04:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> +
> +static FP8MulContext fp8_mul_start(CPUARMState *env, int scale_mask)
> +{
> +    uint64_t fpmr = env->vfp.fpmr;
> +
> +    FP8MulContext ret = {
> +        .stat = env->vfp.fp_status[FPST_A64],
> +        .fmt1 = fp8_input_fmt[FIELD_EX64(fpmr, FPMR, F8S1)],
> +        .fmt2 = fp8_input_fmt[FIELD_EX64(fpmr, FPMR, F8S2)],
> +        .scale = -(FIELD_EX64(fpmr, FPMR, LSCALE) & scale_mask),
> +    };
> +
> +    set_flush_to_zero(0, &ret.stat);
> +    set_flush_inputs_to_zero(0, &ret.stat);
> +    set_default_nan_mode(true, &ret.stat);
> +    set_float_rounding_mode(FIELD_EX64(fpmr, FPMR, OSM)
> +                            ? float_round_nearest_even_max
> +                            : float_round_nearest_even, &ret.stat);
> +
> +    /*
> +     * FP8 multiplies don't update FPSR.{IDC,IOC,IXC,UFC}.
> +     * Since this is multiply-add, DZC does not apply and only OFC remains.
> +     */

I think this comment hasn't been updated to match the code changes
following our previous discussion about what fp status flags
FP8 multiplies update:
https://lore.kernel.org/qemu-devel/CAFEAcA_4wU+wndbAqjnObpvnLit11OVDZvTZ1RWy_q0cNfH7uA@mail.gmail.com/

We ended up concluding that we don't need to update any FPSR
flags, but the comment still talks about the OFC bit.

Perhaps something like:

/*
 * FP8 multiplies don't update any of the FPSR exception flags,
 * so we do not need an fp8_mul_finish() to propagate status
 * changes back from ret.stat into env->vfp.fp_status[].
 */

?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

