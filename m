Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3643178wrg;
        Tue, 18 Jun 2019 05:08:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRXi607L+ZI8+wwPZGzDr96bVPS3a7faTmxa89O2os3aLWGaH70R3TIHJPBVq42gq55v+I
X-Received: by 2002:a17:906:e087:: with SMTP id gh7mr50972487ejb.22.1560859707365;
        Tue, 18 Jun 2019 05:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560859707; cv=none;
        d=google.com; s=arc-20160816;
        b=0KDHdwZgH9BK3GTjQU+ZsI69GR5cuxu54bxh06YQv/GorYYJq7qklDs+gGXgAnwIjP
         rwg1V1Jv7yBX/XM4aX3NTuwEJ7djYONOkYmS1zShJFeevi9YFm56rg11QLWQ1//7eB17
         +KN/wCukESIVyZSY3ISc8yMsI1MiKsegGGTHgX1F2iLbV4eCDaz5bsUwk3Mt1AEJ9gT/
         MVJ3/8n/H4BgmIhcWMTuxCbt3U/6NA/z8dSzwfEdOOHaQlh8IWCx4rhrsVlS7+OcbCyV
         xQ3wQjphRjHMKfvAR+tvkaMQinunDX0GJp0Cg2O2ziYmnQCAuuKe4Nq9sm9SZCxv1HJG
         nZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4+N3SSk6PnSzYs/q3j1/lZtFbLDr9U6uRQqRH7reJyw=;
        b=clohbXNUYWQva9O8XrvzYAauPBfJQPR0h52EYm7lYg/bFHVBi6iGc3JyWqNc7kIBai
         T/Rszc1FeiU/s0iEb6rDz9EzY7G2f45AdDNlpXQyxCjYaapCxt846sdv/n/Wx+iB/XYT
         WnT3+qdYeCIFpVclbX5DGqcxTVOtGcRZiQa34V/aHxvnn/EKvPNVtUDiVrdUkl9FHJA7
         kka6udR11mCoV+zu3QOi4hDNovJbEKJbr1agPfSG8H2o1UEFJ9gmY98XZjy/GY3TyDBf
         xrrunRYZN6MGt0F1aZ8RQj6T7Myjw6U+oE05hRiCLScE9Nt+oW9KdVs44k5aCBIZzWZ2
         iPjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s58si10804843edm.24.2019.06.18.05.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 05:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdCuY-0006GW-Ev
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 08:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdCuP-0006Ds-11
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdCuN-0002A8-Pu
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:08:16 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hdCuN-00029R-J0
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:08:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so2967699wma.4
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 05:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4+N3SSk6PnSzYs/q3j1/lZtFbLDr9U6uRQqRH7reJyw=;
 b=df/9rcBtaDQ8bAGGUCQmLOdUGMQwdcAStbamjZdEuDFoXpEGKSl1GnweFqdA80LjF5
 rYYgH7Wo7CsyVbwAIIHp27G6MuARsbOeXWt4Jy+g1VbyyH2XwN2g0bwKpdG6CZJA2rvj
 jhLAsq2iOWDWgqMtHS5+cqDju0UjEKcOpiLK6zMmoPBkQQNxYK2Bi4PeCmzR9t+74WrF
 45V7K1/GU9T2507LmdYScXfz+9XnRl1/1p3BxrOjTmnS3Egn1FxC+giGSGWtWQDhmLlC
 7f7P6TZLLc9YX0JqaNuPzHXbI1xXPcsI3fY6vKlw7EoK5R4AyomgEYUW9XoRakOPhzQC
 jAaA==
X-Gm-Message-State: APjAAAWmkq/fZAAcat5ydqQe3ZJHMpwflLehCXInr14a9O7xG7swHYxr
 5aGeqHOo+t3a0l+ABTPrqXtz+Q==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr3535410wmb.81.1560859694431; 
 Tue, 18 Jun 2019 05:08:14 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id t198sm2723335wmt.2.2019.06.18.05.08.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 05:08:13 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20190618083442.10407-1-drjones@redhat.com>
 <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
 <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <307999bd-f1ee-9681-b770-e85587e1c5f1@redhat.com>
Date: Tue, 18 Jun 2019 14:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel
 boot setup
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: egzmnDNdc7dS

On 6/18/19 1:55 PM, Andrew Jones wrote:
> On Tue, Jun 18, 2019 at 12:02:37PM +0100, Peter Maydell wrote:
>> On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
>>>
>>> We need to check ram_end, not ram_size.
>>>
>>> Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
>>> DTB off the end of RAM")
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>> ---
>>>  hw/arm/boot.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>>> index b2f93f6beff6..8a280ab3ed49 100644
>>> --- a/hw/arm/boot.c
>>> +++ b/hw/arm/boot.c
>>> @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>>>                               info->initrd_filename);
>>>                  exit(1);
>>>              }
>>> -            if (info->initrd_start + initrd_size > info->ram_size) {
>>> +            if (info->initrd_start + initrd_size > ram_end) {
>>>                  error_report("could not load initrd '%s': "
>>>                               "too big to fit into RAM after the kernel",
>>>                               info->initrd_filename);
>>> --
>>> 2.20.1
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> I think I missed this because my test case doesn't have an
>> initrd -- direct kernel boot works fine if all you're
>> passing to QEMU is the kernel... I think we could clarify
>> the commit message a little:
> 
> I found it using kvm-unit-tests which uses a small initrd to
> pass environment variables to the guest. All the tests started
> to report FAIL.
> 
>>
>> hw/arm/boot: fix direct kernel boot with initrd
>>
>> Fix the condition used to check whether the initrd fits
>> into RAM; this meant we were spuriously refusing to do
>> a direct boot of a kernel in some cases if an initrd
>> was also passed on the command line.
> 
> Actually I think we need another fix for this error too. We
> weren't actually refusing do direct boot the kernel, but we
> should have been. We're missing the 'exit(1)' after the error
> message.
> 
>>
>> ?
>>
>> (if you agree I can just fix up the commit message when I apply it.)
> 
> I agree with the improved commit message if we also add the
> 'exit(1)', otherwise "refusing to boot" isn't the right thing
> to say.

Indeed. So for this patch + Peter comment + exit():

Fixes: 852dc64d665
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
