Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2854453lfc;
        Mon, 18 Oct 2021 03:41:18 -0700 (PDT)
X-Received: by 2002:a05:600c:4f81:: with SMTP id n1mr43034327wmq.63.1634553678225;
        Mon, 18 Oct 2021 03:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634553678; cv=none;
        d=google.com; s=arc-20160816;
        b=H6HLN7SvL0lYj5QgCX9f7TAQD4RBdsFGvdU7PIpnyjxx11lIEFzplBsSS9gLcHStaR
         3H7Ga/TaxjTrWw7cT7TR0MqqotQWkxx3Bwq4+ihrGhhCXjm+UB4nBfD9dwR98wyxUSbG
         U2FOasXeQ+PqB+57DlzqCGPW3LwITqdjeH47uZwb/OZTmLKTti760D67SM7E7fu/dbjX
         HfI7zFt2RDeU0vDrihp6eM2xui/AzJ5qg0ER7oBfos8xOxHdf6is8vEzaaME/jK6touc
         O915X0um3uhw05EN8ThmdelzmB1xIhiuhcTqaxvaSuLP0ATz0sKjnD80wDTn9dFwfWS0
         PRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=TiVpv0div0VNswq0G8HhWdZY6YVKfHnCCqKPnpzmiEg=;
        b=AnUu0vIKr+Gb4KfbBsHRmNol+mgEpjSnyue3NpSux7cFlxPA0QEhau1ZJ/S4Gu8W+8
         Uc8p4W5euZzVc6pzLd78o1MowHCupdli4eJUqYcGL5Ywz9Hgf4ngQ51PqhWYrorGv/zp
         soEQDTIVtM26RcoPFwxBLOSBjTa1ddGYQxtFM2zCeE0nnyAL1pIHo5SZQBYuxSnLwy6D
         uaWjh77IHw8cmZ5PM2vpCylsq6GoR/t9y+1Q4KUcz9DuSLOlc/xPFeUaEbW4ijpDG+/u
         VHorVK55WtltGr3yIL9lHqyqsNDIY+3jrZbYbL+zgvWGq8hFzYL6nJ0us/lPKj5QbZEo
         EWUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=j+NDdGHq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1sor7959946wri.22.2021.10.18.03.41.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Oct 2021 03:41:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=j+NDdGHq;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TiVpv0div0VNswq0G8HhWdZY6YVKfHnCCqKPnpzmiEg=;
        b=j+NDdGHqDRFo/gWDgXXz3WSRtv8kQuA0SixrK3FbSImhX0C4tyYz8/AFiylfPzQt2z
         J5KH9R2DsQZco6OlXxuSiLmaeGD/inUjKwAMEDg+4jLVE4WEN4n1EAguEeLeYFZtr8r9
         CzVQiHvwjBRKkJVKtUkYeu5jhizgAl9T1vPdN7SE9oNDum6yCej6YJUqDFcReRYG/Mo6
         BbcPtbC3Ow8WyskWGf7Wu8rAiWVQ4w2cmuNnnF9dEkBf5xu6MihJpXjyqs+meLo+hEFs
         bMuKazbdZiG2qdM6UhQav0ZYzgr0tbKawQGtJ/IW1BduAgQwHVHkCAMC88aNYLtqG47v
         663Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TiVpv0div0VNswq0G8HhWdZY6YVKfHnCCqKPnpzmiEg=;
        b=gXpoUPSlIitKobYLTmMFur0YcjgA02YRSNI6ycYiwOC2Y1vN8geNEzunU4v3BMVstg
         tz8ZEv6IdVjarIXMCYKzN8MUTF0BvREnay2LthMgNx17n6r2pgSn5kh0j3yWCImkLjiN
         CW3kjbuUoX7M/63dysr2bN1m3y8W3FmPt2JQpV3Sbu1YsD6um1R44h83JIEBi5GNFzDG
         aFJJ1whUpY3+nYNdmuuJnoyFhtnHAgrJoL2Fg7JqdMKB2DmsFBOV168xn0MLwdxX8KLq
         UhAn8DnJB+C5Qbb4kaRaqrkmcbyTC6XnnjkHvjP4DOOKcLutG1yS0n7S0HPLgYJReqX2
         Pf9g==
X-Gm-Message-State: AOAM532mdtLakG2UHHoBJS3Rf5oX/SUGFQ9SSoA5DD+NT3zz7+ylORFR
	zcpAGRYAbJ4AMpkcPutebuw=
X-Google-Smtp-Source: ABdhPJwyCTgS0srHQdbqooIu22TKCqdPomSD4rcjWuuy+9cr5B31FRt1dHQOGVnLmJVae4Q8hPEgcg==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr35686048wrr.386.1634553677948;
        Mon, 18 Oct 2021 03:41:17 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net. [81.36.146.213])
        by smtp.gmail.com with ESMTPSA id h8sm13896575wrm.27.2021.10.18.03.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 03:41:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <659b3726-6e1e-b1eb-e6e8-45bb9c1ba156@amsat.org>
Date: Mon, 18 Oct 2021 12:41:16 +0200
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
 <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
 <a55f82099075eeaaa544f6f7fc7575b90d051caa.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a55f82099075eeaaa544f6f7fc7575b90d051caa.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wt8TYii75QOC

On 10/18/21 12:27, Benjamin Herrenschmidt wrote:
> On Mon, 2021-10-18 at 11:47 +0200, Philippe Mathieu-Daudé wrote:
>>
>>> I've just checked the rpi-5.15.y branch and it's the same.
>>
>> Indeed. I stopped testing recent kernels because they use too many
>> features QEMU don't implement.
>>
>> Our model should generate the DTB blob of devices implemented, instead
>> of giving false expectations to the guest by passing an unmodified dtb.
>>
>> This is on my TODO, I might give it a try next WE.
> 
> Indeed. That said, we do implement the fb, so we probably want that
> fix. The fix for the virtual gpios is probably unnecessary however if
> we do what you want.
> 
> That being said, with those two fixes, I can boot the latest 5.10 I get
> from raspbian.

Great. This test should pass with your 5.10 kernel then:

https://lore.kernel.org/qemu-devel/20200215192216.4899-9-f4bug@amsat.org/

Do you mind providing the equivalent 'deb_url' / 'deb_hash' you
used, so I can adapt this test to cover a Raspbian 5.10 kernel
in our CI?
