Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp567822wrh;
        Fri, 3 May 2019 06:32:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNgdbdQIeRa+wNm4lJ7C6U2x6mkDs97S7y+yvEQCxBffQmVmKDS8qBG8OcoUoNEDYJ5h6o
X-Received: by 2002:adf:f50e:: with SMTP id q14mr7240532wro.48.1556890349438;
        Fri, 03 May 2019 06:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556890349; cv=none;
        d=google.com; s=arc-20160816;
        b=YBKzYDsVHQ0FYra0ihZ7s9N/+l5Rg1KDlaohXle/bahymLShJLaEHsggPY0tFW9BcD
         fGL8PJb4iuXdyXboHH5dYuGnb0JLSKKNF9jKIbQOkOKH08kz5vbdPoHHMWZMJ9xzw7Vr
         ddG2tj/hpKK6i5rwKuBt4ODLmIhIoQYuB6l3CNHZtU3YgPwL/97BdhLRmKT0pG+/IsJm
         mUUnqzGHVx9m9YJeNIUiQeG9CG6xskJPcwbmryODqWFsbgGeDteTsSaKWq4MsvRrUI0s
         d/5dg+pHqj1Goe1hBJrx0acmYmp6utXnIL9D2qIenSaXlpAH788mU2Ku9+pHr4XfL9dV
         zZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OA/eCiV4/Br9WIY15LkCNmcRYoJM+/C5INnekXkEn2s=;
        b=aOGB0qJiHqS16sTmgM3UiYT56fce0TTJ6zSySFY1h8/CdG199O1OjS8Dq505bpSMFA
         hcC4qm9b6CasiWt54Z9ouBFaI3qwEo3cml9M2+F5I2/CGmJC3JO8pdAFk0BfKqlyPtH2
         D1OKayKQwozumAwlExGk6lwoDhND6RTNog0CibtvE3ZHvzxBMuAN1DQaTK6SWDEtUW/t
         DYpj78D8Ivovukj897aDm4JIFfH0PmdrGdF2y5SOFKnaBOOXSDfvI6LYiAp++ResZrBi
         ZIGmDFcgoyCifqrGXtAf5AT57xMEUKJ0zVUP5+Mi9d2DHBp5l4ZUkyha+7pj2mRdObR6
         P4EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uf2ntE0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si1575486wru.14.2019.05.03.06.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 06:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uf2ntE0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMYIe-0000qU-Hf
	for alex.bennee@linaro.org; Fri, 03 May 2019 09:32:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYIU-0000qE-Dh
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:32:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYIT-0007Z8-Bj
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:32:18 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:39761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYIT-0007Ws-60
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:32:17 -0400
Received: by mail-oi1-x22f.google.com with SMTP id w130so3983829oie.6
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OA/eCiV4/Br9WIY15LkCNmcRYoJM+/C5INnekXkEn2s=;
	b=Uf2ntE0g/g17eZvrRRSns/CIuJqC9yEv7m5cE9N8lwMPacq2Fb6rfm/YHXnnO8Lp2s
	5eRorjvgLSgfO5k8aUbzXGCUYR7EBAG9JbKW6iqEDTQpJJgYz+nlDL/ytyRvNXAzIwee
	fdnrqo1jJL3N5/lTFS/ijJq9ZXdXzopFdfQACbbuhN1c9JZ9HnoNYrjlrfonGJfdNjSb
	oFrkAoflhBjdDT8sBPR3A4AG71SnvLE73YxjgbKVYxZcvTvploVqo/Evv8V7d/tBzJRk
	IN71ZT8JJPf89jEG7MceWgB9GcK+OqbQDej4qkWVF++TGFwl7oll51Jkn84sNNc+lpV+
	aNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OA/eCiV4/Br9WIY15LkCNmcRYoJM+/C5INnekXkEn2s=;
	b=YAsFAH4a/PiJGhspDDMzmn4N5MDCnlchFVUHUFugV+4U1uaHATJO2gi//LZPQJmN6I
	5iHVUCcwsOGQ7ZSdfHTgOv3fPEzQSisjI4DTNXRZjL5AixSKE6ap+rTHrLi7ed9g1pB5
	foNbozqgtWyB/+9AYJSqnDtkhwt1SRimU67hd+3ae1G2E7S96cs5xNBP273RUZ12loDD
	UZ8wreR+73iAEI4uPxZBIwOqir6SO7XIEr5CsbnzoJezIbm0yZpEPJ9TAhkmeV/Vq24N
	jY81UsISX0z4nt2skwLy01CKZv910VQ//ygiRTHM4T2R2MZbI0kfZCYTnygC3nM9fCEy
	JDWg==
X-Gm-Message-State: APjAAAXIbGTp+SOxk2ZSrpS4cfrHdQwlmMseUg2G8M/gj6iRQhitvNic
	P2DbaAKX8Ma2nPpLjzcPcZE83guc5PdZ4PGoyv89Sg==
X-Received: by 2002:aca:110f:: with SMTP id 15mr1642459oir.163.1556890335654; 
	Fri, 03 May 2019 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190503022958.1394-1-joel@jms.id.au>
In-Reply-To: <20190503022958.1394-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:32:04 +0100
Message-ID: <CAFEAcA_yYvV-WmeicEo_EYBFp=0987fFORaqcv3tucX=Db=Hbg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22f
Subject: Re: [Qemu-arm] [PATCH v2] arm: aspeed: Set SDRAM size
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /OxByGNMsrpH

On Fri, 3 May 2019 at 03:30, Joel Stanley <joel@jms.id.au> wrote:
>
> We currently use Qemu's default of 128MB. As we know how much ram each
> machine ships with, make it easier on users by setting a default.
>
> It can still be overridden with -m on the command line.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
