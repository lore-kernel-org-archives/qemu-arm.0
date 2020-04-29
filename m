Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp247278lfm;
        Wed, 29 Apr 2020 00:30:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKMJgk5qv/8G5o0gK6nviMo98coi5xboVpys2nUM4TlAkQWRsZOXjQQRJ7FntA0wLFhpMza
X-Received: by 2002:a05:620a:20db:: with SMTP id f27mr31407258qka.457.1588145406055;
        Wed, 29 Apr 2020 00:30:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x12si11340512qkx.356.2020.04.29.00.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 00:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wQBkJ2+S;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jThAT-0005tY-8g
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 03:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jTh54-0004r1-ET
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 03:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1jTh4F-0005ac-C7
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 03:24:30 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1jTh4E-0005aO-KV; Wed, 29 Apr 2020 03:23:39 -0400
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 332E296EF0;
 Wed, 29 Apr 2020 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1588145014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMd+4wIDhy4VuieueBBhVTrXprknNqYism8E1D6RAps=;
 b=wQBkJ2+SZAa3PqcPyAHgYoUmp3zySTJBmJ4rc9BmMG0usdP68Mz6poW9E2sN5x317khjVz
 +lOpwJrQC0lPq6qPjhXLrkeO9ScxaUt71f/moGatZXCgvM1IsG8KYoDcdHa4Bqte1X7LF7
 Urnkb28b9VgQI2/K69caCthSkHWQqps=
Subject: Re: [PATCH v1 01/11] hw/arm: versal: Remove inclusion of
 arm_gicv3_common.h
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200427181649.26851-1-edgar.iglesias@gmail.com>
 <20200427181649.26851-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <14ed00d6-6a40-bcfa-0c06-984016adff29@greensocs.com>
Date: Wed, 29 Apr 2020 09:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427181649.26851-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1588145015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMd+4wIDhy4VuieueBBhVTrXprknNqYism8E1D6RAps=;
 b=Fg0N6L9hikB2+glswoO9SSrnx/SepaSrg9WRgLrz+vQ+8ErXeKsQUkQPHKyiT80W2naR3D
 4w/Fb5DkGbaq6Ly9RRbsaMQXi72eR+36DMlOhtUzhY9RXQWuWqtG+FZBbzulTNaj5+2gml
 40bUMNTS27GBSje8rgC/dDxGybQhi7s=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1588145015; a=rsa-sha256; cv=none;
 b=SxtpqkkfFMSeuDtZIwowVIRFa4rYTjGEDXeoQ4Ds6Dn4lpu7AUtxRCgcptF0Kx9APVGsWn
 VUWV0icpcEZUiHVVcgWoVlRdt5GXn8ZwEWwKb0HxLiAvxrbNvKfSzqDWhUyo6eEUQuoHZs
 3gaep07zww+IXnQS40sZM7GGbHK9sP0=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 03:23:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 5.135.226.135
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zlH71AyRotB

On 4/27/20 8:16 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Remove inclusion of arm_gicv3_common.h, this already gets
> included via xlnx-versal.h.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/xlnx-versal.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 94460f2343..c73b2fe755 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -20,7 +20,6 @@
>  #include "hw/arm/boot.h"
>  #include "kvm_arm.h"
>  #include "hw/misc/unimp.h"
> -#include "hw/intc/arm_gicv3_common.h"
>  #include "hw/arm/xlnx-versal.h"
>  #include "hw/char/pl011.h"
>  
> 
