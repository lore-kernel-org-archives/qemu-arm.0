Received: by 10.28.71.27 with SMTP id u27csp2104164wma;
        Thu, 22 Feb 2018 07:47:07 -0800 (PST)
X-Google-Smtp-Source: AH8x224nin8s2qDcD8YhfjLHajl9bM7Cji5WpT23r08tIbz07fCGmKMI2wEHQ7tpNLl+JnTeGC1p
X-Received: by 10.129.103.5 with SMTP id b5mr5020197ywc.11.1519314427214;
        Thu, 22 Feb 2018 07:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519314427; cv=none;
        d=google.com; s=arc-20160816;
        b=aq/z44iIKKb0msxS9zwQnxoWnD8JF1Jyv/tLgLhjOQmNps6sdvKK+C9vRgTCYoPdy2
         LYm8FJgEqdCBNyxvETKMzKHbjM1IzooAh89OkfRv/ibhMwrKbRWhEtTqPO+gg8H5NLSj
         xMf5ueW08x7cGwXK7l6dnDTiKb3H9V0hWhJ5FHVG5jRc7feUphzfojd4AjBDPyXeF1gR
         Vj4vky1YsJMGHKDmaojzkCY3iPVxYCQZY2d4vfVfrtGv7UELA/ZRftP6YlFk3A0jgxye
         QEu2dvjzGs1wDRdYbS0h/OIEaz4Q1fBsr0VYT82lXAcx5kvDhRdYVlNFwmc8E1nM2AXk
         uYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ahxOIlWVqigdnBGXiYQ2KgBu3j+zvyLp3P22K3pA8xY=;
        b=ZzX7ujv+Ssnji6l6qxd86sOCntTOw6W27k69lTPuQ89bkXBzA4EapM98TXVd9GgaKi
         ZRUEALbVmmTLmZ7NkdMDdugyZ3qefJUUoSeqOgzFVb02RybuVFmQL+pnF8sAVSqQWsRx
         4w09at8o0p5VCBp1xg7WoGPZ8Nw71xNkaBT/3iF7hcM60Znxrrnvws4TkHi13LTIabw9
         0MaA5MakLRNDc6ULLtkr0LM+MjY+7MeRZwTzmNVH9Q+uUAJqvdc//RS2gesUhGczr615
         JyJjSYxxAuTNmOBqZB0trPBnbCnFB1Dg19n30SX+LH4QEkf0viRtdjYFaamvunALV+ew
         YPpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jTmlxtn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x13-v6si52577ybg.491.2018.02.22.07.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 07:47:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jTmlxtn1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eot5O-0000gk-J0
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 10:47:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eoswv-0001Wg-LP
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 10:38:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eoswu-0006Bh-T6
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 10:38:21 -0500
Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234]:44767)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eoswu-0006Ar-OG
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 10:38:20 -0500
Received: by mail-io0-x234.google.com with SMTP id z6so6421501iob.11
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 07:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ahxOIlWVqigdnBGXiYQ2KgBu3j+zvyLp3P22K3pA8xY=;
	b=jTmlxtn1f0uiYd8Q563WfI/0hz+uexhkX3tCMqLXgqX8KZTHN68l8p6Zvthkjhtc9t
	Pl8vzdG8F9K235uhTz3/LjCd69h/G1KHkw5FFCGzXg851MR7NnNTYm6Gzyu3nhqSuo8Y
	RJzY/awybiK7XM7Oj5nWJt6278thANu6tm3IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ahxOIlWVqigdnBGXiYQ2KgBu3j+zvyLp3P22K3pA8xY=;
	b=nHkV1ufqBuE/OkLKwmddNtxh+yE+ruwwZEulXJQCKCjSyCj4ndmBcXD8aZbErQ5TxU
	Gh3lhrQQcsExyqRy9zALwEF4VavZ1BG0iypnl9ICx5ZIiv7P81XOnhmItbUPBApPk9uc
	zOTz2yEUQFufSH+2CinSn4E7JRIZ0YjUqjj5mz/ajIN8ODDsss90JtRK+pRVT7WLOrxU
	P4bDDh0XV43mJFtNSafGI0IUCV2bePRcw5Lr2L/eqJng5tLF8DrZA8Xw72c2vnPOQNRP
	akM12uoDGpi2X1I8PE7qwBUcv8WQYM1mGNw4vtJSUlwpGTUmtrbdCl8bgpe5JFIqsuT0
	OiVw==
X-Gm-Message-State: APf1xPACsXTRCXqVXcIg69bIuKJOePegyclTq0VXMFibrFA7ef+1kJXs
	BODGHeBkKcHFz5huIyzfOmbZLHO4O3d+oYr7zP6Pt7Dl
X-Received: by 10.107.130.201 with SMTP id m70mr9065042ioi.304.1519313900114; 
	Thu, 22 Feb 2018 07:38:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Thu, 22 Feb 2018 07:38:19 -0800 (PST)
In-Reply-To: <1519053606-9817-3-git-send-email-minyard@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-3-git-send-email-minyard@acm.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 16:38:19 +0100
Message-ID: <CACRpkdZcdiPW5gWVxmQci48dUY1zseH=N=Tf7tj8EvzgDpeBUg@mail.gmail.com>
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::234
Subject: Re: [Qemu-arm] [PATCH 2/2] i2c: Move the bus class to i2c.h
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z82KTNKfPAYE

On Mon, Feb 19, 2018 at 4:20 PM,  <minyard@acm.org> wrote:
> From: Corey Minyard <cminyard@mvista.com>
>
> Some devices need access to it.
>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
