Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1710944wrg;
        Thu, 23 May 2019 06:14:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwW8BXn0hjwIcByG64/kpE5lXEnH9GNyaYgRhi2AIrgMtRuVgVwRPBYz9YqJHxdPQD5lNjr
X-Received: by 2002:a17:906:b791:: with SMTP id dt17mr17917167ejb.226.1558617267957;
        Thu, 23 May 2019 06:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558617267; cv=none;
        d=google.com; s=arc-20160816;
        b=CUjVhwhyNbRqKeVqa95LL3xikh1prnLp7/CHYsFKVkeX9X1OSq8gdZY+QlvdL2X/GS
         8/2RcgXa2troI1uDO13EtWrBnSv4JNNUd5Ly/7EgixkOzRBDpyYbqTJpqw3uFGWmWKIc
         YluECpTd3JlMuet+KFk/jJoPA5ZHEsV/F8Rj0av4etGm+lPBOdkFO/OxRukHMUadnXeM
         qnIqiUzq1dRNXU2qFE/aDHfeieIF1RN7aT/P3hEgEo6M894wjPCiNciC+YlxYNE/pZnn
         lcyIcXhDkk0WatbMnOFCASH7PO+p47IoISyUDDYqTYY7wBsf3roy1LnG8RMYFUJc0iSU
         ykZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=6u1qTQvAYVuQuf5vqoJUT8LoE9LpKteA/VhDaNrEurY=;
        b=s7SecRgKXC1jLfW5bOROPRDP8NmYiD3rZbYY3fvzfkv4+LUZzuAeNTczx/L6iQbzG4
         GPks4eoWUAaar8VzzZm2uzqmVabzZArautdwEvb9Ea53cWG8ILpb9RP64yVbjE2+XxEU
         jWoSG2NX8DQFf4Hhsw3J5dL11OEtZttxJYUBFmOhmgzblbJtuP7i2vPd/bkEVSElLjum
         tclw3VH9AWKsSIjsqpLzXulmVCA8Gjbmbmi1mzeR9LzomY47fmHa5dphob83W2jD+CP7
         SaJJ5yxKr48JX7l8uROGSMpI1aU/hC7NE1+VxkYn7HYNN33MDSC0+WL/y6Gvuu9IHMIU
         51Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=upI4HSPA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si13856586ejo.132.2019.05.23.06.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=upI4HSPA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35887 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnYA-0002Wj-Vb
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:14:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnHl-0004s9-Tm
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnHj-00030s-7X
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:57:29 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTnHg-0002yu-E9
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:57:25 -0400
Received: by mail-oi1-x243.google.com with SMTP id t187so4247140oie.10
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6u1qTQvAYVuQuf5vqoJUT8LoE9LpKteA/VhDaNrEurY=;
	b=upI4HSPAdUR+Wl8G+F/uZ9fVmVEIhdv0xv5rF8FLR4WApC1cqku6YvWaNMefoqnkkW
	dYV12o8zBBaotd0OFyABwiCHbAnhOOHfVKjmnTgcN97slCErP0egH5Jc1Na9vjWxTSGd
	H19wbDPDnhXXQ4f61vpdUpDkrttU+PY6GsyXLPpNT0CTn0H5zC5wjDGHQQbyOJ390jWk
	/tBotF27LsbuEiKQwJ/S/hHf8fQHfUdwS6JrgV/k1xoXajVoH6Pf8zzyMfrYOo8ukJXa
	P3Hgh/ZyReqaBAkfMIOFdhs2s98GkEHXu8QWiVUz7ZDTSoEJzkn89Sr/9drZaUQiqvJc
	jDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6u1qTQvAYVuQuf5vqoJUT8LoE9LpKteA/VhDaNrEurY=;
	b=DHGCYcj1W10Mt4PbKyu+qmDAKcsOjPkwCaL4JpyZRwF5/iHYH953skCyzfJYD5unS7
	S6VNIeywX+f0pbAU9ePV0lpzrhay0bLWFBwjtwbG6x1KsHcLrA0rv9ZCfZyJMdYD9Kgr
	XFgTyoLA6rCQUQxrYggvabVDP8o3wNDr0tu5C7SDYxhBeD9itpXroi8JpnL4r4wS1WIE
	gdytOLSfNSsfoBkq+ReZa766bhPFOH8I1vg+w9toU0S+Zptb2vGWYa6y5vXidsgMKtPw
	MBLvQNZam/vDrSvoJn0a6gvuonlauBXaAF5eg7Y8uuBhCFUjxXwBncxe4B192OMfkLUl
	6QuQ==
X-Gm-Message-State: APjAAAWc+1upgFIepRlIw/0soagYqmLnJzThCJNKQE40jFCMeHGvz8a+
	ar00BwxeD3Umeeo4kD4aBzDN3nKI7EIMFDvGJCw7ng==
X-Received: by 2002:aca:845:: with SMTP id 66mr2613152oii.163.1558616243665;
	Thu, 23 May 2019 05:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190520214342.13709-1-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 13:57:12 +0100
Message-ID: <CAFEAcA8vcQw0fGy3eTpmkYb+=-wiy=7xS6bjb3aJJBmGBo4LYA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 0/4] arm: exynos4: Add dma support for
 smdkc210
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKdEZczZOYLm

On Mon, 20 May 2019 at 22:43, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Another intent to salvage previous work from Guenter Roeck:
> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06302.html
>
> Since v3: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06674.=
html
> - rebased
> - QOM'ify the SoC code
>
> Since v2: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06459.=
html
> - rename init -> create
> - create controllers in SoC rather than the board (Peter Maydell)
> - add Linux dtsi in commit message
>
> Since v1: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06335.=
html
> - Do not factor out pl330_init, which resulted in buggy v1, see:
>   https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06448.html
>
> Guenter Roeck (1):
>   hw/arm/exynos4210: Add DMA support for the Exynos4210
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/arm/exynos4: Remove unuseful debug code
>   hw/arm/exynos4: Use the IEC binary prefix definitions
>   hw/arm/exynos4210: QOM'ify the Exynos4210 SoC


Applied to target-arm.next, thanks.

-- PMM
