Received: by 10.80.163.71 with SMTP id 65csp626952edn;
        Thu, 29 Sep 2016 18:59:07 -0700 (PDT)
X-Received: by 10.36.60.10 with SMTP id m10mr1955959ita.95.1475200747127;
        Thu, 29 Sep 2016 18:59:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z199si1642929itc.62.2016.09.29.18.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 18:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpn6P-00054Q-TM
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 21:59:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpn6L-00054D-EV
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 21:59:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpn6J-0001B1-DF
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 21:59:00 -0400
Received: from mail-ua0-x229.google.com ([2607:f8b0:400c:c08::229]:34583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpn6I-0001Au-VD
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 21:58:59 -0400
Received: by mail-ua0-x229.google.com with SMTP id l16so63575315uaa.1
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 18:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GgmzPKooa6gI3ev5DoI4W4n9Uq/LB+SP74l2H6iI7bw=;
	b=Dr0GqHO2/wPW0QTc7IZow14bRqdVE9UKk6i9YS1P/VVbfgV3jKUpr9FkWPsufBneJK
	OiVGKXNauvyqFCD8xFAFXrmR5CPBLzCIuDSLqhWnF1VvTyFxjqEYOqzFNkDzDV4IUAU5
	HyS9apcpHmLQQGx/I8o23SwQ0V95aLo46MX+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GgmzPKooa6gI3ev5DoI4W4n9Uq/LB+SP74l2H6iI7bw=;
	b=d33rvTJ714zQrOHdc0DAbp3/REInZdJwbkKRN/KKzVVmTqRkytfddNa2i+c3vE9bcW
	vAh0N8+WQph5E0yLpHXhToKyTmwAErNX2QuuTJuVbJpkVdeUJmpurB3X/Uswb3bJKFOx
	MPWsXyrMxCIidvJMweHA5bVMwGesnKrzCvP7iEkVvM3y8Vo0F/f1mbeHVlLHnEr7YzFi
	1m7aL6SKly3pcgESbHK1zOBTJYum9s8U8WVxaS95tpOlZtmB+XI97n+6H2mOXZ4UWgxF
	2aWREBiwKYPj1FC2mvvkMeTVNEUiQpweHme+J4oZ8WqWBVczKxxHidKe2keCbYAr17V8
	LEaw==
X-Gm-Message-State: AA6/9RnxuIkYRy3mUlqF84+avFUtNX2dq+VML3tdcAxLQ1xWWWkbKLgYOPsezQDujtNC+VwL5uVB7ciFKkyv3d1b
X-Received: by 10.176.68.167 with SMTP id n36mr3732592uan.164.1475200738146;
	Thu, 29 Sep 2016 18:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 18:58:37 -0700 (PDT)
In-Reply-To: <20160923063317.kmsbek755fcun5ea@pengutronix.de>
References: <1473520054-402-1-git-send-email-m.olbrich@pengutronix.de>
	<CAFEAcA9UoqKSqH+b_zF435u+pZQCdGWu_KDGFW=MH+71Q_j6ng@mail.gmail.com>
	<20160923063317.kmsbek755fcun5ea@pengutronix.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 18:58:37 -0700
Message-ID: <CAFEAcA-MCsLWEFWcFFQqgOxUb-su+k=tw57X2-z85k1u7+n1FA@mail.gmail.com>
To: Michael Olbrich <m.olbrich@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::229
Subject: Re: [Qemu-arm] [PATCH] hw/arm/boot: allow using a command line
 specified dtb without a kernel
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /m8+SpW5CU25

On 22 September 2016 at 23:33, Michael Olbrich <m.olbrich@pengutronix.de> wrote:
> On Thu, Sep 22, 2016 at 05:23:17PM +0100, Peter Maydell wrote:
>> On 10 September 2016 at 16:07, Michael Olbrich <m.olbrich@pengutronix.de> wrote:
>> > diff --git a/vl.c b/vl.c
>> > index ee557a1d3f8a..bbea51e0ce7d 100644
>> > --- a/vl.c
>> > +++ b/vl.c
>> > @@ -4335,11 +4335,6 @@ int main(int argc, char **argv, char **envp)
>> >          exit(1);
>> >      }
>> >
>> > -    if (!linux_boot && qemu_opt_get(machine_opts, "dtb")) {
>> > -        error_report("-dtb only allowed with -kernel option");
>> > -        exit(1);
>> > -    }
>> > -
>>
>> I can see why you want this change, but what worries me a little
>> is that this is changing the behaviour of -dtb for all QEMU
>> target architectures, not just ARM (they no longer get a helpful
>> message on user error). I'm not sure how to address that, though.
>
> Would a 'if !arm' be possible or useful here?

It's not quite that simple :-)

I think we have two choices:
(1) just go ahead and remove the error-check, on the basis that:
 * for some boards -dtb is useful even without -kernel
 * -dtb might be ignored even with -kernel if the specified
   kernel isn't a DTB-aware kernel, but we ignore that
 * -dtb is ignored even with -kernel for target archs/boards
   which don't support or use DTB, and we don't warn about that
 * we don't warn about -kernel being useless for target boards
   that don't pay any attention to it
(2) add some kind of field to MachineClass indicating whether
   the machine can handle dtb files with/without a kernel
   (and perhaps also whether the machine supports -kernel at all),
   use that to gate the warning messages, and update all the
   machines to correctly indicate what they can or can't handle.
   This would let us give warning messages when the user asks
   for something we're going to ignore (including letting us
   fix up some of the cases we don't currently deal with as
   enumerated above), but it would be a fair chunk of effort
   for a fairly small user-friendliness gain

Thinking about it more, I'm inclining towards the simpler
option (1). Paolo, do you have an opinion here ?

thanks
-- PMM
