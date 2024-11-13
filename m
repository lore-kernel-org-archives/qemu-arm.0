Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp434106njc;
        Wed, 13 Nov 2024 07:12:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXlywDewUKQ8O2EZmoTNwSh+tLS9PQPDmyhw1kpjXl4jU5D3IwUszQ6/INr+qgqveORkOnk1k9Y12Ea4A==@linaro.org
X-Google-Smtp-Source: AGHT+IGgoB+M13mVky4NVnlD56CgJgdZtGXoXKjivzISSl/RWBxmMP83YzjfDR7iwCBAL5t1T0uQ
X-Received: by 2002:ac8:5756:0:b0:461:4f03:dbf0 with SMTP id d75a77b69052e-4630942c734mr282830021cf.48.1731510735418;
        Wed, 13 Nov 2024 07:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731510735; cv=none;
        d=google.com; s=arc-20240605;
        b=GC1JTb2BSRwjmvB1dem+ZXeq7fLu+QYaYZW3+B86IVd0gZjntdDs/PTQgA6inWWi6H
         wlPa1nq7SQCt4FB+WstngrRCX0xi5Giw4wjy+UhAG6HE6DMIlowoLQeAUY6ccSlklgDk
         a9te6XfBl2rZu1p21Qu1xYncFG6xmtLemoqCWKTtYD9y4GQRK+49RGzdogRjhvfz9prD
         XSbtvenNfNUyK6gruNfLAdWiWpTsUOdRhO0vefgxuFf5o4vRW0K82CSHqtEol2xCd60T
         o1zVse3qrt4rXTPl0h8sw65XN/1FdRRiVgiBsyzDDdVzbkqwLtnCIZqo/6eBZnDzznUD
         3hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Pu8vAtDyx0cTAVjc4mfmckt3I4l8nZ76x4Flog8u25I=;
        fh=m3YgD1pGUVDzSmoBYn04Q4hPXOdGaXJ7BqB8z8J3V3c=;
        b=QDiPAwo+70kXSF6wvCFZCHvzwBfic/CMY4v6DWT4lGR44OvWU81A1Hz/76haQpQQQV
         fVXbbwwcDD3JSpL/xA7L7rX8DuwX7l+Jx0M9Qc/c/k2pYL6umkQB38d/zK/l95qHC2lC
         rtL7CPvVqDrNesb4HNzRgrSIJWgLG2DjsV1LqEp8bPOeJ25oMyycSk7VkKP4l/It+3nh
         iMvPKx3xPXZma33fM8M3lv1J33RUuTu4H8tflkTk6VCq3g5jprb9/fB7t/YOHurt8J09
         87o8g+clO3SmcorIh82pAT3+5w7FIxZC11z9Gtk/D28cIlOSvdAVFb3RGk4E/yoXQThd
         uLKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gh2oyLEz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4634b1f369asi23025251cf.79.2024.11.13.07.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 07:12:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gh2oyLEz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBF26-0000Qm-EF; Wed, 13 Nov 2024 10:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBF23-0000Px-BI; Wed, 13 Nov 2024 10:11:47 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1tBF21-0005xp-1L; Wed, 13 Nov 2024 10:11:46 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53da24e9673so622938e87.2; 
 Wed, 13 Nov 2024 07:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731510702; x=1732115502; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pu8vAtDyx0cTAVjc4mfmckt3I4l8nZ76x4Flog8u25I=;
 b=gh2oyLEzHDQmlfopp9awDvj/uYYnJFw3ZeEw039NBzzGMZuqZZuEUkpnfa2SB/CfrC
 XivHylpzorvlwkb4N2oKTjZQUySMxmbaKfmEpCmg4rndWh+veS3EartJnX5/RCbQ/q8I
 x0gCGa65zrzC8apJYZuCQQoEAP4XPObH4NmxqTgslDnZvTOZUd3fu6tREQJVon3ZQFwN
 ELEXI9KxzQaR19WdXrWt9Qta+MuwPg9g/rFjYGhBhAkjWw1c+I03Y2aAGJ4Y2n6D/3D8
 YUGhy8qVBHbvn5LPb0crJWArk84TxT2urG9BjT9T57Doz2lw8aEo7CSYx8jP7DLW3vWW
 JmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731510702; x=1732115502;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pu8vAtDyx0cTAVjc4mfmckt3I4l8nZ76x4Flog8u25I=;
 b=wFdkHoJK6zq6apmiCO8vMGP25jyeuaNwNjDau+STavYW1YXMl3C9po1itacza2c6hA
 jOx+YPNo6Gxq1xio4a2Bg35lWbjFCGOsLIc0mPdQD2iobs0jLznV8XQUAn7tWuW8XnPL
 L9/jNKCt8wPUOSGqv6CLrgZ6ptMwXFdswH1o7zmMa61KKmGbhb7AW6r5/hVaWg9E4mCC
 AvMEa0tGo8zBMLf3zGg3P0/UoGvnNZhvrpZqMvi8MO9u16dN9H7AWk/7drCOR68ac4QL
 7ovs12zlcrRAOOXvLofnULPzHqv1lU5IwZtQVaYGRXPDovub3xZ+DyPjXMBr8bBoQXsk
 ++0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5pBDNv1tE+qe9Fq8MSFHbxfCi98wO1WtfN2RN/b3xKWwL/K5uKsb8f7rGYPniJuGe+17ivQepig==@nongnu.org
