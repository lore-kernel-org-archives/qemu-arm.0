Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4473664lfk;
        Mon, 13 Dec 2021 12:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn02obTLqDWOLZEE/BY7sqzljN64jN/hf6JRDQx3f9TvgylBJZRXha9+jWCqF7tsIZrXct
X-Received: by 2002:a05:6214:1c81:: with SMTP id ib1mr372544qvb.79.1639426018937;
        Mon, 13 Dec 2021 12:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639426018; cv=none;
        d=google.com; s=arc-20160816;
        b=YFceNSzUOsAO9LFL4HdAJ0rbv4a0P0vcwSDLueA43kLxq8xzI9plAFexNstuksv8lB
         pTiXuWj29zfIQHdbgNvOO/pVW9tL6fUJ9fNOwNJz7as50+tpAKTJ11hOE50koTo8fzLE
         zKnsU5rauvH2wkS+2EiZvxh6lw7kvQYUkZmfV3wwCyRxcBj38oONl7bLwFGmjtdEnFfP
         LTdRiZw/FZ6g64a3KRYxXBR+F/FaGT0GBWjJDEYqWmcRC4LJfmQ073R7cKUsONjACD1B
         xbOx6/Xu2a2jVt9Ptwzo7SNtz1S1aQ2oADk/MUH+rEgJTKMbJnR4Mj7URx++VKsPV2RQ
         CzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=lX7MIX7hf5Q3TCJCIKSrdxWGEfwxLsyB8AL2ix5etPM=;
        b=fPVt728U4JYol3OvlpOb6MFDvjEw+DodHVmXEhTCCcy68HdczrGy9ZnZ/VeJUimaoB
         JJH5hLrkYLmJPdMEQqnJwf/lSNo/+2Ob4ZmD06ZAqCmVJqpJ+r5M11Jgpflos5We4c9y
         gjt8fWmgNVVUErKk5cBbbswugvyDn30jTGFM8t7xmoxJw11grFgKJtiodeamcwHzt90N
         IvwXSwzLG8OmAmgGTAMVwv8FtIHtcRz7WhXmGrD4wfOFTRAHNOMxEV57zX76uw89WdrF
         phtCHvJjlE/hchP+0Nsc/4QScKHdIGcgLwv5zMKibGYw41LwhXGG7DjNqzA4nDZRi953
         1tMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1Ra0dCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si13562043qkn.506.2021.12.13.12.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Dec 2021 12:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C1Ra0dCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mwrb8-0001gg-9v
	for alex.bennee@linaro.org; Mon, 13 Dec 2021 15:06:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mwray-0001f5-4H
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 15:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mwrav-0004Nd-68
 for qemu-arm@nongnu.org; Mon, 13 Dec 2021 15:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639426004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX7MIX7hf5Q3TCJCIKSrdxWGEfwxLsyB8AL2ix5etPM=;
 b=C1Ra0dCv7uQuY3vn1A+QhC4sVLKPl1s4NrAZG/0UJk4vueIOLWSXQbk3uPFHyJj2wM5IE2
 ABFuqFnvLHV1nWbnDhogO9LLge1SIER6jnyC//FpAaZPJXd4I0+6J2FF05XdCYta+cd1W4
 TjZzEDIN7/kyGO0HuQextesEnHKAPLQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-SO9FBMxKN-GQM_q1g-s58Q-1; Mon, 13 Dec 2021 15:06:42 -0500
X-MC-Unique: SO9FBMxKN-GQM_q1g-s58Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so6895099wms.8
 for <qemu-arm@nongnu.org>; Mon, 13 Dec 2021 12:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lX7MIX7hf5Q3TCJCIKSrdxWGEfwxLsyB8AL2ix5etPM=;
 b=a7zYyKfCbBdKCapBbAjCkMVNzhdIwcJvAe/Gy8gMvsCTDUFczP3T8Q6NcY/inzdw8X
 60iitfco4X0Mx7boozShigbWA9xel1sHYelFWHOxxetiwdVkSaUgqkmU+9vNFFhxDIvg
 zam0c3p1ZnswH1u1vH9+BwEJbmEKFF8ELW/ozsRbaetZj0YvDRjHFteI60ej81kroA+z
 2atpLm0XAXzGJNSsL7mMp/hfXamNE25FxgQPNDfGbNQwoaAnxkZZVf8eHv77gdGIVbFY
 XWPN2Z+eAtYFaKjo5MbKo3dnUWjCSbNp3fxSDaRE0i9ss5qVC+zawDcFc4CvZF1mVPRu
 2GzA==
X-Gm-Message-State: AOAM532wCbNhWLoNkhvVic1peS3/iYuWPc813BkIoJIj6lE6izEMuXhU
 CgHf5IDWLAq3hCauuzCYfCdTJv4RaAvcq2rSLZ85HhU9pela2t8Q2NnAZQc4hLwsnE4XxAvewBV
 2btzf+spDah1g
X-Received: by 2002:adf:f708:: with SMTP id r8mr788778wrp.198.1639426001273;
 Mon, 13 Dec 2021 12:06:41 -0800 (PST)
X-Received: by 2002:adf:f708:: with SMTP id r8mr788753wrp.198.1639426001102;
 Mon, 13 Dec 2021 12:06:41 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i15sm9554583wmq.18.2021.12.13.12.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 12:06:40 -0800 (PST)
Message-ID: <8e97b380-5741-0e48-5d2d-4e1effe4358e@redhat.com>
Date: Mon, 13 Dec 2021 21:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
To: Byron Lathi <bslathi19@gmail.com>, qemu-devel@nongnu.org
References: <20211213182449.7068-1-bslathi19@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211213182449.7068-1-bslathi19@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wu6k/PeoTxey

On 12/13/21 19:24, Byron Lathi wrote:
> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 init functions, using the appropriate values from the technical
> reference manual for the A5.
> 
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

>  static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1055,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
>      { .name = "arm1136",     .initfn = arm1136_initfn },
>      { .name = "arm1176",     .initfn = arm1176_initfn },
>      { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
> +    { .name = "cortext-a5",  .initfn = cortex_a5_initfn },

Typo "cortex"?

>      { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>      { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>      { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> 

