Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp54469lfb;
        Fri, 8 May 2020 04:26:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypJHdUfXRdWNMh61K2OJtAxmY5WOLOubJkA1eYly6ggbh5ygIlb4qm9uPIBwJyMZAkjnXqcD
X-Received: by 2002:ac8:c8b:: with SMTP id n11mr1807461qti.49.1588937163101;
        Fri, 08 May 2020 04:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588937163; cv=none;
        d=google.com; s=arc-20160816;
        b=s7e+q0bULHOde90h3FIUPgWNlcE5414LkMQA6w7l7FUU4zITCvzMkSopYuYLm3xmeU
         QOg5zK3coMQ19mz68Tio7h4V+oXI3sozL2qEMXYc2a8Khz6RJfj0qMQItVyfISZnhB6O
         vZ0fBSRFuVABkuwoe0jAT5rIFMvt66tD4e/HbMUAMfXCEEnDUVEFd1syLymtuQcd8TlD
         IfZTsMGut0FE9UiCogQA6bZxRSAFwThWAqsYOhlKwXNXO5y1wyP6N6/EyxVDla2GynQK
         RizbnU2tMcTHImn9vbJLVojLbaQbTB7bTOEDxN/J2BCQYk0z4OYyZLxdesPT2IXoduLm
         emrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=4wxIFEFFmesh6LGjya4OycUIY+KvW3qA6x1ds9U+myY=;
        b=oJDZoyIWfvVljQV8wMAVQh4FHivDe2TBLP9qfkrifqIpc/ts62sSl38Kttb5Gf0hUD
         kFCg6vTGxlk/Yi5BX5NPcHRRSHYceVkuBHwD5wOj33syouQkUhvihmtaEq9yD0/KERhl
         +zlubMeQPWBy/70ojNhF+XMrxwFddtuB0uD7MEc2HddGjFRDhKkyIoC3KqbnbxRvQ56k
         iFy9OeDrlHSiuh/CLG/ivnV7ryvZWxBlifIerN/O4Dizob97UM14mV+WIfQjBiN8VV+c
         BUpzCSu5Pvfg+A/+ryqN45l6mFzJsQQof1F1SeMFc9d+XNluL/avyZlOL4UVt3oiV4bm
         siig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qfphsZKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 200si902512qkk.104.2020.05.08.04.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 04:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qfphsZKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX18k-0007yi-Iy
	for alex.bennee@linaro.org; Fri, 08 May 2020 07:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jX18G-0007Tg-Hw; Fri, 08 May 2020 07:25:32 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jX18F-0003m3-Ir; Fri, 08 May 2020 07:25:32 -0400
Received: by mail-lf1-x144.google.com with SMTP id u4so1126003lfm.7;
 Fri, 08 May 2020 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4wxIFEFFmesh6LGjya4OycUIY+KvW3qA6x1ds9U+myY=;
 b=qfphsZKUbfoGW67/yjJrlxaDFSOgDeRKkYqzMqShesOLrN3B7qBXe/d527fr1fUZkp
 ZTtRcdCWsmiLBK3Ad/rqVRRIRPI9WndlIY/LIkwcmBdWHAvLfiiDl3E96Pi5nRkbFYid
 huWO+IOAJcdk02pIFMo+QfzgSmWJb9XVp4D8J/O75et6hVqjOeEcvMN2STt65PPhx8qU
 tmqpthFQgi9njrzqqo5+YcCO8jU5EE/BCfpvNJs/n430OdkN+tw2x9R5jXSX4P4JobNV
 0xIizdGhXr4DQ3O2mEpdXxBxoQDhcSYpckppyCMJGidlFtmDlDCLhG9ZUZFfcEGwYE3R
 jotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4wxIFEFFmesh6LGjya4OycUIY+KvW3qA6x1ds9U+myY=;
 b=rKaqaFkf+a83q9LPq8YswOK4k59s6JRNMgJe+oa5kbQh2oprNOv4SqLNpMWvg7fLpN
 HVCEGmpZRGnKOYZjzUykFNuut/cpOu9+GQcg6RBfM9rNwv8BUscDSe9MfH+at4pNtGJM
 Fg+OYWPUSzZcpSJiCMbWogEE6lajHgE7fqmlnzyw/FPaur69FeWYgWjCFElqPFo+XFFn
 CbAvfk3iwcsoOujWl+Mkgfd4wyShMhGvVBcUeSLHtQGsS/QGIZcv0MKNotuZTmCA5ssT
 Ar/9UMa/m27AlbJU5ynUlIizC9cMlgh052T9OoUz6U6wapckA81sbaoNOSb0v6P/FmK5
 5bew==
