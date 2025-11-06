Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E22CCFA05
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 19:05:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vH5I5-0008Jz-6E; Thu, 06 Nov 2025 14:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vH5I4-0008Ji-En
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 14:05:00 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1vH5I2-0002vm-IU
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 14:05:00 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5943f39bf9dso1314802e87.1
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762455896; x=1763060696; darn=nongnu.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LORaMpTGbswR1A2Fei/jOHaMP4ZrlLklzwa6vGKXH3Q=;
 b=JU40yEqDy/myQ9+Io6FbTtBO+MH/MwBMOMZE+bgccq9drlblVUgjmpZxX1LV/4aHK/
 XE2hA10C5loy94SXXqCz6kf6pTVaz0EHqwsZWHC2CjrNrk/6wldM87NJu76Kc8qIWoUB
 vzCUO+1mAhg6iYDqsHkOL7wcNp72dLEu/LOfG3OxZI5Kjf7L6cJIIjkQ2oq737M57EMn
 nnQ18S1HNhYntS54lvCFE/4zMMe5c9/uEapcNltuJDBLLlkQ2OqPDDvrNjxrvWOxQZQu
 5HNeCZBpQ9nNZruMdA7izOp0q6TCt6HOZfqrGuoWn4oob1U74y88PrGWcmUCLOxo/yPq
 UStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762455896; x=1763060696;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LORaMpTGbswR1A2Fei/jOHaMP4ZrlLklzwa6vGKXH3Q=;
 b=ci2i7hqBx8dJ9XCC5U9IN5ZHYLOSS5rclTqs3uKY7n1b3+36JeqrW9CtmZC3Gzm3g0
 C5TamRYKZUFxR87VqU3crmews+62/JXrU2jKUSj9a2MBkDJ7g1weaxFFfsovA1xDF4gX
 Xz2RszJTv750SFxbKdRy0SQacoBF7qCSWW4BF9z/YJOUVHVGkEeXGHSbZi75x26z16fH
 4knHZGQ3BEvnVslHk+o0A3tRyl8SRjRSzwV8GX99i9YZlAfJ95KH7ECHqOKOR9SeVPeK
 D5YHgbx9q5reIRgnoXpmP/ldky9gRowNA9MRIRRqi9a16lKTZ/z1uVWEGbDZgrTaIMI5
 CdzQ==
X-Gm-Message-State: AOJu0Yxf8G0KjsoYMGrsiiv0n9LVer3GWdMmEtlb8NLymwrj0Mfydp+E
 i6LpfJRMXbQ6O9xcDBETidqYuGWcMnKf8d37830LX0TnX+9Cdu1I25Fm
X-Gm-Gg: ASbGncsdTov9cDNerJO6y6g9tz8MNyMyXBPLsfagY93+nny8SYaRqrtiBqKiwURWRdl
 7MCqjn0itoBwogmVLkWanAGovU3QJxXjrCLgJYc8LC0I80YxOGNkhnycYsFzumPW+QOfFjUytDe
 dF3Wjs1hgfhEDaIBDPQ3Hic5DRQrc0bOLYciQT5r81V9RXsEIAuAEjCYWQW2OkAaqis08MXyDvz
 Lx/99ZGjwtgbG7XjNfvfSyEasKDp4SyKl6f+Y6notodDSxiN3WqX2i5dMxh9Q82yS9vQejXlqiO
 RLPZJSyww061n+wKx0jgwIm4MGviBis5O8ltUSpHdTJ10xbnP9yLCn0evuwK1VEjTAFdZfxDcNC
 tAG8XSMXujtpI0Q10oZ3fNzOMjFEL8omrsGptOZyq5LY4vXvo2O8jchBi3+b7cL3OGr9p0Rexq9
 N6hgF67oZqOzwnkkmNnJ6CWx0UTEbkFg4gsXdB
