Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp936121wrx;
        Fri, 22 Mar 2019 10:10:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0SWOJMuteXNEraMaeyYgtufWFTLySecl1Nd2Ab3tPNPtFMwA2SeJnqgP5h2X6WObcsGHd
X-Received: by 2002:a25:a87:: with SMTP id 129mr8953460ybk.484.1553274604705;
        Fri, 22 Mar 2019 10:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553274604; cv=none;
        d=google.com; s=arc-20160816;
        b=DFh8egeV9xqrT8nsSBvQj9sNtFsfLbQZSAysPkDXzZWTrABfXa/E+csCjinvfeAteA
         ePbxnUc9qj7RkwubDMxrK+GWISgQ279flUYZ8OgS9AqtNoZBQYbAyf1wK2w2nexF7gcB
         np0L/l8qwywb6ay/aOQUyWrEzymxtEa3e2bCg2DDZ/bIyB2JP3CsIHS6vy6261dwmk7R
         Wqi6akAuI+5sSQo6tFIZiXdflCobnCcQn2fCPggX32QnVbj6R7mWgL5VYtRyPAe84X69
         jVGsnaGxmZa71JisdfsiAp/DlgXB7WIstFnGFW2EmxcCmgWjvYT85jjsUHcJZMQtDIzu
         IZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqcM2yEFO/iCF96x7OxkGpS4SI7pnWwx8nvXZCijEd0=;
        b=ldZ7xBZXbXpw3KsYyLSiPug5tKpLBtBlWOlVu6WG2HzJVhE241x5EMceElG/lMUs4r
         //J6o+f8vcsvJTzO+UQZLy7pQSNgrd4JZaIQmTpKNZeBYbzgH+c5TlQvNE+ZjfIFDCV4
         9Pbsnnarfy94ccxfWms2EKXldRoJdgecHZT72n4ZSc9BEFv3OVYXrtt+lZqI+YiteZp6
         9/ABu9wqwPY+PUFR0ey/3XAGLbHeBfD8qw74BNd21nHYbdKf1eK9FLASJ07HmFUsWvXL
         8/mZdGfhPCgm8KKkuT6QklrONk9lwADOOEc2qFmu9IStfRxJb/JGONv7kI3qUifeJKCW
         dzEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BqZXXd2l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si4991898ywc.443.2019.03.22.10.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 10:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BqZXXd2l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7NgC-0005u6-3l
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 13:10:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h7NVo-0005gr-Fa
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h7NVn-0004Oc-54
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:59:20 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h7NVm-0004M9-Gu
	for qemu-devel@nongnu.org; Fri, 22 Mar 2019 12:59:19 -0400
Received: by mail-ot1-x342.google.com with SMTP id c18so2487407otl.13
	for <qemu-devel@nongnu.org>; Fri, 22 Mar 2019 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CqcM2yEFO/iCF96x7OxkGpS4SI7pnWwx8nvXZCijEd0=;
	b=BqZXXd2lBXs8GoqVCWcNcbc5sjmfghc7E6T/TgeY3cUW1Qddo/CdYjL/wWUjlaSmzB
	ab+QPNOlRpXQPUcrP2IUaMwE69AAS/s91nUf9rbrkEY2pBJXNdriiG1e+kI5DVySzeyA
	RiCesH696tC0NOsm5mnSuBMtPRcCH3e3Pu+NcR5d584vy6vbgUoZ55mPFunoRDDKsrav
	Ghl4AcdmvM58ctTyTZ5r5O9SiH3ylf5ADKdEzmNrgvoO9RtV7dJ9oCHK+FQOe8NfHNYA
	EZRBsyWn/SIgneZTwW20PA32w2hsGRXadt2rf81b0q1L1yfp1s5UwirrwKsW+9DY5pei
	nS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CqcM2yEFO/iCF96x7OxkGpS4SI7pnWwx8nvXZCijEd0=;
	b=g8xyQSkT72Xc3yO5QyKqgiBfBlMoki9fdMigtFp0t1fIHdZANlhva+dQZmDjU8EUcI
	DOkc7+u08LxkJ6Q1X3OQSG9FoTfumLeym+0TVV+ZgYJ5j5e10oPTSZQzVtpcZ0PGSxWV
	mqA4laVYhPU0HniN8iviwWB0Q9Fbbn5KMR8Gsj4oWJ2c2wcDdWDNxkf3CQPnkrt+kldE
	Bh6wPKlMpO6aIH6SUeOcXOPGSC/BxEMnTX+H7w97vnfbAERgUVUF40LoBhBanT4Dr9fj
	XRR/41m9adUVBcAFcJVhDjMnWGqV8Zgz2dOmza2DvcXUAqArk7EvrQK2daFcBQp6MniD
	Wgdg==
