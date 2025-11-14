Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F81ACE8D5D
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 17:09:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJxIt-0005AE-2F; Fri, 14 Nov 2025 12:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.kauer@koalo.de>)
 id 1vJx1q-00087X-AP
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 11:52:06 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <florian.kauer@koalo.de>)
 id 1vJx1o-0003VU-9n
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 11:52:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47728f914a4so14289325e9.1
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 08:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=koalo-de.20230601.gappssmtp.com; s=20230601; t=1763139122; x=1763743922;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qsBTokqs+RoEw8OM/0Z0PHq5bIEO5QvUmBWCJ5Sf8YA=;
 b=wYn5RX27tdRLVJl6wsNMs85x3HQyUclhTDF0ccnRSnXjcwzudXOmSHX6Mwt2NoGMXI
 Vl05QbpkdGH91TbS6rAzK+5SfkAc6YzVhsNJz/TVE3pD7ORyFmyPRPRrkLqBiWXfRtBz
 HQMJx3JwOuAknYAUjm221rVEDCGGYZYYLvdMfOlFtq8+JIgkEoruLy2CtQxlw1wTqt3w
 08+2qQmqHJv89FuXUt6BNcETjvBWFFkBlbzcO5e3V6yXyli9m96c5jp31F68YfnX0W1v
 rFkeyxsz0Hv/YIGyXAXFMTwZTC91X+lAMKZCflS9DRRk0c3GOsjMhiM+o4nPSAQieS2N
 i4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763139122; x=1763743922;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qsBTokqs+RoEw8OM/0Z0PHq5bIEO5QvUmBWCJ5Sf8YA=;
 b=j8ikFBnSPC8DWj3gWNX/y9MH9hj467uhbfzvAdwJzM01u5zUiD7+Sgz3scCAznJMTQ
 2hZX5gIFwnd6DKyZV+BOJQ1vJuaCuZmmTRtAe3N1D9+2Geiu1D8E6SyWOBe14WoQlC91
 v+kWB0z8Zj76rMPd30b794dqxEAbb7cvXhsnWyWcwWUkFuwzwZFP3fBgubetc86siij/
 lOOnFdEjhJf8VPlv388HPQkYp7Hjsk1x+v4FqSxYqDi68d+vr8CVK/9Q7YWccLV/2ros
 vh8cma8fZzbRkKzLk9pkBrKpBfStyRVT3f70Weyb4YObp82p+9ME0BTt4FvfThjqeDmg
 csxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZosVTiQTHOsxPZY8qm8QTa6zXVdaNxTifhOfmyRmh8wovMrVVglq0GkejtN/vP5Jp0Vig2wUWYw==@nongnu.org
X-Gm-Message-State: AOJu0Yz2+JbwLqphAfEaKe1ZwBejaN6O0+1L0QbTTfCcMNY2VWdTGjVd
 5wPJpSBWSL+vTi/2Umv4hZjIzr2nVA4fd+n8VgXDu2u+sHd3eTEtBjRmEzbeffqjb5lgLPLEvoa
 nnpa8
X-Gm-Gg: ASbGnctFd7hqXjCOJlRltE8VmviikPeZoBvxJxZCsYog2WXL0JE9Y+3MF2D+EjvOlCE
 ow+9LVWb0Loafm2pNmuAODAHZHZD22Gus/hQwz3un/ptnuL3gD9d9wn6kywjOTTGOIY0gqC/tON
 e5xyj7QmIJWJukCv4LurLN6um7g+lt9chT50WvamGYzqVYvGcpf8MNAaGfAkVdVistDuJz/XDHt
 LCXQDgzktKVA9c0s0JIP7/+0Ty/sUYH2C/74lz9DNLA0DJPcSTbHJ69AhCB5PLcdLC9KhrrJ28S
 6rekPt+DUkg3yyW4OfRuFqNhY6h1RJwbVNYX61Ebwa0VHNXH0F7jgrxN8QyNDKXPoJ3C3LUkVfj
 ct0u4zzf0amrp0Fj6U76/cK4wVusLUdug0nvv8nrEqAiQI726ok1hko1J8lJNNdgx/HPHbnFZHN
 DkYPB1Jn+BFeNrfn1HEmTUVB2kDqeDJ9fLbCjPjJs5XHO6Dh+VBIMpKeaQRQ==
X-Google-Smtp-Source: AGHT+IGKsV5foJQx1/a+GnAxo7TMaGqEHklqDTqA6zJLH3JDLROSwb83rVogRBbnnPZG/kn1tNP8NQ==
X-Received: by 2002:a05:600c:3112:b0:477:9650:3184 with SMTP id
 5b1f17b1804b1-47796503351mr1320595e9.2.1763139121405; 
 Fri, 14 Nov 2025 08:52:01 -0800 (PST)
Received: from ?IPV6:2001:9e8:e31b:a300:de87:2ce:e496:70e6?
 ([2001:9e8:e31b:a300:de87:2ce:e496:70e6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779524d265sm18165815e9.2.2025.11.14.08.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 08:52:00 -0800 (PST)
Message-ID: <cc68c783-1f2b-4ecf-ab53-f0471e21114a@koalo.de>
Date: Fri, 14 Nov 2025 17:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hw/dma: don't allow weird transfer lengths for bcm2835
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yodel Eldar <yodel.eldar@yodel.dev>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 Florian Meier <florian.meier@koalo.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20251111105429.3993300-1-alex.bennee@linaro.org>
 <4d6d7e9d-0952-4158-9ef4-6093a16e9dd9@yodel.dev>
 <87wm3so997.fsf@draig.linaro.org>
From: Florian Kauer <florian.kauer@koalo.de>
Content-Language: en-US
In-Reply-To: <87wm3so997.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a00:1450:4864:20::332;
 envelope-from=florian.kauer@koalo.de; helo=mail-wm1-x332.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 Nov 2025 12:09:28 -0500
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/14/25 17:43, Alex Bennée wrote:
> Yodel Eldar <yodel.eldar@yodel.dev> writes:
> 
> (add Florians to CC)
> 
>> On 11/11/2025 04:54, Alex Bennée wrote:
>>> The datasheet doesn't explicitly say that TXFR_LEN has to be word
>>> aligned but the fact there is a DMA_D_WIDTH flag to select between 32
>>> bit and 128 bit strongly implies that is how it works. The downstream
>>
>> At the bottom of page 38, the datasheet [1] states "the DMA can deal
>> with byte aligned transfers and will minimise bus traffic by buffering
>> and packing misaligned accesses."
>>
>> IIUC, the *_WIDTH info fields are implied as maxima.
>>
>> [1] https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf
> 
> That reads ambiguously - you could start a misaligned n*WIDTH transfer
> and the hardware will write bytes until aligned?
> 
> If it does indeed work with byte accesses maybe we can just do:
> 
>   if (xlen & 0x3) {
>     .. do one byte ..
>     xlen -= 1;
>   } else {
>     .. existing 32 bit code ..
>   }
> 
> but I guess we need to handle unaligned accesses as well.
> 
> Florian,
> 
> Can you help clarify what the datasheet means here?


Sorry, I won't be of big help here. I have no further insights apart from what the datasheet says.
I implemented this driver many years ago and it worked for my specific use case (enabling the I2S interface of the Raspberry Pi) this way,
but I cannot make a confident statement about unaligned access :-(

Greetings,
Florian


> 
> Thanks,
> 
> <snip>
> 
>>> rpi kernel also goes to efforts to not write sub-4 byte lengths so
>>> lets:
> 


