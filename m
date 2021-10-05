Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4705891lfp;
        Tue, 5 Oct 2021 02:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGycSe9e+pUBbdMJElObxfSWYTqpVndeegtkxPQztUMb5heGiumF923HXM0REZEWSlEk/9
X-Received: by 2002:a25:54c5:: with SMTP id i188mr21108657ybb.304.1633426092540;
        Tue, 05 Oct 2021 02:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633426092; cv=none;
        d=google.com; s=arc-20160816;
        b=IENF6nF6YAlQiCa1S2eFEfEno+QD6wQrRt3Z+c2QiUoKGMCZrhFTNrzXkO1BUiXZMe
         dq73uTChNsm5qxExlfy0Vf/tON/J9NHBZqJoerV52aAoJBo07LL287gjp8Vwnal2IWGL
         4R5mGdbtPCYiCEuiDxiFWA/q27JDqx26BquvuZuCw8FOV1Ap6yuiO7YquQufcgJ+Qt4/
         RJaig7COYuOkarrvykI269QldV4iuXrTD3r97+B9QHNwX46iFcSrHYske3C9JGvE8HwU
         JlgNCT1C3qH96SxIIQrZ+4uRm/P9tqaiyMBpUPjH9pjq7nITr6WaKqqs9Yhk/NrGfTq+
         awmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NutA/OaEonlKr73NV3VU75H2S44oeu7nLXQVMYkp6qQ=;
        b=vgYTC2EZUNezrfF2bg6IZH5QbQHcHhzXuwQwHGIgzixI+yMxUmxOxf8CmTH8Y+JNqU
         LcqCNNgIiZGxtrOMYbT0gcG0/bhnnHODNa1sXgJCsy18Xca8FjTGCNGm7P6InK7eRK+J
         7QQ2XAUMHuwVW4vpw3vCxfA8+A8sOW1P6KTbR6vY0i1XZ08w6obIJYt3/DkoMYWbF16l
         KLmUJCcUPuxxeQfXL2sQzHGl5QblTj/F0wvA4FSzu1Tq7cYcTtA1lgnFkw36HMcL/dGY
         duNdjv4LAGZ1boXWi5Lw/FM+GEUmWXvKZA3EbzBJzS0Vd6oM4WUFhvTCMwCSfKG180YX
         EiHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QkaIJdUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si22916522ybp.474.2021.10.05.02.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 02:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QkaIJdUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXgk7-0006MK-UQ
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 05:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgjx-0006JX-Ua
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 05:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgju-000086-Nn
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 05:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633426077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NutA/OaEonlKr73NV3VU75H2S44oeu7nLXQVMYkp6qQ=;
 b=QkaIJdUXzltw+wi1RlCvkJQv4nbfY8QSPZoZ2QsOSgqehpOZlvBPiK1Hwjw+qzwsOLli0p
 wEXRUnM3o08DZTw22eG6BbL8C64RyCU5SGo0xoUw3JFGmlXFyh823ljPJRTR+hRYUvW57U
 3w068kwkiwrsgh1dDNqy/qfi5WSqeSg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-nbCk2ZV6M7KsuUw3UR8erw-1; Tue, 05 Oct 2021 05:27:57 -0400
X-MC-Unique: nbCk2ZV6M7KsuUw3UR8erw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso82667wra.13
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 02:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NutA/OaEonlKr73NV3VU75H2S44oeu7nLXQVMYkp6qQ=;
 b=dD8iV7KeeCJlClI1uUqtgBxU2qrOD50vRBjLMXtFb0YAfouGPCgWMtqvc19m5IcpCC
 v7Gk5NrBrlvxeTHrAAG78RFZtdBQ4pwi3Fb9AknPTbBJBl5HKOW8Gh/VduzqhbpJpGtm
 usYM5ZIX7kFZC8meUy3U6hHGIIeN9/Chxh94U/pXf/ENCk9Eb3flNVgHe+tZfvE1q8E0
 w7RThshvbwEAdkXa34qbZj5nR3AlexSx2gKpRfsfYB/5Z9ql5BeBZNzlSuWS2odeCEIC
 s4liR0Q389gzpt1A08IPI2y59JnvS6PrmgcTqA8IGE4hSgdWzns+BWl6ZA1hX6GrEn5p
 NMqA==
X-Gm-Message-State: AOAM53077nZwMi7xTH3usIuuNnrT11r0TJ+/YVlzqtzPSFb8+QTzgP9f
 cJwLAt7mto+HW3DxWHGbm22BMzFjJMyUwuP69RKtZTQip1hWpDUQoekx+eoy2PWxngEXhr2bAK0
 wNedz2i/fVkAKraqEP3Lz9EYvI8E8Pegr8flBn3f9qqqx25eSGaXpP0jijOdHmPx8/LQ=
X-Received: by 2002:adf:a48f:: with SMTP id g15mr16630350wrb.259.1633426075123; 
 Tue, 05 Oct 2021 02:27:55 -0700 (PDT)
X-Received: by 2002:adf:a48f:: with SMTP id g15mr16630318wrb.259.1633426074857; 
 Tue, 05 Oct 2021 02:27:54 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id 61sm17092542wrl.94.2021.10.05.02.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 02:27:54 -0700 (PDT)
Subject: Re: [PATCH v4 05/11] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, imammedo@redhat.com
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-6-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6ac00f79-57b9-0fd5-0652-1f0a01a39d4c@redhat.com>
Date: Tue, 5 Oct 2021 11:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211001173358.863017-6-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ADQajEIzdOXC



On 10/1/21 7:33 PM, Jean-Philippe Brucker wrote:
> To propagate errors to the caller of the pre_plug callback, use the
> object_poperty_set*() functions directly instead of the qdev_prop_set*()
> helpers.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 36f0261ef4..ac307b6030 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2465,8 +2465,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                          db_start, db_end,
>                                          VIRTIO_IOMMU_RESV_MEM_T_MSI);
>  
> -        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> -        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
> +        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
> +        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
> +                                resv_prop_str, errp);
>          g_free(resv_prop_str);
>      }
>  }

