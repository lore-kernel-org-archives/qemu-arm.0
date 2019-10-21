Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4836840wrm;
        Mon, 21 Oct 2019 10:03:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOOOT8PK6V77YSDS1reL4cHT+qRRa5snz8dB/VYC3CuariRqYZWYsgQgWRYr1/1Gfhsg3W
X-Received: by 2002:ac8:6956:: with SMTP id n22mr25237142qtr.7.1571677418000;
        Mon, 21 Oct 2019 10:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571677417; cv=none;
        d=google.com; s=arc-20160816;
        b=L6+x7DC+Ej5FXnCrJQC4dbJEG03GTMKMdegIrXE7bI7s8MBVlb0Bywd0SDzhO5fCt+
         k4d5FVXgr9LN2CkAhuakp+FHI9zRdv700wQV6Xr87K2CGRI9/T/kMB9Ae1d9ZiycbjzE
         FCCo8nwcn4P2cytjNeNlzFHQyouIcYEsXe94FCMfXDQXeCWB//U2atLrwkf17f/r4Uoa
         fVOn2OoP4oxo4owECybUdA8P5zHuhepaxbxHAyQXboMpeU+gAB35OBdvM/pwFoccNhyO
         n7LXKZfWg6qcw46D2V1eCQ+9VMigiAS2ZSH4OQBd3mjiZKjczV7H1HvsetKxQZtzexN1
         qViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=YretDNAG4e9jCKQB17m7IqnbbDa7fHH/XpvR5+yujK8=;
        b=OTE+ZMHJHZyx8EewN/wEAWKb+ZZLNK6gGSSO9FhEVCpt3NF2ZfO3swISil0in8J6n3
         dYqQ1xAMgS2lxSFYGtMkO3tmkPVO7w9uSLQk8Hue2srxqf7JYpvBLSHqmedK4sfsAihT
         9XA+bGFconFqCLuHBv+SlGStTq+FYoRx1kHpBX0BsjzDuXTZJVaM/xUyGmxu19RjAiIm
         D+0LNXHmjRte62RV08g8JPQDIj2f/nYttXFhh4jP+GsqWHbZrxGcdlyIcxOM+GPDaPQT
         kDurQurKgIS8P/k+rv11l/n7tpgBFIjkQvzD7xWXy6ti4YHION8hSjQs33ZMK9ZrZEDM
         /ocQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GeN9REyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w142si14255117qkb.172.2019.10.21.10.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GeN9REyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMb5k-0008Dk-TH
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb5W-0008D6-OG
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb5V-0003Ow-RK
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:03:22 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:36144)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMb5V-0003OT-Lb
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:03:21 -0400
Received: by mail-pg1-x543.google.com with SMTP id 23so8177474pgk.3
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YretDNAG4e9jCKQB17m7IqnbbDa7fHH/XpvR5+yujK8=;
 b=GeN9REyzUZMAWGm1Li5nAHqXE5nS/4D3iLAHkgCHctHgnojs0QdFhoVyDJCH7F2gtv
 6EtwfHv27A23T+JMAMqQROw7uJFnJsu4uQVJcYl0AhB3mqKz6OVfCHzDNlHStUE2SF26
 px6mGQVS19qvVGi8bIXrgISBudaAc5faqTcJOkLzXTL+39SBEqHpatrbMcMy4jUibZx4
 8wd/cKJ8CVGYfsogRX/ViPE0eRjvAL1KuxpFuKn/lGbTFsN4KB0J7G5P76kbvaTlUo2Y
 BWWz2CvuGtyTTyZvsdBWsPCJQ4Zg9aa/mYvi4gznHuDGr7zW5tGTCJOZgzDt5DyAmHZI
 VHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YretDNAG4e9jCKQB17m7IqnbbDa7fHH/XpvR5+yujK8=;
 b=ofpAflZniSxsPu2AXlDRuh5c8h7JNRQoL4C0scUjVRX4hy0BQQMZ/s/xIIiVT9Kg/H
 A31NwLDUJwI4OfB9bQqVoobmKphouIbb5ieRODG0crcI8UVmsGvFTDYNkg1AJs2l8znG
 PGvsZiWqp5IJS26lq+7HxqqXcbAaHQzVS+3GuPft9P/T7x/XZHl3El60So4AFnhe3x/2
 eFpOst2Q69Y9bcqdwEheQwp26mohOPIlgja/YqCYQgw9nAr60txp0oBD/SMQama7X30H
 k4h/LNnbAMnz0xUX690Id1uU5wPQIlqSRrciAcDGzKsp8KjE4Q3r7Vy5ZO48VbBXxAxL
 FNdQ==
X-Gm-Message-State: APjAAAVoJSVZhxCCRhl6gGJZN8zzEmuWtCnktUzgkE0Z/HU45lgidCkH
 SzTGRE5E+vTwU2xz/BkXuke5SQ==
X-Received: by 2002:aa7:838f:: with SMTP id u15mr23260134pfm.13.1571677400333; 
 Mon, 21 Oct 2019 10:03:20 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g9sm14362541pjl.20.2019.10.21.10.03.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:03:18 -0700 (PDT)
Subject: Re: [PATCH 05/21] hw/arm/omap1: Create the RAM in the board
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <47214ca3-0fb1-f181-a32e-12eebeb49a29@linaro.org>
Date: Mon, 21 Oct 2019 10:03:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-6-philmd@redhat.com>
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
X-TUID: J+FJydo7sEAc

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> The SDRAM is incorrectly created in the OMAP310 SoC.
> Move its creation in the board code, this will later allow the
> board to have the QOM ownership of the RAM.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/omap1.c        | 12 +++++-------
>  hw/arm/omap_sx1.c     |  8 ++++++--
>  hw/arm/palm.c         |  8 ++++++--
>  include/hw/arm/omap.h |  6 ++----
>  4 files changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


