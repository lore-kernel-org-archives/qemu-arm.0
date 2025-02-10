Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1956955njb;
        Mon, 10 Feb 2025 06:04:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJbgbBjHxfEtRrQ/+slv6oA8tWHpwrjxRQpi+FG1AThIlOqYsDxC/F0TVjs4CJ2I81O0KBc/9C3mPe9w==@linaro.org
X-Google-Smtp-Source: AGHT+IEBCLii2HZ/vGnFaMlrgI/F6SNIAOe8FkDNI2Nt9G02VeyY7emyu43y0HqLUdIXTsbq5aCY
X-Received: by 2002:a05:6214:2503:b0:6e4:4194:df35 with SMTP id 6a1803df08f44-6e4455c9612mr239022106d6.9.1739196248352;
        Mon, 10 Feb 2025 06:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739196248; cv=none;
        d=google.com; s=arc-20240605;
        b=H2ihsYPNjzxdq0ruOYLpEwVrKL5HY1Gkhi69aixaMBOXSCUS9SIW9eLo8Bl1MFJluJ
         J3ZE7cu2OhXqCu8JNdsD3edu5tzvf/9VSiudsw3c3hpNmRcGlvc/iiSqk3RuNCXWk3s4
         5Xh3k77MY3YDubq6DQMeJfgUaXK64y3do6z8ioxJrfORNcufkbOELCQtxKt4VR8Knglu
         35Zm1nI/pxIK25fCOeb3sudPmvosSHqy5YU0+O58mFzqlGhvg4Jo99YWjxvbA+otLwSs
         xPqmQxBImPSOI5PPE5XU8zM3re3B+HsDl6fea20UCDwEdFSrAaMOVTZvqIiIXmJP5X05
         s4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=54fufbxc7LkWLY3gsqftXZih0oh4axfXg2KzENgF1oo=;
        fh=NCKPmq7ipw9I/TO1RYC8kga4CMeWktcxH/89E1uo3kQ=;
        b=FAernVYvDz9AY/NAh3xac0yl81PwWYhzudFm7Hv79QKrqlTiCpmLLCb7x8OcNxrrbz
         2eUfslkSs2+ptiw8BLmJGrvLsyGD1y6DSXn/gwL5D/qNxEFmVzHWl6IxtJFRH627uoy8
         Mo8eR9OGdH2gfSrqJjmCb4FrlxE/on+QvVX5ioSiHOQjslZOtr1XwIFMLEoUwvh2oMk4
         OljITdNaq0qD3ri3KRjxZJfOY7oQciWIwGaRq8UpLt2uihalS2AVUf4aLAnPaNJ6zlWu
         h8bSyunhd5AB9FG7Iflnz8u3fIPnl9Ws8QOMM8xlv1clm9dYdCdg7f+bP2DsHFndWikg
         hujg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2fqfghC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e451429000si54907796d6.103.2025.02.10.06.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2fqfghC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thUO9-0001Hm-7X; Mon, 10 Feb 2025 09:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thUO1-0001GY-Hd
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:03:47 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thUNx-0002ki-A1
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:03:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so10879265e9.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739196217; x=1739801017; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54fufbxc7LkWLY3gsqftXZih0oh4axfXg2KzENgF1oo=;
 b=P2fqfghC6knXqtSxtOPh9lvj5VO3QGaxeVUDj0daSpQcE4c7BrhL21KX1T6TIr2gdL
 lfDWaY+JSAyqXL6hdtfxgFdpr3THkuLrrxLyy0/g3JDha7gcuQhrNoo+wR/PojGVClHy
 YAnOalZpG91Cha64IwJdIEVXqnHslQU+ieh1+jI6BDAlv41lfwBP6S+xi98CFpJZ0NnX
 tleFsTW6fRhwFkwr4ExQUvcc8PxGoOv/+zKuMR9cq+W+pnbUAfnwpH1IIV3U+I4N/xvd
 rwD8kZS8wteTwzmsb9Ii3wkDRuqCCaAsJk90CbFv6rvRmMWKASW+u7rqyNDTP4Iv4uvR
 74Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739196217; x=1739801017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=54fufbxc7LkWLY3gsqftXZih0oh4axfXg2KzENgF1oo=;
 b=Yb8ky/aBrHPuCcNuIghMrX1ZMOcaNY2AiUmTEmYCQGYC+NFfM5MuDerOVRTF7hHSit
 Js61S5uq83R5Sesc9LqhKwd9KBqVKPU+LZBTlzg0eTFDrer9qo4Kk5kH1zAPM8/PW7eO
 DLqMCV+JhanZzpt33JG0GA1l3Kfd6inpzcu7y5F+1K69LnZ6k/833dvFu136NCNQRBjT
 F5AurU4cbBr9gKOfsWTnxozuuedEfeXYvvY1EhXgAZY7horLuNh1drOCuJ8xJjia1f4Q
 HlTBVtR5VQhouoJj79AoDzciGtsdnDP7UZ7Zd/OpyZJh134J6RI/azQ/W3/ZKWKc8qHs
 vwdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwL4ZN8Tct9sRGxD0oBz2eXMw4cCehxNtLJOgDuoyLZQErZs5yQ5l6qF24c2jzlEVesT8k3HOWkA==@nongnu.org
