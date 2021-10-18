Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2812153lfc;
        Mon, 18 Oct 2021 02:47:09 -0700 (PDT)
X-Received: by 2002:adf:a454:: with SMTP id e20mr34263646wra.310.1634550428905;
        Mon, 18 Oct 2021 02:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634550428; cv=none;
        d=google.com; s=arc-20160816;
        b=SQWoxQ+r9CxDQsB1JVQzTtzlNURawYuWscs1BJoPJZ9BhSsKEoTpdA4tbRykja1ETv
         ivgXO5ry1zSA5lSnyHUbw/QFwva6MNMicpSflMdyUULrcYX8+ZrSbITCL+42psKrlaWN
         sjkiprqYXHyYNGVkXi30y1Ugg1GjLu5F6gLCz0/nDBu7p7rJdgOy2qZuqTQL0Vj7incj
         bbwvnWmN4YjY3o15WKE3VaGtPVt299Khcrdj5oFYf86p4LHDfmgWQkILkiqlErTgTFIx
         WyxIxfav1cKIgbQnU2tYCZZiKQO/pIAViRHfNeVaZUzdw5o6l+TaP3m74WMOCTw5/LQP
         DXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=TV8AWJAvr4x/pA9yXDfFoHorQ5cDEAuYXqUVmw1SKCA=;
        b=cTU1RXpjFVN8z1peaY7DStWOaoM0Sm0Orq939TOrkyhq6OctCM1rypfSFSGtE3Ckox
         rf+XbTPg83gVvg346ly/txm2Z6R+SmVYrTykDMWgcf6b6tKoBR3OvNABHX3qI/P8QUUz
         xWkPHiWoAzoW+Ea/HyPaP+oKQ4jhXeFi4XlUDrk7lHJV6t6avHQYQKT9yAvU7fr9FYcF
         Ib4v6QeQKkrw3jOQJraq9d+hMcvqx/0NH6mK7d1g0VsKOWmv2sbb0gCnv9QsjFhzdMj/
         D2ZUYyu4Wqloyi9FO2hRjrlPdUBAQsb03Ux4Bb6f0IxN7ILUgo/SzvwvcFCNSFSmRA84
         kbgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=WtcfheA5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k6sor7234564wms.27.2021.10.18.02.47.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Oct 2021 02:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=WtcfheA5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TV8AWJAvr4x/pA9yXDfFoHorQ5cDEAuYXqUVmw1SKCA=;
        b=WtcfheA5TNYYjil6DOIluqN/wzbYmr5PjCHUKAAK+xzsIY/0fGUfcLfxcSEqYjSt/Z
         ta2AVOjNZC5g9VHnoC3TU+YSUEr47F4errrzjeFbhjp8RTZTEctRYja0p/LnwV1DUfLm
         tcYcMDQYr9gB+vURnTSl6JR1wXm07VBj/gHWWv7wOtreTrXhzO6AITEX1hdHf0e/UPNr
         J0PG6UGgnrOl776ZaWi7fzOKkU+t+leMDinHE9D9CMbwfhitWSz9t413X9RFxQbKCiad
         qxJIKyobXmm6iz1inR6aRYuRwPdR3HH0DtOzhPqsR/Gy5U/m9xw6JA0cwvOWEXZlNJv+
         T7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TV8AWJAvr4x/pA9yXDfFoHorQ5cDEAuYXqUVmw1SKCA=;
        b=SrJkGPC+W4XSq5IyGkEMGwq8QZhF2rmXDrQJ5gtDEYxgWUzmyQT0SsqOkq4+i0tQ4o
         pUmatsP2UDaqkofkq88CD0vD6TJaHDg+bLH2zxs22kvah7zR3sRI4RQtMCeFyUEqxUBp
         qESOezBEO28gxJvMA9bLPfywzW0CB+dOGHh5oCJ+Gx1cAG7whaPYQDCvZKKNNsOiRaUn
         HFogfnrctqMc3fE3/6BNrXvilrTUc9U/w/Ff7xKIx3gcGKDRz1gEOYBr5NMmM09eE+qq
         3MiPFYSn+Uc0RAFk7ZkVPblha6/bR5hQd1B0O3w+MX2ZmSeP93EKbp+xjq6E27fB9qr/
         wHJg==
X-Gm-Message-State: AOAM532rMRoTVe2fUdnps12rANFUxXu2EYJdechpnb1faOB5HMOIN2v3
	30BF0yyFWnHfJaHtm+rSZA0XIeBj1Eg=
X-Google-Smtp-Source: ABdhPJy0JKTfk/EeAprJrzKgurMqpnKmo79c5OpOPIzUnO8tMAgnkNgHrNnwNLdb0zF8ZwBtiid++w==
X-Received: by 2002:a05:600c:892:: with SMTP id l18mr29806135wmp.89.1634550428618;
        Mon, 18 Oct 2021 02:47:08 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net. [81.36.146.213])
        by smtp.gmail.com with ESMTPSA id n12sm12544165wms.27.2021.10.18.02.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 02:47:08 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
Date: Mon, 18 Oct 2021 11:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
 <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Xk/oOPsL9dr1

On 10/18/21 02:41, Benjamin Herrenschmidt wrote:
> On Sun, 2021-10-17 at 17:08 +0200, Philippe Mathieu-Daudé wrote:
>> Hi Benjamin,
>>
>> On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
>>> The framebuffer driver fails to initialize with recent Raspberry Pi
>>> kernels, such as the ones shipped in the current RaspiOS images
>>> (with the out of tree bcm2708_fb.c driver)
>>
>> Which particular version?
> 
> The one I dug out of 2021-05-07-raspios-buster-arm64-lite.img (note
> that this then fails to boot some time after the fb is setup, even
> after the fix, in the vchip driver init (before serial is up even).
> 
> That said, the same fb problem happens with 5.10.60-v8+ from raspbian.
> 
> I'm not sure your fix will work on these, see below:
> 
>> +        case 0x00040013: /* Get number of displays */
>> +            stl_le_phys(&s->dma_as, value + 12, 0 /* old fw: unique display */);
>> +            resplen = 4;
>> +            break;
>>
> This should have been equivalen to not having the property. However,
> the failure path in the driver looks like this (note the mismatch
> between the comment and the code.. this is rpi 5.10.73 from the rpi
> repo :
> 
> 	ret = rpi_firmware_property(fw,
> 				    RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS,
> 				    &num_displays, sizeof(u32));
> 
> 	/* If we fail to get the number of displays, or it returns 0, then
> 	 * assume old firmware that doesn't have the mailbox call, so just
> 	 * set one display
> 	 */
> 	if (ret || num_displays == 0) {
> 		dev_err(&dev->dev,
> 			"Unable to determine number of FBs. Disabling driver.\n");
> 		return -ENOENT;
> 	} else {
> 		fbdev->firmware_supports_multifb = 1;
> 	}
> 
> So it appears that the intention at some stage was to set only one display but
> the code as written will fail to initialize the drive if the properly is absent
> *or* if it returns 0.
> 
> I've just checked the rpi-5.15.y branch and it's the same.

Indeed. I stopped testing recent kernels because they use too many
features QEMU don't implement.

Our model should generate the DTB blob of devices implemented, instead
of giving false expectations to the guest by passing an unmodified dtb.

This is on my TODO, I might give it a try next WE.
