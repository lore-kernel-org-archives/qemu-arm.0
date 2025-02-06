Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1512473njb;
        Thu, 6 Feb 2025 04:56:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMy1PLNhqivN8zYWkAEY+XSj3tnZqTTMMMH8DhtCLICHliSMA7L9muTJQR9iwv58rdy5kBmphfWKOgDg==@linaro.org
X-Google-Smtp-Source: AGHT+IEpGkbBsd+m+cUVp1/CyekBVZoYO5ezZKgHj9WDl7BFA2psNJvXqwKevI9QJR0cnZGr4q/i
X-Received: by 2002:a05:620a:2941:b0:79d:759d:4016 with SMTP id af79cd13be357-7c039f98761mr804012985a.11.1738846594397;
        Thu, 06 Feb 2025 04:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738846594; cv=none;
        d=google.com; s=arc-20240605;
        b=giYkS7NYXVpYO579TgwqwwIj1G2lldb9wqvPhUT2YTPSyUK9OaYIWCAFVgg53XZvcf
         rMxb2QzdteEnttZxrpuV/CrqlhmnIJWrwMfHgESiGRCUcvk8kiJuTraUcpuy+/V9SMeb
         gD0o7+cOphqoWpGQ7kCN0l9UCZLM2EExV8rdxikc2w9Y5X3VPO27fy98RwY5mIqCW2/v
         M3j15oTlrF+MN9xm1Az1tUh/WnbsyAL1QVFhC3qWtbn15IDhKu3ut478tMf+dKrx8Wue
         312/V2b8F2P3WK8bOzWiL1kAUYMjfgQnXFS9L/kaCt6sRhKHNps3u1RUp9d9lLZK4h9+
         FGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=JIhsjtEo/Kh8N6Wuanm51vT7erjDbzYYxSQaf+i/22M=;
        fh=VzGyYLnZvIIgkvySCxecH+bM5gOMddDzteAP3Pkf5A8=;
        b=WhrdJI2k5m3L3t0cRyQyzo+qhSruKkpMTMXn8QPkBOCgCS1dxeCfwpfvKDq4vOiyuW
         dEd0QAEBdj1cPNCmCXtLZ1Ur7E9ocv6LZime89Cx0tqVURvMM5ZtmX4T5VnVS6i1QmNK
         Xp0ILtXlxXfYLgHnwUekxRlLRK2+iIff2Uf1Crs+qpDGgl+K87b8PY4HfNqwBRY3hT6V
         nM17U3K/C7+l60ho75FAVTDaVfTeS4PSbT5mBIFbk9QKW7mjIM/4gRIWu0MJ0kcO+0Aq
         3aHUCzMCf5WxaZMGnlloOMG3esvrbn5BGBoxzcm3KmZNGfQOF7EhdZCmz0apvVvbOWDs
         yPUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df4bebsi109794585a.105.2025.02.06.04.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 04:56:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1Qe-0000hl-Fa; Thu, 06 Feb 2025 07:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tg1Qa-0000hO-BI; Thu, 06 Feb 2025 07:56:20 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tg1QY-0002ed-8E; Thu, 06 Feb 2025 07:56:20 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4EE4A4E6005;
 Thu, 06 Feb 2025 13:56:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 8H_IzrJXURkt; Thu,  6 Feb 2025 13:56:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 57E664E6000; Thu, 06 Feb 2025 13:56:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 556B874577C;
 Thu, 06 Feb 2025 13:56:11 +0100 (CET)
Date: Thu, 6 Feb 2025 13:56:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Daniel_P=2EBerrang=E9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
In-Reply-To: <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
Message-ID: <65a115a0-a2be-1c5f-f11a-e8b5f89c3ce4@eik.bme.hu>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org> <87a5b07u1d.fsf@pond.sub.org>
 <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-2484570-1738846571=:22970"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: dELyTt4DQynS

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2484570-1738846571=:22970
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 6 Feb 2025, Philippe Mathieu-Daudé wrote:
> On 5/2/25 08:03, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>> 
>>> MachineClass::auto_create_sdcard is only useful to automatically
>>> create a SD card, attach a IF_SD block drive to it and plug the
>>> card onto a SD bus. Only the ARM and RISCV targets use such
>>> feature:
>>>
>>>   $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>>>   hw/arm
>>>   hw/riscv
>>>   $
>>> 
>>> Remove all other uses.
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> 
>> Impact?
>> 
>> As far as I can tell, this stops creation of the if=sd default drive
>> these machines don't actually use.  Correct?
>> 
>
> Yes, since these machines don't expose a SD-bus, the drive can
> not be attached and always triggers the same error:
>
> $ qemu-system-hppa -sd /bin/sh
> qemu-system-hppa: -sd /bin/sh: machine type does not support 
> if=sd,bus=0,unit=0

And how is this error improved after this series? This seems to be a 
meaningful error already.

In any case, if you plan to merge this, could you please cut down on 
adding nonsense defaults to every machine that are then removed again? 
Maybe only confine it to hw/arm where most of the machines are, for the 
rest you can point to an earlier version of the series in the cover letter 
to show how did you end up with the list of the machines to help review 
but the final version merged in master maybe does not have to have all the 
temporary changes to avoid excessive churn. Or was that the plan already?

Regards,
BALATON Zoltan
--3866299591-2484570-1738846571=:22970--
