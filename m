Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp216796lfq;
        Wed, 16 Dec 2020 02:25:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAc0SCGbHPpY3lMsQMXOTKY5H1tl2Ejv5BPeKb+6m4XA/9n4iTcNm6Skf/ANopEtqmcSKH
X-Received: by 2002:a25:4409:: with SMTP id r9mr50063668yba.113.1608114321061;
        Wed, 16 Dec 2020 02:25:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608114321; cv=none;
        d=google.com; s=arc-20160816;
        b=0y3sCvJ7FhsnfmHeOrDRdlKuzZPGRYM/SpikCP0sLTs5XNl3HDfT2Qgl7/KmcEQykO
         VBJDmXlEYeJnzZO4hqv+ZRFF0yf5gJm6sBcU70z3mEQiW4JmGGb/rX6/W3MKTg4C4k77
         +BswNA+hYbGCJSTUbpcOB39o40vvowOxVnCl4FnLgXJ9nRRZrgXwKUSU6De5macnTM6f
         pr6rQWOIoyUGtRYjUxsVrCaJ9Wk0TeCrYzkoNNetnTVXV6DqM9SS8/jFI4wpu+wBG08K
         BtrSAf0WgXNl0ODip81w71t54U9SMkv2htsgB3OoaOZA4Y2NYRkZbBeReYju/rZp1yQ0
         NrOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUSv24umSnnRdRbzXcaLRlCzlwMYxa9GG3xGLWSbhac=;
        b=U1GJ8aDTVvBeDRz2skniVysSi1PHEwjhh2dBWEQPu6JItCdxc5PEdFCbCl3LX+fWis
         pojoYUhWCT5GvU+4lK2nw7A+ULOQliZfqqZHMrK7PTPzSfp7tUGm8WkOH/d1p3fmPXAu
         ZRDJBpDZktfMWfObQGQBPeW6hd8+prT1/MMEhpKqQAm9ETKt6pK8bBicZBW1oqUAnRUB
         4Dl6GLm8HhKTzjWdIy9czk+ZyTApIm9+qJkwwE3gQS8COwL9STAtPewCSYy51FWM+qz+
         VyRd00DHQd8vqHxDjM4Vj1wDh1YwzsCtsgg7TxVvCMQLgcX3DP8rgofqsWg/P6ZEW/Hn
         wDHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=vWjUtE4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p197si1008196ybc.439.2020.12.16.02.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 02:25:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=vWjUtE4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpTzk-00025I-GJ
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 05:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpTzb-00022o-1M; Wed, 16 Dec 2020 05:25:11 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpTzZ-0006L6-Eg; Wed, 16 Dec 2020 05:25:10 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id j17so21897173ybt.9;
 Wed, 16 Dec 2020 02:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MUSv24umSnnRdRbzXcaLRlCzlwMYxa9GG3xGLWSbhac=;
 b=vWjUtE4sW34P5bEZfzM0YshqXD/wtjb4q2rzYr/eMDm0jTex7BlWNaHZTj9FsjXq4Q
 cUMVJR/jAoSWheYngj0uVcq7p23j+8NtRy3mHbfmOqB3rylwd80KFWyx6rcMwcorfQKe
 8hMNBhzCWPrFRM9Fjq0ts5XIToHN/RghW8Sw6ZVd2/kWH9bHcb+mjFXzZcHzyrkGdLqX
 qGkZhAwT8Dd9PwCdoftF0jme6HTBDq+MeCTWeEsqzFxh2a9dubQHICI+XxnsaPsRi9Rk
 lk/WCyevvZtR0ijmzXiQKDdND0nvcwbAdfSx7oAyIzsNpzWOp1Z3O9oOEMy30Tbwpm8v
 O9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MUSv24umSnnRdRbzXcaLRlCzlwMYxa9GG3xGLWSbhac=;
 b=sIKFgvNB328XlB0avlPJGTthGC4AJDGknjRs0TsI7mEkjz2ZdUwoSGzBv8ysr49ReQ
 o5TkITAJCk43ZQADX2oB9vyNOOI6r1FqDt44JMfMMxRMFfotUU28nJWauPclmZ/grThO
 UBkcrj/kznGRToLG3xGV5R9CoPH9p5g2z6mfomo6Rl0DHuhs4vHjBoEG/0XhuZLYnY/J
 kId2XtLj2fNLaNebQBMprKp1hHM+cElmy7M39cNXroPuSgYdSgdCv8Jf6LlBkHSjOLpY
 dRxdImAQIXr0fc6RHbOsK5tXi32bRl5gYLxqpDqlMSOqz9mxxk/3nPg5KUj21x/6u/Pk
 vjIQ==
X-Gm-Message-State: AOAM531T9rLzwndb/FbILjZMtSFyWLREvCdwt/UnJOZtrmJ7WicfyqUN
 EYxbScRwGkNtGeZdQD5oIkx+kix4SmfdnkWDc5Q=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr46677660ybi.517.1608114308154; 
 Wed, 16 Dec 2020 02:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
In-Reply-To: <20201202144523.24526-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 18:24:57 +0800
Message-ID: <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dhq8W/1eVCfh

Hi Alistair, Peter,

On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v1)
>
>  hw/ssi/imx_spi.c         | 4 ++--
>  include/hw/ssi/imx_spi.h | 5 ++++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>

Ping, not sure who is going to pick up this series?

Regards,
Bin
