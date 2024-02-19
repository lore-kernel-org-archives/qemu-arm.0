Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp692537ejb;
        Mon, 19 Feb 2024 05:39:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVukV6Ej5fNdK1hh/yh25aAyQaUoRMn+V1g17RdPLbaPEax1If1W6RCtiHpE2v0AB4eU8nJhQ/197fRwmAH2/jX8Z51whJ
X-Google-Smtp-Source: AGHT+IFvTjOlOfo2q6hbAB/e8b/g5mpxurL65awA78SSs0ygeWElzzeqnnRlO5vmZYe+UsMk4HT/
X-Received: by 2002:a05:620a:56e:b0:787:367a:c59c with SMTP id p14-20020a05620a056e00b00787367ac59cmr18151350qkp.19.1708349944895;
        Mon, 19 Feb 2024 05:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708349944; cv=none;
        d=google.com; s=arc-20160816;
        b=qk6LCHlpV+zXV8hpcaroudm6h8/ENtSPQ+wfSMEIwcTLeNtXMklOhJUFIiD3dnAzp7
         tjJF9ylsUzvuw3yyTjDbVh7c7xE3rVVJIDS9oMVfujAAcdFbAl8F3kT9aDJWgpWOlsM4
         r+uKhzHJPcAIELn5BVHqDuy9m+6XA0cMlJpoB9+wpF3MxS9emLY1xfhVdm74aQYJw/j8
         rQwH7wwR3LAOMLbZS4Aq706RxXblK2DB1aEX/Y+dwG2wtbNdcb1ApuOrpNYFh6VuSQUJ
         EQCX6I0yP3UCxdeudaI40LC7oCLIWcGuIc6xRzaHAOfJFm5LZ8McbppLA7K0zz+VLuLF
         fQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=mzlkps8ssHKgwsZfhp/xIz76Yrr0q9leJ/xdBj/Nm9U=;
        fh=nRdgYcIEWVvkxcR1Mf8pT2uSDwt7eFo9+ka7gwbkTas=;
        b=ULpDQjy9RqFkBOwXRrtSM/SfkplO6f5qMhOSylvtm9IhDkjGDtDVQ9ZJYqJg65AZqT
         aDniuNFQ4BMjISUjWRy34IEB97D7ZMjg8nIx47SFfLmueKceMlwgyQ9IYe+IxYQpG7bi
         EX19FSqHng27i9qj4r1kC9djhcvwqqaU2I16CWDsFanZPpxku9TO0gcQFkKjovRfAvuB
         Qzl/PtdT1bGnc3C1gNECEKEW1SkFl5IQ+wvlxSlqr+JqL5jNJk5btPFfB7k9ElyBy6hs
         2eKJikoyu90Nh13/8DN0/axumQAdqujEEAvA4IBTv1+Zhm1UFAGx4SqTbnG9RHzyFPzA
         gj6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Li7XmoqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25-20020ae9f819000000b007871d80eeb7si6265604qkh.171.2024.02.19.05.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 05:39:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Li7XmoqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rc3r6-0004Yn-9z; Mon, 19 Feb 2024 08:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rc3qm-0004UI-2m
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 08:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rc3qj-0001L4-HW
 for qemu-arm@nongnu.org; Mon, 19 Feb 2024 08:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708349904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mzlkps8ssHKgwsZfhp/xIz76Yrr0q9leJ/xdBj/Nm9U=;
 b=Li7XmoqSLAZFNc8QmjMGZ/eCc84nwV4CoSpb8DreY7nwUpiXtI7D9kxvSq9J6doeevnn9K
 z6bpYTPE6+8dxWSxyTPS1xUPqAeLEFX3FeIXbjsOTxupFru88kdstGpI9PypQfzQLCsVgI
 cop9EWS8fECbuVxFbkhvv5Xn4f7wpe0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-CRiQzIAUPK6bmJIOVQhOtw-1; Mon, 19 Feb 2024 08:38:23 -0500
X-MC-Unique: CRiQzIAUPK6bmJIOVQhOtw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7816bea8d28so1034773985a.0
 for <qemu-arm@nongnu.org>; Mon, 19 Feb 2024 05:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708349902; x=1708954702;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzlkps8ssHKgwsZfhp/xIz76Yrr0q9leJ/xdBj/Nm9U=;
 b=JZ5kc/zl5satvpzp1t952tC4wiE9Wwh+lnx7klK8v1EkCV85us7T3D/WxEjd3rLz63
 GvrgOiFNSfIwsHqW3GNMOi5GgQPieITG/lit7POBgtONIilc5Z78Z0qNbq8TjtHqetbo
 9ZMck2LOunMvJUGbiV/KiGXgvamrnNrCFAFNX28WOorfzbpWxugRlxDdpty1S4NJVgfz
 z5LddJb3sE69qgocfGFealssEhtcAVS4ji7J0P5aArQ///WYgS7HpJ9+g30oSG3azGv3
 4OzDQREQDVgPqr54674Q+AniD3GPtqo+Yx0FwQhxkKEgoRq+PVqkBDuPdn7Qzj+2qr8L
 xOzA==
X-Gm-Message-State: AOJu0YyNqQZvGPpTCnrJw3K/uN4+pbj2ffMkuK5oqFvoFji+vOaD28Gj
 PCKZ7UtnTJOkOnLAe8DO+7Sf5nQqszzoP2iX828ROKyHlac5tUimZxxXXEdiRtkEzpwJkd91xm2
 b7n+pmEe+CWWF7TKNflWW93ZYtkwa+k7J1HdkBAv1vhS4rxKaAA==
X-Received: by 2002:a05:620a:895:b0:787:2cc2:41c1 with SMTP id
 b21-20020a05620a089500b007872cc241c1mr19226029qka.25.1708349902577; 
 Mon, 19 Feb 2024 05:38:22 -0800 (PST)
X-Received: by 2002:a05:620a:895:b0:787:2cc2:41c1 with SMTP id
 b21-20020a05620a089500b007872cc241c1mr19225999qka.25.1708349902315; 
 Mon, 19 Feb 2024 05:38:22 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-48.web.vodafone.de.
 [109.43.177.48]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05620a144100b007873ac0ac56sm2455996qkl.59.2024.02.19.05.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 05:38:22 -0800 (PST)
Message-ID: <84d0375c-b687-4e0a-b7c7-77f1891ea244@redhat.com>
Date: Mon, 19 Feb 2024 14:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] hw/s390x/zpci-bus: Add QOM parentship relation with
 zPCI devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20240216110313.17039-1-philmd@linaro.org>
 <20240216110313.17039-20-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240216110313.17039-20-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.072,
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
X-TUID: 6EvUJBsw5MPT

On 16/02/2024 12.03, Philippe Mathieu-Daudé wrote:
> QDev objects created with qdev_*new() need to manually add
> their parent relationship with object_property_add_child().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/s390-pci-bus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 3e57d5faca..6d07a7b530 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -934,6 +934,7 @@ static S390PCIBusDevice *s390_pci_device_new(S390pciState *s,
>                                   "zPCI device could not be created: ");
>           return NULL;
>       }
> +    object_property_add_child(OBJECT(s), "zpci[*]", OBJECT(dev));

I think there can only be one zpci device per PCI device, so do we need the 
"[*]" here?

  Thomas

>       if (!qdev_realize_and_unref(dev, BUS(s->bus), &local_err)) {
>           object_unparent(OBJECT(dev));
>           error_propagate_prepend(errp, local_err,

