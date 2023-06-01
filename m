Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp369832ejb;
        Thu, 1 Jun 2023 04:45:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XWRuhviv4e+XcqRavu6w2x47p2t9S8gjeouhjTA3orPFOpphZFj9g4IyZ0zhoMsGiCTgZ
X-Received: by 2002:a05:620a:cc3:b0:75b:23a1:442 with SMTP id b3-20020a05620a0cc300b0075b23a10442mr7763353qkj.8.1685619919797;
        Thu, 01 Jun 2023 04:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685619919; cv=none;
        d=google.com; s=arc-20160816;
        b=i3aCrXzh9KTHi75X0h3WVUiOAtfi8R+wJ+i7Rji1X/mGMyLYvqKdI3Juu0cM0lnw4A
         b1CO54NyShZfMob1K4v3CI6qkXouMNlRBk9E+vissEpfBvICEBWIrQyl/qnApgtuXBde
         QcieGOI2ThkNO3w6F/xKxG3EY6lEkgHVQmDfIEcYUMMVx7wWXyOiqDDsMBmhGpUE9uoJ
         YUCxpIzyRyeqg1uxNKkaDmfKMOu0f+BuPFAfmzVc0T/aLE+pQX31YH/pWL5D/4WPhwE7
         MSPLY/G/FhnjyDSwzw5XaE20z1T1v0wRabWRqiZRsnWsTqALP/4GoMK62RPrAd51EaJt
         pmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=XxTgZtev+GfJl7H6W7VhwGN30lrR7QMJprT1vBAnGgk=;
        b=eV1FPKedxFu2S9bKA1zmYaFrIRDr6rJWXSAYNvyCZSk5Gs4r+Jm7l5Dx7NvM+nvyJc
         FmddSr2LbfW5q7d9WMMQY83TBYAwQ3tJ5VBBL0znCskboiTwKh6gA7+e77+sFOzXIOwA
         yTbA8B/sLKoSaFx5yMKa5gYlwiZ6kVdA9d/YHWqMcuXxX/iDUqeWQLuva0tISYPkhBEi
         +5XV7Eb1ku86GRzuy6v6fgPKWZ73LwAhnXgE2/dbDhsD4OGfCGOAIDfji5bxD+C+Y6VT
         dosXdBxW+5Otf8e44RWWiMPTlJZ3EBRvGpHnfXdqwIs4cnkmsO8A428leze80LQaOxOM
         U0bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=lOPtH9t9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a37c205000000b0075cf2aff7f7si4841907qkm.759.2023.06.01.04.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 04:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=lOPtH9t9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4gjp-00088P-Td; Thu, 01 Jun 2023 07:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q4gjh-00086F-9h; Thu, 01 Jun 2023 07:44:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q4gjf-00071C-Cy; Thu, 01 Jun 2023 07:44:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5148f299105so1744075a12.1; 
 Thu, 01 Jun 2023 04:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685619892; x=1688211892;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XxTgZtev+GfJl7H6W7VhwGN30lrR7QMJprT1vBAnGgk=;
 b=lOPtH9t9JgWSU2PNf3IeQlXUkUKiYpnjsBG6b8BjB/OYQOnQ52GgxR/okG4hHR1R5f
 j+WY7rgqxNNXR3GnmMT5qJ7JDVPiqHmyrDoqxwXbILLcSa3PsWOWJU0c8IvasH+9S/xP
 yS+So5h/P0UgZ+pChIF4Ls3nqdUR6NIzfuwppfVI7exSn1LNgnqGAbKndc6FDUW3s+tp
 Blk7Xv1jL32Hqph8m0XwdWiKdos52DagC+1U/ofNp+LcwNBdzLJVA9cdwnbySL3OqYlY
 YQ2D76wLASRq5k7MPnw//DRSA1yv5zk9DEHdmdiasfEm1HbC+hD8imZgUUefrjDD5mP8
 ZUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685619892; x=1688211892;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XxTgZtev+GfJl7H6W7VhwGN30lrR7QMJprT1vBAnGgk=;
 b=VOtCmj+h/N1celEsE6sbBKo1+dLKTGKhwrQAhP5XAWOplgHfE7Vc9FYuQriGh8h1go
 hgLMn+19HmErhBzkMhTLpyYNi2jB97U1e0xElQGRt0Cyvd8UvcrCCJJhUJOLcpulGAgW
 tlRvsMKpyP70F9z1uOyXpPlehwFDjvR2Za/Nf+UFVTiWqzV2WvQYdA3mSqcmYbGC8CxI
 0t0kujThOoJa/UmEmZyRwNVRfkqaXbyYVKD4JrOGTBoZo8yff2+dxNvZimNogGQz0uBQ
 TgvoS8xcP+eEZn5vUqaRIR8WJL5aPR6K+iLiXpuRNeHUvnpFtYZWZQV9K/Jb5EZq4YsM
 UvVg==
