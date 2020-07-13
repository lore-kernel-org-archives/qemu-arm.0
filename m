Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3509293lfm;
        Mon, 13 Jul 2020 11:01:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYkMdDY8BfQGnooZEE/1SXlkO/6hE1g4S87ICJ0SV9h4PHr9waqWjNPdfG6skj7fLxUg1Z
X-Received: by 2002:a25:414e:: with SMTP id o75mr1775923yba.170.1594663285511;
        Mon, 13 Jul 2020 11:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594663285; cv=none;
        d=google.com; s=arc-20160816;
        b=KrKTOtczW9vCcQjfZgoXGKBXgYvuld7AhPC+ALqmCdSnZ9PtYCnM1WbmY8hKt8MisO
         q31jD6Z6/v8Q3TsaesNly8DdXvQJOO5Cr65aHwrjI4fkewyYCbgreHmyVl8JPOUd33DV
         vTlZkdiLdMTbv3n+IsCGJwX68CF9gUzje4snGQQEPXcvpYZsQ94aho/uy274a8XDM+Rz
         VfMfLjaWQV6smC6/5V4JfljD/ACF4nnO1FjY6DdIuYz5d3vgobUSjvHwDRVRViPsetQn
         jftO2bfJhUkYpD9/a3640bCOmPy7AjzEJWpKOkDKMWN7UsRqPCI7ao/zNXWa3CR9Tq7/
         C8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MyAyaHoQ2ECMGGb/JEE2cNXWCnlaqD2ovwTlUS2erJc=;
        b=hR8Kcv+GA0VhSCfAWqQeAt/AYZidEaE0xOcVb97RUqMEEzYWfZPL3a01JDeYYjnQvR
         Er6UL+oVvitKcB+jTNGZWMgDh/CNQZKdNvfGWc5IP6s9fhM5J3i43nTez/tz7J0lDtVW
         xFhwJ6hlfgCd9ZBmHpMX3d9EQl7wpLvkaPxD3KZdsgFe4bGlW6MHNErDJK7+IBHLdnbr
         X7W3ZAfzN4ozZBD20khqRyY2BouMx03Y+Qnxe3Ll8apipviZPl1/gNcKIJ9rg800Va+s
         dXBZS1p44bt+syKe6gxl6dFns6+KPKzCl2LuTKGifuzBWZ3Pgx4NrJkx1gUrmNc63HG6
         T4Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="qIOF/ETm";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e139si6462116ybb.219.2020.07.13.11.01.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 11:01:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="qIOF/ETm";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jv2lY-0006kL-U8
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 14:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jv2kC-0005Mc-Pv; Mon, 13 Jul 2020 14:00:00 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jv2kB-0008F6-7b; Mon, 13 Jul 2020 14:00:00 -0400
Received: by mail-ej1-x642.google.com with SMTP id dr13so18313490ejc.3;
 Mon, 13 Jul 2020 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MyAyaHoQ2ECMGGb/JEE2cNXWCnlaqD2ovwTlUS2erJc=;
 b=qIOF/ETmC6TpDdNQlhmo5zefT0PmPc7cmeQyM+Tl0GZNDX3oeKuHYa4HZgLxSPzk6k
 /5Z+h/7Ds8sv5UdJ+rBsNy223Qe3BwBTCsU08s6arQSgsLk6zjyuzyETaoPi1rsvhJJ4
 vR7bi9wSKM3n7xz00BP/YBYMpiwNsuWPa/R925ej9ri0oxashJzLQPf5zmLWaLN0a9IJ
 SLDmpqimXNstUQ65DCQYkQYSqx5+c2NT4k/wIl1N5RqK7fAQ1nHnPm0RZhd9YzXT0ZhS
 aUoV+qfG3tTJavvN1UMiSecMtpHELenyRkZrTaEDFibjrAWxgCw3wfk39tPD/9zpSdlM
 0E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MyAyaHoQ2ECMGGb/JEE2cNXWCnlaqD2ovwTlUS2erJc=;
 b=a51VAhGEkzquN83p/9A4ri5qSx5F8NCGOqXLJoxRTPOdCAv47D2Vp//PWKNIEk91+a
 OJlMwVDAjeXomKzdehdyzoJc5DJ0GoA/uwf8yxGbXOStj9xTPg9uCm4Jt7TfdiQF+v1n
 Ld0OqPF6ilAKaSOEqekTChnHOgfdQ/JI/SLnvlShv7AC0o2TPPNL10j8FRQJwLxycH6C
 gfXfJ4brzLakGcVlaP/ynVK7flAYVmcbLCw3B6837BkFMoS7WFkjjzMPTRgm3xgzcZae
 zED1/I7/H6wVuEUdL0cLO58a3a6nLTUMQJr6FVO4XexAFBw7aru6mqJbL2yHkjQK+bf/
 6SAA==
X-Gm-Message-State: AOAM531kpXQSpoJgRob5jrt50lkUDM7dlJWprkLk2rVT0dJFGy/nGnpM
 koeRSzNW8SAbYGMmx0yEIkk=
X-Received: by 2002:a17:906:7b54:: with SMTP id
 n20mr889013ejo.144.1594663197488; 
 Mon, 13 Jul 2020 10:59:57 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id d23sm3934458ejj.74.2020.07.13.10.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 10:59:56 -0700 (PDT)
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9f0855f1-1319-81b3-7758-ba53e5d733e9@amsat.org>
Date: Mon, 13 Jul 2020 19:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XWP+cqApIHv

On 7/13/20 4:57 PM, Cédric Le Goater wrote:
> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
>> This allows these NPCM7xx-based boards to boot from a flash image, e.g.
>> one built with OpenBMC. For example like this:
>>
>> IMAGE=${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
>> qemu-system-arm -machine quanta-gsj -nographic \
>> 	-bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
>> 	-drive file=${IMAGE},if=mtd,bus=0,unit=0,format=raw,snapshot=on
>>
>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> 
> May be we don't need to create the flash object if dinfo is NULL.

Well, this is not wrong since m25p80_realize() check for the 'drive'
property, but I'd rather avoid using fake block, and instead force
users wanting an empty flash to use '-drive driver=null-co,...'.

So I prefer Cédric suggestion too.

> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Tested-by: Cédric Le Goater <clg@kaod.org>
> 
> Nice ! 
> 
> We need a SPI controller model and a network device model now. 
> 
> npcm7xx_bootrom.bin is a bit of a pain. Could we include it in 
> the QEMU roms ? 

Ah, this is what I asked on patch #6 ;)
