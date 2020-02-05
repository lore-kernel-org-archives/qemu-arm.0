Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6559187lfp;
        Wed, 5 Feb 2020 03:33:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzU2ausR9K9shzrmWtgmG/5zVP0Kc9L90qPqRESp94PrwzlNF56BhqvP1PVzEWCDagH6jxm
X-Received: by 2002:a05:620a:9cc:: with SMTP id y12mr11576222qky.446.1580902384458;
        Wed, 05 Feb 2020 03:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580902384; cv=none;
        d=google.com; s=arc-20160816;
        b=vdJ4oXGSLW+yMVZgzmF+L3lnfeOvA+1VZPib906vuEO9+rkPgzwredmu2KBfZsQT02
         bsgYQOmlZzPTyYf6W3sgjWq0CULKVl1V56tc3yo3QCPnnhmdvXGwOjtesZiVmV0hJJr8
         CsymH00VJl1Ib/tgb3ho2Wh/AZsmndr9YrLSkhvDJq17Zi2G9RrDsFihzLmp+xp8ZLVJ
         p0qgN17z2CIxbjy8XUvFaL7P4GHopv8iIwSDJCTd7GISKCpMlCFoSf6nAeslM/oxr61K
         mVh3PhBS0GCZXA9mH3QDb+awURNFXIEhbTk5+LUFWDBeYwcsT/dGn3MGYbzX/mGEWljF
         WlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=jJrRrlFW7/OTl35RtNHFh1ViJAv5+d1Pu5DDWBUC8BI=;
        b=vLFJdmSa6H7JDex+K4Z9BWxej5KYg0OcyNhmmPOHWVN3sf7iyLJz11j7NUNb/dHXK4
         gRtCLZW2Bf8ehJIHrQdddyp/mIoypSI3pQVe4M/mfOo1IT5jlomxSfiGQPq8Gx/S1c97
         5Pf0vm5klqMK5nsY2Ru4pEEAXZ1DQfHEpnya6udFExMMWZ2GhhTq4ABheUML4QfHBLRe
         yn0WuJSHxeA8p0mPCRGkFjn5/Y3es5WOJYHOK//29JkesX/hSaRmsA/R4nTRsc0aT8bs
         wRg9J+9JfsKpcdk9C2/ewewq1UpD1BNR9QfrFWGGQ6uM8B2LDRTxUJg9iU58Y6L84f2J
         rSXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KrgEuQpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si15866231qtm.88.2020.02.05.03.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 03:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KrgEuQpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izIvX-0001cf-SY
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 06:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1izIvE-0001at-9C
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:32:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1izIvC-0004hC-SF
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:32:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57671
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1izIvA-0004Zr-SH
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580902358;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJrRrlFW7/OTl35RtNHFh1ViJAv5+d1Pu5DDWBUC8BI=;
 b=KrgEuQpom9Jf0SVPwbvoXWZ6fGPgtJ+uULOF1JRpPFSO8UFy5lEsjV+0hTogi/O/elCoaW
 lcQJoQ498NIaO6RDITcPbLEa0vNAUa+ALX8KBUVlZByZgx3c2SpPadAH5LgplVeQjpfkBE
 w1SYsBt+RQzKzSVQPlkAlLsIpQNv4Yo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-c2Flw0RgO0aJ7Zl7di3NYA-1; Wed, 05 Feb 2020 06:32:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60081802B62;
 Wed,  5 Feb 2020 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-31.bne.redhat.com [10.64.54.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A30E5C1B2;
 Wed,  5 Feb 2020 11:32:30 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/2] Support NMI Injection
To: Andrew Jones <drjones@redhat.com>
References: <20200205031227.24355-1-gshan@redhat.com>
 <CAFEAcA_3A5fxo4gedJxsc64jus-rjzaLgzcipguOMwkSD4PNbQ@mail.gmail.com>
 <728d4be5-72f7-7742-98a3-c80c4c930f62@redhat.com>
 <20200205112247.khzzxlwzkf2odo2k@kamzik.brq.redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <acecb419-a1c5-f406-cb1b-9fffe45effcc@redhat.com>
Date: Wed, 5 Feb 2020 22:32:28 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200205112247.khzzxlwzkf2odo2k@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: c2Flw0RgO0aJ7Zl7di3NYA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v30AmEKI9+hC

On 2/5/20 10:22 PM, Andrew Jones wrote:
> On Wed, Feb 05, 2020 at 10:10:30PM +1100, Gavin Shan wrote:
>> On 2/5/20 9:57 PM, Peter Maydell wrote:
>>> On Wed, 5 Feb 2020 at 03:12, Gavin Shan <gshan@redhat.com> wrote:
>>>>
>>>> This intends to support HMP/QMP "nmi" command. When it's issued, the
>>>> SError interrupt is injected to the guest. The guest is expected to
>>>> crash with it. The behavior is similar to x86: NMI is injected to
>>>> guest as error indication. The guest possiblly crashes and reboots
>>>> with the injected NMI. Note that the functionality is currently
>>>> supported on "virt" machine and {"host", "max"} CPU models only.
>>>
>>> Hi; you forgot to cc qemu-devel; can you repost, please, so that the
>>> tools like patchew that monitor the mailing list pick it up?
>>>
>>> thanks
>>> -- PMM
>>>
>>
>> Sure, The series was resent with a "RESEND" tag.
>>
> 
> Another problem with the series is that patches 1/2 and 2/2 are not
> in-reply-to 0/2, so the threading of the series is broken. I see
> you've already reposted. I'm not sure patchew will be happy without
> the threading corrected though.
> 
> Thanks,
> drew
> 

Thanks, Drew. I had "sendemail.thread=false" in the configuration script,
which was copied from somebody else. Threading starts to work after it's
corrected to "true". I probably wait until getting some feedbacks on
"RESEND RFC v2" if it's reasonable.

Thanks,
Gavin

