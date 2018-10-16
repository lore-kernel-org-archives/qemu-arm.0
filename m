Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5709185wrt;
        Tue, 16 Oct 2018 03:58:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV6265sMl9GgWSK3r+LrOdpLrfUFPSd89ptWvFHBPMwp4Nx9F0bgw0HbxpMpwIIMx1VwOszSa
X-Received: by 2002:a0c:ee8a:: with SMTP id u10mr13080933qvr.95.1539687488610;
        Tue, 16 Oct 2018 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539687488; cv=none;
        d=google.com; s=arc-20160816;
        b=nHj9GmQGVcQNd8hDdMp9muvzY1w9JwVFVPP6OyBe2ij6ze1fDHXWYYblDKW3n90lGV
         EDCmBvudU4qCkpDvZiOiuzom6WuOllabHVftMe3Fa8H9nuCoGv5E8LMTIleA4lTFFurA
         G9aS73oLm9NT8ryDVa5v9PyOcfvPE0o5w11DA90VOTHQgRqLz9PvUEg/v5Xyx6D9bJ0a
         h+ig8knXuH7kZLRMDEgbRxFUcOxzPHWilfVkR30jaxDACVlkvjIhPSzKMIpYy68XTfy3
         svpVMdqSeW1uMVFdCsnJpIwEHI/OFH+rC1uyAnXqx2iLNz2S/IJ8+sYcRpY0WAs8fnBN
         p7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=6fNQlT7a7uh/drHg7yE/0K0I4l0ifSOqfiZXxWYhEZs=;
        b=xyu9ELl//XAp8fwW3Oe0AKgYF4Euim1atZxLwAeaBj397K/0Japxv4Wzp8q6t/P6wZ
         fXHVeATa5rMml/l9ZL1gassmfnmsN2F+wt+uP7SpMLCB7QcSPZvE05osM+wHa4i7Zmqm
         0U5XyfVCoSujg+es+nbn3MbjFAkt8m1A71Cnl0PfeGVYJP3J8xzsiDLaO4ndyijcXr0/
         xm9PHwdbB7eAqTUNfxzIRfJBhL0dwaVUPSt7MJ5mlGusGf4CvTpEswcr23YZmySIALTT
         +A0Jlpo+Zz6E/FQkHXKOiqSoKujoJi+tgfFgJ5h3L1AxE9CwPYjJNeDIuBMK/kVSZ5+X
         1vzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YYAZAzwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c23-v6si1893262qtn.327.2018.10.16.03.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 03:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YYAZAzwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCN3A-000524-2k
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 06:58:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCN2y-0004zj-TO
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCN2y-0006zM-1x
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:57:56 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCN2x-0006yK-QP
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:57:55 -0400
Received: by mail-oi1-x241.google.com with SMTP id y81-v6so17646520oia.6
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6fNQlT7a7uh/drHg7yE/0K0I4l0ifSOqfiZXxWYhEZs=;
	b=YYAZAzwCY6xD1jIsU04ZMHJi/poVonhRTtL+Iv7Q64NGwB3Nhuv9b7d2OgQV5c9M5D
	+27hFeL0o1Uk+VZ1ROe4BvIdvr2G8zOkymKt9UZF4tinSrHwim+SmUOIPFkz9vTeS9ip
	ILFGn5iJBFIZW4+YdoU/fuP8/DDwkEmK+vGWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6fNQlT7a7uh/drHg7yE/0K0I4l0ifSOqfiZXxWYhEZs=;
	b=KlA1qXoiUUBaxcRQD2dXh3PjIct61Gs6nyFrzQNVsEGJ1174hgmp+IBBw2tIpLTUCZ
	C7HggbrusE5JmwybYx7oo4azfO2JJPjejV1+U67MGL0hCvwyb8kRjNuW+DIHBFwPQtVb
	HFv6CQOGSV2mZlpKuX1F3bNYIQPCsgt+mh357+ntXgUM3P3ObkkMBXXUNKE5H4Jv50Ck
	GWisSz8q5uKZ/haEQ8inFFv1uJ7TkfInOne5PSTvFYAgL1prFZU6WNZrIAPnv1Nko3aL
	qtZAUPE7+8IpKp1T8pWyG3NDxm+0DNs2nWIVek5evfJ+f8pBmxF2mxjOMbgsFWuwZ4jI
	qSCw==
X-Gm-Message-State: ABuFfognhLnd/uIqiMCDkxUq8xjCaZ1wQ7DLRSXatoHQH2wCGIv413BK
	BSr4EafulkcLUmvNETECWAhAn9mV48gcI8rWb4dRug==
X-Received: by 2002:aca:53c4:: with SMTP id
	h187-v6mr10480091oib.48.1539687474592; 
	Tue, 16 Oct 2018 03:57:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 03:57:34
	-0700 (PDT)
In-Reply-To: <20181011035026.23517-1-xypron.glpk@gmx.de>
References: <20181010185445.10290-1-xypron.glpk@gmx.de>
	<20181011035026.23517-1-xypron.glpk@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 11:57:34 +0100
Message-ID: <CAFEAcA-95cCzjw6opxqCPvQjNOdRBh+ive3+G-SE-04c3qKF5Q@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2 1/1] hw/arm/virt: provide a model property
 in the fdt
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HbgIo5xEO8Nf

On 11 October 2018 at 04:50, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> According to the "Devicetree Specification, Release v0.2" 'model' is a
> required property of the root node.
>
> Some software like the Debian flash-kernel package rely on this property
> to identify boards.
>
> The patch sets the model property to 'qemu,virt'.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> v2
>         use the recommended format of the model property
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 281ddcdf6e..abe366895a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -200,6 +200,7 @@ static void create_fdt(VirtMachineState *vms)
>      vms->fdt = fdt;
>
>      /* Header */
> +    qemu_fdt_setprop_string(fdt, "/", "model", "qemu,virt");
>      qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);

The spec says "a string that uniquely identifies the model of the system
board". So should we be using "virt" for everything, or should we use
"virt-2.10", "virt-2.11", "virt-2.12", etc ?

thanks
-- PMM
