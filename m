Received: by 10.223.159.74 with SMTP id f10csp3389626wrg;
        Mon, 11 Dec 2017 20:43:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBovk8Lv7jXOciVeZZc+lJ5rP7ig3kYT7xcKQVSr0Ud168Y/zGn1CvG87ZQd3gB0aOc8FF9C0
X-Received: by 10.129.16.134 with SMTP id 128mr2051055ywq.111.1513053790022;
        Mon, 11 Dec 2017 20:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513053790; cv=none;
        d=google.com; s=arc-20160816;
        b=nS5aP12n0I2aVHfFgWs7OqjOgcNE3raQUwGlRzMJlpL7ESWL6gSXJhRyZ2Le2octmV
         SJdxMSyEMxCCeS5rT1NwH2XIxKYHujg8OkAy4Wumhq1lMzpk8aDFRBOavUzs+uklALjT
         pj9/FQ85ccEjIc3Tqs15fKIblyOUMaLCb/Xlo9v7PBEluOj0BbW70dyHcnY9aAiVWlgL
         hCISFuuSyNd5x2xz7X/dOvoUnOjhL/mRBT72a3Ag3xvn/9dtZI7AU5RiAxHbdcz6EyaH
         gExouJa19k/DCIvdeS7ZkUG3wRvpUIVOsqb0RgkJ20b97GQLiIi7XXyjkLuda3RyGSh8
         DEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :message-id:in-reply-to:to:from:date:arc-authentication-results;
        bh=m40qkOP3Pkggdzvu89Sq5QGEzhmLXDo+UvBJfazV3bk=;
        b=czmMAiUDXTHhNKXHBZTbT/ExLe9cjpGy18xGIf4DsvTRERAK2tLHt13D0k2n4Jgsfq
         cXeRsviByMdfso8yUHoxXdSyrsighYHtJ1MCIwUsD8lXnvWfylITsojvZXddqusY8M9k
         DkmG1hxWQYwI7JiWCCWaNacLH3NofdP9jVSH1jfxsUA2tRq2j9CclmrqgZStgH0rsRhi
         re1A0tZ7MyzXzIK6KwTmof5ZGlqGA9EqTK5aQikOsRbkL84WwiHI5T/Lsp3nyt8TW9M4
         blDW/E6vmBW6n8h5d9Y1RZAHMNPif11qbaQ7r8qN9Czr6s45KDji6UIQ9S4pWcDBaJ0b
         aZUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si3437077ywh.432.2017.12.11.20.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 20:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOcPN-0008PT-CY
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 23:43:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eOcPB-0008PA-RZ
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 23:42:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eOcP8-0006YX-Ph
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 23:42:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eOcP8-0006Y0-KD; Mon, 11 Dec 2017 23:42:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E97E267E1;
	Tue, 12 Dec 2017 04:42:53 +0000 (UTC)
Received: from javelin (ovpn-116-106.sin2.redhat.com [10.67.116.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F504516EE;
	Tue, 12 Dec 2017 04:42:51 +0000 (UTC)
Date: Tue, 12 Dec 2017 10:12:48 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9=AzBE7CCGwHZtueyXzEGXXXSAb0ynhc-+6tzQfk5jrQ@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1712121012020.26173@wniryva>
References: <20171211105546.16466-1-ppandit@redhat.com>
	<CAFEAcA9=AzBE7CCGwHZtueyXzEGXXXSAb0ynhc-+6tzQfk5jrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Dec 2017 04:42:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] display: check irq handler index before
 access
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Qemu Developers <qemu-devel@nongnu.org>,
	Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sn99LvSqorEo

+-- On Mon, 11 Dec 2017, Peter Maydell wrote --+
| It would be more sensible to just mask off the top bits of
| 'level' before starting the loop, rather than checking every
| time around the loop:
|    level &= MAKE_64BIT_MASK(0, TC6493XB_GPIOS);

Sent a revised patch v1. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
