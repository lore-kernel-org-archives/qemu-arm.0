Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1805886ejb;
        Fri, 4 Aug 2023 07:55:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQT7DCOtwpOU0n4XFEADazktFMaYcJMTmw5XjX8CwiWWehU13e7LZp/I6aNsihjCDbStOK
X-Received: by 2002:a05:620a:815:b0:768:158a:bc0 with SMTP id s21-20020a05620a081500b00768158a0bc0mr1847502qks.39.1691160951027;
        Fri, 04 Aug 2023 07:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691160951; cv=none;
        d=google.com; s=arc-20160816;
        b=VV++9uYT4P2oNOViHeBmCpKC+Afg5F2xgHVWw3G9zmJ0loKSZZ50kyCmprvNf0qtca
         JbSwbktFOlLOwlxbbzFT3HkYglsYzdAyUeliDSCzfHUdEUCNDygrtEEKtI5QMG8pn2sQ
         1TaaIcZyQCWwPaEkI+BjOpzTXsMTpF8sZ46bfqbY7nWnRhoj4QS++VuX1c5j2v46xEg6
         JL74VTwPF18aDASX6PlkE1GoQoc63eiId0/EfU1LY/S8GdGuz9z8R/1LnWPRS7kjz1lD
         3dkvhoHqozalVbhe3bTXu29ivZfX4HIC2UvvBkFansAjjlwWarAXTZbuYJE7sMCM/PQH
         OQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HgP6h0/ECBz1/dNWRWiP9Pt93RjoL+qixBbdmjY0Sis=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=kVGxSZx6D5IT+RH1/JPa6QznLoFauvtDuwHhfoBYVnZdPj/hxM2nALdnx+vx0FuL/3
         dheZSvvOafJOZjJabM33hFTyikxuRCJApAUS0Dmavm3hZhZKaMPMgZ0/agXq52KjINaF
         9PoW+Xiccoxp8EcnRDUGBzRyCGl4A8jJcyWX3EFOdyUnuGUGpZ+DI+PWJwtroqs+mrC5
         HG6dDtmSEPi7lfer+tHg1BbVhcy6O2BQ4Ch1EtglVUmOy+oobNyKpVUpjQwtBPBFfAUe
         onLk6MESGsBzbE8juuCKjF8uIHLSw/OVDdgQAzEWfuHXcnt2VNkAX5kJYxqmUoHbHC5B
         vL1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pGhB4/yW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020a05620a014d00b0076ca993daa5si1266065qkn.712.2023.08.04.07.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 07:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pGhB4/yW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRwDS-00084m-BK; Fri, 04 Aug 2023 10:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwDL-0007yP-Qf
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:55:40 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRwDJ-0001gF-9V
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 10:55:39 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5231f439968so734286a12.0
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691160927; x=1691765727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HgP6h0/ECBz1/dNWRWiP9Pt93RjoL+qixBbdmjY0Sis=;
 b=pGhB4/yWYptnl1CMKm919QhOYnZJg+LTmB3psCgTd3y1H2jagtLk2ve/U41GbfSdD4
 pu0bPqT7MTURvW4VXQfU9RQg/vqz5YGLo3gKX3lMPEWwMsL8qFpFUH1oRC95eOlMV8cw
 6foUYX4f4sLr38ReH2pUG5LH3iHCvUYabZ7eiSKun7GaVOLV+DIrsuZ/uUuxgrWS2Kja
 fbVUGoOGhtc9kzARyQqfB6g3finl0iND2Vhwbnkubts7znvJwdMGkcZXCKnSUZNfa2G4
 CMEHX0rVQ6eoglm+l+BshgPNWm6vJa3Uiv9whdDhAFJS3wzzwndblAQZTQ4PzIFCvCZE
 dtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691160927; x=1691765727;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HgP6h0/ECBz1/dNWRWiP9Pt93RjoL+qixBbdmjY0Sis=;
 b=c878lmjnEAshhC5fyDme4HQSZC8G/Xtb+xs6weKypXlgZ1L1FHqRPq5Z6o6yaTHstE
 Ksw3NKPfmebnd3zg6QXKoeaKzqwWD9e0dCg0OJrPqDcntxf3OjulLqKcCeWrDnvhWSZi
 NHw0XXIBMTyt1Q8E3vvj8DLfnUbZrKt0d1qZrn8jgZzoLsoCRF+k6FSjSfFO6qaIdgmJ
 DWQ5iF8+HBN1kX3E0l2CeNKJMiUsP8GvG9Zo1dZXm1zHZ9Ht1w/wIh95l/MMi1iR3c87
 rYqEGygEI934GuaFXTZvTWwT9+Qqb6FUSJmvx15trumfMTemObL/abns5WSTgktsitUz
 4Edw==
X-Gm-Message-State: AOJu0Yw6tnb/HOT4HUi6lPGAU7dakSvWN9cmIrVlpV6ZQm2pYh9oyVix
 S3OpPWamNJs93+lj2z2IZdbzVs4yjqISw6AxMu8SkQ==
X-Received: by 2002:aa7:d90d:0:b0:522:ab77:36b7 with SMTP id
 a13-20020aa7d90d000000b00522ab7736b7mr1690855edr.4.1691160926895; Fri, 04 Aug
 2023 07:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-36-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-36-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 15:55:16 +0100
Message-ID: <CAFEAcA83wcKVRcEngEbi-dToiaEBHfhLPuuue_e1URU6WmMfZQ@mail.gmail.com>
Subject: Re: [PATCH 35/44] Add mailbox test stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: l8J38Nd9AKP2

On Wed, 26 Jul 2023 at 15:12, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.c | 70 +++++++++++++++++++++++++++++++++++
>  tests/qtest/bcm2838-mailbox.h | 48 ++++++++++++++++++++++++
>  tests/qtest/meson.build       |  1 +
>  3 files changed, 119 insertions(+)
>  create mode 100644 tests/qtest/bcm2838-mailbox.c
>  create mode 100644 tests/qtest/bcm2838-mailbox.h

> index 0000000000..a81b325af9
> --- /dev/null
> +++ b/tests/qtest/bcm2838-mailbox.h
> @@ -0,0 +1,48 @@
> +/*
> + * Declarations for BCM2838 mailbox test.
> + *
> + * Copyright (c) 2023 Auriga LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +typedef union {
> +    uint32_t value;
> +    struct {
> +        uint32_t channel: 4;
> +        uint32_t data   : 28;
> +    } fields;
> +} MboxRegWrite;

Again, you can't use bitfields for this kind of thing, I'm afraid.

thanks
-- PMM
