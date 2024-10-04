Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp570418njb;
        Fri, 4 Oct 2024 09:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXX2v+ebCLqntCmx3npHM8g7zShbFsY6F31Zb4vf0AZZ1C3xJ56n79jyt9jEU47UkPnKNIfnl69ct72TA==@linaro.org
X-Google-Smtp-Source: AGHT+IEizeLQJlhJXlOsYMqJugQrAK1O+JVUS7CV2mY9B2E73wGdC6n3FZa5ilsJjakoyZOtuovy
X-Received: by 2002:a05:600c:3b06:b0:42c:87dc:85e7 with SMTP id 5b1f17b1804b1-42f85abed75mr23164855e9.18.1728060215901;
        Fri, 04 Oct 2024 09:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728060215; cv=none;
        d=google.com; s=arc-20240605;
        b=jmLO3n4nSK14BoeHffIraMYMzs68mpuWfQQ1GhBTzg6gnko+t/uY2pXaUT8DxGM02m
         AHIk2nX6uY/46OQwrX0GrxPNHYiEJHIBJ2OrnKTQfohEP/nxV/7kH6BtAl+MQ614891n
         UcIJcEB92xEmOjrSFcrDJttnAR7rb1qhNAyS/VejYhyA8mD74mQfq5wHLukagTfVNYTv
         ZLPwyvISwG2cWALlAmdMjpsA/4HKfR/ZPefoIalJ1KGpApFoHOr7tuqXe8qRlXUOWCUx
         VZauNji3HzGehaJG36E/44gH3eKFdVQoJO6y7FK+PPHWxozibEBMqNSKxDGmWAbm2nQJ
         1L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=azbDa+uUZgkoiE0nNqqk7LWwWBBMF8y1EYny/ldtwuc=;
        fh=1CUwoan0ZWHnPe6+2IQOV+sO8eQ5a4antYpDmi5+FGk=;
        b=cRaAupIcf9CtpgVgRLHeQjJfgXdp4PbXL4COqYrJ6cpoh+QkbN0wfmyDjtvWF7HJvs
         xdXHS1ns3VfYjVFkMsDP1it6ChkqYDfqR6k37wpGGmBkAG2jbYPfmGIYuY1t8EE36cCw
         B4yLm/E7uGXH9r7rhPrulh2xj+OF5m2nLNedWM4ABGJn1+J6JDNiMFvuMRSzmzk6+xKZ
         x8IXeEUHU7OyP8WkM8AjHowLHihUTNUNnjd+rqp16Yq4qtJsuY6yUh6RpStt6xixPQK6
         hmvCF4I2oxhS5PiM8Zg8u6CdaXosiLtco3loRIlHP5yujlbF3NoDce/ZGMveTTyeyDOK
         BymQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Siw6Xttc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1695ed90si19422f8f.377.2024.10.04.09.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 09:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Siw6Xttc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1swlNa-00036s-Jp; Fri, 04 Oct 2024 12:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swlNQ-0002QP-P6
 for qemu-devel@nongnu.org; Fri, 04 Oct 2024 12:42:02 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swlNP-0007FA-5U
 for qemu-devel@nongnu.org; Fri, 04 Oct 2024 12:42:00 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fad784e304so29934341fa.2
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2024 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728060117; x=1728664917; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azbDa+uUZgkoiE0nNqqk7LWwWBBMF8y1EYny/ldtwuc=;
 b=Siw6XttcNgnP1CxMx7nnE0XZvLzNSTXA7J0GPjMigaOOrjYoZ81UBOEDDals4sokpT
 L3bdbnB19AQKMXW2P1TvdqFMEmnwMlKaQHhHz8H2EvpH4DIasSlFdC7XnK8ttFD53h4h
 vz8ChpB8Hy4kYNr3vR+Up/gASMjDipiFmZVthyKQkota0b1G8LPI163oRejDiY9u0frG
 5Bwv72LGkjRNwhlJwDBixtUsxd9mnb1hxDECmxK64geb+ne/P+T9HlbrM7FjtVyl61vH
 BRUxaE1FmPBUXCsMRNoFxD6J285TluxMoGIn7WoJmE/T2MV9WHsXxeUwgnKP9GOvnM4B
 pcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728060117; x=1728664917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azbDa+uUZgkoiE0nNqqk7LWwWBBMF8y1EYny/ldtwuc=;
 b=K78OBu4T3Q3dUjO1zd6nxiK2TxJUR/fi/+cl30vqwUx1JtynPR2vyBVT8hR0xHePvI
 E922wHhml1Jn851ZVz8Lv5HjkDQATdYSqpgep3YJMUPON3yaOU1veJLn2XLJVr3JdYCD
 4GPf0n8NoTrJMEjHBcYoJ7/8nzOtU+XI+k1b9OXFtOowd2V5foprW1DVtxCQxsrgEadW
 ocrsJtqXV5pIqeKBQVeMd7ucVIsyAv8oJ7GqHqs2q41fkE9sKoZyEk/CrK4/1DjWzwIz
 HZGeM2xbKqur7buDkXDvurWHbnjKooUi23lfewbah6kgaSuRk3kJXDiwrFWfRktiWGrL
 9oKw==
