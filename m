Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2940544lfo;
        Sat, 6 Feb 2021 07:28:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQXod0lwgszGfwSnQUcHXWMRlPIL9HiIlRVfX8SVcmIJf8J6sPs44og+/on5ML0iEpeHRK
X-Received: by 2002:a25:83d0:: with SMTP id v16mr15061686ybm.40.1612625337914;
        Sat, 06 Feb 2021 07:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612625337; cv=none;
        d=google.com; s=arc-20160816;
        b=bcVN95ITUfECA659WgPloDjAbisG6B+4oHokGeOb5di3+rABNaP5U0N8bdZM7yciFU
         jWHREwcRi4rnrf9jtBWV2ikaYqh4sVQDlgkz1ErS2/tAz4oE0xnIqMMNjyt0rwh1KJHG
         EQJa743eaOAbn8EZ+K2AIHN2k00ECWlg6Rh8fQDXL8PASwIYSOQWeqN/wxpMAul2Idh+
         t6ddINIeO9Lza3YlCA41ivgoUVtKYMQ8XZWexekn5vUdzxQ2xWfUxRh2JIrRA4CXCnG6
         mTSmuBZK7+k01osh8guh129f3t4XotMZ35rTZOI7OS+4oF63DKAo1q+KiOIJTsDycjQV
         Z3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HwMjgbftjKDi2lbeG286xdsTw24hvQxNd7Rs4rv2iv8=;
        b=Xw6r6l2aZ4yf0L4x+6toHH3mv2cUsbwkkA86zCHy8jyANSdOMDRkXejaF1G+UE85cN
         pzzOGaLIhsY2kFdLlnFU4naXQic6I4e9sQLMY7CWDdf/YVQdxPuGDl8L2PUIUcWp9LMo
         2/1iY+kf8xNMraSFPeup4c1cc0WWHpgByffeh1/yHMnazv2oarEAxNja/vilqZz0OW0d
         QKu+4zwxak2U9Qn1iOS5WZIECTjasSzvbCsUvcpP8n7FEwoX+CLfqXszfgKIeSCEF7XD
         kUtWtZtjKISm4dA2Up/f3MRcXyEolXCw9QLkDcEo0nesmDHv7l+oDhjGn8L254vsGH+i
         iqrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Khc1pVdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si6756935ybc.193.2021.02.06.07.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Feb 2021 07:28:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Khc1pVdP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8PW5-000559-A4
	for alex.bennee@linaro.org; Sat, 06 Feb 2021 10:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PVl-00054d-Uv
 for qemu-arm@nongnu.org; Sat, 06 Feb 2021 10:28:38 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8PVh-0003me-8u
 for qemu-arm@nongnu.org; Sat, 06 Feb 2021 10:28:37 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lg21so17769525ejb.3
 for <qemu-arm@nongnu.org>; Sat, 06 Feb 2021 07:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HwMjgbftjKDi2lbeG286xdsTw24hvQxNd7Rs4rv2iv8=;
 b=Khc1pVdPRsKuwsbSCsuJLrc9Twh6wj429fSqcVWVi/FzUt+DDW2BjDGPQ7gtyuH7b5
 ISeEnmiwd+YdtZ8zWPTZDaQG0Z/catkcyjIsVu9BGpOU627IVmjWCtyw3bcYy1gNybPj
 TbiMsikTMYY2MDsGJQwKlPYGaTUWuO8DkDqcWEHZQiNoJvljzFg23L4vlZd3/MgExQVQ
 CX3b7kzmLUXElfUURKrKxVlZ03ULNVzhPQE3R2SWp4KsLKNV8/jNiI1MHv0DbF9SgGEN
 RD6zr7JT+IxCd6rh2VbhspIAZ4d+v3s2GiqvwUhNCEVVXsPvzhiVOj0HJukf8ZAqIngc
 pJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HwMjgbftjKDi2lbeG286xdsTw24hvQxNd7Rs4rv2iv8=;
 b=EVzuLIPez8w3bK2p2o+EKUxOYKQciKqqgMOgkVZXB1P1Icwu/rcgMY5n/JnqI/qjBH
 ukt38zlEyNm9tCglLBVjCIwV04nCs8t1NKqfzVSK6GRZyvWLbHdPXvPVzou/lGupT0nW
 il9mr08XOgu1tWjoEkH+PjtfYV8HlR6ZvRJocEwYOFiE86CmKX8Gc4qydHOEvY0lSiEE
 YkrSdGgswPiIxiPP9KC4e5PJmXCPz8xyP76cXRkPgWs71KdrPKT0YbmRrLIdwB7AQPWt
 oe/BQwDdEpqXetJo83FvYhMflGpdumBcZeD4ZgFVScwyNhOea5sk3UR3asMJRBZ2oiox
 RaGw==
