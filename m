Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1667318wrd;
        Sun, 23 Sep 2018 09:16:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62KMmwurlN/tVyeogK7tFGBa7ImGkbUJZ7LRexDliURbpJX92+dNIfldGzVrf8YcuMnaAar
X-Received: by 2002:a0c:d067:: with SMTP id d36-v6mr4351728qvh.216.1537719410621;
        Sun, 23 Sep 2018 09:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537719410; cv=none;
        d=google.com; s=arc-20160816;
        b=OxtycOMnCG3lgY+vchCQx0jPvoixG1kPnnuVEelboWgfCAKsUc+MHWSMShQTHHElSX
         sffTEQwkSGlroQR/6bRVr8HAtV5ykOGPIoXamEix7bcu3AQhcT9c+8ikGksqSY6AlLM9
         XlygR6S9YTxCcamBp7cwpg5vwMRePgDcYySPjQ7oUJKery49OEzn0ZH2xMehBWMKaVul
         Mjriekd7PB6nGJKkqbAJ3FC9p+7mZnNhcXFf4DnAklX64O1IlA1NQwJSntBaV5hEdCZ0
         k8yjlxYfYEw6uLD5eIv1BE+2tMT0X29K31ZqBQjIXDAvv09eUANmtmLiSESh117jupDH
         LT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=GIrR3Hh2wZ0Bc7o+yHmNzR9idcJU5jNiMYgTMyhfxmo=;
        b=l3iJiX5VxlQuifA5d097jE3U1GSXQjF5ZRW4wSTsnKKdjQ+tNIYbzP1eCUxpD9r9Ci
         Xq9OWHpe82QuVUaJiFlUvvLMDPEqjV5jwVEcciOQ3Ann1yAtPtiqyLetedPbF8lR7yCh
         /Fijfel1r/oumX60DIvlivdtZKimLJ5Ai6FQb91UCWEpJWL43j0OSYDSepXwpo9P5LI6
         rEcE4SEP1qIielAlS73VJRO+0Avfwkc4ucWOz5aGiu12Sq/A58R0jmVgROMDtaKZmhqw
         egaJDq/fZqYgRB/E81Xz2zHfSM3Qny6m0gOADFxAjIIZh7KuWayP4kODIIaChYyi9PLQ
         raYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rkt5cQgv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2-v6si416274qvp.156.2018.09.23.09.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Sep 2018 09:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rkt5cQgv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g473y-0005lp-05
	for alex.bennee@linaro.org; Sun, 23 Sep 2018 12:16:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g473m-0005kU-AW
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g473k-00019q-BC
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:16:38 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g473i-00018A-BY
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 12:16:34 -0400
Received: by mail-oi0-x243.google.com with SMTP id k64-v6so747143oia.13
	for <qemu-arm@nongnu.org>; Sun, 23 Sep 2018 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GIrR3Hh2wZ0Bc7o+yHmNzR9idcJU5jNiMYgTMyhfxmo=;
	b=Rkt5cQgvppg4nVl4OoKGarhXcrfyaSYXpvWNll0XiVsriEUlxSxCCGsE6E8fAsOkfW
	iiIG1Dljf/SVvJYzJ3oaD7qPg7d6UGs0AWWYmVOo/TLkVXol8cMRNGbmXSoOfNQWHJLS
	7mBAwadwMcB7VNWntXh+czAiuU5SdW0duY8eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GIrR3Hh2wZ0Bc7o+yHmNzR9idcJU5jNiMYgTMyhfxmo=;
	b=ghtTL9bEC2ieOZb4Rv8wQnufwkfBdRc71wTVmjNpJPnjSaNfPdtKIiGGuzVgxVy0U+
	b8W8Tw9HwuASoxHarpDximnWvpKEv9pZ9RGjcN9fnWfeOHfXGGMxlt/zpyUbtMmCw53i
	uEyboAi45hYiumv5CP4I0Hal9eQtaRkYlN8mgZ6ruQTSPpxMghoyBcsCDlBMe9ID7Afv
	QfpWbEbMPf3qX7uezIvuekfa+XRBWmJkfrpKpvkv1erfpoqop4L05YW48LS0ZL/tmQbc
	qsv6kmGiFiFpbhFPecNu7i8GMkHxDgRXbCyxK4xjL2pAi5eHSrhEGZM/N6Qn0yPDC3Vg
	8/kg==
X-Gm-Message-State: APzg51Abr3wlpSThW1Oy/NL12xOnx//G2+N8JDL1jAZZx4YSzHLPJPdb
	z0ptbpyfi8UGTkn8hbU9Ab1w69tKjVz5BqFtYSmXJw==
X-Received: by 2002:aca:3bc2:: with SMTP id
	i185-v6mr3646551oia.156.1537719392985; 
	Sun, 23 Sep 2018 09:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
	<CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
	<9DF52029-EEB1-4ECA-B1B0-0F7B1ACAE83A@gmail.com>
In-Reply-To: <9DF52029-EEB1-4ECA-B1B0-0F7B1ACAE83A@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 23 Sep 2018 17:16:21 +0100
Message-ID: <CAFEAcA9KwO=U99wKi-7pMJB5wwUAs1yEX98XR=RY0YTPZSvXKg@mail.gmail.com>
To: karthi mohanraj <karthimohanraj.in@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] Arm Cortex A-72 Emulator not able to configure
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I9OD3FakesY4

On Sun, 23 Sep 2018 at 17:02, karthi mohanraj
<karthimohanraj.in@gmail.com> wrote:
>
> Hi Peter,
>
> I have tried the blog post which you shared but i=E2=80=99m getting some =
error as Virt type not supported.
>
> qemu-system-arm -M virt -m 1024 -cpu cortex-a53   -kernel installer-linux=
   -initrd installer-initrd.gz   -drive if=3Dnone,file=3Dhda.qcow2,format=
=3Dqcow2,id=3Dhd   -device virtio-blk-pci,drive=3Dhd   -netdev user,id=3Dmy=
net   -device virtio-net-pci,netdev=3Dmynet   -nographic -no-reboot
>
> (process:3246): GLib-WARNING **: gmem.c:483: custom memory allocation vta=
ble not supported
> qemu-system-arm: mach-virt: CPU cortex-a53 not supported

The blog post's command lines use qemu-system-aarch64. You're
using qemu-system-arm, which is for 32-bit guest CPUs.
Use the command lines it tells you to and you should have
better success...

thanks
-- PMM
