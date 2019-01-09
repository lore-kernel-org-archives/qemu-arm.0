Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1182592wrt;
        Wed, 9 Jan 2019 15:28:33 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6F8y+jXKsatrsYBVx/teiI3XFTdwrKs97f4fRpN4QGB75IHCGdoZGkB0QAzbMmdCbsgRDm
X-Received: by 2002:a5d:5208:: with SMTP id j8mr7083341wrv.188.1547076513571;
        Wed, 09 Jan 2019 15:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547076513; cv=none;
        d=google.com; s=arc-20160816;
        b=MSiERmc0iExv0qQNz4l+UupvWNQxMF6RKqfFyaqt61oNQ5RAzChECkeXe+vYXOiwRS
         DxkOSAB9IOAk6oHD4WGXmjmnxizLiVwcXavH/4vq9Qz25SPZ1dfuMfbnRycJOdGGnHQK
         Dw1jFbRHqZrPUZAxJwkDSD7huuTfnIx2YIMGtUtIfNqgdZAXiOJOXVdfRd0DPvWLmywY
         rBZ7ycDkNS09zWPoeNuvdbTz3r7+07aDMrJ1CKzOP5s+QQxEyZsCv5sy/Dix1VR7L3vr
         ePilF5xaz2ktQWsf+90593/OYPbK+bdw/tnxn+8gXVyAeBgkCEI8mQK3gmuMOb6hbaLF
         e3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yq0u4880shqeHACPW1JDK23gmXl2LA5Liy7CXozcygI=;
        b=sn5+6hBd5bdCUaDwaaQq47S1A4GQHWQ4j5/MwFRwClAf8QxgupmZ2fi0dCniZWz7px
         mgNI06M9t7KJGjjmXTB6d65c7Kg1261+VJtuoVsPITJpkwx82Z6NXfVxe9HGSap+T5nX
         Za4LMms+jnVRvXltSmUcWTk5dVQIGfoOhnJ+yFG6D1wobj2F4U7prxRZYOMPF2AwDJSK
         miIFNIjxgZyVUAFLxLSoMcpY+he8yHeThOhUj+iFbQiZiJuWoU/RSr7dlTyKjaipYxM+
         q1p0HMczA/m0PTHvAZKu/rJLvmclcqsVs9iwNaFoUSLsLQwjGw6Nm38Eph/SrtziFtyI
         4efA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FQ7BXyWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si9559024wrw.322.2019.01.09.15.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Jan 2019 15:28:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FQ7BXyWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghNGy-0007Km-NX
	for alex.bennee@linaro.org; Wed, 09 Jan 2019 18:28:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghNGr-0007Kb-9l
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 18:28:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghNGp-000581-5r
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 18:28:25 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ghNGo-00057j-Nx
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 18:28:22 -0500
Received: by mail-oi1-x243.google.com with SMTP id v6so7802685oif.2
	for <qemu-arm@nongnu.org>; Wed, 09 Jan 2019 15:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yq0u4880shqeHACPW1JDK23gmXl2LA5Liy7CXozcygI=;
	b=FQ7BXyWdcVF6PQr9hEpsvjYpSlPwiAwbiA/rdfOfpgrq+JXtBrLdMnr2MjifWmPyrM
	Zuuv01mv6drTvzNYRiYGFuTOvWnpMa368nc5YyIdCb9qHULeR+l0qJnDcO5JxtZiYnb4
	Aa2zLeI3QsXxRu7DrD8bNOGdWACjTNrfPDP9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yq0u4880shqeHACPW1JDK23gmXl2LA5Liy7CXozcygI=;
	b=K7q+ZPnH8PevOe7NuzHHIy8b4TVwjqILqKmOq/CxaPde/Y3DzO/pwkEvKRmvvFoDaS
	NVyCdW2KHloLMWggh3R8Q5cwqdqvESgZtDk+BNXvLpNgWwMoK+YdnnuB0tJHyoeJUQ0h
	Utui4u5OH6mJWlTER4ja7BFO/LQAwWbGtbPQeggbxZBxJGXrf/pxdm8counfI0zb+/Tw
	IKldgGbe9iY1Aez22J6m+wpqVw9o29a9MO5ihvEjHwX/hAn7TRd+kUYD89aHZ9vfAOvi
	VC1qjocTO8KEZX+QxiDSUMUmc6b726/UzX5KMWPzaM+OcBDBWF7gdcCkZZfJw3/Gc2An
	XZvw==
X-Gm-Message-State: AJcUukckb3GO7Hc4S6VFWDNs4pnw66CaQV+jDUQzJSONom8uckJy0IRO
	v+cNRbSrHBuLWLFCg+/NxZDo5iSzhbq5UZlP4UI/ZA==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr5338650oic.332.1547076501486; 
	Wed, 09 Jan 2019 15:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20190103094211.28473-1-geert+renesas@glider.be>
	<acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
	<CAFEAcA9jk1ocW8h33-f9mRM52mT96o+bviaRe6MRErkyxBtqYQ@mail.gmail.com>
	<CAMuHMdX6gwnw7RYQNik4QQmfWoTmemMgrUaPuW9Rgd56pW+4jQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX6gwnw7RYQNik4QQmfWoTmemMgrUaPuW9Rgd56pW+4jQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jan 2019 23:28:10 +0000
Message-ID: <CAFEAcA9-eo7_1Wm20JkwCs_yG-r6v3aw19T0BVpp6qePw+JnmA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Auger Eric <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iLDR67jmG6wF

So I should start out upfront by saying that I'm aware that
the reality is that people do want to do passthrough with
this kind of hardware, and that's not an unreasonable
thing to do. I just don't really like the way that pushes
the software into having to do ugly things...

Overall I'll let Eric call the shots about how well this
feature fits into our sysbus-fdt support; he knows this
code much better than I do. (I would have preferred us
not to have sysbus-fdt passthrough at all, in an
ideal world :-))

On Wed, 9 Jan 2019 at 16:30, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 9, 2019 at 5:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > whitelists for the devices we want to allow passthrough of and
> > that we've tested to work.
>
> In the end, this will become a loooooong list (SoC x devices)...

Well, yes, but it deters people from trying to do passthrough
with hardware that's not designed in a way that makes
passthrough reasonably supportable at a software level.

> Reality is that on embedded, on-SoC devices are usually not on a PCI bus.
> But IOMMUs are present, and virtualization is wanted.

I don't insist on PCI. Probeable, and consistent in
terms of what they provide and how you interact with
them, is what we want. Embedded on-SoC devices are
generally neither. (The host kernel could in theory
provide an API that exposed only devices that were safely
pass-through-able in a consistent way, I suppose, but it
doesn't, or we wouldn't be having to fish through the
device tree nodes making guesses about what's safe to
allow and what isn't and having heuristics about not
providing clocks info being ok if we think the clock
might only be used for power management...)

thanks
-- PMM
