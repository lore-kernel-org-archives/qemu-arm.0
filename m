Received: by 10.28.173.206 with SMTP id w197csp3996907wme;
        Tue, 9 Jan 2018 10:25:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBouJTLKqCL4NtxDyzOy/XkIoP8yMYbTQJO1gOqdCNPXyb4PJhOjemZqyv8Mien4JQ/WAJb60
X-Received: by 10.129.121.147 with SMTP id u141mr15047964ywc.235.1515522323886;
        Tue, 09 Jan 2018 10:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515522323; cv=none;
        d=google.com; s=arc-20160816;
        b=oQGsivwJMkZJ4+zO8jo2t//jNXy3jJJR2GjDXrtUC8Ylhgaiwh15lM0HnqdccmOutw
         /omVJb/RhB8c13dce/PcIQr0UI3a24AxZbhTOqqVVXcWJxmF8sZ0HmOgUZnG+8kpVGK+
         wn3x9FYPuf4A1nPEvNywTHox7VBw1jchItwcYsrajeIgTGDx2Jc34OyFDnw43nHshmjx
         iIyeD7f6tjI7wu+JOrwUZ4XnvkoeUJXwQQWg1zL9h7Eoe9kPwSD/R48D3z6i1DDyohjI
         csHPGo3b7xgZln4XmHiiz224gYXQEd5DLKQxbSa7NfA0Gy3J7gxpeX4JoVzU2np6EyKq
         WHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nFkmO6YISJbl/9IwxhuxDOCHAlvR5UpEMVVHkPjOYe4=;
        b=UiieGUavExDudkPJtcMJWuM4Izh3ky/vhn9D/XdOQ+O7/1GCWGiRzwEjdVkUyPV3DT
         ZORMwkAElKEZXLXcXE5Rmhz4/x4MNuCpopatT90JUWajsHuMrcS+a6xxR0G2VhPmhK/G
         jZiL0Dx+zxFLT6b0cewaFHxcWHN5SJdFcuTaBLon1u/pdlll2hYGWQVKYZ/FoDTtwyE1
         DgtOb0rPt7UFhWNEC9zMT2c5n7uGJJvYfNNgEBk/Z31WBd0TVv8AsAer8E7MqJYFB+LH
         T6BgFn83AzmbBTDB/zURNWuA/kLCNnBxh2omAYf3CS3FQ95w4UKcPydUq2SchCwScqwL
         2/tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KYIVP1HU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14si3189588ybm.107.2018.01.09.10.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 10:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KYIVP1HU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYyaR-0001Pt-9N
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 13:25:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYyZn-0001EK-UI
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 13:24:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYyZn-0000xN-3y
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 13:24:43 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:36052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYyZm-0000x9-V5; Tue, 09 Jan 2018 13:24:43 -0500
Received: by mail-it0-x242.google.com with SMTP id p124so5712480ite.1;
	Tue, 09 Jan 2018 10:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=nFkmO6YISJbl/9IwxhuxDOCHAlvR5UpEMVVHkPjOYe4=;
	b=KYIVP1HU3SuxC/lK2LqgD/qEMcJLYFAQKIkU10RkwihCyTrBA+pG/paL93ERMvEla9
	pekQZlUclDVtGquIve+O2NUyuHzYcBBL3fNn/hoUllzmYKdkh1rwjbnN8hqEpBGuOjmw
	Jsau3TSCu6Tv/wpD8huWjnTtaBuxHPtdCc/uziycp/2JbxtfMkg2m72/tEmrmVODy88V
	kIswtF6ANgX6yFWNrHq4mp2fgII75lNp6a1tNGwDJkhni/RHpP2xUQZDMK3NXHwUQH0m
	ZqkE/l+zrjIMNfgi17Em+TxewkI9/1kvfOrVympTASEytQjOAFbgXwGQgux2atCFgPDh
	N+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=nFkmO6YISJbl/9IwxhuxDOCHAlvR5UpEMVVHkPjOYe4=;
	b=LY22faRWZZlteg+P+vX7tW0xMppABcx+pHG/UsvbuuOzuGgA7HHyp4FxBC+UxSjz88
	xobiDngNgPyFs9QShaXfu4z1cakQYw6leAUyA2C9g4NK5YGYJ48JGdKzziE2xb7KVoDX
	zojUiQxEaLChAsfvzUzg2gSKbHbIjxwmoi88xmYsqGKZ/BxzG56O+mGTWCUkzVOLSZzd
	wAd43Iv8XX6U9b9ifDSERBDSW9vpJBIvKIBABp1wETLAMTFgosgjeAxp9YkZxcdG+A7y
	2Z+mvnJ07RInKwp+NMRm0TowZAFBsi++uskUDCc8BNE1F0jVjjdXGguH2IVPplEgh5cv
	yGVw==
X-Gm-Message-State: AKGB3mIFNznVWAkLYijuJgAs99nYJE6nZujUIigLV08/ydF2ZwFNFAYC
	rZ0KuNlZU1W7YY/atHUei6bxKlhohL02wSOqB/k=
X-Received: by 10.36.86.212 with SMTP id o203mr15862457itb.32.1515522282291;
	Tue, 09 Jan 2018 10:24:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.8 with HTTP; Tue, 9 Jan 2018 10:24:41 -0800 (PST)
In-Reply-To: <CAAdtpL7bno=1yrRYK6zt4pgDsa8N-8d291pzX0rhNBVqgkKi4g@mail.gmail.com>
References: <20180103162400.10396-1-f4bug@amsat.org>
	<20180103162400.10396-3-f4bug@amsat.org>
	<60c89dbec86c14e2f0883d121872d0f6@walle.cc>
	<CAAdtpL7bno=1yrRYK6zt4pgDsa8N-8d291pzX0rhNBVqgkKi4g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 9 Jan 2018 15:24:41 -0300
X-Google-Sender-Auth: kC4QthuRGUdo-bz4ip_UYt1I83w
Message-ID: <CAAdtpL54UQjG7i5hKtgoKMzvXFL2iuiOEE-2re8YoJ41OCbEpw@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::242
Subject: Re: [Qemu-devel] [PATCH 2/6] hw/sd/milkymist-memcard: split
 realize() out of SysBusDevice init()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Xiaoqiang Zhao <zxq_yx_007@163.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8krrgWmbdc89

>> Creating the device (milkymist_memcard_create()) fails with an assertion:
>>   sysbus_mmio_map_common: Assertion `n >= 0 && n < dev->num_mmio' failed.
>
> Thanks for trying this.
>
> Odd 'make check-qtest-lm32' didn't catch this...

Oh it actually does... My bad!

  GTESTER check-qtest-lm32
qemu-system-lm32: hw/core/sysbus.c:131: sysbus_mmio_map_common:
Assertion `n >= 0 && n < dev->num_mmio' failed.
Broken pipe
tests/Makefile.include:854: recipe for target 'check-qtest-lm32' failed
make: *** [check-qtest-lm32] Error 1
