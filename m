Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4172030wru;
        Tue, 14 Aug 2018 07:56:57 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwh3eVDNV52krWWcjmnWJ9Lqkvk1ZGev7X04K82svIq3FD3/kYVGYTMdWpgqbBkrcwYvSxr
X-Received: by 2002:a37:5f87:: with SMTP id t129-v6mr21126944qkb.23.1534258617631;
        Tue, 14 Aug 2018 07:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534258617; cv=none;
        d=google.com; s=arc-20160816;
        b=DR6vuUres0UOXEIJdP7wSLrHW0fY2/nTakuxvj7aAkCwbeNTZRCZ/Ip+IS1v6zoH8x
         P3tulhZVG0V+uKe/v4fKTBFjAp4l3nNL8Jdv3YrEq8bE11hjOoaWZr8ZSCDYtAmH6u2p
         Fjf34vmORFgZwCeaO9/8ISVLPY7J/He0eYGFHVq189QoL73o6H6OCiTv6h0y0jJd21cQ
         8LlHxPwta4rgcUfJiYr1SGDzfZmLhKZUZ/xueop/3SSx0oJNw0vu0rt62UF1mVcv+TPZ
         9801OJu1clahtpQnPQ9SaaYLiceAMus4ESGxmbhetif9hhbToWvwndXvUM+2E2zvP1Bs
         UrIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Odx5AORjZ64li4Ta4kyk/R5pRr0LWjavenVc97EjgGE=;
        b=AYKvFRms+4Wh6wR5r0t6/50AqsFg1cuItEmBb2keCeNXwfYzS95XPaD2LXS2F6/0Oy
         gSrSMoa/3/tXFAhFNkTaFdVxUSlsS7CNyGWlUw8CoDfl06KKvIC492m+5yAqL7oxoj6y
         EjzG40MvchUTihXVlr6N9/y+UYdaEMPnf8fSeuPCYTzlg7PA99Q1pRaKQenqv++MCjw/
         JfyoMPn+FrA8TOFxiirOzw/k5hB6ECU9eZKvjkYQewxKoSII7cprlrVbAQPdO4zhoX8P
         UyFafNUsGfOX0X0KFz/5bDyI4YjouODTWwQtinQ8Bq4+cUejTq+eXbuD8JBYaW8ZRDvN
         92Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbZAct0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2-v6si217075qkf.348.2018.08.14.07.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbZAct0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpakj-0001zB-0n
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:56:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fpaaJ-00006c-Sz
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fpaaJ-0004vF-8u
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:46:11 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45357)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fpaaJ-0004v1-46
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 10:46:11 -0400
Received: by mail-oi0-x241.google.com with SMTP id q11-v6so33998081oic.12
	for <qemu-arm@nongnu.org>; Tue, 14 Aug 2018 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Odx5AORjZ64li4Ta4kyk/R5pRr0LWjavenVc97EjgGE=;
	b=UbZAct0uB7J+aXkkAxEGaRT5Y7nTn6Gpn/M0ctWc0Vx3vzk0KjTPldhXMUsMsuML/A
	/ucnuuoqqq6Slc/ZRWGmm0A/mQDkmk7ME3rCz2tIqm9CBDSTpv4nBVGdj4EMWnXJVIpg
	SdUtQrOPXgG2vdI/uBE0SBbfC7ezm81vW2TYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Odx5AORjZ64li4Ta4kyk/R5pRr0LWjavenVc97EjgGE=;
	b=PnPOuAehPNsoZQY/GNqHQf79JpUkvA53PuQ0TohIZgZJnP9FhZSixVqSIVWiVKnJFq
	YzvjB9pTEsffTOhwMFKdT+Coguf3RyF9v6/AW2jggfvrDNO49+GKW0bcZAmIdI76XGGE
	Nvj+7w8acxEJRI1TUkivMop1c5C/NB18dgjkO8qD5xdzCsBkjU4ixnOwgbMbNXyzR6kX
	QZ/a3mmbnFHA0gxWNt6zZYLjHedDKlVxBKYbLoHQHtRqrIFraVM/RBjJUP1+UwXct2SO
	IaQdB6RR5Mtyd2V+mBtlXDZa+ClJSV8szprDkXmazbtX/+cj++YNE2dy/EIcFA4B3TFP
	YRtA==
X-Gm-Message-State: AOUpUlH1OBVYDUTQvQs7exB94lQE+mmFp8w6vWnzyeAnVKps8oXo0IAZ
	Og+4wz9Z9u8kUxjgP8vwCZnZiy0347k5IgKB6dhREw==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr20577325oia.11.1534257970330; 
	Tue, 14 Aug 2018 07:46:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 07:45:49
	-0700 (PDT)
In-Reply-To: <20180814144144.slntd4f22eza5rru@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-3-peter.maydell@linaro.org>
	<20180814144144.slntd4f22eza5rru@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Aug 2018 15:45:49 +0100
Message-ID: <CAFEAcA9kv2_95bczA19mHaGFJo+5kvfnyo5Q6PC_JUzk_=oJpA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 02/10] target/arm: Add missing .cp = 15 to
 HMAIR1 and HAMAIR1 regdefs
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
Cc: Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Luc Michel <luc.michel@greensocs.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/a58ULYlRUc

On 14 August 2018 at 15:41, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Tue, Aug 14, 2018 at 01:42:46PM +0100, Peter Maydell wrote:
>> ARMCPRegInfo structs will not default to .cp = 15 if they
>                             ^^^
>                I think you've got a typo here

Yep, that 'not' should be deleted.

> Otherwise:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

thanks
-- PMM
