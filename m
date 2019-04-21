Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1352093wrx;
        Sun, 21 Apr 2019 06:01:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0Mqku6tPivPEDcRlILyHjIzqYVI5yITkLsQAW74PPawrKzfTHrTtMuu+itLUM0heB7m7d
X-Received: by 2002:a5d:5346:: with SMTP id t6mr10536014wrv.59.1555851696130;
        Sun, 21 Apr 2019 06:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555851696; cv=none;
        d=google.com; s=arc-20160816;
        b=qBRJri10rrS2/8PvdECibl50DaVOOR0fHW2pONgr/aqxmpyeH2DiNhXJwU0JhfVLWf
         V/z28rhdHrBw+YXgZ257KdofIGTtfN67m4VWa8pw3eRsbSn/3ZGQyTTn43LZQocntB/k
         SFcteyfpwYbYzk+Seaw7glUADNy2xipynF2GfwWG+nTR6TjEayDkclyXYBECrq8qQDf4
         QVE8+a9OIrxsNWA9DTpTmrNJTqCrmetY9zsXjcQwfnjpNVXb6qsM/vGBKDFYvyyO6qMj
         hqFayX0P3b17hKAg7pkvY7j6dfAWVflb76F7YfxcyTNqZMsQ8+1ISS9fqqXfbKsiCKID
         ug6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:mime-version
         :content-transfer-encoding:to:from:date:dkim-signature;
        bh=1fBa6lQNKmEjjMvbIrFC/lutHxx2s0Y3Oiw/Z3dBOWc=;
        b=paTSDSDzs5KrO6KAqh5WeS77oM9r1tSgII6YHcY+WHGXvK6LXkW+217C1rXJgngVGE
         NS7IR5FC6Xc8e9hFbU9qV/6Czv/4SXM4QVnCpa9AXOVrwE4PACyzuZdBcIeJ44ivt1cm
         VyI/LwMq1iCzIuTmna5CxUzdRo6clZnxZGJnp4XscW+vfTzPmK5KfjJrNFYte+YNPVtu
         rXHKc20LGNPCL1hHGc6ADSumcUogO0Ze6/z/hwrNJCVAdEt97UNEi4kCeDaebjjnjbpg
         e40PU7uv/2yKGaDsNWHQjH1HzMOhtOgRAEKB2FK2EFi3SQOHs9h+i3iDVZsCG4p4sRmq
         u4dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@126.com header.s=s110527 header.b="euzi7z6/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=126.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si8217564wrj.279.2019.04.21.06.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Apr 2019 06:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@126.com header.s=s110527 header.b="euzi7z6/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=126.com
Received: from localhost ([127.0.0.1]:53054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hIC6B-0001mJ-A4
	for alex.bennee@linaro.org; Sun, 21 Apr 2019 09:01:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sohu0106@126.com>) id 1hI3lo-0006H2-0j
	for qemu-arm@nongnu.org; Sun, 21 Apr 2019 00:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sohu0106@126.com>) id 1hI3ln-0000Ci-7m
	for qemu-arm@nongnu.org; Sun, 21 Apr 2019 00:08:00 -0400
Received: from m15-37.126.com ([220.181.15.37]:6644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sohu0106@126.com>) id 1hI3lk-00009b-Ts
	for qemu-arm@nongnu.org; Sun, 21 Apr 2019 00:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=8i8MW
	KtSibMwXlKm2q67xVotsfues3SOV3L6mnFSfTc=; b=euzi7z6/UVO4nV5qInfxZ
	KwUxJX5Q4SmCjXmhex0EHf6UveP4+QAdoFqE9sn2fFvNiqqRMi5BWs+yF9VEYiwf
	QNcFOuX3CA+Hy1om0BRn8DkvmhkaGzfN+BmWFE0hEtt+fcRBUYAMC5VVGrxZDGHm
	nV5Ya06JhoaSsILIIwuXmM=
Received: from sohu0106$126.com ( [153.3.30.181] ) by ajax-webmail-wmsvr37
	(Coremail) ; Sun, 21 Apr 2019 11:37:12 +0800 (CST)
X-Originating-IP: [153.3.30.181]
Date: Sun, 21 Apr 2019 11:37:12 +0800 (CST)
From: sohu0106 <sohu0106@126.com>
To: peter.maydell@linaro.org, qemu-arm@nongnu.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <150c2e0d.9e6.16a3df81f26.Coremail.sohu0106@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: JcqowEDJVkJp5btczzAcAA--.13565W
X-CM-SenderInfo: pvrk3iqrqwqiyswou0bp/1tbiHhScHlhgmTBhBgACs8
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.15.37
X-Mailman-Approved-At: Sun, 21 Apr 2019 09:01:25 -0400
Subject: [Qemu-arm] arbitrarily address wirte in pxa2xx_pm_write
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
Cc: secalert@redhat.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cBR6xC3ZwbCQ

CmluIGZ1bmN0aW9uIHB4YTJ4eF9wbV93cml0ZSgpW2h3L2FybS9weGEyeHguY10gd2l0aCBxZW11
IHZlcnNpb24gdW5kZXIgNC4wLXJjNCBkbyBub3QgY2hlY2sgdGhlIGFkZHIgcmFuZyBpbiB0aGUg
ZGVmYXVsdCBjYXNlLCBpdCB3aWxsIGxlYWTCoAp0byBhcmJpdHJhcmlseSBhZGRyZXNzIHdyaXRl
IGluIGd1ZXN0LgoKCsKgMTM3wqAgwqAgwqBkZWZhdWx0OsKgIMKgIC8qIFJlYWQtd3JpdGUgcmVn
aXN0ZXJzICovCsKgMTM4wqAgwqAgwqAgwqAgwqBpZiAoIShhZGRyICYgMykpIHsKwqAxMznCoCDC
oCDCoCDCoCDCoCDCoCDCoHMtPnBtX3JlZ3NbYWRkciA+PiAyXSA9IHZhbHVlOwrCoDE0MMKgIMKg
IMKgIMKgIMKgIMKgIMKgYnJlYWs7CsKgMTQxwqAgwqAgwqAgwqAgwqB9Cgo=
