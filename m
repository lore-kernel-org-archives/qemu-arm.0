Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7CDCD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:20:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsdL-0004wh-Pp; Tue, 26 May 2026 10:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsdJ-0004w5-CU
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:19:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsdH-0006Fk-Oy
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779805187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VyRxyxI+z4/HONnlsJTMkCC5rG1G0mOJ4/NX0O6JM4k=;
 b=dDItb8BvvPeIybDCYHu85qVqX6qgQSVQdru28pSwDwaMD7P8NwWzUt0OW+ksNYSe3itwwx
 GLlHwFpt5Q4UYQ5JxCT2DsspiLyEM9y30Hx1XPFd6o64mFGTJawefKQpP8jY18KBZnYKea
 Jyhw0u461/rpeVzKZGGZ360Z3MpPFqc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-jzIroXNZNyuYQUjzbFTkAw-1; Tue, 26 May 2026 10:19:42 -0400
X-MC-Unique: jzIroXNZNyuYQUjzbFTkAw-1
X-Mimecast-MFC-AGG-ID: jzIroXNZNyuYQUjzbFTkAw_1779805181
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fde68e420so83978195e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779805181; x=1780409981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VyRxyxI+z4/HONnlsJTMkCC5rG1G0mOJ4/NX0O6JM4k=;
 b=RKLaFBr/JFZWD7zXyF5D+cmznA5zu5TNBgF/GTVZ6xYiFlgcj0net1hzOxI1NWP6fG
 0q66RwzKeQyu8WZT4YaHTljZ6Qf4V6Y/1mUtjBeVUYiddNjSd9PItSW7tLIacOH4ROLU
 1nKJ8Dj4IwgNJTGBfC5MxvHbYWQQW39s+wxliErrozxBahYJqtXzE0twFuH/KHyPNjee
 fy86TIWO7Ki8nSlWlVZnKODpCH2BzDMdVmCVDg6m5blSm1LGYnrwYkdM6X+0J3JqbKjm
 uV7blQEsX8Soqli6zw3lOaoBH8M2TUfACRjbxePNL4tWmOqzPivkMSi6XStZL5CHLFj1
 fElw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Fyk+hih9Cush3kwPSTXNLnFQLFSxVfSoIHs2wRomqj1POa/DzqUm6RHpuYRqeFOfLa9V6FTyCQw==@nongnu.org
X-Gm-Message-State: AOJu0YwFQo2r69GVmS58AQQXEJkmJlGlT+Wv8c4KlP7NrfPTj5InF9or
 uQF8+enIWEdTsriCJbYQC4Al9sHTAVXbHznF+Ler97M5GbJD1V99czLjBICAonZyDr0NTqKDSIK
 rrGXqjZ0VHXdQM85nKrn1j9cMZKat0YDwWuLjxAiab0ySG4cugO3RaQ==
X-Gm-Gg: Acq92OFVV3z8Q2MS9cpGyPEVy6Vyun5EUHiaHGiKiBST1DA97P+EblZhsm3pj0Ng+SD
 l+KIemmM7cZHLY9zLWVQSrfzben88YRBmEFY9JOmW3dkZXxJzAo12Ej4/gPHMDCVXaV9cnlxal7
 K+KMY3xK6/lCuvjpT3DXAWVIlVmcBQxFrIDd1bQH4iXNuC2kso/BjvFP4aVDr7TxjPjRpu7ifvQ
 kGW1Z2teWjJbqVXeA+E/ek5tiv3tzcYkNHBwJlt8WmaYkv5mwlI10zFOmumbMUjpdnfoiIHfHWQ
 LdWlgbtmw5RFlAeTkxdq/fsQ03mdcyZtWH1bMjqWAlsWPAN/id3bmt9FDDQ2dTpyJF1jpO6P1B5
 ZsTw9vd8jAm8aHIxiHZg9DzTJpvWP40xS9+mAkchf7szw95qUB4ky5OJ0F6Z237lQ
X-Received: by 2002:a05:600c:1d25:b0:490:58e0:f466 with SMTP id
 5b1f17b1804b1-49058e0f614mr218945955e9.33.1779805181013; 
 Tue, 26 May 2026 07:19:41 -0700 (PDT)
X-Received: by 2002:a05:600c:1d25:b0:490:58e0:f466 with SMTP id
 5b1f17b1804b1-49058e0f614mr218945265e9.33.1779805180507; 
 Tue, 26 May 2026 07:19:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526c926sm584181715e9.1.2026.05.26.07.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:19:40 -0700 (PDT)
Message-ID: <ecc7cb66-791e-4d8b-9c3d-f172bfaf83d3@redhat.com>
Date: Tue, 26 May 2026 16:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] arm: sbsa_gwdt: fixup default "clock-frequency"
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-8-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-8-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yxnB76nCEwsjsmsbW4iC7bahUj8dKBdHyAqew55KGHs_1779805181
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 3/3/26 10:25 AM, Igor Mammedov wrote:
> Comment about keeping legacy freq, is wrong to begin with
> (should be 62.5MHz), but that value also doesn't make
> sense anymore as the watchdog is used only by un-versioned
> SBSA board and the later has hard-coded it to 1GHz.
> 
> Other potential user (arm/virt) also has system clock at 1GHz.
> 
> Drop misleading comment about legacy and set default to 1GHz
> to match both boards.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/watchdog/sbsa_gwdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index 7ade5c6f18..b739a3ce3c 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -264,11 +264,10 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
>  static const Property wdt_sbsa_gwdt_props[] = {
>      /*
>       * Timer frequency in Hz. This must match the frequency used by
> -     * the CPU's generic timer. Default 62.5Hz matches QEMU's legacy
> -     * CPU timer frequency default.
> +     * the CPU's generic timer.
>       */
>      DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
> -                       62500000),
> +                       1000000000),
>  };
>  
>  static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)


