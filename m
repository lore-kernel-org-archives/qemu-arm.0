Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4462923njd;
        Fri, 25 Apr 2025 08:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfu0kbcPFbysadLMk8K4fL/U35+tSrOBKsBy0tUN1XpCTTgpGeb2obLGGJWy0EOVwdVvguUHnRHb/x7A==@linaro.org
X-Google-Smtp-Source: AGHT+IF3ArdekJqIRz+Cn0lGTytU/hMJBdPEi0qWFfPHtYs5FplaNgtlcA/8N2wMz+H/dd+wxgCR
X-Received: by 2002:a05:620a:460a:b0:7c5:562d:cd01 with SMTP id af79cd13be357-7c9606f9a48mr410090885a.16.1745596093817;
        Fri, 25 Apr 2025 08:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745596093; cv=none;
        d=google.com; s=arc-20240605;
        b=SV58RSU2kK9AbjvzCaLBVjDeYZg5f6eHizHYIRO1DOvbnqrwQTc03RPJOxLzkphG/x
         maBqHpnkv4MpravXuHHi+x3Q/QnQ8UX9JrGf7xhQ6dE5Jm/MwMrMinZ0C7+Nuj3q6VDu
         c78l5ORW/1dZ3JoWmG2C+stm+X+9mUkEYCOAufOnV3H+QVjE6yOab2zSsvES0fxd0ugv
         RvKkDIouHLke81nfPfEUCj4t1R+OF3X/Nf8kcIJYWQIa8yCQGyZgU7sSh/7thg6DUOjG
         YuVEaxuCai6XkRUInxlrdN4wCm3Jm7d3vTpTFiYbH1x2eCZIEnwJv8n2OE5NJTDWLnOu
         NHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=TD0OKDcCaiAswy6HglxZHt8Day9EbdbBZOq4RAiN9EM=;
        fh=BsGZ9ydO1Y8yjuc/cpAZqV8ram6rVFtJ7GWWoSwVR50=;
        b=O+CRqjg+2HjZDK4EC0m64hhKrlXpe1IOTaybthwYd/RAIp1XQILXtNG9vGpRifjPcx
         KFUfi5jc5dn1MqD7LgMKLqFh/mtIbMUYvgTVVmo+X7vgxGWJQ4qwJ4Ooh9vlIXCg/M4H
         Gv2CvHj7XkU/T2Xew6YkEX1Qt+eHNT0IIImisWKCyMf48p52xehBmmP3wTEFZZtfYN17
         aZQ5DlaPhzcXFd6WL4JrNs5PchFs34+fmp2R8QxI7roZfmatNI1e+6riqE/NtKOmRxSx
         BZGQLcDaMKHVAEaw2uzgGjHiT5479ck1DcTIbxGw6So/5MbrPv+rz1MDHP8IjqHILHvc
         MpVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1ewB57g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958d872b7si406662285a.217.2025.04.25.08.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 08:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1ewB57g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u8LHN-0006FM-5j; Fri, 25 Apr 2025 11:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u8LHI-0006AT-SG; Fri, 25 Apr 2025 11:47:48 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u8LHG-0006Es-Ms; Fri, 25 Apr 2025 11:47:48 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54d98aa5981so2881958e87.0; 
 Fri, 25 Apr 2025 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745596064; x=1746200864; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TD0OKDcCaiAswy6HglxZHt8Day9EbdbBZOq4RAiN9EM=;
 b=P1ewB57g9pkv2PW2xGfOI9D/tlW+ptmYfHWk7r6FYF/6GqbxDRSiyr6bZXZi4pt92O
 NdREP1a7mT/TNVXkLOmc/C3/JDAb3LTm/0z+8t+eXCQyfdHvXXMKZ2hePQjbEkSE8FHn
 XU2mzUJi4Tp5BTQPLq8cL+lxTuhscfjEZG5584OsvbS4JuFAgWwEJc94Ml/l1K4qdqvB
 5JX2um52iBV2TCboQBkN5ewq7ULiTRmPAGGrKTlNyLUuXAWeb2Fu82Y9LZgWra7lDqwp
 yv1Xb8sd7UzwqJr0dmTIGH8bj3fZjvZTGNH7LQUutzp6LoCbUudlJ3+OMxaurZZjApOM
 ZudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745596064; x=1746200864;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TD0OKDcCaiAswy6HglxZHt8Day9EbdbBZOq4RAiN9EM=;
 b=qyh+BiHqQNARMCk4q4vgiDQ2WmGVyklLw95tBUcFI0muKWZmUwoopawcPvnmvDwtIV
 6oeA8HCRCnKzK+cMsFDQt1L+004oYyIf1hF/fGMr6sY86ojlJuGnLPyB8iY20agevTE3
 vyB2w1xwyVgQTUd/JJExQtsfyfVHnZ+1JxyncYDH/9d9K2O79g/iUqBkxeQ2moskyR26
 t9T7KeCw60Mn3z0+9si8UrWuGRlFi65uck7hWjrWTj8VbdUMtjrVi3CDL3q9mbriYqf4
 hV370xnFzc1xdvIWufil2fKXQ/8FrolFT0jrgRlUcpJptpbY+pFu0WV2fQdjfZQrkRui
 YTQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfl2gewXtwZRTCAqVqNg8ljiKMVoBZ7NJ+Pv5HU0LPWCd7qEANcaORmXKs0/UEB0B8jOllnWVniA==@nongnu.org
