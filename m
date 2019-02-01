Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp481780wrt;
        Fri, 1 Feb 2019 07:38:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4/P28FOJUjx6Nnuy/ntpffcuQTIsousipHqT7f/k8WCyXTXxGWwe30sdrD6+RaGsbxF3IT
X-Received: by 2002:a5b:49:: with SMTP id e9mr28016430ybp.457.1549035500331;
        Fri, 01 Feb 2019 07:38:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549035500; cv=none;
        d=google.com; s=arc-20160816;
        b=fMvBEKegh/aHZntq9oiQ/H/7C+VWcETIIXbEUpNy1uhLA8QsyNnG6QyKiB80s0HeL6
         mCRRzO28vdWn3l3KurYTY+cWZGG9iLG8LRCoA6dNNg+Qh42zYB71s9fq5x4UTYFjOOoJ
         GsbOtiDqMfKZvTRGUULBnuITHMo6dfgnEm2tme9wJfLvgrwb7grKfFdOXxDrxpM2/4Lf
         yAo5jmI1Tg/P2jj2fA93B36iYocMpo1oihl8EB1FViic64+SUYQhHucNaeNUhnmVSXbL
         aO80Q0DttrK2tgLAIvO/5hei7QGUtFL+scgY6OKT9H3O/E3aBZ+BXIcSAlki8weCHSm2
         s+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=wdu+NIXqxUv3JyxaVvHH6ZlQmwNhwrWCJGRgHKRyRxo=;
        b=WLU6eA2121KNa7VjcI3UJodF0SXF8uaz0LD4iU3UWPmDYZjF/qG2u0x0bLVIZIqPhE
         clEEoOhndqfz5mySaCGv8vwF6g0EvcHckDcYMjz2KbhIbNhQYPfnNDKm3yN14rv3BqMh
         ttCjTyKffzlfM92IKMHQdx3UBX5HIIFFWJfTYpb4VQZrsFRXAWhQLgxkBoNg5LHE28n/
         lE3HdoHnjNRMLZJ03JPTDp5V8/IIYqDiABebGinmk9MASBSEz903xiAjH7T9fGry/hAM
         nm7QDEz/SZ0ULKrjRM+US1KTttW7blDGN1Bmvp/cwpSS+VMssTxfoh7DVrB6+arBrxF2
         yaYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b4Zc5+Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si4671980ybg.163.2019.02.01.07.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Feb 2019 07:38:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b4Zc5+Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpatU-0006wV-Lx
	for alex.bennee@linaro.org; Fri, 01 Feb 2019 10:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpatE-0006vJ-Am
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 10:38:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpatD-0006Qa-2l
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 10:38:00 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpatC-0006O7-Ga
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 10:37:58 -0500
Received: by mail-oi1-x244.google.com with SMTP id j21so6095043oii.8
	for <qemu-arm@nongnu.org>; Fri, 01 Feb 2019 07:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wdu+NIXqxUv3JyxaVvHH6ZlQmwNhwrWCJGRgHKRyRxo=;
	b=b4Zc5+BoGsmZhbMQsX5g67IlVUkDbch2MqrZ9nqZnMYJ93d43Kq8aikMKwate8QXFE
	z4PEJSMLe9S7NYJseJ/ZnTUuWR2aVxyBNEMNsC+KllMeAkMydslYHaIqiKD+TtUe7HkQ
	tVvKA7fsbZvoJ/iAKTtfoeTXEZuWacBH1hveo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wdu+NIXqxUv3JyxaVvHH6ZlQmwNhwrWCJGRgHKRyRxo=;
	b=A2CXnHIsq2WV9AoxI0TI4KOG8Ph2mzMa6+aVCkeBjjU6PtXlu6PGrnY0f/DKOdZvhY
	HS8nAbjhFLMwO91LnvSP3gV0kv61kxB0fIW7On4sSz/LaeNxk4E090XxlJa/TZwW+Pj8
	Bb6WE8MXhuWiNhiR50mEcSmONsgXBrUE4f7rI9IYj4F4IgUgtZfIATrBUTyKw4lVuZCn
	ih2Fu3jpYsKS2BQPcsFeui7L8IZBVdcpQYzokrSLS9OzwhS/jfe/ekbuPF7j/Su4NVZ1
	H0qm1MrOZnp9Ky8mBv1Rlp9HfP4d3yIHVHBmVzI6aY1IzWrdGbRmuxCOGtr135w665Rb
	9uKg==
X-Gm-Message-State: AHQUAuaxHyzVcJswIdkzml54LW4AwaSBOi5TH/R6M/5O6MgktClrYYuW
	6mhWE5H1DF/z9fWxOrOgva+C8dqUZQnRjiz/aM929w==
X-Received: by 2002:aca:bcc6:: with SMTP id
	m189mr19351274oif.337.1549035473956; 
	Fri, 01 Feb 2019 07:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20190201023357.22596-1-stefanha@redhat.com>
In-Reply-To: <20190201023357.22596-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Feb 2019 15:37:42 +0000
Message-ID: <CAFEAcA_EvJFyAW67=-9=bpVmnwO7vB88YH0BckNgPqiwOHX5FQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v4 0/3] arm: microbit Non-Volatile Memory
 Controller
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
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Jim Mussared <jim@groklearning.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a/KQXLzwvEfc

On Fri, 1 Feb 2019 at 02:34, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> v4:
>  * assert(offset + size <=3D s->flash_size) [Peter]
> v3:
>  * Fix endianness of s->storage[], tested by Joel Stanley <joel@jms.id.au=
> on
>    big-endian ppc [Peter]
>  * Fix off-by-one that prevented clearing the last page of flash
>  * Add missing memory_region_flush_rom_device() call to flash_write()
> v2:
>  * Add Patch 2 to call memory_region_flush_rom_device() from pflash devic=
es
>    [Peter]
>
> This series adds the Non-Volatile Memory Controller, which controls acces=
s to
> the User Information Control Registers (UICR), Factory Information Contro=
l
> Registers (FICR), and flash memory.
>
> This is the last piece of microbit work needed to make basic programs lik=
e
> Micropython "Hello world" work under QEMU.
>
> Originally sent as part of Steffen's longer microbit device emulation ser=
ies, I
> extracted this and deferred it until later because cleanups were necessar=
y:
>
>  * Use memory_region_flush_rom_device() to dirty/invalidate memory [Peter=
]
>    ^--- Paolo: I CCed you on this new memory API
>  * Fix device-introspect-test segfault due to missing owner when initiali=
zing
>    FICR and UICR memory regions [Peter]
>  * Fix off-by-one assertion checks [Peter]
>  * Fix missing whitespace at end of comment [Peter]
>  * Clear UICR on reset - we'd need a block device for true non-volatility
>    [Peter]
>
> Steffen G=C3=B6rtz (3):
>   hw/nvram/nrf51_nvm: Add nRF51 non-volatile memories
>   arm: Instantiate NRF51 special NVM's and NVMC
>   tests/microbit-test: Add tests for nRF51 NVMC



Applied to target-arm.next, thanks.

-- PMM
