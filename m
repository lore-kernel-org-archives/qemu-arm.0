Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6680447lfb;
        Tue, 28 Dec 2021 11:24:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDOg71oqtCUW2ZIFMcWnZQot28rUnCy7DA1yS/8iTZcCoRTihh4JJEdpS5GDTVsQHd9UKR
X-Received: by 2002:a25:4183:: with SMTP id o125mr4400106yba.150.1640719459770;
        Tue, 28 Dec 2021 11:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640719459; cv=none;
        d=google.com; s=arc-20160816;
        b=NTOoMI2X01ccVmo0m5R22HM+eJpvBSbgU13AOJEPckWbr+8nQhZ+RS/KMp5BiaRmtK
         ilEaze6oTTUuhYvh5FBi1kUUL9zkxCQQGj73W47ixeW+Fs7/+1phbHLdUZ63F8NoPQCm
         yo2zdT5Ktme/tfHlEyLQ0IrSP3GYPd8iqB9Klr6v0uIQvUXYJfBKST03E2ec2qg0iggR
         10MspM5pqMheWi+5yshhYhewImC5SiVFxEYzzKV6BslRMSJbsZQJC1Gt0J9OpD+6EoHR
         V3o7nPuJzjsabrs/r/UOaYwqnJ5UTCYl+SM66TOwvcTimehz9CcfQ/J53X+eMsoJou6h
         wYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Bc3+qaTUdeyOdPPhLrwmGRg6msURoULR5CEU221oa/Q=;
        b=gw/p2Ktl56kecSpN5Iyb105AjgegMgDlbMyFhQe5G6qFTqhzrfYGKl9+i9kvpT7RCk
         QRgJ5soWM8jxqjvSvemD+eDPFJteNRhZwoUTqVKWY600dY8nygkH2Bjv3BtpsKEc9dtU
         swpRyLqBypt+g6beAMh76YC5EEU7fznb3+eM4ae7gy7XXjwsRBr/2X2GHDcP6m12peHs
         2zSQXwDCDWbFiL0eiBxSkN00rUYUY/ZY9lItaBBfssVJmMyJ+iqDebNteDsZId5S9Amg
         3UDjN/qt0UGnMNRoQYw98uAnfAtP/9vFvoGLSg6gBQwp+/hvkG2VCa6gEGoeGumR27fU
         twiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gik6rPsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si19072530ybt.142.2021.12.28.11.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 11:24:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gik6rPsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2I55-0004L3-6P
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 14:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I4D-0004Jo-I0
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:23:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2I46-0002Lq-SX
 for qemu-arm@nongnu.org; Tue, 28 Dec 2021 14:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640719392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bc3+qaTUdeyOdPPhLrwmGRg6msURoULR5CEU221oa/Q=;
 b=Gik6rPsXOfZ83N4VIFHPnRyhbqQDgSvD3KbNnTQtOsGMzjrfdSHyx2J18Wj26lbPxRbicS
 BkM3FfEa66bYe2yUV6mr75rOPSHYk015tFlp2vy7QijaB0fgxLZkhERYATMLy8u6bMhiBT
 7pN3UTGPhVELme603P3MuxSQVhlx648=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-dQpuixKlOrmQ4nhY-Sp-Dw-1; Tue, 28 Dec 2021 14:23:08 -0500
X-MC-Unique: dQpuixKlOrmQ4nhY-Sp-Dw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so9688150wmq.0
 for <qemu-arm@nongnu.org>; Tue, 28 Dec 2021 11:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bc3+qaTUdeyOdPPhLrwmGRg6msURoULR5CEU221oa/Q=;
 b=hizUoYctuhOJTs8/dQF6JymTa2uZAlmP8MgYS138sxU6BbK7Gs9y5eu++7R/mzh9pC
 oKt19+JxEBSHt6yMk3noQx9cIzPpZ0S4LEiX82v0t4ZDlq33inRP78N5LP8+hqQp53fw
 nR+CvNjsXTMvN1rA6UN9hftLcUFep++e+9U7w5w7bgm1RBqq26dSVZHwdxx+OMM9gUO8
 X6DglaXJdqB1Plr3kJ/PnIydsdh5KQKhVMIC0qs6oAztcYRMmeuCF4e6uzSw4QWZQRXy
 Oxr2bOHLICJQjOZWZrOqAzXQh5EPKF5VGHMTmy2UMotStkJLftGP4/ups7ARIhtSXMNB
 7ang==
