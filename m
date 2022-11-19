Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1166250ejx;
        Sat, 19 Nov 2022 09:41:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7UXJBj6ML4DSPh7rjYY5OKnN6d9doAH441eZFhYACFJCwNo/So2cEFMT9qigUrVau48zAk
X-Received: by 2002:ad4:53c5:0:b0:4bb:7171:a3ee with SMTP id k5-20020ad453c5000000b004bb7171a3eemr11753453qvv.88.1668879707872;
        Sat, 19 Nov 2022 09:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668879707; cv=none;
        d=google.com; s=arc-20160816;
        b=xeowmY0ELcjRImdDH8qB1J8HacaiXANJGpgwYDLD1606fm+8hAdKLvUhQ5LcDBM10w
         QQfWheeloqpdT+StuNEILrhgGZmUgoiOcaVl9nqekzx49P+/FkJiO2GdoqDqEeqBwL1u
         Ay78Svc37a/0Bnxlf30oYumIBXPQ2DXswricEFCCH6f3rKqGYUYHgTZhT7gnEfGvqdhv
         a+klYkkEopfw+RiOlaIiLKE6YLsTKA4E7T/HBQau5EaYmy9PzXmUYQz+VhoKsLyPOq8G
         bV5O494B41bPwzBtfjFDqLX2O7qyOAoQPDkbCg4lnFPgbmq/21eDN4m+Od8OF1pZ6+LG
         yqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q0hM4GaLXGLfq+glGJPeSO1LuxfM9JY4+QWpfk79Tew=;
        b=kH8ACE678VTHHNOAn2xnNwIvMV3HPZTHaueUj8+6Q0pENhHYv8FFAh5S3Ug5Tv6PeP
         I/wxzBgJQOqNvfl15maDnNMQv4mbTtGuCHwQnWRKv9NTeZmmyaZ8sZK8JuCecI8HHPBX
         Uwe0qPjdTrzaEWrbjF7/kExF6IKpEpF41UuPvOk+JzcN7pSBtBmyqW7QS3MgMtq0GGwO
         nVo00hJBvoalV3Q4FsNJuY8QWNLrPAJz/71PK7jSAIMtlJCKH8KvlZyDOKww0WzST8+f
         JsT7Cbq2kBn3BOBgQCrUu0AmCVj0iNmhHUO0HTo+EofE6Py45uLPSpIhCtNHCyB85Kdh
         piSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=Tw8Hu0v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a05620a401200b006e4eddebc86si4003848qko.703.2022.11.19.09.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Nov 2022 09:41:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=Tw8Hu0v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1owRqQ-0000BG-4z; Sat, 19 Nov 2022 12:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1owRqO-0000Ap-R4; Sat, 19 Nov 2022 12:41:32 -0500
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axelheider@gmx.de>)
 id 1owRqM-0007wt-VM; Sat, 19 Nov 2022 12:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668879687; bh=C8K9/vkFVctdtBSu2XoXRafqURPFkbueNFbYl1tUOvQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Tw8Hu0v4WMOMxilW8Ak7TwW+yuuk07fHrpdsfEha8JOvMcQLh5FNB3vmgzWupHI3Q
 p9CVF8bxWySK1tHhUq9NcZjAE3fEWzeQ4kho2UmnkSkByMyXPr8zoEDUgzFMjdz9p+
 4pXgAn8CNO8MWk/lQs07gqdGtspU5L5z9yYWbhG0htsll+GCQEDi+0qNmOrOg9+WaF
 4dTKQnVMNNjmuXoWlXZ6PBFL1UZylvRxJTlqR8GFbklwDR2XoQNhMOwVKAjsX2s3m7
 al/FphLoOp5cGPD2lmdpGiJTF3gswIGXoVTWqR3F5E17lRpkQLopJZIfavaPXNQTNn
 nONpMGp7Vfs6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([95.115.96.141]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHs0-1pCc9M3mfq-00th4y; Sat, 19
 Nov 2022 18:41:26 +0100
Message-ID: <93e91610-86fe-4700-f143-d6b599d37521@gmx.de>
Date: Sat, 19 Nov 2022 18:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu.git v2 5/9] hw/timer/imx_epit: do not persist CR.SWR
 bit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-5@git.sr.ht>
 <CAFEAcA8tVAqf8aF2Gf=0KJGXmytv7aw10o4+RyfQLB4qO7KVvg@mail.gmail.com>
