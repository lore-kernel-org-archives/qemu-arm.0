Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4465242njd;
        Fri, 25 Apr 2025 08:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXbqHsQd2g4EW5KuIvdmjrxXJx3fZngPD0NvCm8AX9D/wi6w++0KcV8AnnO+UPLINGQ4WYSl128hUMVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGG4EUfItpFSFWtIgf7LhOBQVDYNt66fFLlCU+QbRcO4mLu1rl4+Q/gimB1uhl+2MahRMoD
X-Received: by 2002:a05:6214:d65:b0:6f4:ca47:af99 with SMTP id 6a1803df08f44-6f4ca47b146mr57717746d6.8.1745596356570;
        Fri, 25 Apr 2025 08:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745596356; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4/orWcLZgNvDAQORMpSDO9khSqYFtU4UkLE6p7Ce5hJAjTSYPEGjJsiybenhpPFk7
         dUKnIuCjsPmQSunayJK3cM8TaDRScumSd7lD+lum5HsjWofnLGDpXaxaAL4KpI2xpcRn
         37Ng8x99zQIh/et1EmsJpxrHVXNVAwcD1g3dS6ZSV3eozdNT3tNEZj9adZFRgBmhk9z8
         oe/6A2rpuDkmS0FGvobUvZcd3Rw2LkyVTQbIC25Tuz2c9ZKCiAGY4LGRlVjQPqD0SRvi
         rZL5Df5SwT/3/anNjq7WyjT+ZdWitymIYVxJomsL/UTtxPLA4BoJTvOf9JXQId0OkYRu
         gzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=7c8bi+tYxGd3uDu+5jaT9Zf7rx1GDd9V54uFLw7R+Qs=;
        fh=GDQRtm3X074Z5INTT7IunNRkXwcHzz/dWdwN2kSal8s=;
        b=j/Oh3m7o3OHl4ShMLMd8fXAZOGVKkaRdcZyeYchrsnqkPEwDRVtLv4M+KPcVpPNzXt
         zE62D65BMWwwb/YJ1sHZCxUltd95WH8ot5VKuD+epF1Wqi3CqaCCR4fT9iGdFevyKzO0
         RfF9btLKpkFCYwIzylfDdi4Aq40GpJfu9FmDi8ML2/a2inzXy641F5QHSWhdCsvpdOEb
         k1ZRJ6/f8xvuacRQdT4mgl05igaxLm1cxLDT0vXbRAd111x7wYMTqMZaEgi9azKOT3JJ
         /V3bRUkXe84ZUTyvi9jI4jydjtgcZ9zJjJlO02XoVGaRn/PjRc4a1MU6ICPzo32gGIcX
         mNWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVBkAr5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c08d65c8si41630146d6.88.2025.04.25.08.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Apr 2025 08:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVBkAr5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u8LLY-0000Hj-0R; Fri, 25 Apr 2025 11:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u8LLS-0000DI-9o; Fri, 25 Apr 2025 11:52:06 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1u8LLQ-0006pL-AQ; Fri, 25 Apr 2025 11:52:05 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54e7216aaccso2112839e87.1; 
 Fri, 25 Apr 2025 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745596322; x=1746201122; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7c8bi+tYxGd3uDu+5jaT9Zf7rx1GDd9V54uFLw7R+Qs=;
 b=gVBkAr5kQAP+7g3ur3sT7zkUrkXgi9/mQpCTITGOvMWRGYQh3KnDR0C3Ols2ODjT0Y
 NyNGlQ5xy+0bTBSdKHMtvd8178gbB9IMsnr33pb9MhS9E1cNfuZAykuOOoygatb+73Ax
 rmG/WEbQZ5yBDktThFffnMYBhn2utM9UHO0GZjbHp2FePReNVCCHKbIJRrjiLsBVkghx
 qhhNOHKoqyBngymj1auBoCdYONyc69d9s6Dw4gI9iledRIO517+AZNu41VdZ5uvuziuG
 nDm8QkmmX3G8DkmuuspYpzYrqOjkoHXrooPbFxJjC0Ik2RgoJAoV7PPTeNhS9m6jV+C+
 pjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745596322; x=1746201122;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7c8bi+tYxGd3uDu+5jaT9Zf7rx1GDd9V54uFLw7R+Qs=;
 b=nNbumotPBoPDXSN2FopskoHn/tt/L7t9idMoxN3MNKbU6ejm7usOd1oBrXb25z3TRy
 8ARZSl6kCKkWcqFb3Bk/VgBGC7EDTbJfRzTePypgCW/apt5QryA7z6wz11QhdolVKiAA
 Ar8yUV8duFA3WxVgTMVxSw12HChszj6UlFGjlybhF1WcK7vaa4cTJZ7tEjK0JlD/x56B
 F+qBpYfIWsneO7bbplrIfrrhutFmHhf7WVrL9wj/za4pCnt3naGyM0T4lEhmOqPxDOt7
 jGntGD0BRT7G+tvRl+D1/DGgvL1AVxZ4tYrAsUbaCIE+41Rxlsia0oco69k3IZo5HA0v
 WRsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj5+UQZJyb1do/rLi3QYdl3EKiwceu1QIVTS0B78LHxnKe09LXqiR1fpwOSHPmzhbrFCxJaNTUeQ==@nongnu.org
