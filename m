Received: by 10.223.197.9 with SMTP id q9csp3043328wrf;
        Sun, 1 Oct 2017 23:16:17 -0700 (PDT)
X-Received: by 10.200.19.193 with SMTP id i1mr8367619qtj.131.1506924977894;
        Sun, 01 Oct 2017 23:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506924977; cv=none;
        d=google.com; s=arc-20160816;
        b=dNQ3nFU3MTc0uMHmHpVeoiEwiPa5faXyKbhfNERJXrYBy0HPSRkqlzi5QPsIMWG/TH
         XW8B5zQpSIrYYVX3XJ3SchP0ftKcbB8XXXBckrqgjWQ9c2CIRCbGiCpc9rxE6qu9UDoY
         fnHEjA1kyA7InveyNA360iE+7+NuM7u35OhmtIRo757OEa0nWqmzBslF/a9+PY3b3WwX
         kfpeFeX9d//lgsTAqLwoDZf9HxmJPdFOoKqOMqXTaivd3O+aep7B5cXdgafkYTwGZ8Si
         z98b+TINx16pHgQzR7RCOBrHeRx4gJGp6Mndhvo5UZpYb2yxm2xYJFn92xYBNufXNQN1
         GSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:to:from:date:message-id
         :dkim-signature:arc-authentication-results;
        bh=7ORJmApRZIDzONSlLqZQQn1JOUiYUAKBSSuuIu1NTDo=;
        b=rnHOkccfspQYHO0DLBTGijGQurTK2TNJrgPhRhdpz9k5qrDtelj+4DabRHIc/DoxbX
         Tbhb7O/7stcH7en+7+5nEMrFiYum9No4W5o9+x45mMVEOT9cYFW7Sha23OMg24APySlw
         Qtrj/Sj8v9wFJfTm9eYXpcpiBRAzRKIc6VWIypESZ/IV2lofPNYvusiSChWlxkHP5IsJ
         iZAbj0FnulKpPCYPuDSKd604/xgd+llHm5WDSI4gLzx+zmVVYPNAEBB8Fy5kU9Ijnb3H
         fUQRWChplX49ihjVHoA4mYKqtFdXKSH4OvCI+wA1xWMxg3fduwlAfXCRCbB59rCIXSgr
         tN3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZn16aIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 194si8197309qkj.297.2017.10.01.23.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 01 Oct 2017 23:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QZn16aIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dyu1X-0001bE-Je
	for alex.bennee@linaro.org; Mon, 02 Oct 2017 02:16:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maxvoloshin71@gmail.com>) id 1dys7b-0003DQ-WF
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 00:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maxvoloshin71@gmail.com>) id 1dys7X-0000vk-2h
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 00:14:23 -0400
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236]:56370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <maxvoloshin71@gmail.com>)
	id 1dys7W-0000vO-Rw
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 00:14:19 -0400
Received: by mail-lf0-x236.google.com with SMTP id a18so4618245lfl.13
	for <qemu-arm@nongnu.org>; Sun, 01 Oct 2017 21:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:date:subject:from:to:mime-version
	:content-transfer-encoding;
	bh=7ORJmApRZIDzONSlLqZQQn1JOUiYUAKBSSuuIu1NTDo=;
	b=QZn16aIhdmpksFQYdfHVOJ3s/jqdApYNfB4h3YI/edcgJ3tkw1oTsGG5vzkGA5cJnp
	yFORTmqRSXbKAZ5ke7JRrTNClsdCOD4yi29+wfC3SOVz8Cj4dtQ+Q5Z7HqB0o3ymzUap
	gp5RFbmYFtQigmRLQCOfjLxjhPAqtY/AzzQetih28n/c7KMwspMIGlPjpXDQc3vZxvep
	hmXSrF1CVUjF1s5eQkNGKwngzM2bl4rPVtmmwX90obMgdLFHR3lHRuGUAw4lGvKVxTma
	f0815EPeAsJt45v4GlfZSqYITb1tvycIrsTX8mmLQ3y9iBc0SakU3fp9Bkw5YHT6H6eT
	tWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:date:subject:from:to:mime-version
	:content-transfer-encoding;
	bh=7ORJmApRZIDzONSlLqZQQn1JOUiYUAKBSSuuIu1NTDo=;
	b=hVTnDnDCRBjF1ZcfwpnRajZ/tVUHyLqoKxFVawhSR1Z4lFMh/pDV3vfBtchvsS778w
	NM+LFrOCKQK+qG7W9kQxGrH4V1Q3sN8/dn39tSOSskuAtIoLsfXDG1Thh4nIURA9gFly
	Ig+b2Xsl8IgGsBNGmpyiirncinYp3SUd7X0TPTL7Hae+OjI5P1310em1ju0cDILkO0mR
	4Kiekr1O+G/O/yd0CZGY4pN9VmrQJJ34zPsFjWjeCEySdeSdTxxli9GT/NBmlWfoKN04
	BZy0sKKzKxb1i1rCSWxS7PhtlJoWttIwOQPCEkC67dyJAEV75MWMXEa8/6kFbEXXawLk
	jnRQ==
