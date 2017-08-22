Received: by 10.223.188.70 with SMTP id a6csp5044315wrh;
        Tue, 22 Aug 2017 07:54:31 -0700 (PDT)
X-Received: by 10.55.200.210 with SMTP id t79mr1337931qkl.0.1503413671382;
        Tue, 22 Aug 2017 07:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503413671; cv=none;
        d=google.com; s=arc-20160816;
        b=jrRK80bwNBr5ssMvk4QtmxDs7S5RJmtBhbTm9MQ2RLgBXTZggDpGwXEYUwkGDP/vMJ
         YV6QfVxZZiTq287invaE59I1/gatmmu6ubzuJ39d3xf4LjwPoUFCjah+S5qd1kb3pezt
         kjOiieby8eKU66TuJrWD0jUvRdeJQ2suFU92w60SJpm0AGKaWk761POg/TK9qlOecA2D
         LrpGf+WTW2M4uSqI4M0uhSXEDajFk7ZnIojEEn2ccj3QvMvL/qRh1AkJoE7icU89+Bil
         ntRcJZ+rFBVr75wtHO1ZwOSEeemCg1kfnVm5Y5NxobNy/mn40AaJ6HEbW97/wLdZeKml
         WAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zRvWD0ylVhcnWa/SVfGI+LL5lbQBXtMpQi4bwGqVUME=;
        b=whFJkYu3slUdjl2B4lIOrOiw1Yr7sGk6mKM5OIEccyU3GDLbBkMZfQWU3mE0eXPGI7
         vfN9xa+WDFhtwCwJeFE+4illzMc5ySONk7CaO5umeg4EDYXia7ER4vcEdwas7KD+X+H9
         Lii8n5EA92bLJHDFuhMxuqicuqMITHsXTzZG0fyU/fD8n/mhKtFVeOkvk4NOTpOxrRqT
         44wtxKwKQKUB7isnv27vq1Ucgetd9qCTVsGWHSDTMaYog02cjDhE4BNwIEigrSi9PwAv
         hnB81rxK0EI82DkMpASZAUDt1Ar7yRbSjxu6H3TBAYU0LoJlD4W/NYj5ANzy7GK7aq4P
         HFRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fN1Xs8xK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d69si13585028qkj.271.2017.08.22.07.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 07:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fN1Xs8xK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAZZ-0000f1-7Y
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 10:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dk9qS-0003rm-1L
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dk9qQ-0002zz-Ui
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:07:51 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:36257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dk9qQ-0002zN-Od
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 10:07:50 -0400
Received: by mail-wr0-x22c.google.com with SMTP id f8so90445610wrf.3
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zRvWD0ylVhcnWa/SVfGI+LL5lbQBXtMpQi4bwGqVUME=;
	b=fN1Xs8xKLb6KZ3gUgooxjaQjBiMiNztysmogAJe8EtwwPnK4fdgxjiBzl8TWQfGqb2
	wndiuIXCkNtScBBNCxVTj4f8MwtsuzANVcHnSC7KMBiF9RhUI7GwgiXo15UQGX1PZ31X
	v2xBn/DjIbagQU09vv5Q1pWg2uhzopOOKcqSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zRvWD0ylVhcnWa/SVfGI+LL5lbQBXtMpQi4bwGqVUME=;
	b=oeSC3elvBF/eCvoguVeBfunKlJx28YHhyNnBBanmyLH4n4J/mo462JYhG7jDyGA8jf
	vbNuQIma/FhoJDM8SWt5XqGy/XZytMjZScj1DNmK5iRc6Yr+gyNdQw7fazVi1eqMuLiv
	a+uvO62gBycCcyQwUVBPZvTHE5pOp8c+F3kTotCAheFTaMwEswCuzS1a3c15e3aFSnJ+
	hFHhiVa6r6Q4ZEdt6r7I/RYzF0tch+2t+CRDYieRgjoP/oFR6NBuAnVghoYIQ5KoI3X1
	7ctE9WGBYY4FCrLgFCr+sG3x40JhoYyt8kYhltk2vxEOR6kQwocOTaPfxHIA09JRL3xn
	AgUA==
