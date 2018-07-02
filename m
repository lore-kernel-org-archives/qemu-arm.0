Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp149564wrq;
        Mon, 2 Jul 2018 11:06:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfC7Eiky2nFZLKKsk1aVQ4i3AVFRKSssW0hBR661Pys+ybaIn3Oqdpu6yVHTH5qSpQoz0dn
X-Received: by 2002:ac8:100c:: with SMTP id z12-v6mr23064526qti.394.1530554812203;
        Mon, 02 Jul 2018 11:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530554812; cv=none;
        d=google.com; s=arc-20160816;
        b=CkALHJYt/lbODJlhmXkLvAyNenRJlk5ygu4CgS4YjEvxttxP9y8ucH5EF0x97/tXif
         wugqJE+jnQ2uy7zv9o/8XXBMWf/qbCn1XS/2aQTathArgByavnemZsLKk3UufzIY3+cH
         oCX3zDbbDY3sFWVcFeuRINqrU/GCok0AwC61p9+zoPzPLQI+dnqHtn0DCGT8lLrv6EAD
         HrvP0WVRBgJoN0J0rcfIYx7JfbY2/FZnkv0jizO+tFeCl1L2UUMwZMFCpltP51Olblkx
         BESHkNKjhk8uQ9zetuEqHQWQdvqY0+bxRlSXw+wwrD+qJWveOksXesnXchGujVmy/Xgc
         1kWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=a1fZXJP7q76wZpdQypX9Z18n+rfm5k0kU4Tfdolm5MI=;
        b=S2SOODBTbutZc+pqg1DNzgiDneUJV1kH2/Fnf+tqTzW6lXOAm6v/xfITcCRtV2UlmP
         QZXU6oXUQGgkJtNjA9iHtTTxbQ7hdOBA6HiT7stIbvt+OAeHoeXMVz6SuCjMLEi4nK0d
         3/8XGdgpWxPl8ZNv0Hk/EU45cK+/a3dnHMg+Ac4sE1uzZ6OZeP4CbNc6Gnr4mYmJe69a
         Y5euXEfM28gszdIBm9nmzHZObh2K0BEC6/y6uw/s5yGyF5ldUJogiS3VfqQyJqA2Z6zS
         cig074gnkOTzbb05uo4y73Sc7IsUx7phDkqnUk4wrHA+H9rIRJDI39qmnxNkPgY8Uwko
         YqKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hox3EGvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id g10-v6si11816655qvo.110.2018.07.02.11.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 11:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hox3EGvV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa3Dv-0005Hg-KB
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 14:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa3Dk-0005Fn-Ii
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 14:06:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fa3Dj-0006qX-C3
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 14:06:40 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:37533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fa3Dj-0006q0-2u
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 14:06:39 -0400
Received: by mail-oi0-x243.google.com with SMTP id k81-v6so18052020oib.4
	for <qemu-arm@nongnu.org>; Mon, 02 Jul 2018 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a1fZXJP7q76wZpdQypX9Z18n+rfm5k0kU4Tfdolm5MI=;
	b=Hox3EGvVWZgfPoQjclzZZjG7aMyyr/uguYswd0g53lE1WEGntR10nTTtgvfigZq5Q2
	T5qUq/Il/GThlMXXfZ6eK9DQQj8SR4NvNxNLOFwiR9TKSStUVvI+6Z5V+30kdJMqhAix
	VdoO3bjjN1ajihhiBueW7C9zq/xO/xxBSpiv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a1fZXJP7q76wZpdQypX9Z18n+rfm5k0kU4Tfdolm5MI=;
	b=tlThWAcKz0s5vGiPSbBKH8zZ3i1z9ddyogXa3QJSas5fmPXehD+54Yd9yE10AfFykl
	aQZUX0z2aoIkQgEbCgTOO+K/Nb62MnHkXxVnf8esmEKtbvrxwzEf+HyuGrjVZcaz+M7V
	yxBqGruEG3W999KoZVKMCTjN0JTtemd38AYIJiT9yce4yXOe58qryRAq1TOw+u+29EAw
	CzjMDDDJeFGz41lGUC9mkZ8jKu8Ds8qSNQcHhvvi9sAis/2keHO9b7EqO5429WaavDT9
	bXE+gUOSeGgKikMbwlqzQnbzobdblazwUJQe7p+3egDfoVoXz0CyFqII5UjPEb+h4bql
	ZqoA==
X-Gm-Message-State: APt69E31RLoUyhbHxQfA9dwam8X6qg55PcrA78rdK2zCT4rxUZ3cVnyz
	b8DolcfWepRSj/N1mgQZ3Ux1mM2Q2gfwUVmqDRC0unyP
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr9781565oig.13.1530554798350; 
	Mon, 02 Jul 2018 11:06:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Mon, 2 Jul 2018 11:06:17 -0700 (PDT)
In-Reply-To: <20180702175740.GA14904@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
	<20180626175900.GA4307@roeck-us.net>
	<CAFEAcA8PPF1mDWMGSm0r6NtYijwQQG7QnNEJ3iwaaEZU8GTu7g@mail.gmail.com>
	<20180626200008.GA680@roeck-us.net>
	<CAFEAcA_non89OR_-W3Fhr6gG0v0kkgg-ffJx-9K_h=U-Hz_wbg@mail.gmail.com>
	<20180702162733.GB32333@roeck-us.net>
	<CAFEAcA8+ZxcRLBgonZaqpAfumKFvhk7yDhX=Fe0KjoeTxWsczg@mail.gmail.com>
	<20180702170522.GA9885@roeck-us.net>
	<CAFEAcA97xX72WabGwn7GAQJxMcpzYzyV9yDBg1qF0zLuSDZwSA@mail.gmail.com>
	<20180702175740.GA14904@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jul 2018 19:06:17 +0100
Message-ID: <CAFEAcA8noUOGt_9LpfRTRX52n4Z66XzudYFfW=180c92vzPH-g@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
X-TUID: fYKIWcaOucAM

On 2 July 2018 at 18:57, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Jul 02, 2018 at 06:10:36PM +0100, Peter Maydell wrote:
>> On 2 July 2018 at 18:05, Guenter Roeck <linux@roeck-us.net> wrote:
>> > I don't think I'll have more time available to spend on this
>> > anytime soon. If it works for you, just drop the patch. I can
>> > keep it local in my branch. My version of qemu is different anyway,
>> > after all.
>>
>> I'd kind of like to fix the bug, though. I'd just like you
>> to provide the image you're testing with...
>>
>
> Ah, but that won't help. We are dealing with a heisenbug, and me using
> a different host than you (or even a different gcc version) may be
> sufficient to make the problem disappear on your system.

True, but we can at least rule out some differences between
your setup and mine. (For instance, your kernel config and
version and rootfs are all going to be different from what
I've been testing.)

> The mps2 images use high resolution timers, which is likely what is
> triggering here. My working assumption is that those timers trigger at
> the wrong time because the timer is set up in periodic instead of one-time
> mode. With that, behavior is more or less random. On some systems it will
> work, on some systems it won't. Since we can not agree that setting the
> timer in periodic mode instead of one-shot mode is a problem, I don't
> really see how we can proceed. I would somehow have to prove to you that
> there is an observable problem in the first place, well beyond of what
> I already did. That might take a lot of time - much more than I would
> be able to spend on it.

I certainly believe you that there's an observable problem.
I just disagree about your proposed fix, because I don't see
from the code why it would make any difference. So I want to
get to a point where I can run exactly the same thing you're
running on my system to have a look at what's happening.

thanks
-- PMM
