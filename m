Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1680964wrs;
        Wed, 13 Mar 2019 06:54:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGvblvIUjh8XGHeGQxUC6LHZTt7UniAgp2r50hp9EpXcxm8ce1UPP85djT20mPxYU9jPSa
X-Received: by 2002:a81:4b12:: with SMTP id y18mr13322616ywa.55.1552485259054;
        Wed, 13 Mar 2019 06:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552485259; cv=none;
        d=google.com; s=arc-20160816;
        b=jMIKEUlRnFW+8Oie5j5xg4EYLWt81WcXsaNapLdkOvFwd/1BaTZm7T5go0MSCFdRzR
         u/Fxc3g+fNukCUKqdtXupYfvkuFxIeflirj5RoUUk8o5OpJaYeCaF+PfgEebkN2rZX2W
         E0MKLEMJe/jvhc0XCen+jA8fu14FISd9a3sBXnY+2ZXcenFI+/x2hhq/qG5o3V2owrUY
         qvZtkFRQ04UrcmOd7AMiLTvqECeF0EvExGh41yAh2hAzuk2tqQth6IuAs2/xtClNl4bR
         danjt1VsEHdhVn7ubTAh5S2qxLnAOAiiYHcvUR7ZzBGobcZLRLT9G1/YzLvkjT/J3aDh
         aWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=dFtKe7HDjUWUkw+rzORv8E0g+re3fq6Gzh8bwSh6Vzk=;
        b=fWlIHTT5ciFvyjemxyAFx9A4o+qldhxp1XhKdZupmua0UULRuXvnQyEC8aMR/J2g07
         t6o/4qhXHPS9F5EQC23OfSziKx0muP/t0JrUqxnf0tUYt/98IpOEMytnmd6x7FE32ZOF
         6+GbdG9n7nvQC2RLSgYYg1q9U7IpsQdL4JdnLTg2FoEQle9nyy21iGhWuvQlW/B9dO0+
         IPBgl6AUNGuQH8dzkv3WF4X+EYTGMSS8U8budXCw28GGfh1hpY/UE+NCLLBXNrW7tyGg
         JCpJrygAHgndE8RTTK6BAVm/GvVbN0btGchcla0UpjKrxQsOE6gfqEppIOsq+2zN1Tx+
         5++w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iRZwUWzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si6701660ybs.469.2019.03.13.06.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iRZwUWzh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:45074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h44Ko-0001os-IR
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 09:54:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h44Kf-0001mg-59
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 09:54:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h44Ke-0005T5-C4
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 09:54:09 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:41651)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1h44Ke-0005Qx-2h; Wed, 13 Mar 2019 09:54:08 -0400
Received: by mail-lj1-x243.google.com with SMTP id z25so1639066ljk.8;
	Wed, 13 Mar 2019 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dFtKe7HDjUWUkw+rzORv8E0g+re3fq6Gzh8bwSh6Vzk=;
	b=iRZwUWzhz+P3isAYoQV0+3Bug1c6h9ix3e/K//YHA4CilMU9QghnfBp6vCwGje+xMF
	4GG0r2F6rd1b1i4EYBlVqJCiO5o9U1oxyUAVvS4xVEqixEPJOcoNku4794qEZVJVaz1z
	sfk9yKTPk782wufK3nJDveLJfjGpzalIHGWPN1P50EOQg+RKHjgHLeCJgOjaCQcXTGVm
	ctxHX53DtGSeNQuUqzZuGHOz2phXnRnROatQdYfph2gdEO26AiQbB+8xWxyHRdtHE0t4
	4VCLzsw/w+mDSX0XBPPg3RfWX8yxdfR9ls8kcX1MQMQEmyOGCwV45uH3p6oRmYYKoyK+
	5D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dFtKe7HDjUWUkw+rzORv8E0g+re3fq6Gzh8bwSh6Vzk=;
	b=i8FsrWBpwGaQs+9uNhpIydNsuJipbwMXz85E3ONAW7zar34sUOnPVtwHuo7K+9V10s
	gfk2Hq/u7Vw2ir88SaCPY0pa2QyGtomgcNPHjjVq9He7bH9RCJ5/4mer/a4K0iMC9fQx
	G1GZurEwE19ZklU1+1K15V8i5j0skJ6Xf588SK3JtH22cTsjI3M0gyKfHwwR6leYA821
	Cv9/0sfrcQfIS6pGh8lmmKhA87Jaiuqnjp4LFCNHzxxmr/TZHQgnIj0c1Ntm1WMdH/S3
	pgz2cDgWsHVf6EDqVsr2ye66pAKWy2C6cKvJonFBbKwD7YinRKR2humDW7rGGv1qUPdv
	s7fw==
X-Gm-Message-State: APjAAAVYgSUEhAwB1YlS9n/uoPOGVAxqwXzT+Y4T6S5aKkBhifgdf005
	1KSgsi1cTEMQnYwsiQngzI0kLb+gRlVhLh2ymXs=
X-Received: by 2002:a2e:3a02:: with SMTP id h2mr6291043lja.148.1552485246123; 
	Wed, 13 Mar 2019 06:54:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP; Wed, 13 Mar 2019 06:54:05
	-0700 (PDT)
In-Reply-To: <CAFEAcA9hWPvGxw3THrsnQAMuQ87gzArGRa+kouF=d9DWsEnLTw@mail.gmail.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
	<CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
	<CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
	<CAFEAcA-+U75+EQzcpV4kZHw+4xMSbMv3UJ0CV_Q3DVbNx5RbNg@mail.gmail.com>
	<CADYoBw2XWeDUqBHVJBWxJAzQ4f0imosEeLHHoG9AfHfdavOTrA@mail.gmail.com>
	<CAFEAcA8YT4oLWK7gQB44p5UQVHEUR6bFdHy6VcGnGAxFxhWdiQ@mail.gmail.com>
	<CADYoBw1TQMpkYbS8g_OzZ4UeQz=NYO=dugRnCuL2mP4xBxcWMQ@mail.gmail.com>
	<CAFEAcA9hWPvGxw3THrsnQAMuQ87gzArGRa+kouF=d9DWsEnLTw@mail.gmail.com>
From: bzt <bztemail@gmail.com>
Date: Wed, 13 Mar 2019 14:54:05 +0100
Message-ID: <CADYoBw0bKUVD-xsh-jtsgg5i92eu1nJB=5bjaWHeJ_roBB2seA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 10VJ9Z/3YYSu

Hi,

That's great, thank you! Looking forward to see the patch in the master branch!

Cheers,
bzt

On 3/12/19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Sun, 10 Mar 2019 at 11:02, bzt <bztemail@gmail.com> wrote:
>>
>> Hi,
>>
>> Okay, as you wish. My code works either way and on real hardware as
>> well, because I acknowledge the periodic IRQ as soon as possible, so
>> good for me.
>
> Thanks; I'll get this version of the patch into git master
> at some point in the next week.
>
> (I happened to have an rpi2 to hand, so I wrote a little test
> program to check what the behaviour of the h/w is, and it does
> indeed not clear the INTEN bit when it signals an IRQ,
> and it doesn't clear the IRQ line until the guest clears the
> interrupt flag: so if your IRQ handler doesn't clear the flag
> by writing to the register then the IRQ will 'scream' (fire
> continually) both on QEMU and on the real hardware. So I think
> the data sheet is correct here, though it certainly has its share
> of errors...)
>
> thanks
> -- PMM
>
