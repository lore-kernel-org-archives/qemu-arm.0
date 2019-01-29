Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4358973wrt;
        Tue, 29 Jan 2019 03:44:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6DYt8d8HDzDxdl0L/xAQTVmkBqQk0bkvqFDKnCVg1KyjBub+ALd80PKPENbZH9KufW/0Gl
X-Received: by 2002:a63:a112:: with SMTP id b18mr23497480pgf.440.1548762287649;
        Tue, 29 Jan 2019 03:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548762287; cv=none;
        d=google.com; s=arc-20160816;
        b=vH2oDdY4t/sB72goKH5KEEnu08Rz0S9XxzHFWg65JL62QDZQa9ImmRJIkpcI1rrf6F
         tAbqNPlRONkqk3sSaWySz4ApfHFaloEWdF5f39aNYUL/cnlE/u1RjbOQRWk4wS8byenH
         /PF4bislpqwybPUjmkKYYsKIf4VEZOVL8afKbs/3qh0AryDFw4OnpePXUXX9dIScOwg/
         wYDCDxesKMj9m6a11rcMzaRFPAudcytBiCmpFBIR2Fhu4kuWvtX32WKBVIU5SBxaDk+O
         7ff9cd6d4Gm9WZ99kyowMiw/mUqLgScbijg8zUIeVl2qUsfRYoIRTP/GZqbrS4Jv/C8j
         yOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVc3d7sSlkKhr2AL32ZybSV71AiXdi3AJydeUSbNRis=;
        b=HJ/I35iZM43/I2QiIZ6MB+Owe7pGgbiPo30WTULr4x7NiDJDaOVTa2hxkRULxXoDnn
         heN/XX6k8KPvmf/Y2Nmvpi34+4KOf/sHD87cWyXg7v92QByBjc15yllHjUafIPfeVq66
         4My4L3jX1IOM/RGihAzlh758zD3d4j2MsynTeAJn78dWmVtVQg3nY8AA0hP/n6kgIgwd
         5vYoR/fq7uXnIs/Jq8VtNSy3Q6d2E/GZDGtZL2pd6NlksNAsrRcWcVxV+Ma14KODA2Oe
         boDpS728ys7/eICn6D9ca6eRk0MAhb8ECc72QeFQTR9aDJGrxd3OIIO/oOHezkMtJp+n
         w1ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i9gNvYHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si29738635pfc.61.2019.01.29.03.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 03:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i9gNvYHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goRoq-0005jc-EV
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 06:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goRmn-0004CO-Q7
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 06:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goRmm-0003Ej-FB
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 06:42:37 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39219)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goRmm-0003Dn-3h
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 06:42:36 -0500
Received: by mail-ot1-x341.google.com with SMTP id n8so17581339otl.6
	for <qemu-arm@nongnu.org>; Tue, 29 Jan 2019 03:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NVc3d7sSlkKhr2AL32ZybSV71AiXdi3AJydeUSbNRis=;
	b=i9gNvYHdie9ZoDuhJ3rAp5c3kAvI0NdZvwtjVcDekm8/rtUWBNx4kAKU1dhJDz9yqb
	3sizVc0rKW48DpshAPr2+NSTeDgVxyjprjHQX+SCRDebRVmsfhsMtskKa8CzJEx/w81u
	tIOkBJ9qnpp1vWOpC4A7FwLR+HzYX6HYt2REY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NVc3d7sSlkKhr2AL32ZybSV71AiXdi3AJydeUSbNRis=;
	b=BgnRXzbZgsUT+yp9wETFVxd4scG0t4SQj7N+qZ2brQltvzQB2J0Y/kIZQBXlQtF6vA
	KTu4/oQAx/MIjVdwJODNDNEhvQOr6+raJdx8LqtREKZGsPa+x2CIq8yvVEpKUhOIfXPY
	fleC3SGa35Pzkuxc3X4/kX4Qk2ika6lWrhwP2VXQ4dktEfLLFH2f27sRRbmQM9aW4lL/
	TxQ8D75ITUNU2ZAu5vwqfZbpjptMkUbjf1G4gfG5orDVSiVDvhRZiSSVzKMC9jYSZA3g
	SU7Bk41qDK7sqfSxyEFm5tHSbL6QSapLKi+jAax7DR9Lz24Yc03Texb4LtxghHKC/sXH
	UIsg==
X-Gm-Message-State: AJcUukduAMgJY11WoFM+ikNUZ0ALWoQwR9gX+tBUfuUXnjv4hGFFKhmk
	Jq2HZM/TZF/HHrIp20xG8TFsv6Q7ZxkjvltwW4St/g==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr17985741oti.151.1548762150457;
	Tue, 29 Jan 2019 03:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20190124141147.8416-1-stefanha@redhat.com>
	<CAFEAcA_NBtWFZi8G8goXrX0OHHeHheW6MK3W9ByHVi1DNX3JWw@mail.gmail.com>
In-Reply-To: <CAFEAcA_NBtWFZi8G8goXrX0OHHeHheW6MK3W9ByHVi1DNX3JWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 11:42:19 +0000
Message-ID: <CAFEAcA-62rkQ4AQ1FQD3C4qn8tfxREu6BJuAdfw+VS95zS3Ung@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] tests/microbit-test: Add tests for nRF51 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ngApTHTgdY09

On Mon, 28 Jan 2019 at 19:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> This assertion fails on PPC64 hosts:
> ERROR:/home/pm215/qemu/tests/microbit-test.c:181:fill_and_erase:
> assertion failed (qtest_readl(qts, base + i * 4) == i): (16777216 ==
> 1)
>
> I suspect an endianness issue, given that 16777216 is 0x0100_0000.
> The test looks OK, though -- a word write ought to come back
> the same on a word read -- so maybe it's in the implementation?

The problem here is that the read path goes directly to the
underlying host memory, but the write path goes via the
flash_write() function, and the two disagree about the
representation of the underlying storage.

I think that declaring s->storage to be a uint32_t* is a mistake --
the underlying RAM needs to be treated as a byte array, not as an
array of host-endian-order 32-bit words (because the direct-to-RAM
path effectively treats it as a byte array). Then, since the
flash_write() function is part of a DEVICE_LITTLE_ENDIAN
MemoryRegionOps, its 'value' argument is a 32-bit LE value, and
it should do the modification of s->storage via something like
   oldval = ldl_le_p(s->storage + offset);
   oldval &= value;
   stl_le_p(s->storage + offset, oldval);

Another reference to s->storage also simplifies when we fix its
type: s->storage + value / 4 becomes just s->storage + value.

NB: untested!

thanks
-- PMM
