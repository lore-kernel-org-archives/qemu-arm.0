Received: by 10.28.71.155 with SMTP id m27csp2591354wmi;
        Mon, 9 Apr 2018 07:02:41 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+mhI3fjZuI8jm/EmUuex/oASvFLIJ+RUWEmE1K+Q0f0MUytvJprzbLMbadgIEyu8YVSkZs
X-Received: by 2002:a9d:4c04:: with SMTP id l4-v6mr15899205otf.242.1523282561515;
        Mon, 09 Apr 2018 07:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523282561; cv=none;
        d=google.com; s=arc-20160816;
        b=UM57lnpgd4ebpZIh9+GKIn9sp/ibRYQ7CuCeS7y9LYUeNWNBO1TGVGT+GfOyHb1Ktx
         I85YQMhhih+9cASaxniLFG824xMevk1CbD9S9pjsHIsqWDGx1prMfsqMDs6oT6TNHDZb
         Is5vc6/PuQ+PHHFS+KV7Y3Vu+Biyx74We/tE/0mE68GdPrYu73lrxe8k0s95q9vs/u5H
         qOA9lxuTLo59tX8EL5SOPRdxIt7SG2BsINaXqjp05GA2bVfC0i9vx59xnsZvNVWx4bVh
         IJqbXtpHeTHAITKnE5XtG6wyClPeobfFO4NiAwEZ7hzXFvb8PWhnEU7TA6TU9XnUtr0V
         BP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZVfavDaxHWCEera2z4ARGEXHMnYdEh27Wu14WVXpNhY=;
        b=ljJW6XJ59Q8leYfXVi9Y1AaqbDF6VPs1h985+RL71FV+OAzGEw9rCkiMyN4F0zcN0h
         VZ16FbNGZwKmBTxHMNCGPcrGzElxn9zs5DIUQdtvoZGRIwQd7zLMx2uIj92g99yC6WB8
         wQdgyorFe7UTDJY1FisClkGaQuoYfPl1x7WXPWd/qYU/0LzSHm+GIBrM3NDpUqtEsaMd
         dw1uSsTzDmEXfzp8elGFhMOBFbebpV478BSem3ZP+ryH4wftTQqLzQY/fuZc6tMw64KO
         LbXJW76558lOr5p45CGYMiwSA91qGxI3sTJew/4UmmsIZCtu89qy8DdAc5yD1Fg+PTLK
         uJQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TbCZbvtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y58si466277qta.401.2018.04.09.07.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 07:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TbCZbvtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5XNZ-0006pN-0W
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 10:02:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5XNF-0006jc-3Q
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5XN7-0008FH-DS
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:02:21 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35933)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5XN7-0008Ez-8T
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:02:13 -0400
Received: by mail-oi0-x243.google.com with SMTP id t16-v6so7682429oih.3
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZVfavDaxHWCEera2z4ARGEXHMnYdEh27Wu14WVXpNhY=;
	b=TbCZbvtxVFNSIX9n3Yc0k+yEtqlLRDKZ/TPW80Z3GLR4A+7aDyUQwL39CcH21ZTqg1
	jjgrNoadGGWtRUBiuXdscB/Dg6XByyrZRLAuhhAQukLVu0xdQv+BzcnYMoa/oOx4svU7
	JtPhkJ6YF7MY4gDLwyOfmChtLZGtj1bJsF6qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZVfavDaxHWCEera2z4ARGEXHMnYdEh27Wu14WVXpNhY=;
	b=Jpg7CaeKBsK+je/yeLC7uyHYJKyCnlMJnW4b9NkGjsIMbt3ontX6OsMDXvNKeFNQR9
	zbPHfj1pKrgxy3JPmsYSctTsJRrxZ4Hoa8xYU/g9vN3TJpyz/LS5kBqSWJ26hz43/hoz
	1W4GL+JPi9Mnt3UZVfdN5dTNkvHgg2InHJE7KrZwDI9dxvAAENGcvZDpNahfo+lvnppx
	2AANUUGRTXZYczJYH3yax5WnrBZtDlAU8DZ2gjRwCRrpFWtlBQWASgx1Ej7zBSvMmguf
	FV7gYKM9HyLndiA3hKZ7SZ8wLiZMI03v0iRPYluL3Vgw6msW97CEy8vD3w0EUTGSJeKU
	OaDw==
X-Gm-Message-State: ALQs6tBB+MxTN1CmmtmdHHTg5cXdpIcNIZJtJI5ult06vaLM0Ww/+k1+
	48pMiz8uNvevcMHaZSi+u13gE2rGmQMC7ixabPHSXg==
X-Received: by 2002:aca:1c7:: with SMTP id
	190-v6mr23135386oib.80.1523282532284; 
	Mon, 09 Apr 2018 07:02:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 07:01:51 -0700 (PDT)
In-Reply-To: <CAHP4M8X-Dus1Z8UegDTaab5LvaiDAgQa8upsx_KdnPO+A-XoTQ@mail.gmail.com>
References: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
	<CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
	<CAHP4M8X-Dus1Z8UegDTaab5LvaiDAgQa8upsx_KdnPO+A-XoTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Apr 2018 15:01:51 +0100
Message-ID: <CAFEAcA_1X1AQ6j9pZQ8fEHmQCxRNK7EhGkohuLbTMpoPONe5PA@mail.gmail.com>
To: Ajay Garg <ajaygargnsit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] Use of -machine when running via qemu-system-arm
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TMA0ZDsRsBEf

On 9 April 2018 at 14:43, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 7:08 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 9 April 2018 at 14:35, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>>> Hi All.
>>>
>>> Not sure if this is purely an ARM-related question, but I will be
>>> grateful if someone could point to some literature that explains what
>>> difference choosing a  machine makes (when we don't need to have any
>>> such flag for qemu-system-i386 or qemu-system-x86_64).
>>
>> Hi; this is a pretty common question, which we talk about on our
>> wiki page here:
>>  https://wiki.qemu.org/Documentation/Platforms/ARM
>
> Yep, had already been through it :)
>
>>
>> The underlying reason why you need this on Arm but not on x86
>> is that for x86 every single piece of x86 hardware is pretty
>> much identical. For Arm (as part of its history in the embedded
>> space) the general rule is that every board is different.
>
> Yep, perhaps I am needing a more layman-kinda example-cum-explanation
> for this, so would be grateful for some help in this regard.

Well, the wiki text is the best explanation I have; perhaps
you could suggest what part of it is confusing, and we could
improve it?

thanks
-- PMM
