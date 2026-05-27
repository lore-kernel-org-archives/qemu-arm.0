Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1BCCD5BD5
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 12:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSDnT-0002oN-1d; Wed, 27 May 2026 08:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wSDnR-0002nd-7d
 for qemu-arm@nongnu.org; Wed, 27 May 2026 08:55:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wSDnP-0006K2-G5
 for qemu-arm@nongnu.org; Wed, 27 May 2026 08:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779886538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOYLvELL4pA+7Ly7GPZaewUIz4EzT8B65S7XSvB4MuA=;
 b=BokUMt7ziBnPAAq4E5WdfCbkpIUU0XVmR4qN7gUoDKFjQ9p4I5/atviua6KjE5NPtky05G
 spx737H89F7dVqtlYhU2aFWlDBt1w3kjhD/ES+PmvnfELqIpaM74uimc72ORDTatIsGTYI
 j03behZTSsjVzk/DoJZB3TOQwXrjy84=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-YNjlcUgCOf6YELZeNRJA-w-1; Wed, 27 May 2026 08:55:37 -0400
X-MC-Unique: YNjlcUgCOf6YELZeNRJA-w-1
X-Mimecast-MFC-AGG-ID: YNjlcUgCOf6YELZeNRJA-w_1779886536
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-44a52d5e572so8070648f8f.3
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 05:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779886536; x=1780491336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MOYLvELL4pA+7Ly7GPZaewUIz4EzT8B65S7XSvB4MuA=;
 b=N8PADBZhffFEK1Qu/hin2YyVcTDFGczCptgJImko2ghKbvbLxLfsud2wNBvR/qOlkz
 x2XKPu3f8mJVhCmrL3ZfL4mOGp0ZcIVaC7py7Tdz5jQEgxx8O+81q5kshRp20lSEFx5J
 p3QaQuN8metzPZZTFQ9BFHp80ug+wLiP6n1BolcrEY27VgHYvfocKvpydroy47AaazOR
 V8gm279F7Qk0KqiE5+wL9UNuQ146+F2FM9dqmCel8m5MoxrGu8LR9U7Ti0Vollj/0n8z
 GFL+mZ/wqqZa9hOhembZpqjxUEaApKVRRUZi92uhx4U/+GfcY11l2sVkT2SHnPxOtx2x
 1WEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bCg8sdyahRhq0fTArz1oz6lzUeRJEk+2qAftcgdV14qvMDJPWeNLIajFprp/6NHU3tXYZVbVgyQ==@nongnu.org
X-Gm-Message-State: AOJu0YxXzA2EC8QP3ZgnM6KEwgpzNgcdvJ0fEdMJWrI0MwUs6GWQ9XO4
 XO+5s5PyWnataxuE8MNqh/4RfEESsvmXMJZGNB1wgIApQ+04MWCgV/bXbQYJgLd1xpy+U4W0ori
 x78M1chvpnPDLmkB4mt+3BkRRmdkDZma7VYU4laRvR/cJR9Lyg8pBlA==
X-Gm-Gg: Acq92OE/DQoNroYGMXSKFM5ID3l2a2MDRxr5P8OFKq1v0+Tk4RGVQFkYMixw8Tq0GEn
 1HcmstTv2tBV4vdf/ZxvDFB159T3/ASD42Jls5PCvZKPlGG5eINs45bo+7twf9GI5E2RxQzKuKb
 RvhPyg80vP4UKaxs2lZrm1HBiuDus/VqObfO2Llwee6HlRVyu7ghRlfafcPwf6Cpql6nh44thyy
 pbM3Ll6vSL7wmN1WjOre2CcekOVzv09b9vTctu1b+06SdrDXpSWyR1QsgzXf4Ws/J8KnswfR6GJ
 K6KRsJHlGKNYLPi/aTqYiITxDJCVVzBn/o7BXczgUhwpdl8PC+OJuUsAm7xg36z8xFGiwEjcqz2
 agNV/uIcRLgItGJ0C
X-Received: by 2002:a05:600c:4e0d:b0:490:5655:8d3f with SMTP id
 5b1f17b1804b1-49056558e57mr314938735e9.28.1779886535827; 
 Wed, 27 May 2026 05:55:35 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0d:b0:490:5655:8d3f with SMTP id
 5b1f17b1804b1-49056558e57mr314938135e9.28.1779886535379; 
 Wed, 27 May 2026 05:55:35 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561f682sm417660345e9.13.2026.05.27.05.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 05:55:35 -0700 (PDT)
Date: Wed, 27 May 2026 14:55:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 philmd@linaro.org, zhao1.liu@intel.com, rad@semihalf.com,
 leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 10/21] arm: sbsa_gwdt: add 'wdat' option
Message-ID: <20260527145534.7e96da78@imammedo>
In-Reply-To: <e443a026-3511-46f5-809a-7555789d330c@redhat.com>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-11-imammedo@redhat.com>
 <e443a026-3511-46f5-809a-7555789d330c@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YJcDLY5zDfPnWq98iIRGW5PClkak2w1x-qgQVkUvwNM_1779886536
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, 26 May 2026 16:24:59 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 3/3/26 10:25 AM, Igor Mammedov wrote:
> > it will be used by arm/virt board, to pick WDAT compatible watchdog impl.
> > and act as switch over to WDAT ACPI table vesus default GTDT ACPI table.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/watchdog/sbsa_gwdt.h | 1 +
> >  hw/watchdog/sbsa_gwdt.c         | 8 ++++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
> > index 307a4f291a..dc77e6be60 100644
> > --- a/include/hw/watchdog/sbsa_gwdt.h
> > +++ b/include/hw/watchdog/sbsa_gwdt.h
> > @@ -73,6 +73,7 @@ typedef struct SBSA_GWDTState {
> >      uint32_t woru;
> >      uint32_t wcvl;
> >      uint32_t wcvu;
> > +    bool wdat;
> >  } SBSA_GWDTState;
> >  
> >  #endif /* WDT_SBSA_GWDT_H */
> > diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> > index c4dd8005b7..40d80f7f2b 100644
> > --- a/hw/watchdog/sbsa_gwdt.c
> > +++ b/hw/watchdog/sbsa_gwdt.c
> > @@ -265,6 +265,13 @@ static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
> >  
> >      sysbus_init_irq(sbd, &s->irq);
> >  
> > +    /*
> > +     * WDAT supports only upto 1KHz resolution,
> > +     */
> > +    if (s->wdat) {
> > +        s->freq = 1000;  
> where is it specified in the spec?

next patch has link to WDAT spec and
comment around relevant field:

+    /*
+     * WDAT spec suports only 1KHz or more coarse watchdog timer,
+     * Set resolution to minimum supported 1ms.
+     * Before starting watchdog Windows set countdown value to 5min.
+     */
+    g_assert(freq <= 1000);
+    build_append_int_noprefix(table_data, 1, 4);/* Timer Period, ms */

it's the hack to make gwdt usable for wdat and is applied only when
wdat is enabled, if not the gwdt is instantiated with native 1G and
provides corresponding fdt.

> 
> Thanks
> 
> Eric
> 
> > +    }
> > +
> >      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
> >                  dev);
> >  }
> > @@ -276,6 +283,7 @@ static const Property wdt_sbsa_gwdt_props[] = {
> >       */
> >      DEFINE_PROP_UINT64("clock-frequency", struct SBSA_GWDTState, freq,
> >                         1000000000),
> > +    DEFINE_PROP_BOOL("wdat", struct SBSA_GWDTState, wdat, false),
> >  };
> >  
> >  static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)  
> 