Content-Language: de-DE
From: Axel Heider <axelheider@gmx.de>
In-Reply-To: <CAFEAcA8tVAqf8aF2Gf=0KJGXmytv7aw10o4+RyfQLB4qO7KVvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pwtknh/T6Ug1Sd8+ufwKZMKyN3ke74snq+0FTH+O4QL8T9dgSyW
 0KSZMWN9jgu9ZD19lMmo2kFukCFA4+IvuK2vJ3cZvYaetmkuHg6O9c32Z+qabv00aqTtGXg
 ZLKTr4Nz94AsrkPJuShFcJqcNV8znK/D2AZpA83OJ2GcgUtUdrt1jk7hewiwGDiW+c7WbGv
 vI81nR4R5EjetYkmo6cAg==
UI-OutboundReport: notjunk:1;M01:P0:8OpYL410iuA=;THiAjQpDrkPBMCZBqFC8Hr2DxHQ
 XfHdr9xnWMxZmu7NW1cRshckeNyB+01zb/ESyrivkFnOoxLTzD1zCkM7+SmudAt2o6ZtepP//
 Co94A/54CHCLKMWKkIsWpewgttfz6MKf833FBRqaFrES2gVyVKe1klkI7ThjbHQ8hsonsdGqu
 FqEM3wWvfKLWt/Z0djiBT0SjQ6Fu0asPjBA5hp7kEwC56cCurN2cgm0EMkR7QSJcWnXf2/DJR
 kAnw2yBxpBxpTbvtP4jZlQaJxqzXeHyCO3VQozwFUqT4PcVaqdrmzupUgUNdQicrLKo/0353z
 2xeNZxM67tlxFWt75ARD0DNEu8jcgh3x8KztQwrB6L/8ezN090m7gXkXLxCdKWY+1nxnWfRT9
 YyoP15ANo1LEK+nYvorVQlOhpBzNsp3LefnNtGnIM9nj1ZUtKGcMjeNswShGFyTviqL2MJoeK
 10OswUsFnQHDQNUS1AJzPn+7C8ni3TTGgt7vEdGkwdi4CvPGeqv5qOZEUqEZ2/3ihJe5eO7nv
 B4brHfz2gCIYgXFpl2B0IpG3CMfMaf1lG2hI4SPZju4d/K9attWPxQPU2PxtWcSbHOhxn9T9H
 rDqFh7BMeclo4+PNuLyFZofrZvz4jrRobo9FbZPlazugJcDD0ng6KUy40hm1X52/U/Yrc3Q49
 2tzBtOiOCoEHU3tYHSIY5VrTKa7Dm3Re2dJ+OPRvjN6Me/u0d6A+AToj940LSY7GJGJMxIXpd
 VqDdhTbUbG5lHuK8EP5S55x/oYsnPsS7FCTddUa3UKJfIZIHl4qnA8k5ei3etd0zGs82eksMz
 hRBqWxLLseuhK+GyCTXUg8PatwlZ3qV+E+oqAUZ5Hb+A+fK2xxJsanCoFL5IyXx/vvV9tjT16
 QWKNEd1igkSL2JYHmiA13BG0rhdiafa7wNxDDTykr25yUogCNfOJ+8cyeexTXjkQBSJEqkbl9
 Gr9xSA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=axelheider@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: IVR6zDhd6MlI


>>
>> From: Axel Heider <axel.heider@hensoldt.net>
>> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
>> ---
>>   hw/timer/imx_epit.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
>> index 5315d9633e..6af460946f 100644
>> --- a/hw/timer/imx_epit.c
>> +++ b/hw/timer/imx_epit.c
>> @@ -191,8 +191,9 @@ static void imx_epit_write(void *opaque, hwaddr off=
set, uint64_t value,
>>       case 0: /* CR */
>>
>>           oldcr =3D s->cr;
>> -        s->cr =3D value & 0x03ffffff;
>> -        if (s->cr & CR_SWR) {
>> +        /* SWR bit is never persisted, it clears itself once reset is =
done */
>> +        s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
>> +        if (value & CR_SWR) {
>>               /* handle the reset */
>>               imx_epit_reset(DEVICE(s));
>>               /*
>>
>
> There's a comment just below here that says "can we just 'break'
> in this case?". That's there because last time we had to touch
> this device we didn't have enough specific knowledge of the hardware
> or test cases so we made a refactor that left the code with the same
> probably-incorrect behaviour it had before the refactor. But, since
> you're working on this device anyway: can we simply add the "break"
> after imx_epit_reset() ?
>
> If we can just say "if CR_SWR is set then the device resets like
> a hardware reset", then this all simplifies out a lot and this
> patch isn't necessary at all. (imx_epit_reset() clears the CR_SWR bit.)
> I'm fairly sure we ought to be able to do that, and the missing 'break'
> was just a bug...


You are right, this patch is not needed. Actually, the refactoring in
the other patches in this series makes this quite obvious then anyway.
And you comment fully holds, eventually all the setup is skipped in
case of a reset.

I will drop this patch from the set. Thanks for the review.

Axel
