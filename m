Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3405037njk;
        Tue, 28 Jan 2025 14:04:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzht+UXqvqQyYD9zGU5kIXHShS66sBTMCOkQ6zx2lBv06dNip3g9URz+jn97ke9FYACDb9mNiL+LylfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH+M6aOrjy5F0QaXV0emVsl1pnC7Y0Y+gvXtvb9X8GlKQwQsBIOvjzlpmNhHBxj9rje8tXx
X-Received: by 2002:a05:6102:571b:b0:4b1:340a:ce63 with SMTP id ada2fe7eead31-4b9a4fa355dmr712766137.11.1738101896352;
        Tue, 28 Jan 2025 14:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738101896; cv=none;
        d=google.com; s=arc-20240605;
        b=lVufGkFXpbOU5ZpV5oy9f2CJIaK3xWdvDpkGZWql/vrM8A9HMLsvoFqgFb22JM+Klr
         yv1oHkwZKo3SMGjvTaouNSLQswER2iLXfV35EYKhzIlqldCOcuFsx9T61dn5nOXdy0h0
         Zedk4iMdv0yglxDfVnR4Mif0FOUNF55+JcfJbGHZRQPoR/Hos1pzW/cTTgtF0wOgezj2
         shMHcV7d0rJFDZCokYVFECgjST5rIAjVstybiaImRQeUnolgnMUx/voMhtSkRXA3yzLL
         AwD03bizstf4SjvHEeZksguEkYBVM9pEl9i9HHf2ubDBfOSWe62qIPOrrwsMgRTHkQCA
         DRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=AuGyuN9SnUjh2crkIjE0gAGw4/S/C50O6CaHRBPgFmE=;
        fh=JMl3IXM1j18TXHuqg3OHoVe9fX8pe94CCQanqaXzBjk=;
        b=U3QdVrFzKdnN5ULYJlynACeFVVe1jFW0D/1zr5N117dYuf7gV7JtNDRBoYq7kVjg3V
         D7RVBX5tddzbjqeyrdV738f6S7EnQMB6sOvCMUOl1BG4NhEXcIFsHC0KHW/6hTDDj7ix
         9txRKEOgggUVI4Sv1tY/DvQ5gMbjt2mtGhd35gFf3e8zKHgfeWAXE9VAToyAru0ryug8
         8EQdIa4CO58OF7xjXu82rLvSPjuLG9YZGiKrRQTWlT9L43qvf3KXKEN4VyEEBLVcWNGJ
         GoPM8sxlMo6MTwePHMjrj3GBnegxw8OZHTbICehC5SzEQX5QkXKUNvF600Fx7upAk2bt
         t7+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5AJxnbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-864a9cd7541si3413556241.116.2025.01.28.14.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 14:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5AJxnbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcthD-0001yT-TA; Tue, 28 Jan 2025 17:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tctgv-0001r1-9G; Tue, 28 Jan 2025 17:04:17 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tctgr-0003xa-RP; Tue, 28 Jan 2025 17:04:16 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5dc10fe4e62so11647197a12.1; 
 Tue, 28 Jan 2025 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738101850; x=1738706650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AuGyuN9SnUjh2crkIjE0gAGw4/S/C50O6CaHRBPgFmE=;
 b=H5AJxnbAhSEAwm8O/OepxNwN9UCZ4RAVVS/ms+vyWqjPLcIDSI1syZU6aGZNcfOcCM
 xGmkF1okjyP7cawuQGeh7JnL5258pGUBKjXNerRdpzyioddKA7krPHZP+KoXBrbVCIr/
 mZDy32HjYGCzF0o6kXjuuw4PdefHURG0oBD/M4h5r/Ec7NzHgP2dl5jZGedZ4THYJKlT
 5mfcL10WJmoyIpvYx/ANuseWgF8U1ycmH//I/aIWtyvqElKVJohL3LAjIouLPh/4RwgW
 o7iWkNfuoz0h15vTXkbj9XHUkVIxJmdV4nqocFIG8lt3sff4IJONwF4pg4VkhuqHo+B2
 CMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738101850; x=1738706650;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AuGyuN9SnUjh2crkIjE0gAGw4/S/C50O6CaHRBPgFmE=;
 b=I5W6FGiyrO4ntnttalmRXpkAkPElhxFldddKYNj11UKP560Mmnv0az8pv4spYiUove
 X8RGfh2IDykk2uE6T+Mr5wm5DAL4K5XAnNFG6/xGuOjv2iQzW04CTfc0QoD925CW3R1R
 SUkq5VHOXNraIyjjmw4rXgHl2j8xfE58dCy3B2HYFNeghfSEZqjewGKqBVIeM5nlj+F7
 VJNWeudQzrXW0g4NNXsQvT383zwhR/YN5/yQYg086x4MpISbXrnN+zcE0/iUotjrb6qI
 2hShv3VhN5wdkfSbytK8fBAu9U1P0flpvVYsP6B9S8R/2Yv2XBP75t/u3+gZrsdJ0cuO
 CZiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzTCO+cTH7OrNZ0JLtd9JzcHOqOyjJ+XJNsdL79/BS3tVttvBumrRCqUXR0Z8QBje3wSMuXHQyYw==@nongnu.org