X-Gm-Message-State: AOJu0YxAsLk+QGlt2gX8mmVVq+humMwHRt4c6GlHdzQwI9Ql7ke1Im80
 JdIm1bFryF0oTkn4vDB2eWKZMx/3eyd+Uvm7/3ci2gQCIgXJnVZw
X-Gm-Gg: ASbGncv2kGtSaeBKQlpFx4dOareCUB3Oi8MOtHzO5vKrYaiuxddbUNtbgYoEIMlEg9s
 COjZ57G5IPpHT/FGnjkv9LrxuAGumiwWsVRuRDhTu5xT1PYvhb5yNQ7CTkjPhsfvjtM6E3dRynf
 2UCYH3BH7omdjZFZkBvEaIHAfrKhBkTvPjHyuTD6tNT5hPT7tyqwRt7CPQ+g3fv+LN4scY3G0t2
 VPUk/FMYk64pXIxn6i+Jalg0FbwzwEMc5IUUtFBKBBFyhzCgqri855Om1Y/DIz6sHGznTX6u719
 u4i5ECQqP6ObVAP1+ZpbwyloYzy616Zl116b8fq29JGDhDkhm+0IkJIaPwxM5Lmq/TvxxIyYGoP
 GYxXKNtiLBjq9
X-Received: by 2002:a05:6512:b0b:b0:549:4b8c:a118 with SMTP id
 2adb3069b0e04-54e8cbd53b2mr1046741e87.17.1745596321671; 
 Fri, 25 Apr 2025 08:52:01 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb803fsm642112e87.228.2025.04.25.08.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 08:52:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:52:00 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Corvin =?iso-8859-1?Q?K=F6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Yannick =?iso-8859-1?Q?Vo=DFen?= <y.vossen@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Corvin =?iso-8859-1?Q?K=F6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/21] hw/arm/zynq-devcfg: Prevent unintended unlock
 during initialization
Message-ID: <aAuvoFjhS0VEtpqq@zapote>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
 <20250318130817.119636-5-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318130817.119636-5-corvin.koehne@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W1c64ApEdmDA

On Tue, Mar 18, 2025 at 02:07:55PM +0100, Corvin Kˆhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> During the emulation startup, all registers are reset, which triggers the
> `r_unlock_post_write` function with a value of 0. This led to an
> unintended memory access disable, making the devcfg unusable.
> 
> To address this, a property 'is_initialized' is introduced. It is set
> to false during reset and updated to true once the initialization is
> complete. The unlock function is simply ignored while 'is_initialized'
> is false.
> 
> I have no idea how this ever worked. Nevertheless, this restores the
> correct behavior.
> 
> Signed-off-by: Yannick Voﬂen <y.vossen@beckhoff.com>
> ---
>  hw/dma/xlnx-zynq-devcfg.c         | 6 +++++-
>  include/hw/dma/xlnx-zynq-devcfg.h | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
> index b838c1c0d0..03b5280228 100644
> --- a/hw/dma/xlnx-zynq-devcfg.c
> +++ b/hw/dma/xlnx-zynq-devcfg.c
> @@ -143,9 +143,11 @@ static void xlnx_zynq_devcfg_reset(DeviceState *dev)
>      XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(dev);
>      int i;
>  
> +    s->is_initialized = false;
>      for (i = 0; i < XLNX_ZYNQ_DEVCFG_R_MAX; ++i) {
>          register_reset(&s->regs_info[i]);
>      }
> +    s->is_initialized = true;
>  }
>  
>  static void xlnx_zynq_devcfg_dma_go(XlnxZynqDevcfg *s)
> @@ -221,7 +223,9 @@ static void r_unlock_post_write(RegisterInfo *reg, uint64_t val)
>  {
>      XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
>      const char *device_prefix = object_get_typename(OBJECT(s));
> -
> +    if (!s->is_initialized) {


I think you can use device_is_in_reset(DEVICE(s))
and get rid of is_initialized alltogether?




> +        return;
> +    }
>      if (val == R_UNLOCK_MAGIC) {
>          DB_PRINT("successful unlock\n");
>          s->regs[R_CTRL] |= R_CTRL_PCAP_PR_MASK;
> diff --git a/include/hw/dma/xlnx-zynq-devcfg.h b/include/hw/dma/xlnx-zynq-devcfg.h
> index e4cf085d70..2ab054e598 100644
> --- a/include/hw/dma/xlnx-zynq-devcfg.h
> +++ b/include/hw/dma/xlnx-zynq-devcfg.h
> @@ -55,6 +55,8 @@ struct XlnxZynqDevcfg {
>      XlnxZynqDevcfgDMACmd dma_cmd_fifo[XLNX_ZYNQ_DEVCFG_DMA_CMD_FIFO_LEN];
>      uint8_t dma_cmd_fifo_num;
>  
> +    bool is_initialized;
> +
>      uint32_t regs[XLNX_ZYNQ_DEVCFG_R_MAX];
>      RegisterInfo regs_info[XLNX_ZYNQ_DEVCFG_R_MAX];
>  };
> -- 
> 2.49.0
> 
