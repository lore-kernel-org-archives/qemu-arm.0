Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp731879wrh;
        Fri, 3 May 2019 09:03:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVkZcr+xId6SrLdb6aibYQsKHZ4SGt/V96ryP2WxhTEehtRabwbXSX/PAbKO1c3Yq/oqiJ
X-Received: by 2002:adf:db05:: with SMTP id s5mr7480900wri.247.1556899436547;
        Fri, 03 May 2019 09:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556899436; cv=none;
        d=google.com; s=arc-20160816;
        b=doK+mGlCh6qC2HPG0Cjdckdn+KrL/5XAmi3BAdqOMCUsppa1anwIlw+rPvS3ExWIKO
         WD5DSPpAfICwM/n2bgFu08mAByfyiRpur7QAcUNNrSYouIG2S+3uGeyVCbAStmf2xjZe
         fB9j16t9quuLWjzG1QcjWOf9oaPMYeezjRZOrp+YUu+UdJxbTA9NKBeBAWZtnuxZB3jR
         ENPpPyt0nExQLmcGO8SQzlWLP4rHTltBarOLvVzfu+UQvfa0zxEEVvLnvIxQDV/OJ5Gm
         n0lzbSfEW0ihNfmCfLFM91JCCAuMR3RDlALaHGgDChk+8pfYC+zOsM/8yjweaheJL1+g
         Jp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UryPuS+KNZtgHQBCrWBR74q8kdkTnuRZE+e5Ns822Pg=;
        b=IW0zAw6mA/VjpcnU8C8leb6nOFtAVGCeLNVre8hclisVDeLT/fEEKyTJkhsxzdOnm8
         WbJH8b7RXq4gQwdchG+0c79oRBJtZ3gEcREb/B1cFyJF0vvKd9A45entizPkX7NvF+RH
         vdIW6g+a3vatypqpd041I744a3b0kkqS3BKrVib+aZybKCQp5QgYbnqd1Y8O4IbETx4I
         Q/okUy6U3Uno9eRV3p+hktT+6B7XzBrA9QSKcMq0h6bN3s6cIBwBZYq6n3RrY4R2MPyB
         UK8rAVU1YDpgcOm4NMs085aHkooP1gHnMYVgpKvYrYaldBssah0981E8gkbKPKBprJRV
         klog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQzpLuqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si1736362wrs.240.2019.05.03.09.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 09:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQzpLuqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMafD-0003Mr-Gz
	for alex.bennee@linaro.org; Fri, 03 May 2019 12:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMac4-0000Rm-Ua
	for qemu-arm@nongnu.org; Fri, 03 May 2019 12:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMac2-0003Al-UQ
	for qemu-arm@nongnu.org; Fri, 03 May 2019 12:00:40 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:38882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMac1-00038d-8m
	for qemu-arm@nongnu.org; Fri, 03 May 2019 12:00:38 -0400
Received: by mail-oi1-x22b.google.com with SMTP id t70so4807639oif.5
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UryPuS+KNZtgHQBCrWBR74q8kdkTnuRZE+e5Ns822Pg=;
	b=QQzpLuqo2xP+Gk/ZNBmJ5URCiJPPjjnPJ+Q5zziIhJPbC5JcHaSeA3ta87udIG1xZW
	3X8KkkkmdSc8iAMkx4dJoSjzyd9N3B8gU8tJIzFbnfKxdMlcOyzDjtPrQL/kKQbb6eTv
	MkGZBVxumkmRno/bdQndGesV/QKHz4zSiAK1fW6utkAaUqTdDjwTvIDjxePoS3ICMAb4
	gxQxVRMWlYQaHrt5f+XsGzDN/irPmvQMocG5bo9lsC4/ua8wE9R05gyqspn+Sd6mxEmZ
	OWqWqdp/WR1wHtNoi8r6cx8Rb/8D3aT7Y63wOODS6vkrsUn1FscWlGr6004XSUECkmvc
	OWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UryPuS+KNZtgHQBCrWBR74q8kdkTnuRZE+e5Ns822Pg=;
	b=WMezxSgcadqw9lbgCPKXHwe35clXkZsbWVxvJQOj18IFuShM5YUdkq714egeA3JG0h
	AO+t5gUvSw7izijN/GMAiN4c5pfSiI1e+LT5MpArEJLuh0aHnTMk/6eBod6H9H7I2aJ2
	udLsB1Ch/D7LqKFLnNhj63BA/EXVIhe1llbvRomPNVB9w1PpxXKUEecTWkfCIK8DLQil
	VZAsFNxdonvza3jGXXssi8y9pQ85PnYUz4HrvWcnHeKr6+gI/bGBvfO/2tkqaZ1ABmJE
	UGJYQLYdRz7p3OVtWqiQ9JJXBOURRJFsngqz2SiR+Rdt5HljLOLTYo/IA7c8zo10Sw3q
	PAcw==
X-Gm-Message-State: APjAAAWkmBwGW02NZYzKQeA/UP2O4zbRmjEakMOnGhDFgFewh71IHF07
	MszP0xUj1j+1TI9Bem0zMHOI+0a1RH53A9gvB6wLiw==
X-Received: by 2002:aca:ab12:: with SMTP id u18mr5951214oie.48.1556899235809; 
	Fri, 03 May 2019 09:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553510737.git.damien.hedde@greensocs.com>
	<bf7dcbc7-5dc6-6269-87e9-44f027946cd9@greensocs.com>
	<CAFEAcA8e9Ua8p4LQ=VFkZE69_vr+-EW-bjKX9W-LmgZmvho7Sw@mail.gmail.com>
In-Reply-To: <CAFEAcA8e9Ua8p4LQ=VFkZE69_vr+-EW-bjKX9W-LmgZmvho7Sw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 17:00:24 +0100
Message-ID: <CAFEAcA-TrYPeESbxOjpd49F+iZHWSrwwpRwai21_jhmZJ0Xonw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 00/17] multi-phase reset mechanism
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ImbVPVHT4duf

On Mon, 29 Apr 2019 at 10:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 29 Apr 2019 at 10:36, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > Hi All,
> >
> > Any comment about this ?
>
> Sorry we haven't got to this yet. This is on my to-review list,
> but so are 23 other series, and I've been on holiday for the
> past week or so. I will try to get to it this week.

I made a start on this, but it's going to take me some time
to wrap my head around the design and the issues you raise
in the cover letter. Given the bank holiday on Monday and
some other commitments I have on Tuesday I think it's going
to be the second half of next week at best before I can
do a proper response.

In general I like the code (though as you say we may not
have got the interface quite right -- I had not appreciated
some of the nested-reset cases when I proposed it I think).

I think we could use a document (which would eventually live
in docs/devel) that describes the reset system and provides some
how-to style documentation for
 * what you need to do if you're writing a device
 * what you need to do if you are an external user of
   a device model and you want to reset it
plus some notes on whatever we still have left over as
remnants of the old reset scheme and any intended transitions
to try to remove those remnants. I'll have a go at writing
something because I think that will help me personally in
trying to understand the problem domain and what the new
design is doing.

thanks
-- PMM
