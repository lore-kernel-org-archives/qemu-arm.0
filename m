Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp298809lfi;
        Thu, 2 Apr 2020 23:52:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpEv7jsJeBpncxNLP/X0UqzNqbbKFjKjICw0rbil+XGerFe4f0jqDvpZCkIYeh+NjZpdft
X-Received: by 2002:a37:a88e:: with SMTP id r136mr7441314qke.12.1585896724526;
        Thu, 02 Apr 2020 23:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585896724; cv=none;
        d=google.com; s=arc-20160816;
        b=UXtkX4qqW0tiGZuxRzESG1IbIDmfzwKfNiUd5hhdguhZNu2wOfmfvsDl7qp8JlZKbY
         0Crso7RuUerMbD3kaWMuMxaZfSKUSYkNZFir/cTAzbpMwrShasR+8f8jidukv1LY5XWi
         t0Jmss5X1x3hFwdzQ2FuO7GFe4uaVTUDBfSM1lCcagq59PrFgk+i1/yz/M5hFkBqc+H0
         aZ0O2cs2cUHpdtn40mSisCekmZ5ZwAxWNIEB4tUoWQjrHnyILHpBjiS4fSXuZ5XtAaRr
         SduCQR0u9QNuoL9Mjou92a0ZtEf8t1I7nMFWH5NMOQ+YCjoywAU+vg1xGf8AczkDROt7
         Vajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=slzYGb+v5/dk7IKPCVP3MLpXBHHlWFIEKQjlrIrF0c0=;
        b=D3oDTB3Z4b6cv5lc5rGRte8ZNyKDvlU77vxT3hahiYjIJori1PerAMZBEXRWhbY30E
         NL1ermlNd2RxdcWXTuGLcBnfQtiepYJ92Oja7k6KebljlLcW5J9wzThQ5Fi5ECNshbun
         A9fGRAKzq8ZHDGxPSgI309gx4LhehnGZlF5uhH5/SEcqhaUgU7PtmhWmR/DN1BF7BoTh
         ObENCK8OSU30VL2aB8M80YGoWNdK8Y6+iKCC6r8Zisfik0nPKJMlaXP/ZNkyQfxDjHfB
         1bNEj8h4ZElB6nrpy2KFhrqz2qQGSpJ6EeI8QMUgZC2nk0uxCHWtMu+fSA8GPCaAhuFx
         AjHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="FF/0agqa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p124si1173458qke.295.2020.04.02.23.52.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 23:52:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="FF/0agqa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKGBP-0004eX-WB
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 02:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKGA4-0002lA-UF
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 02:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1jKGA3-0002i4-OC
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 02:50:40 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:38183)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1jKGA1-0002dH-4g; Fri, 03 Apr 2020 02:50:37 -0400
Received: by mail-lf1-x141.google.com with SMTP id c5so4871785lfp.5;
 Thu, 02 Apr 2020 23:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=slzYGb+v5/dk7IKPCVP3MLpXBHHlWFIEKQjlrIrF0c0=;
 b=FF/0agqaVocaewikiG32abS/2mK/L00908lFmlV/SUouPIzROtTIzivtqTO3JalVoB
 q7BWFot06Rk0pTj9L8XW3POL3TPPl/3ornDCVGm1N19PGABFaNdv8OgmFtpJtdpkKGZl
 A/8KhL0RXt5oZ+sMxRUhO2wOADmx4bP5s9VXeOVNJz//m2JOl7HIIXHLIiZSogf9gYwi
 5NXP19PbH1GQpxChecL5qBSPZKiqRnrdP54EkGxdQ7gbEcWomJaT/MqVUM4WrBX/xzSe
 G1gikpBmzIsNMhwcb5cS5+cnOqhomKmyTSm00ZQsUcXS2A0w2vPstx6Ed/8SH2bj4xkh
 ZGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=slzYGb+v5/dk7IKPCVP3MLpXBHHlWFIEKQjlrIrF0c0=;
 b=oUtFBmd8Pbbta1xuL25dnVuBOH7f8J65E/Qt4kWNLMuKylyEfXHHizAGZvzAgnPT/j
 YgwAOICTo4UGwvbPlHWTEl9tG8WtPw27pRGYuePZVUivrsoMXcIhk67DUw+PWm9v1FHY
 etXwsF/7QmD1U1x6yRxPRvfDMcQQvhylygGvRvsKmZ3qc+j4o7U98RVPjDJtZ5MHxHOE
 P37/SK0KnHwBFc2KVXCquCDEQsrHZ2zO37o9Vn6Gueh/N7GRaWK4zC9u23kPk5VcTN0X
 mVpwPS+rT23xoAARGerIIrewvoZYP6v3HxBWiGLqNO8tEXAWhrtUZ+H0Eh19RdgOPWfC
 PuNA==
