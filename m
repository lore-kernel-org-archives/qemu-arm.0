Received: by 10.223.197.9 with SMTP id q9csp2660974wrf;
        Mon, 9 Oct 2017 10:09:11 -0700 (PDT)
X-Received: by 10.200.1.30 with SMTP id e30mr14688117qtg.232.1507568950912;
        Mon, 09 Oct 2017 10:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507568950; cv=none;
        d=google.com; s=arc-20160816;
        b=ICVEStt8FUzWchvczohUmUZF3b5w90puAGAA4hJp41GZjliyhvEbQq/MsULOihYcHx
         r/y+sshxRpHMujK4mH9xZID3/omLHX/Gtsi0rVEhV71Trj9ki0Coy73Z/WJXcDRD3qS0
         euJ8ldhX3qWGE246T+uLlUz2ox+3WdUF0BWfDhNzu/Ss6Nt64qNEuXpTqQS/5fx/ijcq
         xe54beJONHvaYf021gBlvm6DZYjNUgnRuJPJIno5DYuWSQ69aC/qke8SEQjyhYIDhhwX
         jllrDLLKfwPGRUZ/pLL81aSJ1stRVKnFPq5CNNHzYigCUTL9rJE0pSlOs+52QAtKmJNP
         ZLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xD84FYkK3VMy+K9cqWFNHtsgbfyIWBXQmSzPTainI38=;
        b=s5z24kDnm6D+Vvh/9FXTI2yrfxRwGObtToNfyfmOSHzdW0xTMFN0UNuDRbwNJ20LXT
         gSpIc6imXw2D3rFSA3hBIPaoRZmBZK2bFk7AjNH2XhvrZ2F9QpE6ZiJ6iOMepFJ9Yx2N
         N0zL7LI8AYIqqqy4RxdRw8ykOrgC6+J60vuYMFxAoO/5oXZSEtDZMyOt2NRmh8sTWHss
         9jTByOe8VCNYPP658xMe97UGYFiJmUcmgnPazNf21wmOEMgdyI6ymCAWk2HFX1RNKrTF
         0cn9wHl8kSZ1Ej5CcH/7thZPgdtzMIlV+D9KOnD4vyYgC9lQMKV7iGGuiz/Gq0QsbyeD
         GKiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GOUEj8KY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si306036qkr.279.2017.10.09.10.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GOUEj8KY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1bYD-0002Te-IL
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bVX-0000mb-3a
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:06:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1bVW-0001vf-3h
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:06:23 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:45379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1bVV-0001v4-Tk
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 13:06:22 -0400
Received: by mail-wm0-x235.google.com with SMTP id q124so24436535wmb.0
	for <qemu-devel@nongnu.org>; Mon, 09 Oct 2017 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xD84FYkK3VMy+K9cqWFNHtsgbfyIWBXQmSzPTainI38=;
	b=GOUEj8KY7f0o/ZVDpJtMjfMuWXjHLLg8SO4uUwmsI85TMaJF4k5sjKUtVP8o5Enrom
	hfjgvvgDwiXl96Q4sXqB2TaMGDr7pJhErTySQ5Bx7NktxUzVPxCBb/jyvShAvZGETxiJ
	oc2xl26U0HUmZb5tVeNIj/zxNdkKkEH74CuYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xD84FYkK3VMy+K9cqWFNHtsgbfyIWBXQmSzPTainI38=;
	b=dz9FZpjK2HxlufoP9ZIPQNx7GehbaPkdq+wHw0wppNV3kHNbDR0nZnI3ktSoY+aXqW
	qVJQvvrvf+vGWm7/60/SuiVQ2k+pK148VG9x0zc2eSyScA9wslIKraosaBhydowZhQUv
	cVWruqKXUxQHUfzD3BtY7XiOPAmI+8b84P0xZhq+OOi2BMwXddu/Jzv9NViRoNM4xiyM
	4pQ2aAPy77fZ3u3LtMqTUvhuFNfm3c+6MflKL0isLFhIREcarZBQ2Usc9kTGMELuT5IC
	6rsuV8EdEj3YRi+/isK6dDfJpPlND20yGk13Y4rjZHuIlxQARZtUxgZhkTFT/ES72LKq
	H1Kw==
X-Gm-Message-State: AMCzsaXRlI1Ndwfyt+kGXnog8/7av3Hf6xcC7Qo5glXxzXBBBGWyE3pO
	SwR2MR9IpHXFB0IkDsXgJEcvUjyYQAuyKuNck7cXXA==
X-Google-Smtp-Source: AOwi7QC0otjggRPLC3Sf4mLX+EoCCNSDgTDJB2nI39KgQTSrAavVO1d2qR1HrLMnrPoq92q5z4Mf2Ol6+OAlFvrA8pM=
X-Received: by 10.223.186.201 with SMTP id w9mr9846960wrg.230.1507568780850;
	Mon, 09 Oct 2017 10:06:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:06:00 -0700 (PDT)
In-Reply-To: <CAHQ1cqFdjYgj9s2yz_LUv=uheK5Yy0YQ9o-3McLopAFqeVx43Q@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-9-andrew.smirnov@gmail.com>
	<CAFEAcA_5Yt4a3gE8pHAdE9RnY-SZoucMkt8CParasA1YQxKUfg@mail.gmail.com>
	<CAHQ1cqFdjYgj9s2yz_LUv=uheK5Yy0YQ9o-3McLopAFqeVx43Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:06:00 +0100
Message-ID: <CAFEAcA-DbWn2JcDuWOW-o5ov2uV1Kr_bHGpt5Q6Vi7PhEXn1tA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-devel] [PATCH 08/17] imx_fec: Add support for multiple Tx
 DMA rings
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZxriKi9DWo2

On 9 October 2017 at 16:38, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Fri, Oct 6, 2017 at 7:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>>> More recent version of the IP block support more than one Tx DMA ring,
>>> so add the code implementing that feature.
>>>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: qemu-devel@nongnu.org
>>> Cc: qemu-arm@nongnu.org
>>> Cc: yurovsky@gmail.com
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>
>> I'm surprised this doesn't mean "we have a property on the device
>> to indicate what IP version it is, which the boards set". Or are
>> all our current boards mismodelling their ethernet devices with the
>> wrong number of TX rings ?
>>
>
> As far as I know the only already emulated SoC that this affects is
> i.MX6, and, no, it doesn't mismodel its Ethernet device since it has
> version of the IP block with only one Tx ring. I didn't add any notion
> of versioning because it didn't seem necessary, since 3-ring IP block
> should be backwards compatible with 1-ring version and host drivers
> written for the latter will end up using only ring #1 of the 3-ring
> block.

It is guest visible if the guest looks for it, though, so I think
we should have a device property to set the number of Tx rings
(or to set the version number of the IP if that's in a guest
visible register and a more useful way to model it) so we can
get it right for both boards.

thanks
-- PMM
