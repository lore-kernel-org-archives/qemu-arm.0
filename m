Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1099622lfl;
        Wed, 16 Feb 2022 07:01:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypFh6Kv0ZTUBHGLS6EQGiJMdlPNoJ8umHZGFcJsyeuKpgiz+5Y8dxWmp+qxFDhAMjoIdCv
X-Received: by 2002:a81:32c2:0:b0:2ca:287c:6ceb with SMTP id y185-20020a8132c2000000b002ca287c6cebmr2796225ywy.400.1645023671062;
        Wed, 16 Feb 2022 07:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645023671; cv=none;
        d=google.com; s=arc-20160816;
        b=oRxdUP4oxURxuDfhJCNAknBWTYHPdMkebShi4Cy19tQ/gu03aE3jM8ugSGuJ44bGwK
         ZhXcia9al+cXlegpJLgJnl9lZLTrmFmbhPwmPVJ4AymgvWCYqS2l2w6GwN/2XUPqdx2r
         aHEFXHIxdZQ0GWI8bbllGZqGwqu6bsDNTgIEWgDT3o2PmsGP8lfrRNeu8ikNTpbwBddp
         NajMz2mEcCmFsHvhixVmarANg2OUI4c4iHyt1/pWG1StDKuyAodQU0kvmRd1/BOGYvJm
         y/K+Ei9ey5Ig4yQbbfvliu0Q4XjFdk4CA+v6WMwUAU+FKgJgne9QAfjHo4LyCLgxPtkn
         Difw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qy3xZ8qT/ums2dwQPJUMHVrEiOHX4u79jkuCfY9Lj/8=;
        b=G/UTfHd8rO68muHyl5sviwuMgPsclULZdGdsKLLIuJraSIV+m63ck1bu7A7Q8fET5P
         87qyD7PXGI2KkoyCtFFTB8QM1L64T0ec6k7VLEm58BfRAEDIu83BTXNPNhqn3dQPbrUY
         ej7+/29sK3zhcerOyrpe+NSDI2hOnu480OnKQyT6ZgrGrcuYUejEaU5NzREMjPEvq9ua
         8EGPK81K8hODF3BmzT7qQE0/efg2L4Ax2xxs2EGVm4cjL3DXYFvfMJhr3b76Z6yyw5XH
         88BhOZagiE1v25wOp7PTx8lj06Zw7q87mz0xWz1BIhmjewm0grcdKXlNkgIo5UwBTIqZ
         i6+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=IsIlANyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si26372483ybp.674.2022.02.16.07.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 07:01:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=IsIlANyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:33110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKLnq-0000rA-Eg
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 10:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLnH-0000po-4S; Wed, 16 Feb 2022 10:00:35 -0500
Received: from [2607:f8b0:4864:20::f34] (port=40735
 helo=mail-qv1-xf34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKLnE-00025j-TC; Wed, 16 Feb 2022 10:00:34 -0500
Received: by mail-qv1-xf34.google.com with SMTP id v10so2352025qvk.7;
 Wed, 16 Feb 2022 07:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qy3xZ8qT/ums2dwQPJUMHVrEiOHX4u79jkuCfY9Lj/8=;
 b=IsIlANyA+mTOsp8JUdWp6SBQkR/jpEE2c3WWZ4FzfBSixtvPMNg//zXwqRFRL6e2SI
 8WQ8gps4CXqGvcgG+i0ZC3UQsyRe7SBA7UUU1xpW6jkGG1YMq9kKBDI2n1IeM+VMJ0x5
 lgtOHU8+EFMTcHe1OpFNbbpXm93Gh/Tx8ph6u6qZZVtMtPhBgJ7yXqYZPUBy+FFe24xQ
 GBy+UNUH7Sp1D/52zX8+4M3s2qS952DgB9KhBoVdpanP6Fkf+tvID7dGQXbr7TINX/FH
 sTFnvm8XGq5E9MyTWwORjaCQAUn7DBeMZvFcHn9+0UflIWl741pdCWcy/VwWNJQAkJjQ
 IBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qy3xZ8qT/ums2dwQPJUMHVrEiOHX4u79jkuCfY9Lj/8=;
 b=pyQF0FnGVo000caz/J9E+g9I6uM46qsCfLhl4byTk84FZVisjbnCxoILw7OshNcxQN
 GnbvUF+a8gwt9N804usqkJb0X9pDpRlMmXnEImkV6Bx8I3mzPpj630Zk2tWLvWBLC2U9
 jv/n17pfji7kFeMC5puIYOxfYxJPAxGnPRyvSU0jBW2rnt+s+iJ+XuXQL9PlpbGkLl3G
 H3uV+gEv//UaLKxZx473IkRJ3JvLQzlLJepz8LJU9qqxq+SXidFFdcOAoEjuf5+WXD+7
 MPTi6/zmTiJYn7DgJN/6pB4vNH6Ma+kB5RM2iwWOX1lVg3ZgDfEl83x9613RGwzjYVl/
 XXTA==
X-Gm-Message-State: AOAM532rNGZI3f6UEA8cP0SaDS7c24VBlN6uVx+OMgW+wEsJc1M0MiU9
 K0F4UVo+YWQlDrrKyZjKaog=
X-Received: by 2002:a05:622a:138a:b0:2c9:efe8:72c7 with SMTP id
 o10-20020a05622a138a00b002c9efe872c7mr2244567qtk.546.1645023631391; 
 Wed, 16 Feb 2022 07:00:31 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id c21sm21366147qtx.89.2022.02.16.07.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:00:30 -0800 (PST)
Message-ID: <a3b91b3a-6a75-3dd8-d1dd-fca3f6762c97@amsat.org>
Date: Wed, 16 Feb 2022 16:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/6] ast2600: Add Secure Boot Controller model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220216092111.237896-1-clg@kaod.org>
 <20220216092111.237896-3-clg@kaod.org>
In-Reply-To: <20220216092111.237896-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: vU08REna43/I

On 16/2/22 10:21, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> Just a stub that indicates the system has booted in secure boot mode.
> Used for testing the driver:
> 
>   https://lore.kernel.org/all/20211019080608.283324-1-joel@jms.id.au/
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h  |   3 +
>   include/hw/misc/aspeed_sbc.h |  33 ++++++++
>   hw/arm/aspeed_ast2600.c      |   9 +++
>   hw/misc/aspeed_sbc.c         | 141 +++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build          |   1 +
>   5 files changed, 187 insertions(+)
>   create mode 100644 include/hw/misc/aspeed_sbc.h
>   create mode 100644 hw/misc/aspeed_sbc.c

> +++ b/include/hw/misc/aspeed_sbc.h
> @@ -0,0 +1,33 @@
> +/*
> + * sASPEED Secure Boot Controller

Typo?

> + *
> + * Copyright (C) 2021 IBM Corp.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
