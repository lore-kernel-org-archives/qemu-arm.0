Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6885469wrt;
        Thu, 31 Jan 2019 05:47:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4lmLTG0/kChm60EWHDSPB071H/RcePt/JKScxSTNcmrpKwP3E6sPX4gUWOd+G4RAr80hc9
X-Received: by 2002:a25:1006:: with SMTP id 6mr32012226ybq.151.1548942424081;
        Thu, 31 Jan 2019 05:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548942424; cv=none;
        d=google.com; s=arc-20160816;
        b=YgclI9txwpWSTZ8NmcwRPzGaSbAhFI48bjVel468ooTe3mu18vQAJqauUFO8P6PMfF
         U2XwYa+pv9kQhw3jMhtgQWEbWQgTQGOdOKdayNOf3rz+xZywS08qywkm/zKit+83BU2A
         GusRybe9LhaFS3C3YQhwxTEu/IZZRwiXO/5OMVujT23UNt/yp9wPKgVpfQX3w45jFw+U
         SzNZtVhlSqZwOaqtGPtDb+COpzwQqJIlaI5iDfBgdMrLob75bdg+kspH5Ih3HcqLQ4q2
         pl+49pUufWPCictVznI+aexrZlkJrjTciDKcFtsczo7Iyu++kilFYdQekEOh5fXERz8b
         SUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=DaVi/DkJTqhyWHuLTtyLvGtEyBk3rqSEWhGBOHAJd1A=;
        b=Oei35ULvPuSaaWTc1YMDA/kP8s74wdXOObQY6sKVpSMef95SRDeIaHTgXYBdXGvm8O
         5l5SYf4xmMBGGGtuCD50txb7AmTu4a4BRoP0Xkyhl3Bg9dnibDcHeT7oSer5PI/tTZkN
         EHSV+j9Dv2IVYHAcM6Om3P0MHjNdjzzq3p87ZIsEaQhZFYGEG9JFK6L9FHfLOl0ZdBqq
         9uaCL5f4M3vyc37SLFYcfQTbEaW89FRebKlqB7H8C2JuhR44X1YojAsRZrIflUVOijoo
         VYDli2i4g2iOLNVWxup2S3V61noADRRTimFqxxnQPoGL7pkwcNL9oeprqYnddwkvx9/1
         476Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QMhx1jO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si2857115ywl.352.2019.01.31.05.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 05:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QMhx1jO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpCgJ-0004vW-Gl
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 08:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpCLj-0004Jd-P9
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 08:25:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpCLi-00089I-Vu
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 08:25:47 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33539)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpCLi-00088d-Oi
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 08:25:46 -0500
Received: by mail-oi1-x241.google.com with SMTP id c206so2724213oib.0
	for <qemu-arm@nongnu.org>; Thu, 31 Jan 2019 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DaVi/DkJTqhyWHuLTtyLvGtEyBk3rqSEWhGBOHAJd1A=;
	b=QMhx1jO3lurVbA1Sz5hm+hUyvaTayHXxjD4Up72VXooNGzBa9E8jFQrqrvXREEM/5q
	WpP9NHrvIYlRPI3deNBCUoQqBYFqYpKPZMMlepI45iiQ/GHb3kxL6Mgr+8qRijOAFYHQ
	ceT/ej726Oe0Tl75I32USRkFRUkboSR7yRgg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DaVi/DkJTqhyWHuLTtyLvGtEyBk3rqSEWhGBOHAJd1A=;
	b=nvR377x2zHXBuQlmKNl88ZKkxHO2mo73gARoY6BJc4qWfiSa/JQfAhyU5RCb6YYlrt
	5W6TpnkHRV6AJrbfJIBIusI3RtBKNgy35YsyicbK31q+7pc6OZn+UeplT4CkcnposmAe
	HKSg78Xnxk/NezZRG3coSz6Bz8LwlZN5J8G0EaudCzUxEuQrnJR9C50YJTC9BMHUdWPr
	SEt6EA/EnKmoU0MVq7tqyQfrp+nbAPGa2YjlctvUVP4IdtRACr6gEAVmhQve+01qBsnx
	6/NKYZimiHXGlxeav1B2OOn5d2iocYFQJmMC08JzwkEQPb4DpL1Lk3kyw6xe7kjmHvnZ
	wFkg==
X-Gm-Message-State: AHQUAuZaTPZiV/GupofG7l9J9U6DOnN9YhfUTBy+XpSCqO6AH12UrB5X
	0ORjQ7w8rDEZUjE//VW5Zpz2XYCgEArpT8EK+F+dvA==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr15631535oif.25.1548941144916;
	Thu, 31 Jan 2019 05:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20190130072131.13247-1-stefanha@redhat.com>
	<20190130072131.13247-4-stefanha@redhat.com>
In-Reply-To: <20190130072131.13247-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Jan 2019 13:25:33 +0000
Message-ID: <CAFEAcA_bho_mZb4+wXYmo-Da3NfeKUmCwGm0qiuKZZ+F3UHTyA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v3 3/3] tests/microbit-test: Add tests for
 nRF51 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pe3ZWBvQ2t9E

On Wed, 30 Jan 2019 at 07:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
