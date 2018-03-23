Received: by 10.28.71.155 with SMTP id m27csp429586wmi;
        Fri, 23 Mar 2018 05:48:04 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu4wcnDLYNHCQiV1qI6pKepWamDzSPRxufh9CbCsPu8r1RopD7wtbPIcoH4U1kb23WBtPY1
X-Received: by 10.233.232.215 with SMTP id a206mr40961134qkg.238.1521809284501;
        Fri, 23 Mar 2018 05:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521809284; cv=none;
        d=google.com; s=arc-20160816;
        b=RlCrVWwM/UnTyvvdd7gXkiu9jMR5BjDLD8JhjZTDvSZ/3HLOTvkSU77Qq82NYVeLOU
         Osa9bTzvRbxP9wRh5X8EmWD26KHaeWy385VZs7KVlZvtrgi9Z8diq1LHuMrNhhjNmrHj
         AhWptgQu+EdlOv/0RlWRDCiSxNZOjlQ/81NqKGq1kx7Rb2xfmTG63kyRLPnOEDpy93UT
         FJczCvYCBCZiP2N9lA5DlzRaRNWw+bb4ys7vtSyjqKjH6dC6iG3BylEy7vHRlkL+44av
         u0EWre4yHZgRdHb/9OQe4upRS+xyrIDtKkkKQF3n0qAPH1zCYWYRhIK56rl5dSseOwkv
         FYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=EqFB/HU+w3RDjWVjAqvIRrzwhHoZOywTuLunA03VjtY=;
        b=l4vV4G0mjiZkb5cF1m83erUHc0Vy0rUz2adMiGFG2GSphorcQ6CsUf6r7Rgj2jnwNa
         KKn2UEXxjauM3JAZufC0CFFRjKwExsRO0kpRT2CKgAb4shkLXSs6FZp72AC0SVh3/vKL
         OYOTfg++Ns5zKnd01dXTqTvbcrNyhCHLInIjFJG3Mw/zC0E6XczlSJjOvjVNfo9t9i/Q
         VnpSYR2h0L0/LotuKxUXUhBwHpJp0j00QiV4RSuGXZ1z4T77Lv/82dRHf1uOiBiYidXT
         rf3BJUyuBG7CgTzIk+5rYyLbcAoBWoRCcp6sC7/3z1k7L1lPBYcp4F/0IusTDL9z9k+X
         4EKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 26si557524qtd.119.2018.03.23.05.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezM72-0005do-1Y
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezM6r-0005by-Is
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:47:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezM6o-0002eE-Ht
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:47:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46856 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ezM6o-0002da-D5; Fri, 23 Mar 2018 08:47:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB8A6BD87;
	Fri, 23 Mar 2018 12:47:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C84A3D7E14;
	Fri, 23 Mar 2018 12:47:46 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
	<20180323121957.GM32362@xz-mi>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a6dd2e45-41ac-ca1a-1725-ca372761b9af@redhat.com>
Date: Fri, 23 Mar 2018 13:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180323121957.GM32362@xz-mi>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:47:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 12:47:49 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] Regression on KVM qemu-system-aarch64
 since "monitor: enable IO thread for (qmp & !mux) typed"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	qemu list <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jy1QBg4Exd27

Hi Peter,

On 23/03/18 13:19, Peter Xu wrote:
> On Fri, Mar 23, 2018 at 01:01:43PM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 23/03/18 11:26, Peter Maydell wrote:
>>> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
>>>> Hi,
>>>>
>>>> I observe a regression on KVM accelerated qemu-system-aarch64:
>>>>
>>>> Unexpected error in kvm_device_access() at
>>>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
>>>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
>>>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
>>>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
>>>
>>> Can you get a backtrace for this? (I guess you'd need to fiddle
>>> with the kvm_device_access() code to make it assert rather
>>> than passing back the error).
>>
>> OK. I will try to do so. As I could have expected, I cannot reproduce on
>> a standalone qemu command line. The problem observed above is seen with
>> libvirt launch which may be doing some other QMP stuff concurrently?
> 
> Maybe not concurrently inside libvirt, but after the patches AFAIK the
> QMP part can be concurrent with something else or break some timing.
> 
> Anyway, sorry for that!  I'll see what I can do to help.

No worries

Thanks

Eric
> 
