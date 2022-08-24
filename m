Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2191149ejc;
        Wed, 24 Aug 2022 08:05:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69kQKNYp4BMkdAyiQw2ckohody54irTZMeAdiOLWht0lQZqc74oW5szOwNSfTSqPwf9tBg
X-Received: by 2002:ac8:4e4f:0:b0:344:a6db:1b58 with SMTP id e15-20020ac84e4f000000b00344a6db1b58mr18491291qtw.38.1661353546678;
        Wed, 24 Aug 2022 08:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661353546; cv=none;
        d=google.com; s=arc-20160816;
        b=C7q6lfwUxfNpxMYpmF/g/WS3Wphxlc8zieVmIgcETfUg5kezsClqNiLLDVpb28eC7z
         dA5KS3zDd1dTLKPNno6ooM8ndFGDwva7M9BE7g6CyLSVocFzhRxfSyptuG73WXSpN2hE
         wI+fv94rDVOegExwak+yFoFMDJxj31psi4KbclZpodwRNFL2QhdyZPqZKbpj7BQ1Ybwh
         d6OPJOLekyNsTTqK6q4ulN0yIHoVvAyfD3G1T2DSqh2D+VBqFFV1yDlZG6ykLhjRx6CF
         sFfG2sdi5PbrsQe+oN/+p06w+TF/GmqT5D+RNqug5f2r0ZsXuvHZoCZMcv+GCTfnVXNq
         L4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
        b=a7uQiLj8uSunySBgI6tJz7oy8hubsnbgOy/adBTjDnCnh7oQZsQONHm4LHOJ2W9Hao
         LcMaMs0ffn2LtiD5uSRl79kJ6wjKr7NAPPNG+efmtnmlSpi/XLMGLcGkvy6CH9bpqFhc
         x7KerBhoLgfWXAvEfDD37ivdIrfOciKEYzBrDi6CyTCa7u7QNB7gu5sm0JIQHA2dxcbJ
         tmVu0Xhp+04/PV9sd+fyvjW4f15tpqirnFUXXMDpzzt/Kkm/dgwPHOcWyYPxAAARoK81
         Gl9IDJGf0YuYBSZ6iR4vcZo2tiGHVHO3SpcAw4I72XnY2ZQbst9ayr+bgUTnbMrigfnx
         50qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f51GdF9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22-20020ae9ee16000000b006bc5e44e81esi547894qkg.273.2022.08.24.08.05.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f51GdF9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQrww-0005Hv-2N
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQrvy-0005FW-2C
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oQrvw-0002VA-Hq
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
 b=f51GdF9QHpRDSneSE1386QIoZU1NUYAQUS5zMHbCeLfw4w8PHjUflJD7OpBQA6W7IH/jtZ
 BoCP1pHymDM5YEtriRcEjMETqkxzb+GAkdpYVqVzo3/aOsT3/yULiF/Da0mCJ/xx1vrZSt
 WAffoebVNwM8fCh4k1FvQdzOFZehI4Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-DCRAB01dOnC0XgvSMmNqJQ-1; Wed, 24 Aug 2022 11:04:38 -0400
X-MC-Unique: DCRAB01dOnC0XgvSMmNqJQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 v14-20020a056402348e00b00446946ba703so7009239edc.23
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=DygX394yRU1lO1BRSuzjyUMyRq6T7dOHcsoaCycCb2o=;
 b=wpymeWy7jO9JOx6xI8r71nqdBppp0w4dF/XOCIBn6sXDT/JZXt/X1M8pYz8NGD7sxN
 cmdQsEHWnACtB2QySAJwos0+7MGEkSRPq7lldPqU0LDS/7P4YeSIkZrU7fF6MvSav7uc
 Et2fDqosRRLEMmF6h8y1etbzewNdPlB4GwQz/wmrUhb11V5CgB3pOu3c+7hz95/DaliY
 6CM4gONyO7+ZngnFleqGmgkUc64N4DkplkwzugmFKVf87eMtdyxVrzAiD12LmdKk3bUI
 VCzM6C+NR0QQU1joiMLeMPmP9NeJKh4ff5OQxhYEJ0G67PVtmb5gEEyNmvQvRjSidmDr
 uC+Q==
