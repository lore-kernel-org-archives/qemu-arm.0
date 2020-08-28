Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1290121lfc;
        Fri, 28 Aug 2020 02:14:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEGZ8tl/S70MhK1ipGWCyA15sjlnRWwGCUfp7nIfJ86m25Z01brOoM2iZe+OgtJjinCJzO
X-Received: by 2002:a25:b443:: with SMTP id c3mr1202399ybg.118.1598606043003;
        Fri, 28 Aug 2020 02:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598606042; cv=none;
        d=google.com; s=arc-20160816;
        b=NzlvwfneUd1VttcicU4J90sAf+4Gq9C4IjyOenc1KEE/UVh1chWbsuzPjhiZ/FItr9
         2/1iOi6HoWtlro/NFGRESM205ZDhno+UQTOwpDUoJrIDfoCZ8GERhiWISY8cDA8zHVdt
         DqW/pPwCfFRLPUshVSdRQ3LrUXoEJftTE6143xbopNVmfCU0MKL9xwU/uBct6DMqIitH
         FY6X8fojAOlu5vTDj4aeLrdXFDXZ0WzfB354m5y0giPhgKhJxVzbLhfPadsfAVhF9caU
         YXz6359RbbbKhLNPBN6mS2lG3VveVzj/GozLlQJtrSOHUOs4JBz60I8tpUh4rXoTOstt
         S/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=lzpGa4fzFjjtQ/eOqsY16yTWO1pQhiEjQfxBNeHjhMA=;
        b=m/NWb8UmvkjyKQB6vciPuArg9y3cQaZPPrUBUAtB61u/CPoVnO9mTxISFgqEBLV1Kq
         BbKTLPDeMDDpnXgBR5VHgbPQXGnYHDFUOXz4c9aTL9Lg0MN1IeC9Ca+2NaInm7D+wQht
         a1zrG4NYUDmDdz5rIcXz+hT9JCUmh3d6VflLjpu6j4WIMAE7L5ETXp1c/+6QNkMhpWCf
         gcZL6Zik2gbJ2E7sYN9t1zPgs1vRifVySB20K03Vs0djk03UWiL4fi7K0WCnLSjbE62N
         xh/1fxNYmjcDoaHfwXGJ+PjmZu8b6mkRPEHQe5Q6h4c4kkKM2UbWcDeHB7E0/fe4X7WZ
         zhpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dVAIGihy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si488910ybk.319.2020.08.28.02.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 02:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dVAIGihy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBaSQ-0008M6-9g
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 05:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kBaRW-0007JX-Ms; Fri, 28 Aug 2020 05:13:07 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kBaRU-0002nx-3I; Fri, 28 Aug 2020 05:13:06 -0400
Received: by mail-lj1-x242.google.com with SMTP id y2so522358ljc.1;
 Fri, 28 Aug 2020 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lzpGa4fzFjjtQ/eOqsY16yTWO1pQhiEjQfxBNeHjhMA=;
 b=dVAIGihy+pi2OCiGd6smqz1eI7RnH3OHFQmTN59cmJFckIQYZlY3WXXSGOO6V3CJMb
 Ur/Nc+WJtOqv+p3rIBGj1qFH5hKUIlVx+ScZGVM0eqHm8/hW4PPjYRuv7VK0nx7ME8KS
 SQEa2m3yhMKdcf+aDcgXKPBYEZ5fqZhJHMzuoin4xZGrYeUyN9JuDm+DSDL8L/cvlqOV
 XXqhP5Ju4YxKkshgs7DbD/jei5lmO2eqCJNRnEb9rCdcpyHEM2SmLe0MPv+XONkBRsIh
 N3XfFG4W0ys530V4P97O5+6ovNBBJtqS9zUX62LEPval/i/w37ZqWF8+Xrx69XNb6i1B
 F7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lzpGa4fzFjjtQ/eOqsY16yTWO1pQhiEjQfxBNeHjhMA=;
 b=eeRJCvnPy9caLPT7+SB0TyAHI5nPgYmBP6zm2sWH8n9Pr93/4nhv4qjHUEkEqFYHCD
 lthubaF5zU8HrA2KgvhBsqHKbXS0vKpNjtEOVo330TLIFNwQ6ixVL+HZI7qJqA2XRqo0
 AjcYQDUgxME73V33hVNrIGcb8VJ6OndDVHT3CTc9gbY5AumRqjI3y/pPkZ4mz22TwL99
 +0zlwUm5G3GA+EuNJKfjX38eWRVNLGyhxVowpDzSZII2pWb2GdRYiouSpgoo7t2Qg5i/
 UC/ZySaIg+Y5F7o1JdL9LRyGjitnUDoQvIJVB0vAaaIkzTasVcjQYhoCNulf5zgUfUnF
 8jeg==
