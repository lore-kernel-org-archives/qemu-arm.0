Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp398619ejy;
        Tue, 21 Nov 2023 03:32:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMwbHGqS0DlKrdemXKgGdSXjISVgz80E+MYD8wzkbNAk9yBNd89PCoE6Pw2WM3iX5a4Jhk
X-Received: by 2002:a05:6358:5e1a:b0:16d:a0d3:d285 with SMTP id q26-20020a0563585e1a00b0016da0d3d285mr13322721rwn.18.1700566348967;
        Tue, 21 Nov 2023 03:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700566348; cv=none;
        d=google.com; s=arc-20160816;
        b=ycIGnP+JfsVVC1mug0HSF5GQEtoPckuwNLb1qAZlbGKSIuOEGa6OYhxjvEYld8s4Y2
         E3mOu1ppf8j3t+Ct1arIgxEImZ9kvDHZP+ZtI0z8fPVwm1hZ8lcroSn1TNvQMiDQ0ewk
         3T6/J47zwJY1Oyk7diyS6T49eCv+ixGaFzCapb01wSFmAAlabn367frIpDS8/LTL2hGO
         /GIujKqtvPCXDXSVSuuPXrbbD//NKjo0naCe0fUMpPYXCflfedojkUV2UhGgBz9wPUNR
         fr6fY5HbHrZ6zTn99m3OnZ16xd9TM9wsSKiWiw8FnFCw744cshToMbw0SGEWbuhSMm3v
         Vbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hY2aGxpeVJsT0VErWWSEtagjKTuIsspwi6gCRiPrujw=;
        fh=pODzPtP5vkqu6viCOmJj6TaCO1xbYuWlUc0Y8bYJVRc=;
        b=aoeH+Tu0Mb27Vx74ZQLiWZRfNuGtv4k54a6a5BejMQpS6e7loIci5WPRjo5PxgQCVq
         7WOu+EFnIM9giaMGVtn68eeX+eSNlaHOWLHdGPUeNGYJeAbutqQO0khYCnTvLkwsVDfE
         z4Hv8Ot7TBqxDhezBAgYaPsuBT/+t2l47QsgHgHhXEGE1VrMZUth62qn2UonaFKZpAIS
         D6lh81nwic8Z++uTQMZJ8ZbcEinBKcCeUCq8rPb0d/3C8LQsDyF2S5jKK83qBvi7E9cS
         51GBnLOtUJudXRnzEOasM8E6rEtXa0V4VBQ+4T89UrWQIHAloiORulDtKRBIZQwZ1QeJ
         5usg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V7JSNzmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl18-20020a05620a1a9200b00773e066060csi9437591qkb.296.2023.11.21.03.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 03:32:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V7JSNzmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Oyx-00033b-SO; Tue, 21 Nov 2023 06:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Oyw-000332-RU
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 06:31:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Oyt-0007Nc-TJ
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 06:31:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so2219009f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 03:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700566309; x=1701171109; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hY2aGxpeVJsT0VErWWSEtagjKTuIsspwi6gCRiPrujw=;
 b=V7JSNzmthuFaGOaWx05CA69HIaO/7bg3jHxCEjJzWvlagotzOll5KoC+E3bmohKWFd
 eFHkDX4dzzqN6DLTEmo2LwhmkcubAXiG9lCJcrY/s6NV2NzC1nYhA8o+9tUEQpWL7sQG
 K9yhbO7MgWgQmZAirm6k49L4C9IIFefRVaQPzm/u8asUR5u95rgx6zjLPP2kIyw9WtU8
 hDmkKRXgw5w2BOnyhXhaJ5Geuj/qwCtxlReicZfY/XlKZYgWYiQCySToYm7ZMsX3hz6b
 umJE04Di88ET4iQKvMJ7zvijB/V00TkJUk5UYzyrxx+OM0xP8c+D5jLNggqdHy6VTvII
 Ykvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700566309; x=1701171109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hY2aGxpeVJsT0VErWWSEtagjKTuIsspwi6gCRiPrujw=;
 b=qq5tNFuyrR1u/yNc4MRpYhkrIZcQCuhKQK9PWGElw3/kBAGePEH6L+MFQIDPqptIg6
 vU/D5xhwgdRu8CXl0PnS901bNKhPyJ7HpvbLmAPhUyAVLzue4br6sFhiN9ot/69//Zmc
 gFK3Ky4NXBcyjicqmSyS9D+YTVl1jgXewo4VCT98XZAnebb1W3dcckhktLaYr0jWAAa0
 eTPYffkAr7G1bxv9HEgTpwaLJ3guqNhp7lcYBApVfef/1xLRp5IqxqmT+YrmUKm/v7tn
 jZnlDz5hfRRZfA5lH3mLulm/zDrlI6Ilr9MzBAFZrWEWRSpGrfcLUwik3s6Lk0K5neRy
 ctQg==
