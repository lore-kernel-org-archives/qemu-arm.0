Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3706576wrp;
        Tue, 24 Sep 2019 03:02:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2hy1TWjSkoiK9aM84PwlIGwcloqEEWqufN3hDwdi6l7xyRJ5iIH+Qj2sWvBv8btFJM82I
X-Received: by 2002:ac8:2a75:: with SMTP id l50mr1920121qtl.137.1569319358257;
        Tue, 24 Sep 2019 03:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569319358; cv=none;
        d=google.com; s=arc-20160816;
        b=K6B7yvD/HwpSPaynIVoSUrHnOjf0sT8DPjNO1C+i3DTWeFlWY1XmIwNb6JITGc5uSW
         ZjWKhxkwf39A2hWn6UoU98JUYLdnMG8WEHM5UKmn8hU2rZg99DGl9+TbZvW2loh6HXW2
         +2DcEoWGvs4cb/jlf9mh+/mHC3i6muUKSihAzNBXx/S4bCb9kO2AIQbjxE6fwec2tjWA
         9AxoeLzZj6wd1R3YuL/HU/AcyqmOnWySMWrsdCcZ379r2vas9828yqaIBPVSqmh0U4+I
         6RiW0rGkMBYBJ4scfP3ZIvBOhik2xxajuUQVhzsrgNMiZf17Drkt1b+bzNjBPWnNehLI
         iB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=yq8QhZg5iRdVqYDqSOVBoi16ugnkoeuAfrfu/3VCu3U=;
        b=JJLDGypA3vpTLbE24ov06+qRYrwmMdKsnQLqDYC4714E5jQhR2S3VBxpnLMJgk9E6c
         sC7yAdmDYwxNbI4C9e4jN4GEYW/tjimlmLQO5Y8ct//gOhfuTlrfgBJMOCBLH9zalmGK
         gRkE46EtHuP6zUTMadzxD15CeMBrT25la3+cptLXurPXuawKoQJDwwSAqNp+dvJHKU9G
         hdLtPac5xRbbeIBWIabz5lWiFrZTVC3iZBc0yYGFalr+gUhiJ7GDkw2Vne11K8YT7WwA
         fzG8BQ/hf8BP4GWdMbf9aYnUG68f4wmtJBRIFmvkq2FogCW09BgjOFEkzXksiJhLevDS
         15kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si884107qvm.21.2019.09.24.03.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 03:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCheX-0001qs-NW
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 06:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iChe2-0001pQ-QM
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 06:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iChe0-0002wx-MJ
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 06:02:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48730)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iChe0-0002wS-8R
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 06:02:04 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 100C7C08EC02
 for <qemu-arm@nongnu.org>; Tue, 24 Sep 2019 10:02:03 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id o188so704445wmo.5
 for <qemu-arm@nongnu.org>; Tue, 24 Sep 2019 03:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yq8QhZg5iRdVqYDqSOVBoi16ugnkoeuAfrfu/3VCu3U=;
 b=QAsUBVH6iyF7RwBbjVTKRzspObmkJYNAOofbW1xu9kkniqUY9tm5B2sxPLBWSDmz4j
 erhWScc/6viKl8Pr/gcQSKH5IVcGYqqUwxs3EGFL84rcEVth8MNhcf5cS8GRv3GaoKI3
 gU3HT6/DbMYAOiJQWbtYx93ywxQtvXszq+HKaY4HfkQZQvkN/efd7b6BhSOyTNarA0y+
 KUdDiQDi8uYPuo6xPTKYio01h4PInOSZWAcRBliTvxmmBGrjas2EjaCSb2LY/vt2UTa5
 Nd34ndgjyeMdNxxfLpC3zGwnlqXGkg5LybMD2m6JwWHD+ZTYPUw/pGTeCXQksM8SJlXx
 Q7/A==
X-Gm-Message-State: APjAAAULVw3frpUq7qmuwoM1acQCAEwXZ1l1L47jicu2std2HrgZJZeM
 IB9AXA5bFHO2fO81Fitkrjs6dlwV4EBvGyrkxKdSExE8PL8a3Z9Q8rRK1jXkC9ta8XExw0uFQZX
 lQc2EbUB40fmA
X-Received: by 2002:a7b:c776:: with SMTP id x22mr1794894wmk.123.1569319321828; 
 Tue, 24 Sep 2019 03:02:01 -0700 (PDT)
