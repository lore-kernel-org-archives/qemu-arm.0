Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp446858njc;
        Wed, 13 Nov 2024 07:29:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlq+uV4cIwWAY6Bve9whz2MmoYgI9ZoJrGALfthpg/X73CyyXZ7sRNJqmnCCGmLUGviDwVYrgXUVotrA==@linaro.org
X-Google-Smtp-Source: AGHT+IG++lFsczAkv1xz+TMzDyaGvfaxC2428srsi/mG0IFcCx4UZgZ5vXVAOBR3bzdbpIb9F4pu
X-Received: by 2002:a05:620a:240f:b0:7b1:572a:cd24 with SMTP id af79cd13be357-7b331e71e0bmr2727381885a.10.1731511739963;
        Wed, 13 Nov 2024 07:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731511739; cv=none;
        d=google.com; s=arc-20240605;
        b=PZY1Nd0urwDScOabi49UkTbIPgP8PpniUkW7PGQFXIVSEPWFLk7vJXNLtAjYY2tlhR
         1F1sOfhpUNUm0m8T8j+AxcThK0cNnppjY5tHSKHvNhODdfMKsBWKEeVD+rdENzEDJqZN
         0QG07/mv2uGmsxJgrviG04N5epFmT4L4mOO54Q2bwAB1xIKId2P5P9Qs/HRWY5Uqcn5b
         +BSGCWzCVRc5ZTNuZZv8s01JZv462YxfTYanmWxHzMSCmW4qA+NUo7H4pttjYAYb3q1k
         8u+w9vXPud872sYXgNKpcVvicpZGOXtjyfJvYrIugOkmx0A1M5+bTYH4Z4CO6Vq+T5v5
         Lj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=nhKPxld9b8QXJGZ23DGMD/hzGozfqQxdhndePbAYup8=;
        fh=WRrPI6K8sXBsN1tNbkOh+r8iQZjAGnHJ6ySlKBUqsxk=;
        b=jcdGFQv++OHWdt/CM/FeiF8TQ+7Xf3ahtjZKU6S47EA+yiurhcNW2KhORDnPjLqMKZ
         1OiNnQ3/3OeaB5+PKwyAgkVnrR7JQ5XW/f4mQMEGNA6JjOsPsOz9+phxAfnr/0UuW6TA
         uu352QWiQ/pdYBcfNd8F3F52WpiG6GWYz6OTd0IIo2G0OgY6LeqSdukloe90Cuw+OXeW
         XCBBLyWicFasR+L770VxsT0X9Dkr3OUZnikKvhUdkg3TP1vvYdB9kThXeZT+PRt2n6sE
         UtelER2bxKfP8MB/FnK85DZS5IRnOg2gbdv5XvRacImNZGzez65oj9TA16oYhCIpIapZ
         Y6YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xy5x7wU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b358553803si49076085a.579.2024.11.13.07.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xy5x7wU7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBFIZ-00016A-G7; Wed, 13 Nov 2024 10:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBFIW-00015e-Of; Wed, 13 Nov 2024 10:28:48 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBFIU-0007gQ-J9; Wed, 13 Nov 2024 10:28:48 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539fe02c386so806290e87.0; 
 Wed, 13 Nov 2024 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731511724; x=1732116524; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nhKPxld9b8QXJGZ23DGMD/hzGozfqQxdhndePbAYup8=;
 b=Xy5x7wU7nNkycfFyWf6ETMAJK59xb8dWRsiVmmPbYoMH9AXc3Ku8nDWhMFtqUV7RsA
 X5TbiMLh4abE4T+oLLlviCKM2uw41yvD7R5rUD8uRnX5Otn7cLLumclNY18NYDpphiKj
 n+7I0Iy6l/x6guYFIg4RG6kDV9q9rm0Rz5eaJKUXqz10AsJoa3dQWr60sGS8F/t0GPOA
 nOfaCI3KPEgyTH+gOZoSjfBci9RyNSahVXk7sxdKCAfA5BDi1cKR4U+hGbTD7TbWJykj
 wu+lZ4vTp00tR/oi2k6QE30QMOALpsAkkhmrUKtZdd6o/6irF2yUctXPbv0LXlWwQDX+
 VVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731511724; x=1732116524;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhKPxld9b8QXJGZ23DGMD/hzGozfqQxdhndePbAYup8=;
 b=pbYVHSF7wNfOhO8+rqeePDcVmROmG778fpF4p7OLZ2XTNb0+4FbZo+x5YdYlOuUrZx
 ukLdIl15p2EOHRsaNT0pZ8kv2skoDl+jzZXek6ydP0ziQrYItoKH5MOU3D/M3CLDchDa
 qPjUEmmyPf3dDV5ez8jfDyQmRfyuVY6TCxdmn+CiNAUxRBH63Nt0iOsnZJNWJKUys9Bp
 ikYmXXTjgf1+uNh5wgiBOQr2LKkaN+u0Wrk1igb9o262qrIykSLbKHlMLERNRN9HP3Mz
 jTkkheSrEH0cXsdWAxjE98JjtW5EQzZAjQdWeTHCmEbKcR4f/XFRsKZ0vI3b+HEz9jCq
 lVyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUewW1jp+tolVX3Ifh8wqmWk7mcH35ob6/AyXRRwSYm9vkNjFn065BZINFLAml1CEGk8ryutlrD1g==@nongnu.org
