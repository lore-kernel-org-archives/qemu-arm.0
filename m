Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp843117wrq;
        Wed, 20 Jun 2018 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKzk99cZFEuCIqivKNsGPSjJ7p91aIP2SACIuPm7e/lpx3++H7qe5azMI0avkenlRk0Q62J
X-Received: by 2002:ac8:70c9:: with SMTP id g9-v6mr19356205qtp.376.1529505404261;
        Wed, 20 Jun 2018 07:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529505404; cv=none;
        d=google.com; s=arc-20160816;
        b=ohnVTATBqrxMyR6epIWFCQxU5GQCspV70cnIIYyCill81ShxI6MQUmCz6kaRTXsIwf
         UKDWwES3bzb70SN8qXAYLDRI+VdhkDO4CzyAXinhhqYN2wztdTlVcxr/EAKjyYjMnkM3
         ULj64G4umcXGNKH2J0SZ8n/4U+qRuznDKd6MaCKGmdA0KotpPdfuiAvCo5WE2T1dte6B
         gZQJxBZ+JUyvM96CuGIaO86jeAOZv/Dn7IeocDDhzpaE51k8VlnG8E1C6un6fc+5UQ+T
         THlM0IyFWwl5rRpHUzc5LBS+9Bwm12g1CyDKo+340UWyhpbsJOMo6MV7g9DZQW8ErnGu
         SWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=U1U64tyfYPeVAyfEIA5vQj70sXyiR50jZLLb8ckSFGE=;
        b=b5w0XbhGNSjC4Bz2jK7m5npEDb1g1k+LTc2SM3hWu/UkXae7F/8gCirpe+2ErR7CLE
         WLith2XH2QQpgb8sij2WWdkIEzaCBuNmKe2TT1LAOqPgSlhf9CJaW8vi/YtTKUaq0o37
         77Fot2EP2vFPV2wkLspblS024tFTXA7dF3l0erWEbvsc2Koflo1NFdpiVp6SeB9h17Jg
         NPWpkcJggnYRNNOfUcveWzbEhdJV75aCKxXIonfr5wqjk5ysyvrHz/nWFdi/JftGCcRx
         je6SLKZqdhj4CS9wj1fiutqa80YIHWBSUK/Gi64UWo1V07ZegOLLxnR19Cvhz7gOLhjB
         d0TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kp17HkaR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g31-v6si416516qte.75.2018.06.20.07.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 07:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kp17HkaR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVeDz-0001u4-IW
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 10:36:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVeDm-0001sA-Ia
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVeDl-00009C-6Z
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:36:30 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:45963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVeDl-00008d-17
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 10:36:29 -0400
Received: by mail-oi0-x244.google.com with SMTP id 188-v6so3189100oid.12
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U1U64tyfYPeVAyfEIA5vQj70sXyiR50jZLLb8ckSFGE=;
	b=Kp17HkaRZx94IPJXqsHwU3cA6CN5jygQFpqwKinyl/RZ7CwB7o3oUN1OMA/C+mAPAG
	Fae71jNQQYixcGo0xjh2qlg8bKl8X/T7+vpRkMqFV3zygL5QEzcDpjQkifQOJ9nXghMn
	6YQDxE9vWih/sUbMK2farxxzVM7DDHXN6mBAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U1U64tyfYPeVAyfEIA5vQj70sXyiR50jZLLb8ckSFGE=;
	b=P5cw6QHujaj5OMXdW/n0SX0eHoHKWHqJCtQZzSlQUm8uZH/0YWi6uSAqR4RAWCBDp6
	bMDTNGY6FyXXE3jxXMCimnwJT0OurfOCUYzP1wYibUyWcQQtWuVwOw9aN2FW4/k97xmY
	hDM9IjMicEHLpE8vzrxVUZ+JVWIJ56+lBnOclTLJms8R2WPND61tiIrfPQFx+lrwWapi
	/thBS+/t32/s4Vr2ouOxLBAeWlGQ/8ceYcVw8JbyLs1sIE4hcpnnfEt1CHtWT8Jpv77T
	uF4H2hAA2sEHfDK7dsd/OgA15WhHsvI73QeT6tDiUDTZQ9Airk+MiKXiorzgR6y8xqn1
	c+5w==
X-Gm-Message-State: APt69E3YwGgxLSchxHzzzztEfDv45T0oos9mXigsPxlKuTP8cVT9uUTe
	CtLMvwTRgXjC9YhQ+mb9X0hM7e74zbxzl7076seUGA==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr12334281oib.252.1529505388316; 
	Wed, 20 Jun 2018 07:36:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 07:36:07
	-0700 (PDT)
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 15:36:07 +0100
Message-ID: <CAFEAcA8sAo6MfcMNw9cqEJWyzR1ig8RyP6pVuMZ+EnU47aturQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 00/11] KVM/ARM: virt-3.0: Multiple
 redistributor regions and 256MB ECAM region
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Laszlo Ersek <lersek@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DgSM5KjoeFqs

On 15 June 2018 at 15:28, Eric Auger <eric.auger@redhat.com> wrote:
> This series increases the number of vcpus usable in accelerated mode
> along with GICv3 and allows up to 256 PCIe busses.
>
> It is a combination of 2 series:
> [1] [RFC v3 0/8] KVM/ARM: Relax the max 123 vcpus limitation along
>     with KVM GICv3
> [2] [PATCH 0/2] ARM virt: Support up to 256 PCIe buses
>
> Both add features to the new 3.0 virt machine model.

Applied to target-arm.next, thanks.

-- PMM
