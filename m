Received: by 10.25.208.211 with SMTP id h202csp1747254lfg;
        Mon, 7 Mar 2016 21:48:25 -0800 (PST)
X-Received: by 10.140.225.6 with SMTP id v6mr35730253qhb.0.1457416105786;
        Mon, 07 Mar 2016 21:48:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u142si1474069qka.40.2016.03.07.21.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 21:48:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adAVN-0003HW-CZ
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 00:48:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adAVK-0003Gj-LZ
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adAVJ-00004q-Fw
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:48:22 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adAVJ-0008WE-AO
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 00:48:21 -0500
Received: by mail-vk0-x233.google.com with SMTP id c3so5475194vkb.3
	for <qemu-arm@nongnu.org>; Mon, 07 Mar 2016 21:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KzJ6upCZxIzW9TUVxSTgG6E4+q/45v7l/AUHPnojdus=;
	b=GrFpyCs4E7zX6dOAF9bTaipVcskINBctXqCg/2Fc9dnZxbp8j8uEQ68zaeuc3n5wI5
	Kjnz1vHtCJP6cDr7UwTAXMEE5dLtHK11xj6MKBOeGb5YC4tBlwauounC38fLnbrRakvz
	1/nyOFS0JIaPeFXu/ag09dPs12HW445nwzWe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KzJ6upCZxIzW9TUVxSTgG6E4+q/45v7l/AUHPnojdus=;
	b=PQZVrqUpcz1rrgfnQsqwc6k5nnSSDIDRB/4WSlOV2KufHk2OXdcVCUGZmJoST57nXT
	fdK2IHXiwiCOPDK6Ba02jQcvGBI7gtCM/b9Ep4Ki64HfX6j8OW+dsmbgcovSQ5edprJu
	3G2nawGoLm8BMHbI0+xsyq8/edHwqj7nO04YsBZq5AIUY5rTrn5FATn5AUotosGBFBx4
	Kioo55hsuLSbu/G8fnXGcuKUXJqZy0lw2Db0hofKTlHxXID/FUNMWDpUMgA24g778T29
	+5UjKM9TGlW1qGTM8jlkiqTuP+Zb7f1SFnLYJiAGjXiDCmvyFNTHnMG2v5VRVtQR65tg
	84Cg==
X-Gm-Message-State: AD7BkJJpkAHaeNCLO167E/jnaWhuuPubi52pg3HvRQTBw4rl5zQkC4IxlBH4UIWMGnNcXcyM8Uk996/DLgqXVTNm
X-Received: by 10.31.8.17 with SMTP id 17mr15128450vki.139.1457416099762; Mon,
	07 Mar 2016 21:48:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 7 Mar 2016 21:48:00 -0800 (PST)
In-Reply-To: <BLUPR0301MB20341C3A71E6E599BFBF133D9EB20@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1457029479-11312-6-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA_PVUJwc0t3a68wt2HC9xs6SVt5qN4uCTXPz6yzXi9E1w@mail.gmail.com>
	<BLUPR0301MB20341C3A71E6E599BFBF133D9EB20@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 12:48:00 +0700
Message-ID: <CAFEAcA-8pMLbvfSesWPNUmT+ARtL2wq-3gU_U7REhaQeyQTeTw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 5/5] bcm2835_dma: add emulation of
	Raspberry Pi DMA controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lMIkmG2x+g7t

On 8 March 2016 at 12:23, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> Sent: Monday, 7 March 2016 8:37 PM
>>
>> On 4 March 2016 at 01:24, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> > At present, all DMA transfers complete inline (so a looping descriptor
>> > queue will lock up the device). We also do not model pause/abort,
>> > arbitrarion/priority, or debug features.
>> >
>> > Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
>> > ---
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Can you add Gregory's Signed-off-by (and authorship from?) to whichever
>> patches are appropriate when you resend (as per discussion on the
>> earlier version of this patch)?
>
> Yes, happily. But what's the best way to capture this when the code we're
> committing is a mixture of code from Gregory and Stefan (via a manual patch
> into Stefan's ar7 repo, so much of that history is lost to me) that I've
> then extended and refactored? I know what I added (e.g. aux), but for the
> files with joint authorship (fb, dma) should we just put Gregory as the
> author on those patches with a signed-off-by from me? Can I also add a
> signed-off-by on behalf of Gregory, or does he need to do it?

Gregory said an s-o-by from him was OK in the mail thread, so that's
sufficient for you to be able to add it.

The usual approach for multiple authors is that you have the author
be the original or major author, and then the signed-off-by section
looks like:
 Signed-off-by: Original Author <o.author@wherever.org>
 [XYZ: changed foo, bar, baz]
 Signed-off-by: XY Zed <xyz@other.org>

which preserves credit for the original author's work and also a
record of what changes have been made by the next person in the
chain.

If you search in 'git log' for "[PMM" you'll find a bunch of examples
of when I've done it in the past, eg commit f0c02d15b57da6.

(Overall there are two aspects to the signoff lines:
 a: the legal aspect, where you're agreeing to the stuff in the
 Developer's Certificate of Origin; one of the options in there
 is "this code is under an acceptable license that allows me to
 contribute it", so taking some out-of-tree open source code from
 somebody else, fixing it up and sending it in with just your
 signoff is perfectly fine from the strict legal/traceability
 point of view.

 b: credit for work done. This is a social/interpersonal question,
 so there aren't any hard and fast rules, but generally I find the
 best approach is to ask the original authors for their preferences[*],
 let them know in advance about what you're planning and err on
 the side of giving them authorship and other credit rather than
 yourself, while also being clear about what you've done that they
 should not be blamed for.
 [*] Occasionally somebody actually prefers not to be credited
 via signoff because they feel they're now a long way removed from
 what it was.
)

thanks
-- PMM
