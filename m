Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5111420lfb;
        Mon, 30 Nov 2020 05:09:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdrdvYgqGqfNiEdNRYT2R2tZsr5EZBOgRpCRamxBhsjtvUnnOhzK+M7fdbCtQgDgP+rcEk
X-Received: by 2002:aca:d483:: with SMTP id l125mr14626626oig.78.1606741787035;
        Mon, 30 Nov 2020 05:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606741787; cv=none;
        d=google.com; s=arc-20160816;
        b=vCfKoK/tiTlzThX1z7Y30eV8q+eQMpFatu9EACZw/9/um/A7gDLtNEXydWZYicx4Ff
         SHSakur6zdRq0/xskb02lIflxlbchJzshz6EV5/U+Ht+052EubQxgkEVT5u/UsK9EAxS
         yuGlj8cZkYckM0rKW/I+ICMGkLsrBPAJk3LXp2GN89x/5eJlaRq5+US1pte3JU7Z6i/b
         dutFbJ4SmuHmy7lIMvkwfozva00zgtbMTXdPVaak8SFB6wtW02MDoKsRKyfftPsBREDU
         XDe8TnQm5+WKcGRLVk3xol0kqS6ICU8cMaSspaWq1dxGu/GAOwibzfbq9oaETwU+t9fO
         uhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CPo73sHR4PRMlUPYlJHzAwKVQCvRQFhfEQOLwdmgRLg=;
        b=u8okv+Ygu9PR1BAkiJ+PGexZ7M36mAUiJem7HbDVlkjWc7SL9VO+yVIS80dOQXI/Ui
         vlHVQzpaYQi2U5QptYfuDC6bhlJNsyfF6bW+abOrsFdNzO6yktkc/b0OKJhF0+wflLYd
         wdaHIGUSBviiCPfx+0kp78uQnYXN9LZYXxukByvyI6M/BKewT9V81+HuWT7hwafsI4Cm
         /mUjF4czRXfuCzUf3PUqX/oLOJpLtrU0iErKQicj1vGSRKe8qH4PomT9mQtQGzgIDxZ5
         s2J9v+Rn51Tov7lk/p4f26tkqZ89R8C9VA5nj1zGp8LJ0e5xgOTwjus8cSGwDv06BIg2
         mfiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hj0gXJga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si3278099ual.248.2020.11.30.05.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 05:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hj0gXJga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjiw6-0002xb-C9
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 08:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjin3-00067E-2K
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 08:00:25 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:37197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjimx-00049H-M2
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 08:00:24 -0500
Received: by mail-ej1-x642.google.com with SMTP id f9so19423197ejw.4
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 05:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPo73sHR4PRMlUPYlJHzAwKVQCvRQFhfEQOLwdmgRLg=;
 b=Hj0gXJgaqbI7J28JoNWmJHxQBACMF625URmWKommOeQko/KEskan6JrfaYQWkGKG2z
 V5PNhMLHK3wAy2/8kqg/dMXMd22HH9Pz7s5dFnRy6BfCexH44c2G7jHviUu5+C6NVpiY
 liVfJanspoFCxppCHLCSSJNrkZ9vHwr2ctim/1l1K0BU7fT6p9Cv295Sx83es7tTbvi5
 uhFVF97cRw5HbvBq5Xt30JIsZHmRHDk2PpgpkJc1UfAQgGgOfHzddoLP60XQWi0Qho3p
 RpX9M5eFlxRrmwnxTRUtg2PPN7fHgFySy7MWh7HtUei5KiLWqcyDpF3yLygMnES+Bq15
 UckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPo73sHR4PRMlUPYlJHzAwKVQCvRQFhfEQOLwdmgRLg=;
 b=FLltS3WOJyrdiCz2uHfku0fKNq+mlsB4EFd+8jZr9SE/1QQHw8qeHHiuepauvLyq1U
 9sFVtTZCd4nEUmIptmKErgxfzzGnogXQ7/MxsRZluZwpBcvtf/KYpFzIsqkfuDAQMfiA
 QIWc0KynVCB3pKCaPZ8iU9kOxVYcV9s+St5tK3cQZM1UgJAa8wvYJEb3p7zjXs6WYEI1
 lDgMQbU3GuKS9GDGP4BU0BpmVLFuVokED/to0qDDWeUxOTz+4WnX6UpixlJi9RX/PX5l
 FMS72kECYFd+la8k6xPZrb0UTgA3+FDlJpHBm0SXYQtm6AO4Dk8fl5maZygH8r0PA+TW
 pITg==
X-Gm-Message-State: AOAM530WC7cry20DYGsg+PE2AFUqNKRC9M0AG87Spwd6zyAI+8dWzdk/
 APTA+2ztczuyGRtf3kyNVtO78UCdbNdlcRl9EDsPEg==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr3633403ejf.407.1606741217346; 
 Mon, 30 Nov 2020 05:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-11-fangying1@huawei.com>
In-Reply-To: <20201109030452.2197-11-fangying1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:00:06 +0000
Message-ID: <CAFEAcA-CuagYtA_9c7KrkvoBJqKnUNnT7M=C_MN1EnU4k1kAxQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/13] target/arm/cpu: Add cpu cache description
 for arm
To: Ying Fang <fangying1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2g66HdfJmj+F

On Mon, 9 Nov 2020 at 03:05, Ying Fang <fangying1@huawei.com> wrote:
>
> Add the CPUCacheInfo structure to hold cpu cache information for ARM cpus.
> A classic three level cache topology is used here. The default cache
> capacity is given and userspace can overwrite these values.
>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 056319859f..f1bac7452c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -27,6 +27,7 @@
>  #include "qapi/visitor.h"
>  #include "cpu.h"
>  #include "internals.h"
> +#include "qemu/units.h"
>  #include "exec/exec-all.h"
>  #include "hw/qdev-properties.h"
>  #if !defined(CONFIG_USER_ONLY)
> @@ -997,6 +998,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
>      return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>  }
>
> +static CPUCaches default_cache_info = {
> +    .l1d_cache = &(CPUCacheInfo) {
> +    .type = DATA_CACHE,
> +        .level = 1,
> +        .size = 64 * KiB,
> +        .line_size = 64,
> +        .associativity = 4,
> +        .sets = 256,
> +        .attributes = 0x02,
> +    },

Would it be possible to populate this structure from the
CLIDR/CCSIDR ID register values, rather than having to
specify the same thing in two places?

thanks
-- PMM
