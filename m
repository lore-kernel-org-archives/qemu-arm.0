Received: by 10.80.163.71 with SMTP id 65csp1147794edn;
        Sun, 2 Oct 2016 07:59:27 -0700 (PDT)
X-Received: by 10.55.9.149 with SMTP id 143mr14731716qkj.225.1475420367653;
        Sun, 02 Oct 2016 07:59:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f29si3024133qte.33.2016.10.02.07.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 07:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqiEh-00030H-4Z
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 10:59:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bqiEa-0002zP-Di
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 10:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bqiEX-0002zD-SH
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 10:59:19 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bqiEX-0002yh-E5
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 10:59:17 -0400
Received: by mail-vk0-x229.google.com with SMTP id 192so141454742vkl.2
	for <qemu-arm@nongnu.org>; Sun, 02 Oct 2016 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hFHYu/Hf2YTKAPfc1kqz6xgcTgrYLOHvgUkJHOHBPzM=;
	b=NRxZxfgPWqfGU4PhKbzjM7wXdFZu/N7AKVEQB1DcByarMCjyMy4t7wWs1L/GjdJR09
	iFI5yCNsebKbyssBuMT5qervZ85zHklOt/iM+SQJ/FP/keevnAyuNhLx3PONsDVCvqpd
	8Wi7uaIeypFG8Y0EUKtq/eP2d1tWkb4WA0xYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hFHYu/Hf2YTKAPfc1kqz6xgcTgrYLOHvgUkJHOHBPzM=;
	b=mk6pcJask3Oi2jUSFRXugbW3ibP7og+PDONihITXxwuc2477N8w0ncdTeKbW4YFNxO
	uGe3fa4nAInRSQRDsxC2JqQvdl6ZZgAizCd+wJY2hUH5F1AJ7xHHcy6OhMG4rds/k7Zd
	81m/vTp0Zcb+2adpOzyJiMjkuNovS4mZYfhwdHZ4hWtAkcNgdYJRVeqRalQ8i3HNjWLV
	TxCZK2W7gmqaW78CFaYUTLKAMdM7s1AKnr7qmZhj6C6VJCat/WFfgchYlKhnpL3KIluu
	0jnU5AjBZgTrbcip7r0qR+h/jiNvbpH+fxAc7Os3nVaE42DH8bVyvFE6y7P+lLNC88A6
	7jTg==
X-Gm-Message-State: AA6/9Rm0kPQZtOICxE/IMeS594QLUJNdwcMvrY0Tc6lgZcJoT3jdnw64faR0JtvAqVTqT+/c6CMc03pffhWZ2rLF
X-Received: by 10.31.165.83 with SMTP id o80mr11006037vke.95.1475420356541;
	Sun, 02 Oct 2016 07:59:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Sun, 2 Oct 2016 07:58:55 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610021122450.32504@wniryva>
References: <1475054208-20288-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA-zru_S2GeLNDYb4uTkOsEN7TyT_kb5kw0f+fftqOvKXA@mail.gmail.com>
	<alpine.LFD.2.20.1610021122450.32504@wniryva>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 Oct 2016 07:58:55 -0700
Message-ID: <CAFEAcA85-XdSaOYTWr2=JQVt+EBsmrSq-5QcbWe8hrSW0qZ7xA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [PATCH v2] timer: a9gtimer: check auto-increment
 register value
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4gsx2Fvsk5XF

On 1 October 2016 at 23:15, P J P <ppandit@redhat.com> wrote:
>   Hello Peter,
>
> +-- On Fri, 30 Sep 2016, Peter Maydell wrote --+

> | Since the gtb->compare field is 64 bit your inc variable should
> | probably be uint64_t.
>
>   Okay. I was wondering about its values, as gtb->inc is 'uint32_t' type.

The timer can't autoincrement by more than a 32 bit value, but
the timer value is 64 bits, and since this code may be doing more than
one autoincrement it's better to use 64 bits.

> | > +            DB_PRINT("Compare event happened for CPU %d\n", i);
> |
> | This is wrong -- this debug print should only happen when the
> | comparator matches (ie when gtb->compare is less than update.new),
> | not every time.
> |
> | > +            gtb->status = 1;
> |
> | Similarly the status flag should only be set when the comparator
> | matches.
> |
> | > +            if (gtb->control & R_CONTROL_AUTO_INCREMENT
> | > +                && gtb->compare < update.new) {
> | > +                inc = ((update.new - gtb->compare - 1) / gtb->inc) * gtb->inc;
> |
> | I suggest using either QEMU_ALIGN_UP or QEMU_ALIGN_DOWN here,
> | depending on which way round you're trying for.
>
>   Okay.
>
> | Also this will divide by zero if gtb->inc is 0 (as for instance
> | it will be on reset).
> |
> | > +        gtb->inc = value ? value : 1;
> |
> | Where has this change come from ??
>
>   This was to avoid the possible divide by zero. Couldn't find if zero could
> be valid value for 'gtb->inc' and a non-zero default value if not.

If in doubt, you need to check the datasheet/technical reference
manual for the hardware, in this case
http://infocenter.arm.com/help/topic/com.arm.doc.100486_0401_10_en/ada1443777319205.html
Zero is a valid value for the auto-increment register,
and in fact it is the documented reset value.

> If
> 'gtb->inc' could be zero, should the 'gtb->compare += inc'
> only happen when
> it's non-zero ? Ie gtb->status would be set if gtb->inc > 0.

If gtb->inc is zero, then when the timer fires
the compare register should increment by the increment value
(which will be zero, so it won't change). This is not a
particularly useful setting for the guest to put the timer
into, but the behaviour is well-defined. (Effectively, setting
the increment to 0 is equivalent to disabling auto-increment.)

gtb->status should be set whenever the timer comparator
fires, whether we are auto-incrementing or not, and
whatever the value of the auto-increment register is.
It is the "timer matched" interrupt output. (Your current
patch is wrong in that it has moved setting gtb->status
into the wrong place, as I mentioned above.)

thanks
-- PMM
