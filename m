Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4834145wrm;
        Mon, 21 Oct 2019 10:01:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlilMW/QNMsFh6EITgeZXwZSeu3Jic6972GfWi15D28A07YkMU1dVSFidThUNKrieImlRX
X-Received: by 2002:ac8:711a:: with SMTP id z26mr25766576qto.283.1571677294838;
        Mon, 21 Oct 2019 10:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571677294; cv=none;
        d=google.com; s=arc-20160816;
        b=JwE3BPanLlcwKlsLPN5LJLsuFSYSRPgiV88gyFL4HAQW8ZyMdCiETH6XHf0iFyawCy
         Sef/iRtba0rvXHIIq8VhN6gTdZQ4jBRN4R07W1YDDRMtVEC1xDnVGT0wtABnAX1EJQZk
         ad2i7gxY3mrh4IFu1yWoD4sg7iAHJJz9jJeNupNY2Uz8bUiHVJS6C4ux08a2ZMhZYLXH
         NBUWiytHJado1OriBdz32DEExzPlzjuDFkPIwxyqZRD0mWdAfOaKehQ7BxBOXZJ0QLft
         L8b7GbgjmXpdT/rOHvdrRbSaWLM8Fcci2m1drVl+7IuApVCmu9ONA8Yii8ssuAwPywYL
         D/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=JCj3ZZhHQtaDCVKyDFMSP4u1l7rUcwXSP2jGz/Ofg8I=;
        b=xcGaKAcbIaovfsrn/eWnPIizg4ey4DamXDAxX8iy8NPGr85M1Q2eKHIo1d2YfgmZrS
         ejzqcH4eJqhXjAD0GDHzHlMDLGP50PrkuRpeX6YREXtf5ix64cPNdfMyME1GDuzvsmS6
         C8uvmpD/CKDmX0sUNvXitva+ZpygzyJD8gB08MOA8KbQsJ0WQa66JdAaivOZ8KIZZGqk
         fEOPRWgtohXnCfLG90l/3BfnXorQSgijECJeDHIEjioLlO50l98lmDMi4doxPsw9Pbvg
         DT7TDNj+MAx8IDMvbQiJSFDPEygoA+NetiZq2PEpHU+z+pJC8vTTf3m+TFKoaHXqZbmb
         ixUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LFyeRF+1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r24si12965693qtn.298.2019.10.21.10.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LFyeRF+1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMb3m-0006vs-8J
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41535)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb2H-0005nO-9l
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:00:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMb2G-0002EV-4e
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:00:01 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMb2F-0002E8-TJ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:00:00 -0400
Received: by mail-pl1-x642.google.com with SMTP id y24so2962982plr.12
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JCj3ZZhHQtaDCVKyDFMSP4u1l7rUcwXSP2jGz/Ofg8I=;
 b=LFyeRF+1M1/VowDYC32+OIKk3I9DserWoamc8LK/r2P3DN+ESQ5Eb++omrRcugVxj0
 oIaj20RmYHGIa4fjpvl/ii4fPzhQh/d38AraS6C5e97paMXBlhceGN9BJmAUrqsWj9Fc
 O1e6ssc5N5ftA2KpWr0zO881NlpEujeYUmhbPHChX4D4n7KVBpqJxz235ot2sEMJezur
 q2rZgIvC4BiydK7GMIaLpWhIeQm95rrgEf7GRcjwhPqgOzlA4QzF1dgw0v6Gm7d2yPnl
 d5FdFrLqpaFmf4Ia+LEsB/EPwHpjmjMqspOMojX8B/SZKJdMOLDUJgHVgbel86Yifgnj
 Xkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JCj3ZZhHQtaDCVKyDFMSP4u1l7rUcwXSP2jGz/Ofg8I=;
 b=EVk00ygN0Y4b4gevSohRuLtJfWq+R3OzGFSuVWUdczM+01eSTFl8lAB9nVHSVoJ1Ex
 8Qbydx5WgXPA0VnKhkOWidMQC3oWICEkYf0w0Qc3jH+APwKz5fRIiBhU/AxI7R7CKt9q
 bvJiOB9xkV/vmrrFgzs1ffbxemB8dTRq3yDVgZWIrvFpmqVrqP6k2zNY4NhY0PiASVMQ
 pkbfnjU7XGSasKGB2o+yeLDV3Hv1QGVx4HGeV+0TjReDoPaRSaElpkVEmRXujEQlLERq
 Mz1xQbghWXo1Bqqc6/v2FCg5b8IPhqK4u50HJjMZp33JCcqQtjwNpS4fOExrLogifHyo
 /sRQ==
X-Gm-Message-State: APjAAAVK1rjJFpJTm581Zo94CIJllzU8fAdytbcs3Fav3wunlzsnGsWz
 X2VjsmX5lBBbvotnetvh3UZk9Q==
X-Received: by 2002:a17:902:fe0d:: with SMTP id
 g13mr7576872plj.253.1571677198569; 
 Mon, 21 Oct 2019 09:59:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f62sm16926558pfg.74.2019.10.21.09.59.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:59:57 -0700 (PDT)
Subject: Re: [PATCH 04/21] hw/arm/omap2: Create the RAM in the board
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee89a853-46c7-e306-1e49-cd75136428c8@linaro.org>
Date: Mon, 21 Oct 2019 09:59:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pcv3ZJCa2XB/

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
>  static void n8x0_init(MachineState *machine,
>                        struct arm_boot_info *binfo, int model)
>  {
> -    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *sdram = g_new(MemoryRegion, 1);
>      struct n800_s *s = (struct n800_s *) g_malloc0(sizeof(*s));
> -    int sdram_size = binfo->ram_size;
> +    uint64_t sdram_size = binfo->ram_size;
>  
> -    s->mpu = omap2420_mpu_init(sysmem, sdram_size, machine->cpu_type);
> +    memory_region_allocate_system_memory(sdram, NULL, "omap2.dram",
> +                                         sdram_size);
> +    memory_region_add_subregion(get_system_memory(), OMAP2_Q2_BASE, sdram);
> +
> +    s->mpu = omap2420_mpu_init(sdram, machine->cpu_type);

Any reason not to put the MemoryRegion in to the n800_s structure?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


