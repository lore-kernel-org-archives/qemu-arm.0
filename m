Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp574153lfq;
        Thu, 7 Jan 2021 12:01:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxo4kKiypH10MyMjsyeSzu+q2aVth1WjHUiM+0LafsXyGqdGXoUczWI5EgvcTpxL4XzHu5a
X-Received: by 2002:a25:5f07:: with SMTP id t7mr625050ybb.395.1610049718755;
        Thu, 07 Jan 2021 12:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610049718; cv=none;
        d=google.com; s=arc-20160816;
        b=Jhmq9n7w0Kf5SvxpOpbS07ubsxKXQfPJdR7W47jyThDbc75IuFS3Md7/2Yy0CgsZzO
         KUrH6Y9pPYtUgVj22J/OCTrzW4d0S8jXhKqmiSr8M0V4wF9mxgXJaqVIHdZSKCFG4tpa
         ITxgPYgeCMjnaHO466BwOAxffSlHJUB8wmOohFFCe5ukvsVF79ZE+oqWL9/UDqQRDW9e
         sgApNDUifWoQymysOxde+jZzqT39XqUMVWliZyURPvJIbYS50ty71SDujaG0Z8kVUKit
         0ZIaRoRSDasPhtad7WK3nv42PbTGpRGGB5zpPFnuGfBPFLcHGhQRq36z+sriXYEr9UVM
         29Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xw3j+kjjmJJDjmlmsVhdRn/Wx0+xXxnfBFmqL2+YXA=;
        b=uku7uuH6C8vucjlNhJpHUlU9FTicdDyU5XnmD3Ecq1Q+I1kL+YJYT1skwWlDGeh0G8
         5YnDQb1awpmYVjA9FpR+bQo0FZ6fbrxXpZYKEmAmjuDmaiQp2gPnzJjAi8gvVsjyY2XW
         g+4w1TOxLSkxT9mwmBNkHHa+4rvyMDoRczlNMc1MxLQ5nCLtPFtub09LMVvX07mtWOQO
         zPdtdVzJ6d4hs41tfbZNmqtrswHWEZzdt+aV79Jh6tQK/gpkl/wIxIu8vhOcIZ1LWeIL
         S0mZSu4x/Y0dodtxm3bWViws2UbztkdAD6KvadHE5dWj1yToWWL3asriAWd6ldBJpf+h
         GRlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xfR6lIs5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z206si7162632ybz.48.2021.01.07.12.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 12:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xfR6lIs5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxbTq-00027D-5U
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 15:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbTB-00021r-6E
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 15:01:20 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbT4-0004b8-LV
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 15:01:13 -0500
Received: by mail-ej1-x62f.google.com with SMTP id jx16so11345923ejb.10
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xw3j+kjjmJJDjmlmsVhdRn/Wx0+xXxnfBFmqL2+YXA=;
 b=xfR6lIs5ZhLXs57eL2Nm+cD4fhjqRhlM/nUvD4T6GYFnrqWTHn4HbOtZhn3CAcwLM+
 WpYWPGRILHJFAfbWIQbfXb9cisFxN9JXnUpaeTTeen2QWrhqzN/LYd4Uy0COcBaMmuAB
 xd1EWE+pEV4KVhvR2/7gHhW5lNL2TI1bSFzLlROHWibR1ZwrW0gWtJZyqkjiYWIGLnM2
 rtljSwm5veCxuB+7ZWrqqvufdJRepVI2qN+99BYoRDWlwzELEOxbDW2zxIuTxw53IZpi
 DVUcERZaajOByokWXuz2aY6tDiUHPm490MZW5IgoqQkHJs0g2zV4fDMVNBGV+rFasfvb
 BVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xw3j+kjjmJJDjmlmsVhdRn/Wx0+xXxnfBFmqL2+YXA=;
 b=e+lWstOER813f+LBVlEq5UOAvaHN2NFLljBrYDAOiu1AhMRrSVX3ubOUW6ov2oDfrP
 vxiI2VWrfTVNGrcRR88XwIIvsIT3YJO4igegRApOMbS35xitC5xAgN/+m5Pn93yNFYGQ
 4C4SdhDBss/oYPDRYrj+ZIjhUPBqEz9nsi22RjXvvPh5LEUEVYSXD58U35QR9YhxSK/O
 3ItC6EJnCW2/tonSJglzYDoFGF1TYn1BZ7YCa622IJtguyRmn2Y8tvh+t++ykmavaA5P
 H3eAcAOxlFiJJdbSCZDpkCKiNhzJ4o1xGTXUMQ9qQhxkiVwewtL6AlYS8AM9JdFw1uTS
 kzfw==
X-Gm-Message-State: AOAM532cRlr9p/WNtmUfjIh8Z8GZ0+m2Okrk5sZpBRJnaMAOBPVwftpC
 XkXLUfrWr1xDu9mZLiX87Xy3gYntLLoTD2TbuCChdg==
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr364752ejb.56.1610049668968; 
 Thu, 07 Jan 2021 12:01:08 -0800 (PST)
MIME-Version: 1.0
References: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 20:00:57 +0000
Message-ID: <CAFEAcA9-EP7s-gNCsXf_59eOfo+hvTX_EwJjg02dHt0eyWOk9A@mail.gmail.com>
Subject: Re: [PATCH] Initialize Zynq7000 UART clocks on reset
To: Michael Peter <michael.peter@hensoldt-cyber.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EHLFIc+rMQuR

Alistair/Edgar/Damien -- could I get a review from one of you
for this Xilinx clock-gen related patch, please?

thanks
-- PMM

On Tue, 24 Nov 2020 at 18:54, Michael Peter
<michael.peter@hensoldt-cyber.de> wrote:
>
> Pass an additional argument to zynq_slcr_compute_clocks that indicates whether an reset-exit condition
> applies. If called from zynq_slcr_reset_exit, external clocks are assumed to be active, even if the
> device state indicates a reset state.
>
> Signed-off-by: Michael Peter <michael.peter@hensoldt-cyber.de>
> ---
>  hw/misc/zynq_slcr.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
> index a2b28019e3..073122b934 100644
> --- a/hw/misc/zynq_slcr.c
> +++ b/hw/misc/zynq_slcr.c
> @@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
>   * But do not propagate them further. Connected clocks
>   * will not receive any updates (See zynq_slcr_compute_clocks())
>   */
> -static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
> +static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignore_reset)
>  {
>      uint64_t ps_clk = clock_get(s->ps_clk);
>
>      /* consider outputs clocks are disabled while in reset */
> -    if (device_is_in_reset(DEVICE(s))) {
> +    if (!ignore_reset && device_is_in_reset(DEVICE(s))) {
>          ps_clk = 0;
>      }
>
> @@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
>  static void zynq_slcr_ps_clk_callback(void *opaque)
>  {
>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, false);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>
>      /* will disable all output clocks */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, false);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)
>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>
>      /* will compute output clocks according to ps_clk and registers */
> -    zynq_slcr_compute_clocks(s);
> +    zynq_slcr_compute_clocks(s, true);
>      zynq_slcr_propagate_clocks(s);
>  }
>
> @@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>      case R_ARM_PLL_CTRL:
>      case R_DDR_PLL_CTRL:
>      case R_UART_CLK_CTRL:
> -        zynq_slcr_compute_clocks(s);
> +        zynq_slcr_compute_clocks(s, false);
>          zynq_slcr_propagate_clocks(s);
>          break;
>      }
> --
> 2.17.1
