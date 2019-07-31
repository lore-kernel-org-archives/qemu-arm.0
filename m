Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5822574wrv;
        Wed, 31 Jul 2019 08:57:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwi7+EJpIrBmH4Kw9pDPL1/jsc3SLGnOc7FreE4KgLG8nRvLeJvZZY5ZQlCWuggH2yvzCb6
X-Received: by 2002:a67:e20f:: with SMTP id g15mr75860298vsa.49.1564588661820;
        Wed, 31 Jul 2019 08:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564588661; cv=none;
        d=google.com; s=arc-20160816;
        b=djF6Rn4vTgmu+0ZZlhQr8Xfwce1kZnW57PIz9ax9+nkEERu989N7aURXFqvK499GwH
         dHRX2nL1M+79ekJtqAp/u56ab/1cVspjZRiKsGYqIBPhLrLnhHak5UBSjLMJ1tIh36MZ
         zCcaJnPQHIGY5DS8Mu9cPuCiONLROWzfhqTuxZcOFguPIqaAbF06ZLy5wxI4FUcLecUI
         /Q0Ropqnt/OTWvgW8QqKlBYPxNwMQMKb9J/esJQ+KFr2PYt2uqeE4AciR/tb/+qRltC0
         fimo/hoLAS962AcEldAPDTrQZRee26+MCD6E31JoUGuIaZuiPOeWiQkrT5j7wR8RoqyC
         h9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Uth9qsTfua0g93Td8NIKxyaZHAfndLwCy26ZoGyTNNg=;
        b=d1cd4zgO/qWFdJxkL1x/pqyWtRHknv7byT3YcJJ1EnN9HyCftQ/bq2UGC5opIY4Zz9
         4ozuAJy1jFODY+ibqhsvt9LrdxAwUpw8O0hOuOioupL/Up5nrkevUp4EFqEYT75G4lka
         ruqp9LwAyEaQO3Kjxfw48JmMICxvcB5It1bl+MJXW0aAfi22EGWwPm3sGfdC4rwtV8/9
         TEfGQxZqJPALmqeU63qUa2w5LXxYj6vvlSyW535taxJhNqYb7coky74+ckCcKyHqdCQa
         Ct2e/0bQFLGjO9FuP/NWR7ZHiDjUl760cHwf7RrW49QAA4A94mZaKYPnl3iHj+YEGYp+
         WZIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si14068221vsl.334.2019.07.31.08.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqyz-0001GN-CK
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsqwo-0007hK-TG
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsqwn-0003Pg-SO
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:55:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsqwm-0003Oe-I1
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:55:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so70295732wrm.1
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uth9qsTfua0g93Td8NIKxyaZHAfndLwCy26ZoGyTNNg=;
 b=MM4rjsLiy+tJ6CEUiYhHuVNgl/LFwT65XA0HF2qf2lI+irhVdBMiNG/Xt0h6zn7tfP
 XMuYJv25TzLll9VDW4GXwNHA4OsN835kkOd39/DkbQDqHbKnr3D+FE8XuDwaNB1zasf7
 SgPO0M7q6d9YN48sfn1XAiPKaU1zK/yWPBmxY4BaZF2o01YppSeit6HT9j8a51x0WprH
 DM7tXJnoY0phpXWx11HoM6GpyMhIlvCvHAR3sdcUyYqwc8IlR9k4SFw9kPP562qZkt3U
 Gb6aupJOJFxkG8yLzHcdCTO+RgsSY5cTn88CADSYhrjTezw18NbUkccTEG1Ovuh9D6QG
 GkTA==
X-Gm-Message-State: APjAAAXe2UTC5FfeI9qlKxTKo0KeHTj0fGFfLk+S5AuE+sXl2IsqkKxB
 +/UFenSKs7mTFwpU56IeLUr8Lw==
X-Received: by 2002:a5d:4212:: with SMTP id n18mr12976431wrq.261.1564588522958; 
 Wed, 31 Jul 2019 08:55:22 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id j33sm146033040wre.42.2019.07.31.08.55.21
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:55:22 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-8-thuth@redhat.com>
 <f2399005-cead-a147-37a5-600fda7eaea5@redhat.com>
 <b9bbf556-e2fc-8634-2238-9c1c5ead7a35@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <18d71b10-6be2-b76e-54d6-76c0395ca700@redhat.com>
Date: Wed, 31 Jul 2019 17:55:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <b9bbf556-e2fc-8634-2238-9c1c5ead7a35@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH v2 7/8] hw/misc: Add a config switch for the
 "unimplemented" device
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23fHaCOn30Mk

On 7/31/19 1:50 PM, Thomas Huth wrote:
> On 31/07/2019 13.47, Philippe Mathieu-Daudé wrote:
>> On 7/31/19 9:56 AM, Thomas Huth wrote:
>>> The device is only used by some few boards. Let's use a proper Kconfig
>>> switch so that we only compile this code if we really need it.
>>
>> I'd prefer having the UnimpDevice user-creatable and always present as a
>> core device...
> 
> Why? This is a sysbus device that needs to be wired up in code, so I
> don't see a reason for making this user-creatable right now.

Right now no.

> Anyway, that's a different subject, so this should not be part of this
> patch.

Fair enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