X-Gm-Message-State: AGi0Pub04mr/O4UygUCeQb0rxkjocE2OAr9CuzBHjODB8C2wYKB2BK3O
 5m6QxJ16ZYAJWC17DzXcu1Q=
X-Received: by 2002:ac2:545a:: with SMTP id d26mr4560260lfn.85.1585896635977; 
 Thu, 02 Apr 2020 23:50:35 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 d8sm4807916lfm.28.2020.04.02.23.50.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 23:50:35 -0700 (PDT)
Date: Fri, 3 Apr 2020 08:50:33 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 5/5] dma/xlnx-zdma: Reorg to fix CUR_DSCR
Message-ID: <20200403065032.b6g6onhvvkvhfx5w@fralle-msi>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-6-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402134721.27863-6-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org, philmd@redhat.com,
 luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jcocj6knhQQC

On [2020 Apr 02] Thu 15:47:21, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Reorganize the descriptor handling so that CUR_DSCR always
> points to the next descriptor to be processed.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/dma/xlnx-zdma.c | 47 ++++++++++++++++++++++------------------------
>  1 file changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index e856d233f2..1c45367f3c 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -333,10 +333,28 @@ static void zdma_load_src_descriptor(XlnxZDMA *s)
>      }
>  }
>  
> +static void zdma_update_descr_addr(XlnxZDMA *s, bool type,
> +                                   unsigned int basereg)
> +{
> +    uint64_t addr, next;
> +
> +    if (type == DTYPE_LINEAR) {
> +        addr = zdma_get_regaddr64(s, basereg);
> +        next = addr + sizeof(s->dsc_dst);
> +    } else {
> +        addr = zdma_get_regaddr64(s, basereg);
> +        addr += sizeof(s->dsc_dst);
> +        address_space_read(s->dma_as, addr, s->attr, (void *) &next, 8);
> +    }
> +
> +    zdma_put_regaddr64(s, basereg, next);
> +}
> +
>  static void zdma_load_dst_descriptor(XlnxZDMA *s)
>  {
>      uint64_t dst_addr;
>      unsigned int ptype = ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, POINT_TYPE);
> +    bool dst_type;
>  
>      if (ptype == PT_REG) {
>          memcpy(&s->dsc_dst, &s->regs[R_ZDMA_CH_DST_DSCR_WORD0],
> @@ -349,24 +367,10 @@ static void zdma_load_dst_descriptor(XlnxZDMA *s)
>      if (!zdma_load_descriptor(s, dst_addr, &s->dsc_dst)) {
>          ARRAY_FIELD_DP32(s->regs, ZDMA_CH_ISR, AXI_RD_DST_DSCR, true);
>      }
> -}
> -
> -static uint64_t zdma_update_descr_addr(XlnxZDMA *s, bool type,
> -                                       unsigned int basereg)
> -{
> -    uint64_t addr, next;
>  
> -    if (type == DTYPE_LINEAR) {
> -        next = zdma_get_regaddr64(s, basereg);
> -        next += sizeof(s->dsc_dst);
> -        zdma_put_regaddr64(s, basereg, next);
> -    } else {
> -        addr = zdma_get_regaddr64(s, basereg);
> -        addr += sizeof(s->dsc_dst);
> -        address_space_read(s->dma_as, addr, s->attr, &next, 8);
> -        zdma_put_regaddr64(s, basereg, next);
> -    }
> -    return next;
> +    /* Advance the descriptor pointer.  */
> +    dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3, TYPE);
> +    zdma_update_descr_addr(s, dst_type, R_ZDMA_CH_DST_CUR_DSCR_LSB);
>  }
>  
>  static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
> @@ -387,14 +391,7 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
>          dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
>                                SIZE);
>          if (dst_size == 0 && ptype == PT_MEM) {
> -            uint64_t next;
> -            bool dst_type = FIELD_EX32(s->dsc_dst.words[3],
> -                                       ZDMA_CH_DST_DSCR_WORD3,
> -                                       TYPE);
> -
> -            next = zdma_update_descr_addr(s, dst_type,
> -                                          R_ZDMA_CH_DST_CUR_DSCR_LSB);
> -            zdma_load_descriptor(s, next, &s->dsc_dst);
> +            zdma_load_dst_descriptor(s);
>              dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
>                                    SIZE);
>          }
> -- 
> 2.20.1
> 
