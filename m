Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2661330ejq;
        Tue, 9 May 2023 05:00:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O1dt6Wvzf77yyMHO2S+fq5ryug8mdLeMKys8kOwctEyM26kifRRaR3lfGsMz+UDetxQ0w
X-Received: by 2002:a05:6214:62d:b0:5f1:6be3:13e9 with SMTP id a13-20020a056214062d00b005f16be313e9mr19422342qvx.6.1683633603650;
        Tue, 09 May 2023 05:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683633603; cv=none;
        d=google.com; s=arc-20160816;
        b=PUdgQ2hCKderb0pYgxwDEPwW5fEWRM4GTfnD61QZ0AEUrszD2zaerZD5nMsBLYsLam
         G6qk8ECk5Dh5GY98KOpVvC8g+DG6HLdJfNGcpJg/w77CKx2/9se5PWsxG1kKe3ZZBJju
         UefYrr8bIOQb3esM7/ytaGSKhl3jw0A/5sxlxEGdcGapixBvAe6wnF0O8K36y3KUQmpG
         qokWmFZ4Wrds/xOpdtdKW6yH5WeGyJBlB6wcdk7cCHkRSk2O50VJ4Po6aVXE8AX0GAX2
         BBO78v2/pWwjmdxJdZVcFZlnFTGykyu5wwOFYpzesbLV2+wa6tHl7g/T7dJ6Q0YvXxkI
         SGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9eruX1xU0kSyUmT6Iz9QvGjV36rpRjfCr5CWvM8poI4=;
        b=qUZBb7vZr471I3G74MfEeJvPvam/4X8cMVCUXhVtSYyjBmM6rb3pxFXi6iEwFxZNxx
         vcOnbbLF6NArUP08aUflJISY6FGV+FVEWjmczzGcNKnLz8WQcCXVwVB8XADd+5OIVwSh
         bypIryAlrKG0pEgP6qnTvnCdyFAxot/NyE4eVBK5dliWW0meO0Ft4z3rZWqfNrOsSJmZ
         R87eR7Yq9My4E1m+v+g6TdFaNALRt/dM2T/46eU/1VRh325D2mPptI2iAHdPrEwFbt26
         p5FEq+8PXxFrj5SFU0WgBkFTjdteYl/bRxDNdZ4uVzi/IQCO/1Rf36BpnnKFjicpzjqG
         VJAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkJUthes;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q6-20020ad45746000000b00621078f6aadsi839292qvx.312.2023.05.09.05.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 05:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkJUthes;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683633603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eruX1xU0kSyUmT6Iz9QvGjV36rpRjfCr5CWvM8poI4=;
	b=fkJUthesHVZADCilyUJc9JY+NuWs87Wti6/igkSeq4/iNnaGLsniJa8YhOiBDtMNOCUH89
	3rifeqwDyRLwifgj7ylZOJrV+Hktd+MI11QfJO7FTPvEreIURzUMBEc0W4l1ZsdFZN9sMh
	J7hSVfdLFd3q81X2lB2+R2npXu3RpMo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-DQl-IkCDPoi-U7nzDy8fEw-1; Tue, 09 May 2023 07:59:31 -0400
X-MC-Unique: DQl-IkCDPoi-U7nzDy8fEw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-965cd056598so640247566b.0
        for <alex.bennee@linaro.org>; Tue, 09 May 2023 04:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683633570; x=1686225570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eruX1xU0kSyUmT6Iz9QvGjV36rpRjfCr5CWvM8poI4=;
        b=TzwU2GuFtpx+6fx2yHvYH1yWDy2QzrGtE+vlcgx1snN7RPBkAKAvS/HyB5U3PGURXH
         C4MygDoXJbEHr28X+F+fV65En5zil/flK9Z9BD3NR6oLptOAwpY1ID2yZcYoywkGnnJ2
         gIr9KsTpSeRSjpzmAcFNTNJVG2/Be2/+UQxVmctNCdLnI9kY6RGaVUsQYkbZDKUbaRnx
         fuAonvuSBO/dHWFlQ2tZOfgvtEZvLMVOrLmKBO8ynpmMEcGfS2ruTEVpYDPBwH411tGR
         IgnfFGcsMHt1vCjbCadJbyA9F/giYtVFv4Aa5RLIJVKUQowHi2xr5GWw5AaZYMO05R85
         HFvg==
