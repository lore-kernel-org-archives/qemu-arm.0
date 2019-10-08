Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4904763wrm;
        Tue, 8 Oct 2019 02:06:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygIkJUCK4QbnL1OKMdD5CkLmWQD7vmUnZiwHcN7KjiXqOFEwdz3pxsjIH1gvuCkCSzTGRg
X-Received: by 2002:ac8:6b05:: with SMTP id w5mr26403240qts.331.1570525588501;
        Tue, 08 Oct 2019 02:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570525588; cv=none;
        d=google.com; s=arc-20160816;
        b=SeB1vQu59j6W4cBonCWpqjSnduxzr1sBWY+0y4lcAYhidimhDH5I2YNhvRSc+EL29L
         PP6nDqfaRO9kF6dlJisHPGFL73FS9rlATVSI947aHsJgRvYbF6M4HNbazt6DSzuKiyBD
         jIODQietIRuF5EyHZBqMkISvrnP7L8QpWsLEFfQEgddDQZJSS6Bn0NmnLpPIGCsBT9wC
         ZnlP2iVp2fCrkHaoNk/x+KztWN/9RH5BBbDwh2U4Ib6tCpNUUdGpVQpEu0YVRukHodf+
         5VXOLTUW1q/uY/TtTf7uAdh5CC0yJbvY1QE7DPMW78lKAGwrtcA8TGgngpU5tdX11BDU
         j4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Sla1WAPIsDQRMT0iB64L68ydwLjhOCPjA9AsUCjvFYo=;
        b=tUhvi7gWM+QKCD1seFi/5+nFZtvcaxRXJo+tNEvTlbgRTmOvldv0Pa4ugXAebztzXk
         EFOgPNcf48IpsLjphGuxi7e/KnMUBq3Z/gSVwFAj6LalCXjvuwkLqTMVi6W0DqfUd+k6
         UkdThMkJ6/xipvI5bKLW2ct4eXNKPf/haghz/u0wAMpaigOXIel3CZumrHy9sVEugQ3Z
         slHPXMuHdzkUipuwiQmPlMRBdr5MSthcx84ukInqPjZYJDcoLSOpaC9kmWo4YbFCqUgC
         QlcaD9gaW+SYAvHGmahoWKDNnwTRAdkjtQrURWP3viz/ukG7Ccvhz4zU1e4FXlLYQHxQ
         8FkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Vo/yvWwZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si14906528qvf.100.2019.10.08.02.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 02:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Vo/yvWwZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHlRr-00061Z-A7
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 05:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iHlQ8-0005yw-4Q
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 05:04:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iHlQ6-0001gi-Ue
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 05:04:40 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44083)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iHlQ3-0001bU-Oj; Tue, 08 Oct 2019 05:04:36 -0400
Received: by mail-wr1-x442.google.com with SMTP id z9so18380417wrl.11;
 Tue, 08 Oct 2019 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sla1WAPIsDQRMT0iB64L68ydwLjhOCPjA9AsUCjvFYo=;
 b=Vo/yvWwZ1iflLA7YfFRPi3wYFyiLuQpg6NCAEPQjJXfMpr3I1Iwj8FBnwx9o+eSM7T
 AEGiO4bHA1vuVhYs1LAB00tw6cdSJ8UDm1GOolrRcT4vfA7gGUFc3XvOGdLD7/DbHXzH
 RwU1xPYfnBUvp4PIE47+MnN2xqY3FAc5yNdHB6kVDUux35gYYA56ZQF8iOIGtCXsUhfN
 cpKO0z0AcnGDh4F0RF8QtZDH/WGwtcR7iTXEYSqdk7xtrUPAlg57E/F0rODpKGYFTLMj
 rL6jksoaLzxhu33Be76sT/J5kc8Np3E6J6Mw3Qcl9WbFjzQMCLUOwzG2YOUFBxgsS8xR
 IVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sla1WAPIsDQRMT0iB64L68ydwLjhOCPjA9AsUCjvFYo=;
 b=Y5bhMRyEUNEMC4vBc47F446oLBtvZkhHRfparFoG3xZD99DkenIUZnUuHt+U+C08r1
 FhPgp9bY4aIFN5woWh24AhbnyVxIEPzkxEu0y41vfodfvkTl7VK7ehRejVv4ZLKvGQ53
 24jZCZeIs8QZ2nxnNNgwlBvACYrEJJ//HaZPJ830Nt4HEsGp6E5KQoniDrq9ZxjPMus2
 zGlqOE0h1RolSghj9fSKeA7Jij0K7Qj5ZnYat5/9jokNm9/m4KPmYffAkyBABvq7+Up1
 +1ahmqzpTX69nK7NWnNIW7Z0a+trsp0C6hSyRaWoB0uj9Mj77p1FKBHrK52dmVDfcP2T
 us2Q==
