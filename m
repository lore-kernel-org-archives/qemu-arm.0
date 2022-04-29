Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp2386194lfu;
        Fri, 29 Apr 2022 05:04:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUWym3vwM5PgoWlESlrspuqlHnD5P6srJdDU95eDfEDyrKNdwio8JdfZwu4h07KWN7QSN1
X-Received: by 2002:a37:956:0:b0:69f:90a0:b1de with SMTP id 83-20020a370956000000b0069f90a0b1demr7525396qkj.259.1651233879088;
        Fri, 29 Apr 2022 05:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651233879; cv=none;
        d=google.com; s=arc-20160816;
        b=k7ogPrQpSUrsbpvHK4d/Qz8Q5iVTs5y3ocZVda94Gu6tBeqsfuJ5YDnwdXyFaJtkgt
         YRwDo0q/Q0PKIqB9iGfandeG2pCQ4e1LWq5GwJbTpL6bbd2uLhaKshcPe5eRZiOsOv3+
         1j84X2wwum6Nq62yEyGOuiCG8to2FM8sGO5K0m0qK+bZga1IxXWUm4ZnfKYRHAVP1AZ8
         MHcUTjGmfQtw90BQhSiSN6pkQY3V/R8nESKIPy6iNGGJ97ca5oiK70+tQSoif2mg7v2S
         5wuMQT5FJaYSVcu4cBFDiG+xowLfCkEr3TeXTBMhwlV8i6Yr+GshSq/ke5BJT1P3p586
         bUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NafrXN6OhSw5fh9g1B5UsAjqFNimER6yjhzbvyeVaDM=;
        b=r25VlcfH6p+uaLwBS0cl2tT5GAW+JE2uZDItrnYfyD+Y2hciouNAoJURZQIFUA55UO
         Dbr+FsxwAOn2dstxncX71gGrS4bfU7Yuzj0l4+ZPPg9Le6BUt858LRGjdKBgOubOShB1
         Kad7uiwxWQ1MmQkrkonEdzkItlu9vBHuS3mzICIKtHpgzGdZBRIXsKq4vG8YWlrcTYck
         gmcJbIrgfnXZZQTKyzJg81CoKBK/aGeFF9WBdGemicGNVC5SnyQrYA60KzrVGST2fAu/
         f3FBfo/P/ShZYpsE+anosI2Rulab6OLkDrXfnG1UyL8iZ3OJq0v+l5v7sDnph7zZMnJm
         Wuwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LcDjB33F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67-20020a370846000000b0069fadfafb77si1220893qki.192.2022.04.29.05.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Apr 2022 05:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LcDjB33F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nkPMU-000142-JE
	for alex.bennee@linaro.org; Fri, 29 Apr 2022 08:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkPMB-0000mp-In
 for qemu-arm@nongnu.org; Fri, 29 Apr 2022 08:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkPM7-0005bI-NJ
 for qemu-arm@nongnu.org; Fri, 29 Apr 2022 08:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651233854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NafrXN6OhSw5fh9g1B5UsAjqFNimER6yjhzbvyeVaDM=;
 b=LcDjB33FJ8NCRs8i22EpLAkxFU3zslaiHGOeV8+XEfkpYWu6i9QvitlF+U6cFSo0NIYXkS
 ScS6DYAaaj8X8bCg/azosVU6iQPYhOmFNuYIICxFHGLmH6346cvkJ/FrLZVZWaq/JgKCg/
 74SIY4CmSnZ1vPoWNTm0q9YiFXfC7TE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-fgAcs4XxOYiIOiixMdkw4A-1; Fri, 29 Apr 2022 08:04:12 -0400
