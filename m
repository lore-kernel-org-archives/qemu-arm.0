Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp446539njc;
        Wed, 13 Nov 2024 07:28:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWpvK0xA0uKgHCkyFDWfOmtaxkIaJAX01ZSnuSRmZshNtUL7rd34SmEVzDWkJ8B04Sdz5yAxa/RZ5hRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFcC/txxIAhCrL1JXxjSLb3Jvb3LV3plImEJudpNxZnEWKJbakp6cAIPBnn14uqV1IuqvbN
X-Received: by 2002:a05:6358:5a14:b0:1c6:302b:b306 with SMTP id e5c5f4694b2df-1c66f24c4d1mr404172955d.24.1731511713006;
        Wed, 13 Nov 2024 07:28:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731511712; cv=none;
        d=google.com; s=arc-20240605;
        b=fU/Z4Zy0iP5LYd1RwOc/6Q0MnG94NjIxyVuAzrQ7UMZX30dFzrVFb/JLvIPeCdlJ1T
         7Og3ZWrg2ax9HyPV/b9im6Eo27NdWkrz8lzZYFKrcRSTL8T6RMCATboMu1o0k2pu/JUA
         Ya1Dn7YkYa1xaMgTTDe+Wk4X4XZx+t2jESdme8oV9TW31zsjxtjT7IwS0gwAkswBI3PJ
         vy7s16cd268xhqAgRSq7lV8vOFpNxEaSsG7gi0vvxYAIm/JT2P2K7wlAF6xYtIelLx3d
         PgwHXo4aXPzWLDlAa3Nd35rNSzL9ZqQu0YXDiEWSHXkID5lZCf1MOswN1tj7Ed3i8Xht
         Io+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=GGdn2TTVFPE/jTWM8nSbg/VN+KpO6eMsaibPhid0twA=;
        fh=tex8OF/Q48kwaAIzXaH73URsKyVMeMoeKGYv9FJKXgU=;
        b=IcxffZkKQWGpr1NLPgVs3lT72N51l8nBTWl4gKQBdIg5+Naj9kxei2vrc+yYhLWegM
         au0ou2n7hM/+OfapYZP+9EXnDoK22hSXmp5dZtgVFrDKpViChIK87S3Qa6pR8QC4s5ek
         Y4F3QtFbTGFhmIlVL3sVdKn/0rvx08FWWy9JBF9YVBC5qB3bK0VWxE/3NvIIGyxzqFq1
         JvdLYB4ScY/j4eoqWmiw2hwT7qlvos2k/TxVYdSfMFHd/VYSPkH5OCI3nRGWRDFPav/v
         bvxMF2fMQ5sumDIpNtgJIn+BHYmozv7pg1EW42Jlxe7XVagQduenEJXwiUNQJx61HNtO
         KrBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSVLy+k2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3962103e5si170589816d6.26.2024.11.13.07.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:28:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSVLy+k2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBFI6-0008EJ-RU; Wed, 13 Nov 2024 10:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBFI4-0008D1-It; Wed, 13 Nov 2024 10:28:20 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBFI3-0007f5-4g; Wed, 13 Nov 2024 10:28:20 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso8571340e87.2; 
 Wed, 13 Nov 2024 07:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731511697; x=1732116497; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GGdn2TTVFPE/jTWM8nSbg/VN+KpO6eMsaibPhid0twA=;
 b=ZSVLy+k2ig/ui/M/bJErXRAg9NiMr6HIwqSicJl6VoubDLicSAgSAkUWJ5+ZqHzILA
 u49CTyWyVTDI79pnqzjL+9+EIARu+pZ1PfAzUQDh5fgEcxbhRVZ76QFhTNz1hRqDlYwB
 iSTFi/OTG//e/EhMW5C87/JtpNMZ2mgzZhJ5nnctOVrYrQThbscQL/Fe5VM2vQoctbc+
 Y9Ab/JmNRW3J3JeBrmoSXNIbQkavkzgFXeo/EcDJ/ocgWtQMxtDfrOKkhFPB3GBJSIZW
 V42k5Z+QE3aen5EWkWqRtP7apQkJzAAqO+Z0xNFotL8nxYWCkW4kSQOuGXBDRw9+5fG6
 8wnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731511697; x=1732116497;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GGdn2TTVFPE/jTWM8nSbg/VN+KpO6eMsaibPhid0twA=;
 b=O0W/vxV65UWayawU5WRGPvIS5Lib5x8BNdIusqCrc7gDLQNrWvWF5PDZSBgdx5o4v+
 g0g5GVuKvn+2oQulbx2J3NVonkhZDj+LNP4L8YAQLvp612sFLFYpQiFG83IwrZXDv+i+
 dkM/q+q3e5pJ5b7FeaHNhkedZ5gArvaylIouCVOviLtzjxHEyIM7e9Fy6BHXuduuSmIo
 LvhYVaVBVmaSnGmxOSjbu88beXlAQZux/T4vvGZiJh7Gg3MS4Hhgp7jK25oocEKzeU/q
 Tx2V2TV6TaKqRN6OybgBe2EJrhxjEehDAvuTug91MmKOeshtKRUOIyIxwqnWI2GXQtEp
 SKgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMjFl8DeLLvG//pbQ/yxLdVc26rnK2VgIyga2XkTrG+nf0ln8Ujsv9MNA9gE8iFuD5iUzgpsXrxg==@nongnu.org
