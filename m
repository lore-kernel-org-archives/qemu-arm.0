Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2041277lfi;
        Wed, 4 Mar 2020 12:41:32 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsUP6ZiPlpmk9MjycxEvloCm88GBcjoU2e+PjhOvvlvEuP4aFIf8mp5cceQS3xR9T4++zMB
X-Received: by 2002:aed:3ecd:: with SMTP id o13mr4054992qtf.309.1583354492418;
        Wed, 04 Mar 2020 12:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583354492; cv=none;
        d=google.com; s=arc-20160816;
        b=IzvR90IxRAXXV+nA7f6vdXk83XhM6nddHltepTXnwZ/OYI3QwobBSGfkAz5M5jng5C
         DiHZKtEVLWHMTBQmFesgrXaFZMhl7CFhN3TQMwUFO1q1rqnEOrjk+7bLWPtaFQ/cxFJ5
         c/4B8K11qNITDJ2Syqvxy3sxq/8znolCssyTBzzHLAfBplVUz0Li8rYcKS3IhVqdtDyd
         9spNfz7szBwxQ4PSKQ7W9dquBCbvQQpLlzVg+hDUZFiPTcR+N0dxhowiTedclHSbCc9O
         FUn27enVDUJhpVpJyhvc8Az3HO4Qk5M5TS3AqI2fh/NfvyZ1slmzMG3Mr2o1YSu0Wasp
         XDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to;
        bh=Bv+slasXQP8gQvDk1Y2rlWHJUI83KsrVrjy8v/ozjjU=;
        b=Y72+2j0AAMJ55tAw7gwVEntVK3PY/ocPKhwYV0f7GnuplFEd+CY7RtypmATqV1MrO2
         0xxYTnkxoDW27fgocZR/Sd6gx1Tilx0fzWbIA51eUWSCK9nl+WZWbu73iUFphMG/HBv+
         RWqnTm27GT4XCNQ6J//CWyCgIniGg9CuQ9jZB3NuMkbepsY/+I/z8EOFt+96R+LrcGpm
         F5Uj1hduk8tRoqyA6cJ6CnLa2Vnt5st/1wK50G6c7px/VkAxcaCQBGmCAZdzfAfF7XBY
         /0cViCjhTa0zcxuWcgzFwPuAagrMbC1zJPEY6YhQ5IokqMQVSYs6SF7Q3jdTjPgiUZFx
         hGuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si1564803qkn.133.2020.03.04.12.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 12:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9apf-00015Y-TV
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 15:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1j9apM-00015D-Cd
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 15:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1j9apL-00023j-58
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 15:41:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60088
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1j9apK-0001zo-VN; Wed, 04 Mar 2020 15:41:11 -0500
Received: from host86-162-6-80.range86-162.btcentralplus.com ([86.162.6.80]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1j9apV-0003VG-9f; Wed, 04 Mar 2020 20:41:27 +0000
To: Pan Nengyuan <pannengyuan@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-6-pannengyuan@huawei.com>
 <CAFEAcA8yvrYrBONtW46iswbEvMF-WC-j7fHOOfcoEC_RV66BkQ@mail.gmail.com>
 <c2b9eab3-f589-ecb6-0115-f8e673d52998@ilande.co.uk>
 <fc807125-1281-707f-0080-cc9b1d3c863e@huawei.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <cac957ca-39b7-2453-9a1b-3bc844e0b13f@ilande.co.uk>
Date: Wed, 4 Mar 2020 20:40:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fc807125-1281-707f-0080-cc9b1d3c863e@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.162.6.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 5/6] hw/misc/mos6522: move timer_new from init() into
 realize() to avoid memleaks
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41c9:1:41f::167
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
Cc: Laurent Vivier <laurent@vivier.eu>, Euler Robot <euler.robot@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7lcadri0qUw

On 03/03/2020 01:36, Pan Nengyuan wrote:

> On 3/3/2020 3:17 AM, Mark Cave-Ayland wrote:
>> On 02/03/2020 13:21, Peter Maydell wrote:
>>
>>> On Thu, 27 Feb 2020 at 02:35, Pan Nengyuan <pannengyuan@huawei.com> wrote:
>>>>
>>>> There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.
>>>> Meanwhile, add calls to mos6522_realize() in mac_via_realize to make this move to be valid.
>>>>
>>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>>>> ---
>>>> Cc: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>> v2->v1:
>>>> - no changes in this patch.
>>>> v3->v2:
>>>> - remove null check in reset, and add calls to mos6522_realize() in mac_via_realize to make this move to be valid.
>>>
>>> Hi; this is really fixing two bugs in one patch:
>>>
>>>> ---
>>>>  hw/misc/mac_via.c | 5 +++++
>>>>  hw/misc/mos6522.c | 6 ++++++
>>>>  2 files changed, 11 insertions(+)
>>>>
>>>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>>>> index b7d0012794..1d72d4ef35 100644
>>>> --- a/hw/misc/mac_via.c
>>>> +++ b/hw/misc/mac_via.c
>>>> @@ -879,6 +879,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
>>>>      sysbus_init_child_obj(OBJECT(dev), "via2", &m->mos6522_via2,
>>>>                            sizeof(m->mos6522_via2), TYPE_MOS6522_Q800_VIA2);
>>>>
>>>> +    object_property_set_bool(OBJECT(&m->mos6522_via1), true, "realized",
>>>> +                             &error_abort);
>>>> +    object_property_set_bool(OBJECT(&m->mos6522_via2), true, "realized",
>>>> +                             &error_abort);
>>>> +
>>>>      /* Pass through mos6522 output IRQs */
>>>>      ms = MOS6522(&m->mos6522_via1);
>>>>      object_property_add_alias(OBJECT(dev), "irq[0]", OBJECT(ms),
>>>
>>> This is fixing a bug in mac_via where it failed to actually
>>> realize devices it was using. That's a dependency for the bug
>>> you're trying to fix, but it's a separate one and should be
>>> in its own patch.
>>
>> Sigh. Thanks for this - I actually discovered this a little while back and have some
>> local patches to do the same, but due to lack of time I never managed to tidy them up
>> for submission.
> 
> Hmm, maybe you can take this other changes(fix memleaks) into your local patches and send it together?
> Or If you have no time, I can help to do it about this device. :)

My patches are part of various q800 branches I have been playing with over the past
couple of months, and so are lagging quite far behind master. If you are able to
update them based upon Peter's comments them I'm happy to review them (and perhaps
could perhaps take them along with my cmd646 patchset if required).


ATB,

Mark.