X-Gm-Message-State: AOJu0YyCGyS0P00FZJazlhaWYgesoCaS8NJLReWkluabNydrDRqwHdg+
 a8jU5JHPjlicCjv09LiWoJCWNDnuCK2s19UwGkMuUURdXEpyekGoRn6xCBbpSXJEPyDpp/AdAMI
 NJy8ZlmgSwdTt11uZRjl3XS04vqrA+BIRW53igw==
X-Received: by 2002:a05:651c:220d:b0:2f7:5d53:7196 with SMTP id
 38308e7fff4ca-2faf3c016cbmr23090901fa.4.1728060117507; Fri, 04 Oct 2024
 09:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241004162118.84570-1-philmd@linaro.org>
 <20241004162118.84570-3-philmd@linaro.org>
In-Reply-To: <20241004162118.84570-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 17:41:46 +0100
Message-ID: <CAFEAcA_X38bhELuwwKLPrbfC+vLnwpUHP5RNCDv1V2r69dbJ7w@mail.gmail.com>
Subject: Re: [PATCH 2/8] hw/core/cpu: Introduce CPUClass::is_big_endian()
 handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 52LjLmVJVbHD

On Fri, 4 Oct 2024 at 17:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Introduce the CPUClass::is_big_endian() handler and its
> common default.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/hw/core/cpu.h | 3 ++-
>  hw/core/cpu-common.c  | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 04e9ad49968..22ef7a44e86 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -150,6 +150,7 @@ struct CPUClass {
>      ObjectClass *(*class_by_name)(const char *cpu_model);
>      void (*parse_features)(const char *typename, char *str, Error **errp=
);
>
> +    bool (*is_big_endian)(CPUState *cpu);
>      bool (*has_work)(CPUState *cpu);
>      int (*mmu_index)(CPUState *cpu, bool ifetch);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,

What does this actually mean, though? Arm for instance
has multiple different kinds of "big-endian" depending
on the CPU: both BE32 and BE8, and data-endianness not
necessarily being the same as instruction-endianness.

This series doesn't introduce any users of this new API.
It's hard to say without seeing what the intended use is,
but I would expect that probably they would want to be testing
something else, depending on what they're trying to do.

It's pretty uncommon for anything out in the system to
want to know what endianness a runtime-configurable CPU
happens to be set to, because in real hardware a device
has no way to tell. (This is why cpu_virtio_is_big_endian()
is named the way it is -- to discourage anybody from trying
to use it outside the virtio devices where we need it for
legacy "the spec wasn't written thinking about endianness
very hard" reasons.)

thanks
-- PMM