X-Gm-Message-State: AOAM5330hdIeILdP09dQsGtugxBPzTS97xTw6sDtjl4JkbnYX3g5AdzC
 spfDAlj84uRX0C2+TMwXt28=
X-Received: by 2002:ac2:5290:: with SMTP id q16mr1573550lfm.108.1588937128881; 
 Fri, 08 May 2020 04:25:28 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w9sm1003312ljw.39.2020.05.08.04.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 04:25:27 -0700 (PDT)
Date: Fri, 8 May 2020 13:25:12 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v3 01/11] net: cadence_gem: Fix debug statements
Message-ID: <20200508112512.GL5519@toto>
References: <1588935645-20351-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1588935645-20351-2-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588935645-20351-2-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Tong Ho <tong.ho@xilinx.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ramon Fried <rfried.dev@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: psAopw0Nl2nG

On Fri, May 08, 2020 at 04:30:35PM +0530, Sai Pavan Boddu wrote:
> Enabling debug breaks the build, Fix them and make debug statements
> always compilable. Fix few statements to use sized integer casting.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 22a0b1b..5476c62 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -35,14 +35,13 @@
>  #include "sysemu/dma.h"
>  #include "net/checksum.h"
>  
> -#ifdef CADENCE_GEM_ERR_DEBUG
> -#define DB_PRINT(...) do { \
> -    fprintf(stderr,  ": %s: ", __func__); \
> -    fprintf(stderr, ## __VA_ARGS__); \
> -    } while (0)
> -#else
> -    #define DB_PRINT(...)
> -#endif
> +#define CADENCE_GEM_ERR_DEBUG 0
> +#define DB_PRINT(...) do {\
> +    if (CADENCE_GEM_ERR_DEBUG) {   \
> +        qemu_log(": %s: ", __func__); \
> +        qemu_log(__VA_ARGS__); \
> +    } \
> +} while (0)
>  
>  #define GEM_NWCTRL        (0x00000000/4) /* Network Control reg */
>  #define GEM_NWCFG         (0x00000004/4) /* Network Config reg */
> @@ -979,7 +978,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>          size += 4;
>      }
>  
> -    DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
> +    DB_PRINT("config bufsize: %u packet size: %zd\n", rxbufsize, size);
>  
>      /* Find which queue we are targeting */
>      q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
> @@ -992,9 +991,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>              return -1;
>          }
>  
> -        DB_PRINT("copy %u bytes to 0x%" PRIx64 "\n",
> -                 MIN(bytes_to_copy, rxbufsize),
> -                 rx_desc_get_buffer(s, s->rx_desc[q]));
> +        DB_PRINT("copy %" PRIu32 " bytes to 0x%" PRIx64 "\n",
> +                MIN(bytes_to_copy, rxbufsize),
> +                rx_desc_get_buffer(s, s->rx_desc[q]));
>  
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
> @@ -1160,8 +1159,8 @@ static void gem_transmit(CadenceGEMState *s)
>               */
>              if ((tx_desc_get_buffer(s, desc) == 0) ||
>                  (tx_desc_get_length(desc) == 0)) {
> -                DB_PRINT("Invalid TX descriptor @ 0x%x\n",
> -                         (unsigned)packet_desc_addr);
> +                DB_PRINT("Invalid TX descriptor @ 0x%" HWADDR_PRIx "\n",
> +                         packet_desc_addr);
>                  break;
>              }
>  
> -- 
> 2.7.4
> 
