Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp393652lft;
        Fri, 24 Jun 2022 08:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sRTtnNU0RX/B5Xfn9X+QaAjgViAW6poJubvP7L2Siu7OaW2r2gdM883jJJEeFM7cxxaWyB
X-Received: by 2002:a05:620a:4246:b0:6a8:b684:8518 with SMTP id w6-20020a05620a424600b006a8b6848518mr10832537qko.479.1656083373365;
        Fri, 24 Jun 2022 08:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083373; cv=none;
        d=google.com; s=arc-20160816;
        b=epio+7vMN+BSWSvS96ugsRm8plpRNmaM23bODLoiGCSepYMMLvcyGA2wlY8w07zrOW
         YQ/RhG4Rkw6M6XTTfpzpPJrD1lhN3Pw/VcTprq6JeXD3KRfSS7s6TZEWO5V7edxMI05D
         X6Dr50nSIdoMK2PcTPKPBq6ZUjE3FxPPpqrzTvkr8UN5kPlYEV/Zw0zfDuyMWxIidXs0
         Koo8HXoqoKwBRBYz2Zjy3RMPEDFcLAD/YMcfGwhgUlpwBbSysbaEtaIPlotKhUo5jfne
         3sYpgY+/x1PNRUMkqGRWcjf9htrvHVrs3YhoKr7rYIGyCp5YvCrcPSvmNZOY+Cid1kDj
         iTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TCr8rQ1Oq/YkG8R3ZLo/zr8hdBL2VHeRNtfoceKcIig=;
        b=prmSdNF5ArO1ERCA+oZwJ95RDuqV3F3AltC5ZLw8eNDzLDZ77nEqz1/Fo1SIwvA/4v
         sXQiypY5EMV9mPa3/pJNC6Knv+ahMbHx6LqDL2CNSiE8Ev4qtEQcmveGKR9M1xhOMum4
         f4VLolpOc9EVIcQd98B6gNmxavrKzsJvxTDp5GZEayTEy7Ik1EBYq6Kfkf1Id9w4YEsr
         I1F3O0CMXnG8EOm0JeW9JCSaaGxSNwmCYR9wwFNdqbz5p6glGTr6GT5Ge+U6XXnUwVBr
         4BeEM/PXASiqS/QlUz3rR9l8Q0McJVike+0AnrTklkYHnwZOwo6pRNOGhoPO/yVGkuHP
         BwxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2pG8SmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs16-20020ac86f10000000b002f4c6182b76si1664596qtb.552.2022.06.24.08.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2pG8SmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kw8-0000lJ-Sb
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kve-0000hA-K4
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:09:02 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kvc-0003J4-W6
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:09:02 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id 15so5010165ybc.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TCr8rQ1Oq/YkG8R3ZLo/zr8hdBL2VHeRNtfoceKcIig=;
 b=Y2pG8SmTS33yZK0chyuMzUj2VHuaVg+UOWr2sfVgMc/yLwltnhF6RxhbeahjCQi3U+
 Vufpx+LN4Z+7oudbpeWuzYAn8JrAZIvE3AmTY/Afp0l0rraARJAGumExwUdzZskfjkdj
 G3XrlfkTwg2geG7pF4aQobGvzSkjiQ9CWatYTky7fdtRZFPHac4goWNBf0CBlE5jArkP
 swL8ENZ23tDeWSHWdixOqI7ll1PqNnV9gnl/NyiL5agn7m9ziSjXCy28WNYgiIEOMoPy
 GzkrGyGZ9lIONcwjtJK13hIGyWdxcDvCrM9S6j7DeInrXxxq7L4q8AOUlSBu3inTK99h
 Cvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TCr8rQ1Oq/YkG8R3ZLo/zr8hdBL2VHeRNtfoceKcIig=;
 b=zq1rjPbQeNyxXk/MP89oFh+d3qVsjEdaqZEf8kRChyHgAKUExZcQZIdatKET4/YugA
 gWIrhnAwRWldjjCB4Nl37GfAMNl7wXL/RUhuCWs8TCwVTW0DpYhYiW/jc8M7gE9+E0/a
 8l8qE790ugQJ+IsU5Zijsz2LxHFyOJvxMHxKh4M0BgCCIRvCuxY/H+EC2BSBMXAZ4WFm
 dsm6jJG/gVkqGCgq54i54CPwAYFvd+53tSdciSODV+GURC1oQR60vKwzh4TCTGmpPT5h
 JAGEXTCbEsOkqU36ZM5rWatnwhtWt/qA1n9BJsPoYY31p2SfZZOwwZ/68e/0Hz6BqIMl
 rT+A==
X-Gm-Message-State: AJIora/lpa9ymal31RQn4k7rz3FyMYHagrbJS0b4drhcInzh83yqiDeZ
 zZtyHhQ0jn3YOTbZ0qOcGvKIpQq1QqmFmhpF8exmMQ==
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr5544626ybc.85.1656083339874; Fri, 24
 Jun 2022 08:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-37-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-37-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:08:22 +0100
Message-ID: <CAFEAcA9N5dH-PjSkuybhQCfV+CcuZan5DvELTR61N-O4DG9b1g@mail.gmail.com>
Subject: Re: [PATCH v2 36/54] pl050: switch over from update_irq() function to
 PS2 device gpio
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: y3qLv6XM4dDp

On Fri, 24 Jun 2022 at 14:43, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Add a new pl050_init() function which initialises a qdev input gpio for handling
> incoming PS2 IRQs, and then wire up the PS2 device to use it. At the same time
> set update_irq() and update_arg to NULL in ps2_kbd_init() and ps2_mouse_init()
> to ensure that any accidental attempt to use the legacy update_irq() function will
> cause a NULL pointer dereference.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