X-Gm-Message-State: AOJu0YyRfDQShsA8ENkIYINvC3VvDLKSlPUjWFaSNRuIUdvlXWfbbOQn
 H4VwWNjYnQb+oHhS7Kxz+rYE+Q==
X-Received: by 2002:a5d:6c67:0:b0:32d:d973:b546 with SMTP id
 r7-20020a5d6c67000000b0032dd973b546mr1826159wrz.0.1700566309474; 
 Tue, 21 Nov 2023 03:31:49 -0800 (PST)
Received: from [192.168.69.100] (lgp44-h02-176-184-8-219.dsl.sta.abo.bbox.fr.
 [176.184.8.219]) by smtp.gmail.com with ESMTPSA id
 f6-20020a7bcd06000000b0040a463cf09dsm20797127wmj.33.2023.11.21.03.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 03:31:49 -0800 (PST)
Message-ID: <954cf4a9-ebdd-428d-a703-4fde1490db71@linaro.org>
Date: Tue, 21 Nov 2023 12:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 22/25] hw/sparc: Simplify
 memory_region_init_ram_nomigrate() calls
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-23-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231120213301.24349-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9/ejO+TXNkbZ

On 20/11/23 22:32, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
> @@
> expression mr, owner, arg3, arg4, errp;
> @@
> -   memory_region_init_ram_nomigrate(mr, owner, arg3, arg4, &errp);
>      if (
> -       errp
> +       !memory_region_init_ram_nomigrate(mr, owner, arg3, arg4, &errp)
>      ) {
>          ...
>          return;
>      }
> 
> and removing the local Error variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/sparc/sun4m.c   | 20 ++++++--------------
>   hw/sparc64/sun4u.c |  7 ++-----
>   2 files changed, 8 insertions(+), 19 deletions(-)


> @@ -631,11 +628,9 @@ static void afx_realize(DeviceState *ds, Error **errp)
>   {
>       AFXState *s = TCX_AFX(ds);
>       SysBusDevice *dev = SYS_BUS_DEVICE(ds);
> -    Error *local_err = NULL;
>   
> -    memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.afx", 4,
> -                                     &local_err);
> -    if (local_err) {
> +    if (!memory_region_init_ram_nomigrate(&s->mem, OBJECT(ds), "sun4m.afx",
> +                                          4, errp)) {
>           error_propagate(errp, local_err);

I forgot to remove this error_propagate() line.

>           return;
>       }
> @@ -715,12 +710,9 @@ static void prom_realize(DeviceState *ds, Error **errp)
>   {
>       PROMState *s = OPENPROM(ds);
>       SysBusDevice *dev = SYS_BUS_DEVICE(ds);
> -    Error *local_err = NULL;
>   
> -    memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4m.prom",
> -                                     PROM_SIZE_MAX, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (!memory_region_init_ram_nomigrate(&s->prom, OBJECT(ds), "sun4m.prom",
> +                                          PROM_SIZE_MAX, errp)) {
>           return;
>       }

