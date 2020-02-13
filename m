Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp409705lfp;
        Thu, 13 Feb 2020 01:51:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4JfmiJceKNjpvjvliGN1z4K4G7OdAljNSrvl5dCSmbSy8BPaeLBdzldqZUZ0BHLKdW0kt
X-Received: by 2002:ae9:e10e:: with SMTP id g14mr15278161qkm.430.1581587502842;
        Thu, 13 Feb 2020 01:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581587502; cv=none;
        d=google.com; s=arc-20160816;
        b=gdbMKF7pU6e3+eoPm/MfiMxmSx5ennylzDfUhUK0Dx5lhshTNtsgGK4EQAFpZLlwrL
         okYl5l2dTJ02pIJfuLjBJ5Ulo69saSKZvbsATt9O2OdqPMyo7uNv8YuJMFtfJwvA6KSM
         QdkKfK++WC7IUGf0Gfq3gSwVLL9cN2/ksMvVJV7sgSkjxSLMkihcZz+Xuw8E4L68ezdA
         eC+evPJtT3cvBoy6VEl1CYFsnnB9g0J4pLSeF//zeZNjytzmskiD8zLx/Vdf56CjOZGw
         /FoA3k2CEOcWm0mM4hxKzYa8gl7bZrcU1gz/5FF556pVdcH/Wve5mlm2voD/aS9MDqtN
         uxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TP0m2c13yyONsZNdLdHsAJAuP1rHHUZwpMtw2OLT8bE=;
        b=t7mggFfP2QdHqFIDBn9kRGCZ1Upszbym6x82zCpwjASHfeYdvNINTrOrr3gTANlTBK
         AbEkMZTfcVRElzcSkznIJA0H3hZWa/+7Iww0IRezbvt9TKc6yL4oXtT5aIClI6Ob5CdU
         2XTxhOSDzCsPvi6ORFnny/0cbMohRrD+LDFphe0KlbdE3X20Tfm15tpj2UZdTfJqLD9H
         TWd10yX/VEX2SAdm6XxCTh7xNq4cFqBMjniJRqq7DW82ar0mLnH260qztsOPGFi7DCVy
         UJoCL8dNAOLoj86dGJ1PO2aF8XJMjHIcTjv5lsKH+y70jrPZEz/feTTyUrYc1pCFlkBM
         CAOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lx7l+IjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si873343qto.189.2020.02.13.01.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 01:51:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lx7l+IjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2B9m-0007YS-11
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 04:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j2B9Z-0007Tl-UA
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 04:51:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j2B9S-0001iZ-VP
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 04:51:24 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46183)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j2B9S-0001hj-SD
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 04:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581587478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TP0m2c13yyONsZNdLdHsAJAuP1rHHUZwpMtw2OLT8bE=;
 b=Lx7l+IjUJJYBrvzb8CAlitZVxxCwxiXd2Fv/OprhCspAL9GRm0x2d15JI26vdfeo9nER3R
 uLeE7Lro1BwDbL9pp5OoL42nM/hBL1x3835F/R9wv7teYXKrWeSytq69EcYTmYO5hlfF2f
 BSKDpCVny8pJFGX8E7SAZ6bYklLKR0M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-Gjnf5RzGNuyuOnNpiy807w-1; Thu, 13 Feb 2020 04:51:16 -0500
Received: by mail-wr1-f72.google.com with SMTP id w17so2114931wrr.9
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 01:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cmm16DNMsP8pVSAp45gWrcl4ndwwoJBsG0NSvPreCwU=;
 b=hfS6c+ckp2scx/ua6mtrbdB+0zMt6h+NaEE8EeVSDUHoHSjHaEyeZGD5LHYroD1m97
 ufJVbY6szpMFuja5tirhGUoXDfycTqJDyEKTqh4SpIQBRcSlNqmLH9Txj9u92b0c/J8r
 ZGBTnVXZv+8uJMFY9vqQddFfwVft3K2NiDxrOMCMUrkZY9jI2NgCgV+i66fi7HQaSUQ1
 ehfHY6eM6Pzv2tgvpEwAaLEbJWB7dBhgMX9XI+P+Del72LuL8d1sGpjPY7ppCUZ7V+da
 YKiIngQTtz5Kk0OkI7I7fa11vEAJ4bL93Bof7vVDqTPU5BIhHC/eY5KZ2y81jRvLaln6
 2Vhw==
X-Gm-Message-State: APjAAAWta78iUqqYClVLpndmM3EM4UGJnr8bsvUgQbuk1tLUotvF7tth
 APCa0sZ/i6tvghFIcP50cOd0N0j9QiMtAS/P1cbbSlUOa62tebwshjgku9Hydu4BfPFCSzbGbg+
 8EO3eiHeSkzBH
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr5089022wme.133.1581587474863; 
 Thu, 13 Feb 2020 01:51:14 -0800 (PST)
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr5088979wme.133.1581587474547; 
 Thu, 13 Feb 2020 01:51:14 -0800 (PST)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id e16sm2208668wrs.73.2020.02.13.01.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 01:51:13 -0800 (PST)
Subject: Re: Question about (and problem with) pflash data access
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
References: <20200212184648.GA584@roeck-us.net>
 <504e7722-0b60-ec02-774d-26a7320e5309@redhat.com>
 <20200212230918.GA27242@roeck-us.net>
 <560224fe-f0a3-c64a-6689-e824225cfbb9@redhat.com>
 <279d959f-f7e5-65e1-9c68-459f3fed56d3@ozlabs.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <52f0b829-151a-3dd0-0ec7-c3155185510c@redhat.com>
Date: Thu, 13 Feb 2020 10:51:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <279d959f-f7e5-65e1-9c68-459f3fed56d3@ozlabs.ru>
Content-Language: en-US
X-MC-Unique: Gjnf5RzGNuyuOnNpiy807w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dWaEIQ5cOh/i

On 13/02/20 08:40, Alexey Kardashevskiy wrote:
>>>
>>> memory-region: system
>>> =C2=A0=C2=A0 0000000000000000-ffffffffffffffff (prio 0, i/o): system
>>> =C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-0000000001ffffff (prio 0, rom=
d): omap_sx1.flash0-1
>>> =C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-0000000001ffffff (prio 0, rom=
): omap_sx1.flash0-0
>> Eh two memory regions with same size and same priority... Is this legal?
>=20
> I'd say yes if used with memory_region_set_enabled() to make sure only
> one is enabled. Having both enabled is weird and we should print a
> warning.

Yeah, it's undefined which one becomes visible.

Paolo

