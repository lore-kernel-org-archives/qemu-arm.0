Received: by 10.223.150.237 with SMTP id u100csp3009472wrb;
        Thu, 9 Nov 2017 13:46:31 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SJtSyhFy7p/XA7tJi5ayGw+mY2HUNNk3vlWbOJeoVCbNSxKMNAg7fP2CK/K20wpbz8DpZe
X-Received: by 10.13.242.65 with SMTP id b62mr1374816ywf.307.1510263990996;
        Thu, 09 Nov 2017 13:46:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510263990; cv=none;
        d=google.com; s=arc-20160816;
        b=atqcA1HrW75Uqn+kLEled7wdGkigfbd7v+KpGWjPFo2F++fOHB1CWTC1+E/cBLT6D6
         0DoypEq93KNb7VpJuKspfL6X7d5L2wRDixTTUoiNHotWxUqmVOzASIwb7QyCFCI+f4aP
         Hy/WlSbN0Jfaf16DmUgON7pQmt2j9zx5whdL4IDWSocAvQ9bw2mbzpJuNJr4Igf+jQF6
         q6BuZ4+b1xzUq0j5/DlUQNcvgE5fp+dGms7lNYvbhxZWe/70zw24wOema12MT9XI/AtQ
         Ucc7Ssa8Ld4aeESYo5bfYBXS6QG4VKUNfJhRk9UxT+z0RB1SlbVYeaB1CIVBvFXbLfXW
         O4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=0V3we4VijQQHu3pZq3xyZJIRAZsKQVJMELrecvpLT1I=;
        b=mD90aVoTRXQSH3fjF0RqZILp03EY9Fmrvpc97ooTf8J4BTcXfaoUd0Dhzy3xzQspU6
         eQQiFWDezVnwrxDbD4Yuy07T85rz5DgH8C4RTcZpeNXXuLIk/ACjcd7ggA1r5NhWnhaU
         ZMIfFOXfVb6E89fI0OLx/7bb4BPnhZyYk1FiNdRsAt4RsJuS9ogs9l/EN128TiHDvtqS
         3uie55LtxiPeWYSReG/ZSK4yymkLtu1eMaq7NUw+rJGdZWG3eYtNOuoQXK2xFH35PxGJ
         LNqzFsKhz6HFPHAnDjXI+1nGyMZiHXWx4YfjvZQcsKFsoOa0GlTH2PFHGJ7DFlkGIpU3
         2l4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FxBF7Pch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a71si1809006ywh.94.2017.11.09.13.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 13:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FxBF7Pch;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCuec-0005W5-H2
	for alex.bennee@linaro.org; Thu, 09 Nov 2017 16:46:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCueV-0005Vb-0u
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 16:46:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCueR-0002KF-Nv
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 16:46:23 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:54874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCueR-0002Jp-JI; Thu, 09 Nov 2017 16:46:19 -0500
Received: by mail-qk0-x244.google.com with SMTP id l69so3032652qkl.11;
	Thu, 09 Nov 2017 13:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0V3we4VijQQHu3pZq3xyZJIRAZsKQVJMELrecvpLT1I=;
	b=FxBF7PchyRwH5zJ3m5+oj7ZO+fRp2pCrtLXOx8sjaS8ovfLP0/ebdSEumT5hMJzF1G
	0BEyc4mRy3vW4Ixa8pY7tCxxoRj0WZ7/zwAaTKWabRf4fDYv1LkmQDewuD/zAsHFH7+O
	nikTFbP2+e5XPtCQxCiitPcgD+BmNDOgxCl4heZHFGECMrLYJja2RJl9wNTgLBRYgWW7
	8IBc3qmmO7GD47U8myDWprwVcSHTZfrUISpJhGLlW+nULY5286mklOAH3i0/Bc6F0L8C
	c00ThONqBHmZkdhg/NAm/uJM5m3ioZnV/jyaGGdVtxcQWuPdzdAlOg4BuodLt+/EpYUB
	kGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0V3we4VijQQHu3pZq3xyZJIRAZsKQVJMELrecvpLT1I=;
	b=lL+4OLgh3FvnjRT54D1A1kUlE7v36SEG7hqUI3LJIecymftlUDxQTyCz1iR/Tt3C0P
	K/4YXGFWU7ngu7kXGDzGYbqbdV9z3KkMboJZI4dj+Mc7pw/pvk45WoITrnWbzhpyNWOZ
	xFr0ye5J/LlsyFwQPmZaoGzTdbr0sieCKlOgTcn5Xzq/WxqIerjORgo+sB+k1iG0XbD8
	lbcYDmB6BqHv+RELMpG0+4kaDP8ckBEmZy5PyjJuYgCsUqCns3YXkAoSKcwjPtyiDqkr
	G6vpbpW3O4ff9BwI4XaCcEIs9j8Aue9bKNpsgAPYlNQB5NlQg/TEepJzoVukV+QSPQsb
	Ql9A==
X-Gm-Message-State: AJaThX5uvEVPx1r4k02kDs2hxrjsJd+qX90++lLPjQ7iW5RfwMnd2XOn
	bcFBt9rXuaUvEbLg7cNOkrs=
X-Received: by 10.55.195.142 with SMTP id r14mr3333519qkl.146.1510263978930;
	Thu, 09 Nov 2017 13:46:18 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	j19sm5354886qtk.87.2017.11.09.13.46.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Nov 2017 13:46:18 -0800 (PST)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4beb4e47-0ff9-8251-6502-23824779edbd@amsat.org>
Date: Thu, 9 Nov 2017 18:46:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510228971-6005-1-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu devel PATCH] MAINTAINERS: Add entries for
 Smartfusion2
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMqOdMMlR2sd

Hi Subbaraya,

On 11/09/2017 09:02 AM, Subbaraya Sundeep wrote:
> add voluntarily myself as maintainer for Smartfusion2

You need to share your GnuPG key signed, I couldn't find it using
http://pgp.mit.edu/pks/lookup?search=Subbaraya+Sundeep

from https://wiki.qemu.org/Contribute/SubmitAPullRequest :
All pull requests must be signed. If your key is not already signed by
members of the QEMU community, you should make arrangements to attend a
KeySigningParty (for example at KVM Forum) or make alternative
arrangements to have your key signed by an attendee. Key signing
requires meeting another community member *in person* so please make
appropriate arrangements.

IMHO it would be great you find some time to review some patches
(qemu-arm@nongnu.org is not that verbose):
https://wiki.qemu.org/Contribute/SubmitAPatch#Return_the_favor

> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  MAINTAINERS | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cd4d02..dae08bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -564,6 +564,23 @@ M: Alistair Francis <alistair@alistair23.me>
>  S: Maintained
>  F: hw/arm/netduino2.c
>  
> +MSF2 SoC

SmartFusion2

> +M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> +S: Maintained
> +F: hw/arm/msf2-soc.c
> +F: hw/misc/msf2-sysreg.c
> +F: hw/timer/mss-timer.c
> +F: hw/ssi/mss-spi.c
> +F: include/hw/arm/msf2-soc.h
> +F: include/hw/misc/msf2-sysreg.h
> +F: include/hw/timer/mss-timer.h
> +F: include/hw/ssi/mss-spi.h
> +

Emcraft M2S-FG484

> +MSF2 SOM board
> +M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> +S: Maintained
> +F: hw/arm/msf2-som.c
> +
>  CRIS Machines
>  -------------
>  Axis Dev88

Regards,

Phil.
