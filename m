Received: by 10.25.208.211 with SMTP id h202csp34615lfg;
        Mon, 4 Apr 2016 12:47:07 -0700 (PDT)
X-Received: by 10.140.90.106 with SMTP id w97mr43189502qgd.14.1459799227071;
        Mon, 04 Apr 2016 12:47:07 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u124si23422393qka.69.2016.04.04.12.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 12:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anASo-0001xp-MJ
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 15:47:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anASN-0001OB-3n
	for qemu-devel@nongnu.org; Mon, 04 Apr 2016 15:46:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anASM-000064-66
	for qemu-devel@nongnu.org; Mon, 04 Apr 2016 15:46:39 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anASL-00005c-UJ
	for qemu-devel@nongnu.org; Mon, 04 Apr 2016 15:46:38 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e185so194009864vkb.1
	for <qemu-devel@nongnu.org>; Mon, 04 Apr 2016 12:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dLsHCUfMbfgCZNAaAHz+oHEsdeYxEViqmZfMNxtulVw=;
	b=IONSnohC6gFXWBL9roLOJ+jjsq6qKTuHgCvqaNTObhtQ8UwypThGVIbCRW7NRYazlb
	SvjfXbLPH7JKtXiyS7GXBNoREry7vC4gY0eLhPc8nkYTP+qCQh6m93A4zVxurAGYdds1
	4AXOhBQoWF81URN91lPOhD+iZSl+abdyBMp9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dLsHCUfMbfgCZNAaAHz+oHEsdeYxEViqmZfMNxtulVw=;
	b=gH1RQ68M5p6P2jVsCdi/icaiFdZS4T3vPFHAAnWVH4jd3RuX7i189S6OKVFyXFYV/g
	Zxc1SEFWZYzt6kqL+gWQRHyLLpP6dyFgLJTelk+Act2QP8KLVmsMRv9odOG5jTW9Ah7O
	M/RygiwJqG11J/oQmmjzv0aOYGStjhe6kqKx5ZmP1/eavW42KZMzf3kkL3rrxP2Fs+x8
	1oDodfr40nfmk849QWyjgkKWknJF3Ni/CR+r1GitR0QJ8K6pp4KbgKsNdGZ2+h4XPsvn
	EkFlb5iHJnaUiwFKsGFqm4lunAucUjF8wtOhrv+ewUt+1EWvI3YRn2moX1sjZduMwyUC
	CU1Q==
X-Gm-Message-State: AD7BkJIBuVxgj4+ONXy/gom7WtlA/FN3/G/akaBxISkSx2+38hd2EGAPKMmnCNHH39kQlBqmYlJx6KQG5DVzpw7k
X-Received: by 10.31.52.147 with SMTP id b141mr8164784vka.82.1459799197356;
	Mon, 04 Apr 2016 12:46:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 12:46:17 -0700 (PDT)
In-Reply-To: <20160404194236.GE22665@thinpad.lan.raisama.net>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
	<1458910214-12239-2-git-send-email-aleksandar.markovic@rt-rk.com>
	<56F9A3D1.2050402@twiddle.net>
	<EF5FA6C3467F85449672C3E735957B859168FB0A@BADAG02.ba.imgtec.org>
	<CAFEAcA_Rp+8hGC6sos3H3t2A8UDgLUf3KvrM3-C3zZAFCc_WEA@mail.gmail.com>
	<20160404193723.GD22665@thinpad.lan.raisama.net>
	<CAFEAcA9axhkDC0tDT1ujNZUpHbCnMqSxaL-KTD2=TV=XOyEbuw@mail.gmail.com>
	<20160404194236.GE22665@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 20:46:17 +0100
Message-ID: <CAFEAcA9vZBoqPQ8-YzRWnoQhXLwu-CJ5AJ2AyhL3qSMBJRdd=Q@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: "proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"agraf@suse.de" <agraf@suse.de>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH 1/2] softfloat: Enable
 run-time-configurable meaning of signaling NaN bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EJprExrvYBgF

On 4 April 2016 at 20:42, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Mon, Apr 04, 2016 at 08:38:54PM +0100, Peter Maydell wrote:
>> On 4 April 2016 at 20:37, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> > On Mon, Apr 04, 2016 at 02:31:47PM +0100, Peter Maydell wrote:
>> >> On 4 April 2016 at 14:21, Aleksandar Markovic
>> >> <Aleksandar.Markovic@imgtec.com> wrote:
>> >> > B. arm - explicitely sets other fields of float_status,
>> >> >       explicit invocation of set_snan_bit_is_one(0) added
>> >>
>> >> We zero the float_status structs on reset, because they are earlier
>> >> in the CPUARMState structure than the 'features' field (and so the
>> >> memset() in arm_cpu_reset() will clear them). So you don't
>> >> need to explicitly zero a field like this. I expect the other
>> >> architectures are the same.
>> >
>> > Even if it is not zeroed on reset, it is zeroed on object_new().
>> > Isn't that enough?
>>
>> It must be zeroed on reset, otherwise we won't get the right
>> behaviour if you reset the CPU after running it for a bit.
>> object_new() zeroing is not sufficient.
>
> The only calls to set_snan_bit_is_one() with non-zero arguments I
> see on this patch are during CPU init or reset. How exactly would
> the snan_bit_is_one field change to non-zero during runtime, to
> require zeroing it again on reset?

I meant in general for these float_status flags, not anything
specific to this particular flag.

thanks
-- PMM
