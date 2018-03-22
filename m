Received: by 10.28.71.155 with SMTP id m27csp810191wmi;
        Thu, 22 Mar 2018 13:43:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuEqFV+hjyW+koSAxQ9qA/KVvcSMbvEc57GWPFfXG1OVR1OCVAPE17vdSTuIfD8xcdWupRy
X-Received: by 10.55.26.86 with SMTP id a83mr28891102qka.165.1521751397561;
        Thu, 22 Mar 2018 13:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521751397; cv=none;
        d=google.com; s=arc-20160816;
        b=MhNQpHkUTD5vLTQ5BcBez6VklHPuWKFObWYKuAfjAosD+XX6Lf0wKlqZkgM5sdnwJJ
         tENP6Xz5UzTSsIMC2reTOHsmi4f5uiwwJm0Cjm+xvdEvysHWaqwx/sQQLyxzOJfiL836
         Xd9MewC5f4+hxB5lP3Y07cqjJUmidE4AWX6BhPL4Bjji6q0oxbQDd0q7+D7YGTf/AF80
         JtS3APXe8VBFP2MtvJ2UTJ7OH9QvkOn2KuTbGcjPkf0279xkWaA8P0TBzBqJvdHatGJ3
         QmrIqy74hXB2KObqbSHH9s4Z93FZiHNXQk101MDyJYUIwLqw08Tao5+Wd4dDTAkoc8vy
         UrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=9Vhu/3Gph1hdb4atYGz5p3tkRulbqaTFZmTMAH5Udpc=;
        b=piEXCwGLHmD+4eHdEen3Wc9lcpru53Ei+HmeDd1kNfE+qbZaTu1enlU/5Yg7+GasYX
         TgX6R6lVSo2bgo8nwE45PEfGtFLYKF0xNikZetdbZx2x1ASE5CBE/xy2Jt1prm7wNILj
         Wf4CALmn9m3IN57aLn+lpm0X0QEDGlP5Xvpl9LtleLcC2pKDWPoFCqP1Ke2HeeRFyOUb
         dxwfXHiaI8IhCcQgj3TlhFRE/HBUFXOphRB5Q/u5iaakj7VugWUsx3lZW5wE93ZYITpa
         uT9kNPis0buYFYR3z+CJL0yzFh2HHFWWNLnYqCG3gmCeZDU6rUS+E91tdl5ceZ+fOHro
         1e6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LMRDutBb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s86si4522007qki.394.2018.03.22.13.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 13:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LMRDutBb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez73N-0003cI-5e
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 16:43:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ez72M-0003HC-DH
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 16:42:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ez72J-0007NM-Ag
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 16:42:14 -0400
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:38755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ez72J-0007MY-5d; Thu, 22 Mar 2018 16:42:11 -0400
Received: by mail-qk0-x22c.google.com with SMTP id 132so10736396qkd.5;
	Thu, 22 Mar 2018 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9Vhu/3Gph1hdb4atYGz5p3tkRulbqaTFZmTMAH5Udpc=;
	b=LMRDutBbCwWeDHAk2XBLB80dJGoL+oKxxFuM5XpUjA2C1Mqnaq6U2fBk/HZAu2ty6I
	ZtUJE7XIN+U86d7/eNxhfeETwPIvtQd+hykHobzGs4fun2j66lE7A+PDQIe6vr2+ZTHX
	ABiccjY50l3efXlGmVr4BHH1Wbs+pH0yLoxHG6EAJUxmliYJnmsBD+w2hD/WS3HBmgLx
	mWHR7I4icqhlLtqq/SnrINKNciEXK0tp44oLTsSldPsKA29zOh3VrQW6tUr3FNGUYFdq
	JKKUYD/+xnKWWxlsCMuyumFmPHcv+peEvCnODd2CeY/eBfnjR7zgxuHVEycw3xrW2FTW
	wJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=9Vhu/3Gph1hdb4atYGz5p3tkRulbqaTFZmTMAH5Udpc=;
	b=c4RCqSNLEHz4joQY/hlAnf1mpJ2l6y9fxCvONKTKHfHTwpTEhIf/8S/sWW79AsDuY2
	Y5KDecYhi87cIh6YEnNDyEJzEq9rOME42Y7Nb+p9AgDAGQgIXSxdOQbBXuRRNPl5PA5x
	N5flOpc840ARrJyW2l4cYVmQbjJt4e5nO73Rk8eQ5MnYPeuVAJcBIlx80eFVUgytm9jS
	FCKGtz8P/qSduLDBvtjoWmMlZRcjuW8LuEpxMz4MoEK3MpU8Tlmkf2C7yhXHmccKLdno
	jlnTaJ2AvlmnR4Kmq4ANeeeMoWbadAPD1tHr+7I+CzE5lxhrTHOOm4wd/YayWdgDcGHq
	OHCA==
X-Gm-Message-State: AElRT7Hwk5HhtEU1RSw4CM9McON16Q1tSNoiN/RqXiUeWAm2U6oVH5Sk
	KWZzS+SFDQ4hCf84PgOQgqk=
X-Received: by 10.55.103.4 with SMTP id b4mr36108467qkc.138.1521751330289;
	Thu, 22 Mar 2018 13:42:10 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	y58sm2155218qta.42.2018.03.22.13.42.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 13:42:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20180315133441.24149-1-peter.maydell@linaro.org>
	<20180322142343.jvc6pxxvl5zhfjgy@hawk.localdomain>
	<CAFEAcA8Vti8NnrQK4U4kLuk=nNMC5=KiKjc6wT7cLDnCHFj-8w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <48f559bd-9f54-bcdd-1f3c-f6fafccfc54e@amsat.org>
Date: Thu, 22 Mar 2018 17:42:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Vti8NnrQK4U4kLuk=nNMC5=KiKjc6wT7cLDnCHFj-8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22c
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.12] hw/intc/arm_gicv3: Fix
 secure-GIC NS ICC_PMR and ICC_RPR accesses
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w+Pz6VFGbwLd

Hi Peter,

On 03/22/2018 03:29 PM, Peter Maydell wrote:
> On 22 March 2018 at 14:23, Andrew Jones <drjones@redhat.com> wrote:
>> On Thu, Mar 15, 2018 at 01:34:41PM +0000, Peter Maydell wrote:
>>> If the GIC has the security extension support enabled, then a
>>> non-secure access to ICC_PMR must take account of the non-secure
>>> view of interrupt priorities, where real priorities 0..0x7f
>>> are secure-only and not visible to the non-secure guest, and
>>> priorities 0x80..0xff are shown to the guest as if they were
>>> 0x00..0xff. We had the logic here wrong:
>>
>> 0x00..0x7f
> 
> I think 0x00..0xff is correct.

I guess Andrew only suggested to correct the hex prefix in your comment:
- ... where real priorities 0..0x7f
+ ... where real priorities 0x00..0x7f

> The conversion from actual
> priority value to the NS-view is
>    if (prio & 0x80 == 0) {
>        nsview = 0;
>    } else {
>        nsview = (prio << 1) & 0xff;
>    }
> 
> so:
>    real priority     NS view
>     0x80              0x00
>     0x90              0x20
>     0xa0              0x40
>     0xb0              0x60
>     0xc0              0x80
>     0xd0              0xa0
>     0xe0              0xc0
>     0xf0              0xe0
> 
> the NS view covers the whole 0x00..0xff range, but more sparsely.
> (OK, technically you can't ever read 0xff, only 0xfe.)
