Received: by 10.28.173.206 with SMTP id w197csp2103697wme;
        Fri, 12 Jan 2018 09:25:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBosojLW1juw0tXZOd3mVNWoQGSNkZs24fCrn9OLTsb+ds9Y5jm/hySOLwTHcG1aajOTd0jM1
X-Received: by 10.13.230.144 with SMTP id p138mr20066448ywe.154.1515777908672;
        Fri, 12 Jan 2018 09:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515777908; cv=none;
        d=google.com; s=arc-20160816;
        b=MvRyvW2vil/eSeVqgrYKn+gGT1+sd9H+AT6edF7u5FUd4gGMqImnrMLGVuLTUsYnpq
         gJPXxLktp05RqVEA8aVO2qaXnm/e4Ct1+y429NIDVqdUx+Hu7w5GGvwEx4TX3eFEh5iZ
         pJoS3kfkMVUt2K8B3wzGWfdwU61aCfNmHooURDnp+108NLbSr684zmWyucLa3Xppv2iL
         0HPkVt6+oWrxVxoP5TVPq9PE1Ehj2b2d9iF6divr5uNXgEsNus8KbmMpE9iWFJ6IZn7r
         7pJVeWJ2XFkxMgjgcs//ecnZ6xkInp6T02ChaNtNrP37VwdevEQJXcwkIiKecrUQGOXD
         zHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:message-id
         :references:in-reply-to:to:from:date:content-transfer-encoding
         :mime-version:arc-authentication-results;
        bh=vV14FcSaZBuFqo8UkhStY+HST8gf+7nMI5/gpE/GEcQ=;
        b=WTkb0yWYvEWseAZknE2jCtg+AnATw1vRmKM6pfG+Fht9yQgkY0xynSTOCOHlaoSZaH
         7CBHDhTmbk0Wc05hAusxknyhIL/PVk8aqBZEyl/HHA4vT0nIWJya9Dp6Gyck17w2Hf74
         NktFwtvoh/gNOwqcyHiqTiAolWPGIJgGZoX8JxZlSXN3lLZYiMf8+Crnp+n/CTHrA3uU
         plwFsqrqLI/l7N4FgVv+s/nhmTzCPlGPXD/22aEKQsy2NQXmf1q9THiWPJufsTQXUsBQ
         Zo+lH7hnK0YTWpdKvHleyBD8kGelSuD5SYShyGq8CgTY+0K6O1+yJJPp/eNVorZmOdbD
         xz8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si4444824ybj.398.2018.01.12.09.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 09:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea34m-0005ZI-4y
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 12:25:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1ea34f-0005Yl-FF
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 12:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1ea34a-0000Rd-SZ
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 12:25:01 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:51481)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcd@tribudubois.net>)
	id 1ea34a-0000Qf-Lq; Fri, 12 Jan 2018 12:24:56 -0500
Received: from webmail.gandi.net (webmail1-d.mgt.gandi.net [10.58.1.141])
	(Authenticated sender: jcd@tribudubois.net)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPA id B10C9C5A5A;
	Fri, 12 Jan 2018 18:24:53 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 12 Jan 2018 18:24:53 +0100
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9q9tKedxXxMDS3e2jWA8geL2q2pe=Oo3-E8RQ=cD7LFg@mail.gmail.com>
References: <20180110203823.22292-1-jcd@tribudubois.net>
	<CAFEAcA9q9tKedxXxMDS3e2jWA8geL2q2pe=Oo3-E8RQ=cD7LFg@mail.gmail.com>
Message-ID: <8afa9593623a3a77ed6770a9fd07fea7@tribudubois.net>
X-Sender: jcd@tribudubois.net
User-Agent: Roundcube Webmail/1.1.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.70.183.194
Subject: Re: [Qemu-arm] [PATCH] i.MX: Fix FEC/ENET receive funtions
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>, fyleo45@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yFsfEfoTISnX

Le 2018-01-12 18:08, Peter Maydell a écrit :
> On 10 January 2018 at 20:38, Jean-Christophe Dubois 
> <jcd@tribudubois.net> wrote:
>> The actual imx_eth_enable_rx() function is buggy.
>> 
>> It updates s->regs[ENET_RDAR] after calling 
>> qemu_flush_queued_packets().
>> 
>> qemu_flush_queued_packets() is going to call imx_XXX_receive() which 
>> itself
>> is going to call imx_eth_enable_rx().
>> 
>> By updating s->regs[ENET_RDAR] after calling 
>> qemu_flush_queued_packets()
>> we end up updating the register with an outdated value which might
>> lead to disabling the receive function in the i.MX FEC/ENET device.
>> 
>> This patch change the place where the register update is done so that 
>> the
>> register value stays up to date and the receive function can keep
>> running.
>> 
>> Reported-by: Fyleo <fyleo45@gmail.com>
>> Tested-by: Fyleo <fyleo45@gmail.com>
>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> 
> Could you have a look at current QEMU master, please? I think that
> commit b2b012afdd9c has probably fixed this bug. (At any rate it
> has changed that code so that your patch won't apply.)

It seems the patch (imx_fec: Refactor imx_eth_enable_rx()) only renamed 
a variable (from tmp to rx_ring_full) without changing the logic. So I 
don't expect the bug to be fixed in mainline.

I'll rebase and resubmit my patch.

JC


> 
> thanks
> -- PMM

