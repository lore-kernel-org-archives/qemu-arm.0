Received: by 10.223.161.27 with SMTP id o27csp2604286wro;
        Thu, 2 Nov 2017 15:03:48 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TKQxplkiF20EMceNKB4Qcy6aJALX2IBP/HHhPNl0k5cgqVMfm9Z34lxlQXf1LdOLdITCRd
X-Received: by 10.37.190.201 with SMTP id k9mr3265900ybm.68.1509660228797;
        Thu, 02 Nov 2017 15:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509660228; cv=none;
        d=google.com; s=arc-20160816;
        b=rBRDzt/PwEeFuuFUfHWJXwX0WEEk1vgcg2dk1T52dvMf0as4M867YqpwS9qTWKM/n3
         BLVQiMBfrBZ9w4NhloBCwo4mqDNXN+7z6jHi0apMEJyZnk2ZwN3wdZYg/mWWggcilVpt
         MFZWylmmtwAK60SLWFFHzIulAAT5kxVZYsXZ1WeAYs4FubRxnO2E9JlfCbAvtZZc1DHN
         1dQ9m/MeJgArrVe0ExqPSaqErGJfY7Dlx1F1zMhHICSOR0zrcRTXZ/b/1PW86SsbiFzD
         xcN2PjY7ns85GxvhZAZrO49CI2RzRZLL1RuXFmIcWhm7WZ3+1UdjiKjaul3YdBft6U3J
         36OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=X3Z+eov/6cLCKQoU5LguHn/ITqQmklfYdabWYXVWZKw=;
        b=mZwj5t8XCbFfTsry9UT7kMpDdubr8HWGOhTy7XXuGzvbOQPYGeszJlyiQdp+I978op
         8zUGGGJj41w1bE04mZHHuVFValQIPukepPMBAf2JAynCaZ1pbRDzatN5qLxmpl+ZadQY
         ClnCmR8lKxDz2ZpMQrwT1QtPlQ3H7cVX10hYexV6Y+Mmytz2sH3Rl274wqkAjS2WSU/3
         Mays1OpdqBKkVGW159bn7+jkpmBY8Sa8hGDMLL6rsjrcJlv4S64/tQe9h1+eN1O2xYp5
         vcp52pLLYh+U8IwREY28Iu0mpfR7cc5vErF+H05RtHoKwnlJqnNCs1QgIFdYNRrY/FZs
         e/Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FfH8oE01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si965357ybm.207.2017.11.02.15.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 15:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FfH8oE01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eANaW-0007VJ-8F
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 18:03:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <domen.puncer@gmail.com>) id 1eAND5-0002zz-NB
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 17:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <domen.puncer@gmail.com>) id 1eAND4-0000AA-Ng
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 17:39:35 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:53652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <domen.puncer@gmail.com>)
	id 1eAND4-00009o-Hc; Thu, 02 Nov 2017 17:39:34 -0400
Received: by mail-pg0-x242.google.com with SMTP id s2so731305pge.10;
	Thu, 02 Nov 2017 14:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=X3Z+eov/6cLCKQoU5LguHn/ITqQmklfYdabWYXVWZKw=;
	b=FfH8oE010h9RyUlXMZ6NWkED9/6tjmtBz2QwGX43OsskRJSca2Yg30qDm/u5gF/Yr5
	qAhPHKQoEAO4+hCzNkGx8JZFlkaU2oKt/cDYb5Ur/hMJwGWSszgaVvJAeXOVjzKqmcmQ
	pP+RBLQn1oftMl9hE5DrPy2/4YiP7Oi8yQUlsMWJkvQArTuPUxkYA4Q1gd+6pCCmqlkT
	JsX2L1E3kmB8oUjK/6vDvZwWdrQOCuH5qooZEdAnjju7oZsUz38GCFkPE+Ush/Dgucv4
	32q1XRuMFflhdVQe1GU0hf+gr8O6PLJZ6wMKFUdwH8BxcBq/chHmnDqsvsaBjq2umh8O
	ydhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=X3Z+eov/6cLCKQoU5LguHn/ITqQmklfYdabWYXVWZKw=;
	b=CXQxcg9nVkCNlvRBOYhT5LUoWkZkUvhPYOwfWoMXhJi+Qe6w0n3KINp5zHa2O1J5M9
	XqKsd0Jw/BPLjynCwMOu2FqApwsb0KAr4V54RqRuROGWKHqj1rTaG7MpjeNIqopn/H7k
	i0iBnOxbEFk9uBaY/gwjhESP4fVgV6/hIyNiUGksFfhnN0NmVlLS/OMoOxixkU3UxWsp
	ARQnUsUfl2NtpnfAgv/mPTfg239a5mavi+3uuwYJStjY5wEesA3mBbwOYSgctjDarSYi
	C7PgfxXXkTtz67frYwFMM3I22EfUOcNsdYM7W8sXA0370l9EnYwgRgj+MngGfsvQMKiI
	5uRw==
