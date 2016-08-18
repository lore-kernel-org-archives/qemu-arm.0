Received: by 10.25.21.156 with SMTP id 28csp340966lfv;
        Thu, 18 Aug 2016 07:15:28 -0700 (PDT)
X-Received: by 10.200.38.201 with SMTP id 9mr2614509qtp.135.1471529728249;
        Thu, 18 Aug 2016 07:15:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p189si1336308qke.290.2016.08.18.07.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baO6R-0000Ov-Ln
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:15:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baO6M-0000No-94
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baO69-0002nI-UH
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:15:22 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:33484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baO69-0002mo-Pc
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:15:09 -0400
Received: by mail-ua0-x230.google.com with SMTP id 74so30215020uau.0
	for <qemu-arm@nongnu.org>; Thu, 18 Aug 2016 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dkT4c70I162WIf4QZyn9CZLJ/RWv9BHMjOamk60q7n4=;
	b=k2GOi1FsgIx6f7O6Yy/4c2TCteaAwmQ2CaIVkdpJ+q5TUpAHt1UAs1ariJ9zexguDu
	iid2G9rh7/VtkeNIPJGLsjUNYJWB3GLQ5RQ2xT5cDwrk4fOV/K3GY7//BqKYBROq6Rgw
	Crk0eptobbhGWLAJiCmhzeiSUxSuUIgDBRl1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dkT4c70I162WIf4QZyn9CZLJ/RWv9BHMjOamk60q7n4=;
	b=hfPOObqn+/OcZydiqrO55ghVwAAAk5f6P5nMwyj2IhIXen8ehpUTWeImSqhVVwr9We
	J/g1HT6rbBjiY2EB68OKQrG6a6CYMgta2dIX3wwvMSEqgwom2JeiCB5G5k6zZUVY4eno
	iYQ+y0Rld2aD+d+GKFrxRM58mDf8VIlrMvsgpmwYPoUuanw+oroitZopeqIhSha9jP03
	H1G6RXmcOcRDftBvr8KfDRdak4xI9D+NF9HA0jSrTpvWvRXDjHQ+mD4z4V1SJU2HXDyK
	mQsnGu1cYvV0X4GD81iPtU8dQTGki+h6XFqBNdBCkaVoZZtgmxEDBlj6kVh1BfAjwWz9
	lroA==
X-Gm-Message-State: AEkoousy+O+I+K/Cu5mnvKLHOrf3T7jrNaIU0I17OAbzaTKBQ5qbm0tDwL9o46WP/4T6cjtEfTyuDf3Ho/rVMGIe
X-Received: by 10.176.0.212 with SMTP id 78mr993404uaj.107.1471529709438; Thu,
	18 Aug 2016 07:15:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Thu, 18 Aug 2016 07:14:48 -0700 (PDT)
In-Reply-To: <5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
	<f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
	<5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2016 15:14:48 +0100
Message-ID: <CAFEAcA9J1_xGV7ScRzPNdU0qVa5nREa1ibPVHZgA8Nj7FXeGgw@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: infeZq++WhQW

On 18 August 2016 at 15:04, Richard Henderson <rth@twiddle.net> wrote:
> or (2) ifunc

While we're on the subject, can somebody explain to me why we
use ifuncs at all? I couldn't work out why it would be better than
just using a straightforward function pointer -- when I tried single
stepping through things the ifunc approach still seemed to indirect
through some table or other so it wasn't actually resolving to
a direct function call anyway.

thanks
-- PMM
