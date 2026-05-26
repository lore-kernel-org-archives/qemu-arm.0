Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A127DCD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 14:25:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsiU-0006c8-Hr; Tue, 26 May 2026 10:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsiT-0006aT-7H
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wRsiQ-0008OD-Vc
 for qemu-arm@nongnu.org; Tue, 26 May 2026 10:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779805505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dw8FtCfBiYjKI5wPCVclBnscGdVHt9nmpQs+GCnhfV8=;
 b=iVch0H7xxAVH3U/dg4zis7twnBPaEPGqlnO2WAu25aBCBSO61DAvfyxErtEzKviVcoL2DI
 PbPIUQ4Ot2szdiGgUiijy9bywfxFD2/Hs8LqcfH63KqwMvpbOPRFX7qeDGPOFZDgaxDn/k
 JTdDogFTHxty9bVACbFlE5rzcDXIxz4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-g9vF_8WtPce8bPJplA5--g-1; Tue, 26 May 2026 10:25:03 -0400
X-MC-Unique: g9vF_8WtPce8bPJplA5--g-1
X-Mimecast-MFC-AGG-ID: g9vF_8WtPce8bPJplA5--g_1779805502
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-44696b11265so13147626f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 07:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779805502; x=1780410302;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dw8FtCfBiYjKI5wPCVclBnscGdVHt9nmpQs+GCnhfV8=;
 b=LtbY3KNaeV37lq6yWM3NNUGL3+l/h5rd+pn67QaCziyuo9Gsl1ZAJfrI9cNawhkjnr
 08zowZDqzhocz1jzLJ44qAtgTTl4KyHGB728h2q2OhrG7kALmTYY/LyvIiyDpk1pRPR1
 Gzzq1bqgCpoEXpXiHNWcnN9u9l3igc0XVXd/ywRXKhDpvndxgq6csHbU1NJQm1VnPc0b
 kw/BXsenSOInViPHgXwsfP2+hPswWKEj4kkwfT1FAudQFfbIQo6qVHY26aal0wRusde6
 V9SRhbetNlbFZoubIPmaLCa2tcpXzNK3oeCLHhqiV0NSDBpSnQHxiwPjhCQ5DudkyWvJ
 gXAA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ShEd4K9PtLxT2SgZbljnGOnA7kY2P/nqDXEFV52dgphOj+TVhtFgqZWVpbNk9FsHYQxk6yU6hjA==@nongnu.org
X-Gm-Message-State: AOJu0Yxo38xnU6n6L9t/ij7c/Hs40HyZfQY/BzPMt/zvIFSivDBleAc4
 K7FVBTMf4BfPH9RXiVnowXMZ+Q+N8vIuFUycQHpH8/QkcOJXEl86Ek6vN3Fwq/gJ5ityLWwiyfm
 X4ad+O+38PnPozXStrFeXyQRTgKIPmZaPKnZS5YpoFeOMG1GIxHgeDQ==
X-Gm-Gg: Acq92OGuiPKiurkAfLSDkTPMQgkZXlehy0srFVnRD5a6tWWYx931yW5aeHhVCpu6dqV
 1pl6VKqBSc7L7uSckmoPjmppRPhBr7Gb89UQihugffOf7O9hn9+emYx3XzwQXVQGlazkC4Ir7Oe
 9YDft2H3gNBIz/Cxjq8Mu9QfZcMo7DquC4YMHyTjAF2LuMiRjTEAEN0xWpB/9FQNCw+z2PMlqgY
 LFyeJPTshBycBr1gZQ+KCsXGlbtws6dpHPGmMRYSXAC0EWJklD17QcB1QV2cMEWTUTOEu/ariEa
 IFRFxOQoBwj0+Iepn1DpxzpnaD06ZRDtB+FxEucYf3FyV5wSHRjCErbTag8zcC3H2KLZNYmznJR
 vEOJCgj9lqqZReaWuL8m6qf/lxcPh7O0ycafpQ0v8GUWl0mkt3OHV5CCoGSRg86xs
X-Received: by 2002:a05:600c:4589:b0:490:548e:b854 with SMTP id
 5b1f17b1804b1-490548eb9d5mr201093505e9.26.1779805502062; 
 Tue, 26 May 2026 07:25:02 -0700 (PDT)
X-Received: by 2002:a05:600c:4589:b0:490:548e:b854 with SMTP id
 5b1f17b1804b1-490548eb9d5mr201092765e9.26.1779805501572; 
 Tue, 26 May 2026 07:25:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6c9f598sm36659674f8f.6.2026.05.26.07.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 07:25:01 -0700 (PDT)
Message-ID: <e443a026-3511-46f5-809a-7555789d330c@redhat.com>
Date: Tue, 26 May 2026 16:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm: sbsa_gwdt: add 'wdat' option
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, anisinha@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, philmd@linaro.org,
 zhao1.liu@intel.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-11-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260303092532.2410177-11-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pKvoh9wM9kwqm1i21m5sbBY81QqfM0qj9rjCJJd2eOE_1779805502
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> it will be used by arm/virt board, to pick WDAT compatible watchdog impl.
> and act as switch over to WDAT ACPI table vesus default GTDT ACPI table.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/watchdog/sbsa_gwdt.h | 1 +
>  hw/watchdog/sbsa_gwdt.c         | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
> index 307a4f291a..dc77e6be60 100644
> --- a/include/hw/watchdog/sbsa_gwdt.h
> +++ b/include/hw/watchdog/sbsa_gwdt.h
> @@ -73,6 +73,7 @@ typedef struct SBSA_GWDTState {
>      uint32_t woru;
>      uint32_t wcvl;
>      uint32_t wcvu;
> +    bool wdat;
>  } SBSA_GWDTState;
>  
>  #endif /* WDT_SBSA_GWDT_H */
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index c4dd8005b7..40d80f7f2b 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -265,6 +265,13 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
>  
>      sysbus_init_irq(sbd, &s->irq);
>  
> +    /*
> +     * WDAT supports only upto 1KHz resolution,
> +     */
> +    if (s->wdat) {
> +        s->freq = 1000;
where is it specified in the spec?

Thanks

Eric

> +    }
> +
>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
>                  dev);
>  }
> @@ -276,6 +283,7 @@ static const Property wdt_sbsa_gwdt_props[] = {
>       */
>      DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
>                         1000000000),
> +    DEFINE_PROP_BOOL("wdat", struct SBSA_GWDTState, wdat, false),
>  };
>  
>  static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)


