Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2799150lfc;
        Tue, 26 May 2020 02:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz/HkD4+IRghJO0i/oj4XkuseyYRbWL4fhltkFJXBrs1SBmw3gEGcb/rHO9Qxq2Kz+293G
X-Received: by 2002:a25:7a81:: with SMTP id v123mr301145ybc.138.1590486497291;
        Tue, 26 May 2020 02:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590486497; cv=none;
        d=google.com; s=arc-20160816;
        b=KA/1kSt7rzT8JxdU2ALcldkmC8AT8FhOjCSIxDMKUAylcAA8A5YsdURgXQCiEr8KhH
         7GzZyDvwb6se7Gyo4aO5VMUQuzTTfML7xdZou6GZ8T4aaRh6v5cjzNh5KnGx5peWmfV3
         Tw7Lf9z8vfupa5r0imRyiSrcNHbI3XW7iWZuHZjU165t9RVmMaSFFTn+JOfSaLpTC89D
         HgM8BAmquYnlz1n/8D4/iepC+lU1M8S1c7kfkj8odf4Z0f/n48B/BzW1AQkxiUk5j1od
         cuilh//3/t1y+VaW4RXlXu6unkfqaA5o0zZRTF/eZE5Up8ufHuJkDCZS872WKUpEADmJ
         C4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=7eFtz95esepZNYhw5VvO90A3LK9OZU7VSR8Qv+XAU8Y=;
        b=c5Qgvg534FubzJrof9kv4bfFR0X4SIEa4vbas6HOR7Hnd+/ebYCm1TCPBpgvMJLgSF
         wx9cQJX3m/E+yHgXtNmh7024007st2BWhCAHaOJohkesV6Hj/Gfts3Wc/D93SqRxbtQz
         MGYrfvC0Fj8nhfAnGpBvlNzY7gy2GK96EmLIOor1TDVSTwDU97HtuneeGlAPxnxeN4CE
         04HZgbB8Z7Fn7wA+1chxhkjDfRxBDIalPbTyGQcCaQyL1ytJh7iYaCgdupFhBkHsyy88
         oLCl3F9/ttsZO4c3vrwmO8Q/zkeCn5I9k8WGhNMAGIkDswezmVeucMp+gh/cwBbZ9ZkR
         BRvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VMVnzXM8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n128si18631664ybc.478.2020.05.26.02.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 02:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VMVnzXM8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdWC0-0004fn-No
	for alex.bennee@linaro.org; Tue, 26 May 2020 05:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jdWBF-0003pR-J0; Tue, 26 May 2020 05:47:29 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jdWBE-0006TQ-4M; Tue, 26 May 2020 05:47:29 -0400
Received: by mail-lj1-x242.google.com with SMTP id b6so23718292ljj.1;
 Tue, 26 May 2020 02:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=7eFtz95esepZNYhw5VvO90A3LK9OZU7VSR8Qv+XAU8Y=;
 b=VMVnzXM8MpjkIvaSsl1+NTIo7vseViToyjRMdAtW1BOsZAtARZu4rdPykGcu78l9cC
 PZhy1RjlHoVepzqKEQj7QyU/OTZ7ZG07qjwooILxU4LxwKFCWq67yQJMTX3mWxTq0ULW
 ypzgHeBmweSmcNQYJOmTZsEuKUT1vu34/yFZ/f2jW1GaDuj4DWUY1r8B+OZ+U1qaWnRV
 LtfrwgDJFtQB0HznTOKvdTacaFPOsxWLziN2vENwS7TEbHyfMXyqQ1fBoykoNZulHDCu
 GRVpdQfRz+XmJMHcYnETMsC1HTk4kup8r8zXEBc5KqHV4kHTEsu/Hd8IOGqXdQxDPe7k
 M9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7eFtz95esepZNYhw5VvO90A3LK9OZU7VSR8Qv+XAU8Y=;
 b=W0/XTq67DDZK0FxVO1yrXgBqDU2gwbqF7MyAg7hMcydRIxPYHXmKnJSztA+yp9OtVQ
 XZAKVPjyGoT++FNLyn7MXDOXyoU/YHCD4P7iKUuYVAS1PXd3lif/qGXOWCwiRqqLAIJp
 qX83coF8L5FMPre/SM4lEg/72f1eXwA3GbGY4Fs+OPOmAFuvUti2Sj9/TycJ3fPZOqEG
 DJxXnSsMHh6I+Pf7P7w9I1uprf/epv/NJlhncUFFM1wmre2/AEA6XnekzjBGpv/mqgWv
 KzdOSRuWE8C4WzeeatndH4hQsD6N2dJjkSJYabJ3pNbY7iHdbA4iCV5Ub2yJdZdxN+p9
 FDxw==
X-Gm-Message-State: AOAM531ig2uI76vAO1gYz7iqnct5An4CXuRXWSaH/clVW0bdr15Fgr4O
 VIXCUtxrkkmayA9D5Q3Uh9A=
X-Received: by 2002:a05:651c:3c5:: with SMTP id
 f5mr191078ljp.448.1590486445311; 
 Tue, 26 May 2020 02:47:25 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f12sm5852838lfp.8.2020.05.26.02.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 02:47:24 -0700 (PDT)
Date: Tue, 26 May 2020 11:47:19 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 09/14] hw/display/xlnx_dp: Replace disabled DPRINTF() by
 error_report()
Message-ID: <20200526094719.GB8957@toto>
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-10-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526062252.19852-10-f4bug@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C9QFLPzUR0AN

On Tue, May 26, 2020 at 08:22:47AM +0200, Philippe Mathieu-Daudé wrote:
> DPRINTF() calls are disabled by default, so when unexpected
> data is used, the whole process abort without information.
> 
> Display a bit of information with error_report() before crashing.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/xlnx_dp.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 3e5fb44e06..8d940cd8d1 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1,5 +1,5 @@
>  /*
> - * xlnx_dp.c
> + * Xilinx Display Port
>   *
>   *  Copyright (C) 2015 : GreenSocs Ltd
>   *      http://www.greensocs.com/ , email: info@greensocs.com
> @@ -24,6 +24,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/display/xlnx_dp.h"
> @@ -465,7 +466,7 @@ static uint8_t xlnx_dp_aux_pop_tx_fifo(XlnxDPState *s)
>      uint8_t ret;
>  
>      if (fifo8_is_empty(&s->tx_fifo)) {
> -        DPRINTF("tx_fifo underflow..\n");
> +        error_report("%s: TX_FIFO underflow", __func__);
>          abort();
>      }
>      ret = fifo8_pop(&s->tx_fifo);
> @@ -525,6 +526,7 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>          qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
>          break;
>      default:
> +        error_report("%s: invalid command: %u", __func__, cmd);
>          abort();
>      }
>  
> @@ -631,8 +633,8 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
>          s->g_plane.format = PIXMAN_b8g8r8;
>          break;
>      default:
> -        DPRINTF("error: unsupported graphic format %u.\n",
> -                s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
> +        error_report("%s: unsupported graphic format %u", __func__,
> +                     s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
>          abort();
>      }
>  
> @@ -647,8 +649,8 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
>          s->v_plane.format = PIXMAN_x8b8g8r8;
>          break;
>      default:
> -        DPRINTF("error: unsupported video format %u.\n",
> -                s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
> +        error_report("%s: unsupported video format %u", __func__,
> +                     s->avbufm_registers[AV_BUF_FORMAT] & DP_NL_VID_FMT_MASK);
>          abort();
>      }
>  
> -- 
> 2.21.3
> 
