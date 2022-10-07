Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp365018ocg;
        Fri, 7 Oct 2022 03:59:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7N4cs+ub3zAJEwxz++ew8TlQoQLXPn9/+9SQ/mo5HjVF6yfe6aSI+cU6io7TUFolH/wL8h
X-Received: by 2002:a05:620a:17a0:b0:6cd:a185:131d with SMTP id ay32-20020a05620a17a000b006cda185131dmr3129249qkb.759.1665140349422;
        Fri, 07 Oct 2022 03:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665140349; cv=none;
        d=google.com; s=arc-20160816;
        b=SHRcF6ed+xuxV0gMbOSm+ai81hWAp1AlT86PQwOELskd4lxRGoCbKLd5RrKr4RkMq+
         zHEZslXwnYueQa5tbvy0COmyLTZ0VZRz+W3sJyIuxkTqN5ATRlDWmvkXBPJdRpe75ISz
         /1i+SfBWEWozX/u4cynOG/aX6CxSQa2aL3AMYoZCu7fOTrdLX7HBxiDURkf2+vMy296o
         m6Kh79AjuBq5nevdH/6SCq5OYGaHD8x6ixJ4IvYUNOCBuInYFOD5S2SpiqovX/DCdjj5
         NidMLVMHsbDh2R+cO9OLEsm9R70VxW7ArljuyvwuQ8sIDPf2saow7YZ4+1bbi1H29Hqs
         3fQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TCOREYYe16dkbUzVNRjr/JLgLa9vMx7CIjrdeUnWlHk=;
        b=fKhl/szomYz9OBPcUIAcu/e0OuOtupdd9T/+1KZWEoD5ALcbKkMUwOrI0KWulN4Xra
         qPNjGX2BvsmjNApZ4hyEIMthvHhuZwucv8wxZr17+DvMf47O6d17B3KrZ+RbQlN5TN0K
         MB5IAwiw0GbA4xD4kH3mThK0veS2N3a3eXv5UShDy3fTxO5EFzAQm0G+3ZXjhSg4h7bo
         ay1RJpjcSSo0JQueHgdMJe6xuDqkDkwVjafYPxz/iwn1pF6Wk6XYMFdRcYyCuF3dExCs
         fcTzAV7/mOOW81x09wOWo+IccACYjLfA+VBZ/5Ew246OsXc1iH6eJhVT5qgj45qEMkIO
         HAKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRu1FIjH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a05620a268500b006ce3e643d2dsi710805qkp.472.2022.10.07.03.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 03:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRu1FIjH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogl4P-0002vW-07
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 06:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkoI-0001F5-SD
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:42:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkoG-0002NN-Jt
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:42:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so6907394pjs.0
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TCOREYYe16dkbUzVNRjr/JLgLa9vMx7CIjrdeUnWlHk=;
 b=QRu1FIjHZ1lO+jI2G7XhuPlFIjYteDX4O79/1KQ3ipTdzXmDihbrPwDWQXxFEJsB7h
 kpdnK4Ru/glqYs5VrDg4cuV9b1B1TuQzB2wiHjTgwz4BBOZwZgC1LxrfqBqj71W1QQjV
 RVUn/aimMbXVRBNHu+hufoHfvWm1ENK59fvZOs1Sy7/rS5psmrRDFed4g4yYzoIZ7Lf6
 iZJmyq3loxglkxqd9I2lkk6A/WuoqCt4rvOoc/ew2tDIrtyKPZR17Q9ghTzocL8TpR6p
 aWC9vsDdkx9ciHsmP2X3+q6PRF1jIUVm7YqHA/qGzOSAfn7dwnpau06kYnMCmsGQ7NWt
 LoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCOREYYe16dkbUzVNRjr/JLgLa9vMx7CIjrdeUnWlHk=;
 b=BludABlvre0x37XnFi+TgnrpM/J2QHhVLIxx7YiDtWIElhtmmL0JAG65hsZuB/H3qI
 cq1c7fXu0JADa3nun09zzyrCi+1EcHBb1MjIfS7q+LDtOHSicOrZcF3uwJOb+ucBvB/d
 2xFtsNY0ahqDbrdWodeRsenXprduou2l5p9EB7EeNOVeevr1AnFOtnFQc4GMD7mwZjvs
 qne1NByYyVSwgJnaC8ntxxjuBRn8BkhVmgsTzA3ZMsOqyoANwVnauu4P4JhrjczvuX/K
 vw13Fy68zuTU73MfdAQM5I9gUu4aITdv0r7nPMaElt4gscFlkorDzDTZQ+hFo99StPZG
 pttQ==
X-Gm-Message-State: ACrzQf2MxZijz0cGSNmDUgyH1TXlyIKDGvhuMeuHJI1qIaDGdYhkMULS
 rD6RZZ0hOSLyA+OBR0evmP22Tdwm+30+PUjJw4+QVg==
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr4683595pjb.19.1665139346056; Fri, 07
 Oct 2022 03:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-43-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:42:14 +0100
Message-ID: <CAFEAcA-uiN94rDnjZcTzdgfLBzzMSdpuxyOFU0QPgWiB2e4giQ@mail.gmail.com>
Subject: Re: [PATCH v3 42/42] target/arm: Use the max page size in a 2-stage
 ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bWdSBk/G5FK0

On Sat, 1 Oct 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had only been reporting the stage2 page size.  This causes
> problems if stage1 is using a larger page size (16k, 2M, etc),
> but stage2 is using a smaller page size, because cputlb does
> not set large_page_{addr,mask} properly.
>
> Fix by using the max of the two page sizes.
>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
