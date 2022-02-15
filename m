Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp460827lfl;
        Tue, 15 Feb 2022 09:20:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0OSLBoCgpIa9x98RcD2vHMfz9sEb3yFREKwfmZsUVzbnrnr8DVXxXjuiexyHxNCmNX5g9
X-Received: by 2002:a81:e445:: with SMTP id t5mr5024477ywl.481.1644945653175;
        Tue, 15 Feb 2022 09:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644945653; cv=none;
        d=google.com; s=arc-20160816;
        b=q8CgtVsFCQwhF7JXbiSyTnjvvfc2KS9UKptzSIwkNzH3aQjXktnr44vzZMpXdkX8RY
         540HR9AV2tc3X9JGf6RtNCK5Unz2meWEJKURAqVSOc5uNET5VyDhXW2wykylSb8be+wo
         vuImu5SBZaiUgZofI97EPnINCs7wvb98KJu5V0IgSCVVImfYxDzz73NmxvGIWygqcSEd
         t9P8eUdmK6vsP+hnZ5OKKAJ9YZHr6sAzKmsXR3Fg0z4tooXIGXVD7B+7U4ZS2U4BMadt
         zGtTVzSRdMEy3U/zrzkMMF63Ew6QtugxxgBTF6gp9XZyMJVfq/xGAbbSqpN2//R1csek
         gDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xW2NA4HjdNDSVneT7gb2AWfKKEzJpSpqZHLRk7Sv6U=;
        b=ngdj0lplgkqbiBeI26X3TAX/er1SO+Iii/W/31V9sfsH0yeTTnYpPO1tto/3tC90o7
         DVOif2kpIOdu4btYQtMtebQvzkZoyxnxH5CuEl86A+JjN+FO0Gms3NcqIOuMHmy1LAK0
         ssXRwYBCY8D3PL7MwXHxM0R7Suz3gFNOqrXQx6itEj8ZQFOcfLbWIXjgvpZb0bnyxzBz
         zU/dU++HlrTyqGl6PtkVwYUkOlIChXuAO95sRlilAz58TIAzFqfHbvRQA39kX3p6az0E
         cOBwp5uPt0bc/urEjiQFCY96/bVIiNR9+jFKSR2ilcLQmGgELDL5QoMzOVX/5Vaq5MKK
         oi/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q1/shm1h";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a128si26277028ywh.34.2022.02.15.09.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Feb 2022 09:20:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q1/shm1h";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nK1VU-0003hq-As
	for alex.bennee@linaro.org; Tue, 15 Feb 2022 12:20:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK1V4-0003cV-Eo
 for qemu-arm@nongnu.org; Tue, 15 Feb 2022 12:20:26 -0500
Received: from [2a00:1450:4864:20::430] (port=34473
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK1V2-0002Eh-3B
 for qemu-arm@nongnu.org; Tue, 15 Feb 2022 12:20:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id s10so19770743wrb.1
 for <qemu-arm@nongnu.org>; Tue, 15 Feb 2022 09:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+xW2NA4HjdNDSVneT7gb2AWfKKEzJpSpqZHLRk7Sv6U=;
 b=Q1/shm1h639n7ZHPAgESNZW1I6yGncAI3y/c2/NkQJR9bAG8zbt+YoouXiyCaG6apE
 Z6wK+kPFAmp5vxaq+GE+ClIH2d/YxVUb8SpSfsOOUIz+hTCz5g2/LL57dzIoJ9v0v9p+
 VTIje7CNc6rH+tvvy0Ex0XyEPDa7/hdrLa3BaHkdSV0KANv/geVzmzIncSW8ozqQFOkS
 wKCz/LnRdqETPmUHOp4HMhmdAr/PjraW9kNYMt8W5iUnbVOHGx1uwO2uA0uqRoAPU1Bq
 Yk63wi0UCsa1XkUZoLly4k2XRkbUKqXExAGPd1kaxlEXxhKRK7pHJL5oHR7IwDOYlw7N
 A+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+xW2NA4HjdNDSVneT7gb2AWfKKEzJpSpqZHLRk7Sv6U=;
 b=h9zoM3yjWPvJl0uQQaA3XvBuS/CqkrZil04l7PmZJhZW2YHVxd2gLhya+kbbNlR1Xx
 za+E4gMXB2AhWaKUw2VT8FETrinh5DVbgl6pGffMax4uQHzrG1GU7Ifzf6AnfFOBeLC8
 Vh2GhZlaiRmWB7sY6eWoZq2N7F9K11lURH101T3Vw4vGuljsrd9oiEnvE8aYY8lTrh5K
 IT2wjoUkqlT1NGuWeEb0tqluhpHvYDftaaQWLyA4F8k7Tg67wjPJUhYxIvrizF4m0MsO
 TJPw/0rAwevN+7lrNb5tOADdlz4DdtZ68/g8BvjUhtEbr+V01mEiUDWUH2Qq3OPYFbGS
 5v/w==
X-Gm-Message-State: AOAM533Dakk9AU/y3SyHNCjbGZtGc1NjcAjWC7RSTpWn7yjJZPqnpdDB
 WI5gnj+PAPlkp8IBH2WSnqjiSXPCxdiML4wt8MH0Ug==
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr4037941wrv.319.1644945622416; 
 Tue, 15 Feb 2022 09:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
 <20220203140141.310870-4-edgar.iglesias@gmail.com>
In-Reply-To: <20220203140141.310870-4-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 17:20:10 +0000
Message-ID: <CAFEAcA-mkZ5EuAhcVVN01q_6Mcr7QR2Gn4Q37nN1GZtBK8MM7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5N84XHj7M0UX

On Thu, 3 Feb 2022 at 14:01, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of the Xilinx ZynqMP CRF. At the moment this
> is mostly a stub model.

> +static const VMStateDescription vmstate_crf = {
> +    .name = TYPE_XLNX_ZYNQMP_CRF,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,

This is still on my to-review list to look at properly, but
this setting of .minimum_version_id_old is incorrect. The
field is only used if the VMStateDescription sets a non-NULL
load_state_old function, which this one does not.

We cleaned this up in commit 17e313406126, and I'm about
to send a patch which drops the fields entirely.

thanks
-- PMM
