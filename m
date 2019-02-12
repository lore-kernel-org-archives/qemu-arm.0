Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp673031wrp;
        Tue, 12 Feb 2019 04:38:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZLFCdUlXJwXFxa0f0YEGTWmS173AEBp8+RUtklb3wptQ1jr57Iqln4BUDqleH1umHNcSDi
X-Received: by 2002:a25:4d84:: with SMTP id a126mr2573597ybb.33.1549975113452;
        Tue, 12 Feb 2019 04:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549975113; cv=none;
        d=google.com; s=arc-20160816;
        b=NGVOFZNsdKOetL7F4T2KcTebWo57y92YNg8a2iETfA8XkUgGpcalrlVqIZldLMNIM3
         /7/kXvEcQ/5Iv9pCLfDi4LXEVVKHFLqfNIP3fhmRip1ghdIQihXnjMPt489i85hW01Sa
         5fzrsFkF0fU8UXlVcLh9pD67xFGiwB9ltnCdfuxdtMEk9VblC2YlT19OijcUFlR/cHgV
         z6xV/FudXo7TdH1Gni3HmtAIxAXnUExICKYZq+nHGvvlmJ4YS1JA6KXiB+yq58E2P8Nu
         aLR4ajOjA5GnqNz+a0QRSx4GYVDHncraITdrPZwyqqbHjIwaXW6cuMJfbnUo+LgGvhBI
         1e/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=y/NAm+kJZmAFt+yELXLIve/fQwK6hzOaz+NZj8P7QXs=;
        b=LBlpx92v3EZSZTxZJhHtSk9L+/+I90uALKEAopJ6JA8ZtCBSi5y9oZiFNBBIP/2nxJ
         mgF36CMXhmew1LvbXDhXyY9ludx5thFsE1BqIKyX1pa62OuD/8UaIuh3UL0eCn1N+80Z
         QDV48i9OuMWW2VCW7JODBBcH25T+ngKLRiwE2zzCNAPMmP5A0VjhOhuDV5c6y4yNgEqg
         oUZhd7v8uqyLmmhgi0H2u5tdf9Ftk1ac0sSeCmSRkaXDzp42kMJScMzeY11I3GBqoIxV
         hKhSMtAVKlfkB99dIFi/AyC8QqJi6bQkMTmipL2HR4+BzVUlin/5Aki340c0Heuqgj2Y
         4HHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si5805138ybp.426.2019.02.12.04.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 04:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtXKa-0007oL-QH
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 07:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtXHv-0005Zf-1k
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 07:35:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtX5o-0000bF-JI
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 07:23:17 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtX5o-0000Wu-8p
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 07:23:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id w17so2415922wrn.12
	for <qemu-arm@nongnu.org>; Tue, 12 Feb 2019 04:23:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=y/NAm+kJZmAFt+yELXLIve/fQwK6hzOaz+NZj8P7QXs=;
	b=KNI1l4p+m0KD61J6bTA22pAdmSsCidIbxodKupo2tktj35vDKbi/9Fgn1dkCgvneAa
	btfgEfuM/Dx3SOnKrbo3EB009FeXrn7jD12I9Ew2wUPuaBJD6groLIvjM8oFjSRDnGpX
	3jjXUOguyOwE18n5FplPik4NnnBbSNNGhvHuh6X12mX8MZ0QawfBHx4KqE5Rvm+GVdK3
	tqKi3vsQL4MCSzFqia41M3gtqjdrsHVOgeGHVBY11G2QnUz82XCci615QV5B+UfRCa98
	VELjP7ei3/Yd9Dj+z1OxPDjOHmLO2aO+adFO8+W0Vu4meWd8HTse2w8OQnU2Aw+TQuXy
	S7aw==
X-Gm-Message-State: AHQUAuanEJgAiEwgvNDcKnPztTqnzsBlqFi9ecjDhaPFRjVtZafoXK4W
	5HAOdbDvOdHeHfcqru7WDx6PJQ==
X-Received: by 2002:adf:de83:: with SMTP id w3mr2614150wrl.56.1549974195109;
	Tue, 12 Feb 2019 04:23:15 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	s8sm28135717wrn.44.2019.02.12.04.23.13
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 04:23:14 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
References: <20190212105201.13795-1-peter.maydell@linaro.org>
	<1df0da56-7abd-4688-0fed-6dc2bf10ebb6@redhat.com>
	<CAFEAcA9Jds9wLwJUqe4kJrDszL__KoWpKm5ajh0HCcR+mSH8tg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b2226550-15ac-2f2a-1584-64a24d944923@redhat.com>
Date: Tue, 12 Feb 2019 13:23:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Jds9wLwJUqe4kJrDszL__KoWpKm5ajh0HCcR+mSH8tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/armsse: Fix miswiring of
 expansion IRQs
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbbgdY0Oe8VE

On 2/12/19 12:06 PM, Peter Maydell wrote:
> On Tue, 12 Feb 2019 at 11:05, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 2/12/19 11:52 AM, Peter Maydell wrote:
>>> In commit 91c1e9fcbd7548db368 where we added dual-CPU support to
>>> the ARMSSE, we set up the wiring of the expansion IRQs via nested
>>> loops: the outer loop on 'i' loops for each CPU, and the inner loop
>>> on 'j' loops for each interrupt. Fix a typo which meant we were
>>> wiring every expansion IRQ line to external IRQ 0 on CPU 0 and
>>> to external IRQ 1 on CPU 1.
>>>
>>> Fixes: 91c1e9fcbd7548db368 ("hw/arm/armsse: Support dual-CPU configuration")
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>>> ---
>>> It turns out that the ARM-TFM image I was using to test that
>>> I hadn't broken the mps2-an505 doesn't actually rely on any
>>> interrupts from the external devices...
>>
>> How did you notice that, simply reviewing? Via 'info qtree'?
> 
> I'm working on a model of a different board (Musca) which also
> uses the SSE-200, and the test code I had for that does happen
> to care about the interrupts.

OK, welcome Musca!

If you are testing Open Source code, please add a few notes on the wiki
or in a mail (or the cover when you introduce the Musca), so we can add
an acceptance test.

Thanks,

Phil.
