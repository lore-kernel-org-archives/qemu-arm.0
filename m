Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EC5CD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 12:40:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWZGi-0004NN-C0; Mon, 08 Jun 2026 08:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWZGY-0004DX-H8
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 08:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1wWZGW-0001cB-ST
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 08:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780922379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRnmyyU0jc1FKsuQoMfDeL9Q5YE29PO3wiwZ7cCvTps=;
 b=ZqcRzyqRrXT7trKVvgPyaMvPlbKqfjL9GCaF4q4DxICQvPyuSaGEB3uV+KcMFqTeUj4mDj
 rCD97wM2lgg/TXXyzFO+cR3/1iHO/OItJ4hg2EeT/mYE5KdS4Y/7UeTK867tDFYGwzhxrF
 ckQ4+Sb5uoUOvJTqpYMWungBQF4BwfU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-mzVHzBCoPYqzCG79X_ULPA-1; Mon, 08 Jun 2026 08:39:38 -0400
X-MC-Unique: mzVHzBCoPYqzCG79X_ULPA-1
X-Mimecast-MFC-AGG-ID: mzVHzBCoPYqzCG79X_ULPA_1780922377
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4601c9b630fso1728975f8f.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 05:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780922377; x=1781527177;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TRnmyyU0jc1FKsuQoMfDeL9Q5YE29PO3wiwZ7cCvTps=;
 b=adkz+Wdur6qwvf7459lu/Sp2J8cYywBTcYzxUTY3qcji8EahPka7ksB3v4Eq2i/f1d
 K2gqbNsj6kJaUv5jlB8p7JMfEMFawOjVKvquIc50wNpmwKUWBUCPqx1ye8QbutD8VtKd
 Zvbdkn/psQc0870DvZULrFg3s5DBBOIUIR7j1E4fQlZt4/JuIMoL2vxzUjGaWNc0K2NJ
 Kwkz8Yxt45jeREaHJM+tx9zxOdliJCTlVF6hUT0wmQZu37kLm5dlRlXXdHc8Q2Rygulz
 Fi0SfrQzU1J8bGRShcoQ0oCLsxHMqEHPXBgUPjooDDoP8XmVZ4rYO6gEuXwCX9bDzlAG
 +FyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/wJlfbLtTr2+TKYNwO2wDfz5NAyzTDL5ybjtsobGV246hxBvT5F+erqVRnOyC8iBuI9qTO6y4kIg==@nongnu.org
X-Gm-Message-State: AOJu0YzGb6VW+v4UkN4erqjm3nJ3pkuMaQ8QREyPwIozVd+lHj3ZqOUQ
 Wyj9mCoCU2lEvG3ogG5ioultvejuZ6m2NUuq8ONghdMSOm8BEZbfCWDnPPeYNcaTPxzdbOZVBAu
 DLgk3BmtHu5p5RN4jun883Z9JD/PW9/qRbhuYk/QmTs8Ox6JWFG3ZsQ==
X-Gm-Gg: Acq92OGyU2PIrKJMM+SZgWY4MwFe8+3QAejBK29ffz04pRSRtSpQebVO5e3lPAu1oEP
 3crok9GAqI9or3eW/tFeMn69TcohZVh2XlGii8ZMm4hsd2ZUK0Ziukj94BTPiuH1wT74X3h0qhC
 /u/3NbhWn/uLlllUSkOx2Ttv/BkpK00OLjvpIwpjOJZA2zyO5hWZ8Xat1m4/a/KNhQWF1KbQ2XS
 FM8/ICmIQBg98i/miGLswGLuHuIzyEIzsfBFSRcoZ4D+aeQHHa0KyB/HUiW1xmopodtKRkDCHTQ
 Y0AEjUnh2U1UAtIR2Iz6sdXV8+XoU8/2ERKQafglh8MWTJpojIUt6CSuptQHsxprXKFL3HUMFNc
 Tvc4meWTj+Dw9SJpfSenwhnq9KdomjKqmMrymUK+OHUAKvCwGECUM1NElTsDZ9EN4pDsqZsOkas
 Q=
