Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7134610wrw;
        Thu, 15 Nov 2018 07:21:51 -0800 (PST)
X-Google-Smtp-Source: AJdET5fq2UA4F0P/5U927H0axT4OAfEbvjY2Y9eTfCBkl1huhqV4rYpqQv9VJymjZL1HBHvnTIYy
X-Received: by 2002:a37:be02:: with SMTP id o2mr6434353qkf.133.1542295311440;
        Thu, 15 Nov 2018 07:21:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542295311; cv=none;
        d=google.com; s=arc-20160816;
        b=IfS9GDjV1aAi0c0427dMKEdbSPNh2dQaQYNNwsj25PT2/r6QxUYdxf90UL5wVVAHuW
         wjURSEycQpuuGYhdeGQOw9VZkakbGVLXEj4pfbejac9p6JMCPKqwOQhxCHcbIQv1iYc9
         d41Egi40VQ0JJST+JQ94bEb82uWR/fCKS2XHr/rLu/ibKGUNWzU6bgE3yO2yeJnNuYBu
         dOFCt6qWVOT8e81/2/FxFF8P4RRDahMgMLmjpdrXMThj6mZsxEh+g0ov/zUSl6xpKnXZ
         DdbMmpGQlRW1juHlI8WbUdsUd0ryRem4VBXTYBPrRpR1HKUtSxMCH5f/YpLRsLaP4QJt
         yX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=KSigvam7vr/lIRmX884pX7lR7KEAd1DuhZe/qrU3Ut8=;
        b=hqWGbQS9fvNuoaExcZ2qwjNbIf/xl8jqXxEefqfT0w2nO2W0mwnr8jX/AexAwTuJ9n
         wuQsIo78Oz7aibI2TCr/IKvhGmP0RkrNXRt0XSfxbiYgfnNHWHiMCe0qKm4UD63l7Rp5
         nEGFv0DlZqH/d87H1vBBhKTFLDNf29utCwNyngX0oyGlsJSXeJNFb9Y8KTRpcp/oCVtO
         ZmU5kwuHY1yE6pz269+HVTr1zVKt5pWwj9gY4LaYYhG5fOajwT0bFktBkcs7rwQZnLRn
         o2/P6ISw3HpQ7DDGxS4xHmF1fKzTtrZ4WHG1yA4FX9StIks3wB9l0oDTPi3Mz5O8f62O
         OLzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gvZ44fzu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e127si5857943qka.152.2018.11.15.07.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 07:21:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gvZ44fzu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNJSo-0006og-RH
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 10:21:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNJQc-0005dS-11
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 10:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNJQa-0004Di-UZ
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 10:19:33 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNJQY-0004BC-WE
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 10:19:31 -0500
Received: by mail-oi1-x244.google.com with SMTP id x202so5608776oif.13
	for <qemu-devel@nongnu.org>; Thu, 15 Nov 2018 07:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KSigvam7vr/lIRmX884pX7lR7KEAd1DuhZe/qrU3Ut8=;
	b=gvZ44fzuReb1QSSaEAg8rz1GRPIistqLDVtX62k4mQWE0Tkv2E2lCxjrQLnbN7qQeN
	UMj224Mq9cTO8+STChrkSELyGdMR2npmEGx/DWhoLIvRV+xsBmIZIk7zBb7S1Uzi2HLw
	uwucboNppT6zxPfncUsdXtpgRjdbWqeH6BuV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KSigvam7vr/lIRmX884pX7lR7KEAd1DuhZe/qrU3Ut8=;
	b=Z7cft3YD6hrJnOajIYUTgHUJC6IFbpbYReKc28PtSnwEI+Tz6UxlmG68EDorSoMKZt
	Y5XVVIICFKj0ICiu5odAfbIn3g1snCzVhgOl3Hsbj8VBkz7Zc8fQMDp0vnmiMO1YzJJ0
	w5EGVhUcKtwaQjc7bsJJW3I6roYjpKfynY98IRcinaLNLmSA8PQWI7VeJYI1tEGjh/Hp
	cxzlHaBerW6r6LoFzI4le8FyuzbpWVvWacIw93sO3ZRfkCc/0hJNu0/9Qh1xISsmDZEc
	bkG4riRYFfiCoIUWAEEz+pw7GykenL20MaiO0n3i6gIs+XZhQ2+/DlCdz/OYz2uw/OQq
	1W/w==
X-Gm-Message-State: AGRZ1gJzloIWgdrzG/+WScjd/wFh2bpMt5guRfa0drZZCAwIRBVbQigH
	okfH46QUI2tvqviu+Xp0WWpgmsFd6JcD/kBUcT91BQ==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr3930874oif.25.1542295168087; 
	Thu, 15 Nov 2018 07:19:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 07:19:07
	-0800 (PST)
In-Reply-To: <93d68204-145c-28ce-e6d0-4a67d3c55b00@redhat.com>
References: <1542184999-11145-1-git-send-email-thuth@redhat.com>
	<3ba66e6c-2eeb-2352-252b-75487ad91916@redhat.com>
	<93d68204-145c-28ce-e6d0-4a67d3c55b00@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 15:19:07 +0000
Message-ID: <CAFEAcA9+jNE2sSFMpkbAvTPqEggYi+++FuJ1OQUFB+b+jcNtWQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: Add entries for missing ARM
 boards
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gBgY4gx3/UGu

On 14 November 2018 at 12:00, Thomas Huth <thuth@redhat.com> wrote:
> On 2018-11-14 12:57, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Thomas,
>>
>> On 14/11/18 9:43, Thomas Huth wrote:
>>> Add entries for the boards "mcimx6ul-evk", "mcimx7d-sabre", "raspi2",
>>> "raspi3", "sabrelite", "vexpress-a15", "vexpress-a9" and "virt".
>>> While we're at it, also adjust the "i.MX31" section a little bit,
>>> so that the wildcards there do not match anymore for unrelated files
>>> (e.g. the new hw/misc/imx6ul_ccm.c file).
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   MAINTAINERS | 70
>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>>>   1 file changed, 65 insertions(+), 5 deletions(-)
> [...]
>>> @@ -604,6 +651,12 @@ L: qemu-arm@nongnu.org
>>>   S: Maintained
>>>   F: hw/*/stellaris*
>>>   +Versatile Express
>>> +M: Peter Maydell <peter.maydell@linaro.org>
>>> +L: qemu-arm@nongnu.org
>>> +S: Maintained
>>
>> Shouldn't this be 'Supported?'
>> "Someone is actually paid to look after this."
>
> Not sure whether Peter is paid for looking after the
> Versatile Express board??

It's in the same boat as most of these older boards:
I'll review patches and investigate bug reports, but
I'm not actively working on it.

>>> +F: hw/arm/vexpress.c
>>> +
>>>   Versatile PB
>>>   M: Peter Maydell <peter.maydell@linaro.org>
>>>   L: qemu-arm@nongnu.org
>>> @@ -611,6 +664,13 @@ S: Maintained
>>>   F: hw/*/versatile*
>>>   F: hw/misc/arm_sysctl.c
>>>   +Virt
>>> +M: Peter Maydell <peter.maydell@linaro.org>
>>> +L: qemu-arm@nongnu.org
>>> +S: Maintained
>>
>> This one is certainly 'Supported'.
>
> Maybe ... Peter could you adjust this when picking up the patch?

I don't list myself as Supported for target/arm either,
so it seems a bit odd to use Supported here...

Applied to target-arm.next, thanks.

thanks
-- PMM
