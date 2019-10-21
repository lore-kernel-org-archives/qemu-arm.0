Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4856830wrm;
        Mon, 21 Oct 2019 10:20:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVboymjt0RZuHKsFMtJQNKrH4oxNY6oEtLKRf5tHz8fRTInfnnoHzQSo8IprlxiHZhS9V4
X-Received: by 2002:aa7:c48c:: with SMTP id m12mr26125244edq.280.1571678421252;
        Mon, 21 Oct 2019 10:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571678421; cv=none;
        d=google.com; s=arc-20160816;
        b=vqI21CRu+/loVvCt/mNejBxUhkZ15TiGzPaaijLvy/8eUAUgt459Hf1bf5eM7sWUTo
         DA5ItdEkQs/5pmBrReopHOsVpEZ+6iAHmsGqacGdYGpMJsPikMsX8bgdiRowbtRBTvyV
         uSXrSRu4U1q8zUZjvwA50/J1N61Wnyd0qSjvCFfd9uLjshTSRwZ64MjJfmh1/hbnFqT2
         sSIvpIfS+Enk02qpzFItHathd2B7kzuwDjJovxS4Ri5QBYy892KHOgFrve52fF9AN1CV
         JZUZceMgb8DYtv0y/nAoFa+m/VT7bOrqtdH9eKmlnOVxyhJl8b8rP8mpKLRQLdUPwKtz
         QsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:references:to:from:subject:dkim-signature;
        bh=Wb+3zAUn+l4NlM6wLvO4abhyBQJMMb1MgopA5691n+Q=;
        b=OunPIXlM20+9LNfSNTJmC24Rz1IHRUNpTDzyLt0twZHE0crkOTXZpnXPMcomXOXNRq
         GZBp8dIOfFMaYp/fx63t0+fXjtVXAWhPfiZdpoQq6dMT5ylzlx1OAKJgGwQtX9cZAWJ7
         hG3t1Nd0Botq1RNdSnoepZeXh1q0xIslxgRqu6Iw6VSXJv4bGGwIZUp5dmxlWoFeJ+iu
         fBNYZKdWqCbSjYSvTNorfA++j0EMinM6HGoiwC3BomaJGmAcsNhIiHwvZK770mf17pjC
         27zkGoRKQEKb8iCnE9Cg3UIdhRdUlJz4qf+wl32GDh6xx1YhsCDcpMvOeDWw6C4cqyGd
         Ekfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yqTdf+Tx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ck7si8762280ejb.250.2019.10.21.10.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yqTdf+Tx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbLv-0007iI-Fd
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbLe-0007gB-9p
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:20:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbLd-00021c-46
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:20:02 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42463)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbLc-00020u-TR
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 13:20:01 -0400
Received: by mail-pg1-x543.google.com with SMTP id f14so8184565pgi.9
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wb+3zAUn+l4NlM6wLvO4abhyBQJMMb1MgopA5691n+Q=;
 b=yqTdf+TxNAiUx1/GgPX8DlGrfLQTjHLR0uKWkAfXWXuPT1P6w8QPZnvYePY3aiGQ8I
 8UtNZQOy09v0ukghctQMw87BQ8wMMwkPr/jMv0FN9ucinuEfFNv3g51hAgG5LbxFhEBg
 qWvCBuYGrIweGWvi7PNQbSEYnno0TH3X8laHvRhDrP3dPJTFPbBNjbBAORdnuku4VLfz
 f4H2BZS2x9TR15RfWb3MghYGWsuTJILQs0TP60h0TV/a92lXfmkvYzKFup3xrCMTOLZ3
 EqzXo0ErKFllbhnlo1BafpnmrjLW52N7XBocynLg/ocH0+YLbEyOoDNoNWtFqyInQrRK
 X/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wb+3zAUn+l4NlM6wLvO4abhyBQJMMb1MgopA5691n+Q=;
 b=qUV2u8WRyNa7stv8O3K2Q7haVxFnHF8Zu08ZIo2jeF0bDYfY1x2VBICDBElfgzDIeG
 fZGGIyBKCqtyKaqYWJyN24FXgg7bleJt9LYemJ00R0nd7R8i4Tatxzz2o2RQjW+Np8UW
 BLIpQECjCjXOnhu/X80l9M69fQFI5m9NblWnjIn3EfoEr3gOKgp+IK6YgwKtie69umvN
 vH5Ykp9wn1/Y/TgVPgEHscmfefoBjE7zhuC0kd64XvjpChCrE/xZ/ftI8bbIoUQwpyz2
 KbcfNQo5rkA8jzJJG/6XmIv2SYTSnjHo0dw6CASY7izMwogVNfh1MkRsFydAYkTdqc9A
 DD/g==
X-Gm-Message-State: APjAAAUXF5+ZsweEXaxTpur98Ohp30arxnb8jemjIcmU4qhtWvVqAx9b
 fGXmX9/9ft2nHwGvPg+Ur51FCQ==
X-Received: by 2002:a63:cc4a:: with SMTP id q10mr12951838pgi.221.1571678399127; 
 Mon, 21 Oct 2019 10:19:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g4sm15567991pfo.33.2019.10.21.10.19.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:19:58 -0700 (PDT)
Subject: Re: [PATCH 11/21] hw/alpha: Let the machine be the owner of the
 system memory
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-12-philmd@redhat.com>
 <ed804be1-8516-3dbc-d738-20c2b03e5309@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ad652874-452b-2c8e-b80f-b6b8b5b8a751@linaro.org>
Date: Mon, 21 Oct 2019 10:19:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ed804be1-8516-3dbc-d738-20c2b03e5309@linaro.org>
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
X-TUID: 5ercSezn0b0D

On 10/21/19 10:14 AM, Richard Henderson wrote:
> On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/alpha/dp264.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
>> index ddc249261c..5696b1e79b 100644
>> --- a/hw/alpha/dp264.c
>> +++ b/hw/alpha/dp264.c
>> @@ -78,7 +78,7 @@ static void clipper_init(MachineState *machine)
>>       * Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
>>       * but the address space hole reserved at this point is 8TB.
>>       */
>> -    memory_region_allocate_system_memory(&ram_region, NULL, "ram",
>> +    memory_region_allocate_system_memory(&ram_region, machine, "ram",
>>                                           ram_size);
>>      memory_region_add_subregion(get_system_memory(), 0, &ram_region);
>>  
>>
> 
> I take it this squishes into the squish of patches 7+9?

Ah, no, it was the TyphoonState that had owned the ram prior to patch 7.


r~
