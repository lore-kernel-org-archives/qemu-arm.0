Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3052255ejn;
        Tue, 18 Oct 2022 04:15:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZHGoNAEuFZOGJMfKfG7H2IsOkBcOpE8FEk5FQzVum6oFawt5jpXLTi4KwC9zlSzbwP5gB
X-Received: by 2002:a05:620a:44c2:b0:6ee:7a72:50b3 with SMTP id y2-20020a05620a44c200b006ee7a7250b3mr1398453qkp.124.1666091735862;
        Tue, 18 Oct 2022 04:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666091735; cv=none;
        d=google.com; s=arc-20160816;
        b=zbM/HlK19l8387ojodax9ZKKx3Zsy6yATeRtvTwbVHVJBLpNfQfP5eZb5KdX80ALbV
         rMqFZ2Mve0h01VIOaizLRO6BVznCFqvcpZrBhjFxUONZuHJOYZosgQIebVRGZTfhZiWK
         jEK0zUGvzwUVBujZ20RqnqtDStlUrrPTIS3Zh7/nExz5wk9kQp+GvceVGBoPXg4GBwEE
         qznq+tIrs3nxKkohSJhRi71vMZ9BQe0YtifoVavXCNGxyhaTQAoq0yRBn2wMlhUeVs9O
         u0FT4B8pY7sMTHITTlpf/aDIxNFjTB5cgc/EN8cXvF8N3WxAZJ9UAfbsD2d7TPzpxz89
         NGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=r1frmFAhYrY1w0HLz0A0b5UFzwpUP8oXEkMOPXzFPiE=;
        b=zcGBzD43ZDGyMBYvEhnEsKBcaUxLK6v6xbgB+eG1+9YG+rnG9no8Sa69F5PhriE+GJ
         +ciHZcGlRja2xhKSZGotytd8mCkVlEmA/1f8kX6PI48tuKiCOFZhEmOajo6W19QTvJYI
         F1OvsE1wrh0zIVi9XaueM4n18hQm8KrjnuudnOykTy+Yuku90bzbaVPK3GcJ76WbgABY
         Q6d3ha5o4azmk4MS7MciJzrShdxm/U6of2RjjzFzSLII4/aaor2q5yxyv1wjnRzdU51x
         o9Ot3FUHw1s7RdwmTWzAc7l5iOiS+D04x5pYUcmLoKnyRqCWaL8ciT+kCENb7mN5B8df
         PC/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23-20020a05620a0a5700b006cfc1e935b9si6531062qka.185.2022.10.18.04.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 04:15:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okkZL-0007Zz-Ag
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 07:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1okkXn-0007Yz-29; Tue, 18 Oct 2022 07:13:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:16648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1okkXj-0004fD-Iw; Tue, 18 Oct 2022 07:13:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E9A7D74633E;
 Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AA309746324; Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A793B746335;
 Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
Date: Tue, 18 Oct 2022 13:13:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bin Meng <bmeng.cn@gmail.com>
cc: Bernhard Beschow <shentey@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
In-Reply-To: <CAEUhbmWb_H_hTToGzb1ioZtZJxNgwPsjTaiUfBBnNF+1g+5PBg@mail.gmail.com>
Message-ID: <15bd851-fe9b-6a91-fadf-7f67ad484c78@eik.bme.hu>
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
 <2d634687-bdf7-a59b-76e1-60de81142a4a@eik.bme.hu>
 <2C1D5CD8-9EBA-47A4-8AE9-6464BAB6CC68@gmail.com>
 <CAEUhbmWb_H_hTToGzb1ioZtZJxNgwPsjTaiUfBBnNF+1g+5PBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1652907209-1666091627=:39324"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lIs3PPve3KyA

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1652907209-1666091627=:39324
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 18 Oct 2022, Bin Meng wrote:
> On Tue, Oct 18, 2022 at 3:46 PM Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> Am 16. Oktober 2022 14:15:09 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>> On Sun, 16 Oct 2022, Bernhard Beschow wrote:
>>>> Allows e500 boards to have their root file system reside on flash using
>>>> only builtin devices located in the eLBC memory region.
>>>>
>>>> Note that the flash memory area is only created when a -pflash argument is
>>>> given, and that the size is determined by the given file. The idea is to
>>>> put users into control.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>> docs/system/ppc/ppce500.rst | 16 ++++++++++
>>>> hw/ppc/Kconfig              |  1 +
>>>> hw/ppc/e500.c               | 62 +++++++++++++++++++++++++++++++++++++
>>>> 3 files changed, 79 insertions(+)
>>>>
>>>> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
>>>> index ba6bcb7314..99d2c680d6 100644
>>>> --- a/docs/system/ppc/ppce500.rst
>>>> +++ b/docs/system/ppc/ppce500.rst
>>>> @@ -165,3 +165,19 @@ if “-device eTSEC” is given to QEMU:
>>>> .. code-block:: bash
>>>>
>>>>   -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
>>>> +
>>>> +Root file system on flash drive
>>>> +-------------------------------
>>>> +
>>>> +Rather than using a root file system on ram disk, it is possible to have it on
>>>> +CFI flash. Given an ext2 image whose size must be a power of two, it can be used
>>>> +as follows:
>>>> +
>>>> +.. code-block:: bash
>>>> +
>>>> +  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
>>>
>>> We have qemu-system-ppc and qemu-system-ppc64 not qemu-system-ppc32 so maybe qemu-system-ppc[64] even though that looks odd so maybe just qemu-system-ppc and then people should know that ppc64 includes ppc config as well.
>>
>> True. This naming is used elsewhere in this document, so we kept it consistent. I think that users will get it either way.
>>
>> @Bin: Any thoughts?
>>
>
> How about a separate patch to remove the {64 | 32} suffix, and just
> use qemu-system-ppc64 consistently since the *ppc64 executable can run
> 32-bit ppc codes too?

In case it's already there then yes it's unrelated to this series so just 
disregard my comment or add a separate patch to fix it if you can. I did 
not check the rest of the doc just noticed this in this patch.

Regards,
BALATON Zoltan
--3866299591-1652907209-1666091627=:39324--
