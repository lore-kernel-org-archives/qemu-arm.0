Received: by 10.28.71.27 with SMTP id u27csp2896375wma;
        Mon, 22 Jan 2018 06:59:58 -0800 (PST)
X-Google-Smtp-Source: AH8x225Ajpo01jK3pgJCmHFYbT1PxojNzF87jzZmqrifZ/ZErSdZ0AnpYTNUw9sXhQxNClGlptWL
X-Received: by 10.37.214.76 with SMTP id n73mr7608298ybg.319.1516633198717;
        Mon, 22 Jan 2018 06:59:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516633198; cv=none;
        d=google.com; s=arc-20160816;
        b=iicC2aSRsTqhCENL8KqknpHhak/h1JC0f+4/mPvK8j2wy7HSJtGC+ipHDA1TlUl/X8
         ckpXGt7bNOqGX9qcZAiQ2c6n58YBhaRvZdSgiiHUJCxkOiT6ukY5oSk1/uCkA+xE7JG9
         U9CZhsCgSR3tHmXT5C2yb/i+zHA/0yc+FNpXMf8ryKj1Gp85qO1EIrBXmb5rj9MJTptp
         e29i5cg1MTMrKcw9Mk3422bhs7FWFkBAytnQK3o8l015qoGmqrpZrUOTdBdpyDu1V/de
         0iarLc76kuKO/9+MIydoWyCTAzURPZclHlnTabT6Y6laMb6MylF+t+uboPgHZnvAbSsb
         xb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/dx9euvgmzaT16BeuGxXbcKGt0WWFF25WZ8RgwVMDD0=;
        b=CbQwd8Ymsaam8IaxwsvlHGaj15EbQ/BdN2HDVlnUJmORPkZ7BTnGZ/UqVQZxkj4XMu
         nm8sYJZjwC73yc97UPRkiDDKai7l5DqkCxDJcj1fG6U9JMHXRDg3Guh1q6YiajcsI1/b
         mn7z1U4A5ikUtAe5Y7iIQHN1+FZMcY5gir2IKmR8Gqy5UHQswCofQRfIjGHjZmKl84T1
         NiBh12+vp3kPgI/DDZX8Frnv8ri93zL3NpiLgstks3FbOUrKEsnywfP9/ng3dsL0Zq1T
         XB8qxjyFyZKQDDjg+vUZj8YIPSpeqRuDWzNxDaYcmmnMpBt5p7FgJhTACzBxLMKfsXnv
         c8Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TYAdetdm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k124si982775ywb.556.2018.01.22.06.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 06:59:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TYAdetdm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eddZm-0001Tl-6U
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 09:59:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eddZZ-0001S2-B5
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 09:59:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eddZY-0007hk-HR
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 09:59:45 -0500
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:43534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eddZY-0007hN-Ct
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 09:59:44 -0500
Received: by mail-ot0-x229.google.com with SMTP id p36so7682463otd.10
	for <qemu-arm@nongnu.org>; Mon, 22 Jan 2018 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/dx9euvgmzaT16BeuGxXbcKGt0WWFF25WZ8RgwVMDD0=;
	b=TYAdetdmt10DC0Vm4SyKhL13CmkJix7kvdi/qPT5u7aNqMweHQJLXXaMUA+oowo3Yn
	eyTdTo8OFqzd9GbsVlYb4vThpGuwspHuvQIrnt1FE52f61g2lq0AtJBAIZnAnRSIAjnn
	gqJT8E6qWpcb0vR3vTLXSC27LTk7nVOq+1wIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/dx9euvgmzaT16BeuGxXbcKGt0WWFF25WZ8RgwVMDD0=;
	b=gIoo5Zt6UmyOiMFw58H1X1yxNEUgoAoSMbGxSiYnl+RwkzACz1qynaoo+i3M1N29GD
	8pxLMs/QGqEF2qNU5ZSurz08PJhgmnWS1uVA8ZErhm8Z/zRPT08MqYub1zbWr5087u1R
	kKhV51I6F0ZD4+4Rh0+TfVSk9akOBHr+yHOT4NNRmOQlNGKpUM/hSlWCZmok9eapIMpr
	PROpZveZmoY3M+hdPkFB/GT/rlGb+WETy1/qptuHRYgjHsWRmj8ysJLktsz1cmBWvWaN
	CwsGUyA6ETzM91vePatN3HEOcsEJbNVovoEvkaYkl+L4JLW8ZXQTMKtC4sts6X3mwyKX
	NzyQ==
X-Gm-Message-State: AKwxyte4jJiPTuVcGzsLc6VMHW2x3GkFZWOSzCWfdEg3Z/XoDOROJejm
	SI8LFzqhadFHivwTtVFmh6oFK2WN83x0bHpnbN5Y5eNm
X-Received: by 10.157.73.25 with SMTP id e25mr4359907otf.110.1516633183637;
	Mon, 22 Jan 2018 06:59:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 06:59:23 -0800 (PST)
In-Reply-To: <CAHQ1cqHXHxSH4LxSu0Jjug5hy1FhMYF-O2FtYbjpnm68VjTDpA@mail.gmail.com>
References: <20180113113445.2705-1-jcd@tribudubois.net>
	<CAFEAcA_epX=BOj5sxNVB2z-k3wQ+RRAry=OQi2b=i0d9pJaSeA@mail.gmail.com>
	<CAHQ1cqHXHxSH4LxSu0Jjug5hy1FhMYF-O2FtYbjpnm68VjTDpA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 14:59:23 +0000
Message-ID: <CAFEAcA-XKE=KkOdT62i3VdU=pfQZq7D9KRHNQFjn4Ei_EdpPoQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-arm] [PATCH v2] i.MX: Fix FEC/ENET receive funtions
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
Cc: fyleo45@gmail.com, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ldQlVdtDHhfi

On 22 January 2018 at 14:54, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Mon, Jan 22, 2018 at 3:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 13 January 2018 at 11:34, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>>> The actual imx_eth_enable_rx() function is buggy.
>>>
>>> It updates s->regs[ENET_RDAR] after calling qemu_flush_queued_packets().
>>>
>>> qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
>>> is going to call imx_eth_enable_rx().
>>>
>>> By updating s->regs[ENET_RDAR] after calling qemu_flush_queued_packets()
>>> we end up updating the register with an outdated value which might
>>> lead to disabling the receive function in the i.MX FEC/ENET device.
>>>
>>> This patch change the place where the register update is done so that the
>>> register value stays up to date and the receive function can keep
>>> running.
>>>
>>> Reported-by: Fyleo <fyleo45@gmail.com>
>>> Tested-by: Fyleo  <fyleo45@gmail.com>
>>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>>> ---
>>
>> Andrey, do you have an opinion on this patch, since you've been
>> looking at i.MX code recently?
>>
>
> The rationale makes sense to me and patch looks like a good cleanup in
> general, so FWIW:
>
> Reviewed-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> I also gave it a spin against my i.MX7 changes with doing basic things
> like ping and scp of 1GB file, so I can give my:
>
> Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Thanks; I've applied the patch to target-arm.next.

-- PMM
