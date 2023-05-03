Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2983838ejm;
        Wed, 3 May 2023 10:17:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6C3HA08HyZtZkmZZshqqGJ6ICzEsLHtOE6J7n4yESANVfnsfyyjnSRt9SFBR+sVmaUl8Ub
X-Received: by 2002:a05:6214:29ca:b0:5ef:73a8:40bf with SMTP id gh10-20020a05621429ca00b005ef73a840bfmr9843951qvb.46.1683134256246;
        Wed, 03 May 2023 10:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134256; cv=none;
        d=google.com; s=arc-20160816;
        b=fQSud6R9T+pWil2E3GGblsvLIg6p8hOiuosvrYogXRPMYvV4snemQVv3DaFAci2UAX
         WeuYkNXI8JsaPVgmBU4euRVywpHdkbdA71UUQAjnpGTrEZv19F9Wa58c82Y0jEpPztE+
         AG2hVJWMBjIFlJ2esyBDYmvxMvf6bP9tsd5EM2ZUArOSfDvBz5QYKRcLD1XZxmL8wEC2
         i0PYC+9GeRLlW6nRJ6CAeJ7Kn2CZwC2e1dyknpcN41FywZNKL1nadO/m89yzhTVYSpQJ
         G2/OPflOVjrYxItSei96oKdRIYII/OVEYcVdMccXd8llxtN31lT2F+KYwUGtub0TPh/A
         MJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=npURnzto/8Qutnc+kFrsIYo0shCoZdo7jKvoQ2Z/Kg0=;
        b=EtsI8rYnN5Swi6qv5AlYxdcR0KjQiuu1rnlYYtc7bI/RRuVkqeLERpsEfBhx+ybA2H
         9QeHzSxAnNc6z3ChDQMoGK0eeX8Hp66l0IxQ5Cdl0pNX1//FmMSAK9H90ePax84hUMYt
         3LoO+hxeGKSQZ03C7HVeupSSbVdxzGyduOiw9teGF7DCrDZ4ErR9Qm1qNsVL9MEuOmEq
         3kdP3spQuqmE5++5voA8XNbI01d6rtNXzsZSipy3r1qyRoFL8WmrLNsfVKUp1n39glbi
         EYeTu+vy7qef4ecRw6uHARd/ggfZ7aBbmjXDEbNRLr2iFvjka6Nhn6bGJMXjpOvUmlTA
         VGWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GrBI+iq5;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q56-20020a05620a2a7800b0074abb40be51si19032649qkp.116.2023.05.03.10.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GrBI+iq5;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=npURnzto/8Qutnc+kFrsIYo0shCoZdo7jKvoQ2Z/Kg0=;
	b=GrBI+iq5C2mrylKXhIN84dRTzofEaR9vg+LstRsn61p7IBWIDD9l0mhXknZJeXJoZed3RD
	/JAwCrk+2rOn78c+EMh8L1ykDXtv4PGAqE/XUmXfETSA3GpOz351sJzb3HecZki8LxvnCS
	eMFFx2ilDiwEbxMQEFNwrJCFYXWTTfM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-UFmPIVBmN7qQLvziTkskXA-1; Wed, 03 May 2023 13:17:34 -0400
X-MC-Unique: UFmPIVBmN7qQLvziTkskXA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso704948066b.2
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134253; x=1685726253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npURnzto/8Qutnc+kFrsIYo0shCoZdo7jKvoQ2Z/Kg0=;
        b=Gm4CJWBWAsNsKiPl/ICLf+TfNfUIsOeRQNRXR7oLOpjfPz5QPjY0BG6Wn6PDrGdRk8
         0hIuQ5J0nsaor/YI8IbtrBTny60jCja19c031mUCN4Fm+mlqmT5XVH932nmSKzQOEYP0
         aQ8Lxu95lh9GU+Gg1MshmMsUlbXT83bgvlvx8uHHlzDZkryYXYmDMyhooToiMNkQhHre
         JRwQ3gKR5BD9Msvut/MZBUj0eXZw8Fl8zdrLkYZh+l20blVEZsrUqbujlFINV3JopYQG
         lhP75ZkkYvKP82yBU4LLlNcYA/fTIuN5HaEvYnXhJ6+d25g9iC4Bo7c6haz+WGrAyF6p
         Nr/Q==
X-Gm-Message-State: AC+VfDxvvLAIx0MKLoP0W7B/uXhnW7gTS+hvgTyySMEYMyiL58LF0f7I
	KbJTkwTEJQy+GkDjrtDJ/koOZunBJ8Zp7a8e/r1zK4A7mXZy5IVGnvhymM9rJCNBS3J+8D29Naz
	S50CZ8aIwb9F69a7LHZ7iV2P7Unm18tCYhZorUk+s1IS0Ct9eBKf2WFfwch3YMKmFE1TwM6RWVE
	tZ
X-Received: by 2002:a17:907:a0d:b0:94f:2c22:a7a2 with SMTP id bb13-20020a1709070a0d00b0094f2c22a7a2mr3401394ejc.68.1683134252933;
        Wed, 03 May 2023 10:17:32 -0700 (PDT)
X-Received: by 2002:a17:907:a0d:b0:94f:2c22:a7a2 with SMTP id bb13-20020a1709070a0d00b0094f2c22a7a2mr3401333ejc.68.1683134252545;
        Wed, 03 May 2023 10:17:32 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id g11-20020a170906394b00b0094f4f2db7e0sm17808191eje.143.2023.05.03.10.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:17:31 -0700 (PDT)
Message-ID: <1ea33ebd-06d4-f621-b159-468a9011ceb0@redhat.com>
Date: Wed, 3 May 2023 19:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 13/22] hw/sparc: add a TCX dependency for SUN4M machines
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-14-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-14-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lM007c7e3J7j

On 5/3/23 11:12, Alex Bennée wrote:
> This is the fallback VGA devices needed for board creation so will
> otherwise fail under "make check" with a --without-default-devices
> build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>

Not needed:

info qtree
bus: main-system-bus
   dev: apc, id ""
   dev: empty_slot, id ""
   dev: escc, id ""
   dev: fw_cfg_mem, id ""
   dev: lance, id ""
   dev: macio_idreg, id ""
   dev: memory, id ""
   dev: openprom, id ""
   dev: slavio_intctl, id ""
   dev: slavio_misc, id ""
   dev: slavio_timer, id ""
   dev: sparc32-dma, id ""
   dev: sparc32-espdma, id ""
   dev: sparc32-ledma, id ""
   dev: sun4m-iommu, id ""
   dev: sun-CS4231, id ""
   dev: sun-fdtwo, id ""
   dev: sysbus-esp, id ""
   dev: sysbus-m48t08, id ""
   dev: tcx_afx, id ""

Paolo

> ---
>   hw/sparc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 79d58beb7a..721b37a9ca 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -15,6 +15,7 @@ config SUN4M
>       select STP2000
>       select CHRP_NVRAM
>       select OR_IRQ
> +    select TCX
