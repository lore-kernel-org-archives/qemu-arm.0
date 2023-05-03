Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2985908ejm;
        Wed, 3 May 2023 10:21:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6d3bUKAwwj4g4Psoc57o/k1R0ZykeXWhcUTxRuO0MI3ZHvVRL8QWwS1j/Nqdg1fHjkPI8R
X-Received: by 2002:a05:6214:501b:b0:616:5215:42ff with SMTP id jo27-20020a056214501b00b00616521542ffmr12095192qvb.28.1683134466216;
        Wed, 03 May 2023 10:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134466; cv=none;
        d=google.com; s=arc-20160816;
        b=R618G+pBAtPPQkrL2D13Fo3RqzVVu6I4PjTfkkhWPaO46Bqeo58Mt7Oy6fe69Z/iJM
         p7kup6qVaAFo9/2ZRw0FMosEYn9Hmpmp6CU62nGvc6EzOoL4YoMhbQH7H6MDUhAPHeta
         8R2STmzEGF4TdTvb2HphYc5g5X92dZBrHATpyRWVS9MidzfYn4Ip3Bw3lERjX8Cs1Mda
         qK2Ux+feS7L17r9aTtqwSXY/G9A3je3W6heIHDLwULqxWXeB5ruiHgQW02ACv+wACfJ1
         hXstNKbalKKbHVaapRzZXEZCs0TKjn+NMcBqFYuY5dhvQWOyA96MEGglEhQn/ea98jQ2
         FfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t8uvV2Uu2IelEjxdK6H8gm5ulXz4XSf3QdDPNcJH23A=;
        b=FWNA+POq4ssNSdJOOCL4ek5DrR/02AHmrJP9D3+9NDh002Iv+hsxhv57n3pg/AbCs6
         jWRR4JBXLFGIECwQvHyzN7Wlzc421TH0YDc5Jr/ZoSyJxwMb5kNo38xPvzxMPzzX7Mxu
         gPWjj2IEU41ar/FJioCf4tgJzuoBLLyZRiUR6Sh25idTJb5vyvLG4uzg7ephx3q0jxaL
         0R/WQKo/gJoLzVRr+RA7aQ2ulePGodNGsyIVhzR0MJsN6ASvCwYcdMJm5HwFlKUdk58l
         KQx1VKnQnyARaZo0J1IuoOwnS/R7+bNSmOj85WTadpd0O0w+TXlyVn2oAR/3g/6J8jxX
         a+3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BXgw0ys6;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 9-20020ad45ba9000000b0061b73b285bfsi833505qvq.7.2023.05.03.10.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BXgw0ys6;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t8uvV2Uu2IelEjxdK6H8gm5ulXz4XSf3QdDPNcJH23A=;
	b=BXgw0ys6k+iiOWqar/RmUEeZ1L7jFrpjYtizKmk3knQW2et0yiePlnBYAo3djFlqYMXroT
	0cMAbwLus5AUA9PAAFc3tvfHLUo5fHPl8roWqz/riP7InSeKIz6K/EPePbC08RroNTsin7
	ZUq/QsRoolCruF5J5UfahTJojHIPmp8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-66tzriI6MlGnVlrknmz2Pg-1; Wed, 03 May 2023 13:21:03 -0400
X-MC-Unique: 66tzriI6MlGnVlrknmz2Pg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bc57d7967so4686796a12.2
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134461; x=1685726461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8uvV2Uu2IelEjxdK6H8gm5ulXz4XSf3QdDPNcJH23A=;
        b=iMsEjv6zDv0g/FYPH2theqUASAb4y4t1tnFxEJT2xmZvtfitQmZapIbg0lC9E2N655
         vyFD64vaCHwpYpebwpNtMzWXoAanSPHUKncBCnvrbcpEsXYvVaTZJ28nBARd6/Zlmk5w
         EyOSXt6Z4b95XVlvlHzuS63LVKI0DyW4CDw7+t547OXIviBTqXEp9UjT8qN4+Z6uW0ft
         Q4lbvoRbtLuJhCZ6UAmJeamjOvnFBt2hXTnNWZaTymaB9gbGU3ZkYBr1Lm9qSh639M6T
         LEPfAJEmbTMQiUUqQLyDZ5x37JhrNjf7xG933MTSsw4piE8DMp09wmaqvC+k565MpZ4p
         tRkw==
X-Gm-Message-State: AC+VfDwK2XXosC0delvXlSuU/bX+M85bbxqhv5Ncr/IdL5EPoV5cCKMt
	X191gC7Rq69rp8FvvkAUSJ2sBQNkI+OGrApgGMdeyjFNX+j0n/EfyD4gDSiZMpCTOiliezXb1D3
	ZRqaLUhn91FSh7N/EvzBXWv1xEarqd1JBGbM+ZWrdd8vNxZUA0qk93YzrvzVgi+S4nxDJ69oJU7
	Jp
X-Received: by 2002:a17:906:dac5:b0:965:6603:34fa with SMTP id xi5-20020a170906dac500b00965660334famr2055422ejb.12.1683134461614;
        Wed, 03 May 2023 10:21:01 -0700 (PDT)
X-Received: by 2002:a17:906:dac5:b0:965:6603:34fa with SMTP id xi5-20020a170906dac500b00965660334famr2055362ejb.12.1683134461232;
        Wed, 03 May 2023 10:21:01 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id mm26-20020a170906cc5a00b00961828830d9sm4398573ejb.35.2023.05.03.10.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:21:00 -0700 (PDT)
Message-ID: <34f3732b-1452-b75a-1358-ba2a15d9ba87@redhat.com>
Date: Wed, 3 May 2023 19:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 17/22] hw/xtensa: add VIRTIO as dependencies for
 XTENSA_VIRT
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
 <20230503091244.1450613-18-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-18-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EeDFcp6ZMuY7

On 5/3/23 11:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/xtensa/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/xtensa/Kconfig b/hw/xtensa/Kconfig
> index 0740657ea5..a54a9d395e 100644
> --- a/hw/xtensa/Kconfig
> +++ b/hw/xtensa/Kconfig
> @@ -6,6 +6,8 @@ config XTENSA_VIRT
>       select XTENSA_SIM
>       select PCI_EXPRESS_GENERIC_BRIDGE
>       select PCI_DEVICES
> +    select VIRTIO_PCI
> +    select VIRTIO_NET

Not needed.

Paolo
