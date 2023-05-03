Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2986775ejm;
        Wed, 3 May 2023 10:22:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7979ueV3TSN50HhZ6zj90rz7OyWpztMw//3WFgp6l6pftlR3VGJeYwYKcIphCyBYT005d9
X-Received: by 2002:a05:6214:f2a:b0:5ef:60a8:e795 with SMTP id iw10-20020a0562140f2a00b005ef60a8e795mr12567546qvb.4.1683134564292;
        Wed, 03 May 2023 10:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134564; cv=none;
        d=google.com; s=arc-20160816;
        b=FN4HCK9twIru35gBRYjk/Y15zN2YwRnl8c+a6xMNfXbuzrl42favL/7I60VhTfWmiV
         y4di2PGbOAgiMMVa1iHqjhvwog9mKicsqsl6q7m4YFx6vUWqVNI4jG/TP9gF4gakTQ+n
         LhYebUQ6A/uQMy9BQrjBlBIjKulJUdbg5kTLKAMy+2Bj5FEoZ//dACQWpCXrI2jeadH1
         xvtVlon0gyaKBJzZY+sDGziKUegJ6vGH2YY37Ok63jb8TfmnwHYA6GgEwNXbCEosKiib
         XacApYfBJSOu3+B83REilyGwehc1i/VOZdRs96gFoSWcl81EyVsf4/CotVvA4HdIS7lD
         +qiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hs1yjJSCdyJm4DTRmtArWRYOwu9w0s2fIa5hcOdg6M8=;
        b=lKO512xlMSFBk1owRvh88XAvFHQe5Qt7C9J7fZJgJDKR7iT5AXwJfgAeNZSZU/n/pq
         TckBvek/q4HBP1fl747uRi8NdN8VlTRyQVe89XROY2qCZHejDA/GxyuWNFNU8sHLhE2F
         OVlPEoO0vyQcUyGG5M6TETKZgmcnz4zii+4CQe0mp+nMHeEteLoPGCkZZAZxvLObx+qx
         8BcLmswVi9FFDO3CaGLHD2v+j/h+rgBja3+FrHs4wmtLAcF4QiMJy+McoIHAIg6RWI+Z
         RORCxyLmstSqBvTNYFgElbMYJbbSxW0NJMMg6mk0a6YDXpZGxh5fPGY2oz/XY5gizzqX
         quzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K2f+24sd;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h6-20020a0562140da600b0056ee98ad954si18924589qvh.315.2023.05.03.10.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K2f+24sd;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hs1yjJSCdyJm4DTRmtArWRYOwu9w0s2fIa5hcOdg6M8=;
	b=K2f+24sd6t5ieeWe6njRoG+RJ+KBQw0lsylUKgezX4Q9jxJvBDfrjd/fIxxCm4LrJkWDYa
	At/0TwNWXvHer5cRIRH7bwVU3UDK7n4IvWiyzvc0mdiQaLYFLU1BUwxXm1cP+HinT4DYsO
	oi20cmsYyCQwQO/txCt4YpLZDkCtXAU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-nVSizZdGPQmoRZZUxiwFuw-1; Wed, 03 May 2023 13:22:42 -0400
X-MC-Unique: nVSizZdGPQmoRZZUxiwFuw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f271ebbc2so663430066b.2
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134561; x=1685726561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hs1yjJSCdyJm4DTRmtArWRYOwu9w0s2fIa5hcOdg6M8=;
        b=KQWoVSir+HRszDPII/v9QKeYeK9GZQvfHtf2Hupoud4Jr8n8clBHcifcrY3NaHFzra
         YGno7yFhChHewHd+9W/L2k2Hq4kLGAmFNVCl8otkId3NenxJ3bcTsnVOJdhzibYN5kr+
         Wuls9qmFBiFvTuLRm7ei0uKx2igW5fuKlXYOnCggsy3eMSShmXihMfTzeBGocMq/2N9M
         MJDVLm5vcUWcE5ZDvMGAApVkX7uUNvJ7CF735r2U5+Ds5IdRAaDfwywxosd/rW5lL61L
         iCYP70hAODV2SKFAcC+4vkUfgcCBwO6+sAR7pBSKXwzcMmLmkOuA/Xun6WXjXn3RvK35
         uxlg==
X-Gm-Message-State: AC+VfDz91P5I+/vrwy6o9cAGcE1IX7jM/ES9fgw+PwxtGfBUMSEm9prs
	eJtY1W16Oh0mkYUeEmO4SkZ2KJ2NtKCaKqYKAM0mfy/Wyx71O9SH4wQL/j6p07kAy/GYhQqC8yj
	cElOap8f9DFK4aD92efMz08P7d+rPiqr5ChbDm2U2adgIFDC9PMEM/epj2GuyQSaLiIRzsfsbxw
	hS
X-Received: by 2002:a17:907:3684:b0:94e:547b:6301 with SMTP id bi4-20020a170907368400b0094e547b6301mr3715793ejc.8.1683134561035;
        Wed, 03 May 2023 10:22:41 -0700 (PDT)
X-Received: by 2002:a17:907:3684:b0:94e:547b:6301 with SMTP id bi4-20020a170907368400b0094e547b6301mr3715731ejc.8.1683134560532;
        Wed, 03 May 2023 10:22:40 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id oq27-20020a170906cc9b00b0094f410225c7sm17415001ejb.169.2023.05.03.10.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:22:40 -0700 (PDT)
Message-ID: <436a1596-fc40-0ee3-0505-c7f12ded8275@redhat.com>
Date: Wed, 3 May 2023 19:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/22] hw/arm: Select GICV3_TCG for sbsa-ref machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-9-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: L+EvMCut7L6H

On 5/3/23 11:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> This machine hardcodes the creation of the interrupt controller, so
> make sure the dependency is explicitly described in the Kconfig.

gicv3_init_cpuif is used unconditionally by arm_gic_realize in 
hw/intc/arm_gicv3.c, so right now the separation between GICV3 and 
GICV3_TCG is useless.

That said, using "default y" is wrong.  The correct definition in 
hw/intc/Kconfig for these should be:

config ARM_GIC
     bool
     select MSI_NONBROKEN
     select ARM_GICV3_TCG # if TCG
     select ARM_GIC_KVM if KVM

config ARM_GICV3_TCG
     bool

config ARM_GIC_KVM
     bool

(where the "if TCG" is incorrect right now as explained above).

Paolo

> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-9-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index cec7898bb7..0cce0b8d5b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -252,6 +252,7 @@ config SBSA_REF
>       select PL061 # GPIO
>       select USB_EHCI_SYSBUS
>       select WDT_SBSA
> +    select ARM_GICV3_TCG
>   