X-Received: by 2002:a05:600c:a088:b0:48e:5fb8:f80f with SMTP id
 5b1f17b1804b1-490c25f9100mr250971705e9.24.1780922377009; 
 Mon, 08 Jun 2026 05:39:37 -0700 (PDT)
X-Received: by 2002:a05:600c:a088:b0:48e:5fb8:f80f with SMTP id
 5b1f17b1804b1-490c25f9100mr250971435e9.24.1780922376682; 
 Mon, 08 Jun 2026 05:39:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490be1f69bcsm424959065e9.8.2026.06.08.05.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 05:39:35 -0700 (PDT)
Message-ID: <f320e3f9-a89a-4c56-8d0f-a7694ec6ddcf@redhat.com>
Date: Mon, 8 Jun 2026 14:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] arm: sbsa_gwdt: add 'wdat' option
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 philmd@linaro.org, zhao1.liu@intel.com, rad@semihalf.com,
 leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-11-imammedo@redhat.com>
 <e443a026-3511-46f5-809a-7555789d330c@redhat.com>
 <20260527145534.7e96da78@imammedo>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260527145534.7e96da78@imammedo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bIlV4vxRAJIIko5qk0faPJOuC82lAj23rudm5Uz2CZg_1780922377
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/27/26 2:55 PM, Igor Mammedov wrote:
> On Tue, 26 May 2026 16:24:59 +0200
> Eric Auger <eauger@redhat.com> wrote:
> 
>> On 3/3/26 10:25 AM, Igor Mammedov wrote:
>>> it will be used by arm/virt board, to pick WDAT compatible watchdog impl.
>>> and act as switch over to WDAT ACPI table vesus default GTDT ACPI table.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>>  include/hw/watchdog/sbsa_gwdt.h | 1 +
>>>  hw/watchdog/sbsa_gwdt.c         | 8 ++++++++
>>>  2 files changed, 9 insertions(+)
>>>
>>> diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
>>> index 307a4f291a..dc77e6be60 100644
>>> --- a/include/hw/watchdog/sbsa_gwdt.h
>>> +++ b/include/hw/watchdog/sbsa_gwdt.h
>>> @@ -73,6 +73,7 @@ typedef struct SBSA_GWDTState {
>>>      uint32_t woru;
>>>      uint32_t wcvl;
>>>      uint32_t wcvu;
>>> +    bool wdat;
>>>  } SBSA_GWDTState;
>>>  
>>>  #endif /* WDT_SBSA_GWDT_H */
>>> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
>>> index c4dd8005b7..40d80f7f2b 100644
>>> --- a/hw/watchdog/sbsa_gwdt.c
>>> +++ b/hw/watchdog/sbsa_gwdt.c
>>> @@ -265,6 +265,13 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
>>>  
>>>      sysbus_init_irq(sbd, &s->irq);
>>>  
>>> +    /*
>>> +     * WDAT supports only upto 1KHz resolution,
>>> +     */
>>> +    if (s->wdat) {
>>> +        s->freq = 1000;  
>> where is it specified in the spec?
> 
> next patch has link to WDAT spec and
> comment around relevant field:
> 
> +    /*
> +     * WDAT spec suports only 1KHz or more coarse watchdog timer,
coarser?
By the way, in above comment, you can directly quote the spec:
"The clock interval that the WDT uses must be greater than or equal to 1
millisecond."

Besides:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> +     * Set resolution to minimum supported 1ms.
> +     * Before starting watchdog Windows set countdown value to 5min.
> +     */
> +    g_assert(freq <= 1000);
> +    build_append_int_noprefix(table_data, 1, 4);/* Timer Period, ms */
> 
> it's the hack to make gwdt usable for wdat and is applied only when
> wdat is enabled, if not the gwdt is instantiated with native 1G and
> provides corresponding fdt.
> 
>>
>> Thanks
>>
>> Eric
>>
>>> +    }
>>> +
>>>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
>>>                  dev);
>>>  }
>>> @@ -276,6 +283,7 @@ static const Property wdt_sbsa_gwdt_props[] = {
>>>       */
>>>      DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
>>>                         1000000000),
>>> +    DEFINE_PROP_BOOL("wdat", struct SBSA_GWDTState, wdat, false),
>>>  };
>>>  
>>>  static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)  
>>
> 


