Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7409002wrx;
        Thu, 11 Apr 2019 09:55:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwPGFxid3Cd2x8KtBLiWzGK6RChFp5/lw4knkGsGxQHGoVOkPjvcDEloz0WFXQcvrgIffQ
X-Received: by 2002:a1c:a9d4:: with SMTP id s203mr7135537wme.117.1555001751679;
        Thu, 11 Apr 2019 09:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555001751; cv=none;
        d=google.com; s=arc-20160816;
        b=dyyx+b4+5SvC/6vxBcwckfkMqTBxVZOvqKz16JifWn24LkQGCT1Vc+fzXSMJXHcueA
         pOqxHIV5w5M1PZoWgcZmJLuy46psWY6I4A+qRplMXg/cFsMtSqYiOHEMDlYPVjE3bmXy
         YXk9BvWtkrvMWHXjGHQsjLu5w63rmy0L0GLOctllQoS5xLsWwngc4v87xGR1P/C2bNGe
         7U2JhiYWrpOKWmSQ3tRD/VL03/jIyIPRtTbVlS/K3lJ1Q+BUhCd59Rqn510PHRMpNfAG
         IJypFA1SZy0D4hC2tXRAr9HX1b3pQC9NSJSy4kvvd+KK3UrsBtCFS2A0mprKMsNaBw6W
         aalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=lrQUq1nSdHO+ISnMMhD3j5l2NJm6Xm75etVJJ478oJs=;
        b=Hv/RINv1XNK0kL2J8VGFv3nXf+d6JtDYdYuNiyxZNs5WkfiIjObrNhIK3GPO0hdxys
         SqQn6AwXImbxcnOpnRm7fDBzO6kop5rvKqBObnkrgstJaZWd6fAjpq4TL0xpUgl0hL0c
         AVack3akZ6t915sGsN/TbTDxZVc+9JhpcfeeR3B5/J7trNGfz7Q9Y3PsD3Ggapk48XIx
         qKzQFr/xcjou4hpGHimXA8vsrath03S8T5UkgolikPW2FIPBif1G9neIu7Umpo7mgFyQ
         k90phF2VlB504eFUs9Sqvpwr+qCPCpeD3hUZct9p+9nGkZBE+juUyowXRTi46WId0jt6
         9eEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LY/CQP6V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si25613371wre.95.2019.04.11.09.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 09:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LY/CQP6V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEczO-0003Tv-R5
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 12:55:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEczF-0003KK-0B
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 12:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hEczE-0002qk-3H
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 12:55:40 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hEczC-0002pe-MV
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 12:55:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id v7so5506610oie.8
	for <qemu-arm@nongnu.org>; Thu, 11 Apr 2019 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lrQUq1nSdHO+ISnMMhD3j5l2NJm6Xm75etVJJ478oJs=;
	b=LY/CQP6VhMpjOanAx1GtNfYGmCphgn3ZsXtmP/rfM8iunkLRpvF11A0nvMRqhGJQmP
	sufMdK0KiU2H/tEYkNc1EJmwRUryKtpikmrWeBWVj/LR2Kurb81IKjv1UQfO0S15qMZ3
	qzstJDVzQgkYLHOmiaAcZ+ZFtXmDJrkpLw642uqmklNOEq5kLEs0TXiZkFxlUYO5xuKq
	9RcGCD9eoAYpQMH1FUK5fmMW3QMzGRQFQ+MWVqWph39dxiqJ3JKUk64FV9SepHXU8DfB
	GC044+k/JZHTahL50P43Anjzqoks4qs0ABDZZCamYsaXrC2OFoUPhBEDOyCurTnu9w2T
	Q3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lrQUq1nSdHO+ISnMMhD3j5l2NJm6Xm75etVJJ478oJs=;
	b=uSLiGukbYhydY2KXKN/Cpy26NXzd5I6BxDvK+FF63WdaXHA4jVRusDWB3hiiaY2enu
	edxDNp8ScF7WfiIbKlshR/PTAGzvlaeyvsoCh9eiX3QoUhLk6lnWpdvDuuRj/qW1ADdD
	gMIU3nwBIX1/ZUKbYOdzHiXYncmGL1mGZf6yVER8TeZJiwnCHvBOK6Z5cRFP44w9WhNV
	w8gkNcecXtULhl+GoSGjiwN2FSu7abeO/5VPIzwK0NfEk6k9q+5gAeFDOSamrYQfkdRK
	9CbNrHsN406V5YJ2E4hTX+Bzx4rzZyzwtwx5EFxMhpP1ddsMtyLW24HUHrfwEP9zXecn
	M4tQ==
X-Gm-Message-State: APjAAAVBrWJXFQ0E8hAzOZ9FSlPbKf9PKmsjQwzHmEJX/IYBFlTzEV1x
	VYaETalMvl5HJ1v6zu6SRx0VwXaWq+5OwjV7sTEHwA==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr7287933oif.98.1555001737698; 
	Thu, 11 Apr 2019 09:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190328062222.8409-1-joel@jms.id.au>
	<20190328062222.8409-2-joel@jms.id.au>
	<CAFEAcA_K1Rv1G-s=ndVYX6i_BvWME6ToShL6ZBpB4gnE3zdZdA@mail.gmail.com>
	<89438392-9a54-7f43-5dff-6ceeffaf9f3e@kaod.org>
	<8d05734c-2744-290f-0dbc-95f9c2502f21@redhat.com>
In-Reply-To: <8d05734c-2744-290f-0dbc-95f9c2502f21@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2019 17:55:26 +0100
Message-ID: <CAFEAcA_=uD6AQAd13deXjL83AQPsgxknjBE4jBRRJ9S4Z8nzZA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] hw: timer: Add ASPEED RTC
 device
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkabrKk7Rx9J

On Thu, 11 Apr 2019 at 17:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 4/11/19 5:30 PM, C=C3=A9dric Le Goater wrote:
> > On 4/11/19 5:25 PM, Peter Maydell wrote:
> >> This is missing a reset function and vmstate.
>
> Is vmstate mandatory for new devices.

Yes, I think so. You can have vmstate that says
"this can't be migrated" if you absolutely must, but
it's generally easy enough to make it properly migratable.
If the device generally has no state to migrate it
should at least provide a comment saying so.
(I think we should add a way to say this in a vmstate,
so that we can then assert that every device sets its
vmsd pointer to something.)

Failing to provide a vmstate means you have a machine
which will silently break if the user tries to do
savevm/loadvm, which is not very nice.

thanks
-- PMM
