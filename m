Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp247993wrg;
        Fri, 7 Jun 2019 07:21:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2JHl75WIpyZYi/LkoTRXisZDwoY3QeZxROUjgGOdgF2WFF2894HLqzpygF+KSfPV92CIQ
X-Received: by 2002:ac8:488f:: with SMTP id i15mr24508285qtq.32.1559917265024;
        Fri, 07 Jun 2019 07:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559917265; cv=none;
        d=google.com; s=arc-20160816;
        b=W6D5iS9L45i6qh0bIOpCnqnLPte49KkoFPOc3MBZCitEDyInRigbGtHCT3acVTH8XB
         WZlGS6Oj17L5C8xm3ZdT/bFk/EfuK+C1CB+DA14yA6lou4Fbmr6OWcVAr+IOhhwJnstd
         moS93oSPLu2FlV5zshTiYrXBMbeWawCApLKhQ7Donnpx3Ev4W++Ytt2fCHP+hf0S5xeM
         pkW9rsFJUt082JIF8I2HKAs2Z6JWw5WIHgwBZQCawpjdsNJuYllS87DH+GLd/9GJG2FC
         tB3h6XgCfrP03qGPLj/YyS/L4Qznf4J0cInvJDhnBWCLwlntMni9BN5n5Jhpbej0I/7K
         YsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=o2axUgPQ7U4YVSrPLMIUbTmUDBGbOntWdk1ZUJzN/d4=;
        b=WJYrMhKu99ZvO/r7w6iMDM0Gsmar9MGZ5FJGEvytGgyxLxM/TMpkuztVcFyAhtOQLF
         Co9X6PPEVrGq7h5G/7UpJa2qYXrJVvisCm7fEqFOdsALb5sCPWlS5aN82JkV328vfBUI
         rYU8PFOfhvuBBHQ2dF+ddu9nh4bhUrkzfJF1062tF25AvB4LzDQl4T2graOjIIBOs71W
         ftatEPjkg0m0T80pfcEN4l6jErg8HBXjIO7j3GdHo+Az/0YdkRDaTN50GezDtJVuUWcX
         qPBtFqNGtXcIJUAZn7o4KMrnvRuu3xSSL/UKDO/FU206UzAYaYLO3y+E4lS2+GTxecoY
         MF9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id t124si1245570qkd.241.2019.06.07.07.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 07:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZFjs-0005XW-JM
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 10:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZFbc-0006qk-Tm
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZFbb-0006OA-Nd
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:12:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZFbb-0006LZ-HD
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:12:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id m3so2352651wrv.2
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 07:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o2axUgPQ7U4YVSrPLMIUbTmUDBGbOntWdk1ZUJzN/d4=;
 b=qLYF3OnK/X++fAveCq6D/ZZ1IfFJrTGXdJVAOUngNWQe5TyjO46OHmsAbnVelYKC9h
 PYJZnS7nrr7cVHxQXN8qOShMQPtkRmz5319LEU9jElRC+x8+rWZAIVZFxDBmYCxtb/z+
 LB97HZHlLBize5Ppy9Il4SVOl/2Lmk1jBolcaw8PqTxqnIG0fujZ5nTVL8PCc8Lz7IiY
 R/Cjm47M8GybJefM39v1zrY6qZRbdaq/p8LaSPOr+UbeRNr2pZW/1P3XvVXoV8CvhlRx
 EXa+jhTvM+2TCT334quYG4A++QVKQB0Pfzpw8abBVOD66Dj3mBwcaqt68/4kEJ8/oYFT
 +kQA==
X-Gm-Message-State: APjAAAX/c0iGbX8ajrBRllIzERuCX/B5XnUkcudq+un4CCpAXMm53QT2
 B1gLoiJQYzMLV9ToPGjyFG5Abw==
X-Received: by 2002:adf:dd03:: with SMTP id a3mr2165174wrm.87.1559916750341;
 Fri, 07 Jun 2019 07:12:30 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id v67sm2142139wme.24.2019.06.07.07.12.29
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:12:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20190516144733.32399-1-peter.maydell@linaro.org>
 <CAFEAcA-t=9+zuEOf2uoJAMnpnyAJtpCqe2biWzS6a8nZU0uQOA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3e786246-9d13-36fc-1d1d-e3f9e915d8b4@redhat.com>
Date: Fri, 7 Jun 2019 16:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-t=9+zuEOf2uoJAMnpnyAJtpCqe2biWzS6a8nZU0uQOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/4] hw/arm/boot: handle
 large Images more gracefully
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
Cc: Mark Rutland <mark.rutland@arm.com>, Auger Eric <eric.auger@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U2OFahT6Grdt

Cc'ing Drew and Eric

On 6/7/19 3:07 PM, Peter Maydell wrote:
> Ping for code review, please?
> 
> thanks
> -- PMM
> 
> On Thu, 16 May 2019 at 15:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>>
>> This patchset attempts to fix https://bugs.launchpad.net/qemu/+bug/1823998
>> which reports that we don't handle kernels larger than 128MB
>> correctly, because we allow the initrd to be placed over the
>> tail end of the kernel. AArch64 kernel Image files (since v3.17)
>> report the total size they require (including any BSS area that
>> isn't in the Image itself), so we can use that to be sure we
>> place the initrd sufficiently far into the RAM.
>>
>> Patches 1 and 2 are new since v1; patches 3 and 4 are the old
>> patches 1 and 2 (and are basically unchanged since v1).
>>
>> Patches 1 and 2 in this series are new. Patch 1 fixes bugs
>> in the existing code where we were assuming that we could
>> treat info->ram_size as the address of the end of RAM, which
>> isn't true if the RAM doesn't start at address 0. (This
>> generally went unnoticed thanks to the magic of unsigned integer
>> underflow turning end-start calculations into very large max_size
>> values for load_ramdisk_as() and friends.)
>> Patch 2 adds some explicit checks that we don't try to put things
>> entirely off the end of RAM (which avoids those accidental
>> underflows).
>> Patch 3 in this series adjusts our "where do we put the initrd"
>> heuristic so that it always places it at least after whatever
>> our best guess at the kernel size is. (This might still not
>> be right for images like self-decompressing 32-bit kernels, where
>> there's no way to know how big the kernel will be after
>> decompression.)
>> Patch 4 makes load_aarch64_image() return the
>> kernel size as indicated in the Image file header, so that for
>> the specific case of AArch64 Image files we will definitely not
>> put the initrd on top of them.
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (4):
>>   hw/arm/boot: Don't assume RAM starts at address zero
>>   hw/arm/boot: Diagnose layouts that put initrd or DTB off the end of
>>     RAM
>>   hw/arm/boot: Avoid placing the initrd on top of the kernel
>>   hw/arm/boot: Honour image size field in AArch64 Image format kernels
>>
>>  hw/arm/boot.c | 83 ++++++++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 62 insertions(+), 21 deletions(-)
>>
>> --
>> 2.20.1
>>
> 
