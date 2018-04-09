Received: by 10.28.71.155 with SMTP id m27csp2566760wmi;
        Mon, 9 Apr 2018 06:38:52 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48uKIGDu08M4r+iPOehLqDhzpaJqhxyzbI7Fg5M7fTo3/Dpzjmzj4E7liXQ/BQVSXcn2Pjo
X-Received: by 10.55.142.196 with SMTP id q187mr48640470qkd.149.1523281132444;
        Mon, 09 Apr 2018 06:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523281132; cv=none;
        d=google.com; s=arc-20160816;
        b=GmoOQ1sQaGktBcF2XHuaZkYAYU9VKdFl2JlX8W4UNFgkeKFrkwfBVEhqPotzSwiCry
         a4chV6mUi7ImQ0EkpZTa9qA0ucCqTxDiEhaFq5Xt/mSySibtlooVnnuc8fgWO5Augz9O
         qRyekjwjXgzYjHkZWMQL4ndjEGW5PVGVo3/2sMuy4pf+VGBOLKh1ORPajOcyry/S5RwW
         iSu1SvGY+p+Uv8McIjwirEBVm/WGunY9CMjKIB7f77yARKGlDKIeE7ih76rhT1C3zQ5U
         ZU19/qzcmIXa4+L7UPY9OE7dln+4T7ZDkQ9j9V6gImsppGq+iAFzrkqf+wArkJQtii/g
         WUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Hsy5jnfGCtjUDF6ZriLxkDgz2DCJH2fV3nwipAlU4Nc=;
        b=iYtIrffUEvJHHlXECLyCMJx0AP/ofkCDgiESHe8FlLMVK8pIbZmlEYXC4SyyaU7zFB
         IYNv/TZaluPAY6ZEsIdqNJEIjF6XUpYFOS9GFsfbXM1Oge3D9IDOvUQ/KOaT/5YrWOb3
         hLXpxXSyBUxVfmsLOAJj3D/hpM0N0hN8Y9Hw47Hw1bsc8Fe8h5Q0sCgCAnyJrDGWrQH9
         3KZaYgaC4FZQn4XkKrF8bA0zyM2GyR6rv1uxArRELmN0JBGllC1Sggsv4EFfdmWho3WR
         4yVEwjtcI3Dve9hTZrl3caBZH0mwfYZ3ZDbVa58lYrPtdPRKJlYtIHuPNL5xsrB2AYaG
         JHxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awmgLY/J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p46si421081qtf.376.2018.04.09.06.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 06:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awmgLY/J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5X0W-0004Ao-0I
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 09:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5X0N-00047J-60
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5X0M-0006fB-A4
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:38:43 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:43299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5X0M-0006eq-4z
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 09:38:42 -0400
Received: by mail-oi0-x242.google.com with SMTP id u84-v6so7608029oie.10
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hsy5jnfGCtjUDF6ZriLxkDgz2DCJH2fV3nwipAlU4Nc=;
	b=awmgLY/JFRFWskuAR7vHOZBJO+6Ovi6Hfoumq+woBHP+dNGeoQmo71H4mjpmAIHcuS
	NyisfrNgSc6xf3P4WUJRE0FnbYHIAvMmVkh7ck1uzFVsrlffj6Gbd1rpslr23t70VzjK
	Yyo9mPPKdFgrxxEmltuGfjfglO9E7sqwWxSh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hsy5jnfGCtjUDF6ZriLxkDgz2DCJH2fV3nwipAlU4Nc=;
	b=qX9GEuM9Q6rsX5yHvSHOsoNebiX0AxdoE70CA7B2ZwdiJMFS967QJMCguuMjpaXLaO
	tnGL6WePWRhsd9fgmKjv1NiLfCh2kZlFW3hSXF12/XVDivq23wryP8FBI71HTzbHjnK/
	fa3/AVOxftFPS042RhBpo0kzw7wNphj5eYNfesaE6R4VIU+EkNv9JGFReVc11NApdxAQ
	jGJPZOvzHTrp0MUl/FbR9YUtQMd2eBqTLEiXjluMgDFKzy9kMqvnJL0cUD6+Lx0VWay7
	qEO8Bl075cHuXRE02bOi/htJCGddqTWafVHJNMzkWWijjE6Ue98ZS7q5lgNLJZxH0inZ
	M0Uw==
X-Gm-Message-State: ALQs6tBkUpEUml5UWoZ8wIp4Wxt8QBN8+QAP1aisrmOMz5ALCNkuGm2F
	peOC3ptSM+IraIKxv3YLKs1LhdMyyWYxEpuJCpgfinfH
X-Received: by 2002:aca:3f55:: with SMTP id
	m82-v6mr22562197oia.252.1523281121233; 
	Mon, 09 Apr 2018 06:38:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 06:38:20 -0700 (PDT)
In-Reply-To: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
References: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Apr 2018 14:38:20 +0100
Message-ID: <CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
To: Ajay Garg <ajaygargnsit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
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
X-TUID: yfQlnY1gDB8U

On 9 April 2018 at 14:35, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> Hi All.
>
> Not sure if this is purely an ARM-related question, but I will be
> grateful if someone could point to some literature that explains what
> difference choosing a  machine makes (when we don't need to have any
> such flag for qemu-system-i386 or qemu-system-x86_64).

Hi; this is a pretty common question, which we talk about on our
wiki page here:
 https://wiki.qemu.org/Documentation/Platforms/ARM

The underlying reason why you need this on Arm but not on x86
is that for x86 every single piece of x86 hardware is pretty
much identical. For Arm (as part of its history in the embedded
space) the general rule is that every board is different.

thanks
-- PMM
