Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2691016wrh;
        Mon, 6 May 2019 10:58:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHczEofrIvy3VoqmEKeh1P7RjDzy743reVXa1IBvtRUHrETQ2ME/k/VCG0NcCsQ6S6WzEM
X-Received: by 2002:adf:f309:: with SMTP id i9mr18707968wro.258.1557165491643;
        Mon, 06 May 2019 10:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557165491; cv=none;
        d=google.com; s=arc-20160816;
        b=PO3oYwZWBva/RmrTPQoF+odOjMQIeMuPJHa2DAfA2lYSUEpj71wnrdymVWEyLJHXfq
         AjmWeDK1rXTTX9fP8p7QnWNoQVm3c33J7UL08nY2PtGB8IF/DAu08t+z+5KGTfi+oUw7
         +MRCz+s1ZdIEP/zElLz7DJAa2SP1V0hVdCILFUfIYVoZlAn6sVcVxs5yEb9R+u8bQFmL
         21HSFzLo5OybfLKp2Sgo6qaN6gVPKm4hHTK6DwDvCLFpRJsHgskYyw5DOixr4D9P/7ua
         AeG3zTWkAW1gqxn/MQdMMbxcfikuVOudUK6T2GoS/60kM9hSLMidnGxnGLCiJbO9RWqL
         ubGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=36Fsn3xcHSFGDQA4my1eogQjONmqZJI9mRQYBJ8NslY=;
        b=K831yEXJo1HdykUXUbL7yGaU/CeKFSJb9yoGL9KAh4299k8tOrYzC9RZ10yeuBO/8O
         JD6UQUiVO8R1IhiQ+bm86sbEGtbmPHw6zmwirAGblSm7+LhOvNMrRSYWlbGJsrAwr4wm
         Gk5rcEqVdnF8W13ZMvqUBnJzI4G1DnvVYbHO+VQwjFC5qVC3ONUkHSVpk2spvw7SZSho
         uujJV8H3eTbOHDTBPx2t5mvjwpNjOJBnfAhXD7fj53vH3yvODRu2lQk4OntNEKe4nQZ3
         vMXrimLi1JqTyzWhANLRMUobrLPIlI1NLndGi0XLN3if4Xv2+l3hH40MB3dOEW8V+OTB
         NULQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vw9LG8YZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si336327wrm.457.2019.05.06.10.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 10:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vw9LG8YZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNhsQ-0004rH-M7
	for alex.bennee@linaro.org; Mon, 06 May 2019 13:58:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNhl1-0007Mh-91
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNhl0-0005IO-EI
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:50:31 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hNhl0-0005HY-9y
	for qemu-arm@nongnu.org; Mon, 06 May 2019 13:50:30 -0400
Received: by mail-oi1-x242.google.com with SMTP id w197so10282846oia.2
	for <qemu-arm@nongnu.org>; Mon, 06 May 2019 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=36Fsn3xcHSFGDQA4my1eogQjONmqZJI9mRQYBJ8NslY=;
	b=vw9LG8YZhh2+iuiqdt1IJCehylR9CoKkbnHxGgBKjE9vI1YeGkbF8kqn7aRgBNKhdZ
	06gydMfP8HCI/HphHgKYP4ySaGy2BQhWtEn5e59z3IznfeIcjiIh/CJtr2qBiyKwsUxC
	bfZ8Ghv48EPwZBhnV/ATYBRFn0Dzm/r2/Vd+XEy0cJX7Tq2ur+QTGvvM5tHqjCjFAzyA
	1n8AhS8rkjfJhUk7Uqb8JjAJBpldl9Ab2jgvFmRlxjJ5S6jd5RPd4ARKTSXNdRXWz569
	5imlKtajIBk5/Vjrr/X1DTa5x9vZoIO+sLSgBagTHrjc964umTY7+OOkC4JyqxADZwOU
	ywAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=36Fsn3xcHSFGDQA4my1eogQjONmqZJI9mRQYBJ8NslY=;
	b=kShFm69jGRT4MfLnzIyQmW56fbp1vW2MsdjpmLpjY28+lsz0ln3JZ0gWqSpOHPAk+j
	eliOTPZ2r8w3/Ba7XyDO/+VBEW7ihTQsmbPt6tNMWOgfcrIoaeuvJrD6+g6IhOM2Gjv2
	O9hKuk4eyg9EXg0KvntOePr0oygOPGTgKAaHRn1gEeHuvelpQMNH1CIBt7MS+TgdV/73
	Z0z1E/tr2mvi2nJmZ05hX9VjMMuf97h7/4qSHarNQQ22fiC4uYrvpQmZVExjQyHW1sKZ
	mwhF1YIIhSooKlvWJV8AL2H39RNJHlTPGGG2+bUsRhwxwAAtSrEz3Cqc8mCmtyxEtIdT
	L+yA==
X-Gm-Message-State: APjAAAVXD+BAl8bn+5wFZTyPXOZgA2Dqyc1P0VnFL3E7CUDCWcweSBMb
	8+HkpvOoH46af3qdkyRQbOc6FMxnMXiSnGthFy2H0Q==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr2076049oif.98.1557165028822; 
	Mon, 06 May 2019 10:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
	<CAFEAcA_YU-MdnrCcSTyL3b93wTCCDzN0GcbSRe28ZPh14FPB6A@mail.gmail.com>
	<CAAVaN8xxU7ZzDZ=-TMe8_U5z8Zoiq4ny-Z1VK8bgUyAJ8YdPXg@mail.gmail.com>
In-Reply-To: <CAAVaN8xxU7ZzDZ=-TMe8_U5z8Zoiq4ny-Z1VK8bgUyAJ8YdPXg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 May 2019 18:50:17 +0100
Message-ID: <CAFEAcA8cYs2Z2viWy9GGF=9=k--h4+cZizdSc5bpaibuAzurrQ@mail.gmail.com>
To: Andy Ng <andreas2025@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] qemu-system-arm with GPU support for QT with OpenGL
 on
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o37pllVhvJQr

On Sun, 5 May 2019 at 18:46, Andy Ng <andreas2025@gmail.com> wrote:
> But I get the error "Guest has not initialised the display (yet)"

This just means that the guest OS has not done anything
to draw to the screen. The problem is almost certainly
in the configuration of the guest (ie either the kernel has
not got the support compiled in for the pci controller or
the virtio subsystem or the virtio-gpu, or it's not configured
to try to use it for a console). Check the kernel logs to
see if the guest has successfully probed for the pci
controller and whether it knows about the virtio devices
plugged into it.

PS: -device virtio-blk-device is using virtio-mmio,
but -device virtio-gpu is using virtio-pci. It should be
possible to use both at once, but it's a bit weird --
usually you'd just use one of them (virtio-pci is
recommended).

thanks
-- PMM
