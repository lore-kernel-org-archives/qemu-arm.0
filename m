Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2627122ejb;
        Wed, 4 Oct 2023 05:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLcJvi/bRSm1UJ7IdI4IkWI2md8EXJNKFQ020+4GbCMat4oSltFLmfdLODjKc2z0qMdhK9
X-Received: by 2002:a0c:c306:0:b0:65d:145e:310f with SMTP id f6-20020a0cc306000000b0065d145e310fmr2171673qvi.43.1696423662126;
        Wed, 04 Oct 2023 05:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696423662; cv=none;
        d=google.com; s=arc-20160816;
        b=TKUxFon7j4JwJY3/TOcXzINGdOM/6u9owTBkuLqW5KvDKg3JqBewBtm6O4s9127RfV
         NO1cxBdHiZohGGSzATvB0+ZvqHYfHG2DBf7tXO8S2Fml7nMDygb3vgYcnCHRLp/T/pgj
         3MLY/2Jyxh+NO7gBBsqm9NYolFe7iizFUkMuAouTGfL0AJHX15Iu5lgamkbYu8i0aaxf
         pKTAurZhGLnH8VG0JDhhZOI2JIBmuvbTuEPcKXNfLoiEYM1SJZLJcRx8EZ+4+yX2oZfs
         sXoGKYhzp5FMfNYyhTOZezgkx8/hpEkJoG27c7K/w4lBZ9tdQjpaEwOATALeG3KrWOmZ
         lG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=yAMZ8Pq4lTGyOSRZJSrvHYU1X/SE3SSWY8Mhu+EwJtk=;
        fh=iffdpicnSCD8ax9innSgC7BN2w7KTaYvb4N66J5F5Vc=;
        b=LTNyEpgzXD5MFpD3BWuL2aPEWCumLkuMvJZNcmwEst61lzVT62N0MhZNGE+7JmvwkY
         4xrBy8LZxFaPOr+C7i6kHD4+F8MReZYSmHu7aSaKxlFZ/oACaA9KbnbKeWFD56PHbGCR
         Cv6571TpyNOOWjx0/RVQpw2xCBc/kGiHLBtlauQzp27FKcidHl1rhjzQCFPPU0e2MR+S
         olJp8hh76PA3Kn4mj1g4p+2Cv4dVJCMnbRMBjxf6ipjDAaryYSPfmHJBEZuhVVukJhex
         dcqX65R0jJAFo6LfXsWjRtWdQOQyXG6cYfD508HYgqNVwVI55iz0LNGlZ+afbt0QftEm
         d5NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w25-20020a0cb559000000b0065b17bc10b7si1411903qvd.239.2023.10.04.05.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 05:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo1Hr-0002IO-HY; Wed, 04 Oct 2023 08:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qo1Hq-0002GW-7q; Wed, 04 Oct 2023 08:47:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qo1Ho-0006Dw-3K; Wed, 04 Oct 2023 08:47:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D20FE7456AA;
 Wed,  4 Oct 2023 14:46:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 950297456A7; Wed,  4 Oct 2023 14:46:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 93132745681;
 Wed,  4 Oct 2023 14:46:45 +0200 (CEST)
Date: Wed, 4 Oct 2023 14:46:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 13/13] system: Rename softmmu/ directory as system/
In-Reply-To: <e3341fd8-b122-ac6a-4a55-07fa80c5142f@linaro.org>
Message-ID: <7145d71d-a255-05f9-d36a-6e2375cdec78@eik.bme.hu>
References: <20231004090629.37473-1-philmd@linaro.org>
 <20231004090629.37473-14-philmd@linaro.org>
 <e3341fd8-b122-ac6a-4a55-07fa80c5142f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1512138473-1696423605=:55550"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vy2dXeWPB9ai

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1512138473-1696423605=:55550
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 4 Oct 2023, Philippe Mathieu-Daudé wrote:
> On 4/10/23 11:06, Philippe Mathieu-Daudé wrote:
>> The softmmu/ directory contains files specific to system
>> emulation. Rename it as system/. Update meson rules, the
>> MAINTAINERS file and all the documentation and comments.
>> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>
>>   include/sysemu/runstate-action.h        |  2 +-
>
>>   rename {softmmu => system}/timers-state.h (100%)
>>   create mode 100644 system/trace.h
>>   rename {softmmu => system}/arch_init.c (100%)
>>   rename {softmmu => system}/async-teardown.c (100%)
>>   rename {softmmu => system}/balloon.c (100%)
>>   rename {softmmu => system}/bootdevice.c (100%)
>>   rename {softmmu => system}/cpu-throttle.c (100%)
>>   rename {softmmu => system}/cpu-timers.c (100%)
>>   rename {softmmu => system}/cpus.c (100%)
>>   rename {softmmu => system}/datadir.c (100%)
>>   rename {softmmu => system}/device_tree.c (100%)
>>   rename {softmmu => system}/dirtylimit.c (100%)
>>   rename {softmmu => system}/dma-helpers.c (100%)
>>   rename {softmmu => system}/globals.c (100%)
>>   rename {softmmu => system}/icount.c (100%)
>>   rename {softmmu => system}/ioport.c (100%)
>>   rename {softmmu => system}/main.c (100%)
>>   rename {softmmu => system}/memory.c (100%)
>>   rename {softmmu => system}/memory_mapping.c (100%)
>>   rename {softmmu => system}/physmem.c (99%)
>>   rename {softmmu => system}/qdev-monitor.c (100%)
>>   rename {softmmu => system}/qemu-seccomp.c (100%)
>>   rename {softmmu => system}/qtest.c (100%)
>>   rename {softmmu => system}/rtc.c (100%)
>>   rename {softmmu => system}/runstate-action.c (100%)
>>   rename {softmmu => system}/runstate-hmp-cmds.c (100%)
>>   rename {softmmu => system}/runstate.c (100%)
>>   rename {softmmu => system}/tpm-hmp-cmds.c (100%)
>>   rename {softmmu => system}/tpm.c (100%)
>>   rename {softmmu => system}/vl.c (100%)
>>   rename {softmmu => system}/watchpoint.c (100%)
>>   rename {softmmu => system}/meson.build (100%)
>>   rename {softmmu => system}/trace-events (100%)
>
> Maybe I should also move include/sysemu/ -> include/system/
> to keep it coherent?

I think I've proposed some years ago to rename softmmu to sysemu because 
besides actual softmmu code it conrains a lot of system emulation. Calling 
it system is also similar, maybe less specific than sysemu but basically 
the same.

Regards,
BALATON Zoltan
--3866299591-1512138473-1696423605=:55550--
