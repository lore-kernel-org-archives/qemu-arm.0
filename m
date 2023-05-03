Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2981383ejm;
        Wed, 3 May 2023 10:13:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7J7/wUk5r5fV5o0L7PaLhKNpWgK9DvDBxRo1vQONZaY40gPn9Hvu+a0Fs0fQDdKgukFr5c
X-Received: by 2002:a05:622a:40e:b0:3dc:7fcc:31c7 with SMTP id n14-20020a05622a040e00b003dc7fcc31c7mr1280109qtx.2.1683134019707;
        Wed, 03 May 2023 10:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134019; cv=none;
        d=google.com; s=arc-20160816;
        b=wJlPxljzB5ozgcnMPdocUuecaOUUX5k4aSXWWLTZ4KPA6QmV0N5gwb8c3pJtNQ6EiL
         d2pgjffp2/sM7MpasRcOgttu7DGgGmnhrQA8qDy5YExS4bbx6wkWplNodApbd0DWSSSR
         3gkplaoDk2wm7M0EHVwzt3x+DX5iRBnvUPG34gT71gqIjvKUmTJ9kLYSU2O1U7clWb6M
         nIA2WxWbiPJVdneSRbTjkfTgXMjTPrJsu/TSQO9cZQSjSWcJluI3dIQy5teYetHPu1CR
         OJpZxolRki4kHuXEwxkTFKKsFkkth2DhpMAZSPQ6hbIty5tEDZr7banP3QSOKVH2vcNJ
         RUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dvsmRfcyMA2IRZZSI8Bptlq0LVXzOgNstthrWbyr6ok=;
        b=QFzzu2Hsa5Cb8e6s+ws8aG94ffh0IeDDPhi9NK9mfhiqtTAlXtctgMW953ppZssFT2
         2KvI5LbFkrLS7IvwppLWGWEg4aHnzqwLd7un172GEiS3ilJgvXm3Uk2vNm74fxoGyBci
         PwL9C4pQujgRUdki1KscnPxSsHTAL36+QDGZSG4s1R/2c9Ux0A/+YIpmQ9T8NKJyibHv
         ywYQO6aEBLOOTOXow7P8ph3omeNdv3YB7K7zGw35bHSbYH+keTOuGlPmEkuEvoNWeiq0
         tTAdeIly18C2P1IZguLU0/xZkn08F2Whmqqmw0octY08+ycLLc9Em9dVLGUtPX5UdgZh
         uBMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUIPjNs9;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y13-20020a05622a120d00b003f20792276asi5844053qtx.517.2023.05.03.10.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUIPjNs9;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvsmRfcyMA2IRZZSI8Bptlq0LVXzOgNstthrWbyr6ok=;
	b=FUIPjNs9n/zAQFM/OwIkXYk3GlXNvFgw0gtn6jW/pIbkcY9vwkUYG5Sh346LalLPUVianl
	Rd4hw+4MqS98iDS00/kO/Wt61kwcsjr8o1AspyE8LWjwF+WEs6WpwrNIdvYx3l0ZezfQIY
	gHSkZ77+evJ/N0LadDQRfFmNgzM6E5U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-oIHLOJyMPoeeXP1OcXY57A-1; Wed, 03 May 2023 13:13:38 -0400
X-MC-Unique: oIHLOJyMPoeeXP1OcXY57A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f29909e11so488504166b.2
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134016; x=1685726016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvsmRfcyMA2IRZZSI8Bptlq0LVXzOgNstthrWbyr6ok=;
        b=T5dEspTJcipoR8OU47aR6E7AogA0QZgsCu/KaJkz//FjPuHgrqvb4J+tAw6TLBvl7V
         0v8d6UrgoKrtgZ20xXGivBBW6AqwNRl1jjQotU0ozwdkUxN713Ut3dB6Lh8XDOLGDofv
         3oJyzmV/sS3Dc2UEUhX7e1Wo+xs71rRrrtVVEj5cw53QRkW90CNDM8yjfTNap6tWvGpb
         xiAv29oXCDasSXXv70jvQyX4XrNYcAHBAu8MJKYFREuEIQY1CWTdiAzMQdTe8E6pE1WE
         3NeSN/O6JFe/sSDrWjkGw0tC1lRA7MWu/YpKziD7XL0vXfzyW29bqRtCCHy/abmm0gs2
         QhqQ==
X-Gm-Message-State: AC+VfDznws9OEqk4QEraGaFnQY/ENdLoY7dRC47mB2fDHhNNIkMukbQI
	yUcR612mwSiElLLrOFawfc/CWyRBdCRrd+PpDuRtruk//i87JnLYulp3K4+Gyk65eJjNgx1OAdO
	GOf6Zich64s7ZqkYPRThysrCGIMHxAHR+pcgUMS/ubcgePdG+OoBLYJQHLijhn6w6xPs67hWLRU
	49
X-Received: by 2002:a17:907:9415:b0:94e:f969:fb3e with SMTP id dk21-20020a170907941500b0094ef969fb3emr3888283ejc.43.1683134016452;
        Wed, 03 May 2023 10:13:36 -0700 (PDT)
X-Received: by 2002:a17:907:9415:b0:94e:f969:fb3e with SMTP id dk21-20020a170907941500b0094ef969fb3emr3888215ejc.43.1683134015892;
        Wed, 03 May 2023 10:13:35 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id vc14-20020a170907d08e00b00959c07bdbc8sm12679708ejc.100.2023.05.03.10.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:13:35 -0700 (PDT)
Message-ID: <06639be1-8986-9234-a44c-4630dbe378a4@redhat.com>
Date: Wed, 3 May 2023 19:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/22] hw/arm: Select e1000e for sbsa-ref machine
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
 <20230503091244.1450613-10-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-10-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Eosp68vjc6eg

On 5/3/23 11:12, Alex Bennée wrote:
> From: Fabiano Rosas <farosas@suse.de>
> 
> This machine explicitly selects the e1000e network adapter if no other
> option was given in the command line. Make sure e1000e is present in
> the build.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230208192654.8854-10-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

This is not necessary, and patch 10 is not as well, because neither VGA 
nor a NIC are added with --nodefaults.

Paolo

