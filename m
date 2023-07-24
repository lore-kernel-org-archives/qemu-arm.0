Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1758014ejb;
        Mon, 24 Jul 2023 03:16:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF1hsiSIa+1k13VzdHlmQYQL4j0gs1Pia8yY4empxVCqb+VKuzYF076H4BkuQ55uDVeU55I
X-Received: by 2002:a05:620a:675:b0:767:276:3c9c with SMTP id a21-20020a05620a067500b0076702763c9cmr7408923qkh.14.1690193814772;
        Mon, 24 Jul 2023 03:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690193814; cv=none;
        d=google.com; s=arc-20160816;
        b=QoPQCxhSMz5cAIUy3zvRliiNo5ztUQY3JLTGr29vUIyerIikbQIStDCQoVZiesGkPq
         m8hRWB51LtDcno6VM/zoKVjDf5xZEZrjMGWPjCRmdTvG2HKM+9kYE/GVKZ1LepjHQiSw
         K+8OqXzxczloa5WBET1958/0ICAA2M/MhfqVs8N5fZ6XatEGpzvssPvdpt6uFQiAJ8+Y
         f8bgehxn2dsodeo5lvthWP/jzj9DQfbTOR+7xLKgkEQOzoAp8TCZRtZdqSDPfGrAF8v3
         TuQ0pQqEIUuGiocq94JwxFt+TzqJacl1NoONkJSU2U5QN4Tuwcsxc2k/N1w7yeASshSd
         FIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UoFCc3Ynvml8yhPIc5IYDX+TKQVQRfGTwKLJIqqHKA0=;
        fh=sp1flBeSKWfc81i35+JdeZo9IUHCSnMDN00Y/hF2h3g=;
        b=cDX5eSF76tJnqAHCWMO3CSdmfUHl8Ra45PxSN9RW4VsZaY14HphY0/2oFdadq+K/G7
         FzOWGXHVTmT74n4SQWqp+cBjpkdfJ/oE+iTyPzbBbqXhWJHoNeVqczfU3ttEFriCGGPM
         RRHAWaVHHA9+L6/TB18FK4BK/R2POVjJTLph8YZ7Xhq22llgvRxtYniOYla5pIyiWEGj
         c0mVK5mGGaYuRzy7hwgY6qbSXQBg1RERP/l6QoBCwQeR7+jpXnFPtuJ9HyDbvAUlnHDA
         E1Xo3RBij7vscihl0hVbEZkrKNHz/lBVSX6rIQpEbQa5k9uvKZ7okMeyTMAvHiWFUfJH
         Owzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cd8dqqSR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05620a0c5200b00767d0cb5098si5004740qki.438.2023.07.24.03.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 03:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cd8dqqSR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNsc2-0007Ez-1U; Mon, 24 Jul 2023 06:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qNsby-0007CD-2k
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 06:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qNsbw-0001wA-EA
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 06:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690193775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UoFCc3Ynvml8yhPIc5IYDX+TKQVQRfGTwKLJIqqHKA0=;
 b=cd8dqqSRjhKE4Qcp2lBgLFSndhyNEDaqvs5y9OyK1G/2ianlwekvd5H6NNpAtiUsLcpBxl
 nzBADurn63ZKLFywKl+vhu4dV5NPfPPe02aHbgWg2opBuBc5Wk791coFuvVI8mQEXnVJ6t
 JFZx86mBY/bcIXBKXgROTSMdntHkmao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-wX8pfPTAP82h7yl0hKDo5g-1; Mon, 24 Jul 2023 06:16:14 -0400
X-MC-Unique: wX8pfPTAP82h7yl0hKDo5g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fb416d7731so20018355e9.2
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 03:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193773; x=1690798573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UoFCc3Ynvml8yhPIc5IYDX+TKQVQRfGTwKLJIqqHKA0=;
 b=b2vJTWHG4DX8NW2u9cEMVmFG/zSCxX9CFTPoOlNR1njV20W7uOqTRaosiCu2WOlXZK
 ICoj8NZtP6kGaOinHG5zlvwFtuPrYc2xaVjuVub6NPKuS46EV9pM6oIgAWcV75eOdWg4
 xhY27E+y/QkymMZczpVLCA36BT2uLbrnZRvIxvUej1iyu1NJ/d1e6nxYrnZR7d2rEg/9
 qxd1oULkbNrKvnGGPhU35A1g5AWN23FvJgb18TWhG51deqemeqLipsaD12azCAZKW8Hb
 9oafjtET6MkOd5yqNH7KgVWZGzYk6OxR2dF2flLTfdq9+6YMQxlmkc1yzJ0OtvFZi/CP
 34fg==
X-Gm-Message-State: ABy/qLadBi4mqw/kCRaz3u7lrtQBrRpvIS2Q5mvAqY1Sj4yB/iN2G4pk
 3tYeVb05kbrjXy/6IjHPeGJodeIvpkwRJgZk/8U5V0LLsBg+kV71Qq1G4SzxjUi3FZ3/7XlFJyR
 5RN7HogUbpRiy
X-Received: by 2002:a05:600c:228d:b0:3f5:878:c0c2 with SMTP id
 13-20020a05600c228d00b003f50878c0c2mr5774187wmf.3.1690193773145; 
 Mon, 24 Jul 2023 03:16:13 -0700 (PDT)
X-Received: by 2002:a05:600c:228d:b0:3f5:878:c0c2 with SMTP id
 13-20020a05600c228d00b003f50878c0c2mr5774166wmf.3.1690193772871; 
 Mon, 24 Jul 2023 03:16:12 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-165.web.vodafone.de.
 [109.43.177.165]) by smtp.gmail.com with ESMTPSA id
 e22-20020a5d5956000000b003063db8f45bsm12431554wri.23.2023.07.24.03.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 03:16:12 -0700 (PDT)
Message-ID: <5a8e9611-2384-f4b3-193a-f579aa4b5409@redhat.com>
Date: Mon, 24 Jul 2023 12:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] hw: Add compat machines for 8.2
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230718142235.135319-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230718142235.135319-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: O8KOE417v/PF

On 18/07/2023 16.22, Cornelia Huck wrote:
> Add 8.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 16 +++++++++++++---
>   hw/i386/pc_q35.c           | 14 ++++++++++++--
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 10 deletions(-)
...
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 4516d73ff5fc..c52a1fcf6700 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -828,14 +828,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_8_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_8_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(8_2, "8.2", true);
> +
>   static void ccw_machine_8_1_instance_options(MachineState *machine)
>   {
> +    ccw_machine_8_2_instance_options(machine);
>   }
>   
>   static void ccw_machine_8_1_class_options(MachineClass *mc)
>   {
> +    ccw_machine_8_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_8_1, hw_compat_8_1_len);
>   }
> -DEFINE_CCW_MACHINE(8_1, "8.1", true);
> +DEFINE_CCW_MACHINE(8_1, "8.1", false);
>   
>   static void ccw_machine_8_0_instance_options(MachineState *machine)
>   {

s390 part:
Reviewed-by: Thomas Huth <thuth@redhat.com>

