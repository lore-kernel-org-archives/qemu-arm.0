Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7137427wrt;
        Mon, 3 Dec 2018 10:48:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VQEF8+l1mQ7VKt7uHQHRAXxvLZ4pYnEIB6ZAQar2MYE/oEZcFFbaqQdJXv1QpvwA0r8Z7Z
X-Received: by 2002:a37:7fc6:: with SMTP id a189mr15954543qkd.12.1543862923262;
        Mon, 03 Dec 2018 10:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543862923; cv=none;
        d=google.com; s=arc-20160816;
        b=yae2JsSWG39a1rRc7Xt+25QWYRy8VR86K52xXAAt7CAa/8w/P3D/1XhNbeUD0CLs7U
         7tbb5IHCGqMx3fw16LoRMMQUqNqQq/DeUHEYsB/PlyK8w65MKJvB/PyyP+DP0+3y4m7Y
         xRRK2FISsLOn9YUg0kgY1UnET6KzxaMiHr+yq8KCPPh1OY+RlVN3IxGiRQ4AHOgqDXLD
         CHts0NDAdLbb4LIXnQZCfv8tk5ExjHF61WsQISEEDCk9qRMC5iEkmW/daG6AlkYoT5NV
         BXfrHADewEVPqiWmVtbCM0GexzE0Y1tvGZEa/tKRSaC2pi6aS3CWcJIz/mmI4dGBdbSL
         JPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IfmTHNGoAnaVw+YY/x/fhvBGeTp34SGjMCi2ry5Sga0=;
        b=fsgX2RNcBpiXVBJP7SiU/GJaFm1/sLgj0D8szfY0QjmfT2pifdIVa9xG7AHzYPkwmX
         moPdwmj5tnJsTN7C90L9WjGr2mb7TJ5Sv1ifzTmGIXw+WZntDwUj/bo6ypiJ9I24oo5Z
         UU9yFWsrOD2GLBF8+mDQZ5nJRMgSrzDQA+6OcmhbyHeY3OkfQUExyLgS+uDgr0aiGhuY
         v+YOQR/bQe8KnLSk/b1bzvkcPcmunVYJq6EjO7aI9YVDKTTbBEdc5xOxa6jzVu/134X3
         ewiv99WekUA/uEwyys6W2yVp/PZtCY5IKAZEfikHNWiFMODiJTdxWshRSnRzkvG0vOF2
         exuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UZk7fZr1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r29si1340687qtr.290.2018.12.03.10.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 10:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UZk7fZr1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTtGs-0005Aa-M3
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 13:48:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTtGf-00059G-Jp
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 13:48:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTtGe-0004Mw-TC
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 13:48:29 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gTtGe-0004Mh-OJ
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 13:48:28 -0500
Received: by mail-oi1-x242.google.com with SMTP id i6so11886046oia.6
	for <qemu-arm@nongnu.org>; Mon, 03 Dec 2018 10:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IfmTHNGoAnaVw+YY/x/fhvBGeTp34SGjMCi2ry5Sga0=;
	b=UZk7fZr1AeqTEIoqdlhld6crJEAswm0BqCa9bn0y43m6XcARbWtnbTldL4MQrmRkuD
	H6D2yuqp4Oi1ZBUxJ0PlwNI83L5jjc//635f/H6OwzVlmrNY01G5fmJD7b4w2bJ66gR4
	PRB/z++3jZtwp9oJFZUq+8oHXqTIl3U84c5R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IfmTHNGoAnaVw+YY/x/fhvBGeTp34SGjMCi2ry5Sga0=;
	b=Lbq6uiwiviIdQpb06JiPr3NSIf8cJDsFKeIz6KZ9z1JIFU3jFQ/ExZY+06IgJy4OFV
	I47ai+B4TZIw56RfZWX4IBJ/EvSgMOSc/kJrPpePQfKTv+FfuR3ZWer99xE3rDeC4Pk3
	HqwPYya+azGMN83KgI0yL11HD6lMQKDRCSpQDxLse2b1fHFFqz45yfv57EAifbr7XVbj
	vrbaKlI7tnJs93gFvPhzYhaUncg/e2LtdD3EIkZn5SoIDFM2361T418w4ZCYNyQ7fZ4X
	LP23tF4vyiJaRUMg0Qw1VUbD8ikZnuic+L/ff2DuR41CBILpZz28BYVAMRXUo1MQw/+n
	GpkA==
X-Gm-Message-State: AA+aEWZnflFu6uUzC0dWhfuq7stzqk/FCGM+BYqe47bMLO6QM7fb0v9/
	y12b/4jm6mv5yFkDjQ7kayloxF67g/AhJTWgqmz4xg==
X-Received: by 2002:aca:ed92:: with SMTP id l140mr9970947oih.112.1543862907868;
	Mon, 03 Dec 2018 10:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
In-Reply-To: <20181129163655.20370-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Dec 2018 18:48:14 +0000
Message-ID: <CAFEAcA8RniYSkvAv5zLMzyRbyekuE47ZQ7Rrv-7joO5bqmhm7A@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v1 0/4] hw/arm: versal: Correct number of
 IRQs in GIC setup
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, mbilal <muhammad_bilal@mentor.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nugofmwLkfJX

On Thu, 29 Nov 2018 at 16:36, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> The Versal GIC has 192 IRQs not 256 as we previously had setup.
> This series fixes the setup and moves the virtio-mmio nodes
> to use other reserved interrupts.
>
> Since we don't have 32 reserved lines, we also reduce the number of
> virtio-mmio regions to 8 (we do have some more lines free but let's
> leave some for future use).
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (4):
>   hw/arm: versal: Remove bogus virtio-mmio creation
>   hw/arm: versal: Reduce number of virtio-mmio instances
>   hw/arm: versal: Use IRQs 111 - 118 for virtio-mmio
>   hw/arm: versal: Correct the nr of IRQs to 192

Applied to target-arm.next for 4.0, thanks.

-- PMM
