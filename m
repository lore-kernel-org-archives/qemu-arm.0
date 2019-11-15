Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp7046484wrr;
        Fri, 15 Nov 2019 08:56:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJyaNHO8ApELwcW+reKfp6YN4DxWRbKwS9TZXIyzBbtlpnbGBV+QxjjqykeYV1XMuG5Unt
X-Received: by 2002:ac8:384a:: with SMTP id r10mr15243502qtb.261.1573836982005;
        Fri, 15 Nov 2019 08:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573836981; cv=none;
        d=google.com; s=arc-20160816;
        b=JZHip4IRzkxMCpVwT4er9JyrzsEeCDoaolk3NsQevGvoB54UdCEAy5qQ45hj3DmmPR
         DC1TTPZZ6suYH1Eh9tn8/kBqYIXW58Ah2eTwiYZlxGEKocNuyCAfD/7U5FwwXgOzf6fQ
         Np4nBZXwZhSrB8isrZJAIrpCuoo4MUIAbIV0QW2Cswhikw+KKw1W2Z4qxXgoHlQmIIga
         qwm4zv0WdYNTfHDSnDC7K1r8u742uwYJ/sYcEdrBnUNVIWuYby5qx2dXFu+FYgDN3EL4
         kbzFK7DYx99OWb7/ytPCCRpHxIvkyudVzoX/9hRXvn826Un5nVK9PKv73S4tcXVmMuyW
         Z8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8rQd9wkOT3z4gv2iSrFoVz4BoDXIKpVxdcmv0n2/Gps=;
        b=nHYEiQFq9YHkcCQnI/H7HwT1k/IxRbLP8l/j/0/6ccOKsxsO7liZDqQSp3oFvXorA+
         F1hI1Z3iFuMgXDI0MKOiCQJTe80Fx1p+hQcEO67YatjI2esCfy7PHeLebTy18N7wsRLj
         6GH3zC132xr+JRYCTphSAJ/t95kT/Vq5N8zvI7DJMbbJZaCp/rL3hDwYWy88KIAfSyXz
         ddTfpBkkWmO1onhKjGWeBPgHgjgVxipfKoylaaCa3RzKyzte4RNAITwzs9oWXCk4iCks
         fr28pdAkcp1LIiGuNxGSDKJzRFpEE5KNBMZiKjmh/z0e6Rag4H3urP8Mgv17VLb8EYvB
         2G3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=et1OSnZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si5667376qtk.220.2019.11.15.08.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 08:56:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=et1OSnZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVetQ-00023G-VW
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 11:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iVein-0005iR-0e
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 11:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iVeil-0005gC-QH
 for qemu-arm@nongnu.org; Fri, 15 Nov 2019 11:45:20 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iVeij-0005UO-4o; Fri, 15 Nov 2019 11:45:17 -0500
Received: by mail-lj1-x242.google.com with SMTP id q2so11398297ljg.7;
 Fri, 15 Nov 2019 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rQd9wkOT3z4gv2iSrFoVz4BoDXIKpVxdcmv0n2/Gps=;
 b=et1OSnZbVxGWfUpZao6goM/hHzoMOMqt9K+5mK1uo6gDxPgZDNUZYjk/Ag7Ee1y2EF
 TxKLvctalmd0NPDpPaNTjfQ+JuC7S/SBHs11AhzJ+yIoBZeM6IbY2SXGKRhRC9//Fb3n
 ww9c/8w6CbEKpo4ncbcU7C07ErWwT3k9IGvd6el6GutnpGMVZtOGI/Nr91dAdoUlwvXO
 WE5CX/Gkv+Ovf9G190mScsG4LKt9mcntUhfjTBOqSDlwQT8WwdUzEg6kWYlDQA0POL/k
 6jqNECGhuVQNHkQsSUgp2kwe4H0rv/fH0nhqtFxg+qoKSlGOcOq/HHnPnLTHkPz7Pch4
 4bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rQd9wkOT3z4gv2iSrFoVz4BoDXIKpVxdcmv0n2/Gps=;
 b=qGJlx5VE2RJwb9bgiSEGKn22nUu43dH3eAmlUWEIlheD3I6bwiORnJAvkYTXEcHPsl
 eKlJ+ItVyFjHaw1Qj6gyOiwKz31eyUUSOW2/LdjyX1Lvdrvukn50YzH2+MtWZ5b7Ljg3
 8ehoXW5/kIcOj779N7Ur92DkmemR+R49KvV8hoC1Y33xzsJlGugCtq7Dl7d2VlmRkm3e
 sTG7kNVO1AisLFkZl94x9WVirueJ4pw7OzJWZzKEDdT28783MhkgUpVoyCx8/jXY2+b0
 hl493a0sUTJ+IRsKfT0QCzs4Zg6Du8tzgpf734tL4116Pjuu9U6hIm0tDbvF4h9IwWLb
 GvhQ==
X-Gm-Message-State: APjAAAX1Ierbe5aq83zn3i5eW5Jxp4uJO2FhNNKqxkUP/sZf5mmlNPf1
 DmNDvumaAwwRFURs0PEmIF0Ge4Ca+umfknecHWQ=
X-Received: by 2002:a2e:9151:: with SMTP id q17mr12266979ljg.156.1573836314050; 
 Fri, 15 Nov 2019 08:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20191115154734.26449-1-edgar.iglesias@gmail.com>
 <20191115154734.26449-2-edgar.iglesias@gmail.com>
In-Reply-To: <20191115154734.26449-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Nov 2019 11:44:47 -0500
Message-ID: <CAKmqyKPdVTN97of+7=khcGpXes8gh1Wt2TTy4ipdaNU_f-ZhSQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/arm: versal: Add the CRP as unimplemented
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5erInphuZGuf

On Fri, Nov 15, 2019 at 10:50 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add the CRP as unimplemented thus avoiding bus errors when
> guests access these registers.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c         | 2 ++
>  include/hw/arm/xlnx-versal.h | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 98163eb1aa..8b3d8d85b8 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -257,6 +257,8 @@ static void versal_unimp(Versal *s)
>                          MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
> +    versal_unimp_area(s, "crp", &s->mr_ps,
> +                        MM_PMC_CRP, MM_PMC_CRP_SIZE);
>      versal_unimp_area(s, "iou-scntr", &s->mr_ps,
>                          MM_IOU_SCNTR, MM_IOU_SCNTR_SIZE);
>      versal_unimp_area(s, "iou-scntr-seucre", &s->mr_ps,
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 14405c1465..d844c4ffe4 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -119,4 +119,7 @@ typedef struct Versal {
>  #define MM_IOU_SCNTRS_SIZE          0x10000
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
> +
> +#define MM_PMC_CRP                  0xf1260000U
> +#define MM_PMC_CRP_SIZE             0x10000
>  #endif
> --
> 2.20.1
>
>