X-Gm-Message-State: AOAM533JtgDuHtw9WJhC1P+rM5SIEMfXaI9ObDh8kxyyYbraai6bHZlQ
 R618DkHcBz5cnHeKLFRs6zN6kHbHGjdFMhNp90BsLQ==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr9575707ejd.250.1612625311619; 
 Sat, 06 Feb 2021 07:28:31 -0800 (PST)
MIME-Version: 1.0
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
 <1612622294-37297-3-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612622294-37297-3-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2021 15:28:20 +0000
Message-ID: <CAFEAcA-VWeAPSTFKJ6dZ4-M7OYdqyw1wwBgzpNuasPYRzMvRWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VKajId/ZMkvX

On Sat, 6 Feb 2021 at 14:38, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> crash. This is observed when testing VxWorks 7.
>
> Add a basic implementation of QSPI DMA functionality.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

> +static size_t xlnx_zynqmp_gspips_dma_push(XlnxZynqMPQSPIPS *s,
> +                                          uint8_t *buf, size_t len, bool eop)
> +{
> +    hwaddr dst = (hwaddr)s->regs[R_GQSPI_DMA_ADDR_MSB] << 32
> +                 | s->regs[R_GQSPI_DMA_ADDR];
> +    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
> +    uint32_t mlen = MIN(size, len) & (~3); /* Size is word aligned */
> +
> +    if (size == 0 || len <= 0) {
> +        return 0;
> +    }
> +
> +    cpu_physical_memory_write(dst, buf, mlen);
> +    size = xlnx_zynqmp_gspips_dma_advance(s, mlen, dst);
> +
> +    if (size == 0) {
> +        xlnx_zynqmp_gspips_dma_done(s);
> +        xlnx_zynqmp_qspips_update_ixr(s);
> +    }
> +
> +   return mlen;
> +}

> @@ -861,7 +986,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>          recv_fifo = &s->rx_fifo;
>      }
>      while (recv_fifo->num >= 4
> -           && stream_can_push(rq->dma, xlnx_zynqmp_qspips_notify, rq))
> +           && xlnx_zynqmp_gspips_dma_can_push(rq))
>      {
>          size_t ret;
>          uint32_t num;
> @@ -874,7 +999,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>
>          memcpy(rq->dma_buf, rxd, num);
>
> -        ret = stream_push(rq->dma, rq->dma_buf, num, false);
> +        ret = xlnx_zynqmp_gspips_dma_push(rq, rq->dma_buf, num, false);
>          assert(ret == num);
>          xlnx_zynqmp_qspips_check_flush(rq);
>      }

This seems to be removing the existing handling of DMA to the
TYPE_STREAM_SINK via the stream_* functions -- that doesn't look
right. I don't know any of the details of this device, but if it
has two different modes of DMA then we need to support both of them,
surely ?

If the device really should be doing its own DMA memory
accesses, please don't use cpu_physical_memory_write() for
this. The device should take a TYPE_MEMORY_REGION link property,
and the board code should set this to tell the device what
its view of the world that it is doing DMA to is. Then the
device in its realize method calls address_space_init() to create
an AddressSpace for this MemoryRegion, and does memory accesses
using functions like address_space_read()/address_space_write()/
address_space_ld*()/etc. (Examples in hw/dma, eg pl080.c.)
Note that the address_space* functions have a return value
indicating whether the access failed, which you should handle.
(The pl080 code doesn't do that, but that's because it's older code.)

thanks
-- PMM
