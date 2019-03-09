Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9542762wrx;
        Sat, 9 Mar 2019 06:39:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMonXI3aFF6asL5b0B3EDp5KMnUNncIQC5Mjno9znO+Simhr+0LEai2NSABvDLEYooCM4D
X-Received: by 2002:a25:c3c6:: with SMTP id t189mr20950389ybf.471.1552142382357;
        Sat, 09 Mar 2019 06:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552142382; cv=none;
        d=google.com; s=arc-20160816;
        b=USDdGCdK9oB+cCCmi5pjdlvEPfuyAKAbDSKE66Fwazesng3fD26ByRphVUFYl+XX6j
         KUoyVX9G5OyVfBVBTjpEJASIgBhOeSu4YN3qwq7ghptdr/XiTCmHnHwfNkBPVbJ1SF5A
         IGSihTuCLym/pGOtt/SvQSYN2nA+kaKInGqCN7rXn2441TsauPuKnOcVRNfkgtk8RzqP
         3l1gve/Daq9E95BLwYNbuJSAb//NKlUhVEMsFQagC8Rb/Ci3x4+yuf4yeOS93vbLGG3W
         +uW/RzvQhKoAP0IpoJc4tpFaS1N8nmpq73M9p71XOYZIa9Fd0WLsePUw7dFHfvMPO4u1
         ty5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IW1EdbPYTSbWqoLELnWnpD7c7zLVBe2oALZ4hxrX7KY=;
        b=glNi6iKp3nHmk969hZWhCTW2tM+XQAKE7zdJ2jw8RFjB262q6v9ylTYFAkB/GaH+Wd
         +JOUj8f05dYAAq64foh1xYjfAA9hHFjFB7cdXwuPFJtjYZz4/nfAVSsj0yAAetRZvs5t
         7384FG4rJNHGnpMmV4yL2LyCwE4whBdkRcOqEMKB7encVCiu/L75TqbAs2Ym8QsBFmfv
         CIhLJZg8o4WgkTQu/dqV+dT/DmY5JzTcB/IvTa+/VfWrO5MsI78UNoaAqUX+OtgZtfZ9
         y1BqIJg/iBqgfvqcwYwTLMB0X+sTi0td3iSpPiBp1Xz0eTBPjFJdWkYJYYM9x6EvG6Iq
         q3Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="n/HIgnIC";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si293934ybe.430.2019.03.09.06.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 06:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="n/HIgnIC";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2d8X-0005R3-Qd
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 09:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h2d86-0005Qt-58
	for qemu-devel@nongnu.org; Sat, 09 Mar 2019 09:39:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h2d85-0002g8-EZ
	for qemu-devel@nongnu.org; Sat, 09 Mar 2019 09:39:14 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h2d84-0002cz-TP
	for qemu-devel@nongnu.org; Sat, 09 Mar 2019 09:39:13 -0500
Received: by mail-oi1-x242.google.com with SMTP id b4so374906oif.6
	for <qemu-devel@nongnu.org>; Sat, 09 Mar 2019 06:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IW1EdbPYTSbWqoLELnWnpD7c7zLVBe2oALZ4hxrX7KY=;
	b=n/HIgnICF22NPRjvoFVngkkYm9O+bYdibjNVeQXmCWFU7fW6db9Rb9L4RyjMcPaEu8
	5GYHmYx2whg6mceEOANkYI3DekghCEQRCURRQc2d6FKgepEbSpSUJOCCrHmXwyW7azl1
	DN7zd9QIY2H9WWnuAeROuntdByzNBhlNGOuHXXV1kxm00lJL0Xmb4jvGUnHr/pnwpbe2
	VTApXT2xrUdsOSHpu2IYTWmTcBWCCM8PXEggU/wr3337/Pmwl3BLA1KAPC8YYKtOdGRq
	c1nd4+zjVeB+j7dRqj5t781fXtCvzFSNUcQaHmbSbIbcxiowpeue6L1qeQyN8JTA392/
	26Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IW1EdbPYTSbWqoLELnWnpD7c7zLVBe2oALZ4hxrX7KY=;
	b=KGJiYDUGp77T1I1TztprKhWy10yA3nAdt0h4ZPlB1OHTUSClPp4RDeVlComBZq7NhG
	dV8wI+oDm/10z/T8OChM3iD7dWnD93kfC3Wk8tlWenRg83t7cQz9FQPd4i1Xa3YIK+hC
	U4FACzDSDBnlZFXwHgjonciujac4CVb2ohSUBxG7SCqjeaYf/CGjf1hEfUcrXykMYg3X
	m8JOhk9RO5iXdJwWOUw+hPTTeqFa62LWVNfaBX54KFlC9lW+xnjsxjGHjXGNHYBtyjHq
	eIB974axCOHEC0FYDkpFV5IJdpi6V78BcQR4hMe4T7Ar7rxIzBDn1JB/DWu7UuhbBBSl
	kb9w==
X-Gm-Message-State: APjAAAUL1X4hbWpSbydhANPySDPDgrm2ymXcGtPQb1n3SddEFb0PQoaD
	pck5qSKgEu/D98+JccyyMv8s/1LXuxzDb3Wzlq5Kjw==
X-Received: by 2002:aca:c1c1:: with SMTP id
	r184mr10862677oif.146.1552142351450; 
	Sat, 09 Mar 2019 06:39:11 -0800 (PST)
MIME-Version: 1.0
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
	<CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
	<CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
	<CAFEAcA-+U75+EQzcpV4kZHw+4xMSbMv3UJ0CV_Q3DVbNx5RbNg@mail.gmail.com>
	<CADYoBw2XWeDUqBHVJBWxJAzQ4f0imosEeLHHoG9AfHfdavOTrA@mail.gmail.com>
In-Reply-To: <CADYoBw2XWeDUqBHVJBWxJAzQ4f0imosEeLHHoG9AfHfdavOTrA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 9 Mar 2019 14:39:00 +0000
Message-ID: <CAFEAcA8YT4oLWK7gQB44p5UQVHEUR6bFdHy6VcGnGAxFxhWdiQ@mail.gmail.com>
To: bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rboCFDgOtWN4

On Sat, 9 Mar 2019 at 01:03, bzt <bztemail@gmail.com> wrote:
> Thanks for your answers. If I don't clear the INTENABLE flag, then the
> IRQ would keep firing constantly. This is not how the real hardware
> works: it triggers the IRQ once, and then it inhibits. The timer won't
> trigger the IRQ again until you acknowledge it by writing the INTFLAG
> into the ack register. My solution emulates this behaviour. That's
> what the triggered flag was for in my original patch. Should I bring
> that flag back or is the current solution acceptable knowing this?

Huh. The QA7 spec doc is pretty clear that the IRQ is kept high
until the guest acknowledges it (and that is how in general
IRQ/FIQ works for Arm -- it is level triggered and it stays high
until the guest silences the device):
"An interrupt is generated as long as the interrupt flag is set
and the interrupt-enable bit is set" and "The user must clear the
interrupt flag".


thanks
-- PMM
