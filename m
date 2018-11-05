Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2864937wro;
        Mon, 5 Nov 2018 09:37:44 -0800 (PST)
X-Google-Smtp-Source: AJdET5f8E+/mm3V/asd9BqOVGNdQP0PPlD6iXI+QxEtJRmXOv600aycJnnsRvXxGjZeasP85d+DC
X-Received: by 2002:ac8:1b82:: with SMTP id z2mr18677362qtj.321.1541439464205;
        Mon, 05 Nov 2018 09:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541439464; cv=none;
        d=google.com; s=arc-20160816;
        b=KckCy4WzxaGUkxvF3HfToGIeCeSmbADBaU7HvuQCp2VFEb8iJgacWqfDL81qeseVmR
         K/XtWvV3OdRLCNj+fSFiV2o7Elw++oj21SsAPb/8jU67pwFh4xSFTOkQPNuwKCx/2Lp5
         M+cKjDNlUqEsEqgyWPjUPYZB2FSJBYfe8rDyLV+pw+J9GP70SWDlY+qbun54R0B/nJ4Q
         qTAqd+5Y3wEBUuZuVonSGjqVCIZxsFV+h1TbLbBEjA7Tvo+vRQKVvMvN90sl/owqYdAw
         +wSnBjazzDtg3qBr1k64Yn+3fYFvZtF9WidOayCZr1W/jyuOQu8M6NQJTddT3hPWWvM2
         BlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=8kLzBALPQBbZYHkgs2PLmwH6j/tWB68yIf9Mh8Lo4oM=;
        b=z+rksYybFwk8O7pMBudx8TSJqoHYJ4zTipKknbYxBLeUHxt1QU2qGjTg+NmtKsmCGA
         VObx2zqD6gPRxm4k+MZsZJTUsC8cFq9BAF7VhbWSW6xI/wB5yKYDRnvCfB/tyKwmSx2x
         QN7LHuPy+eqfT6GNqf79jj3u12+cythOg/OAcm/pIz4U782b0DA1kQagLPjYXrJOZEqv
         PgZt4WhvJL8uBvJuOv3yBj7Ben756YuaoAiAInvfMgOQ7ZJ3m4cPQ4jEXFo8KExKl9fI
         yhHCkt+BF7gbih1qHk4cpmv1xL2Cq2+OT4+Q5zHcKTNmOlXFBavr865VcJNhH3puiDnA
         +m/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SsKjyx24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16si1289957qvf.16.2018.11.05.09.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SsKjyx24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJiop-0007AA-No
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:37:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi5R-0006P7-B4
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJi5P-000296-3z
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:50:48 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJi5L-00011e-Rl
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:50:45 -0500
Received: by mail-ot1-x342.google.com with SMTP id t5so4985034otk.1
	for <qemu-devel@nongnu.org>; Mon, 05 Nov 2018 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8kLzBALPQBbZYHkgs2PLmwH6j/tWB68yIf9Mh8Lo4oM=;
	b=SsKjyx24kETGS3z2m3xfYpcf5YV6LfOeh+qVz+hD+OZg1g0rjcPhBX5L0gQDecfpZg
	tjXoUr9mZfVWER3qpPHmMLbMACQhy+LTqgkAbHNjVg2QGNuHOJIMYrzBnfvmtmg4xgMJ
	6oKHhaAF/ofZQj1NUFYdrDbN8Vx2Nb9gLUU5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8kLzBALPQBbZYHkgs2PLmwH6j/tWB68yIf9Mh8Lo4oM=;
	b=SHihM1cxujWMZZrmKyv5CjjTaWQj5EZoCK2tySR0OqiI/1HfMZq+EBnv1F4mZUP4Dd
	JGxxxNApMVQg06lEecHOYvhzAa6FHcnZwcEnnb0DqIUWm7VzIw8QVY52rYAnGjbGy6bV
	JN1ziDav064fzPDy3OcmZioxJ8tmSiXqLF7oXNC6IBmR5Z0ymfdTtQqd+9dtU+rPTzQZ
	Ao/ixsKAFx4wEzKx/hmxeRPDO1KLbp8gTYYM6rCfK0VEKL6zUkZ0GFb/VKw9pP1re6fX
	vZZvm2UYjTQimIUg4gARx41xXBY5P5gsx/BIyG/tfMsw3/Z332Aqy7Z4YcPhcIrgXZyO
	q0KQ==
X-Gm-Message-State: AGRZ1gJF9ipxUSOAg7ZmCF9zJNzwUsokQ9pqoQkMmCaaxmHDsvEK+H/Y
	c7U317wvQhc0YMdQaqY40VNn1MNDtElOR4N2NmQ3ag==
X-Received: by 2002:a9d:5f81:: with SMTP id g1mr14578229oti.317.1541436625217; 
	Mon, 05 Nov 2018 08:50:25 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 08:50:04 -0800 (PST)
In-Reply-To: <20181102170730.12432-7-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
	<20181102170730.12432-7-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:50:04 +0000
Message-ID: <CAFEAcA8VeaitLr7q7yFgJu0+k=z9wKG3V+_sbgwwBF7o5ryw7g@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v4 06/13] arm: Instantiate NRF51 special
 NVM's and NVMC
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZccqwtz4nwh

On 2 November 2018 at 17:07, Steffen G=C3=B6rtz <contrib@steffen-goertz.de>=
 wrote:
> Instantiates UICR, FICR and NVMC in nRF51 SOC.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/nrf51_soc.c         | 37 ++++++++++++++++++++++++++++++++++---
>  include/hw/arm/nrf51_soc.h |  2 ++
>  2 files changed, 36 insertions(+), 3 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
