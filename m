Received: by 10.223.197.9 with SMTP id q9csp10544020wrf;
        Mon, 23 Oct 2017 06:11:51 -0700 (PDT)
X-Received: by 10.237.59.184 with SMTP id r53mr18209192qte.271.1508764310959;
        Mon, 23 Oct 2017 06:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508764310; cv=none;
        d=google.com; s=arc-20160816;
        b=fuA3qBLXCTSbsDsNAi+ESwgccK7nPlSnGdjSory4Xh/djqXpWvodk/hFO6ZNKBN3ee
         tUR2i+XWZCenBrWF+Tza1q48v4FalaDK4CjHldGowES6ateo75gBoBoY32dgBfDKxM0H
         wOMubacBpHjKDhD8i7MxivrNWJ0o3/yim/Ih5tD3vYpwI5yPEdwlxwpdRlUYys+ldOmb
         icIzbz7qkkpAc4LgIMfVsUb4sU4WdTMuhp8RlIdqx9zIJiWfbSo3zVWGlvuUk1tKeVnO
         ZczdStdnpH+ywUhmVH8GnDrgcDI0G5+u09EWhJ8DqWxgOQOnoUEhPLzYeaMPvZZXNd+r
         WDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3Jz9ap/eE3yRLs8IkG8EUBuLug+HrQhxdNIrmJYeeJE=;
        b=0n7+Cyt3j78YUTwAU8cZAQvoasEu5bJfS3s7TepUgNENAmbzJD9ROzEg4jEVXf7bs+
         CyT2sNhwv5jMFfWKg8uqtlvoYm/iL/pCm+Bi0ZP3J+n+kfGO+5ZxQAImZSdsZpmst0lJ
         qvpj8wNRObePk6e7ZlmY4xUvJVAUEdb4F8CT9IBIeKYj6uXxKTk06Vv/3I8Dhcf4Y/QF
         ac+2cdbWzcOTxZq8iOzX1rBVFf8nEiIO4VCIoCIhNBzqXiThp5/pprm5Nwa5QNfE4I4W
         q/7L3TnlhRMMtJn2pgD+q+5ZvXOIqX88SrZp7wRIJjL9GfueTyNZF2en1yMOb15XJToe
         696w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kChPsecN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si4786887qkw.472.2017.10.23.06.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 06:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kChPsecN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6cWC-0000Wo-Jn
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 09:11:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e6cVw-0000RA-C6
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 09:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e6cVv-00086M-JT
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 09:11:32 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:45413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e6cVv-00085c-AE
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 09:11:31 -0400
Received: by mail-wr0-x242.google.com with SMTP id y9so5104733wrb.2
	for <qemu-arm@nongnu.org>; Mon, 23 Oct 2017 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Jz9ap/eE3yRLs8IkG8EUBuLug+HrQhxdNIrmJYeeJE=;
	b=kChPsecNUljJwBHED+3T92z6JdQpnvXZJWnyejbrHMlE7EjeJ9UD612guJa2g/Fg49
	9Xn+6FyoKsNeef9ug70W0u55MdkB25/5ue7g17cY25AtKZtTdFpWXhigMTB3dSNgkUa0
	0WsHJnQERcOj3dxINoShmp+H27K22tFfQZPb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Jz9ap/eE3yRLs8IkG8EUBuLug+HrQhxdNIrmJYeeJE=;
	b=Jm+WR57VHS++MWkZ8hGPdgFkLxuEiVQ1lqUtKQUw9kxaDDzGqg3+Y7v1SQ9JxTpB/R
	mH44TXlnqhAwYgWwkkdUbH+AfQ4XfNikvqLJAlPCHi68wQsnuCdBmY7Jxmg8obn0APqa
	rZaDDyKs7SN23986OJlFr0z0Ia1K50U2sK/UiwphohTMmTydr1xsTtDP8H/DJ8e9szmD
	VuJnGwU8s3fEBWqL1bBnfM4I2inhw/QR7+VU1MLc/0IVYlj/W6bWQQUGrze1WrQu5qz/
	oa8cKvB2CpCn0BO3Fv3Nuoa3bD0Qm6vn8eu3qbHsx0MZ+/Zy+6siNNIosP2FcicENqmb
	6MQg==
X-Gm-Message-State: AMCzsaVVGfN1DRlI6Bu7sTH6/auXSCWBwoTWciV4fuuqoM58gablf66i
	RK60JUMECRR/4Sxnca0ylYiFUD5NSHBIwO+fygwbaA==
X-Google-Smtp-Source: ABhQp+TfCiTVKaY9pekMkaZMKYulth2mTztdMr1xcoo3n/ajRAiHYxDoFjU7Jv0VsuBRFNAyPtz21XAHrzyD7/TpjjE=
X-Received: by 10.223.171.161 with SMTP id s30mr5075796wrc.194.1508764290251; 
	Mon, 23 Oct 2017 06:11:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 23 Oct 2017 06:11:09 -0700 (PDT)
In-Reply-To: <20171023122719.17199-1-Jason@zx2c4.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Oct 2017 14:11:09 +0100
Message-ID: <CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dZ75XkXDiZ3E

On 23 October 2017 at 13:27, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The QEMU man page says:
>
>        -serial dev
>            This option can be used several times to
>            simulate up to 4 serial ports.
>
> However, the ARM virt machine erroneously only provides 1 serial port.
> This patch fixes it by populating 4 of them.
>
> But, unfortunately, this patch doesn't actually work. Sending it to the
> list as inspiration for somebody on the ARM team who might be able to do
> this more properly.

This is really the documentation being wrong -- that is actually
a PC specific thing. In QEMU generally, -serial can be used
for as many serial ports as the machine model provides, up
to a maximum of four.

Why do you want more than one serial port in the virt board?
If there's a good reason we can add more, but mostly I only
expected that one would be needed, for the console.
(If you're using the TrustZone/EL3 support then there's
a second UART for the Secure world.)

thanks
-- PMM
