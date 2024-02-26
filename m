Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2101707ejf;
        Mon, 26 Feb 2024 06:51:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVIfQ+BxOk/UB6X54jW7neycerIucKA9z5tpogaeQBHQf7NTUO8bHphH1Kxc1FUybe/YeWDJd4C+kX1CpwkQkz3kbV20sUp
X-Google-Smtp-Source: AGHT+IHQsUFRku70zH8OIT32KVy5gHC3hoIC+RlHfks7Mc6QCGZAKv0O7TxFHu8c+vig2VgB/4yi
X-Received: by 2002:a05:620a:5e13:b0:787:a8b3:b079 with SMTP id xz19-20020a05620a5e1300b00787a8b3b079mr7381920qkn.71.1708959098616;
        Mon, 26 Feb 2024 06:51:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708959098; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9dIRHtYyH9KjeW/aOFC1ool++Ujc+XyS/IVFez0MUZde5TID5urvw93VoDPW4gCaY
         Ij/4vlRu8yvt5stwwAa2w0HnCdHEBYlXB4Wn3y1Y/7b9B4pJXuvq1vQ0Bl/vTWShrKwo
         khNbsBhqXTo043dVhC53hvc2hgK0IoJHm9Yzbf+Etpp+g9D19BE+J8rIFFwGKlVQUvPr
         rBdAWdC+TAVjl9VLxES5yRJeWHBN+IbGN3nojPw+8iVeOhSsPqvhBLLKsfpFbrykD10H
         5813/1jljx8YM3AQlQ8cNJNt6mXu47weGSSaFYrtJYm6ykokY2ep9nFpJ2YO/eOi3teO
         D5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=9HbY+ZGBu+M3v4+3UVcCpMv8dI8VkHGSIwnlA9QSoQs=;
        fh=ETlmwqe9NVc+3bqSVhrtWydl6yR3Ptjjn/QvvFe1kZs=;
        b=YZD2XoT1jLMU/UYHnTfSZp45oajcGsxBjalaLm3CPmdHKP1l+OH0Ev8pydrDcJq/xw
         a1Y4WLLN2PvOPAnKJK9PQ0ARfJXQwfKEunnpGTGYuDEg5+4oyi4VPf3HfeyskEP5cuww
         qvnhF7NB6GW1oH3wIHe35/QiMFR8F6dxxzjWwVFTQZZtiKKWBdOcQrk+jcaJ/cdSTURb
         568jhjuSvGXg7xux70C1hSB94G0VpEdF9/CFvjR/UpECXrGSx5hTt4imUOxYdSfUpEHh
         WsrdtC/ksrl0xRlFGIfvTHTsAOU/L7otUo0bunkyIMtgH649vRF/brzSeM5ztTDTgXjF
         tKbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j27-20020a05620a001b00b00787baf23733si5129627qki.261.2024.02.26.06.51.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 06:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rebOM-0004Ch-Dx; Mon, 26 Feb 2024 08:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1rebOK-0004Bh-Mv; Mon, 26 Feb 2024 08:51:36 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1rebOI-000702-UM; Mon, 26 Feb 2024 08:51:36 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8EDC14E601F;
 Mon, 26 Feb 2024 14:51:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id AHlv1dYjZ3Dj; Mon, 26 Feb 2024 14:51:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 98B4E4E601E; Mon, 26 Feb 2024 14:51:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9735B7456B4;
 Mon, 26 Feb 2024 14:51:28 +0100 (CET)
Date: Mon, 26 Feb 2024 14:51:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 John Snow <jsnow@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 3/3] hw/ide: Include 'ide_internal.h' from current path
In-Reply-To: <5dfafae8-c429-4d2d-9ec4-240b8d4290ca@linaro.org>
Message-ID: <4b9a55da-96b1-be86-c9d3-49db4930cc7b@eik.bme.hu>
References: <20240225171637.4709-1-philmd@linaro.org>
 <20240225171637.4709-4-philmd@linaro.org>
 <feffd329-59e0-0291-0dd6-76a625da190b@eik.bme.hu>
 <878r37lll6.fsf@pond.sub.org>
 <fd0fba89-cd93-4113-9f3d-2ee20f2217d9@linaro.org>
 <90219760-aad5-82b2-41aa-be563f52fdf9@eik.bme.hu>
 <5dfafae8-c429-4d2d-9ec4-240b8d4290ca@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1863778230-1708955488=:37179"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vDmXh0087TSB

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1863778230-1708955488=:37179
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 26 Feb 2024, Philippe Mathieu-Daudé wrote:
> On 26/2/24 11:50, BALATON Zoltan wrote:
>> On Mon, 26 Feb 2024, Philippe Mathieu-Daudé wrote:
>>> On 26/2/24 08:40, Markus Armbruster wrote:
>>>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>>>> 
>>>>> On Sun, 25 Feb 2024, Philippe Mathieu-Daudé wrote:
>>>>>> Rename "internal.h" as "ide_internal.h", and include
>>>>> 
>>>>> Is there a convention about using underscore or dash in file names? The 
>>>>> headers Thomas added are using - as well as ahci-allwinner.c, only 
>>>>> ahci_internal.h has _ (but there are others elsewhere such as 
>>>>> pci_device.h). Maybe we should be consistent at least within IDE and 
>>>>> this series is now a good opportunity for renaming these headers to 
>>>>> match. But it's just a small nit, thanks for picking this up.
>>>> 
>>>> This is one of the many unnecessary inconsistencies we're inflicting on
>>>> ourselves.
>>>> 
>>>> We have more than 3600 file names containing '-', and more almost 2700
>>>> containing '_'.  Bizarrely, 68 of them contain both.
>>>> 
>>>> I strongly prefer '_' myself.
>>>> 
>>>> Zoltan is making a local consistency argument for '-'.
>>>> 
>>>> Let's use '-' here.
>>> 
>>> Fine, patch updated.
>> 
>> And then please also rename ahci_internal.h to use '-' to be really 
>> consistent.
>
> I'm sorry but I don't have time. Maybe fill a ByteSized task?

No problem, just noted in case you'd respin it for some other reason. 
Otherwise somebody can send a patch later.

Regards,
BALATON Zoltan
--3866299591-1863778230-1708955488=:37179--
