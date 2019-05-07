Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3220638wrh;
        Mon, 6 May 2019 22:20:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymsnc2WX+KUtDziQcTOZ20a4NaKgR/bklyhs79ZH0A8YEGzX+0ezHlWHwuAf1Yt6qeih93
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr2015386wme.20.1557206401307;
        Mon, 06 May 2019 22:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557206401; cv=none;
        d=google.com; s=arc-20160816;
        b=OSuZhwe0JxXLPmAV247lbhJ2zWUNPAiV0fAyM08F6lc3rSbQp+ietlSb+QFcnDu0Ml
         lt+V17wxIGeVkIMpb907PuR6SrpbgI+j9DUsZ6LcrcFJthzDbOxcNrhc+mBDQt86TiWD
         8b4nXYdFiOplz1WE8lffFtTAP1AdDOUvtTNjmJ5bttIe/qtxKzT0limS5+kdZScerOa+
         Bzslzo/81vylFAYfpfYdA13OWWeA89D8xucwD8C7KWHNvJz0K9eVE8ApGC1TKDsPvZCu
         cbdZiShknyk0d68DVZbWPx/N3y0URdahEU6ScTzyYnfwmmyNqS247uOvF07GQizhrEXf
         zJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Q3RTaurrAtxC1189nQE25YPP+zUZ5R6GSlulNjUJF7c=;
        b=vf0yOCHzJkgge4k+cg8eirTfwtBnKsrEieDY+VCLEwtfsm4sslKzdYDfcDSAhCHH2X
         ykZL2hLdwygmzAzzr6LAKfxc5KMoBL4lp+oPgszi6A5AcflNEbZMQ3c1HHXnFvmWkEL9
         MIg8s5xdcN0veMKCiRgTZW17ngR4EHS2VKJUgzq+T2e1XF5mrQr0Iy/P5YfDLzpIKsum
         h8Bx2GG5GRsI81SXiUm6amsweungsiy16mfv1FOQz/Tdlpvj523x4GI8fEZKIsTZh6YZ
         oOk0hflA4T2QvI5oi0TLseeKFah+cOx6aeJoVuTV6GTRXAz6qf/HUF530v87Z6aGlhOo
         0V3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=XTsxQJPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si8917232wro.320.2019.05.06.22.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 22:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=XTsxQJPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNsWG-0001GL-DC
	for alex.bennee@linaro.org; Tue, 07 May 2019 01:20:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsW0-0001Dx-Ml
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsVz-0003LE-Sl
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:19:44 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:39751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hNsVz-0003Kk-O1; Tue, 07 May 2019 01:19:43 -0400
Received: by mail-qk1-x744.google.com with SMTP id z128so6791397qkb.6;
	Mon, 06 May 2019 22:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Q3RTaurrAtxC1189nQE25YPP+zUZ5R6GSlulNjUJF7c=;
	b=XTsxQJPp7kMvQwzfVUiHmEjCNwQZAGU7zUskZ75UVpzCbiW7rYTYvlU26CnmKYuGdC
	vOCN7RQl83WtUaqVlNRCC2E1kD1AWKRKsJX+qaEH+GvLZ9Zc93re5d4mSlGvP1e5SpB0
	J6/3drMq5d3bODLg78pKHw4tZMFYMcVHUWjiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Q3RTaurrAtxC1189nQE25YPP+zUZ5R6GSlulNjUJF7c=;
	b=U6XtyiHas/5XnZsNtTzp+lOaH+7vFZ4KpV+7U+tLHHyvmbtey5MD1NkmTfsRLdx7tu
	p3vUg+2BGeT7W8uyaA0DD1xltsrYLtMMQ5HZfWfXIWLu2ZN5KBDi65Upq4+z8AqwSJsu
	2lAGYoQJbyZRTqOswiyTD9QQZnafxc9bQlSD5+WgCOe/y+iTY6gKBZfapRbREz6SYWXK
	JFxSGhM3H5OSUwVHY+LEJKiFGtoVowDUi4z2n6LlbdLuQfd5qKjfzrMrCZU7tMGPu32N
	OD0zJ/G/BFt94S0HWvtMb0uC4iBMLcjatt/AR1GHAgpKOQ7AIn9uEIQCXBlDDYRfBTU9
	348A==
X-Gm-Message-State: APjAAAXVrIaA5eWblNFMsaJPmZ9zXoO8fKq23ywAnWh2QVYnBY1J8AMT
	t5x7p1O04cD8y4zX7uKJdpPg1F67l7eIH+dBFEE=
X-Received: by 2002:a05:620a:1494:: with SMTP id
	w20mr14213907qkj.336.1557206383069; 
	Mon, 06 May 2019 22:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-3-clg@kaod.org>
In-Reply-To: <20190506142042.28096-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 05:19:31 +0000
Message-ID: <CACPK8XcKO25K4cfQJCXid8CLZmfPFuggt-mSC03cEvpcORVbrg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-arm] [PATCH v2 2/3] aspeed: add a per SoC mapping for the
 memory space
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MKW4RQdJ2deq

On Mon, 6 May 2019 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This will simplify the definition of new SoCs, like the AST2600 which
> should use a slightly different address space and have a different set
> of controllers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