X-Gm-Message-State: ACgBeo1jnxTJaYPzIgRMIC7Bi+Ol/IPcpzkA/+EuYO4Eu9HHQ8iIg9Q8
 1RbTObG7Y73ck4CyCrBmrccoc69LE2Z0ZqXNGUYo7URGCF37Q70LAklIBMpUkPTIBmDdV1ROt5y
 fY5tErFUcFiFh
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3171503ejc.755.1661353476187; 
 Wed, 24 Aug 2022 08:04:36 -0700 (PDT)
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3171480ejc.755.1661353475854; 
 Wed, 24 Aug 2022 08:04:35 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a1709061db200b007306d478c62sm1282147ejh.62.2022.08.24.08.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:04:35 -0700 (PDT)
Date: Wed, 24 Aug 2022 17:04:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-trivial@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Eric
 Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>,
 <wanghaibin.wang@huawei.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Message-ID: <20220824170433.7ba675ca@redhat.com>
In-Reply-To: <20220816094957.31700-1-zhukeqian1@huawei.com>
References: <20220816094957.31700-1-zhukeqian1@huawei.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kmwC6a07QfS5

On Tue, 16 Aug 2022 17:49:57 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> Setup an ARM virtual machine of machine virt and execute qmp "query-acpi-ospm-status"
> causes segmentation fault with following dumpstack:
>  #1  0x0000aaaaab64235c in qmp_query_acpi_ospm_status (errp=errp@entry=0xfffffffff030) at ../monitor/qmp-cmds.c:312
>  #2  0x0000aaaaabfc4e20 in qmp_marshal_query_acpi_ospm_status (args=<optimized out>, ret=0xffffea4ffe90, errp=0xffffea4ffe88) at qapi/qapi-commands-acpi.c:63
>  #3  0x0000aaaaabff8ba0 in do_qmp_dispatch_bh (opaque=0xffffea4ffe98) at ../qapi/qmp-dispatch.c:128
>  #4  0x0000aaaaac02e594 in aio_bh_call (bh=0xffffe0004d80) at ../util/async.c:150
>  #5  aio_bh_poll (ctx=ctx@entry=0xaaaaad0f6040) at ../util/async.c:178
>  #6  0x0000aaaaac00bd40 in aio_dispatch (ctx=ctx@entry=0xaaaaad0f6040) at ../util/aio-posix.c:421
>  #7  0x0000aaaaac02e010 in aio_ctx_dispatch (source=0xaaaaad0f6040, callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:320
>  #8  0x0000fffff76f6884 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
>  #9  0x0000aaaaac0452d4 in glib_pollfds_poll () at ../util/main-loop.c:297
>  #10 os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:320
>  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:596
>  #12 0x0000aaaaab5c9e50 in qemu_main_loop () at ../softmmu/runstate.c:734
>  #13 0x0000aaaaab185370 in qemu_main (argc=argc@entry=47, argv=argv@entry=0xfffffffff518, envp=envp@entry=0x0) at ../softmmu/main.c:38
>  #14 0x0000aaaaab16f99c in main (argc=47, argv=0xfffffffff518) at ../softmmu/main.c:47
> 
> Fixes: ebb62075021a ("hw/acpi: Add ACPI Generic Event Device Support")
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index e28457a7d1..a3d31631fe 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -267,6 +267,13 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
> +{
> +    AcpiGedState *s = ACPI_GED(adev);
> +
> +    acpi_memory_ospm_status(&s->memhp_state, list);
> +}
> +
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  {
>      AcpiGedState *s = ACPI_GED(adev);
> @@ -409,6 +416,7 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
>  
> +    adevc->ospm_status = acpi_ged_ospm_status;
>      adevc->send_event = acpi_ged_send_event;
>  }
>  