X-Google-Smtp-Source: AGHT+IGYRRk2lC9ApZf4rbZUSV8EBscaFwzGGII+h4oQB9rgW+5W3hQxinvyKeY9oQ1iNqdQ4Gnfew==
X-Received: by 2002:a05:6512:4028:b0:594:3b76:f6a1 with SMTP id
 2adb3069b0e04-59456337104mr261643e87.0.1762455895707; 
 Thu, 06 Nov 2025 11:04:55 -0800 (PST)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a0b7790sm897581e87.52.2025.11.06.11.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 11:04:52 -0800 (PST)
Date: Thu, 6 Nov 2025 20:04:50 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 1/2] hw/display/xlnx_dp.c: Don't abort on AUX FIFO
 overrun/underrun
Message-ID: <aQzxUjre04FEka8z@zapote>
References: <20251106145209.1083998-1-peter.maydell@linaro.org>
 <20251106145209.1083998-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106145209.1083998-2-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.14+84 (2efcabc4) (2025-03-23)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Nov 06, 2025 at 02:52:08PM +0000, Peter Maydell wrote:
> The documentation of the Xilinx DisplayPort subsystem at
> https://www.xilinx.com/support/documents/ip_documentation/v_dp_txss1/v3_1/pg299-v-dp-txss1.pdf
> doesn't say what happens if a guest tries to issue an AUX write
> command with a length greater than the amount of data in the AUX
> write FIFO, or tries to write more data to the write FIFO than it can
> hold, or issues multiple commands that put data into the AUX read
> FIFO without reading it such that it overflows.
> 
> Currently QEMU will abort() in these guest-error situations, either
> in xlnx_dp.c itself or in the fifo8 code.  Make these cases all be
> logged as guest errors instead.  We choose to ignore the new data on
> overflow, and return 0 on underflow. This is in line with how we handled
> the "read from empty RX FIFO" case in commit a09ef5040477.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1418
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1419
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>



> ---
>  hw/display/xlnx_dp.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 96cbb1b3a7d..c2bf692e7b1 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -435,7 +435,18 @@ static void xlnx_dp_aux_clear_rx_fifo(XlnxDPState *s)
>  
>  static void xlnx_dp_aux_push_rx_fifo(XlnxDPState *s, uint8_t *buf, size_t len)
>  {
> +    size_t avail = fifo8_num_free(&s->rx_fifo);
>      DPRINTF("Push %u data in rx_fifo\n", (unsigned)len);
> +    if (len > avail) {
> +        /*
> +         * Data sheet doesn't specify behaviour here: we choose to ignore
> +         * the excess data.
> +         */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: ignoring %zu bytes pushed to full RX_FIFO\n",
> +                      __func__, len - avail);
> +        len = avail;
> +    }
>      fifo8_push_all(&s->rx_fifo, buf, len);
>  }
>  
> @@ -466,7 +477,18 @@ static void xlnx_dp_aux_clear_tx_fifo(XlnxDPState *s)
>  
>  static void xlnx_dp_aux_push_tx_fifo(XlnxDPState *s, uint8_t *buf, size_t len)
>  {
> +    size_t avail = fifo8_num_free(&s->tx_fifo);
>      DPRINTF("Push %u data in tx_fifo\n", (unsigned)len);
> +    if (len > avail) {
> +        /*
> +         * Data sheet doesn't specify behaviour here: we choose to ignore
> +         * the excess data.
> +         */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: ignoring %zu bytes pushed to full TX_FIFO\n",
> +                      __func__, len - avail);
> +        len = avail;
> +    }
>      fifo8_push_all(&s->tx_fifo, buf, len);
>  }
>  
> @@ -475,8 +497,10 @@ static uint8_t xlnx_dp_aux_pop_tx_fifo(XlnxDPState *s)
>      uint8_t ret;
>  
>      if (fifo8_is_empty(&s->tx_fifo)) {
> -        error_report("%s: TX_FIFO underflow", __func__);
> -        abort();
> +        /* Data sheet doesn't specify behaviour here: we choose to return 0 */
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: attempt to read empty TX_FIFO\n",
> +                      __func__);
> +        return 0;
>      }
>      ret = fifo8_pop(&s->tx_fifo);
>      DPRINTF("pop 0x%2.2X from tx_fifo.\n", ret);
> -- 
> 2.43.0
> 