X-Gm-Message-State: AOJu0YwYjsK94XCNs77een8UiJO86WjwU6HV5kVY/t5Umo6pf7ET9huG
 kSleLHwx1cALN+RzebeTOf80rEL7ZtIM7DSsWfVvAS8X6SleMN9K
X-Received: by 2002:a05:6512:b17:b0:539:fc75:99c4 with SMTP id
 2adb3069b0e04-53d862c6fbfmr9912727e87.20.1731510702022; 
 Wed, 13 Nov 2024 07:11:42 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a71acsm2181224e87.126.2024.11.13.07.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:11:40 -0800 (PST)
Date: Wed, 13 Nov 2024 16:11:40 +0100
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
Subject: Re: [PATCH 02/20] hw/net/xilinx_ethlite: Convert some debug logs to
 trace events
Message-ID: <ZzTBrP1tZYaFzbN-@zapote>
References: <20241112181044.92193-1-philmd@linaro.org>
 <20241112181044.92193-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112181044.92193-3-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
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
X-TUID: nP1ECPSLVHmw

On Tue, Nov 12, 2024 at 07:10:26PM +0100, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  hw/net/xilinx_ethlite.c | 5 +++--
>  hw/net/trace-events     | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index e84b4cdd35..bb330a233f 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -30,6 +30,7 @@
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "net/net.h"
> +#include "trace.h"
>  
>  #define D(x)
>  #define R_TX_BUF0     0
> @@ -198,13 +199,13 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
>          return size;
>  
>      if (s->regs[rxbase + R_RX_CTRL0] & CTRL_S) {
> -        D(qemu_log("ethlite lost packet %x\n", s->regs[R_RX_CTRL0]));
> +        trace_ethlite_pkt_lost(s->regs[R_RX_CTRL0]);
>          return -1;
>      }
>  
>      D(qemu_log("%s %zd rxbase=%x\n", __func__, size, rxbase));
>      if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
> -        D(qemu_log("ethlite packet is too big, size=%x\n", size));
> +        trace_ethlite_pkt_size_too_big(size);
>          return -1;
>      }
>      memcpy(&s->regs[rxbase + R_RX_BUF0], buf, size);
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index d0f1d8c0fb..2b36cd967e 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -511,3 +511,7 @@ xen_netdev_connect(int dev, unsigned int tx, unsigned int rx, int port) "vif%u t
>  xen_netdev_frontend_changed(const char *dev, int state) "vif%s state %d"
>  xen_netdev_tx(int dev, int ref, int off, int len, unsigned int flags, const char *c, const char *d, const char *m, const char *e) "vif%u ref %u off %u len %u flags 0x%x%s%s%s%s"
>  xen_netdev_rx(int dev, int idx, int status, int flags) "vif%u idx %d status %d flags 0x%x"
> +
> +# xilinx_ethlite.c
> +ethlite_pkt_lost(uint32_t rx_ctrl) "rx_ctrl:0x%" PRIx32
> +ethlite_pkt_size_too_big(uint64_t size) "size:0x%" PRIx64
> -- 
> 2.45.2
> 
