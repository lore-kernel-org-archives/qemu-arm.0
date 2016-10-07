Received: by 10.80.163.71 with SMTP id 65csp3794205edn;
        Fri, 7 Oct 2016 07:15:09 -0700 (PDT)
X-Received: by 10.55.109.2 with SMTP id i2mr18877905qkc.148.1475849709181;
        Fri, 07 Oct 2016 07:15:09 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si3574723qtg.153.2016.10.07.07.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 07:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsVvY-000674-KL
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 10:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsVtu-0005Cl-G9
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:13:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsVts-0005Yg-Jj
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:13:25 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsVts-0005Xs-0k
	for qemu-devel@nongnu.org; Fri, 07 Oct 2016 10:13:24 -0400
Received: by mail-vk0-x22e.google.com with SMTP id 192so46492693vkl.2
	for <qemu-devel@nongnu.org>; Fri, 07 Oct 2016 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fE/IAbrLQV3kCXNlLrUlVcelmzwH5LVWuamzUoCCoRc=;
	b=ZRT37BcWeoT4qLDf/VDv19FGZjkn3MCS6WFGLDu87rciAjvL/9iJDEm5R4ltT0xhOG
	pzGAfzQbVcd3VYsJA7ZSOpC5bnvB/dRv6Pa7pxASKZxE43AILxj3VX3l8dGk377P5/Oe
	JNH3Re0WkHxAYzxnIn9jUrEW2z2M7ZJ2T3pRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fE/IAbrLQV3kCXNlLrUlVcelmzwH5LVWuamzUoCCoRc=;
	b=FUX+7z5Vj/FSmzsEir+wVgGWG/hhY4ovzvkfYgS39ZDdlv3A+M/YvPjacR0k5bGwZ3
	8Y1d6pu3ecZD9hOjfmqZJhMK6v4uu+woMUFtLlOqvvbn2HHqqKKAb5jPj6FMJ9kLqHBi
	kWWjMdhIypaZfXfPDF6qsLjjsHMAaHq9VHij4EWkMl8sqlUfsqvFVXbltmts3KLchUhW
	kAPwMOGN30tsRuqjcWCmEBmL0ANcLLTrL8PPzZQb5NVjy7UJnfnPBNQNv3xiigRLHtXI
	oid3zd2uahyKSEVkY8uhsPTvtPgjStKtqgQpsB1oou5rmsKPM639PjzDs8rJ7qrrC6pp
	gCPg==
X-Gm-Message-State: AA6/9RnUab0tlxC2iWYD0gHUm1VZ5FoxK7v8mj9pGmmSwlajiErYgOo4aSfBDkuT54Xhqc3F+mDkVPgtloFmDSD7
X-Received: by 10.31.11.138 with SMTP id 132mr3444875vkl.165.1475849603698;
	Fri, 07 Oct 2016 07:13:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:13:03 -0700 (PDT)
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:13:03 +0100
Message-ID: <CAFEAcA9hOACx4YdrwT6D7DPUZaAzDa1dsRgKvB85qL_DXgRPfg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-devel] [PATCH 0/6] aspeed: add support for the ast2500
 SMC controllers
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S1dWEY/mggkh

On 27 September 2016 at 12:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The Aspeed AST2500 has one 'SPI' controller for the BMC firmware and
> two 'SPI' for the host firmware. All controllers have now the same set
> of registers compatible with the AST2400 'FMC' controller and the
> legacy 'SMC' controller is fully gone.
>
> This serie adds support for the second SPI controller and for the
> segment registers which are used to configure the mapping of each
> flash module in the SoC address space.
>



Applied to target-arm.next, thanks.

-- PMM