X-Gm-Message-State: AMCzsaUjRbJa64OorBAWbv45E3BX/UfYUVUrBD+OgPN039HaibykwAvh
	OrYRSTRy/mw0w5/ty7ABtIgfYKpK0iFnrY9Sao8=
X-Received: by 10.99.99.71 with SMTP id x68mr5076275pgb.334.1509658772950;
	Thu, 02 Nov 2017 14:39:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.164.97 with HTTP; Thu, 2 Nov 2017 14:39:32 -0700 (PDT)
In-Reply-To: <70579e6d-0fb2-c6d8-9541-0eea53272db2@amsat.org>
References: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
	<70579e6d-0fb2-c6d8-9541-0eea53272db2@amsat.org>
From: Domen Puncer Kugler <domen@cba.si>
Date: Thu, 2 Nov 2017 21:39:32 +0000
X-Google-Sender-Auth: VCqp4b7nEbLPHjJQWEScL-cdNSs
Message-ID: <CAB1b2shHRD1RSSMvO+QgwFRQKwMVuj8+hASACNquGNtC3tSgCw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
X-Mailman-Approved-At: Thu, 02 Nov 2017 18:03:37 -0400
Subject: Re: [Qemu-arm] 
	=?utf-8?q?=5BQemu-trivial=5D_=5BPATCH=5D_hw/timer/arm?=
	=?utf-8?q?v7m=5Fsystick=3A_Fix_default_system=5Fclock=5Fscale=2E_R?=
	=?utf-8?q?esolves_SIGFPE_divide_by_zero=2E=EF=BF=BC?=
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Konrad Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+57ZQwhC7ov

On 2 November 2017 at 03:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Please have a look at the Contribute/SubmitAPatch guidelines for QEMU,
> in particular about CC'ing the maintainers so your patch won't get lost:

Apologies for that.
Thanks

>> Netduino platform code does not provide a way to set
>> system_clock_scale, so it remains 0.
>> This causes a divide by zero, when emulated code asks systick for
>> current timer value:
>>     (s->tick - (t + 1)) / systick_scale(s)) + 1;
>> Patch fixes this by providing a default value.
>
> See the thread around this reply:
> http://lists.nongnu.org/archive/html/qemu-devel/2017-06/msg06678.html

I see. Personally, I don't really mind waiting for proper support.
It's a solved problem for me now (SYSTICK_CLKSOURCE =3D 0 [external] for
qemu target), but I suspect it might also bite someone else.
Are there any downsides to the simple fix?

For background:

arm arm v7m says:
[2] R/W CLKSOURCE 0: clock source is (optional) external reference clock
                  1: core clock used for SysTick
                  If no external clock provided, this bit will read as
1 and ignore writes.
// note that the optional case actually works fine with qemu, core
clock case doesn't

stm32 docs say (my target is stm32/netduino2):
The RCC feeds the external clock of the Cortex System Timer (SysTick)
with the AHB clock (HCLK) divided by 8. The SysTick can work either
with this clock or with the Cortex clock (HCLK), configurable in the
SysTick control and status register.
The timer clock frequencies are automatically set by hardware.