X-Gm-Message-State: AC+VfDwVDAhYzVQyRLvHmZKFwCamFJIOoGtP93W718/4+WZLQXUwqx++
	7m8KmU32YnH20QdDXS9sfhVmAfj3SKRNGclUWevI+ngUigzcXhhiE4Uq3dblKf2QqKv5Qj5E8LO
	jC98mWQ3oaPT/M2aZuaEfWACxDvFa4NGYZIT1pe2HMZEXm94rPEC14G/bXI0pzqzZ1SXhrk+NHm
	ds
X-Received: by 2002:a17:907:96ac:b0:948:a1ae:b2c4 with SMTP id hd44-20020a17090796ac00b00948a1aeb2c4mr14233170ejc.6.1683633570074;
        Tue, 09 May 2023 04:59:30 -0700 (PDT)
X-Received: by 2002:a17:907:96ac:b0:948:a1ae:b2c4 with SMTP id hd44-20020a17090796ac00b00948a1aeb2c4mr14233115ejc.6.1683633569647;
        Tue, 09 May 2023 04:59:29 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id ev21-20020a17090729d500b00965b416585bsm1259833ejc.118.2023.05.09.04.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 04:59:29 -0700 (PDT)
Message-ID: <bfde137b-3cb6-319b-2e94-57457531e855@redhat.com>
Date: Tue, 9 May 2023 13:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
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
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
 <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
 <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com> <878rdxbuoe.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rdxbuoe.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Z0fcIVgqL3MR

On 5/9/23 13:37, Alex Bennée wrote:
>> Then, an accurate description that uses "functional" in that sense
>> could be as follows:
>>
>> The Kconfig system will include any devices and subsystems that are
>> mandatory for a given machine type, and will flag any configuration	
>> conflicts. However, the person doing the configuration still needs to
>> know which devices are needed (on top of the mandatory ones) to obtain
>> a functional guest, and Kconfig will not provide any hints in this
>> respect.
>
> So I thought that was the model I was following in adding devices but it
> seems I don't understand the no-defaults behaviour. What is the
> difference between a device that is added in the machine.c that makes it
> required or expendable with -nodefaults?

First of all let's look at softmmu/vl.c, which is what creates the 
backends of the default devices.  These backends are basically automatic 
command line options of the "old" kind that directs both the creation of 
a backend and how it's associated to a device.

For example, if you have neither a -serial option nor a "-device 
isa-serial" option, vl.c's qemu_create_default_devices() will create the 
machine as if you specified one of "-serial mon:stdio", "-serial stdio" 
or "-serial vc:80Cx24C"; if you have none of -netdev/nic/-net, it will 
literally add two "-net" command line options corresponding to "-net nic 
-net user"; and so on for many other devices unless the board opts out 
(CD-ROM, floppy, SD card, parallel).   There's also a default monitor 
which is a bit out of topic here.

In any case, the effect of these "old" command line options is to 
populate various arrays, for example serial_hds[] for serial ports and 
nd_table[] for NIC backends.

There are then two ways that a board can process these arrays.  It can 
either _always_ create the device and possibly leave it not connected to 
any backend, or it can create the device only if the backend exists. 
Looking at qemu-system-aarch64's "-M virt", pl011 is always created with 
create_uart(), i.e. even with "-nodefaults"; NICs instead are only 
created if the backend exists (search for "nd_table" in hw/arm/virt.c).

In the former case, the device will have to be select-ed in Kconfig.  In 
the latter case, instead, the device will have an "imply" directive, and 
will be left out by --without-default-devices.

Paolo
