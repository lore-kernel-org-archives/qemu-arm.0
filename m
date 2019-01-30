Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5112851wrt;
        Tue, 29 Jan 2019 17:54:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7RnxbiRadEBtscRQ1rrWHOvKtB8qvfVfhj8Yc86ksOrxfNhyXQfPqNhqsi/GAkMuR7AZ2q
X-Received: by 2002:a25:8145:: with SMTP id j5mr25839717ybm.472.1548813261407;
        Tue, 29 Jan 2019 17:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548813261; cv=none;
        d=google.com; s=arc-20160816;
        b=jInfwKBybXgJp2ttL6E8dYXpzAyi6gUjgGVLFj9oi/MGQ0ZaOcBTpif7qB5m1xHhqV
         jTc5qMT4JYYGCxk+LvET2H0rfxeTCo1m6zGgCSpnL0H0A15Udiw3MF8cvBHSvnzZFMvF
         JvUvekCcxV6VfJ0m0IFX0WMTkqt9jMvXPkNs+2IZwq6r2xzdul23jiKhga03rH71iBRt
         seKBJ7fyWHQHLGLJoFs3kuogL80qp+RLMnCW04i++pP5VMEo+MJYs8dTLqByRjpaAke4
         nlABEHR8qEnoDa75dLLGUq0CFBS5Pm5ni8+wjzn8YSurwOcg5WEzKegh1m7YQYEJ70PK
         zybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VJd/QlW81wbA95QtykEeTs8OQftZYRxJNS6VyvUJCgQ=;
        b=DKW4riW7ARERNB0Hb2D0xReNVi1Q+JVJSTRg0yNfxsJQ0EixptzBJx+eOQo6wcZHBj
         3NAU+zMu7DWFbrvdV/ZWRGmQjwxAdtcVfQTsAlPHijdCilVfGwBL3w+Bi+d589YkSRqd
         qtHCrLqAzL2poz8rod5LaMcaQjTsm4Hfp4krvfACesePqGn+gpCJQOtxbEQFCNvTa3RG
         5ZNZ7wdeW0LzLvnjiJiXHQAV6EJwIhqn8Pn0ySxJCa7Wsad/2ybx6QzCsGPDM/76mVvF
         KQ+wvvZSSmi0h9x1gLlCOFHJZrFzzrJne1Cut0mDkp+VKD8WNB96OSsVXVQaL1VozQ3z
         5icA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KG4zkh+n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si83989ywd.32.2019.01.29.17.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 17:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KG4zkh+n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gof52-0007iA-UP
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 20:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gof4W-0007i3-Gb
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 20:53:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1gof4V-0005In-Le
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 20:53:48 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1gof4V-0005IL-Dy; Tue, 29 Jan 2019 20:53:47 -0500
Received: by mail-wr1-x444.google.com with SMTP id f7so24380710wrp.1;
	Tue, 29 Jan 2019 17:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VJd/QlW81wbA95QtykEeTs8OQftZYRxJNS6VyvUJCgQ=;
	b=KG4zkh+nVmXRMxmu//UjTsGCPfGc9k3e1OJkAm6I0qK1kfvZvMmymgB/VxdoST3bGY
	M45ent8da0iv7BjeRNyy+BLJ5mskvoY+FzfLujQjUD+OM/wIl9neZ0kv8wyFN5QPVGRi
	VXm1Wt7O8VZyqXEzJT2+lrvzo0D25G4oxXQNGSrP7C7UB3hEjGyauefVG8HDON5vIqjh
	p1UypRAeC+e8ppI8tZNrLy66kfDVXgdmBiK8moLTuuw3AGAhSGX8Xp0wH+2lGnDK3mtN
	iufVbeAfT/uqXvulnyhVrON5ZE8uKqVRZgetkLnVAdXi0KpMVP3D2EchsloeAgBxtczH
	kJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VJd/QlW81wbA95QtykEeTs8OQftZYRxJNS6VyvUJCgQ=;
	b=RB46PYAGVg38L0TDafMY5ohrY+yRByMhQ1YYGqpRTsd+GGr8RstSEA83Rk8JezwsV1
	524xBVvBiVVDTpqP8grQd9hsJPU+/V/wB7NVhbHnWBWS3hAlqs8zHWtYXFJgXIuRjbD7
	4CUX+F5tWD4Bnu0zWZy7frskkV1WJniUimnbTkoQg3RAFXjpJJB8OdtGUOW8D9BisfDU
	TS2vNN8aKpL8dHkw+tPLSHdJ1+3dIgkd4g9yj8YtieBxuG6yb4tkBTTdIfv+l1GBM+9T
	QX/1c32JQdNixbvSkp2tR+D4wEMzbxN5gRRdmUfKvCWZiZojqsYG4zBQKHvHFocFFcE2
	Ofqw==
X-Gm-Message-State: AJcUukccoA6RcVfsyNFR+/OYnW267t/Q5ll47OsLjWGQ1Eeo8pmgr3Fe
	sRBghR+GLkeiZAbeuNu6cqzh8J1ggBrWfe/tHaQ=
X-Received: by 2002:adf:a357:: with SMTP id d23mr29396846wrb.195.1548813226035;
	Tue, 29 Jan 2019 17:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20190124141147.8416-1-stefanha@redhat.com>
	<CAFEAcA_NBtWFZi8G8goXrX0OHHeHheW6MK3W9ByHVi1DNX3JWw@mail.gmail.com>
	<CAFEAcA-62rkQ4AQ1FQD3C4qn8tfxREu6BJuAdfw+VS95zS3Ung@mail.gmail.com>
In-Reply-To: <CAFEAcA-62rkQ4AQ1FQD3C4qn8tfxREu6BJuAdfw+VS95zS3Ung@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 30 Jan 2019 09:53:34 +0800
Message-ID: <CAJSP0QWGLEoje0F+4cPtUx5FaGKjV3_=wMjcDqFAmbM4XbyDvQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH] tests/microbit-test: Add tests for nRF51
 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zj5x8ebi4zyh

On Tue, Jan 29, 2019 at 7:47 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> On Mon, 28 Jan 2019 at 19:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This assertion fails on PPC64 hosts:
> > ERROR:/home/pm215/qemu/tests/microbit-test.c:181:fill_and_erase:
> > assertion failed (qtest_readl(qts, base + i * 4) == i): (16777216 ==
> > 1)
> >
> > I suspect an endianness issue, given that 16777216 is 0x0100_0000.
> > The test looks OK, though -- a word write ought to come back
> > the same on a word read -- so maybe it's in the implementation?
>
> The problem here is that the read path goes directly to the
> underlying host memory, but the write path goes via the
> flash_write() function, and the two disagree about the
> representation of the underlying storage.
>
> I think that declaring s->storage to be a uint32_t* is a mistake --
> the underlying RAM needs to be treated as a byte array, not as an
> array of host-endian-order 32-bit words (because the direct-to-RAM
> path effectively treats it as a byte array). Then, since the
> flash_write() function is part of a DEVICE_LITTLE_ENDIAN
> MemoryRegionOps, its 'value' argument is a 32-bit LE value, and
> it should do the modification of s->storage via something like
>    oldval = ldl_le_p(s->storage + offset);
>    oldval &= value;
>    stl_le_p(s->storage + offset, oldval);
>
> Another reference to s->storage also simplifies when we fix its
> type: s->storage + value / 4 becomes just s->storage + value.
>
> NB: untested!

Thanks for looking into this!  I'll retest on a big-endian host and
send a new revision.

Stefan
