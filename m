Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp538576lff;
        Sat, 18 Jan 2020 07:09:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxphZwbQgT6VMCo+p68DP06+GkkJ0IyiLq2D4dvLVukFvuXST0x2Tjr8P8EcxWHOAqtxf/
X-Received: by 2002:aa7:c2cb:: with SMTP id m11mr9656839edp.89.1579360149933;
        Sat, 18 Jan 2020 07:09:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579360149; cv=none;
        d=google.com; s=arc-20160816;
        b=nNUOBxLn0G9c3RI6g3Se52ShoS7bimWb3HNl7/TnItMTZfIQTSmIEqKpLOyKwxSk1r
         +rh4hc1aDOe7yL3fiXS3dyP/cGXsPG8P2S7fOHTr5SezDZP5kmylwzn5jU/coE+jRuaB
         9hnVpTboHV0FYPnx6agKBvy90+Hb/waNxsDXkiAvgxBPZyR2avVPUAtBnWr3pwBL9Jcz
         t1rbdbc7RJ6CDLOH3N9OtBtYXlFUS/7yVUUESjWYQxtrFmXx1rHUrtaBzAXRfKhqRLei
         wdT6sIyAo8vlMEj1F9PmMH000AWkk2SczAKQkK7lR2DSYDjkcfSZjMBxTZ5YHjkrbiRi
         Qf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Duv41/U78PGZeqaPdAVdG4xEAkbZpch4xkpLqskRtRg=;
        b=LJVPlLRR6OxcDfbE7lRjBbeNiHxFTt1SzuGiNoCqfZQiYs6UvVQMfjIptZzAYAidOQ
         bcTSDNRuO027wATP5dpELor9TLL29qvGXjOLq9KHu9AJNenxHA1GPgTAh6vypB8IFvQd
         2suG3sZMmGf6ZW+nB16xZErt/MXZPxjDiBqCBj/lATHNhDrJFRtPUHxdw+7p8zLWwxXR
         DwnW0txmUzsjbCCyg28z/fhYN9QskHW00sGPidFo5ylNPJ10Brj1pY8YiF4cl9JF3JHt
         jQo+nYANbzCPlUwBFwsOGuFpUd7ZItflnPA2YPfNCvEpwYR7MG7J5QlE+WasgAQrFVrK
         osTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DulL2ANq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si19049222ejj.314.2020.01.18.07.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 07:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DulL2ANq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ispim-0007qf-OU
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 10:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1ispib-0007nC-1M
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:08:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1ispia-0006ZB-1n
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 10:08:56 -0500
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:35346)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1ispiX-0006Xa-Oj; Sat, 18 Jan 2020 10:08:53 -0500
Received: by mail-yw1-xc41.google.com with SMTP id i190so15809012ywc.2;
 Sat, 18 Jan 2020 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Duv41/U78PGZeqaPdAVdG4xEAkbZpch4xkpLqskRtRg=;
 b=DulL2ANqr02RrHigS7G4o3CCCogLf+cn/JDgulqiJL4oqA5e5/QS+CRjVlec12FbwI
 2qtQKuHCrw91b0TGTEiKibkdawUAGH2T/cpmQpzKTB/Kfc6DI1nCz2725EBV2NCYKpQ7
 MYVQgaoqLxh5Co6TJRtOfOISFStGUD2xnrON1q3zlwcZ6HPfvGhYc3FS+yoDj/3BSrJw
 MGk4WYWX42Zx6h791nljBvi1CLeLuIm4KDj0fgFyj+8BD2rydGdeSrLWsn4WSo8Hxo4L
 muFwPEPH5Qp9lrLRbpfolgGpgSDJuyeCbQKtHm4hSX+Y5Uq3eEmun9a3F1O+LNM3HlXE
 GhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Duv41/U78PGZeqaPdAVdG4xEAkbZpch4xkpLqskRtRg=;
 b=pyG1qhMwln3wtnncXx6IFZvrjx8bxCX0fO1JB9rsR0E3OACB2esk0rQK14nOscAqyD
 VChR5nFZbgRYEvMdJuyYm32Dw2B8nOCOd+9EfYXD99P/T64677ZHy2YBm/nUKcZ4odcc
 /B+m7TMItgRSntwXqZBJ5BZLvur4mMI8iBH1SfYFgT9zaCX42ITLeP9nLAPXekWX4Wyp
 cFsH/STTPYPfkIPUTpgshbEtBI0IUuuWyqGXhjnDQNy0WVvgSIdbcgvjo5gM5RVR6rgf
 eO4tkq/OMuVU1voMGczckFQS5UzTd3i3rMyN7OdtEB0DXiyv820YIbzFh7J+B2GIPr1P
 D8+w==
X-Gm-Message-State: APjAAAXpwAwYrICknYKl2lh3iUMe0d/t6eofwhLsjYP0oT4Lq6/1NKQ8
 DPGZvsOGmSWs+BxAnFimLBqjUmdP
X-Received: by 2002:a81:8393:: with SMTP id
 t141mr34527176ywf.196.1579360132736; 
 Sat, 18 Jan 2020 07:08:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o69sm12949597ywd.38.2020.01.18.07.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 07:08:51 -0800 (PST)
Subject: Re: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-7-linux@roeck-us.net>
 <CAFEAcA_v98GcR06PWfm+=VnteQN_Q7iKK4wobAg6NrVSP1AyDg@mail.gmail.com>
 <20200117182939.GC13396@roeck-us.net>
 <CAFEAcA9zWeW1k-K7qVzCSOA70BmOCa9onT2z_QUQK-=0AJ+NjQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <7a9967c6-a370-9137-10fd-095113dd9852@roeck-us.net>
Date: Sat, 18 Jan 2020 07:08:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9zWeW1k-K7qVzCSOA70BmOCa9onT2z_QUQK-=0AJ+NjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dhOx+6ujLyZq

On 1/17/20 10:44 AM, Peter Maydell wrote:
> On Fri, 17 Jan 2020 at 18:29, Guenter Roeck <linux@roeck-us.net> wrote:
[ ... ]
>>> Rather than having the uart and pl330 pointers be locals,
>>> they should be fields in Exynos4210State. (Otherwise technically
>>> we leak them, though this is unnoticeable in practice because there's
>>> no way to destroy an Exynos4210State.)
>>>
>> Out of curiosity: Is that a new leak because they are now tied together,
>> or is it an existing leak ? I don't find many DeviceState entries
>> in xxxState structures, so find it difficult to determine if/when/why
>> there is such a leak.
> 
> Yes, it's an existing leak, though it's more of a conceptual leak

Do only the pointers have to be in Exynos4210State, or the entire
data structures ? In the armsse code it looks like it is the complete
data structures.

Also, it seems to me that this means that not only pl330 and uart states
are affected, but everything created with qdev_create(). If so, the entire
file needs a serious rework, not just its pl330 / uart initialization.
Am I missing something ?

Thanks,
Guenter