X-MC-Unique: fgAcs4XxOYiIOiixMdkw4A-1
Received: by mail-wr1-f69.google.com with SMTP id
 l11-20020adfc78b000000b0020abc1ce7e4so2999840wrg.1
 for <qemu-arm@nongnu.org>; Fri, 29 Apr 2022 05:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NafrXN6OhSw5fh9g1B5UsAjqFNimER6yjhzbvyeVaDM=;
 b=toHZ9Mki4HG1ObsUNosvmGxYW5rOwAcVYiEL9fNJ1ReGCZpBfSdbQqIN3q6Jjam7LG
 BYESGzGRv6ZEZAzBUeZGSMstoEXfmmUTSyRv9qChF9W+ggmHpe6aFMnZ/IbfiZ6sNTjS
 bM4ZjB1EBHVw4yaFguhJ+oQZm4cbSItIYNykajA5vzWqIz1+pdKEWZr+WSGUYfJORYgj
 6TRBLx4hk07y9o1Ky2QqdxhOYhJkAeiEjymuRyjfxHk80NaEQjTVGoO1RT8uOlDEHBff
 IXOYdPMBHhja+9dPY00X53Tu+BloXP4PyyhJzu8TnMQbwiPCg1Y/3ndD+X2raXvg8C4n
 Ybkw==
X-Gm-Message-State: AOAM5307NIJ0NfKU5a9R9l5G87fF8Lc6XjIE7vCZSLvv9RyPJk6Yr0/y
 FDt1RpRwNyLPIXn4UqfS8gAvBjzRNLBRHEvkZlittotJwNjw67ILFf8CGInrGXsb6kVPg9KsMDH
 dQwoD/X5bHbU0
X-Received: by 2002:a05:6000:242:b0:20a:c4aa:d070 with SMTP id
 m2-20020a056000024200b0020ac4aad070mr29807040wrz.606.1651233851747; 
 Fri, 29 Apr 2022 05:04:11 -0700 (PDT)
X-Received: by 2002:a05:6000:242:b0:20a:c4aa:d070 with SMTP id
 m2-20020a056000024200b0020ac4aad070mr29807003wrz.606.1651233851488; 
 Fri, 29 Apr 2022 05:04:11 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 j30-20020adfb31e000000b0020ae0aa90e1sm2577272wrd.108.2022.04.29.05.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 05:04:11 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 0B2446930824; Fri, 29 Apr 2022 14:04:10 +0200 (CEST)
Date: Fri, 29 Apr 2022 14:04:09 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/18] RFC: Remove deprecated audio features
Message-ID: <YmvUOU0OQI+/fwFI@wheatley>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <3437c265-0ed1-0f62-3115-6b681eac9784@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gn5KggbbXTYAMxsp"
Content-Disposition: inline
In-Reply-To: <3437c265-0ed1-0f62-3115-6b681eac9784@ilande.co.uk>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9WoXD8I0UW9C


--gn5KggbbXTYAMxsp
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Apr 25, 2022 at 06:05:56PM +0100, Mark Cave-Ayland wrote:
>On 25/04/2022 09:21, Martin Kletzander wrote:
>
>> I wanted to deal with https://bugzilla.redhat.com/2043498 and I got a
>> suggesstion that removing deprecated features could actually make it
>> easier to propagate the error.  In the end (last patch) it turns out the
>> error is still just reported with error_fatal, so it probably is not
>> really needed, but I really wanted to dig into QEMU more and learn some
>> of the internals for quite some time now.  So I used the opportunity.
>> The one-liner ended up being an 18 patch series which was, for someone
>> who has just one commit in QEMU codebase, a pretty challenging task.
>> Although I tried my best to do things properly, I am not sure whether I
>> handled everything correctly, hence the RFC.
>>
>> Any comments are very much appreciated.  Thanks and have a nice day ;)
>>
>> Martin Kletzander (18):
>>    hw/audio: Remove -soundhw support
>>    hw/input/tsc210x: Extract common init code into new function
>>    hw/audio: Simplify hda audio init
>>    hw/audio/lm4549: Add errp error reporting to init function
>>    tests/qtest: Specify audiodev= and -audiodev
>>    ui/vnc: Require audiodev=
>>    Introduce machine's default-audiodev property
>>    audio: Add easy dummy audio initialiser
>>    hw/display/xlnx_dp.c: Add audiodev property
>>    hw/input/tsc210x.c: Support machine-default audiodev with fallback
>>    hw/arm: Support machine-default audiodev with fallback
>>    hw/ppc: Support machine-default audiodev with fallback
>>    audio: Make AUD_register_card fallible and require audiodev=
>>    audio: Require AudioState in AUD_add_capture
>>    audio: Be more strict during audio backend initialisation
>>    audio: Remove legacy audio environment variables and options
>>    audio: Remove unused can_be_default
>>    audio/spiceaudio: Fail initialisation when not using spice
>>

