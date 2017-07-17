Received: by 10.25.44.15 with SMTP id s15csp4112405lfs;
        Sun, 16 Jul 2017 21:09:28 -0700 (PDT)
X-Received: by 10.55.31.76 with SMTP id f73mr26299273qkf.85.1500264568690;
        Sun, 16 Jul 2017 21:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500264568; cv=none;
        d=google.com; s=arc-20160816;
        b=zR+B2fSOjtVVyvCCG3mvHDcf28FKmVHvB+oboJKK1DmCP9DzkbKHcJWLOW9v7YOn/J
         YPm4sjRbWDmdcYG3TMX8qc8GgHmeyNm/q844+T0vHiB8350k1ELtSNo3zX3PhQdn98JC
         kV+pCl0g7HPnqWN9kJfv+4MuNfNa8XpuQiVNMsyphXfTjaBrnO+x0J/GfnFHGDXGBBcx
         XR6UnDpd+eT96fi/Y286bSkcDX21AKjYwRNKtGDbtUMZnmTKNUaZwt8CVvHGmGYSE5FE
         E3Yplor0BxAJUEG+8m1dScO3TldIUFwZUOD2BCd0XQebOiZI+FTVxYotcmCPsZuqZKUv
         OrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=E65jncMfZKivvgX+foEoPuQ6/c8JB4XJs5A1p2tFEw0=;
        b=ZZVcCd4vhofeVeKgfhh7wj4Vxer6uDNM+jWeQnN3jxM9mISmFKKa5xOrXW0ym/fOEL
         4LJ9glieUJXYQutj4S0RSSo+hHptA6Y/xZH4TqpvH6zg8VQRJZDbdeG6gWtNRwjLA3OG
         NZ7irzmBBk7bD/2ehtywkSYzR9/RCKrfJy+RX3c8onUvwz3yNWpCTsnjVNffzUdLWs02
         +H/h2pez/prlwp+4i6hLd1OBpAKzGy+wQmDBXefA3dKn0QAIct1tvPbGGO5HcnRltAiC
         w65imkDbmdcjZO0LgE94nxQRpR6hk0XDZvLZwKxIDiPKaPRnhmkp07FGs2lw1IjF8hs1
         fEVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=BvaucoUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v61si14275616qtd.340.2017.07.16.21.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 21:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=BvaucoUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWxLX-0003Ju-Vp
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 00:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxLT-0003Ii-Q4
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxLO-0008CB-T4
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:09:19 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxLO-0008Br-PD; Mon, 17 Jul 2017 00:09:14 -0400
Received: by mail-qt0-x242.google.com with SMTP id v31so16968038qtb.3;
	Sun, 16 Jul 2017 21:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=E65jncMfZKivvgX+foEoPuQ6/c8JB4XJs5A1p2tFEw0=;
	b=BvaucoUEmYAlH8/0/McS/RXErANEBbwlkmAwz9zU3o/KDI7uRIePnt1d28MhKDSi+I
	GU+39XSjT2frSu3GjwyomrurEfIu0dtXA2G0D9wirvtnSI4tb2gdk7T15i2/brm97sHl
	fgNlfzCZPi/u2H2fVFja4EsJi4eXIrCa9GKWTaTZQ8z0E2oiiFbGomJ7F1u0YLIr++sN
	6f1+Ecd3APJX4OShLOGa3n4vXO28p2B+QYJPfMAR4bq0fINSUkhi0J+8ltrdfkxiRi0A
	HhcW7lMQ9VRpfVZXVt3md2C5VPJmGBW87b/EPt0o1mWymlFgty4xSYFqx+n3Dokfqili
	Pjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=E65jncMfZKivvgX+foEoPuQ6/c8JB4XJs5A1p2tFEw0=;
	b=SLkgOuFBKDwxxIchakKcQZOJ5rtIhyWBuyWB1XwM3m+VJQSqld72bhbN3Lr7f5BKS/
	ur55XL8z3OtLZX1u5Q9kpCobj8DBpmdMerrVl6yIOJOiPPrJ5gFDOnZBDoxqhsHIY4RL
	RNZ4Bprs5Fp8tdiuK5E7S4pxORUWsd5xUOMmvfbaI296pgSU2b3R+ioyq4tsf+FBkCL6
	joQXvHxJdeJDGEKc5Vv3GlNEqp1kBWaBs95A1wyI5lhN4RwsbfmasZ81Ym3ZcVJcE3fF
	5vV14D4CO7zpfrAQCyKINPKaUXgkS32c3Ao5RNq5sDyQSP104FdAYXYYkxmX48/2/edI
	h/pQ==
X-Gm-Message-State: AIVw113ESNE3aSdeVhCJEMTMh/6ICaIuErrCCoicIhJ6lF4FCZxtASAa
	jst2Q9esgtt7WHWLXSc=
X-Received: by 10.237.50.4 with SMTP id y4mr24613384qtd.225.1500264554136;
	Sun, 16 Jul 2017 21:09:14 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	c18sm13422632qtd.62.2017.07.16.21.09.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 21:09:13 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170717023824.18796-1-famz@redhat.com>
	<20170717023824.18796-5-famz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <80ca7734-b0f6-c7d0-6a4e-17b1be888186@amsat.org>
Date: Mon, 17 Jul 2017 01:09:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170717023824.18796-5-famz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 4/6] xlnx_zynqmp: Convert to
 DEFINE_PROP_LINK
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5IGaLjJc/Jsk

On 07/16/2017 11:38 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/arm/xlnx-zynqmp.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 64f52f8..cd8a4aa 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -140,11 +140,6 @@ static void xlnx_zynqmp_init(Object *obj)
>                                     &error_abort);
>       }
>   
> -    object_property_add_link(obj, "ddr-ram", TYPE_MEMORY_REGION,
> -                             (Object **)&s->ddr_ram,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_abort);
> -
>       object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
>       qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
>   
> @@ -434,6 +429,8 @@ static Property xlnx_zynqmp_props[] = {
>       DEFINE_PROP_STRING("boot-cpu", XlnxZynqMPState, boot_cpu),
>       DEFINE_PROP_BOOL("secure", XlnxZynqMPState, secure, false),
>       DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
> +    DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   
> 
