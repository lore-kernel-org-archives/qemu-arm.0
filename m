Received: by 10.79.209.41 with SMTP id p38csp3287922ivj;
        Wed, 8 Nov 2017 06:53:13 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Rxyl/ftvsdbYJzAmp9R7eNgDZQzoKYd74vOD56LZTJKwSPidHcMxJyz3wE2xwitTV0Qo6x
X-Received: by 10.13.221.2 with SMTP id g2mr488908ywe.99.1510152793643;
        Wed, 08 Nov 2017 06:53:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510152793; cv=none;
        d=google.com; s=arc-20160816;
        b=LZM/Qq6OMU3U1hNHoawEnZc85p2cuKOhMBbw+suCSQpO564h01hT+2/p/X4s34Fd06
         3KJblaCRztoQYFOLRE2vcJdhiZhwqC31Yx4yPI9hy5IqFhEbeLtWmr28JJ5Oc0xsMlL+
         2KwedNEzsriKNEB7tgSs4Zc92G/1qLKw8sSM/njPjapFh80GkuUpa0EhxyujcyiS4/V8
         oOEdrM4kaySKYnW0pEEcpfLsYHAb4ypOX41e2J6Dogy/kh/rtb6UPPg+nBbqh80Jn082
         dZ/0Ddz5GUeNVPa+uzdL1h4wBgtVqRB0+w2Pt0yk83Ic06rLZ2C9J9FGhxGAwO0A+TCC
         AXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=k2mbn3wCzJUYt9Hq2bHSSuaOpXuj1eXIx4TtMkEoLKw=;
        b=wDb3vSYbIGEHas5iNOdJR2KMIV9Wd3y+GfwOCrIgeK+48bjTVIn+rn08pMzUYjDsox
         XMrWhR81GMD1nb4jOxzFrhzlaVZk7q2saPqJYNmuWmAu606ipyIvxpk7+RyKz3NdJ2rc
         d9zRWnfJWhbyXDSF25G6WZMN+/ujjFfp7KKAqN+sVCNCHtUGckarNnD560paGSpCwjwU
         TU1rTi4KUu4OL0psCzxKrLfHU6T9slwOxb3Pu0KNaUIjxLWX6MkrsZUVXfHH9NCuHq0J
         oDEFxXzfK2tOShizBBYfyxtN1MBr8hwaJlTxgDIszkibqjcq7J3ruR2YdxE3ORq3tAuH
         dElQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTDItvn8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64si934117yba.580.2017.11.08.06.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 06:53:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTDItvn8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCRj7-0007yy-8Q
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 09:53:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCRhz-0007Su-Ie
	for qemu-devel@nongnu.org; Wed, 08 Nov 2017 09:52:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCRhy-0007GI-L0
	for qemu-devel@nongnu.org; Wed, 08 Nov 2017 09:52:03 -0500
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:53950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eCRhw-0007Et-I1; Wed, 08 Nov 2017 09:52:00 -0500
Received: by mail-wr0-x232.google.com with SMTP id u40so2653288wrf.10;
	Wed, 08 Nov 2017 06:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k2mbn3wCzJUYt9Hq2bHSSuaOpXuj1eXIx4TtMkEoLKw=;
	b=tTDItvn8PBc1tNpC/2y5y2Dc8fC3P9EMJ089VIS60/iuZ2wrIm0XCZiPrqz338VniF
	hTtqxpPO0NmtrMKY9V4D1bSWKsW4WtDWi7AiMmALpDQxtn4WWdN3IyGpfNIn5ft7f74M
	un1uTLxK4vzcR+lQWAxWHECGEtyYt7kY50+orx4H1gWZHTAKqEOYgn+SssFKrGlepgoH
	e5KVud4RONarS8muRONijwVMQPc3eYEBFJqdVNkSIZ5KQ6fB8AXAmR7SY/xbIpiv+QHq
	0dAYaPotc+QxqLiIiFhFGgquE2BV+paY+AjhkMLHTQDqbFgb8L5x81bYBJflM4UtVOpn
	xG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k2mbn3wCzJUYt9Hq2bHSSuaOpXuj1eXIx4TtMkEoLKw=;
	b=Splu5mpw0SakK+xL5pBdkMpsAXuqR1WOa6kEICPG65D4nFj/+rGYsnL50yB/3qMOcW
	C1s+P2isrGBwUWYFBHSyXrt4xSJYxJ0VO7T2d0Tx4lP7UeWiKkW4+X9hgYsQ/S71Zk8x
	fOTH+TZvzRLY7bl9TgzimaTlR4dP+UnMPYzwTKAZ6PwI6fi+fehU1BelGdaa3wtJb3dG
	uvjBzT+UDTgTckagGIu1AsFixNJLJ7bI+0jezbG0AJ8Ht2ES5ClgTNK2KJNfr4GxjPjT
	ygCcg2A0aKoFkB0rxxqa+tAf7NRw/XXqaSx+uSXP0HQQmdJUkI6FBCs+26RnklIc2iCO
	LJdQ==
X-Gm-Message-State: AJaThX5JG862cKPQ/ktNtKWNfgZZ6nZGY/mqd9pcUqhFUmW3H5Gl9kdl
	Tc8M66du9PRiPYCfyYmPBY+lK6+ylECKHPVkW0s=
X-Received: by 10.223.170.142 with SMTP id h14mr687003wrc.136.1510152719382;
	Wed, 08 Nov 2017 06:51:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Wed, 8 Nov 2017 06:51:28 -0800 (PST)
In-Reply-To: <87shdptdf0.fsf@dusky.pond.sub.org>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	<87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
	<51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
	<87shdptdf0.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Nov 2017 06:51:28 -0800
Message-ID: <CAKmqyKOhnGrbZ6tnaXgBNzdJ=LdnD9NWuWVV-LHmM3zea8OBvA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-devel] [PATCH v3 01/46] Replace all occurances of
 __FUNCTION__ with __func__
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pqkCv2yxp+14

On Tue, Nov 7, 2017 at 11:52 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Eric Blake <eblake@redhat.com> writes:
>
>> On 11/07/2017 04:12 AM, Markus Armbruster wrote:
>>> Juan Quintela <quintela@redhat.com> writes:
>>>
>>>> Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>>> Replace all occurs of __FUNCTION__ except for the check in checkpatch
>>>>> with the non GCC specific __func__.
>>>>>
>>
>>>>> +++ b/audio/audio_int.h
>>>>> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int src, int len)
>>>>>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
>>>>>
>>>>>  #if defined _MSC_VER || defined __GNUC__
>>>>> -#define AUDIO_FUNC __FUNCTION__
>>>>> +#define AUDIO_FUNC __func__
>>>>>  #else
>>>>>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>>>>>  #endif
>>>>
>>>> Unrelated to this patch ....
>>>> Do we really support other compilers than msc and gcc?
>>>
>>> Let me rephrase the question: do we really support compilers that don't
>>> understand __func__?  The presence of numerous unconditional uses of
>>> __func__ in the tree means the answer is no.  Let's replace AUDIO_FUNC
>>> by plain __func__.
>>
>> Answered elsewhere in patch 3/46 (where we DO replace AUDIO_FUNC by
>> __func__).
>
> I see.
>
> Put 03/46 first, so we don't have to mess with AUDIO_FUNC twice?

I would really like to avoid that, as the conflicts will be a bit of a
mess. The way I see it there will be a lot of churn no matter what,
so we don't gain much by swapping the order around.

I have a new series ready to send today, so I'm going to send that
through as I would like at least some of these patches to make it in
2.11. After that if you think strongly the order should be changed I
can change it in the next version.

Thanks,
Alistair
