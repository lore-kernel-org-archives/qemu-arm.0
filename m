Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp713670wrw;
        Tue, 6 Nov 2018 02:37:44 -0800 (PST)
X-Google-Smtp-Source: AJdET5fPVnPuSw20cYYHRoYU4FZOvrEAYu76+5O6CePQwW8eRaP5TpK8DmzdbnwIqtcH9w9CPtpE
X-Received: by 2002:a37:d947:: with SMTP id u68mr23708544qki.296.1541500664305;
        Tue, 06 Nov 2018 02:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541500664; cv=none;
        d=google.com; s=arc-20160816;
        b=BTb2YpBFfY6thkZ3SXgapmNVAE/BtLu8ejaoBttPd6ratRbgRu2xKBY8xaU1+oMJMl
         fBWQSlfJekX1rGquwRbl3VvppVbGyNZcSE7dkcnTlQCsAN+XBBvgE31V2oGmDZikVSSp
         AKJm4t/2wbYGUVwedks5tFbtpb2c3GIY1dkaFX3Az2LVmFo8R5PCgfqg4N6+7fmiQ4ta
         5Yx3s2hAMOkvKPaPV6H3MUFxlWUtTl5G8dcKTbH9jcPx9gkEoZZiB1/H68QEw7q6D3k3
         h1DGwkFuJU9WeTlHpffyPC1KcaP3gZ0zyk67vj8xjbKXO8eKmK1zzaPnVQsLEjy4AErU
         VL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=0AbyeiiJsB8MmbB4FIUZzFNEeNartDHNfCjTaxGhepg=;
        b=F/n+5VUxYfLe1bUoPzF5YYynghrbevNff/eV1WhSFgTasB2Jw+WDUJNUddj/yvUruW
         VABbY8tM8PxWT9XStxnSzsK5ufrEoW99xELV/5YgC8r5Lp3pSXyknrZb+LrPD/N5ndf+
         XRQdOvjwdSFMVEfego7dj3fQTD27FaOMO7IdDp//yr2pkb4nKSDKyDN5EF4cRmDN1z/H
         5hh9LQs8DHobzeEqEcoDh5SRZXZeECvqa2oMiByHMLAZBn98BuybmENkVDdkzw1/zOgl
         dJk7ST6yp1sOD/EWrV7RiA3Q8VOE8yxJGj7nAHb2YSkeXQINU/Vq8BfGGfM2lahX7Znh
         Mzng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HZWVNWa4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g30si5016840qtk.14.2018.11.06.02.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 02:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HZWVNWa4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJyjv-0005YJ-RI
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 05:37:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJyjk-0005Rx-7J
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 05:37:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJyf7-0007BZ-On
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 05:32:47 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:45194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJyf7-00074S-6y
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 05:32:45 -0500
Received: by mail-oi1-x233.google.com with SMTP id p144-v6so10234713oic.12
	for <qemu-arm@nongnu.org>; Tue, 06 Nov 2018 02:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0AbyeiiJsB8MmbB4FIUZzFNEeNartDHNfCjTaxGhepg=;
	b=HZWVNWa45ustRkADl3/NDmCiiOKlRm1G26rJQcqRIkffBgsVkF1cPAyGRTDMaEbNi7
	2hXPh5qrQ/vEDmIB6NIoDHtrWH2bdGBIx4ylNVRVhdF/5JBeSz6xbTkG8cwLtclOYyQn
	dDHDBQA/gXtAFMi+x9szt8Tlg873TGIfwKKZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0AbyeiiJsB8MmbB4FIUZzFNEeNartDHNfCjTaxGhepg=;
	b=H0vCokBkggwV8AwTiLfbZ7G+VFowXoNlcICdKlL3yomUWLxg9SKfYYZG7bkdKnVR71
	AUTn3Sy5mo7AW7KQtdWZ6rrGzLtFxB0+XYf6mgYn65f+RZcv38bjWfzkbtCB2P2dWFnm
	Nkmap+QoQWBXX5B9lcANxEq2hgF6S7bRLbeAdr39zgPipTT3BzAvWosuo2EyV9uo7uXU
	CuYeRpkEYmXHpwBQ52pcIvZIJXgE+JB9iA/XNkQLS5ycHG1/TBDrMJ82SFzGg+gHrFi2
	1kUtE65pbRLGpuZC1VD79CHd5NR8weQrXu1Moo7LKLuA0tYTgzfScep1KJIkAL+vL8pz
	HX1A==
X-Gm-Message-State: AGRZ1gKRA/h+l3BzQP3MlfLr36PrjMD1MIlKczGvgX9URILBq/yf7Q79
	sH2br6POGO1lxi2YFhiUkRLJhyZpmaXu2Md24/lmVw==
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr14186221oih.146.1541500354422; 
	Tue, 06 Nov 2018 02:32:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Tue, 6 Nov 2018 02:32:14 -0800 (PST)
In-Reply-To: <1d1c0473-cd71-c7de-9d56-072596501e4c@redhat.com>
References: <1d1c0473-cd71-c7de-9d56-072596501e4c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Nov 2018 10:32:14 +0000
Message-ID: <CAFEAcA-6hMmfQuiA-23fgzYyp7bz0yb+t-rhD0wt_h0UMH=CgQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::233
Subject: Re: [Qemu-arm] How to use the 'canon-a1100' machine?
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XxlpQm7S24VR

On 6 November 2018 at 09:40, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi,
>
> does anybody know whether the "canon-a1100" machine in QEMU is still
> usable, or rather how it can be used at all?
>
> According to
> http://lists.infradead.org/pipermail/barebox/2014-July/020327.html there
> should be support for "-serial stdio" and on
> https://lists.gnu.org/archive/html/qemu-devel/2013-10/msg02969.html
> there is a link to a firmware image ... but when I try to use it, there
> is simply no output on stdio...
>
> Is there a way this machine can still be tested in QEMU?

I have an image in my test set:
$ ~/test-images/digic/runme ./build/x86/arm-softmmu/qemu-system-arm
Switch to console [cs0]


barebox 2013.12.0-00160-g2e82c4a #507 Thu Dec 12 12:42:43 MSK 2013


Board: Canon PowerShot A1100 IS
digic-gpio c0220000.gpio: probed gpiochip-1 with base 0
cfi_flash f8000000.flash: found cfi flash at f8000000, size 4194304
malloc space: 0x00100000 -> 0x002fffff (size 2 MiB)
Open /dev/env0 No such file or directory
no valid environment found on /dev/env0. Using default environment
running /env/bin/init...
canon> /

Command line is:

${QEMU} \
  -M canon-a1100 -serial stdio -display none \
  --machine firmware="$TESTDIR"/canon-a1100-rom1.bin

filename suggests that's the same firmware image you link to?

$ md5sum ~/test-images/digic/canon-a1100-rom1.bin
66e76691cbd8b140549c878ae3849147
/home/petmay01/test-images/digic/canon-a1100-rom1.bin

thanks
-- PMM