X-Gm-Message-State: AHPjjUhhiS/FnjnzU4+am/v8eQPL7EeLU+HeI2x1QV6xRp4xbR0l0xVZ
	1XPn1THSMGXk+TQCwQZrUFYosA==
X-Google-Smtp-Source: AOwi7QASqSBHNYPWJ3soWgUAKhtUBgxXns8ZIPf3sveGoQ5zeMeQkXJuP5YLsria3/iLLzbhDYjntA==
X-Received: by 10.46.78.18 with SMTP id c18mr6195817ljb.11.1506917657054;
	Sun, 01 Oct 2017 21:14:17 -0700 (PDT)
Received: from [192.168.0.244] ([176.212.204.235])
	by smtp.gmail.com with ESMTPSA id
	x13sm2133257ljb.23.2017.10.01.21.14.15 for <qemu-arm@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Oct 2017 21:14:16 -0700 (PDT)
Message-ID: <59d1bd18.0d632e0a.ebbae.e156@mx.google.com>
Date: Mon, 02 Oct 2017 07:14:13 +0300
From: Maxim <maxvoloshin71@gmail.com>
To: qemu-arm@nongnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::236
X-Mailman-Approved-At: Mon, 02 Oct 2017 02:16:02 -0400
Subject: [Qemu-arm] Linux on QEMU Zaurus (Akita)
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: WJUpOYMnZkcP

SSBjb252ZXJ0IHJvb3RmcyBpbWFnZSB3aXRoIHJhdzJmbGFzaC5ha2l0YSA8IHJvb3Rmcy5qZmZz
MiA+IHJvb3RmcyBhbmQgZ2V0IDEyOCBNQiBmaWxlLCBidXQgd2hlbiBJIHRyeSB0byBib290IExp
bnV4IHdpdGggcWVtdS1zeXN0ZW0tYXJtIC1NIGFraXRhIC1rZXJuZWwgekltYWdlIC1tdGRibG9j
ayByb290ZnMgSSBhbHdheXMgZ2V0IFZGUzogY2Fubm90IG1vdW50IHJvb3Qgb24gdW5rbm93biBi
bG9jaygwLjApLiBJIGdldCB0aGlzIHdpdGggQW5nc3Ryb20sIE9wZW5aYXVydXMsIGV0YyAod2l0
aCBubyBkZXBlbmRlbmNlIG9mIGtlcm5lbCBvciByb290ZnMgaW1hZ2UpLiBXaGF0IEkgYW0gZG9p
bmcgd3Jvbmc/IFdyb25nIHJhdzJmbGFzaCB2ZXJzaW9uLCBRRU1VIHZlcnNpb24sIGJhZCBvciBt
aXNzaW5nIHBhcmFtZXRlcnM/