X-Gm-Message-State: AHYfb5jpWDwxBX2oPHReeuLeNRmrNUBGFZmgvP7yYTNCSZzx4v5lFhLY
	v5l84s5UxBQVbgXl5tZqB89xCjuEFjFG
X-Received: by 10.223.155.132 with SMTP id d4mr554939wrc.196.1503410869477;
	Tue, 22 Aug 2017 07:07:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 07:07:28 -0700 (PDT)
In-Reply-To: <8fb75274-09a6-dbd3-5dba-1069d790b689@redhat.com>
References: <1503407712-9894-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-V1igN7Sz3SusczcPadtZC-z4fyw-pvPggGT5VFFMvRA@mail.gmail.com>
	<8fb75274-09a6-dbd3-5dba-1069d790b689@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 15:07:28 +0100
Message-ID: <CAFEAcA9PdXkh4t7gCT=3GNbD8V+_Abtqe31p2DV+=emyR1chcQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH] hw/arm/digic: Mark device with
 user_creatable = false
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1E3OSQJOKxex

On 22 August 2017 at 15:05, Thomas Huth <thuth@redhat.com> wrote:
> On 22.08.2017 15:52, Peter Maydell wrote:
>> On 22 August 2017 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
>>> QEMU currently hangs completely when the user is trying to do a
>>> "device_add digic" on an unrelated ARM machine like integratorcp.
>>> Looks like this device is not meant to be hot-pluggable at all, so
>>> let's simply mark it with "user_creatable = false" to avoid the hang.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  hw/arm/digic.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
>>> index 94f3263..208dfb3 100644
>>> --- a/hw/arm/digic.c
>>> +++ b/hw/arm/digic.c
>>> @@ -101,6 +101,8 @@ static void digic_class_init(ObjectClass *oc, void *data)
>>>      DeviceClass *dc = DEVICE_CLASS(oc);
>>>
>>>      dc->realize = digic_realize;
>>> +    /* Reason: Hangs QEMU when trying to device_add this directly */
>>> +    dc->user_creatable = false;
>>>  }
>>
>> Maybe "uses serial_hds[]" is a better reason, or does it hang for
>> some other reason?
>
> When I kill the hanging QEMU, the stack trace looks like this:
>
> #0  0x00007ffff13afaff in ppoll () at /lib64/libc.so.6
> #1  0x0000555555bb3179 in qemu_poll_ns (__ss=0x0, __timeout=0x7fffffffda60, __nfds=<optimized out>, __fds=<optimized out>)
>     at /usr/include/bits/poll2.h:77
> #2  0x0000555555bb3179 in qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, timeout=timeout@entry=1000000000)
>     at /home/thuth/devel/qemu/util/qemu-timer.c:334
> #3  0x0000555555bb3f88 in main_loop_wait (timeout=1000000000) at /home/thuth/devel/qemu/util/main-loop.c:255
> #4  0x0000555555bb3f88 in main_loop_wait (nonblocking=nonblocking@entry=0) at /home/thuth/devel/qemu/util/main-loop.c:515
> #5  0x000055555578d927 in main () at /home/thuth/devel/qemu/vl.c:1917
> #6  0x000055555578d927 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at /home/thuth/devel/qemu/vl.c:4791
>
> I haven't investigated any further, but the usage of serial_hds
> in the realize function could certainly be the reason. At least
> it certainly is a reason that this device should not be creatable
> by the user - so let me send a v2 with the comment changed
> accordingly.

Has QEMU itself actually hung (no response to monitor etc), or is
that just the guest sitting doing nothing? "QEMU is sat in the main
loop waiting for something to happen" is what you'd expect in the
latter case. The backtraces for the other threads might be of
interest or might also be unhelpful.

thanks
-- PMM
