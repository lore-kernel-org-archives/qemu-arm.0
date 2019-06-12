Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5002916wrg;
        Tue, 11 Jun 2019 18:50:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdT2IxhaLreIVaaVL2oTzeRxNl64uuxga3y07EgY9yMIhREEGf4hXWPeQztalJ2+wHDeVQ
X-Received: by 2002:a05:620a:15d3:: with SMTP id o19mr43989657qkm.213.1560304244563;
        Tue, 11 Jun 2019 18:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560304244; cv=none;
        d=google.com; s=arc-20160816;
        b=wAFgxzS0NjsimaRROINKGygqWkkl//6HIjRbwt+ogj7xTkaC5k4PvQo7ZisGVpSjuT
         7w7pMYsAwVejH2VUgjtSWBBN9/I6f8eyCHuSwDRKNgubxwvsjVdheXyvR8U0smGOxC1x
         MCbN11AcosOYNtGIL2YoWoP42eBkSVSw3pd3t9WRHkUIMDGOiD/GjWpQv1sbUYqAtwZ2
         b8H1M3LBcwtIwWCyg4Wx3WsoXFQAEc4mTcm5mg8sdZHXnP3MM/MYN+i5dXrAWT6nmOYv
         tDe5ALjgTwDZB84RWeHU3XVK3bC6LSG6PIzqBK5yNcbU0/B3mW75Y3MjXg9EUw6xLXJ3
         6aqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Z46ahEf2KFh0E7NdPCsUTsYjCGCnwUzyNJYVUBUbfh8=;
        b=V1F7PO7JZILHQZ9je+GnsZ3xuFBCUaJEiVbUBCM1e1hfKutMUb+Cuh8fbF7SJ5VSle
         +hYIHRv71lC0/1FEKhK1V/y6s/voXe83LCzofjfnJr6vmNcaCou2lujVL28vduVyiW8u
         UwHMk646Bz6RCmYM6DQU7PMl90XAF3635dFrazCMlxwMJ5UrBVtnN+b62VMMAchWjgoW
         xsaSVQCYLXyC86d+AyHWxxXcp0Z2r1Jnaqtf82sN6NoPxXTTs6C8soeG2GcSr7DWKTo8
         fByIDLmZyLD9bMUrmzg1ZRuySyLU08CJjoF0WA8jTXEwdu6f0SQ+w6xEHjyDA28mtxMM
         HSTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=bntcZQl0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t37si5750719qvj.89.2019.06.11.18.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 18:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=bntcZQl0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hasPU-0005MM-0Z
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 21:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOR-0004M9-7x
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasB8-000125-OR
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:35:56 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:38515)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasB5-0000xU-U5; Tue, 11 Jun 2019 21:35:53 -0400
Received: by mail-qk1-x742.google.com with SMTP id a27so8975341qkk.5;
 Tue, 11 Jun 2019 18:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z46ahEf2KFh0E7NdPCsUTsYjCGCnwUzyNJYVUBUbfh8=;
 b=bntcZQl0QVCamEO1fqUyM7dBp3gDOa0fiFbxabqthMzonHYGGbsnzaOIeH9wPRRvJK
 QhWDHQHwFmt4mJZgzuWK0pHYO9ME/tCGSoFAB3S/0QWeXFMUd//xKdXB67626Ffpga5M
 fcsmGcERyLdGI0uL134qEO+aKYIxT/qKV5KL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z46ahEf2KFh0E7NdPCsUTsYjCGCnwUzyNJYVUBUbfh8=;
 b=nUiFxL2nzhZWKEZGjns6msdut/wiyUZdrHuFJ/7SZFutBTWpO76lfZJewj3pOKVKs/
 q5LGz6M/VF8m9aPrOJ1XDTRKNcCU+VyO1IGAZmqTDC/YhciCjWD1WgderkE8S2TeauJA
 8w/lSw0n9upFgUQs3x7XiFqbMirT9CV9gNw1cN2vmC/9xH88/sEJkWGQOGD5LssaCPC3
 bvlxZW745VzQ+jZC/rMkcdojPIHquVs5kA/mWdyc//aje4sD2W+mkjIXWZDL5+B9xxeS
 xkuicrVqkcKsnTaVUlfr7N4Xvlx85YlAbiGZl6IQOTUi58RAR3vtF93QqRzIE59GvDtE
 0YzQ==
X-Gm-Message-State: APjAAAVpSinbamOrT2hW342vqIN2D3BkiQfR8xdnZoQFFERGa8dFmm52
 RHZsKh7OYX0fcTiHiFImMIuSC9TV09EXYUQpjU8=
X-Received: by 2002:a37:4793:: with SMTP id
 u141mr37706987qka.355.1560303329828; 
 Tue, 11 Jun 2019 18:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-15-clg@kaod.org>
In-Reply-To: <20190525151241.5017-15-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:35:18 +0000
Message-ID: <CACPK8Xf5Uo6U_95fSQqKANcA3ffjF5Ui-r+tj5T2mgwLdpsArg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: Re: [Qemu-arm] [PATCH 14/19] aspeed: remove the "ram" link
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJuH3ELEkztS

On Sat, 25 May 2019 at 15:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> It has never been used as far as I can tell from the git history.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