X-Received: by 2002:a7b:c776:: with SMTP id x22mr1794884wmk.123.1569319321630; 
 Tue, 24 Sep 2019 03:02:01 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id x6sm1697084wmf.35.2019.09.24.03.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2019 03:02:00 -0700 (PDT)
Subject: Re: [PATCH 3/4] hw/arm: Move armv7m_nvic.c to hw/arm/ and always
 enable it for arm builds
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-4-thuth@redhat.com>
 <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
 <0389e9dc-7f78-5b27-4764-51f0bdef5bef@redhat.com>
 <CAFEAcA8XSQs=fw839O4+tTUqy-DpNh-jdHxQsfYQxm-nTbvH4Q@mail.gmail.com>
 <88bcb5b7-4f91-1cc2-39a1-bd919608737e@redhat.com>
 <CAFEAcA_QAtK3GmyZoR7swNKwdxkXWZCzdK0G6Sk6OU_tQ9FV2A@mail.gmail.com>
 <3a21d31e-fe74-9e0f-fe8d-f9c00a184fe3@redhat.com>
 <CAFEAcA-ThXGZKr8--YZGUPiw4MaMVqMxKODhVepXCgjxox6ZQg@mail.gmail.com>
 <11c77a5f-ab06-a743-dd45-311d1f15ec12@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7eae032a-f730-d57b-f460-41fd06f8bc40@redhat.com>
Date: Tue, 24 Sep 2019 12:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <11c77a5f-ab06-a743-dd45-311d1f15ec12@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xI3O/iii/Z5s

On 9/24/19 11:48 AM, Thomas Huth wrote:
> On 24/09/2019 11.42, Peter Maydell wrote:
>> On Tue, 24 Sep 2019 at 05:44, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 23/09/2019 20.50, Peter Maydell wrote:
>>>> On Mon, 23 Sep 2019 at 19:36, Thomas Huth <thuth@redhat.com> wrote:
>>>>> Just try to change "obj-$(CONFIG_ARM_V7M) += armv7m_nvic.o" into
>>>>> "obj-y += armv7m_nvic.o" in hw/int/Makefile.objs, and you'll see it break:
>>>>>
>>>>>   CC      alpha-softmmu/hw/intc/armv7m_nvic.o
>>>>> In file included from include/hw/intc/armv7m_nvic.h:13,
>>>>>                  from hw/intc/armv7m_nvic.c:19:
>>>>> target/arm/cpu.h:1416: error: "FPCR_DZE" redefined [-Werror]
>>>>>  #define FPCR_DZE    (1 << 9)    /* Divide by Zero exception trap enable */
>>>>
>>>> Sure, so don't define CONFIG_ARM_V7M in a default-config for
>>>> a non-Arm architecture. Then you get the behaviour you want:
>>>> the file is compiled only for the arm targets.
>>>
>>> Sigh, the point of this series is that it should also possible to
>>> compile *without* CONFIG_ARM_V7M in default-configs if you want (and
>>> yes, there are people out there who want to be able to compile a
>>> minimalistic QEMU). It's currently not possible to disable this switch.
>>> But ok, if you're not really interested in providing a possibility to
>>> make qemu-system-arm a little bit more flexible in this regard, never
>>> mind, I'll look into other issues instead.
>>
>> No, I'm happy that we should be able to compile without CONFIG_ARM_V7M
>> selected. I'm just confused about why you think this requires that
>> we move this file out of hw/intc.
>>
>> Case 1: arm target, CONFIG_ARM_V7M=y (presumably in a Kconfig world
>> this is set by default if the user doesn't flip that switch):
>> obj-$(CONFIG_ARM_V7M) expands to obj-y, file compiled, OK
>> Case 2: arm target, CONFIG_ARM_V7M=n set by user via Kconfig:
>> obj-$(CONFIG_ARM_V7M) expands to obj-n, file not compiled, which is
>> also what we want
> The problem is this "case 2" - it does not work. For example, try to
> delete everything from default-configs/aarch64-softmmu.mak (especially
> the "include"), and just stick a "CONFIG_ARM_VIRT=y" in there.
> Linking of qemu-system-aarch64 will fail with lots of "undefined
> reference to `armv7m_nvic_set_pending'" etc. messages.

This is what I tried to fix with this patch:
"target/arm: Do not build A/M-profile cpus when using KVM"
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05006.html

I addressed Richard/your's review comments, so the series is ready for
respin.
