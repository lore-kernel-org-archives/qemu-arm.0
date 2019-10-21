Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4881699wrm;
        Mon, 21 Oct 2019 10:42:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZPiQnP53zgHNB9T4Iq4KmhNM7boDMlfi7UMbLjjM5mBo3FmO6+DKg0UH5Vz03akjO/IwS
X-Received: by 2002:aa7:cb5a:: with SMTP id w26mr26527768edt.188.1571679727637;
        Mon, 21 Oct 2019 10:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679727; cv=none;
        d=google.com; s=arc-20160816;
        b=ZS6mGhn8y5JKVDbVXcfVdZE3wWk3aUeL7jdS5dUKbl5wCW9hJwf1se2E175bw2FFXt
         SC5SJx0Uco3Q347TUBsADK1xht4tNinNdv+g8CiXL+ekQDpnxFjQWrW+zGFBGB8MJ22r
         JaTyURXKcLKX9OqldCmE9Lu067bXLATqxNfw0rTNzeYbpaoDwrW1xbWgt7d3gqwu3iFf
         Ts7MkI7Mno4YfX4fBEQkG3KEQ0GFglmRCCQLZvYWv+Exn5ofZQtKn4/WY8jRcsC0Vb85
         P3E08ZPa6jWd91ORMgHQeI7gabs/JlGFHXhlICwXgG5iRrP0io1wdWtHS7KcdnA3v/cj
         zEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=7o2dss3VOzyE7jxjHvktXmTvl4FbMO3NZUv6ex5lRyk=;
        b=xXM0LXofELtdgHMDsSzpIxlVvN/wiP0yCRTFZvyPSwUFuCSUlYvF1cTXuva/rk3Z6H
         T1R1Td218ibII8mgjItWBP+Jdxyr7j+WZZWaVXspjpYF19YBqCTI/PtVCjzCOGw1mTsA
         L26Gu8cd9ZGLv//3jW3+NVzqbYwdfb5TcuJd5152lwaVMRy8QeLxu/C9obqxf96LyTwT
         1nxeeMzN/n0hj8CoFguz7EbgJ2R26wfVXjoYauVeou8C07hpFFOpwIBHTDwNg24xFrzj
         yBhazrZ4k411YNgj48K1d1RNGStL5f7cuM317gAbJtO0Ihup3AW6a2aQKC7gp/xmRQLj
         MFJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvAc5S7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 96si10543267edq.24.2019.10.21.10.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvAc5S7m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbh0-00039D-Ix
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbgC-0002Zc-A0
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbgB-0003D3-4v
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:41:16 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45234)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbgA-0003CB-V6
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:41:15 -0400
Received: by mail-pg1-x543.google.com with SMTP id r1so8214892pgj.12
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7o2dss3VOzyE7jxjHvktXmTvl4FbMO3NZUv6ex5lRyk=;
 b=QvAc5S7mwtKOdwKwEm9Dvwgd5KhOnqKTFU6+ZysDTHAZFvmbEz8pqP0BcOPZDvpGz8
 CVUYexQ5CiCh5sqomoD368JKgOrc8eTn0c8rTpchucqwe61Ilu0B73JGxWFGMRY1YIQ+
 1xeGF8ph8JOPjGG1vtuXwi0krTJ1vpiw14HElyRyQ2BGnrw7i6iQbd3jWA/Q/Rc7JYOx
 aybzaxz28k4iRjUtzDuc3rEkkjR9NKdp5sobQ63njLUUx4JN8kkaqKEx04hWwCGwNS9d
 1rwVLlWfsjGzdSMAzTLyT+tm188GpN6xaTXEEMzk8DNP7ohkQFMi+S5CQ600pYIsBOOQ
 +yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7o2dss3VOzyE7jxjHvktXmTvl4FbMO3NZUv6ex5lRyk=;
 b=MA/iY8eQcCL5PZXBzhV02Q1RRlRuExcFUxYmNhURRVzvS/lcrj+6o4Uj8rhngaRSPG
 lq+Aw6P05omEEu8twNUcoaq1Ru5dB8EQcGJHww9eW4b1ek9uB9EoDpJF/dtr/LUlAAM7
 dhQ5+HyYD8BvySk6d+pAz5q9ynE1tjn+0fUA+zDxqCZqUkSoYvdp/zlBuihYd75n3tJt
 J7DJZhqcLx8ddjLQiuqJ0R95DWWeolZFS4su5twkPKkBrT1SoMbDnRrgbcIAynolYHGm
 BSysjkS3IPEwk1kH9fkTdafKqh5YazJL6PAc5MQctU0iDzuEF9YrDHgtAGaZcWxV0ZCh
 83YA==
X-Gm-Message-State: APjAAAWVaFKcdoyWffUN+EZaQs+d4wFQwjPvMylezqSyyO6Lfb5N0m7H
 iM3DJ4cum9kkpA61A5ErGrpthg==
X-Received: by 2002:a62:ac02:: with SMTP id v2mr23443419pfe.200.1571679673053; 
 Mon, 21 Oct 2019 10:41:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x125sm18599307pfb.93.2019.10.21.10.41.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:41:12 -0700 (PDT)
Subject: Re: [PATCH 21/21] hw/core: Assert
 memory_region_allocate_system_memory has machine owner
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-22-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a9b24bbe-8186-c50c-fe84-c9dc9c0448ce@linaro.org>
Date: Mon, 21 Oct 2019 10:41:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-22-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DfpT31aTBZ0x

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> All the memory_region_allocate_system_memory() pass a MachineState
> argument. Add an assertion to ensure the new boards/machines added
> set this argument, so all system memory object have the machine as
> its QOM owner.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/core/numa.c      | 4 +---
>  include/hw/boards.h | 2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

It would be a good idea to add __attribute__((nonnull(x,y,z))) as well, but
since we don't currently have any markup for that in qemu, that can go in a
separate patch set.


r~
