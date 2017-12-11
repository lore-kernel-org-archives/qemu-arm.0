Received: by 10.223.159.74 with SMTP id f10csp2703560wrg;
        Mon, 11 Dec 2017 07:37:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBovONEr2uMv/GhnK1rJdi6ZM2pda7pSIKjx3hlyFhZK0ILPLKlxZQyabjwxa88ibdjWgXVDE
X-Received: by 10.129.46.3 with SMTP id u3mr609116ywu.240.1513006665987;
        Mon, 11 Dec 2017 07:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513006665; cv=none;
        d=google.com; s=arc-20160816;
        b=LBHFgYRViZ6UTBvTdQ8FjNkXgvAe6vqbCygrKVdp7SO+B7A1ygeZ5rIh32VnYPhC22
         gJhPSunWuw6OohTOQJwIoMjVxq3XY9mH1P1PS7MQdIG4q/pAUknKVTEB1oEjtEuyDhr9
         kfRPhESozRvEDzUjQBhKc4Sz1zZ49ZWug0dLXa+kt10DNZM1f0VFDm/iBYpMH5/Olcg+
         7aW0UgfF6CceEpInKpc1Yf16ydHQqzRk3+gi6hDnJrVv69B+Wjy6TqFjTwmz622Wwuqx
         mFH7JODgPGag52drOmZtvlrnN3Z/u0vieGo+6VwYRHo5A9y+Z/CkusqPO5yt1ONyc28g
         klPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=t/9l3+fBBDhPqQ+iIJ78v8UC8zJ3z0DTPJXY1NJbpic=;
        b=yWJ8hIMX7cWRWNi6xf1d8lTQ15Tu5X2K2XLNsCi6hMJOX2uESB9hM052Knz8N+gB2h
         bvbnmvke1TUA4jlU7r+y+oE9IAGPJLbexUdjjvvoNylozTiZPYiajlHQXQTXDJbPksYV
         erA2mKmLENVVcvZ9pCXPobNZrqx3SuThsP42oAtE8rMj0296028ttMSKVZ6AdH72AlV8
         A4f8UXdLKUOa0egbcXd/HV7lovqQOht1fAc4ZOjM4qA9FywHMK8T7DU6Qxi/FAj97J3q
         urr8l4iDhFKbTdpN1suEjXfyVYlLFDkmlZmdXppjFlEuiOwvBfRy9PNxByVYdNM4Y/YX
         /msw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kp/KX5TF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62si3026654ywd.650.2017.12.11.07.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 07:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kp/KX5TF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOQ9I-0001eO-2P
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 10:37:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOQ95-0001d6-9H
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 10:37:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOQ94-0004nI-D6
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 10:37:31 -0500
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:37159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOQ94-0004ml-7V
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 10:37:30 -0500
Received: by mail-ot0-x233.google.com with SMTP id s4so15061866ote.4
	for <qemu-arm@nongnu.org>; Mon, 11 Dec 2017 07:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t/9l3+fBBDhPqQ+iIJ78v8UC8zJ3z0DTPJXY1NJbpic=;
	b=Kp/KX5TFB7mCrNCz3ZdMDyY+nS6hreyTzcgR/TNPzuzdr8S93+xGFEDD4w4G8W11J4
	6eyDJzev4FN/Q2ZzD9yS9Fd8AD7ZKPN2oByJlPB5UqTdbUO//pKhbf1X2r3dHyh9KcA5
	tSAdEHQ5nJMcrnPhYWMUaQHvzeRDuCrm5HzyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t/9l3+fBBDhPqQ+iIJ78v8UC8zJ3z0DTPJXY1NJbpic=;
	b=ebnpN70nZFgffPai+a0oqU5EAd2BrO//ov6hsnxyUg8z5wFHd4LOhlsTiZrF0+cfHq
	5JdpDmGRtsdkqznX85kKUSdzKBo+FzLbgjQK/Sj1UDdYAe94+otoHR3K6COTaIPgO91I
	2erlKQ+VToYAYcJhPVs2fm9dmWABWhM9DmQfUdgBPjWA9lK72RY/WgXax2BD/IgBjhIJ
	6coGX8Ebz/Yp/lj5OghT5KHxAwU7wiIbT1y1KHDn3YdwD3JPt4/hOQmYgcR7JH/omBwb
	oC72VX39EuecAlE1harz/YbYkLk9sIi9dldz9UScnpmSAmcXplWYvVsqKdQagaMIwHo3
	vbEw==
X-Gm-Message-State: AKGB3mLitWBc969Kz7oLBPUUk66ScDAL4e54yQ7ZrBtUlPDaOdFc8A/p
	exffAUjMfPUB4mCDAYjz68kkjBXHBIimetJS8HSEFA==
X-Received: by 10.157.37.173 with SMTP id q42mr691950ota.116.1513006649490;
	Mon, 11 Dec 2017 07:37:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Mon, 11 Dec 2017 07:37:09 -0800 (PST)
In-Reply-To: <CAFEAcA_2HH2mTrHNzyrn=e3OQgoEdCZSbL7aa+wRHi1fba-8=A@mail.gmail.com>
References: <1507824216-29058-1-git-send-email-peter.maydell@linaro.org>
	<1507824216-29058-9-git-send-email-peter.maydell@linaro.org>
	<20171208230920.GA11462@flamenco>
	<CAFEAcA_2HH2mTrHNzyrn=e3OQgoEdCZSbL7aa+wRHi1fba-8=A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2017 15:37:09 +0000
Message-ID: <CAFEAcA_vjXt0y_6ROY_K2ri=M4mn+BRBCCOx84-uJV4kFaKHHA@mail.gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 08/13] target/arm: Pull Thumb
 insn word loads up to top level
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0bO7gbIVvcq6

On 10 December 2017 at 18:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 8 December 2017 at 23:09, Emilio G. Cota <cota@braap.org> wrote:
>> On Thu, Oct 12, 2017 at 17:03:31 +0100, Peter Maydell wrote:
>>> Refactor the Thumb decode to do the loads of the instruction words at
>>> the top level rather than only loading the second half of a 32-bit
>>> Thumb insn in the middle of the decode.
>
>> This commit breaks the debian-arm boot test (see [1]), boot dies at:
>>
>>> random: systemd urandom read with 4 bits of entropy available
>>> systemd[1]: Caught <SEGV>, core dump failed.
>>> systemd[1]: Freezing execution.
>>
>> Sorry I noticed this so late (-rc4), for a while I thought my development
>> was causing this and didn't pay much attention to it. However, just realised
>> the problem is present on master. Bisect log below.
>
> It's missed the deadline for getting fixed in 2.11, but I'll have
> a look at what's going on here.

This is a really bad bug -- we accidentally stopped generating UNDEF
for 32-bit Thumb2 instructions that should UNDEF (including things
like "first use of FPU with FPU disabled", which is probably why
systemd falls over). I wish we'd noticed this a week ago :-(

Patch coming in a moment, anyway.

thanks
-- PMM
