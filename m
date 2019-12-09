Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4706227lff;
        Mon, 9 Dec 2019 09:51:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+fp28fE4fW3fTh/igjtwWtd+EZRavYqLI+m0BoyAzOrAcKTzn6h5Blgrp9N8BLdciTQ33
X-Received: by 2002:a05:620a:139b:: with SMTP id k27mr28536042qki.112.1575913894553;
        Mon, 09 Dec 2019 09:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575913894; cv=none;
        d=google.com; s=arc-20160816;
        b=xShdDcVeOrux+pl/RlPWsXajAdtRAHjpoujrTNEfjkWK+Dc2srGcZUUsL5DHYUZRIk
         izZq0bINp7Ujoh1TEyT0z1pYYV2ECGExhpm2E8Pi+gWcoYYk6xxPjpUXCZCFqUt3K2LC
         TAE9tkfl2/0QbyK0Utk0Ne8UU8D+h4X6OgE1Zfh3QoohtAkPl/fk67FkY3di4rT3WITe
         35vrbjQz3LdgRn21OzECY/aSVOV+Tf/14/gwTA3NvBBW61KW343n7f4nRZOCNWF/V/a+
         qchvhuQOqAjWWykK4oYLrrjT8d2256ncYXi/i5Di3XGGnB4jP5Wsi67HUtYKQk7XfJED
         xKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OypWHPqB8CZ/V92Fqh1GsT7znQ/C5e/e4lOcHCGijus=;
        b=Fh0Atj4vCf+Uh+1oKvb+qkOItTxi+H0enM7COZgU6Xce97cC/4ZEUk39xefG3p/kG+
         q9m9Tx7ocdsdXXlQrbUJxv0rzfTXbm7POUMoYxq6tG2YWAOOa2pdjZ67MlfQhQKzYZCp
         AqYJGfHc4cZAFhGG68wIZ3xA8VEckqVdDPYgzRTPQ6TxQvsRB16aC4WYuUXU9vhG6TX3
         c/oBJA2vQFMIQC3Yh759gohNIdHTvg3awdMCQwAhiT9sWXv8YWweCMIDOoUyMaRTFPWS
         g1S73N4r80tbIVUFvh+rVm94dWV9RvMsAzeTggF6Tsqthi+FdQ9ru1X7vc1gtfUittzT
         YpNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YDX4QcWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i129si317005qkc.67.2019.12.09.09.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 09:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YDX4QcWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieNC1-0001CY-Rq
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 12:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieNBs-00019U-6e
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieNBr-0002vr-4X
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:51:24 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41761)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieNBq-0002vS-TZ
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:51:23 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so12936963otc.8
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2019 09:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OypWHPqB8CZ/V92Fqh1GsT7znQ/C5e/e4lOcHCGijus=;
 b=YDX4QcWfylmrzS7SMTCTNhfGGptDYdF8ojmqUi+p7bf13wwkG+6SrCnjeIRZDWtSN0
 OZ62dFYEg7wy4qHyvw9F4GHEDGhfh1pZURMWby4OTYCpJ9QhN+/OB2w71eI/I+v4a9A/
 shMNl3Hn8HQDsrqNHlIcKWzBIf9sqvE7ipXGv/lhsNiGEsftc/1hEMgu4SiTnSY1STXd
 2ENGgPdzefSR2Vw2tzxOA9jtdCCtKUCymfLLDPUIFtdtk8cPx+2UZ47AdiNhFtfejTg+
 pZF3WXMyjF0fIkuQSNvABQD3zpZfrVQLR1EPL/XxR0ODRd6/EKc1geP5oH2ke+eyMr3R
 Jrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OypWHPqB8CZ/V92Fqh1GsT7znQ/C5e/e4lOcHCGijus=;
 b=k8zulqZjHe/d7x2mmO5uDKy7rjU3TkUNQoCUMzp+qAV9e3IcYqqZ965rXK7TCCONTf
 q8c25vZPepHokDsPbWZ7KfUgVHSNqRXcIwn+Qe+0bBPK6VBRtt+I/YpaBHcjA68NOqQB
 3vbZN0OAdqK6uD+CwmnIPd7h+Fq/5O041S4mVdklNbpmJqnt71z7b6Lnb4YjWxXnkJqL
 YRPtJckQ2wZiy63K41Cc9YWvwAmzMOeQScHaRZXRJFsjTXzgTq5FgakdfX+f1Spx5gcs
 wj09ecY0jB+4oOm/eedm8lUwtFNd9I6dr51JpRXB9yP07wflq//s9ipltI7cFObMTNUA
 nCTw==
X-Gm-Message-State: APjAAAUghapC3Z33MvGMk7s4wvRB25XTtzbrMrDGNwrPhyLHFS3TQHu6
 TrU53GV2IMTxPa6ZXiyBToCNujWujNST5jdXTYZUhA==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr22868775otq.135.1575913881931; 
 Mon, 09 Dec 2019 09:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20191209063719.23086-1-guoheyi@huawei.com>
In-Reply-To: <20191209063719.23086-1-guoheyi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2019 17:51:10 +0000
Message-ID: <CAFEAcA_cP1pW=WC=0M7S37TRi_4uwaA_kQRTJ_xRkqbq48eLTg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] arm/acpi: simplify aml code and enable SHPC
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JMh4YlWYW3BO

On Mon, 9 Dec 2019 at 06:38, Heyi Guo <guoheyi@huawei.com> wrote:
>
> After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
> also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
> enable SHPC native hot plug.
>
> Igor also spotted the store operation outside of bit and/or is not necessary, so
> simply the code at first.
>
> v6:
> - Fix "make check" errors by updating tests/data/acpi/virt/DSDT*.
>
> v5:
> - Refine commit message of patch 1/2
>
> v4:
> - Improve the code indention.
>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>

Thanks, applied to target-arm.next. (it's a bit awkward that acpi
table updates require also updating a bunch of binary test files,
but I suppose trying to make the golden-reference be some textual
format would be not very feasible.)

thanks
-- PMM