X-Gm-Message-State: AOAM5300BUUPZ6Z0TbvNArk6WoObnosx3Ca6YTt9ftbk+YLXePb9eouY
 XMZVQdUuT1sKs2hJw58n9T6tsOh/GpXjySeklgAOK/1uNwuD2Ci4RKyliLNh3ma/WoiSZLc3A4/
 n8ibGLvO2VMJI
X-Received: by 2002:a7b:c108:: with SMTP id w8mr18312743wmi.136.1640719387650; 
 Tue, 28 Dec 2021 11:23:07 -0800 (PST)
X-Received: by 2002:a7b:c108:: with SMTP id w8mr18312715wmi.136.1640719387398; 
 Tue, 28 Dec 2021 11:23:07 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id l17sm9963035wms.24.2021.12.28.11.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 11:23:06 -0800 (PST)
Message-ID: <21974630-06ee-bacd-ca83-0116f1c6d4ec@redhat.com>
Date: Tue, 28 Dec 2021 20:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 03/14] hw/core/machine: Wrap target specific parameters
 together
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-4-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kvieCRNTi7Ih

On 12/28/21 10:22, Yanan Wang wrote:
> Wrap the CPU target specific parameters together into a single
> variable except generic sockets/cores/threads, to make related
> code lines shorter and more concise.
> 
> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine-smp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b39ed21e65..4547d7bbdc 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -79,6 +79,7 @@ void machine_parse_smp_config(MachineState *ms,
>      unsigned cores   = config->has_cores ? config->cores : 0;
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> +    unsigned others;
>  
>      /*
>       * Specified CPU topology parameters must be greater than zero,
> @@ -111,6 +112,8 @@ void machine_parse_smp_config(MachineState *ms,
>      dies = dies > 0 ? dies : 1;
>      clusters = clusters > 0 ? clusters : 1;
>  
> +    others = dies * clusters;

This doesn't seem clearer to me...

>      /* compute missing values based on the provided ones */
>      if (cpus == 0 && maxcpus == 0) {
>          sockets = sockets > 0 ? sockets : 1;
> @@ -124,30 +127,30 @@ void machine_parse_smp_config(MachineState *ms,
>              if (sockets == 0) {
>                  cores = cores > 0 ? cores : 1;
>                  threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * clusters * cores * threads);
> +                sockets = maxcpus / (cores * threads * others);
>              } else if (cores == 0) {
>                  threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * clusters * threads);
> +                cores = maxcpus / (sockets * threads * others);
>              }
>          } else {
>              /* prefer cores over sockets since 6.2 */
>              if (cores == 0) {
>                  sockets = sockets > 0 ? sockets : 1;
>                  threads = threads > 0 ? threads : 1;
> -                cores = maxcpus / (sockets * dies * clusters * threads);
> +                cores = maxcpus / (sockets * threads * others);
>              } else if (sockets == 0) {
>                  threads = threads > 0 ? threads : 1;
> -                sockets = maxcpus / (dies * clusters * cores * threads);
> +                sockets = maxcpus / (cores * threads * others);
>              }
>          }
>  
>          /* try to calculate omitted threads at last */
>          if (threads == 0) {
> -            threads = maxcpus / (sockets * dies * clusters * cores);
> +            threads = maxcpus / (sockets * cores * others);
>          }
>      }
>  
> -    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
> +    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads * others;
>      cpus = cpus > 0 ? cpus : maxcpus;
>  
>      ms->smp.cpus = cpus;
> @@ -159,7 +162,7 @@ void machine_parse_smp_config(MachineState *ms,
>      ms->smp.max_cpus = maxcpus;
>  
>      /* sanity-check of the computed topology */
> -    if (sockets * dies * clusters * cores * threads != maxcpus) {
> +    if (sockets * cores * threads * others != maxcpus) {
>          g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
>          error_setg(errp, "Invalid CPU topology: "
>                     "product of the hierarchy must match maxcpus: "

