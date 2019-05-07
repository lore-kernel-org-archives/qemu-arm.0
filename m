Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3489559wrh;
        Tue, 7 May 2019 04:02:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZPbcYgDgAay5Pwc6edNpk3yg+Aor7eEGnWObcuG92TGK30ZT8WEw1ScPzThvfenxuJrhQ
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr21630637wrv.160.1557226935470;
        Tue, 07 May 2019 04:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557226935; cv=none;
        d=google.com; s=arc-20160816;
        b=wVREFzeY5q55e5bOO+ZgxQ38tyYVm8j6pv7TVewdLRpY3vy7QXZQUIgcy4HNfMMNUr
         hZOno+xsGC4DH6O8DKMk0kbMIBQD5AUqZQ3rgZprpsP+oZeGP+4Hc8fhd9Xwn1KayFGF
         nScODwIKr1bjoXpq2u/rdcBng/ekKo+zjpxOmw2otEoj4Y+Do8Pb5BZzxCCtceZ1k4GN
         M9Bg7WYIo8lE2dAGf3v9VMPA2DL6XtM8D0joMcINOW9i45lw5g9fTlf6nFxC4X6K5/Jv
         6xVlMssTlW7l0Gn3ppYypejFPk/0VQTUupsrI4nv3QvdbLxPxd5WND+r7SKc87ff431m
         AWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlvYLBu+8+Kg11geN/1X2OLOgDY+iIcX2Bw2SSk28HY=;
        b=Wkl8HjOVS2oHgNqKsh2ZmxSuECCESaFUcI1iwQjtma9MXes0MEu8uphp2q9U4ipG3+
         /9tj6kGM7xMBhwkgNJKRpQWDT81B03YsVKdGIBaBVNLaPVcOojgBy3qJJPvI3ydGpQ4R
         dSFi2BW1rkKOlw5LZbzEfNHSOwLT/AV9rMCH4sXeL6XtE2PqiYnF8GHG8E6sPs7drtAu
         13TJ5/QtYcXJQk5XRt2X2i1LOxhuGieQFIYoaDPw0qZvmurHVeq8PI2WnnqkKGoVaIdq
         z7AsUEPoiTt5D6LRXwL5YXxASTTpe2TlTfjjuujqppotwvJymCsCj9eL+xLzg4laT0T5
         zJIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YRwTrMq8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si9364673wrj.311.2019.05.07.04.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 04:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YRwTrMq8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNxrS-00027d-JF
	for alex.bennee@linaro.org; Tue, 07 May 2019 07:02:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNxqh-00023k-GU
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNxqe-0005YV-U9
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:01:25 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hNxqc-0005Ws-4o
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:01:22 -0400
Received: by mail-ot1-x343.google.com with SMTP id g8so14447975otl.8
	for <qemu-devel@nongnu.org>; Tue, 07 May 2019 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UlvYLBu+8+Kg11geN/1X2OLOgDY+iIcX2Bw2SSk28HY=;
	b=YRwTrMq8hnys72I+Hlv39aEW4hhIwggo/guZCrXYCbNiERvy33YoMfbUQWKRBWCDE0
	f9qdkXJ533st2EOcWgz9Gb8E/8Cw3REztSMLQkdzIv5gDGtB4iSE21tbuycDKBrG9HBt
	2bIMGJwCOl3VluST4AOv15WPMzI1hhCqCWXHX+ERllP98mqEInPMCps0SMQpMOMED54V
	lUrUetqhM6NHFG8SmMCWn8ejaZpI9xvDT7vDFoVIwleArM6g9NP7SZRc5B8aYqDBeUls
	eZmykUowAN8qzSHooKFTMOThomwZBwuEmgS1uVDNqf+5ttmSgVaUofoKdNOQmST7gHmx
	3lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UlvYLBu+8+Kg11geN/1X2OLOgDY+iIcX2Bw2SSk28HY=;
	b=HYHRUNGbch1dB9bLCDBwumVDVn9YOL+f90gYSTweD6Ajzw+wLMX+Ny9Zycev3l+OlQ
	K+nRIY6kaEBWvjwLq1+pOKipOnD0jyb+dunrTPtz8gk9z83oCEJYSCRwSiOH+eN9WmKP
	MSTZcUNJ+6TbaFMocViSoetcNXtJ42I4l71jvv99rv6JUykvjPCBQ3NDD9cFgJAfEn+a
	BoTvIh2GqAgXVBA4snzuCeOc4KjiE8XWgNPICyfJMcAvGSHFL9lyTBvQEO3f/yYyHvQi
	xOiu5JkjBB28QkO/5N4VsAvrtWOwtq1XClkaH37zf/N0c5o/n4kKSfayMcDIR93Pr8z0
	EPug==
X-Gm-Message-State: APjAAAWVsg6FGFIaEIvJOHnWxCAcadmk3zUb9K+Ro6KlArhtNlFmReBA
	lfWke+a5HyMs5fVCraqYCzDSI+ymJQHw8dzWs9kx+w==
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr20561611otk.316.1557226878015; 
	Tue, 07 May 2019 04:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190505135714.11277-1-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2019 12:01:06 +0100
Message-ID: <CAFEAcA_utmcMFAmaGL5CJm4erBg2dZWZpdGvETRqVukOxrdpPg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PULL 00/28] Kconfig for Arm machines
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: usgHLEGheIUA

On Sun, 5 May 2019 at 14:57, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04f7:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-request' into staging (2019-05-03 15:26:09 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-05
>
> for you to fetch changes up to 55e5578fabf744e62038f7357369a68e460fe205:
>
>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-03 17:06:20 +0200)
>
> ----------------------------------------------------------------
> Kconfig settings for the Arm machines
> ----------------------------------------------------------------

Hi Thomas. My test setup that does 'make clean' before the build
failed in 'make check':

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_BINARY=i386-softmmu/qemu-system-i38
6 QTEST_QEMU_IMG=qemu-img tests/ahci-test -m=quick -k --tap <
/dev/null | ./scripts/tap-driver.pl --test-name="a
hci-test"
qemu-system-i386: Unknown device 'ich9-ahci' for bus 'PCIE'
Broken pipe
/home/petmay01/linaro/qemu-for-merges/tests/libqtest.c:143:
kill_qemu() detected QEMU death from signal 6 (Abort
ed) (core dumped)
Aborted (core dumped)
ERROR - too few tests run (expected 74, got 0)
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:903:
recipe for target 'check-qtest-i386' failed

(all the builds that are just incremental without the 'make clean'
worked ok). Any idea what's happened here?

thanks
-- PMM
