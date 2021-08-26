Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp785011lfb;
        Thu, 26 Aug 2021 09:50:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjLhQ5KJXMqIRwl9oF6Y2wwKp2lvnqVZUlD666VSQU+N/qeOFSmAyLraGq9NzZ97HhwJ9G
X-Received: by 2002:a67:ce02:: with SMTP id s2mr3391652vsl.29.1629996601592;
        Thu, 26 Aug 2021 09:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629996601; cv=none;
        d=google.com; s=arc-20160816;
        b=d/ETrsLXKP65Hkm2bpbL7uvoFanjoIOAM+aXixr8lhmQSwJHUMOJXZYxtkcy+lgfpS
         xd6QM7bpsJnhbIYX1EBfgT2rrel7yxdrVer1glghsHwr3iZYG34uNJ3u3EHHY0lNkteL
         KEEjFGo2NGqN8FEGHl+hms34wKFYQmBzCYnHYOXh9uJxiVCpyNsZ/YpJPyZRmH0icDHh
         wKVuO7DJHRwsBHYs/0BRpupwKCqKrgVmSWdd9ypqDhirJp4InBwkBzF2c7jAKmt/oukH
         C8Nv5hXOPDzyY22kLZ/31s6KnqqMA00qQvMmW1l+xW56AKIznCirGfljY+80R61hBaPt
         8pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kOsiRJ/ygtaCN1xppetgNUGtcT8kKQB5FMc95f3zhCM=;
        b=Y9S6AmaKUIQ587Hm3abTVgIqghhmACC41ps6JXc6xU7GqQG3iWYHXuTec44xDK8ds3
         pIHs+CFJB/R5Gj6hCuPdkdSdg+1/djBC0gbe6Z/f51wMnf8mnxFx6lOsZuB9uvM5GV3E
         CzQyn649QEOBq4nwW5R7K7U/xu2dKD4XIHNXgt5WAGmFsCVLASAbkCLXL4XyCpcGpo31
         uJmJM4FCkQn3Nz6wb0/lSlUN+CJZW0xGHdiyF6eEfVP0vKFQqHcOh0yAQFwFlCdAxmHR
         wWYXLpwfXaGUcDkNlesTSStX4lLwpd1Gq4ycrZJwdGwFD4wxBB4F2ztUv88l7xslAh3E
         sbaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=anSdlRsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si1640886uam.211.2021.08.26.09.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 09:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=anSdlRsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJIZk-0004Ij-Ul
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 12:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJIZb-0004IX-ML; Thu, 26 Aug 2021 12:49:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJIZa-0007VM-At; Thu, 26 Aug 2021 12:49:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so2237938wml.2;
 Thu, 26 Aug 2021 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kOsiRJ/ygtaCN1xppetgNUGtcT8kKQB5FMc95f3zhCM=;
 b=anSdlRsXbTv6NNt4nUwsDte1ppSOdfvk5LIpmXk0D5frvgGQjRu9NbAokO+45V1gvz
 DQWogBrzujaJ8gUucaRPbKpLpbjTG6QkYa87RPflXLbr2pU/rmPItiygG/oPdgmbeoJ+
 pnZAr/5mja+AMJ8sdoeHkKcuT3JQ8cvXB0buF6pCYPDn1pSqgN0rTypXFm8OHYOxr7Ru
 DJyhNv4ulxPCIJDnvJUoWrrLEjycExWuED8IoK8sEn8ooEfA1s5cVLfQoj+FVHYfHjJm
 Icx0Lnu15mZ913+oOTSS64hJKTo2Wpt0LGcmpwHDKRhGhbJBSNkWK4lziBnnwXHTkcse
 9tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kOsiRJ/ygtaCN1xppetgNUGtcT8kKQB5FMc95f3zhCM=;
 b=nYb/vmJcwOOfIrMX8U/Cw+Ga8oAk5iDKd5ttWUd8sCYkdAPtgENfYEdhXSnKH1oE9M
 eNeLGNOCMpCWUi2G0P8tUQojP6T07hI4RClVvadP5rb7WTlqZ6R0VvbrjoTbfAqo5tpl
 B38sIEfpkKTzu+dnKl7d82pMT78kn1TXJiCDLeFcFdXrgTaTfIcvxWEKYzaxBzWdmG44
 7iagNm67dXVOrBitP56dpGKKvt4nl6bm4zmwYvhTawAaKbZ6DALMHvn/FdXKcEm8NfeE
 iMJy/I2Rv6HKkoCKbm6PiHL+IuP49OmUno14wUGqSekoQxGnNdBr9oiy7WplK8PDSJLi
 /G2A==
X-Gm-Message-State: AOAM5334aIe7xfoN3jRVibTYWs2F3cjbmT6iI1zaxoRGdps4RQJX5u/r
 +OeIQK/2qrqHH5Jx38pWkiI=
X-Received: by 2002:a05:600c:a41:: with SMTP id
 c1mr4517873wmq.109.1629996587860; 
 Thu, 26 Aug 2021 09:49:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f5sm3059480wmb.47.2021.08.26.09.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 09:49:47 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: Peter Maydell <peter.maydell@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
 <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
Date: Thu, 26 Aug 2021 18:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /o0S0TGsXHuQ

Hi Peter,

On 7/9/21 6:00 PM, Peter Maydell wrote:
> On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Since v1:
>>> - renamed tests (Peter)
>>>
>>> Philippe Mathieu-Daudé (2):
>>>   tests: Remove uses of deprecated raspi2/raspi3 machine names
>>>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
>>
>>
>>
>> Applied to target-arm.next, thanks.
> 
> I found that this seems to break 'make check':
> 
>  (09/52) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
> ERROR: Could not perform graceful shutdown (40.38 s)

I can not reproduce. Maybe something got changed in Python/Avocado
since... I'm going to simply respin (updating 6.1 -> 6.2).

> 
> Dropped from target-arm.next.
> 
> thanks
> -- PMM
> 
