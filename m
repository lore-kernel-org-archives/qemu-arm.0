Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2806471ejt;
        Mon, 19 Jun 2023 06:19:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7xyn1ph3XcmvXLHW3bO+s5DQt+iracl5U+bUAldSxpW+M++xpG0sdleV/T4A8pxH8suywH
X-Received: by 2002:a05:620a:c0b:b0:762:d986:cd6b with SMTP id l11-20020a05620a0c0b00b00762d986cd6bmr3034671qki.23.1687180750311;
        Mon, 19 Jun 2023 06:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687180750; cv=none;
        d=google.com; s=arc-20160816;
        b=K6n/fPSCdP6JZF9bbrRnCwaSGd9nd82FTCVuN+gqNDiD8Xb9ri89s14ONzAbTvzzwv
         CycsnywRazuUWY+1SPqf9VMCuBSXuCKmlwboN9LlZ68oLPvT+xGg4IN2CvqbheAmr4Dt
         WY5sAVJXHLpPl9NuqKVnqEY5o6XHk/JhjBmev1N6PKyfXkf0DJU+uM8M1vn21e6uHYdn
         Cayhsma09NT+glbxagTbcnOsMdyDek6I3ojoo7eRMkZucELW5tgoXcEpTlGzrH/bfCzJ
         bFh452h/b0olsA6XpNGxjahC2SiD7OzIppijsPf1a9wn+Ucix0m1uRVGa9Goa4as4hr3
         STIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AyWRgUMhVO/00WQZnqs/E/q6+630QHqRJiOo8yLErEQ=;
        b=G+hYqoG0i3KAm/JEQqPiY9TnASoAwmeN1FZPK7o7hcURTDFeF9EJsXIN77qPq9PrOq
         KUV58aJbxcGFBa9YtDhlFe17ktZIbsPBOSUJx/cYCx/iyPtXzFlqlfpfqzB72uDOBzig
         LYejyUiW6N4QENSfoMrKUqiVo5Wd0iQNLHVyOJkyT9guuDeGs8atVovZEmXI9NvWmPRA
         r7C8rpp6e49UjwmH9oMjOmty93bpp+wsiV2uArpzjcqYwu177y1wrZTqxyTjAvQU3FUy
         mbBnO3q8eBYEgiOa/nLOfyo4WRa91NkefVJa21eXi528hyvFtVDn0R/piNBzsR7NLHr/
         gU7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tlx2y5aO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ae9ec0c000000b0076256daf7c3si1190154qkg.728.2023.06.19.06.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tlx2y5aO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEQI-0007Or-Bn; Mon, 19 Jun 2023 08:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBEQE-0007OH-A1
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 08:55:55 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBEQC-00078L-O2
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 08:55:54 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5186a157b85so4983890a12.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687179350; x=1689771350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AyWRgUMhVO/00WQZnqs/E/q6+630QHqRJiOo8yLErEQ=;
 b=tlx2y5aOX1j+23sh6lojTj73DJJR2TZOihYy1JhE4pv6K/34w2zZCcoX6Qz3iZP3Bn
 zZHHQCYViLjn5Es7EMqwsy5yhznxVOw7wgxC/OYYM6a9LDrpqaXKY0VpzWaejySr+1eb
 kVKgM4dx+WkSnwiHTdATVQkD6guIHH9DHeEGl97yTNa/jDfuaeG/pFuY8FmqMwT7NBdn
 GS4IVEqwX9fH3+HUJ0gxMuSK+yQJPExc7NA3sd3Zir2v/3hJfdvi4fWPjOQUjK560NZ4
 O+1LahcKO3Od4bP3nbctuXfbQZfuAp8SEqZy587GR5CE5NWk3GGW55nLl9pLi6nlp7lt
 hl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687179350; x=1689771350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AyWRgUMhVO/00WQZnqs/E/q6+630QHqRJiOo8yLErEQ=;
 b=OVlmexugXu0ENSykaxHDDDDG55Fc7nEMgh0aeOhErPSMwDPeV7JNA0IJ0K1tL3EPo3
 IK9TgbsOPswqC82HecfIcdmP8RnQGuSK2dUmWjBJAhCyvtZM+UEpkkfLlaT2KZwg8Al1
 rZREr07TGueEWFXOB8GORQ2zoGink1Ttu/J9q9fBKMQgT9b58zc4cLouWcelXFxb8S1o
 RSXs+yt3TXUuEVfpZqXgKo9VgXsRJLsqb0LEhGbfehUVV3A9Fr7mfrLaa9meiaQKbHow
 Zij4/mIA+I5voinVDsXJ3C3lTVPk0fq16g3St+Sciqxu/5PYKe1ZhrRYBwwtEeXrEmiN
 GLMw==
X-Gm-Message-State: AC+VfDwPnSLQSiu8GBGsdS0QBQm1DvKC4DiGtuGd2Vowt8BMh0lt+idM
 dKN/a1rtqnk9mahh2xK02g8skkZT/BfC1Xa8K1CWTg==
X-Received: by 2002:a05:6402:1a37:b0:51a:4042:6b0a with SMTP id
 be23-20020a0564021a3700b0051a40426b0amr5264112edb.4.1687179350745; Mon, 19
 Jun 2023 05:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
 <20230606182414.637467-3-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230606182414.637467-3-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 13:55:39 +0100
Message-ID: <CAFEAcA8eGEeMJwUSe5Ok9QvYUReO_awe3-+R5Vbc9MobDc2JLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/sbsa-ref: add GIC ITS to DeviceTree
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
 Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HvCA4i8moqr0

On Tue, 6 Jun 2023 at 19:24, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> We need GIC ITS information in DeviceTree so TF-A can pass it to EDK2.
>
> Bumping platform version to 0.2 as this is important hardware change.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
> ---
>  hw/arm/sbsa-ref.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 1520cd598c..2bd9e370a7 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -183,8 +183,15 @@ static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
>                                   2, sbsa_ref_memmap[SBSA_GIC_REDIST].base,
>                                   2, sbsa_ref_memmap[SBSA_GIC_REDIST].size);
>
> +    nodename = g_strdup_printf("/intc/its");
> +    qemu_fdt_add_subnode(sms->fdt, nodename);
> +    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
> +                                 2, sbsa_ref_memmap[SBSA_GIC_ITS].base,
> +                                 2, sbsa_ref_memmap[SBSA_GIC_ITS].size);
> +
>      g_free(nodename);
>  }
> +
>  /*
>   * Firmware on this machine only uses ACPI table to load OS, these limited
>   * device tree nodes are just to let firmware know the info which varies from
> @@ -221,7 +228,7 @@ static void create_fdt(SBSAMachineState *sms)
>       *                        fw compatibility.
>       */
>      qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> -    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 1);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 2);
>
>      if (ms->numa_state->have_numa_distance) {
>          int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);

We should fold this patch into the previous one.

If we are bumping the version-minor, we should add something
to the documentation that says what the difference between
0.1 and 0.2 is. (And if we can remember what 0.0 was that
would be worth noting.)

thanks
-- PMM