[...]

>
>Thanks for the tidy-up! I'm not too familiar with the audio code, however one thing I
>noticed is that in patch 11 you are using qdev_prop_set_string() to set the audiodev
>for the machines.
>
>For CharDevs there already exists a qdev_prop_set_chr() function which is used to
>assign the chardev backend to the device, so I'm wondering if it makes sense to add a
>similar qdev_prop_set_audiodev() function in the same way? Then if the method of
>referencing the audiodev from the device ever changes from being a string containing
>the name, it won't require updating all of the callers.
>

I guess that could be possible, but I'm not familiar with QEMU code much
and to be honest have no idea how I would go about doing that right now.

>Finally a quick glance at the tsc210x and lm4549 devices indicates that they are
>using global device _init() functions which shouldn't really be used in modern
>implementations. If you are interested in QOMify-ing these devices as part of this
>work, then I can certainly help provide some pointers for getting started.
>

I thought about it for some devices.  Not all the devices I touched
here, because I feel like that would lead to a rabbit hole.  And 18
patches just because I wanted to error out in one condition was already
too much =)  But I'll be glad for any pointers on where to start and how
should I get to it.  Thanks.

>
>ATB,
>
>Mark.
>

--gn5KggbbXTYAMxsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmJr1DkACgkQCB/CnyQX
ht1UXhAAqHorjjWTpJvwFaqgF4tNi9s51kqPu3XIF4dIbHDgMQGwlnNvueu68BpB
s4dO/njbDAZhLJKv2aeDX4mxKnlMILS6YqBMyPeaQEcW1vSqXp8WMOMLlioOjn25
5jCC9DoCP8eSa+UoQTg/hm7lrWHgFdA0AwZy5p5CjTCKpPae8ZWtTj+b6GNjfsZm
+txWpfnBFxzEUWHcLUzsNRiDkWBhmipHiIOJw4BHZd/J6n9Dm6q9/vVzOAjJpTCL
GUbg0igSNNL0oIIDmA+MgY+MUtIE/ccL/krdHYD3z5vkGFpp97cb6Wj1nyJOrtW8
fLsMqtXn/4En21t6fqO1dkJ2Px8phTMtqBNKqtePWLaULU5u95YdQ2KOXn6afgkX
IR8Vmv72cxeWtiwYJFWnJMx564P+CXG5n2ZBtPzLk1mcFs5NO6KsevGZtk8HMwKD
PhtU3YwRz9/vzqoGBCHWxJq3TApDuDz6KPMEhx4ganXLpcGxxoY4lLUxFNRhXcNI
nMXbm8SXfqyzQPrRs3pyRn19dWlHHfIoi4nEwbgJlUt5OflLb/bdHEvVcx63cERS
2mHdNOPyx8c20ToRQmvb6KYYC4FIuYZvXY06XVcUvHqdx1s3+LrLF0Tk4VA4/Mrd
cfJzbvLa7SeKKpl9J1ENwR8yJsTd/QTirL9q9soopOGIIPQvgE8=
=3J7I
-----END PGP SIGNATURE-----

--gn5KggbbXTYAMxsp--