X-Gm-Message-State: AOJu0YyLB4HDlDLRPdXFH4luG4+ybR8qP8ZeRd1RwiQQpfo7YPcqRBsB
 SM4z7OtgY/m2naLcV2AEprnIeR3yApW1F1cgEJ0oVjB4J0kMO+I0SBUh+Qb2KZQ=
X-Gm-Gg: ASbGncv24qGYjKgPk7y8BxLqyU6E3pt662iFgzSO/9iRTcziRfhL+dvKg3UTZb6QCrR
 I0xl4PHUKoLJ262L0xTxWghN5AGS+bCPKgjW0ydSn7yq7XRqdDqerw0fndDw/0QTzr+RbwQ74YB
 qpdnTK1M1PqmND+O3HzdmOJQHRabmVcL0DBHsvf697kFwcxFl20D/SnA/DNg7/oQ++NLVA3XCdu
 Mv5ZZGoObJ9gw2rjfg9kuWXHA92WCryhPOPFN7UbwY0sSGc0/YQVwYl4/I8aivom0sJVEdgJW+o
 tjPshGdpXMKWAeWTcGD6kQI6je75mX7XjHvkOCzWbGyZJ9vKHZQaw2GMyA0CnZnFANDnbKcDxpa
 84OW0zKr0tSn6
X-Received: by 2002:a05:6512:2344:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54e8cbce6dcmr948694e87.22.1745596063488; 
 Fri, 25 Apr 2025 08:47:43 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cc9ea2csm642135e87.148.2025.04.25.08.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 08:47:42 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:47:42 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Corvin =?iso-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Yannick =?iso-8859-1?Q?Vo=DFen?= <y.vossen@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Corvin =?iso-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/21] hw/dma/zynq-devcfg: Handle bitstream loading via
 DMA to 0xffffffff
Message-ID: <aAuunovjQLKz5koi@zapote>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
 <20250318130817.119636-4-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318130817.119636-4-corvin.koehne@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x130.google.com
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
X-TUID: sR3s17jbe7Ue

On Tue, Mar 18, 2025 at 02:07:54PM +0100, Corvin Kˆhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> A DMA transfer to destination address `0xffffffff` should trigger a
> bitstream load via the PCAP interface. Currently, this case is not
> intercepted, causing loaders to enter an infinite loop when polling
> the status register.
> 
> This commit adds a check for `0xffffffff` as the destination address.
> If detected, the relevant status register bits (`DMA_DONE`,
> `DMA_P_DONE`, and `PCFG_DONE`) are set to indicate a successful
> bitstream load. If the address is different, the DMA transfer proceeds
> as usual. A successful load is indicated but nothing is actually
> done. Guests relying on FPGA functions are still known to fail.
> 
> This feature is required for the integration of the Beckhoff
> CX7200 model.

Thanks, LGTM:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> 
> Signed-off-by: Yannick Voﬂen <y.vossen@beckhoff.com>
> ---
>  hw/dma/xlnx-zynq-devcfg.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
> index 0fd0d23f57..b838c1c0d0 100644
> --- a/hw/dma/xlnx-zynq-devcfg.c
> +++ b/hw/dma/xlnx-zynq-devcfg.c
> @@ -247,7 +247,14 @@ static uint64_t r_lock_pre_write(RegisterInfo *reg, uint64_t val)
>  static void r_dma_dst_len_post_write(RegisterInfo *reg, uint64_t val)
>  {
>      XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
> -
> +    if ((s->regs[R_DMA_DST_ADDR]) == 0xffffffff) {
> +        DB_PRINT("bitstream loading detected\n");
> +        s->regs[R_INT_STS] |= R_INT_STS_DMA_DONE_MASK |
> +                                R_INT_STS_DMA_P_DONE_MASK |
> +                                R_INT_STS_PCFG_DONE_MASK;
> +        xlnx_zynq_devcfg_update_ixr(s);
> +        return;
> +    }
>      s->dma_cmd_fifo[s->dma_cmd_fifo_num] = (XlnxZynqDevcfgDMACmd) {
>              .src_addr = s->regs[R_DMA_SRC_ADDR] & ~0x3UL,
>              .dest_addr = s->regs[R_DMA_DST_ADDR] & ~0x3UL,
> -- 
> 2.49.0
> 
