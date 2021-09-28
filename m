Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4755910lfp;
        Tue, 28 Sep 2021 04:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO7Ea4brMVFqugScjbuLBUsjd2qn3+ZS5w1wUEUKAditdt8PmwKmX/V5Rs2I01hdh5YxEu
X-Received: by 2002:a05:6402:40c2:: with SMTP id z2mr6662600edb.340.1632827121919;
        Tue, 28 Sep 2021 04:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632827121; cv=none;
        d=google.com; s=arc-20160816;
        b=f/NewZ3+BtfkAdW134hUKReqnLz15PMDIFlrAXp/Tm4/xZbiamhPtMJv8q2Fy7tK/s
         07MhVGPDxghF/t6VT4sH1teMgc+d1cO1IMQHc6p7NY7fhLMnGYN0KXboeWtqwSWhwk6E
         73p7L1rRm3uaRzSFWiG25ruPm8Xuqle2ECHydN+XtBI1UmpFOF316x2bZkcxd1nN155A
         UtUPkRMKT34WPihPtJ4ewtl2AFMVbR8I3na3zvlEFbfb+kDClFaDZ7U6QiYIg1vts7eP
         AEmJlysdR0JERTJLgaJcr6zt6A2phqGQ3JhAX/Ft5tGpfo+NczOrjnYNYbD/xlSgu+pG
         9Jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ojLNV1KlCnyKppemMIrj9EcELL88WGgvs8mHLiVPhwY=;
        b=xMplUrlIew4BYPUU29R3aMLBvveCF1ZcgX/iDxc1E/MtaLkaCEJ2QeYruZk196qh46
         6fxgfIXf/QJ1c1chphI9qWSLrhfFKJ5c3b8syaGIZzxpJr1mma6nC0qGLwtSZjXQjg3s
         23ON+bKJvUBfC/buwR8pQNcQxLaaxP/IBNuhgXMjawMAA1HkzmJEiCB09zSVWDMtqw5V
         anFQATJKb/Rbq2/QqilYUhcJ/2HJe0mXq8/RYS0euFP3mHeyni0Ihma2hc1qjayS+dac
         bSK/WrDZtxPUuXj5up9ALDOb4ESKGLYLYWjn80pm3CnvoDf8QlhRGfOesUdnBAEWV0aq
         c5/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CkDAHtxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f29si21685722ejj.773.2021.09.28.04.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 04:05:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CkDAHtxY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAvI-0001H8-SH
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 07:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVArL-0005V6-ET
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 07:01:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVArJ-0001vU-Sw
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 07:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojLNV1KlCnyKppemMIrj9EcELL88WGgvs8mHLiVPhwY=;
 b=CkDAHtxYv9dIysxCpwJ5c0HJTSjKEhAv0qogkiMt9gbwp9WNf71KOpCaZ3Hw0AO6HUHCX9
 qEFJpsfVN4iKdOQF+nMi3m+BuZWfumOOT4c699nKC1SALtcIulKUaBUeNU7cXg1QehFRAQ
 YNOnBd4bWBd3nQLVKRj9Lo7ghjXdFzI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-Xlr8MajOPH6VhOYJH5CAJQ-1; Tue, 28 Sep 2021 07:01:10 -0400
X-MC-Unique: Xlr8MajOPH6VhOYJH5CAJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so15063194wrh.0
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 04:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ojLNV1KlCnyKppemMIrj9EcELL88WGgvs8mHLiVPhwY=;
 b=LaNi7ClXsO6xyl9eLJKekJOKOJ3HuCK8JiT1IjGNL76xTN+9x/rjV72TNqIBovQk1R
 /jJ9BAXlAm9N+Ht62WEpydZY7mpIZj2EKuZBSOXyxTdvJWtz5TJQRpz/3pskNAErHZ+j
 13VTdCwKhRs6V+9kAXnasrWl9Kojt6UowgUTBJkAr/m2w1DQ42UVPW/PBRZgQJhnu2iu
 5UCouRsteT3GH/d96hzS92khBXCgdpKYnw6os/E/CfKvyVozo82tJiJVOb/6jrU8uhm+
 VYmVpu0Ps3pQH+ZtyIFp3ljRJpXPgc1SNaQSJG/WP8TXaUPPi0s2NORb/e4lJjeyUAW7
 7DLw==
X-Gm-Message-State: AOAM533Melf1XJQ7/t9hoMUO8M9P5H2x6GMCDQqONG6TJSlgfvsqI+f8
 rw8RGHxlPF/fyik5qfalEWXcvStekY2QaDFWj96xNHduTA994tLMFGFdpylBOYJyF4B86gLt1NC
 2WrlN+Gqq+Zpn
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr4008020wms.119.1632826868875; 
 Tue, 28 Sep 2021 04:01:08 -0700 (PDT)
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr4007984wms.119.1632826868710; 
 Tue, 28 Sep 2021 04:01:08 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n186sm2360613wme.31.2021.09.28.04.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 04:01:08 -0700 (PDT)
Message-ID: <cf292444-d89c-5acb-f47b-c135079a60b2@redhat.com>
Date: Tue, 28 Sep 2021 13:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 14/14] machine: Put all sanity-check in the generic
 SMP parser
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-15-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-15-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1u3FS/xERY2X

On 9/28/21 05:57, Yanan Wang wrote:
> Put both sanity-check of the input SMP configuration and sanity-check
> of the output SMP configuration uniformly in the generic parser. Then
> machine_set_smp() will become cleaner, also all the invalid scenarios
> can be tested only by calling the parser.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e2a48aa18c..637acd8d42 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -798,6 +798,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      unsigned threads = config->has_threads ? config->threads : 0;
>      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
>  
> +    /*
> +     * Specified CPU topology parameters must be greater than zero,
> +     * explicit configuration like "cpus=0" is not allowed.
> +     */
> +    if ((config->has_cpus && config->cpus == 0) ||
> +        (config->has_sockets && config->sockets == 0) ||
> +        (config->has_dies && config->dies == 0) ||
> +        (config->has_cores && config->cores == 0) ||
> +        (config->has_threads && config->threads == 0) ||
> +        (config->has_maxcpus && config->maxcpus == 0)) {
> +        warn_report("Invalid CPU topology deprecated: "

Maybe:

   "Deprecated CPU topology: "
or

   "Deprecated CPU topology (considered invalid): "

> +                    "CPU topology parameters must be greater than zero");
> +    }