X-Gm-Message-State: AC+VfDwzyf6cY0r+cQSW962gp4sw/G3NsriQknVYeVE8y8vV5/xjPLPT
 rOQf1vQjeDUIKrX/EbEgMSU=
X-Received: by 2002:aa7:d047:0:b0:514:a016:9cd1 with SMTP id
 n7-20020aa7d047000000b00514a0169cd1mr1518133edo.8.1685619892129; 
 Thu, 01 Jun 2023 04:44:52 -0700 (PDT)
Received: from [127.0.0.1] (business-90-187-110-129.pool2.vodafone-ip.de.
 [90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 ca28-20020aa7cd7c000000b0050bc6d0e880sm7014762edb.61.2023.06.01.04.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 04:44:51 -0700 (PDT)
Date: Thu, 01 Jun 2023 11:44:46 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/3] Trivial cleanups
In-Reply-To: <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
References: <20230523195608.125820-1-shentey@gmail.com>
 <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
Message-ID: <25280221-A771-4D77-9B9F-2C3FE45CE38C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
X-TUID: GTo+L3uU0e9J



Am 25=2E Mai 2023 16:03:15 UTC schrieb Mark Cave-Ayland <mark=2Ecave-aylan=
d@ilande=2Eco=2Euk>:
>On 23/05/2023 20:56, Bernhard Beschow wrote:
>
>> This series:
>> * Removes dead code from omap_uart and i82378
>> * Resolves redundant code in the i8254 timer devices
>>=20
>> v3:
>> * Drop TYPE_ISA_PARALLEL since they became obsolete by
>>    https://lore=2Ekernel=2Eorg/qemu-devel/20230522115014=2E1110840-9-th=
uth@redhat=2Ecom/
>
>Oh I didn't see that this had already been merged :/
>
>It's not a reason to block this series, but I'd still like to see your ch=
anges to ParallelState and ISAParallelState merged separately since they ar=
e a better match for our QOM coding standards=2E
>
>> v2:
>> * Export ParallelState and ISAParallelState (Mark)
>>=20
>> Testing done:
>> * `make check`
>>=20
>> Bernhard Beschow (3):
>>    hw/timer/i8254_common: Share "iobase" property via base class
>>    hw/arm/omap: Remove unused omap_uart_attach()
>>    hw/isa/i82378: Remove unused "io" attribute
>>=20
>>   include/hw/arm/omap=2Eh   | 1 -
>>   hw/char/omap_uart=2Ec     | 9 ---------
>>   hw/i386/kvm/i8254=2Ec     | 1 -
>>   hw/isa/i82378=2Ec         | 1 -
>>   hw/timer/i8254=2Ec        | 6 ------
>>   hw/timer/i8254_common=2Ec | 6 ++++++
>>   6 files changed, 6 insertions(+), 18 deletions(-)
>
>Do we know who is going to pick up these series? I can send a PR if no-on=
e minds?

I guess the silence means that no one minds ;)

Perhaps we could queue these changes together with my VIA/PCI IDE cleanup =
series once it is fully reviewed?

Best regards,
Bernhard
>
>
>ATB,
>
>Mark=2E
