Received: by 10.223.172.38 with SMTP id v35csp417737wrc;
        Thu, 7 Sep 2017 09:07:39 -0700 (PDT)
X-Received: by 10.200.2.6 with SMTP id k6mr4865548qtg.180.1504800442314;
        Thu, 07 Sep 2017 09:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504800442; cv=none;
        d=google.com; s=arc-20160816;
        b=QTxXrw0Eerf1+qJ4w104+Kt5uLxBngzHpyZ1PtoRDokhwofK0QpkJpjgdAc6bFJ7yt
         LmQKTGmiY0cDFCO86TeAf73aRs9fyk2vElpQcIYfJOqu61LE0RAqe8kw+dyHg8pzJSr+
         SkV8TdTApgy2iIAl27uqlisWn+mSwfomKOo93bPtv5uIw8DBHdm+ulU7OcvWuhD/x6iz
         4QP1T2QyIEm8plixvTJzoex7PMkNdI3MAwE1aWdbPn4GKEymSx2jZqBh3DhF0Bjlr0Yc
         0M9rEpi0VmrJI7ifjcpmZbh/Tb4H7EzR3Vjg06yluGe+fJkGlhMwzNasANvEFUGW8kj0
         IaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IMnCZeMkoKR/HYD0U9t+qYG7118DWnPRzbga8PBX8Nc=;
        b=V3bBiToOCNgqS1aIM4NhO8J1soZXt3Je+yJ5GALxLaIIeu3CoqwXqc5QAnpWFZFr8S
         zH0udPTtBGdigLWauhLH/PSbqNkcn+ey2WcBS/6d2ylL8QSQ6dL8e1j9+Zir18LzBV0z
         WarsRY56uK2DE9u9JZdonTaplT4oA9wTyAaI9X4DNFw359Y4VNogCbZq764IlmvQ86hx
         x2mBWcuCTxMYBHwgd9Hs5ZLYBcOo/tgBO51nuprAi4RCroNFD/S/2ifcCBLg/qjjtKvE
         fW7X/EXURo0fHNCogj/6bw3DDBQ/4HnyjBkYr0bRQMkBrev+2qVaVzjHvdQd+FKnN0rT
         cX9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HU5sYOAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d139si45591qkc.41.2017.09.07.09.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:07:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HU5sYOAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzKq-0000nY-0G
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:07:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpzFX-0004jS-M0
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpzFT-0004Ag-37
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:01:51 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:33044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpzFI-00041a-PA; Thu, 07 Sep 2017 12:01:36 -0400
Received: by mail-wr0-x22d.google.com with SMTP id a43so326494wrc.0;
	Thu, 07 Sep 2017 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=IMnCZeMkoKR/HYD0U9t+qYG7118DWnPRzbga8PBX8Nc=;
	b=HU5sYOAfgmbfIoXUD/J8GNIfr+Xs35o9xakou7rOej87RIsDCIRjriAL2w4ELa7bJJ
	mmmVcJ6/RRzsh9gKSrBLBXfmuriaF/erCG+FUFluJXd8Gv7+M6rGgRL3tnPOnii3flnb
	UJhtWFwifzlOoUlninNKfsrXmbCxA0WGumHdSTodqqId8Ah4l4urwN9qprRYas01ot+c
	9z4ACtyAdLluetPQgzNuerh/pUUgo3W1i+ZVIotQ8cU2anrpL+eT7pgSh3s4PTWIdckP
	n4GBSvGKC/qBuJ7ITcXnCBQR5PEqYhM2p+1OD2isnAy/2/xTQzwokTmvSM1cAJ8zjbK8
	uHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=IMnCZeMkoKR/HYD0U9t+qYG7118DWnPRzbga8PBX8Nc=;
	b=nF02K29TbTkWvpDD6aRPZi/5bmHCfcIO4lSqqggiCx5e+8K0IbyCf9LbOERa31EaYZ
	U4krV7h8s7f8w0BOyu8eA4Q8BaPZ2mx7pA3ft0y/afCNKDyuUFEgGnNTD75m+4asRmy3
	iUqt3569N7kDF746Ikkq6aajpvAwyAzjUbf+7NC6sU1HXo8+O5ESZtG5k3hJkijEJEBa
	Aczoi0EFuguGMZy0TSznSfak9SqJmVPzY8RD2gNpJh1j1cBCwjZkjFxfp8KT1KiOeyEx
	aaiyz667x2+dUxQfjf8pgypr44C4yk0a/CyklKFs9s0YRVSJqz4Qu4ziw/w5R+MV5LQ3
	2xTA==
X-Gm-Message-State: AHPjjUhVBq45SyIYKfCe0Nte3HC/PfnXe6YeMOPcrWwmR9Qp40N0RToh
	QjAcAHRC8Y+xKfj0tFl8v8UZ8BH6Ig==
X-Google-Smtp-Source: ADKCNb6MG7YY2cyxjsTf/rZepozN+2p9dV4cYKCEErKGd7Cp1ZwrGXdLbTGPX0d9tfN0UMEVCrH3sVAJQcIneiFlTdQ=
X-Received: by 10.223.136.205 with SMTP id g13mr2315359wrg.318.1504800095476; 
	Thu, 07 Sep 2017 09:01:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 7 Sep 2017 09:01:04 -0700 (PDT)
In-Reply-To: <CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 7 Sep 2017 09:01:04 -0700
X-Google-Sender-Auth: BS5S5ku9SQnKOUCLlHmITYMpjes
Message-ID: <CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH v2 0/5] Expose the secure and virt properties
 to the
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XTIfZtJz+NV

On Thu, Sep 7, 2017 at 5:51 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 September 2017 at 00:34, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>>
>> The EL2 and EL3 work is working well now and interanlly we now have
>> tests that expect to start in EL3 and transition through EL2 to EL1. To
>> make this easy to run let's expose the secure property to the machine
>> and also add a virt property that can enable EL2.
>>
>> This series also does some machine/name tidying up and makes the first
>> move to deprecating the EP108 machine, which was just an early access
>> development board.
>>
>> V2:
>>  - Add a virt option for setting EL2
>
> It looks like only patches 4 5 and the cover letter got through the
> mailing list server, so patches and patchwork don't have the whole
> thing. Could I ask you to try a resend?

Just re-sent now. Hopefully it works this time.

Thanks,
Alistair

>
> thanks
> -- PMM
