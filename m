Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2884680lfb;
        Mon, 18 May 2020 03:02:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB+cHjG1XmtuRe29//rFYmvFbeWoSkqKYFbFKVa7/e2ZGHuOvvoLgHIExf2g4TG6H9lLm1
X-Received: by 2002:aed:3bf2:: with SMTP id s47mr14792430qte.126.1589796136010;
        Mon, 18 May 2020 03:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589796136; cv=none;
        d=google.com; s=arc-20160816;
        b=MTm/UJFflx/lwgvw/sqdbFdXxuhDtRd6XYtks+rgrR/kfNjklJdqc5BpUAyumpeUMF
         3QEvfzK36Aetml+s29IIJnXhTCsVafuNQc0eD7tr+wQ9/7WaKISG8Li9bvkayYhzZGHn
         /vMEM38X39Zcv3yJZyGhKGSnP1Iw86vcT8BqV6Uq5IoZhK3HhpUtRjMH/8BlspcVuSQj
         0cs/EScyvQCw3IuG1YuM5LEOv+MYBhWEBgIBsfahZjvfLKMjPlP9l3IstGJzPjw+D9fK
         NA2buqwrlXcyUlLjDmLJxJqLh0TkNuOMj+H56pPU8TO0fWgd97cu4TduOvuhhbVVyUMK
         s9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=Z4x6g8TReQ1CBDC7Hbf77gX9OyKtXDpp73u+uXiA4Os=;
        b=ueM1yW2+uSBSNkVPw2v8YGGRjWPeYHeB6cTJlS3fS8Bpf87g2gmKh0HMdNdNfNNMff
         4ElYMQnOS075HvEx6rcahlOVe6yx71kma8MrTVNsb/7EGioFhcrRrX+so+mGCICf5mAU
         9rjeDCqAUB1UEop1vDmbcX8wc+CeDZvgiQC94KtTb/IasvwTD9C5Q9o8IuN3PCCw+x1A
         7BKcTvuJ/igwWs7N8s9STMLFe0PebOs8ochDqprS3vhEdnSe8/JIVYQWYO9s/merPBsQ
         6T4Y5wMwAoYHrqymVXZPkmaq2N6HWLq/qNvgslM5TiOD9nXbiadTECQH5L8BOEU4RcBO
         9SyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JfExe+Ls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si5616977qkf.251.2020.05.18.03.02.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 03:02:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JfExe+Ls;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jacb9-0004Es-B6
	for alex.bennee@linaro.org; Mon, 18 May 2020 06:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jacb1-0004EX-JQ; Mon, 18 May 2020 06:02:07 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jacb0-0003zG-NS; Mon, 18 May 2020 06:02:07 -0400
Received: by mail-lj1-x244.google.com with SMTP id f18so9147057lja.13;
 Mon, 18 May 2020 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Z4x6g8TReQ1CBDC7Hbf77gX9OyKtXDpp73u+uXiA4Os=;
 b=JfExe+LsNbSweDCCFBsjNLX80j5NLfxcJS043n3cIAwA/C3VXYYJLoeFPNb8cpo7Rq
 XFYzLd3e8C+0b7woWB8xX80hKgrj1+TpwmmPVLqNnZ5ugtUqXOptF2Jz3Xw3i0w6sW0n
 FNQ2PZbArTacDpwxZo/FJnk9hmdJ/9Z8usHu9FgB5Xq8oD0FiHiL9aZr1b5TGopDSC4t
 Y6aeWuW1jh03NK41hxL7dpaF4+vqz4C9yUYzdJSzvZgs2ephNKBVSbnkoME5IRua2LGp
 q0hjJx41fMXsYh9in+oroOSvSl0LtGZapGREqEQpwHMrXTd9ENf2EJ8vEz9DNKC35XRu
 2Njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Z4x6g8TReQ1CBDC7Hbf77gX9OyKtXDpp73u+uXiA4Os=;
 b=lUBPSauFaU8+JjiGR6eBRRxXLx1XXLuXGW6fqb9kT/tV5SXIqKoluZH/qIpVPhjvN4
 4KvaOJSHZ6WNiDHkcCpyy/2NCQ00ehTWtKetFjjSFgUSl4b6O7XvQ+9H9AxY56Uo9DI/
 jFply62GtTetbM4Zpy6Z6AkeMWwx8fdUIxXS46pk7LwpymWc0aor9dvsaFFV3zcx5J8W
 SMCyHQYMBf5YkaDud+B98WE6R/R31Y6pEOtMnZUHYP3qnvfBdix0gm1X3fx7LJDJedca
 3PlrZYaIizxMRxhsv/z6wGV8e5xbEl2tJGssKtlw8e19zCsg3F/q3pMkJnXXv3YuEe6m
 0bOQ==
X-Gm-Message-State: AOAM531n3LEH5oZPAQUxb8VhUiFis51fsyAbcd7BqSe4gBjJ7gULi/RM
 6zMO/HquNpstX9zU60Qbteg=
X-Received: by 2002:a2e:9093:: with SMTP id l19mr1419170ljg.27.1589796123938; 
 Mon, 18 May 2020 03:02:03 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id a11sm5459000lji.62.2020.05.18.03.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 03:02:03 -0700 (PDT)
Date: Mon, 18 May 2020 12:01:46 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] hw/char/xilinx_uartlite: Replace hw_error() by
 qemu_log_mask()
Message-ID: <20200518100146.GC5519@toto>
References: <20200518095203.1013-1-f4bug@amsat.org>
 <20200518095203.1013-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200518095203.1013-4-f4bug@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ysc54u2TiuYL

On Mon, May 18, 2020 at 11:52:02AM +0200, Philippe Mathieu-Daudé wrote:
> hw_error() calls exit(). This a bit overkill when we can log
> the accesses as unimplemented or guest error.
> 
> When fuzzing the devices, we don't want the whole process to
> exit. Replace some hw_error() calls by qemu_log_mask().

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/char/xilinx_uartlite.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
> index c6512285d7..ae4ccd00c7 100644
> --- a/hw/char/xilinx_uartlite.c
> +++ b/hw/char/xilinx_uartlite.c
> @@ -23,7 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
> +#include "qemu/log.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> @@ -135,7 +135,8 @@ uart_write(void *opaque, hwaddr addr,
>      switch (addr)
>      {
>          case R_STATUS:
> -            hw_error("write to UART STATUS?\n");
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: write to UART STATUS\n",
> +                          __func__);
>              break;
>  
>          case R_CTRL:
> -- 
> 2.21.3
> 
