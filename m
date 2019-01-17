Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2151912wrt;
        Thu, 17 Jan 2019 10:45:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5uAIzRJW/Ynb062ijfhTZlaUPtENjaJySS81u4ZewK2fsvQ8NhITfo1kV9eH/Xltlczgh8
X-Received: by 2002:a1c:c181:: with SMTP id r123mr12879155wmf.8.1547750738412;
        Thu, 17 Jan 2019 10:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547750738; cv=none;
        d=google.com; s=arc-20160816;
        b=eQgqNBgz7+A7mPYoHSLrIGSkJAm+L8iwJiyiTcIJhmcHDkIxg8VTj89j2tszUAUvcp
         rQTQksqvC4scD5hB4zegvTKjdhUpmtLuKr55+W5BM7+jSsSFSHO+Qf1XMNLLwLthd1Lh
         GMu8AJrDFyly6ZhI2JpjEcMhKyjD4UiRRsM1E9a50ZY8ehdltInZTfwAFIiFNpDIiMsw
         TnFm8K5ljGVuJcgF/2nvRQ8O0BfCH6R2rJTY9tEPyyyegOwEHgyCeMT5oiK6z7IrH+Ej
         BZfPw1QUliWVrjw6tJ6wwYLxfAlxJwaWF2Mh/reNH5XJg+j0U9Q+Gs94q1fi6Dj33hNp
         hwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=sieKBjrs2+FQd/YPca0llqAcpOVkuKdEi3w0NqlhDZo=;
        b=t/vNvBVsGRQWMpfsZZe7W2bGTCQyfXQ0nd2KsqwafAiGCLTU8qWYgaHrRJcV+Y/vHo
         xI1kSmrXQLGX1ELVzr+J6VOP0KDRvQKe2tDz1Wvw7MMLdIQU1p9MHvM6XRDLEJY2jxpy
         i4omoz7i9IRiXV25k0/rvCvONVG+JnYJbx3ytThjjFYmN1V2D2Wi5467lVn8sB9oXsE/
         gdptyOReCa9a1bmwXtclVCuMzpl3ziVWmWR13STuY2RWr4f/a/EO8xhiJtGPfGESGavB
         flrV7fHLDpw4FdMOAOBubIqQQiiwJ4Etv1NDSMIjjw4rPp14SeZnLw7ei5NoUDs+LRmz
         Mfsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xi5QRLSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si25442504wmf.72.2019.01.17.10.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 10:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xi5QRLSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkCfY-0001fo-Gu
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 13:45:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkCet-0001PZ-Kt
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkCes-0000Ll-UT
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:44:55 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkCes-0000JQ-PK
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:44:54 -0500
Received: by mail-oi1-x244.google.com with SMTP id m6so6959132oig.11
	for <qemu-arm@nongnu.org>; Thu, 17 Jan 2019 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sieKBjrs2+FQd/YPca0llqAcpOVkuKdEi3w0NqlhDZo=;
	b=Xi5QRLSLTXM88oZNWteTdTcms6F4WgwmpvWYxwzQaiPMS8SCsVs7S2kWA/dVHsF66m
	9ODCcs/zpfEYC5nZP7Zb2ur8ziAQBCBBt3HQsRpO+fOKMYBY7w6kmIIoxPDAbA4/8ZF6
	Z4ve6sE/ohdsLRnTqFEhE3HmUdrrK9E6nYbvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sieKBjrs2+FQd/YPca0llqAcpOVkuKdEi3w0NqlhDZo=;
	b=dsx+qXPI9kSMjgIjiearunit5YgS+qU3SFZFZftxkJdTKDjT6AhFN8aeyO2auIkY5D
	ke84AFKuoKYbhWWDwJBNWFcZOtWUT+YFrAnptes00WNrBm2XfzNI2hRMuh4gt3Z1w/8s
	3e6L0lB/6Z6XNXwnzGoBxVf9MsScr3K2O2ZisVcutvDa41Zb/RN+cgYosvu2vPJgylwQ
	hO+c5T4nUIP/DFyqcPJyfPs7e8zVE96Q2Se+VSvkQahdCqpPGPILXI3Dadh8zmTkpaxE
	2sr/aiNycn1CoQb+6pGJ67cJ5jFQZDGvLEsOvyquFk6Pc0cUthOIXS2CjxEmbi9kq5Xi
	sSgg==
X-Gm-Message-State: AJcUukdfK4Mw+mCcJAz1IiVjQsWsuBaeb4wWAmMz4AufyHlAtidQDxyv
	mF1lJN/4NPztc1bXrycHvfJY/rKvKI3Yahe5S0As2Q==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr7484755oib.146.1547750693717; 
	Thu, 17 Jan 2019 10:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20190111125759.31577-1-clg@kaod.org>
In-Reply-To: <20190111125759.31577-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jan 2019 18:44:42 +0000
Message-ID: <CAFEAcA_x+4ReaCrW5CYmYqyJkbW72J-t7svthGKt325A1PGL=A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] ftgmac100: implement the new MDIO interface
 on Aspeed SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: egXHUptQZWQa

On Fri, 11 Jan 2019 at 12:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The PHY behind the MAC of an Aspeed SoC can be controlled using two
> different MDC/MDIO interfaces. The same registers PHYCR (MAC60) and
> PHYDATA (MAC64) are involved but they have a different layout.
>
> BIT31 of the Feature Register (MAC40) controls which MDC/MDIO
> interface is active.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
