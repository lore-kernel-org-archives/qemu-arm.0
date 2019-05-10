Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1779363wrh;
        Fri, 10 May 2019 02:06:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzs65OkZB+2HFaZzOVEHEM9bMW10hTVzySFmF8zSE7stxPwuwIb6A7OiZ6bprJVHSHqnckL
X-Received: by 2002:adf:906c:: with SMTP id h99mr6774199wrh.198.1557479162577;
        Fri, 10 May 2019 02:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557479162; cv=none;
        d=google.com; s=arc-20160816;
        b=U5dvxBi0KX7Rmau8F/JHXeKETgNj2gJBq+osoOvya0uBm+SthXrn0zD3Gb+m9w/KP0
         o7tG2iDShEdy2i1cdu2Q3hpiB5JpUz1usCCfjanZr4b7qppwl6ai4EJCwLeht459uKMx
         Mi2nG4W1Iktq/EWN0j4UNBmXtqWWSDHcLpNHLeVeBJ3I9d4avwGuzgRys/7dvl/a8it0
         MDRro7JMx58xRDvm/NS2fcGaCATmhRO8bzxe2M7LnHZMFuZJJFVxOG97MIXQ+yCFq7qO
         Ugx+xtq8Tm9d0n9ULOfQolCXbaOkbK45HjGyLmtrkR+wEFvcX19e0vSes6VHIGo9/GEB
         K6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKgDZ9DgFBG2eBeTJVKL9K3/Blxoh6DfGd7w2BaTP9A=;
        b=vwZIA0vpPjAStU1cekTpECX3sG3beydtBgtauOLAjbWhv+Hsz6XzLXpbdhn+Azue4e
         pDUL6zdYEU3H++sxD4efhIjbpXvNaDCGU/jnoxYW+u2uXCJ5x5VZ2MUrzHt1iykrWx/4
         xU0BhKPVbClzUP57CXqFAV34MUfX+Wfoj9gfPeWkEjyMIbCD8F0Rj0Dk1V2KvJmraQwf
         dKFmu9VcN9y07D7X+KM+/Ffeg5z5GjJN9dr7nWmAsOkgp8p7I5ctJIk4CtzjRxSKF6gT
         yMh1fVFQ+sOe58qLnP+RxwRanmacbEyoGHVia0MUBF9BZ0L9z6fV1CDx4LL5fkIUay+I
         4s8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bMgRUbLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si3350305wmq.29.2019.05.10.02.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 02:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bMgRUbLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hP1Td-0007P0-NQ
	for alex.bennee@linaro.org; Fri, 10 May 2019 05:06:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP1TE-00077S-Ej
	for qemu-arm@nongnu.org; Fri, 10 May 2019 05:05:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP1Sr-0000iD-8P
	for qemu-arm@nongnu.org; Fri, 10 May 2019 05:05:36 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:32801)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hP1Sr-0000gt-1Y
	for qemu-arm@nongnu.org; Fri, 10 May 2019 05:05:13 -0400
Received: by mail-ot1-x329.google.com with SMTP id 66so4951486otq.0
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sKgDZ9DgFBG2eBeTJVKL9K3/Blxoh6DfGd7w2BaTP9A=;
	b=bMgRUbLkiq2wiKL2yxRbLhVFbbY/jeadvA/cMA3Q6lLzW1BWgGIwNPMGJUkNC1IYB6
	Ppt/xBOIRckTRkgJcAgM822rYy2mPhF/Ewk5rpbS2/3X3fqalXnS3JGtuGdWXT92elKD
	YguWtqUIXVaDeLw5tly+/7XBwSKzNo4hK7UQ3ZWvni2CxJu9nWQmzXz/LeJTpsJqjQwe
	wRFXe3MldQ6HCM8EslnOpr4TJnpPGvD3ZQO3xXev//9xLV68iOPD77GLrxkThrZEDJDG
	eLs/Zg/7OWYpnk27zDYGjVXylhwtisLorXGXAcrg+KbHi7NV4SZwru6F6dQJXBWHkUdI
	B22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sKgDZ9DgFBG2eBeTJVKL9K3/Blxoh6DfGd7w2BaTP9A=;
	b=WQPIJvW0H7Hly0KJwNrOIK4/7Kjis0a6rsLv86Nzti5tW2Qvb4Bh+V8Wp/DBBWe5a/
	/ovw0bb2Wp1fFObt9OFyRCGcknec253AKivFydGuC101CjOVzcNlAvYbhIDZethGbSX1
	arDGrojwaJ4HiKbSmyS2OCzmLjyThgsWNpgC+4Tm/ErIFQme2KEmkljiqyalJCvyWS/q
	oGPj6xfeX5m6foUu3f/JhbX9sUxCV+tJ/NaBn4AWLVAyDwQL0wqNaJRZleSJaQ9D/DO6
	lBBmvFH6gB6BahsyWQg5DRuOQYzxVn+Z9lE9KHABOzG+duA4i0mVV/s3GKesCfDCwnIF
	2lbQ==
X-Gm-Message-State: APjAAAXYdA0XfdxkhBYNEWglJNr6iZW/bUuIabt6a6DIeI6pmzDSQzwJ
	gwLdzpVwZk+/nEnMJ/xO+0D8Ust+XoaMX8bKw1tdRw==
X-Received: by 2002:a9d:4793:: with SMTP id b19mr1480743otf.238.1557479112013; 
	Fri, 10 May 2019 02:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
	<CAFEAcA8RoJ-ZSsn3Lhzj5hd3oYOE7Uxy8MvUUWrzhNfBmD=AWQ@mail.gmail.com>
	<a5711506-3f6a-bc5e-f991-9d730d2f7dee@redhat.com>
In-Reply-To: <a5711506-3f6a-bc5e-f991-9d730d2f7dee@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 10:05:00 +0100
Message-ID: <CAFEAcA8dfNqyWrJZEL-h70s6feHtzfaz+cR6toO42UjvDA8O4Q@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::329
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL v2 00/28] Kconfig for Arm machines
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
	John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: saLF19tLBgtC

On Fri, 10 May 2019 at 08:52, Thomas Huth <thuth@redhat.com> wrote:
>
> On 09/05/2019 18.54, Peter Maydell wrote:
> > Further, if I "touch hw/i386/Kconfig" and then run make, nothing
> > is rebuilt at all, so something seems to be wrong with our
> > makefile dependencies somewhere.
>
> Now that's a good hint. There is definitely something wrong with the
> dependencies here. I can see that I've got a file called
> "x86_64-softmmu-config.devices.mak.d" in my build directory, but
> apparently the Makefile tries to include
> x86_64-softmmu/config-devices.mak.d via the SUBDIR_DEVICES_MAK_DEP
> variable instead. Since that file does not exist, the dependencies are
> completely ignored... Paolo, what was the intention here? Should the
> dependencies always be generated in the *softmmu folders instead?

I think the .mak.d files should live in the foo-softmmu/
subdirectories, because that puts them next to the .mak
files that they're the dependencies for (it also avoids
the slightly aesthetically unpleasing very long filenames
in the root of the build directory).

thanks
-- PMM
