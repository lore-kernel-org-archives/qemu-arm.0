Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp913478ejc;
        Fri, 26 Jan 2024 06:35:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqzhk1Oombfet/MDcJtbM9cJ7J2RPqOnHmQEQoLiDgQprIZNxd938lMGiBe7gjcsE1rh0Z
X-Received: by 2002:a81:6c4b:0:b0:602:c2bb:3f71 with SMTP id h72-20020a816c4b000000b00602c2bb3f71mr2171256ywc.3.1706279712374;
        Fri, 26 Jan 2024 06:35:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706279712; cv=none;
        d=google.com; s=arc-20160816;
        b=qTzNTUxb8guRA9RkiiihYSW7QJWcQ0a8I/3MLtHk6KLQfJijMbzBjYt1icsIRqiqbf
         VbxiCqzZhcZsZptnAn7f8ulEzJOkqP3HtcqnDjYTT8jl1Fus3ApjMFsPygfkLVFviRKT
         NSZ4WpZMmUAnUWu6g+GvN+mT5skbzDrMakrghD2Wcug6UFCeCxYy5gfF1RHfFz3CiSiR
         MrPxO/guG3aZR8xRMGlw3OYpae9FowFaiFwmh3XSExf7pchGR9VoxRwBZhQkvE2K4i9j
         P+CFK2JKINLPIiSPYAVh3H05/qa3gb9v4LiupUSJnRaHNHqUf2l4RJZ+vieoPFMkp9f3
         xmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:sender:precedence:errors-to
         :list-subscribe:list-help:list-post:list-unsubscribe:list-id;
        bh=XO3uKYSgCxcQQA08HN7uml3FSQq73eoPnM4iRraw2cY=;
        fh=RIVWBOSs2OZlP7XXIPkGQw38oz8oDq1OvCeujjh55qg=;
        b=I7L2lZVGAZdVmf4JiJJsZHuJwfhXcdqqBIFM0+uJdwY8kF+rM8+sDbJUI/VRWKos9+
         1+c/Fy5iFe0226+UGneyVFKVDfcye1rlbdZiev4XM01tfOIl5ObEIYy2RBE570SeXb5m
         JOxT7vk90VeGk5wDhYrHgdB6wh5TwQvybhpIdVucS8ZG9y3qzGoXnkmP5gfpQK/HgTr2
         nkcG6CG/Mge6lyISNHObz+7QuZVth+7DJHvCouF008gGZCXOP03xr/aeGwx7T2MOvp9Y
         sJDZhUbvaR6LS/1Iew0uXv6I41/M+a5LFZZotxkzwFvqQ2r7RGvm4HwyMCHBjjN5rdXM
         CXbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NwsMUB/6";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id bt15-20020a05690c072f00b005fface1d14dsi635253ywb.556.2024.01.26.06.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:35:12 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NwsMUB/6";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.672041.1045653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTNHI-00084r-68; Fri, 26 Jan 2024 14:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672041.1045653; Fri, 26 Jan 2024 14:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTNHI-00084k-3P; Fri, 26 Jan 2024 14:33:56 +0000
Received: by outflank-mailman (input) for mailman id 672041;
 Fri, 26 Jan 2024 14:33:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtOA=JE=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1rTNHG-00084e-89
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 14:33:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec9d43cb-bc57-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 15:33:52 +0100 (CET)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-bajFMqihMqird2V13U2hbA-1; Fri, 26 Jan 2024 09:33:48 -0500
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78377692045so57889885a.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 06:33:48 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 y5-20020a37e305000000b0078392eacfd4sm619792qki.80.2024.01.26.06.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 06:33:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ec9d43cb-bc57-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706279631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XO3uKYSgCxcQQA08HN7uml3FSQq73eoPnM4iRraw2cY=;
	b=NwsMUB/6PxY0JCumybYXX9mAauu73kmFVYkoiceuNOYUSQkfOIM6gL6h/oUDEvCauyGZ2U
	E5ZwqzUUR4ycXcpVrvzBjwLC9evGHCDD3/3sbxB5kHenGhsfFELjH4OBJFPI1wS0d60mmP
	2B2pEh113iWJlJBTbD+/651LifpUTVA=
