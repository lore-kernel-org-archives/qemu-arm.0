Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1769504lfm;
        Thu, 23 Apr 2020 04:21:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypIn7XSPRG4IouAwFtmDDZpA/TRgclFqzSfdD41wzP8wypNL+E5UFW2QqKfoO4RNOyZXVJ0c
X-Received: by 2002:ae9:e214:: with SMTP id c20mr3028938qkc.107.1587640895977;
        Thu, 23 Apr 2020 04:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587640895; cv=none;
        d=google.com; s=arc-20160816;
        b=j6QbTCtnDEAvO4WesalHOB4UKcB8+bVc5EsNCQOtoYPBDYRmhj3nJLoAAA3HVc/jIY
         H+04y688nMoxQ2+6iMYL5eU5M6hBjPeP9AT5pNIA+kSDjApto+RjKYIffa8bTuqNBnz+
         LntTATFCrJE6T1FNgcxjbREfwSgwzYoHFuzygERNP3pznQzAzOhk9cSfl09fXcs72ps1
         ZAfJvlO/rdIshcn4UdlIC5NLjDVUgutKJTUi/GpiU+hzyGxRVuYSc8ps0+ly4tUiteOv
         QwmkrvAMuLdpRrw/VcYNQ0aIkPo0Dov+AimdJmukEK7v3nLuJVnGpsEH75iuKL9aWYdF
         pONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xec1ui4GvP2fhxgqjd25Oql+zZmFYDTp/PBkgXn5/bQ=;
        b=kMO/DYEMg/b9f+dZ0IwteozVMHSMeLI/FYQ+DK03nxTexrmNAEzJNtqDtX2gKwB+ny
         tTuf43e7cV3KWWkdUrN+mOhl+h4GHLz1WPMC9dOBZLLmRkZMGcqrDbDskkgKzYjhdPhK
         8IXPFcQRh0Aeo10JfzreA7ICR8wq/H755dvXXtm7U+DLHaExiXMf1zpahABmsdCuKIfr
         6OtwLaBSb/NgdDEglocYaD0Ub0SJLzEIpJc1dSMkhuuEIWQB3qvWyKXTtI1b3vFCUWnx
         Z2u+ZS4Xd+wDbKdcGFBPld/cu+LCYFi1hHHKyUErxtHfL12D84GrgKoaeYnWmd8OapRM
         6MWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfCXHUR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17si1401825qvy.141.2020.04.23.04.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 04:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QfCXHUR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRZvD-00025U-Ec
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 07:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRZv4-00023q-CF
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRZv3-0004hF-Sv
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:21:26 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRZv3-0004f6-7b
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 07:21:25 -0400
Received: by mail-ot1-x342.google.com with SMTP id m18so5339866otq.9
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2020 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xec1ui4GvP2fhxgqjd25Oql+zZmFYDTp/PBkgXn5/bQ=;
 b=QfCXHUR0R7x55t5CbbzJcgozbiXkL0dcS2OmpdLuU/8OZZwIR5I0DbTzp8etOeNLJs
 MmWQC7xLgwFFfqanRHOwUAdArVneeFifL+CVzGyHTIF5CU4cCqfgxGLSRDYhL3FEYfb6
 bVqKNhN+vMpLwQhSN9pjz0OeHkHChMgSCojmoBE8j0TRifsVXmvMMCBac4TOg8iHBdRR
 Q6CqCXDrx8phs7Q5AzYfM+W7TXF4CxLV1u2/8T4CSGRCMhMDyhMZLW627QEn/qEJtF1H
 q2speV1DUaHWk6bPO6z3p+fOEb7AegHiSS1XOS670/rnzDYh5scjV05KzIQJyj+WMNXp
 UkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xec1ui4GvP2fhxgqjd25Oql+zZmFYDTp/PBkgXn5/bQ=;
 b=bVZyxncFOD7B2GXIwnbJ0Dc5rWQEEVCWnGea2uzNfa86ZY4UeugiGALHm3AMR8HmZj
 II0QFY9OVrH+pBp61EvpScjb+xgn6B0i10N0E9hcnABSbhXSZ9rzhE7qIVwnWQM557pf
 sYbe2ZJ3nVlIIdHeljyaHC27Jr+jFJSfPX6rTdXy+LjT1aUFHCE770DHY7NWfneMzdfF
 FgoQttD1YFV0GP+61sMvXxuEwTul44HMS4qfq2MoyXhzRYLx+wRT+PEtklysA78jxvIp
 OkTi8CVPvsJrZv5HsUzmM5lBB7sYccJlGjE/s7Y1ATiddqhX7cFKMGjVwcBEk5hnTQBy
 KSgQ==
X-Gm-Message-State: AGi0PuY2H6aXroZ9r9tsXLWHlOF+CLqgQ+WeZdiFuDmR/Rkd87JRT+Kf
 61lfR+CG2xRxVIVvHkOOha8G74DHlL68a+jabhNJGg==
X-Received: by 2002:aca:dc56:: with SMTP id t83mr2432434oig.48.1587640883158; 
 Thu, 23 Apr 2020 04:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200419162727.19148-1-edgar.iglesias@gmail.com>
 <20200419162727.19148-4-edgar.iglesias@gmail.com>
In-Reply-To: <20200419162727.19148-4-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2020 12:21:11 +0100
Message-ID: <CAFEAcA8D2HSPg8-ZvFBocmz+QRXTzhJcjDG21PCk7+_N7+2o1g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/arm: xlnx-zcu102: Disable unsupported FDT
 firmware nodes
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oiKunn3naWQs

On Sun, 19 Apr 2020 at 17:27, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Disable unsupported FDT firmware nodes if a user passes us
> a DTB with nodes enabled that the machine cannot support
> due to lack of EL3 or EL2 support.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/xlnx-zcu102.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> +static void zcu102_modify_dtb(const struct arm_boot_info *binfo, void *fdt)
> +{
> +    XlnxZCU102 *s = container_of(binfo, XlnxZCU102, binfo);
> +    bool method_is_hvc;
> +    char **node_path;
> +    const char *r;
> +    int prop_len;
> +    int i;
> +
> +    /* If EL3 is enabled, we keep all firmware nodes active.  */
> +    if (!s->secure) {
> +        node_path = qemu_fdt_node_path(fdt, NULL,
> +                                       (char *)"xlnx,zynqmp-firmware",
> +                                       &error_fatal);

Why do we need the 'char *' cast ?

thanks
-- PMM
