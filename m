Received: by 10.223.150.237 with SMTP id u100csp403637wrb;
        Sat, 11 Nov 2017 00:13:33 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbrg8k6h/PYGktMHvOG3hSb2btseK6DNV5S6BH7EvCPB//OMIM+Htui6tbqWPXJKC+3zIC3
X-Received: by 10.37.184.72 with SMTP id b8mr2022594ybm.160.1510388013191;
        Sat, 11 Nov 2017 00:13:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510388013; cv=none;
        d=google.com; s=arc-20160816;
        b=u8mNFwtx4a5zFrvhzM9PYO8qO0KM7p3Pp/tVFFkMx4PqIR0gszwWcAXmBRrq5bSLT3
         GXL4Tgqam2OzfBiomOJOww4t4NTgypZWHTYPjQQYeNSpocZp8Bgmq6kNfEEXA5EHKCml
         NCGWbrEivjZ9knyB+nsGIq82CHuVHzz7LGoIwjhAMgcSYOWXbWBjzmS+d42S6P1dk7AZ
         nDOdG+CFI7rZTK7R/b8oZjt1057JFVBFny4lE+18vn+2kVTIFcT4Kkbvx0kyT85zfD1j
         4G7YqDX+zqd8TBI5pvKjZCk6IL9lXmZ5YQWSQ2H6KQC5cLoe0i+rDIjMJfBpoUHsIfIG
         8pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :message-id:in-reply-to:to:from:date:arc-authentication-results;
        bh=NV0jjXQPbk/w4gKPf22hqah9ajQDLvv9hyIZe/EWaw0=;
        b=LwwxkQbeq5+zaopTwdX/w0vX+Z2pSssIDdmiK4KS7XD1MV9Slzurn0j1Qo2EJyUUEY
         m+x1mgu7dEajDoyf1Tqv245s6DO5cvgpve+LUS9E+cx+eGFFAON4qocDwMbeKm7j9Iiy
         UCC2ilaZ58+sF3AN7H9aoo+Wa3uuTTqapJY1WEOfibrPL17IxfuyEe1giSRZHqgRawRs
         a0TaSNaHL0zM8FZNBia5A9VZ7Awwmuea/wCNevOFi7XrxvegLwHLjf1dotrSdCh9ToOl
         yPekCuwuEH3pDTxzu7VGKSD1jzs/Z5hqH9ObIxSe38TP4XnPZWlueY8QgYUOO1XcRVQq
         vAQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si2863207ywi.223.2017.11.11.00.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Nov 2017 00:13:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDQuy-00075W-Lc
	for alex.bennee@linaro.org; Sat, 11 Nov 2017 03:13:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eDQur-00075A-K0
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 03:13:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eDQuo-0007jx-64
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 03:13:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eDQun-0007jS-Un; Sat, 11 Nov 2017 03:13:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1445AC0587D3;
	Sat, 11 Nov 2017 08:13:21 +0000 (UTC)
Received: from javelin (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511B75D6A5;
	Sat, 11 Nov 2017 08:13:18 +0000 (UTC)
Date: Sat, 11 Nov 2017 13:43:14 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
In-Reply-To: <7441e865-c6d7-7fbf-3175-63ebdf7291e7@amsat.org>
Message-ID: <nycvar.YSQ.7.76.1711111341320.32164@wniryva>
References: <20171109115814.28232-1-ppandit@redhat.com>
	<7441e865-c6d7-7fbf-3175-63ebdf7291e7@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1605813237-1510388000=:32164"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 11 Nov 2017 08:13:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] highbank: validate register offset before
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Shawn Guo <shawn.guo@linaro.org>, Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: srkYFpbOkAJF

--0-1605813237-1510388000=:32164
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

  Hello Philippe,

+-- On Fri, 10 Nov 2017, Philippe Mathieu-Daud=C3=A9 wrote --+
| I'd report that:
|=20
|            qemu_log_mask(LOG_UNIMP, ...
|=20
| Cc'ing Shawn & Rob since this might also be a LOG_GUEST_ERROR.
|=20
| Mixed declarations (interleaving statements and declarations within
| blocks) are generally not allowed; declarations should be at the
| beginning of blocks.

Done. Sent a revised patch v1.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
--0-1605813237-1510388000=:32164--
