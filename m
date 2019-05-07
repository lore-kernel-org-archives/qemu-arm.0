Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3220743wrh;
        Mon, 6 May 2019 22:20:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+g50XSCxj8Ft4AjMt8Cdbo90x5ppAdzMWlkgWcimQV9RAqlxeE9YzVd3lrr/L7fe52tPx
X-Received: by 2002:adf:9f54:: with SMTP id f20mr20670836wrg.215.1557206411076;
        Mon, 06 May 2019 22:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557206411; cv=none;
        d=google.com; s=arc-20160816;
        b=xEcsLH5+VOm/NYEA2NmeCXdF2IRYysrGJrRQiAR7FJO6JnN9ibRDdel6+BlTJo29J/
         4DbwZcrOxt+I5G4NA328iGMLmTuTWc/N4yZvGvkXjjfA/apya1mRwTs2OnBS+AtRAyWs
         LltxiT90VwDvb2bMHnnb3LOKfxNMIQ4e263wuUEu/YaojnQYhcRexnL6Mo16otZWYC71
         +ofC3BH8g8zAfTAzxuwm5T4zmRn8MQ6WEjcqUkpi7pES+JEAP48Yce8kn0rG30lavpQo
         hODoDTLr9K1e2oxyyyYgFJ8wxARSD07qYfndVWM6kI4J3cdPiWN6/IhDfGfTxn/R0m6K
         G4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=qhZig2axSZIgL7BGzsy1qVAtFItOkCIEnW62wof9wb4=;
        b=Xq3uAM08HiG1Jo7fetUkoZRK0GEPHpBrSwUGRhYQCxI/NsDOE3U/uYFj6yLLnMTK5H
         mM19hzCbUsCDcg+8ygcyF4/mW01pIha0OGwVcI1y50rtQivcr5B1iISuDM4awS+mXcX6
         nikZhIigdtf5e//zSnCx5g2/Id3/t+erPgaf3sdOiKwZVmVRXgXq9NKJXKKvex7ei1l5
         A1GUFw0qsyAXi3bnksNZQrysaW5whQtAuNIafyLoD3v0UnOuCKJrbSNkedF/GxMLJ8tq
         m/rHtyAk3NisUsLdXDUtKtyBUmjO2ZR83Le87TJ2Rs7JPawCUndrIKeD6kyS50m9scAc
         53vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=f5x4dqKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si8076138wme.76.2019.05.06.22.20.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 May 2019 22:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=f5x4dqKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNsWQ-0001XM-6X
	for alex.bennee@linaro.org; Tue, 07 May 2019 01:20:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsV7-0000Xt-5Z
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hNsV5-0002ny-LR
	for qemu-arm@nongnu.org; Tue, 07 May 2019 01:18:49 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:37477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hNsV4-0002n0-Ot; Tue, 07 May 2019 01:18:47 -0400
Received: by mail-qk1-x743.google.com with SMTP id c1so139514qkk.4;
	Mon, 06 May 2019 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qhZig2axSZIgL7BGzsy1qVAtFItOkCIEnW62wof9wb4=;
	b=f5x4dqKrrJx05bARe5eOZkQRY9WYqh3aAUFeBU5jkRfIU3bfVFkvNcqx6I9XRpvIX2
	td+XcgxjLAvj045LsVzAv3b0sL94BlbJjJKwXjdko3vsW6tv/sPL/74Waugk889/gsGW
	RZ3io/JYGPOXoehYWgt1DGwuNXGFvz+but51c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qhZig2axSZIgL7BGzsy1qVAtFItOkCIEnW62wof9wb4=;
	b=ZjHgxRi4QTK3sstkqeQBTQ5ckvSa3aNc3I7HxzFh0Wjzmn/j3mrTyvkL3xlOxvdUm9
	JpbpFpSrsUTEKc97Vk9yHray8ciFwCf8iCLYPwzXH5PQv8DAohpXmskSS9RAFTaVOl7N
	B5Q4NGNbOZUi83VS+vDMS8d2OgWMh4pEWIgaJSexhj3VxVQn5zwo2GNK+gXFscqYBLbn
	bczsLlOWlh/ErhfRrYK1zwz8PPecy6fJT0DuStI62+ge7gAR+7CZSQfreeMp0sii5PKY
	LJhTKTWNV2QpDvBJLJV4POcIOCYxSkAhnaDvXfHpkd81eT0SQyS8f9MGySVMXVUqLPHd
	G5zA==
X-Gm-Message-State: APjAAAWMCEDm+zAhMgGiKB19Dn8JVLYfTpCxgC6p3zlqmmBIEH2rr3zv
	63uefHb5q+6YxAkWFlTaop2LBeMeZIb/pmLNg8E=
X-Received: by 2002:a37:a289:: with SMTP id l131mr8098306qke.231.1557206325376;
	Mon, 06 May 2019 22:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-2-clg@kaod.org>
In-Reply-To: <20190506142042.28096-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 05:18:33 +0000
Message-ID: <CACPK8XdJofG-bL2gArsFpRe5R_eq4ZRwP0iwt2XnAoxRNbaVnQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: Re: [Qemu-arm] [PATCH v2 1/3] aspeed: add a per SoC mapping for the
 interrupt space
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
X-TUID: cTnw2K7QmjFs

On Mon, 6 May 2019 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> This will simplify the definition of new SoCs, like the AST2600 which
> should use a different CPU and a different IRQ number layout.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