X-Gm-Message-State: AOJu0YwOEdDJdA2fgC6dMMdh07zVzr/QaINoNR3QvJ7wirHjU70TmkmS
 11I9rpEXr198yKy4ZOwSC9d6M9T+5xBQuVr5xEjNvY3njacfl+dC
X-Received: by 2002:a05:6512:230d:b0:53d:6b50:f613 with SMTP id
 2adb3069b0e04-53d862b4627mr9151264e87.3.1731511696724; 
 Wed, 13 Nov 2024 07:28:16 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9c2csm2205674e87.171.2024.11.13.07.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:28:16 -0800 (PST)
Date: Wed, 13 Nov 2024 16:28:15 +0100
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
Subject: Re: [PATCH 13/20] hw/net/xilinx_ethlite: Access TX_LEN register for
 each port
Message-ID: <ZzTFj3G7zJpZSFob@zapote>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-14-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112181044.92193-14-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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
X-TUID: J4pVeH/NhSWV

On Tue, Nov 12, 2024 at 07:10:37PM +0100, Philippe Mathieu-Daudé wrote:
> Rather than accessing the registers within the mixed RAM/MMIO
> region as indexed register, declare a per-port TX_LEN. This
> will help to map the RAM as RAM (keeping MMIO as MMIO) in few
> commits.
> 
> Previous s->regs[R_TX_LEN0] and s->regs[R_TX_LEN1] are now
> unused. Not a concern, this array will soon disappear.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/net/xilinx_ethlite.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 4cb4781e70..1a3b295b4b 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -62,6 +62,7 @@
>  typedef struct XlnxXpsEthLitePort
>  {
>      struct {
> +        uint32_t tx_len;
>          uint32_t tx_gie;
>  
>          uint32_t rx_ctrl;
> @@ -133,6 +134,9 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
>  
>          case R_TX_LEN0:
>          case R_TX_LEN1:
> +            r = s->port[port_index].reg.tx_len;
> +            break;
> +
>          case R_TX_CTRL1:
>          case R_TX_CTRL0:
>              r = s->regs[addr];
> @@ -169,7 +173,7 @@ eth_write(void *opaque, hwaddr addr,
>              if ((value & (CTRL_P | CTRL_S)) == CTRL_S) {
>                  qemu_send_packet(qemu_get_queue(s->nic),
>                                   txbuf_ptr(s, port_index),
> -                                 s->regs[base + R_TX_LEN0]);
> +                                 s->port[port_index].reg.tx_len);
>                  if (s->regs[base + R_TX_CTRL0] & CTRL_I)
>                      eth_pulse_irq(s);
>              } else if ((value & (CTRL_P | CTRL_S)) == (CTRL_P | CTRL_S)) {
> @@ -194,7 +198,7 @@ eth_write(void *opaque, hwaddr addr,
>  
>          case R_TX_LEN0:
>          case R_TX_LEN1:
> -            s->regs[addr] = value;
> +            s->port[port_index].reg.tx_len = value;
>              break;
>  
>          case R_TX_GIE0:
> -- 
> 2.45.2
> 