X-Gm-Message-State: AOJu0YxL2+OPaGsmnE/bKy+FRwN6ZKZSx1/+TEusQ/+PzvOqlXfVBir8
 /5g2TSPJmoOmeHv3FOYx2vkOXsHWqCshU8KYghD+noHtjuqa3hSz
X-Received: by 2002:a05:6512:159c:b0:53d:a245:2936 with SMTP id
 2adb3069b0e04-53da24529f6mr755214e87.12.1731511724296; 
 Wed, 13 Nov 2024 07:28:44 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d8268577esm2225950e87.70.2024.11.13.07.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:28:43 -0800 (PST)
Date: Wed, 13 Nov 2024 16:28:42 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 14/20] hw/net/xilinx_ethlite: Access TX_CTRL register for
 each port
Message-ID: <ZzTFqk2iq3IYeyUF@zapote>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-15-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112181044.92193-15-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jf7zjsSFDN/s

On Tue, Nov 12, 2024 at 07:10:38PM +0100, Philippe Mathieu-Daudé wrote:
> Rather than accessing the registers within the mixed RAM/MMIO
> region as indexed register, declare a per-port TX_CTRL. This
> will help to map the RAM as RAM (keeping MMIO as MMIO) in few
> commits.
> 
> Previous s->regs[R_TX_CTRL0] and s->regs[R_TX_CTRL1] are now
> unused. Not a concern, this array will soon disappear.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/net/xilinx_ethlite.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 1a3b295b4b..4d86851f38 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -64,6 +64,7 @@ typedef struct XlnxXpsEthLitePort
>      struct {
>          uint32_t tx_len;
>          uint32_t tx_gie;
> +        uint32_t tx_ctrl;
>  
>          uint32_t rx_ctrl;
>      } reg;
> @@ -139,7 +140,7 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
>  
>          case R_TX_CTRL1:
>          case R_TX_CTRL0:
> -            r = s->regs[addr];
> +            r = s->port[port_index].reg.tx_ctrl;
>              break;
>  
>          case R_RX_CTRL1:
> @@ -159,7 +160,6 @@ eth_write(void *opaque, hwaddr addr,
>  {
>      XlnxXpsEthLite *s = opaque;
>      unsigned int port_index = addr_to_port_index(addr);
> -    unsigned int base = 0;
>      uint32_t value = val64;
>  
>      addr >>= 2;
> @@ -167,24 +167,23 @@ eth_write(void *opaque, hwaddr addr,
>      {
>          case R_TX_CTRL0:
>          case R_TX_CTRL1:
> -            if (addr == R_TX_CTRL1)
> -                base = 0x800 / 4;
> -
>              if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
>                  qemu_send_packet(qemu_get_queue(s->nic),
>                                   txbuf_ptr(s, port_index),
>                                   s->port[port_index].reg.tx_len);
> -                if (s->regs[base + R_TX_CTRL0] & CTRL_I)
> +                if (s->port[port_index].reg.tx_ctrl & CTRL_I) {
>                      eth_pulse_irq(s);
> +                }
>              } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
>                  memcpy(&s->conf.macaddr.a[0], txbuf_ptr(s, port_index), 6);
> -                if (s->regs[base + R_TX_CTRL0] & CTRL_I)
> +                if (s->port[port_index].reg.tx_ctrl & CTRL_I) {
>                      eth_pulse_irq(s);
> +                }
>              }
>  
>              /* We are fast and get ready pretty much immediately so
>                 we actually never flip the S nor P bits to one.  */
> -            s->regs[addr] = value & ~(CTRL_P | CTRL_S);
> +            s->port[port_index].reg.tx_ctrl = value & ~(CTRL_P | CTRL_S);
>              break;
>  
>          /* Keep these native.  */
> -- 
> 2.45.2
> 