X-Gm-Message-State: AOJu0Yxews4Uu8R7NrNLM6n5na8NhygCxrVmA98qn3CwF3JN6a3+XUMX
 mJqS5ZjByOGth3y+bmcmkjmWgQnMBguezuHlzJl9GIVTsKSKvR9oys6+lQ==
X-Gm-Gg: ASbGncvUq8FA7DKtNzwaqJXhVTYzL02jAxav7BgrX/PgHNTAhjbqUP5cb3bLV0c9CLL
 tyN2AW63WBtgMyJgtKnnQxwIwxwFlSGPk3jL7oTDKBYElDwryDDZTmEtAXeWpP7l1mLrWPvzMu0
 ld+h7B9Cy+4Ut5V8aB9MiB8nfyWF1R7qkTu7ltyQnX+3L86lKwNjLHSVYE0jYkfTu+01FetRtvd
 ibQiH8QBYeaelz+2h0pQTzwUdAvJ1cj/4dhp740P5/o4XpeZwMmKlJq1hDaUpXiYtPy1JTVLu4K
 K7o978GZHQ9yxE0Oi5bl809liL/B/xFoQJ/3w70txu4Pmh/twyrjuXrSpwpRqWLQ
X-Received: by 2002:a05:6402:13ce:b0:5da:9d4:ad6 with SMTP id
 4fb4d7f45d1cf-5dc5effb09bmr549712a12.28.1738101850231; 
 Tue, 28 Jan 2025 14:04:10 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-042-254.89.12.pool.telefonica.de.
 [89.12.42.254]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc18628d00sm7899905a12.27.2025.01.28.14.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 14:04:09 -0800 (PST)
Date: Tue, 28 Jan 2025 22:04:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 09/21] hw/arm/fsl-imx8mp: Add PCIe support
In-Reply-To: <CAFEAcA9efWMDxaTCfa6t8MiCgFUEU+nsyurNOqVDxAa9=KS=-Q@mail.gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-10-shentey@gmail.com>
 <CAFEAcA9efWMDxaTCfa6t8MiCgFUEU+nsyurNOqVDxAa9=KS=-Q@mail.gmail.com>
Message-ID: <137C0579-19AB-4D92-82DC-6CBE2422AD6A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Phu2GVrnj583



Am 28=2E Januar 2025 14:33:14 UTC schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>> Linux checks for the PLLs in the PHY to be locked, so implement a model
>> emulating that=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>> diff --git a/docs/system/arm/imx8mp-evk=2Erst b/docs/system/arm/imx8mp-=
evk=2Erst
>> index 1514bc5864=2E=2E8d48580cb4 100644
>> --- a/docs/system/arm/imx8mp-evk=2Erst
>> +++ b/docs/system/arm/imx8mp-evk=2Erst
>> @@ -14,6 +14,7 @@ The ``imx8mp-evk`` machine implements the following d=
evices:
>>   * Generic Interrupt Controller (GICv3)
>>   * 4 UARTs
>>   * 3 USDHC Storage Controllers
>> + * 1 Designware PCI Express Controller
>>   * Secure Non-Volatile Storage (SNVS) including an RTC
>>   * Clock Tree
>>
>> @@ -62,3 +63,15 @@ Now that everything is prepared the newly built imag=
e can be run in the QEMU
>>        -dtb imx8mp-evk-patched=2Edtb \
>>        -append "root=3D/dev/mmcblk2p2" \
>>        -drive file=3Dsdcard=2Eimg,if=3Dsd,bus=3D2,format=3Draw,id=3Dmmc=
blk2
>> +
>> +Using PCI Devices
>> +-----------------
>> +
>> +The PCI Express controller spawns two PCI buses, of which only one can=
 be used=2E
>> +By default QEMU assigns the wrong bus, so the correct one has to be sp=
ecified
>> +manually by adding ``bus=3Ddw-pcie``=2E For example, when adding an In=
tel e1000
>> +network card, the command line looks like:
>> +
>> +=2E=2E code-block:: bash
>> +
>> +  $ qemu-system-aarch64 -M imximp-evk =2E=2E=2E -device virtio-net-pci=
,bus=3Ddw-pcie
>
>Why does this happen? Isn't there some way to make QEMU default to
>using the right bus? Otherwise there's likely to be a lot of
>user confusion because PCI "doesn't work"=2E=2E=2E

Yeah, this is really confusing and I forget about it myself=2E I'd appreci=
ate any hints here=2E

Best regards,
Bernhard

>
>thanks
>-- PMM