X-Gm-Message-State: AOJu0YyntQKecCtXABx8WcSWPXwQNChIU2/o6R5YnBBYj5cnhvQG/1Yk
 uLh3nRfIZyrz3M1UoeNLEfennkDet7Fxjf54YnzsgoFbB2WOoxFl+B6B8QkpIco=
X-Gm-Gg: ASbGnctoVwL3LXVw7kwlvKABZCyaVLJkuNI8FygR0p19tq2Zwf421QAWgxNVqstG9BS
 nQpBxeZmZiqp2d0TDzx1WPiEnFDaUMicHBDssjn3VWfdxHt44+98ps/gM3DKplLf+HgCkIvHwq9
 NdaSFHvzNEe48yaFUv30FMd+8GDGXAqOrRk77tq+m/QVJTuGM563RitMcVwzs3jW+q3u67S82e5
 G8xAmkbr/Z4ICVA4lDz3KNf5UE02M8xcBmAavjIw0z3ntG6lCz4qH9/vVOMFx+1iv6jMTqqioYj
 A8DLEnfFVq5lAtteKJDrVx7nrUXwRiidAWQydJsdrMGp453k4hX4OpDpCec=
X-Received: by 2002:a05:600c:1e0e:b0:436:f3f6:9582 with SMTP id
 5b1f17b1804b1-43924988870mr103881395e9.8.1739196217423; 
 Mon, 10 Feb 2025 06:03:37 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd9c48173sm4661490f8f.37.2025.02.10.06.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 06:03:36 -0800 (PST)
Message-ID: <96b39b3e-1a90-457c-bd8a-40a1b6216c1a@linaro.org>
Date: Mon, 10 Feb 2025 15:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org> <87a5b07u1d.fsf@pond.sub.org>
 <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
 <8734gpj4wn.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8734gpj4wn.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: nJViZQFmgmzf

On 7/2/25 13:49, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 5/2/25 08:03, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> MachineClass::auto_create_sdcard is only useful to automatically
>>>> create a SD card, attach a IF_SD block drive to it and plug the
>>>> card onto a SD bus. Only the ARM and RISCV targets use such
>>>> feature:
>>>>
>>>>    $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>>>>    hw/arm
>>>>    hw/riscv
>>>>    $
>>>>
>>>> Remove all other uses.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> Impact?
>>>
>>> As far as I can tell, this stops creation of the if=sd default drive
>>> these machines don't actually use.  Correct?
>>
>> Yes, since these machines don't expose a SD-bus, the drive can
>> not be attached and always triggers the same error:
>>
>> $ qemu-system-hppa -sd /bin/sh
>> qemu-system-hppa: -sd /bin/sh: machine type does not support
>> if=sd,bus=0,unit=0
> 
> To be precise...
> 
> Before the series, a bunch of machines create an if=sd,index=0 drive by
> default even though they cannot use it.  HMP "info block" shows it:
> 
>      sd0: [not inserted]
>          Removable device: not locked, tray closed
> 
> "By default" means -nodefaults suppresses it.
> 
> After the series, this default drive is gone.
> 
> That is all.
> 
> Correct?

Correct.

> The commit message could be clearer about this.  Perhaps:
> 
>      hw/boards: Do not create unusable default if=sd drives
> 
>      A number of machines create an if=sd drive by default even though
>      they lack an SD bus, and therefore cannot use the drive.
> 
>      This drive is created when the machine sets flag
>      @auto_create_sdcard.
> 
>      Delete that from machines that lack an SD bus.

I reworded as:

     hw/boards: Do not create unusable default if=sd drives

     A number of machines create an if=sd drive by default even though
     they lack an SD bus, and therefore cannot use the drive.

     This drive is created when the machine sets flag
     @auto_create_sdcard.

     See for example running HMP "info block" on the HPPA C3700 machine:

       $ qemu-system-hppa -M C3700 -monitor stdio -S
       (qemu) info block

       floppy0: [not inserted]
           Removable device: not locked, tray closed

       sd0: [not inserted]
           Removable device: not locked, tray closed

       $ qemu-system-hppa -M C3700 -sd /bin/sh
       qemu-system-hppa: -sd /bin/sh: machine type does not support 
if=sd,bus=0,unit=0

     Delete that from machines that lack an SD bus.

     Note, only the ARM and RISCV targets use such feature:

      $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
      hw/arm
      hw/riscv
      $

> Listing the affected machines might be useful.

I'll pass :)

> Worth a mention in the release notes?  I don't know.

I don't think so, since nothing working is lost.
