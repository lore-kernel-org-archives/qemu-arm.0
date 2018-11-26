Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5578435wrt;
        Mon, 26 Nov 2018 05:42:59 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uiwsy+g2OGoypA3uUHWkm+3APGZVoqCC9dsGFb8WZZ353lUwVC69HI9iaeKEr2ZMUnvYn/
X-Received: by 2002:a25:d43:: with SMTP id 64-v6mr27299701ybn.330.1543239779446;
        Mon, 26 Nov 2018 05:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543239779; cv=none;
        d=google.com; s=arc-20160816;
        b=pPooLjhybUCzeF/tjNj6VCucprUxuni5Elcuxk5n51WAFmedA0WE+oyN2O2R4sGJSh
         MQsmhDkMhOEG7RwkRcGzu/5qFrYgvP+0p82oAPtCzfkq7Y3B7y4qa9yZOxYDZ7Hzt5n7
         3PxBaAPcHHWZw3o5FzBnOvz6IW1b4fGjaaBkGMwQBZrYazPBbtGu0kDQyYQq7soqjePb
         nPlBlMH2k3onBkIrqrFZztxZhlVqHgF3LnB1bZpZ7jgj16CPGMP/wzMNLCIBSQU1W55y
         EJdaJk+ukijFEtf/SMPiQkT/GQKubbmsRlsu+acqBYdH38LqmJjpqh84WpPlSFFdPhnZ
         2kJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iPC0Dd9ecVOod1+xBFHNzZyC4lrWcaZNxuJR1QhCkHQ=;
        b=CUUiH1lbAw5bNKxt1LEVNc5FNMQylN4OmSVhxQdiLKFRcUFE3kQgXPQzWFPng/eWpI
         8nU4dZhEW1G0TPINYrxgDhTDtnUx6iPLlPiUOicp+Ij4RuVX0ZTro2wdOG8y3jbMniNH
         lDTo/lyfYV1AOvCf99cbNPTPjrWTxkcN2q7H5C68jsk8rI5EsyHXHjbwi6Ob6kNUc0Es
         UIriymq3tmCukPTG9l/MPF4acFB60RAtl0CT5i0O0KfLuOjSQ/nz6qdcV5dhqKYwL8jM
         G7f+u614t9kSnKsZWObEv1zZeWsjWG/6vAvNZuPTdDLLotUJceZAkPkmUav/dMGwnYMJ
         sYzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HGNdlaL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6-v6si258718ybc.42.2018.11.26.05.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 05:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HGNdlaL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRHAA-0001dI-TB
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 08:42:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRH9z-0001TR-JY
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRH9u-0001IT-0W
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:42:47 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRH9t-0001I2-SJ
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 08:42:41 -0500
Received: by mail-ot1-x342.google.com with SMTP id t5so16624659otk.1
	for <qemu-arm@nongnu.org>; Mon, 26 Nov 2018 05:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iPC0Dd9ecVOod1+xBFHNzZyC4lrWcaZNxuJR1QhCkHQ=;
	b=HGNdlaL2Y2yJZTaOR2PMeDcxxN2xH2f/GS7y3gitEXP/t1VjQwhnUkav50jHLhZxiz
	wZzCEv52Vel5QR13RU7xL8FTYqbogXchjfZ2eYXaTU0g3aqYXrY5S7dg++XgzUs7SXpj
	97NPSDJmuOUsY07ovFXRGqkjCAuRgXsiurtJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iPC0Dd9ecVOod1+xBFHNzZyC4lrWcaZNxuJR1QhCkHQ=;
	b=KAZJAkfEhkMfsd2KsZ4Krwe7iFcSKgiPXpc+3TANn6uW2pRwXU8/hLyLIXrlDb5t+J
	LUNCzR45v8rvJ9vo1Gs4/0mqRrVxx6QVqIAdMWxNnG/eoTq6nvF9cPORddX94GlJNvVe
	YXtksPWSroykGXQaUhxhrca544ZP9PeQk6FXXAUH073xDpYJWfdew1svsdwpZqW/nZye
	tQ9HvwXsMVRpKaOdlhTk7YIrU3F1pLCxbwM/S4rSR5LTG5FJffDt/Cw7i/FZXOrmusxt
	2iPkQs+1HA/L1FsN3SbnVAA+BPWxQ7vIEUUzaYa4SL4F7RxjO5nqgNNbBK7vTiKGsHcc
	VpQw==
X-Gm-Message-State: AA+aEWbYMDCl4Dw9RDcaJLgvpgWPb+icTR4+SACfK0SNtkagUDVvmqbO
	fgmNFSkJr6Cmu9cz+VeWEKZKx+fH9uPqWdQjtZDM7A==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr14122342oti.151.1543239760908;
	Mon, 26 Nov 2018 05:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
	<75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
	<20181123165945.GM1148@toto>
	<CAFEAcA8vWT5sayyBzbU7S8BwA06Kj=G1izioufjHFJdsEkyq4g@mail.gmail.com>
	<20181126125230.GO1148@toto>
In-Reply-To: <20181126125230.GO1148@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Nov 2018 13:42:29 +0000
Message-ID: <CAFEAcA_AZWwW7uQFCScBSZnw23AOQFcqXGXDRfZKnz6E3-yCBg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, mbilal <muhammad_bilal@mentor.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KACfujjaUeSG

On Mon, 26 Nov 2018 at 12:52, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Fri, Nov 23, 2018 at 05:09:35PM +0000, Peter Maydell wrote:
> > On Fri, 23 Nov 2018 at 16:59, Edgar E. Iglesias
> > <edgar.iglesias@gmail.com> wrote:
> > > Not sure if it's too late to even get the removal of the assert into this release? Peter?
> >
> > If you're happy that removing the assert is the correct fix,
> > yes, this could go in before rc3 next week.
>
>
> Yes, I think removing the assert is a suitable fix for the release.

OK, I have applied this to target-arm.next for rc3.

thanks
-- PMM