X-Gm-Message-State: APjAAAU2eYS/ZeCueTzjB7z1Fp0IGsgvXB09L8MG6pCGb3T7xdr3Vin5
 XshNkLdrqbzO7a+AYvabaqY=
X-Received: by 2002:a5d:6347:: with SMTP id b7mr20506970wrw.131.1570525474508; 
 Tue, 08 Oct 2019 02:04:34 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id r6sm2389522wmh.38.2019.10.08.02.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 02:04:33 -0700 (PDT)
Subject: Re: [RFC PATCH 14/14] hw/arm/raspi: Add the Raspberry Pi 4B board
To: Esteban Bosse <estebanbosse@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Pekka Enberg <penberg@iki.fi>, =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?=
 <bztemail@gmail.com>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-15-f4bug@amsat.org>
 <c8a8c7758104a1a5fe052743b5a22d3a1353de91.camel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5f1dd044-2909-767d-5a79-8a40d330e129@amsat.org>
Date: Tue, 8 Oct 2019 11:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <c8a8c7758104a1a5fe052743b5a22d3a1353de91.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4xY7aUsblaK6

Hi Esteban,

On 9/29/19 5:53 PM, Esteban Bosse wrote:
> El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
>> The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).
>> The SoC can handle up to 8GiB of SDRAM, but we limit it to 4GiB
>> (no 8GiB models in the market yet).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/arm/raspi.c | 31 ++++++++++++++++++++++++++++++-
>>   1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>> index b4db39661f..59ee2f82b4 100644
>> --- a/hw/arm/raspi.c
>> +++ b/hw/arm/raspi.c
>> @@ -39,11 +39,13 @@ enum BoardIdChip {
>>       C_BCM2835 = 0,
>>       C_BCM2836 = 1,
>>       C_BCM2837 = 2,
>> +    C_BCM2711 = 3,
>>   };
>>   
>>   enum BoardIdType {
>>       T_2B = 0x04,
>>       T_3B = 0x08,
>> +    T_4B = 0x11,
>>   };
>>   
>>   enum BoardIdRevision {
>> @@ -56,6 +58,7 @@ enum BoardIdRevision {
>>   static const char *processor_typename[] = {
>>       [C_BCM2836] = TYPE_BCM2836,
>>       [C_BCM2837] = TYPE_BCM2837,
>> +    [C_BCM2711] = TYPE_BCM2838,
>>   };
>>   
>>   typedef struct BoardInfo BoardInfo;
>> @@ -90,6 +93,12 @@ static const BoardInfo bcm283x_boards[] = {
>>           .ram_size_min = 1 * GiB,
>>           .ram_size_max = 1 * GiB,
>>       },
>> +    [4] = {
>> +        .board_id = 0xc42,
>> +        .board_rev = { T_4B, R_1_1, C_BCM2711, M_SONY_UK },
>> +        .ram_size_min = 1 * GiB,
>> +        .ram_size_max = 4 * GiB,
>> +    },
>>   };
>>   
>>   typedef struct RasPiState {
>> @@ -336,4 +345,24 @@ static void raspi3_machine_init(MachineClass
>> *mc)
>>       mc->default_ram_size = 1 * GiB;
>>   }
>>   DEFINE_MACHINE("raspi3", raspi3_machine_init)
>> -#endif
>> +
>> +static void raspi4_init(MachineState *machine)
>> +{
>> +    raspi_init(machine, 4);
>> +}
>> +
>> +static void raspi4_machine_init(MachineClass *mc)
>> +{
>> +    mc->desc = "Raspberry Pi 4B";
>> +    mc->init = raspi4_init;
>> +    mc->block_default_type = IF_SD;
>> +    mc->no_parallel = 1;
>> +    mc->no_floppy = 1;
>> +    mc->no_cdrom = 1;
>> +    mc->max_cpus = BCM283X_NCPUS;
>> +    mc->min_cpus = BCM283X_NCPUS;
>> +    mc->default_cpus = BCM283X_NCPUS;
>> +    mc->default_ram_size = 1 * GiB;
> The comercial models are: 1, 2 and 4 GiB. Why do you choose 1 GiB as
> default?

Well need one default, and 1GiB is the least beefy :)
You can start a VM with more using the '-m' switch.

Note there is also a 8GiB raspi4, but it is not yet launched apparently.

>> +}
>> +DEFINE_MACHINE("raspi4", raspi4_machine_init)
>> +#endif /* TARGET_AARCH64 */
> Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

Thanks!