X-Gm-Message-State: APjAAAXGqA80LvTHi7IZQKBIqb/zeiLENsQMtgD7b5owgyhxd1r576nq
	v/oj5VVxP8+k1TpkCgoTjkLiRmWDyyd3PL/6TS5SJA==
X-Received: by 2002:a9d:130:: with SMTP id 45mr7273745otu.352.1553273957298;
	Fri, 22 Mar 2019 09:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190322164036.ajjnip2xbnrqypu2@kamzik.brq.redhat.com>
In-Reply-To: <20190322164036.ajjnip2xbnrqypu2@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2019 16:59:06 +0000
Message-ID: <CAFEAcA88me9qtoPmTZZBzVb9XCxx2ZUZM4_9Ge9eTMcor3m7ZQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] target/arm: kvm-unit-tests gicv2 test failures on
 tcg
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
Cc: Andre Przywara <andre.przywara@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUncDb79rI2Y

On Fri, 22 Mar 2019 at 16:40, Andrew Jones <drjones@redhat.com> wrote:
> Hi TCG GIC developers,
>
> There are a few gicv2 test failures when running over TCG that we don't
> see when running over KVM. I don't believe these are regressions - I'm
> pretty sure they've been failing since Andre first introduced the tests.
> I'm just pointing them out now in case anybody would like to look into
> them:
>
>   $ git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
>   $ cd kvm-unit-tests
>   $ ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
>   $ make -j
>   $ export QEMU=/path/to/qemu-system-aarch64
>   $ ./run_tests.sh -g gic
>   $ grep FAIL logs/gic*
>   logs/gicv2-mmio-3p.log:FAIL: gicv2: mmio: ITARGETSR: bits for 5 non-existent CPUs masked
>   logs/gicv2-mmio-3p.log:FAIL: gicv2: mmio: ITARGETSR: register content preserved (01030207 => 0103020f)
>   logs/gicv2-mmio-3p.log:FAIL: gicv2: mmio: ITARGETSR: byte writes successful (0x1f => 0x011f020f)
>   logs/gicv2-mmio.log:FAIL: gicv2: mmio: ITARGETSR: bits for 4 non-existent CPUs masked
>   logs/gicv2-mmio.log:FAIL: gicv2: mmio: ITARGETSR: byte writes successful (0x1f => 0x011f020f)
>   logs/gicv2-mmio-up.log:FAIL: gicv2: mmio: ITARGETSR: register content preserved (01010001 => 00000000)
>   logs/gicv2-mmio-up.log:FAIL: gicv2: mmio: ITARGETSR: byte writes successful (0x1f => 0x00000000)

Haven't looked at the tests or the GIC code, but I'm guessing from
the logs that these are the usual tendency of and our device models
to implement "bits that should be reserved" in registers as
reads-as-written, relying on the guest code not to set them.
This is strictly incorrect (the GICv2 spec says implementations
must make RAZ/WI bits really read-as-zero) but it seems unlikely
to trip up real world code.

I'm happy to review a patch if somebody wants to write one.

thanks
-- PMM
