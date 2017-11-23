Received: by 10.223.159.82 with SMTP id f18csp526537wrg;
        Thu, 23 Nov 2017 01:51:34 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYvIy6eAZVpvsJYjuy1nCmTMbNI6OJMIRA20tngTdevuxW3t8wS4VVKxqxO3voBjdBNg0Tm
X-Received: by 10.37.221.2 with SMTP id u2mr14467476ybg.108.1511430694285;
        Thu, 23 Nov 2017 01:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511430694; cv=none;
        d=google.com; s=arc-20160816;
        b=oMZnjoQclfMG1ZKHViFcWT94Q62jqv7HZ3xSeDbv4mjHnxjooZh5odG9bLDvZJkZW0
         93VtekRbbtUicYIXHscUOy6dp52hCOetqCWyIJkIsvP/g2+LF/N4bAU/YyoGATTh8SW7
         Dfv0tWL1vuPoUvdj2HdpX2oLpLtuYpMorF4i48WNp5ml+2q9E5RcyWt8x5WWt9I3d23a
         7Rw4mlmwjrKzTXyzknRuSZCc7Me+zBy5mf6OIXe6vPNg4Ks9vvH+ob8NfaE8E1P4pPK7
         at1rfY852cwleqZBZxRCVGfbSiWLyNkRzzKTMJIg6P8iIC0tXUXvI6q2QhWG3ZI1AcTm
         bS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=unVrbaOlL80FveF5eJWKP1xWNxNsCNeSuOMF8+la6q8=;
        b=fdk9kz4MoU2aGdGxVBdg8acosqIboCadnUcNuA7nCOyMCdcf4BP0vhctrnBrS6p9bj
         oGR7tucVUsZ66o1sQ5nDvipdok9jy8QorucZ0r+YWgwSmA5txBbqZb4feorh2wJ3Pozo
         4zjqzxINDB6hjWJ/W8X9luLjmlS5pPSIyOawWNMlirdxMyIe1Yvq+EPYzAtbtlZpBPoC
         D+Eiycv6JlP0tYzmh32OwrImr8Xce6rkPk5XCHxBldPWMyX9wNL2PfArp0hSaXmjPspu
         Y4lsXD6ZXpbW4VEamtSaRdpAaXjrOJX17Tr0+n0BHkmMG4WeMb3/Y9SppV90z7ALtdue
         Y5Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e/fm2OuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16si439553ybk.724.2017.11.23.01.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 01:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e/fm2OuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHoAP-0003oQ-OZ
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 04:51:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHoA8-0003nq-SI
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 04:51:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHoA7-0007kY-Ln
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 04:51:16 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:45393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHoA7-0007j7-Gn
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 04:51:15 -0500
Received: by mail-ot0-x241.google.com with SMTP id u10so15855239otc.12
	for <qemu-arm@nongnu.org>; Thu, 23 Nov 2017 01:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=unVrbaOlL80FveF5eJWKP1xWNxNsCNeSuOMF8+la6q8=;
	b=e/fm2OuOQn04hyk5rNc8MAY03TMaQUyAlQ6VlchN8OArvXplsxnletwmXiMdYD+VgX
	iuut7D9hBk1zM2+WMhebCjm8iZHZXgAlFLgeNIsz8J2hgtB01GWrV+KBNcdt00+0q9LW
	Kmg4xGCyMW7rlqKBTfLsDdRSxm7uQwgCRheiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=unVrbaOlL80FveF5eJWKP1xWNxNsCNeSuOMF8+la6q8=;
	b=DGjYOjvFsmsjL7/HYowlDtaMxKl/+sknenW5x5ZKo7UYp/JGiZSrhA7KuYV2I3dPuv
	8AnztNEtH2ja98wUx6AL6OjwnFiiVSm8ZfJu6n7iCQc9qBwRK/mkB9tv7Abl7PLmDD1J
	dlkOZqG3fcu/RPmcfHHl09vODUf6kODDMEWlZ+TWBrW8nm343xNgI2YfAfai1WNMw65f
	FzoXWZ2zXzxkdk5eNDcdDNli59SvWfyh8rWvkBIaeuuFOZaqv0tbG3PAxQmshRQBA2lT
	v84XpHb46RtgeWO0vQkfO8Gclj44jL+Z93LIZMKrmDFMRWjONmjhG73/Og3x9dy6+KDE
	YRIw==
X-Gm-Message-State: AJaThX5fPFMxaR3Rj1OyAVf6sixtTwY41avr9qrf0nFeu5W1oiASi825
	dn+6DW+p+vCycEj+HRrLET7tnmc3iFL0i80f3yP94w==
X-Received: by 10.157.80.24 with SMTP id a24mr14823266oth.335.1511430674466;
	Thu, 23 Nov 2017 01:51:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 23 Nov 2017 01:50:54 -0800 (PST)
In-Reply-To: <CAHQ1cqEW202FqhrNpXOvWTT9s-H-ZGrmdAFTeynRc6VnOia6Uw@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-5-andrew.smirnov@gmail.com>
	<CAFEAcA9EhzPxayCGDOiM_6U9YSS6HK1gCgBroR=C1LM=H=FpQw@mail.gmail.com>
	<CAHQ1cqEW202FqhrNpXOvWTT9s-H-ZGrmdAFTeynRc6VnOia6Uw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Nov 2017 09:50:54 +0000
Message-ID: <CAFEAcA8UAD34yhcEAzkJ2xsop-UUntXJAREYREgFA7Pz5CMh6Q@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v3 04/30] imx_fec: Use ENET_FTRL to determine
 truncation length
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RftvrlNmkFc5

On 22 November 2017 at 20:22, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> On Tue, Nov 21, 2017 at 9:31 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>>> Frame truncation length, TRUNC_FL, is determined by the contents of
>>> ENET_FTRL register, so convert the code to use it instead of a
>>> hardcoded constant.
>>>
>>> To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
>>> increase the value of the latter to its theoretical maximum of 16K.

>>>
>>> +#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
>>
>> This means we now have functions with 16K local array
>> variables on the stack, which seems like a bad idea.
>>
>
> Can't say I see a big difference between having a 2K vs 16K buffer on
> the stack, but regardless, I am not quite clear if you are not too hot
> about this patch and want me to drop it (I am fine with it) or do you
> want me to modify it to have the emulation layer allocate said 16K
> buffer on the heap instead of a stack?

To be clearer: 16K is too large a buffer to have on the stack;
2K is about as big as you want to go.
If you want to allow 16K packets then you need to avoid having
on-stack arrays of that length. (But you don't want to do a
heap allocation for every function call either.)

"look for and fix functions with arrays of 16K or more" is one
of our bite-sized-tasks for people who want to fix bugs:
https://wiki.qemu.org/Contribute/BiteSizedTasks#Large_frames

thanks
-- PMM