X-Gm-Message-State: AOAM531JuIQ68KeGndYIPAMKHMetGfoIQ0lZkxHEkdiJtxeqhXxnO6gB
 2jzzesAGSe2ek5cBlhGrSBM=
X-Received: by 2002:a2e:3207:: with SMTP id y7mr446055ljy.302.1598605981300;
 Fri, 28 Aug 2020 02:13:01 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b28sm153576lff.85.2020.08.28.02.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 02:13:00 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:12:59 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/2] util/hexdump: Convert to take a void pointer
 argument
Message-ID: <20200828091259.GS2954729@toto>
References: <20200822180950.1343963-1-f4bug@amsat.org>
 <20200822180950.1343963-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200822180950.1343963-2-f4bug@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=3.899, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, Zhang Chen <chen.zhang@intel.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fZLEiUbYEOCM

On Sat, Aug 22, 2020 at 08:09:49PM +0200, Philippe Mathieu-Daudé wrote:
> Most uses of qemu_hexdump() do not take an array of char
> as input, forcing use of cast. Since we can use this
> helper to dump any kind of buffer, use a pointer to void
> argument instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>




> ---
> Since v1:
> - renamed argument 'bufptr' (Peter Maydell)
> ---
>  include/qemu-common.h    |  3 ++-
>  hw/dma/xlnx_dpdma.c      |  2 +-
>  hw/net/fsl_etsec/etsec.c |  2 +-
>  hw/sd/sd.c               |  2 +-
>  hw/usb/redirect.c        |  2 +-
>  net/colo-compare.c       | 12 ++++++------
>  net/net.c                |  2 +-
>  util/hexdump.c           |  4 +++-
>  8 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index bb9496bd80f..6834883822f 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -138,7 +138,8 @@ int os_parse_cmd_args(int index, const char *optarg);
>   * Hexdump a buffer to a file. An optional string prefix is added to every line
>   */
>  
> -void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
> +void qemu_hexdump(const void *bufptr, FILE *fp,
> +                  const char *prefix, size_t size);
>  
>  /*
>   * helper to parse debug environment variables
> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
> index b40c897de2c..d75a8069426 100644
> --- a/hw/dma/xlnx_dpdma.c
> +++ b/hw/dma/xlnx_dpdma.c
> @@ -388,7 +388,7 @@ static void xlnx_dpdma_dump_descriptor(DPDMADescriptor *desc)
>  {
>      if (DEBUG_DPDMA) {
>          qemu_log("DUMP DESCRIPTOR:\n");
> -        qemu_hexdump((char *)desc, stdout, "", sizeof(DPDMADescriptor));
> +        qemu_hexdump(desc, stdout, "", sizeof(DPDMADescriptor));
>      }
>  }
>  
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index 7035cf4eb97..c817a28decd 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -357,7 +357,7 @@ static ssize_t etsec_receive(NetClientState *nc,
>  
>  #if defined(HEX_DUMP)
>      fprintf(stderr, "%s receive size:%zd\n", nc->name, size);
> -    qemu_hexdump((void *)buf, stderr, "", size);
> +    qemu_hexdump(buf, stderr, "", size);
>  #endif
>      /* Flush is unnecessary as are already in receiving path */
>      etsec->need_flush = false;
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index fad9cf1ee7a..190e4cf1232 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1781,7 +1781,7 @@ send_response:
>      }
>  
>  #ifdef DEBUG_SD
> -    qemu_hexdump((const char *)response, stderr, "Response", rsplen);
> +    qemu_hexdump(response, stderr, "Response", rsplen);
>  #endif
>  
>      return rsplen;
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 417a60a2e68..09edb0d81c0 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -240,7 +240,7 @@ static void usbredir_log_data(USBRedirDevice *dev, const char *desc,
>      if (dev->debug < usbredirparser_debug_data) {
>          return;
>      }
> -    qemu_hexdump((char *)data, stderr, desc, len);
> +    qemu_hexdump(data, stderr, desc, len);
>  }
>  
>  /*
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 2c20de1537d..550272b3baa 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -494,9 +494,9 @@ sec:
>          g_queue_push_head(&conn->secondary_list, spkt);
>  
>          if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE)) {
> -            qemu_hexdump((char *)ppkt->data, stderr,
> +            qemu_hexdump(ppkt->data, stderr,
>                          "colo-compare ppkt", ppkt->size);
> -            qemu_hexdump((char *)spkt->data, stderr,
> +            qemu_hexdump(spkt->data, stderr,
>                          "colo-compare spkt", spkt->size);
>          }
>  
> @@ -535,9 +535,9 @@ static int colo_packet_compare_udp(Packet *spkt, Packet *ppkt)
>          trace_colo_compare_udp_miscompare("primary pkt size", ppkt->size);
>          trace_colo_compare_udp_miscompare("Secondary pkt size", spkt->size);
>          if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE)) {
> -            qemu_hexdump((char *)ppkt->data, stderr, "colo-compare pri pkt",
> +            qemu_hexdump(ppkt->data, stderr, "colo-compare pri pkt",
>                           ppkt->size);
> -            qemu_hexdump((char *)spkt->data, stderr, "colo-compare sec pkt",
> +            qemu_hexdump(spkt->data, stderr, "colo-compare sec pkt",
>                           spkt->size);
>          }
>          return -1;
> @@ -578,9 +578,9 @@ static int colo_packet_compare_icmp(Packet *spkt, Packet *ppkt)
>          trace_colo_compare_icmp_miscompare("Secondary pkt size",
>                                             spkt->size);
>          if (trace_event_get_state_backends(TRACE_COLO_COMPARE_MISCOMPARE)) {
> -            qemu_hexdump((char *)ppkt->data, stderr, "colo-compare pri pkt",
> +            qemu_hexdump(ppkt->data, stderr, "colo-compare pri pkt",
>                           ppkt->size);
> -            qemu_hexdump((char *)spkt->data, stderr, "colo-compare sec pkt",
> +            qemu_hexdump(spkt->data, stderr, "colo-compare sec pkt",
>                           spkt->size);
>          }
>          return -1;
> diff --git a/net/net.c b/net/net.c
> index bbaedb3c7a6..f3e5d533fd7 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -636,7 +636,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
>  
>  #ifdef DEBUG_NET
>      printf("qemu_send_packet_async:\n");
> -    qemu_hexdump((const char *)buf, stdout, "net", size);
> +    qemu_hexdump(buf, stdout, "net", size);
>  #endif
>  
>      if (sender->link_down || !sender->peer) {
> diff --git a/util/hexdump.c b/util/hexdump.c
> index f879ff0ad6b..053f05d4160 100644
> --- a/util/hexdump.c
> +++ b/util/hexdump.c
> @@ -16,8 +16,10 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  
> -void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
> +void qemu_hexdump(const void *bufptr, FILE *fp,
> +                  const char *prefix, size_t size)
>  {
> +    const char *buf = bufptr;
>      unsigned int b, len, i, c;
>  
>      for (b = 0; b < size; b += 16) {
> -- 
> 2.26.2
> 
