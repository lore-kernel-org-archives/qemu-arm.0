Received: by 10.80.166.35 with SMTP id d32csp195923edc;
        Wed, 19 Oct 2016 02:50:15 -0700 (PDT)
X-Received: by 10.55.151.199 with SMTP id z190mr5452232qkd.227.1476870615641;
        Wed, 19 Oct 2016 02:50:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si23711248qka.196.2016.10.19.02.50.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Oct 2016 02:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwnVn-0003UA-36
	for alex.bennee@linaro.org; Wed, 19 Oct 2016 05:50:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bwnVf-0003Og-Ew
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 05:50:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bwnVe-0005EG-Qj
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 05:50:07 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bwnVe-0005DU-La; Wed, 19 Oct 2016 05:50:06 -0400
Received: by mail-oi0-x244.google.com with SMTP id p136so1245810oic.1;
	Wed, 19 Oct 2016 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3ePzKvcRT9+Mi2ZoBjXrRpDwaOyU5Ctys3puVvWR/f4=;
	b=Dr2Xp4obnfGf9oqDKcgR9+JxEYeBbjnloISF3WaUpSLMkxVO6dFkIGdwGglCLK+jNf
	F8jE+4/OH3p58c32j3IhJBVszPSOfdyKB8EXKRq3GSOr/8BWuWKoZNNtmtGyjvOBXEbI
	BBaNc18RdNLnE0cAqh6ObiYMfC3Bu4KlYF9UAGB7TgBmP7iV7UmrpDIRiVvLM+efvFU2
	MJiA5uM5eYSWGuTo4MB4jjxVbVpQB1zw+nTeJH/AMqXvJmFgR0fcrsGgylgH/AZELCVc
	cLQzb6TNMOA4bcLZ7uOUY7qXj/Ko8Vsx+PtXuHHegnsrzyAa93PQ3IwYH8i1bfXBUYVS
	OXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3ePzKvcRT9+Mi2ZoBjXrRpDwaOyU5Ctys3puVvWR/f4=;
	b=O/L6Fl0d6MctG+ZEwR4Kuw5FS2E39rgz17btE5OxyNUMMx5WFyna/Kwbj99llhYSq3
	cMUJEexFz1mq675v1pl2r2PH3VyxOLiWeC/QIRc9Ncdt6OJCSfWOYhYQU/SzKM1jX/Qs
	PzUYM1ruvNgjpBOUo3SiHiS0uUvOenwzi6B8i9b0S85AmsEnC66CNErfWhAf6x9guE+s
	9cP6FdjQ3NBSmYx5dXi6NFAaRjmnZj+UXgkWi/ONQIIMdO/Ssh5KrXIfM/pW+0vNjnxy
	evd8yKXTNm5REn7BRJVTeWeKDuGS3KQnVz5i+DnwWgvkf2PkABcqGFuLbmX+QoRM3EW5
	DDJQ==
X-Gm-Message-State: AA6/9RlbddMI3VzyXixAINEaENWpJEZmydb9d4U5WK/gD0TTlcdoVhYWRmYor9l296EWONxwk09IqJX9ObTXhg==
X-Received: by 10.157.36.232 with SMTP id z95mr1399954ota.124.1476870605341;
	Wed, 19 Oct 2016 02:50:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.78.198 with HTTP; Wed, 19 Oct 2016 02:49:34 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610182307550.1547@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 19 Oct 2016 11:49:34 +0200
X-Google-Sender-Auth: vIgl1zHSFZ9qr4y_9cHqJVHN1CY
Message-ID: <CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] char: cadence: check divider
 against baud rate
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yewZSTb4pxK4

On Tue, Oct 18, 2016 at 8:46 PM, P J P <ppandit@redhat.com> wrote:
> +-- On Tue, 18 Oct 2016, Peter Maydell wrote --+
> | > +    if (!s->r[R_BRGR] || !(s->r[R_BDIV] + 1)
> | > +        || baud_rate < (s->r[R_BRGR] * (s->r[R_BDIV] + 1))) {
> | > +        return;
> | > +    }
> | >      ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
> | >      packet_size = 1;
> |
> | It seems really unlikely that early return here is the correct thing, since
> | it will result in our not correctly setting a bunch of the other
> | stuff done later in this function that's unrelated to baud rate.
> | What does the datasheet for this UART specify for this situation?
>
> @Alistair.. wdyt?

I'm traveling this week, so I won't have a chance to check the data
sheet until next week.

Generally these types of IP just say 'undefined' in invalid situations
like this. If that is the case we shouldn't return but just set some
default value and allow the other functions in the setup to continue
on.

Thanks,

Alistair

> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
