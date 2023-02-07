Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5437333ejb;
        Tue, 7 Feb 2023 06:53:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8hi5S2VY8/W5EiNzHS4hLu6skiNvvD8RJockny55Y2Txdub1cXqvKUqWQ9ZzVBYPnd3ha/
X-Received: by 2002:a05:6214:248c:b0:56b:a5ab:e107 with SMTP id gi12-20020a056214248c00b0056ba5abe107mr6325426qvb.21.1675781606788;
        Tue, 07 Feb 2023 06:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675781606; cv=none;
        d=google.com; s=arc-20160816;
        b=VT7t3rQUHemzlSfQu8KTKd1JOqXwSEFhcJqMivZyTUX+gYHBHf2D2vZjNqSdtcd8x7
         4yCBzenuWgraaQMB9FMXHXIF3FA4lTiPLoCsUPMM2VttV7tstz6rYavsrUA3Gjl3XRUA
         1OJ7nwMBRd19Re6Ep3GsQ8K+60YCxz7SrLZQZfdCJz4ge2dK4XWutlqDDG97KyQu3B11
         AXsmOZxVCLblFZ4Owh6GJaTWQ5zS0Bq3XqGQzIEFqS+/5OSSqScEUTX3n8ZnGWnWOzFj
         VGaqYrQw4sPw8Sg0hqQFjM37QLaAKCvMlDM+gqQc0GeqleLSgQLYI52vzZibpHkoK4ZV
         Ei0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aGuTl9qGfWZJy4CWkG/+2Wojw+hDzNXtCI6NfeCmXSw=;
        b=BTOPFi1M0NQeRYdSND7qd8qyB4hCd38s6iYWzSukJCOzx9b14ZJl8POBHJGlnzbosY
         g5uw56pLJ976pkX5mIFGI6ucGy+qxOxmH9su7IVEic1vLDlSrrs/glk+hJltwR7hI0ZT
         qc6S2IJzyZN8/HwfqGmvzJs+5Pwssd+xNueM9kth1hP6wbaDNg5WwdwK/JG75i2+0FFc
         LznFLhQQ8ONO0yRvKg7lxqK9Stgh+wEpmczpzbr58ACOugHw0VTWpywNy27QMPtiE2tR
         PijxFYiLjr74muOcf5CD3gRxfTVJBnBFjqcLkWLsK8ywEMWgbOEhj4VU6nhf4mZgG4IR
         JhGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ROKHakSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23-20020a370617000000b00705c3b6ccccsi10875074qkg.129.2023.02.07.06.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 06:53:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ROKHakSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPPLS-0006Pt-DD; Tue, 07 Feb 2023 09:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPLQ-0006DW-52
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:53:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPLO-0004RW-Fw
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 09:53:15 -0500
Received: by mail-pf1-x429.google.com with SMTP id t17so10947254pfj.0
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aGuTl9qGfWZJy4CWkG/+2Wojw+hDzNXtCI6NfeCmXSw=;
 b=ROKHakSrzC7b/fkRZD9G2PsmDqMvnUL9DiJdyLLhZEZQzXKl+ltm9C79Es5auXI2pJ
 8Htfb2wbZRcDsY39Ky7umVktyXMqhXda2dRCWVCZdE5jPzFYvtrOHBgoZzDcIbivrkUr
 aX2CXgv9gmUXFs33+iLg6i+zV/BY45ouO4ML6xRn/Kv1stImOg/2bqbhrysZhnTZdD2D
 X6wUD9c11LqB9mV21UjzSNKNaMH5x8OogIEaMScyG0J5f1JYZdtwb+Wc1T3gKIaGsGIB
 ZXRqaw0AZ3FBNNDtzJaAaCw68e2w+FPtYZCOohsuhMfSUOW44dbERqgs58p6rFJNhqN/
 B6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGuTl9qGfWZJy4CWkG/+2Wojw+hDzNXtCI6NfeCmXSw=;
 b=YnDNcPmfqJqplwij2mWWVb39bssVop+L7v3spilMNhx1qOPdJYaHz0HbknIFzHA1zK
 Uf10cLtA2E1NeAQkcxWKAmlGmM+j4s0bxHiK8sMFeMev958zWafCsS7CnvGZkW/ZHKsd
 VKb2/6HhZol2t7aNV/wmRGR3vLS/2LSe0+v/jCgUJZhTszHyr23CXgOMGcGbVqCm3DB6
 MPm5SzeXXwlTxIsplqG3DpaZelvav4tkUYgIEI+N4PcjL6wbTHcmPYkP3RAeFU7pdyz0
 wl6xib6w6rX2qUtyNvdRDotsDySVZ12ovhVADpW3xQ1d0qrGeqF+jwxcOwWks1akjudl
 l1Xw==
X-Gm-Message-State: AO0yUKWe92208g5Ty2qmlr1BPrs79/oEOtgmd17MLeQD09M4NgTuUo1U
 VMlQx3mD0KNhbvDrptt68IHGlLcX7e/U/HCgqar2Sw==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr836840pfb.48.1675781592931; Tue, 07
 Feb 2023 06:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-7-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:53:01 +0000
Message-ID: <CAFEAcA9vW1Z+6c7HWh+s-d74kFrpBm3JDMCzdY_pqQh7-JPjVQ@mail.gmail.com>
Subject: Re: [PATCH 06/22] target/arm: Add RME cpregs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C/Bsx+9FpluK

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL,
> PAALLOS, RPALOS, RPAOS, and the cache flush insn CIPAPA.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 19 ++++++++++++
>  target/arm/helper.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

as far as it goes, but don't we also need DC CIGDPAPA when
FEAT_MTE2 is also implemented?

thanks
-- PMM
