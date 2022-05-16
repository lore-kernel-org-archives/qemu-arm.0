Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1875045lfj;
        Mon, 16 May 2022 02:57:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysv5w/1V10MDkUkcg/Fb8FaThR5Qf32783H1RWElKk4EDSHQltr1FwlaVlrN8qG6npmXwp
X-Received: by 2002:a37:6253:0:b0:69f:b4e3:4853 with SMTP id w80-20020a376253000000b0069fb4e34853mr11727905qkb.332.1652695030758;
        Mon, 16 May 2022 02:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652695030; cv=none;
        d=google.com; s=arc-20160816;
        b=QdmpLQs5eUi3dkh9l/TK+FG+fP0hoJnHZZnaEAlmv3N7aVjm8XYdAkd8hzvz2Zf1co
         /4+ySMO6O67b4LhsaszxlK9LCKIIVZ2v7q+r5/cVZzMwRfG58l9IGGK3CAhznRuToA4G
         Qa1+0SGkdVQWTRXUyNb8fG6inntWmuLS1TtLqfUeGP4qQPd8amhC2omvt+aeXy/pkTuS
         XggjZCcjMK963oKb1UL2ku4mTa+79w+rYZlSmeKrMdYs76s8i5BSyWG1jIv8Tbc06rnx
         mtvFF1JcpNz5Xy2xyC4CnRfjN+64mEA1xUECC6hjUrGWwOFoNOOH8i4b/3LACLm/WlYc
         Z6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c8EIGS2nVOc0XSdyXWOHPBJ/hGuVI9gJsq80KdT/kqE=;
        b=BL1ol6R9ixB2Ea+t3UpGhz6HZJTzGa/OgY35XzJcZtupCReILS+8tcqELNEk5Uwu2B
         Q/+Ivn94wfO4ulyeZv49SEadPhkfIRoaKB5u2e7/74xcx7ryGIriMSvj4l9aAxd0lil4
         BpaIsDH+rwtd78vJ1h64YJvwcSj6BpUb8ZNSFyM7O2wWRGcqSbUuUiXB8cyvbyN/vdou
         H/EOHPx99hq3meCeXMRWVCnmHDxTqtvbP+NgcHvyS0Bb4K/Aryo1l13Fhc0F2NhvHEoz
         okUg7n3PSzVf5PE3jKLJ3Jcwx7mXLR1BbHBwEnh0xhp6KxReb7TsuWQGFkfcw6hbQG1A
         qZ2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZXie1Jy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05620a440a00b0069c52ee3accsi6809300qkp.321.2022.05.16.02.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 02:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZXie1Jy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqXTS-0007pv-9b
	for alex.bennee@linaro.org; Mon, 16 May 2022 05:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqXTD-0007pb-1G
 for qemu-arm@nongnu.org; Mon, 16 May 2022 05:56:55 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqXTB-00079t-7S
 for qemu-arm@nongnu.org; Mon, 16 May 2022 05:56:54 -0400
Received: by mail-yb1-xb31.google.com with SMTP id i11so25952597ybq.9
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8EIGS2nVOc0XSdyXWOHPBJ/hGuVI9gJsq80KdT/kqE=;
 b=YZXie1JySzS7Bnk3mJLaIOHvKF10zKtaEB2GG50HfG4F8jRy4QIO+wbm23b8HW+O/e
 nchAQQfaLQrhb/N9NxWeviXSr9KL16Sr+bNxxiTuFK1wjsBT2b+XvHHWjWNXBN49VtfG
 dXbTH85g9r4Tz5+eoU5L+ELIxEvbFJOfcMMF/LUI4uDeL9aXbYSLWcTnZQiiP4guxViS
 0yIVmLQAki0PnmFoFIYURR4cH6EG6R4UOy3V+3dZgg8Dc8S/uZuuWob5RJHaYsSfGsBM
 kXmV3O1QWBH8WIrPfP3YVngaNJ3H+XHkI9Ps8qmZJQ7brJi1gEhegl6f7Y61ZI2uTIEe
 Pqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8EIGS2nVOc0XSdyXWOHPBJ/hGuVI9gJsq80KdT/kqE=;
 b=sMxGkQFOvXsMQQAZUCqGuoc0JbUDASVW6zU/GFHC6ILEpv4CqMtAAkcT85QUFzkClg
 WrKlb/JJxUcmij01vlipzk0gNNzrOtnfMpEF6f5QSqxKUIIGgabzAI2efsz1lG/NlGVk
 5elh64FE7XD2AUAVGnikxs6MH7iMgp9eQfsxsq74owZNSY+WAM7HtNCaLRUF4ajhS2P3
 jYUh2WRcQmlcMBHFQc3QOWhwjoSRu2kRzkrOkszIDpVlhavlj8lZQJ14JMfPykY/qFy9
 lhq5thJ+vwigOuP98Aj5TC1B1EAelXA2T0rclcVFqfXxuBiHkkWNeiECczOlkaqmxTck
 Rjmg==
X-Gm-Message-State: AOAM532BEuU6+7KC0BMHIe92b6jFQMKuH1FvzVXswVa9+FnSCJYPlnxY
 Zn2mp/9o4+2JgUpAutPTzCgSIOQaJDdFY4Pi/l7CkA==
X-Received: by 2002:a5b:b10:0:b0:64d:ab18:2e41 with SMTP id
 z16-20020a5b0b10000000b0064dab182e41mr4006760ybp.288.1652695011948; Mon, 16
 May 2022 02:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
 <20220503152545.1100386-3-fkonrad@xilinx.com>
In-Reply-To: <20220503152545.1100386-3-fkonrad@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 10:56:40 +0100
Message-ID: <CAFEAcA-x+7Gm9Jo9oPdcXZ0DpeT=PmfXogxZkjVZC_SL3gHNGg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
To: frederic.konrad@xilinx.com
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.com, 
 qemu-arm@nongnu.org, sai.pavan.boddu@xilinx.com, edgari@xilinx.com, 
 fkonrad@amd.com, Sai Pavan Boddu <saipava@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KAoeKdeEaUT4

On Tue, 3 May 2022 at 16:27, <frederic.konrad@xilinx.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Add a periodic timer which raises vblank at a frequency of 30Hz.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Changes by fkonrad:
>   - Switched to transaction-based ptimer API.
>   - Added the DP_INT_VBLNK_START macro.
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---


> @@ -1309,6 +1323,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>                                             &as);
>      AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
>      xlnx_dp_audio_activate(s);
> +    s->vblank = ptimer_init(vblank_hit, s, PTIMER_POLICY_DEFAULT);
> +    ptimer_transaction_begin(s->vblank);
> +    ptimer_set_freq(s->vblank, 30);
> +    ptimer_transaction_commit(s->vblank);

The ptimer documentation (in include/hw/ptimer.h) says
 * The default ptimer policy retains backward compatibility with the legacy
 * timers. Custom policies are adjusting the default one. Consider providing
 * a correct policy for your timer.

and goes on to describe various weird behaviours of the default
policy. You almost certainly don't want to use PTIMER_POLICY_DEFAULT
for a new timer -- instead figure out the behaviour you actually
want and specify the appropriate flags.

thanks
-- PMM
