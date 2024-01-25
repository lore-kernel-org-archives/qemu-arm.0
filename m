Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp669002ejq;
        Wed, 24 Jan 2024 18:11:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyQsuoFFi2EjMY2Biq9Lt9bqsmA3v3946FBY3IGeS6fT5yCVcZJPci06Mr4ZPrJzTqn+Zx
X-Received: by 2002:a05:6214:f61:b0:686:aa78:df4d with SMTP id iy1-20020a0562140f6100b00686aa78df4dmr371549qvb.53.1706148686324;
        Wed, 24 Jan 2024 18:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706148686; cv=none;
        d=google.com; s=arc-20160816;
        b=ooC/ZyAoUMDICg+jVm1xW+Ht97V+ugL+M8uW/TKNnEUTpciudyyNEeDmxkT0yyMuXe
         jO1be3c0YEi1WVaOt4tiHeRQDEP1S74Jy18yOvfAZ5AhkAekmtJV9jYia5orA4Z1kbUZ
         NGtDigp/l5db64Tnq6CZ3SE1clBL3U0HBSpsxKlOQoz7MEOqF6sDkcwiYKcMa/M04pZL
         sI3yi5xCyXUuKWpPlytCTvehW7vN48f3SoEjS+GRHbu6H/jEi2/Uo7u2nBZrpDz8rG0R
         Zkq0SUVGiV/zN+18MM33pQv/stz8Nq7rvJVfxrw7j2gyzvS2TfXVOVheRdpSsJ5il8vx
         gBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IxVvneKtmt0XkxdEeJCPkZw+HwbT0oKKeve1U4V7NSA=;
        fh=39N9WEP22ZX5RpcHhH9m770ca1Njks1d53douB51LrA=;
        b=FuJZ89jEbuRa7tgkwNecQYfABiT/iR4TB+G/NP/+F34kCF8IR9OzeD2v/nr/kK3zbj
         dB/n8Q5QlkUaMKjXyzqxqmPWewZmpyhM4wBK6u3eef8PFxhC15Hb0YNjOdc7bpS67ink
         bjSIBUVYmexmtB1nFb4AeCeHpmFzrZSUoVo/lJE1cEIB9xyhBFnc1R/A0mmpxOU5yWSA
         EEyVpEzWXWJfCRDFxuvu1OAfN+4mWPfl94boLs3m6aq9HhYGQa+6dUOqQosOdrx6IFwb
         SqyP3he9ZS55IvFbvq3zRAdd4IIuO7KfpvLIuJIpgvrN/G2dqVJ3B3Tqq5R+0ycKT87u
         LTVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMHyEckR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a0cac04000000b00685c776f959si10757218qvb.517.2024.01.24.18.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMHyEckR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpCz-0001hZ-CG; Wed, 24 Jan 2024 21:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpCy-0001hP-Aw
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpCw-0005Tn-V3
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706148670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxVvneKtmt0XkxdEeJCPkZw+HwbT0oKKeve1U4V7NSA=;
 b=OMHyEckRclCM1ph5FwLFXyYc9a+666KYx2Gq+hVvQ5qP2uboFyjmo/pZ3pNGqkT+FkDPFa
 LWBl6cmbpy038Cqctkt/KuMlnEp/mqk0VGCt2FsdgxgYeFRyDlnHlD6l4sDXYhOUkByY1r
 miDOv63NTaZAUmrhZyTX8JSb7BSLzT8=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-kfaLnpwRMpCk3Yur_VXNOw-1; Wed, 24 Jan 2024 21:11:08 -0500
X-MC-Unique: kfaLnpwRMpCk3Yur_VXNOw-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5ce53c43ea1so4572866a12.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706148667; x=1706753467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IxVvneKtmt0XkxdEeJCPkZw+HwbT0oKKeve1U4V7NSA=;
 b=Z+RtViOWHVigIyVtZB3YcoQni9s8x6lcHa+u5pmexmFyh7r+iVvB4qRIwYOBYTxQmn
 z6lQnu+jd7QvWijbXMuSZTGf3b1tWKSfaBxQGyM+SHYRmXYmjqSUF6+DoR51PimqxEsv
 O/UVXrccXem6bmzweaTtIdCBceTvDSerGaT8UyBaBRO7DvxzFT181zwGmN0nF1sAAC3J
 qDQ+CsD2IdAcQ0czhbKOupv+erGlrvYXJZUHFrD+hNEgm7N3hUefQZSDSgSqkM+IjKKr
 OOwpyjflV8/y822gv7U8PwvGOqHvPxm8hM5OEycUNJ+l9owmv5mtfqQBo07fW/7TQyV0
 qlig==
X-Gm-Message-State: AOJu0Yyiu2ZWzOCIJpL+x0vOYrLQV3x8xxtO/hDkJWfpv1eFGPWVCFr3
 09+/PNA8j4Bn5zGslVqb8nJGFtqbVNwqdYdDOX8twjGcTIVY/zalnFo6lBpvA3aDD6cfAuURj/u
 0h0M7Af4DwQIQzFkn4m+QVsK+RPMoZftRjt+mZBPvunDGigKucw==
X-Received: by 2002:a05:6a20:7d89:b0:19a:813c:62c4 with SMTP id
 v9-20020a056a207d8900b0019a813c62c4mr339942pzj.29.1706148667159; 
 Wed, 24 Jan 2024 18:11:07 -0800 (PST)
X-Received: by 2002:a05:6a20:7d89:b0:19a:813c:62c4 with SMTP id
 v9-20020a056a207d8900b0019a813c62c4mr339931pzj.29.1706148666898; 
 Wed, 24 Jan 2024 18:11:06 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902e9cc00b001d7035b11d6sm11015403plk.254.2024.01.24.18.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:11:06 -0800 (PST)
Message-ID: <f3465ee8-74f9-4b95-919b-16f7255c93a2@redhat.com>
Date: Thu, 25 Jan 2024 12:11:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] hw/arm/exynos: Check for CPU types in
 machine_run_board_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-3-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123222508.13826-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: duKQPvcM1UXH

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU type.
> 
> Instead of ignoring invalid CPU type requested by the user:
> 
>    $ qemu-system-arm -M nuri -cpu cortex-a7 -S -monitor stdio
>    QEMU 8.2.50 monitor - type 'help' for more information
>    (qemu) info qom-tree
>    /machine (nuri-machine)
>      /soc (exynos4210)
>        /cpu[0] (cortex-a9-arm-cpu)
>        ...
> 
> We now display an error:
> 
>    $ qemu-system-arm -M nuri -cpu cortex-a7
>    qemu-system-arm: Invalid CPU model: cortex-a7
>    The only valid type is: cortex-a9
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/exynos4_boards.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

