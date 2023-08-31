Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp54734ejc;
        Thu, 31 Aug 2023 09:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxAXR1pGoMQyCh+mRo+2fNzcSPVwShN1vZ6rSl3DxCAMP/hlBE+J1VOLmKthw4AU97h/a
X-Received: by 2002:a05:620a:2402:b0:767:2e61:ca9c with SMTP id d2-20020a05620a240200b007672e61ca9cmr3850765qkn.57.1693500927839;
        Thu, 31 Aug 2023 09:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693500927; cv=none;
        d=google.com; s=arc-20160816;
        b=h/3cDc6b9O4W1xRnRfHisjsUIlfYLx+RRgnD+s/gltT2TtlwZE02nduEvwR2B9v6bJ
         Tt6gY1691FAeXHOPgnEJ/FwGYTrNxjjcdXzRJYtSc86/rJDNq0L7L8S0z++ZH+lW5VM3
         TwD6JVCHq+gmtp0HVxsKGIFS4XVDktyJiMZyHbfYcaCNgiTmQMamtkpVgDYkM18G3qnu
         CeRlCcMu6Y+Ahws6GlYbu6aYs+eu06hAsiszVWuJTox6qezRTXw6Ovc8Ee8cQcPadxms
         WPkoIUx3YqLmYdEzzp+G0ZDPqXgG9hxIq+rDlkmYJxrZYf0zdCyiL0NEQQk6yFUBrJqv
         g5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=f5ZTMELfXDoZAkf0TkVPfZsSTQoWnGLnDrHAqBNPg/I=;
        fh=i+96vQNY8t1No7UWaog5wIxdlSPaYig9YfB19JjHc2k=;
        b=Gu7G2tIqcSXIm8esismt8RFnvi+rS2tDwPpUBFDe0j0tvrwCQDbNXoIpFz2QJz60i0
         r9hlGQvzf+lVBsE+w8oPKFtwwwTj+aEWRVuJoXym3vTW0ekGzjUu+KxmNeGLnsUWuSoY
         Suzbbnl6IzqDD0qr5ATo4//Gfkg1WGNBC2HTwUOR4I+QuqWy7fDcbMM/xcBC7u2t29Et
         9ojmcmBuiB4aNszbb9lSelF/9GaHI8thLDBHadaCO1AfE6CtKxwh0iQnW91xKvi6eK50
         fmz3u/CqsUdMQ3LHviLWog5qTgOi+gvLB1AThcpahlTu+rLPKdC+xLYCEGCM9GA5mAJL
         DEAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p27-20020a05620a133b00b00767b3a5d245si1195818qkj.125.2023.08.31.09.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 09:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbkwz-0007eH-Mr; Thu, 31 Aug 2023 12:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbkwx-0007e3-Rk; Thu, 31 Aug 2023 12:55:19 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbkwv-00031y-7b; Thu, 31 Aug 2023 12:55:19 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc6jB0kYmz4x2W;
 Fri,  1 Sep 2023 02:55:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc6j73zBCz4wy0;
 Fri,  1 Sep 2023 02:55:07 +1000 (AEST)
Message-ID: <b621d134-09e9-130e-7627-710e6c758db0@kaod.org>
Date: Thu, 31 Aug 2023 18:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/7] aspeed: Create flash devices only when defaults
 are enabled
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230831123922.105200-1-clg@kaod.org>
 <20230831123922.105200-6-clg@kaod.org>
 <CACPK8XdiTpONmuLag5HnTCPXtoz+Zg-Yo+rrzt+Wuz17hbdDRg@mail.gmail.com>
 <a35c9605-7bea-0252-359e-86855e8ee304@kaod.org>
 <CACPK8Xd_XXTStxrNkx36TtE7dfRR2yG0oS3Mfa62F3ap-52OHg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xd_XXTStxrNkx36TtE7dfRR2yG0oS3Mfa62F3ap-52OHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.478,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i7sU/fKz/77J

On 8/31/23 15:42, Joel Stanley wrote:
> On Thu, 31 Aug 2023 at 13:22, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 8/31/23 15:00, Joel Stanley wrote:
>>> On Thu, 31 Aug 2023 at 12:39, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> When the -nodefaults option is set, flash devices should be created
>>>> with :
>>>>
>>>>       -blockdev node-name=fmc0,driver=file,filename=./flash.img \
>>>>       -device mx66u51235f,cs=0x0,bus=ssi.0,drive=fmc0 \
>>>>
>>>> To be noted that in this case, the ROM will not be installed and the
>>>> initial boot sequence (U-Boot loading) will fetch instructions using
>>>> SPI transactions which is significantly slower. That's exactly how HW
>>>> operates though.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> I think this is the first foray for the aspeed machines into
>>> nodefaults removing things that previously would have just worked.
>>
>> This is true. It is change from the previous behavior.
>>
>> QEMU should probably complain if no fmc0 are found to boot from.
>> Would that be ok ? And yes, documentation needs some update.
> 
> I didn't consider warning. That would help users who blindly added
> -nodefaults and wondered why nothing was happening.
> 
> This is what happens if you add -nodefaults to an "old" command line
> with your patch applied:
> 
> $ ./build/qemu-system-arm -M rainier-bmc -nographic -nodefaults
> -serial stdio -drive
> file=obmc-phosphor-image-rainier.static.mtd,if=mtd,format=raw
> qemu-system-arm: -drive
> file=obmc-phosphor-image-rainier.static.mtd,if=mtd,format=raw: machine
> type does not support if=mtd,bus=0,unit=0

yes that's a post board init sanity check on unused drives.
  
> Which at least isn't sitting there spinning, as I was worried. I'll
> leave it to you as to whether it needs a helpful message.

It seems difficult since we could be booting the machine from a kernel also.

I will update the documentation.

Thanks,

C.
