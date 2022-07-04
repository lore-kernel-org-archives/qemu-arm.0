Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3253613lft;
        Mon, 4 Jul 2022 07:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMKbrPjdGAArP8N6wVo/sCxu8g6t4uEdJ+PvuMogxloZ5WUHyRTQb+GU+eO9ranN45Zwfb
X-Received: by 2002:a67:c990:0:b0:356:21c8:fa66 with SMTP id y16-20020a67c990000000b0035621c8fa66mr16483899vsk.48.1656943594140;
        Mon, 04 Jul 2022 07:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656943594; cv=none;
        d=google.com; s=arc-20160816;
        b=W/vnYsKHr9kgjxbVh+ileKLhGeXKXnj8MMkB1iLKyQaSoJXiDpaTVDALTPt8EBP5PW
         8yV+yxlMM2A41Lj8TAlk8yuOp4FiTq1k9pKhwCD8TOR4YxckhctukiECq8yz7Y/T03qC
         iPk5O12VVUs2VkFtEF+Vkh4E7giHLKAgEeM8H8+179MkITVuPR4ocoSpRxBrllrDR8ph
         l9/wIeZPuhQnXTQje4Og7U+Zc6fE6qDSPRM/HG5gjvzvjbk3N3lab9w24JCAMfZn4quX
         fEEAqZesgc5A2C/U68NqmJvayziI1bzcuOp9QhJKTbPxXlbT02pHwa07QFHxtZhgD+xv
         AJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XZF++SnHbGINp9j4VThPP1kO2VsSWfX3+ejqQtjXnl4=;
        b=DVKZmAHv3fmL/c4nnJDtdt3Snnwr1JU+T+Yo01omoplT5sU0KzS74v/4Lt2NPuGoGf
         HfNk3BmKqYO4g4mhZodtDWbH7W4XytbduO8Mp545GfykFJ2aR8EgKGKUYD15OSizzefn
         /7ZihKaxmpRD2GD+iY8U2omeQzn3qNUrTPOluHRUTtEAPUppdIkrpDx3FVy+G0rtdec9
         Z0TkXuIKyGymzdD6MxBf8eSytZAhjRwzwAbACMKdVInBxJgkeZcTV+4w2vPaJfzu8B8k
         B6r18CpjVqy8vr6iMCZMyHX/boI2jQVD8L1RFgMzFFvj/Yh9t89YSn2JRDOlcNEX1oyS
         +5FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyb05NJa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j123-20020a1fa081000000b00370927001cfsi5661843vke.81.2022.07.04.07.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyb05NJa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mif-0001KI-GX
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M79-0005k0-5K
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:27:47 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M75-0003oP-L3
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:27:44 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31c9b70c382so19750807b3.6
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZF++SnHbGINp9j4VThPP1kO2VsSWfX3+ejqQtjXnl4=;
 b=qyb05NJa6vI23HNo2ZLLgOfu4HGY4DoFpupD95s/EBhsz1sbiVfXKYivIhLqUKAQ8F
 3WE8xKuMvT4AEoKPWeSu0/W+FAUhWagok8EwnfLPvqaOBO8lqj2+Nt//tdKDsGmGa4DP
 nYNKLmdn3gPfeBr1Pp80Otk8LMmpO5Y2U1kTe2jlbKYqLPJn/0qkvwjuHyFvGcqOovrJ
 Kz0f7zVLh0lVhDr5p2dDxQll0EUQxmERVnDkVIWgSysjQZSbTdrWTPaZbg8f+f61t+QA
 0OUW7IooY6jM+5Q/QUkjcmfGn6qLjP/cPQOS6NgkVAvks9FON2UkQ6kFYhNVEvPwYLCW
 ZPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZF++SnHbGINp9j4VThPP1kO2VsSWfX3+ejqQtjXnl4=;
 b=bW8BmZ6jMwQ9pMfvKnVn2Km4mRygpHna8PfRbdgRwYWWN31jvHNdZ4Arn7pdVBiKKr
 CqF+vuyZVDxcIr4XnGLKI6ELvltG0D1tn1tjNU9vL3hPpQ9Ts198ojG5f/SF31kPPsgr
 hLNR68VVgksbZDnRHKHMLS4un1IGrHa2iB6UICKy59+b/VhPew80ZuR87kaefbs0vdkP
 rb0/+cEjFFvU2CgjTzeFw2ziZkx3+VxedIGyXFWslOSTcM4LuC54niLgVxNOLvcRCQxS
 MdxSxSb276E8Ik84z9YgGmbnXmIZnHRHAIIPc/luIZj5yI5YeUnUU+rJycTF/MMryHPL
 BcLw==
X-Gm-Message-State: AJIora+6dyqDQPdTnR9Zlpkli55/7N/vkDB9MXoiuFh5EwWxBJNkHRcD
 FX3LoDB5x1PKoHrIFOJuIwg3mYC39XK3ixpFnLmGCw==
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr34155934ywd.347.1656941262714; Mon, 04
 Jul 2022 06:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-28-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-28-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:27:32 +0100
Message-ID: <CAFEAcA_pesFDQK0BSB5+cv8PRZ53pcbArketiJL2P8vxiyf=Bw@mail.gmail.com>
Subject: Re: [PATCH 27/40] lasips2: add named input gpio to handle incoming
 port IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: 1yomjJv2vmmw

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The LASIPS2 device named input gpio is soon to be connected to the port output
> IRQs. Add a new int_status field to LASIPS2State which is a bitmap representing
> the port input IRQ status.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 15 +++++++++++++++
>  include/hw/input/lasips2.h |  1 +
>  2 files changed, 16 insertions(+)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index ec1661a8f1..013d891af6 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -125,6 +125,19 @@ static void lasips2_update_irq(LASIPS2State *s)
>                           s->mouse_port.parent_obj.birq);
>  }
>
> +static void lasips2_set_irq(void *opaque, int n, int level)
> +{
> +    LASIPS2State *s = LASIPS2(opaque);
> +
> +    if (level) {
> +        s->int_status |= BIT(n);
> +    } else {
> +        s->int_status &= ~BIT(n);
> +    }
> +
> +    lasips2_update_irq(s);
> +}
> +
>  static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
>                                unsigned size)
>  {
> @@ -303,6 +316,8 @@ static void lasips2_init(Object *obj)
>                              "ps2-kbd-input-irq", 1);
>      qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
>                              "ps2-mouse-input-irq", 1);
> +    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
> +                            "lasips2-port-input-irq", 2);
>  }
>
>  static void lasips2_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
> index 35e0aa26eb..b79febf64b 100644
> --- a/include/hw/input/lasips2.h
> +++ b/include/hw/input/lasips2.h
> @@ -69,6 +69,7 @@ struct LASIPS2State {
>
>      LASIPS2KbdPort kbd_port;
>      LASIPS2MousePort mouse_port;
> +    uint8_t int_status;
>      qemu_irq irq;

Doesn't this new data field need to be migrated in a vmstate ?

>  };
>

-- PMM