X-MC-Unique: bajFMqihMqird2V13U2hbA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706279628; x=1706884428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XO3uKYSgCxcQQA08HN7uml3FSQq73eoPnM4iRraw2cY=;
        b=ibJZe54d2gvFUOaQ3gXcFTKjgAY8RFlgdpPmxd+LhhFZs9zJmnkVzY/ToZ+DBpju5L
         RF5pwULh87aYr9iszdXtfYZz+B9VUlw7lEpY8JhsorENdS6xWWfyFPhqrrF0kKGWjwTe
         NBi8wOLB/pW30S/zJuIbiQzj5WmYOEpUcRTKHyZoTsiuwDEXj4pReFwtG89x1zjcKtfZ
         FHKHil/YrmvsNJWvYJGkwd3HhJUkvnwqldCsABP9/MFypWrNkF24kjbG7/k20Rq58wd/
         J2jveE7IOg4Crtq/Zkt0a1Mm9FLzFN2hkoo8lXopiJpETCaI2lrsfXo6/ukztCPJlDo4
         n62Q==
X-Gm-Message-State: AOJu0YwxaX5CPPP3hA1qrqQVhOnF0AY9CyYCXk5obwnn+s2ZdP6Nl/XD
	/lDruih0xTqyr17vb63WIPa7yU46F0IEkIJy8RmIP4KsyZdDM++W1dStSS2Mk2j0ki8Svkmcjn/
	9JAoik1mwn26I6N9D2pV+L/NvNr9MYdRz7aQvH0fTQp9W0pKRQjK+X/BZvZF7xxzJ
X-Received: by 2002:a05:620a:a46:b0:783:9a8f:27a4 with SMTP id j6-20020a05620a0a4600b007839a8f27a4mr1843473qka.5.1706279627836;
        Fri, 26 Jan 2024 06:33:47 -0800 (PST)
X-Received: by 2002:a05:620a:a46:b0:783:9a8f:27a4 with SMTP id j6-20020a05620a0a4600b007839a8f27a4mr1843428qka.5.1706279627561;
        Fri, 26 Jan 2024 06:33:47 -0800 (PST)
Message-ID: <9ae3e373-5213-4906-9a57-7a5eb026a51f@redhat.com>
Date: Fri, 26 Jan 2024 15:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/46] net: report list of available models according
 to platform
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-3-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-3-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5Synj7EsDI/S

On 08/01/2024 21.26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> By noting the models for which a configuration was requested, we can give
> the user an accurate list of which NIC models were actually available on
> the platform/configuration that was otherwise chosen.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   net/net.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
> 
> diff --git a/net/net.c b/net/net.c
> index aeb7f573fc..962904eaef 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -75,6 +75,8 @@ typedef QSIMPLEQ_HEAD(, NetdevQueueEntry) NetdevQueue;
>   
>   static NetdevQueue nd_queue = QSIMPLEQ_HEAD_INITIALIZER(nd_queue);
>   
> +static GHashTable *nic_model_help;
> +
>   /***********************************************************/
>   /* network device redirectors */
>   
> @@ -1087,12 +1089,94 @@ static int net_init_nic(const Netdev *netdev, const char *name,
>       return idx;
>   }
>   
> +static gboolean add_nic_result(gpointer key, gpointer value, gpointer user_data)
> +{
> +    GPtrArray *results = user_data;
> +    GPtrArray *alias_list = value;
> +    const char *model = key;
> +    char *result;
> +
> +    if (!alias_list) {
> +        result = g_strdup(model);
> +    } else {
> +        GString *result_str = g_string_new(model);
> +        int i;
> +
> +        g_string_append(result_str, " (aka ");

It's an abbreviation, so I'd rather use "a.k.a." instead of "aka".

Apart from that, the patch looks reasonable to me.

  Thomas

> +        for (i = 0; i < alias_list->len; i++) {
> +            if (i) {
> +                g_string_append(result_str, ", ");
> +            }
> +            g_string_append(result_str, alias_list->pdata[i]);
> +        }
> +        g_string_append(result_str, ")");
> +        result = result_str->str;
> +        g_string_free(result_str, false);
> +        g_ptr_array_unref(alias_list);
> +    }
> +    g_ptr_array_add(results, result);
> +    return true;
> +}
...

