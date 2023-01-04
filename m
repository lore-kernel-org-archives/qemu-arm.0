Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8330672ejb;
        Wed, 4 Jan 2023 14:53:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtRIzkZRATxb0t+wXEVCsD91DRYwOa60TP2WCFGSrpzDt8tpgTgcc9eko2qCtlZjvrdJ5Nv
X-Received: by 2002:a05:622a:1c09:b0:3a8:1e9f:47f5 with SMTP id bq9-20020a05622a1c0900b003a81e9f47f5mr66487668qtb.45.1672872794555;
        Wed, 04 Jan 2023 14:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672872794; cv=none;
        d=google.com; s=arc-20160816;
        b=RXgBHhlvnNsyRB/sSK9mcYrHVmobgpsKl1eM8isKFXsAvGsANubI+D+kL1/ahcFtu8
         eo1N1AWQ5ee7Z0DwCIXj9oVuZoAbHy5vthAw2wbe/QjgBL6r3QB+n45huwN2mad3qwGU
         RC3XBvIkTSX7ncLEpIkByF7oRo+47P+uuCeNU7FrJuixpYDpQVk8fk6T5+DODQWMpE+c
         Ngin4OYcmTZRZB3pLd/zbv7JYnGsVy9EDchNykJ4xA76NnlW0xQaupDQqb/GypzjCIGh
         eIWrFduP5468+vHD1skrrOOEaj6ZTI/ttU+UYHxQbxXz6sCVDsomFjBBXb9ZbXIXDAW8
         NaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mDiM/k4vuauW5Rg+aB6ryu2EoPf+F4/4/PIdB/AfDAk=;
        b=FiFNGOW2VQeaa2++JcVskupsixg5TmzWDsIR1ampy1MY46+T7X1ooRmrbxN4wUV6dS
         PalxNd1uWHUgzCaeCu6Dz65RfjejVE29tHpQTzZoVZgB1py3RIjT+0UTn8sonFcTOsZf
         e8M7VlYmSOGDmIE0+EIkIYiIvKOL9XOsT51GU83RNcWC+2fg4TsJ2VLhHYFmHNHRgXk0
         McQZ3PJt/IxR+gZPAIWJGmdgBSyojs7Og1YCHvk3MpVx/I3MQkIaDIW+ASIgc2R71zEy
         ickigo9TNTW64ZEl0PsRIpDPiGYcyMoNKihvVgsZCR5F2u+bR9PphMlEjHiQo3E7vVTr
         Xz1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjqEqV6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020ac86704000000b003a80f072024si17952650qtp.80.2023.01.04.14.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:53:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vjqEqV6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDCbf-0000cR-6t; Wed, 04 Jan 2023 17:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCbc-0000a0-V0
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:51:33 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCba-0008BI-Dk
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:51:32 -0500
Received: by mail-ej1-x632.google.com with SMTP id x22so86130165ejs.11
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mDiM/k4vuauW5Rg+aB6ryu2EoPf+F4/4/PIdB/AfDAk=;
 b=vjqEqV6g7nOXWoL8+mBJJfL/tGWy+BNkVg0d3XAdnzX2B676t1YfDSsWPTMHVbn/iy
 L1A1ojKZgNgtfYb0KEJB1gpYg8FgAxRB8TIZlOApyieyz8QcwLXbUiWaPbLKxu4UYhld
 Tq0H14huJx5kLR2CRMDlRcd1tWBk3Yg4bl6+KdbfwDqQuhW7I8GH53S109BJD2oXX3NC
 n5B8xXj9KnniNQukefeFApOS4Yhw218WPH4BraT40Ikr1do0d/syZPWGo6bitolr8KGA
 joQ+9i48ngj9qbivTA1uGAmkoU25xAu4hAJnz6vzZ7eeDpNSVNXAe5Dm2OZxIrENXNSe
 5glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mDiM/k4vuauW5Rg+aB6ryu2EoPf+F4/4/PIdB/AfDAk=;
 b=RpSUP3O++lIhbdB1CkYuJM3u3X8Ri2FxLSApSQ/JQ5cYq5BZjBN87UXKrxrtYa6Yeh
 HoUoKmXx5dkwpxhY8qv84jy018doNTYC0/jlut/VPuNlVOwkuKLi3Hu0R0ROLLoqLqR+
 QQpmP+ufs26arKCH+9EM/LIxI4r5y2vXbrHHjvGd1q/XH3e62ln1cKJ8/MVDPAw3b5hP
 DtE3+ysDnySgzD+fw89JI8Vi64w6nHx+0XMRSMHLQXKG2s63fuKlAmcMCQ44w7xZRutQ
 7oFJqyAppv3Pmzgx+6Wh8RO/PpCck3PANIepqDJ7etot3Chi+zt5UwL8k6E2OQBQ/4I5
 gYVw==
X-Gm-Message-State: AFqh2kr8GSPVx36U7DbIkDeMwulOCPeG7W27jDVPGyw/spgYnbry0NCy
 +Zy/WRYOoYA4CmlVlxxTvm6Egg==
X-Received: by 2002:a17:906:85d9:b0:842:1627:77b4 with SMTP id
 i25-20020a17090685d900b00842162777b4mr43013712ejy.3.1672872687805; 
 Wed, 04 Jan 2023 14:51:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gf3-20020a170906e20300b007bff9fb211fsm15782151ejb.57.2023.01.04.14.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:51:27 -0800 (PST)
Message-ID: <702ee742-70c0-d92d-353d-1eb976d7d422@linaro.org>
Date: Wed, 4 Jan 2023 23:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hkM8lV+4bP6o

On 3/1/23 18:43, Peter Maydell wrote:
> On Thu, 22 Dec 2022 at 21:55, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> ARM CPUs fetch instructions in little-endian.
>>
>> smpboot[] encoded instructions are written in little-endian.
>>
>> We call tswap32() on the array. tswap32 function swap a 32-bit
>> value if the target endianness doesn't match the host one.
>> Otherwise it is a NOP.
>>
>> * On a little-endian host, the array is stored as it. tswap32()
>>    is a NOP, and the vCPU fetches the instructions as it, in
>>    little-endian.
>>
>> * On a big-endian host, the array is stored as it. tswap32()
>>    swap the instructions to little-endian, and the vCPU fetches
>>    the instructions as it, in little-endian.
>>
>> Using tswap() on system emulation is a bit odd: while the target
>> particularities might change the system emulation, the host ones
>> (such its endianness) shouldn't interfere.
>>
>> We can simplify by using const_le32() to always store the
>> instructions in the array in little-endian, removing the need
>> for the dubious tswap().
> 
> The tswap() in boot.c is not dubious at all. We start
> with a 32-bit value in host order (i.e. a C constant),
> and we want a value in guest order so we can write it
> into memory as a byte array. The correct function for that
> task is tswap()...

Maybe 'dubious' is a strong word inappropriate here. What I meant
is tswap() forces extra reasoning "oh, on what endianness will I
run this, what will happens then, is tswap() a NOP?". When using
the const_le32() macro we knows the 32-bit values are already in
little-endian order in the host memory, regardless of its
endianness. This is convenient with ARM guests which load their
instructions in this endianness, not need to tswap() at all.

I'll try to reword the commit descriptions in some clearer way.

Thanks,

Phil.
