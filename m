Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1198069lfb;
        Wed, 1 Sep 2021 23:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAO3+5nCFJzCcA67c3m6xzliqXtB6YHfpW6zFvVkb5VcAX/mjcMjr4wXPE74g2hoWQw5/U
X-Received: by 2002:a67:d216:: with SMTP id y22mr700513vsi.40.1630562478636;
        Wed, 01 Sep 2021 23:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630562478; cv=none;
        d=google.com; s=arc-20160816;
        b=jkiMiGe9PRbxBtWNDATadGx7SBRAy5fGg4OArcstKwEPY/xB/dnsvDJrMAqnN1TllG
         9hGIO9NG2cdq4KcQGWcPMd6nltmzIv4aXXGYMuflunyuVDt4aKaGM3sCE2c1bCQ3vImn
         rA92a9P0NcdxoOHjxwQi4hBNTGmm5NtvhNBsw905o/s+IOjZRkFfQpACpx0Y3QvlRTjM
         Y2XNFUmSAN7Q7PnLOVc4Xi05gHQ9daU/nvwkccv92YXHGzefN4hk+YiF2pXNWJp6lxEs
         SvmYUA3MKC5l/AaHHlHBYIhWUorgFJec/nSmbzqkDEqeO04gq5RnhG/1cwTg+HvaqJC/
         VqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B1vyF0FWQId7bwTXnHEeutDw+FkCAGcy5KQHf8ZJDTw=;
        b=GoZxzvK89+PCR0eSlVEyPH3opPVAxSay0Zg+EPBVGJVHNKqn3v7P7uXJ8mmBVIdtj3
         gUR2vIgfBx6LbX+NU2zlZBgxnRiwmLwMCAmpqwkmpONirOuKWEUpW+EP7++VRBzAgtVs
         0t454pJz28ScUI2cFu0Ej0PevqWHtLgm9FcWIIUYDV/ey42A1IxWDqpw6ST9cDcrsgmJ
         /uNwcise+pBfimlERmQVp5DKbHQdiZo6w17uenQ1k7sntzu2oaz44tRORuBNfq0cDRPy
         FmiBL1dXUqA5YRNjjuSmrjWka55kLuHrImQNIfq3pezFUZz041jytP9kvLOD8FWNMm3T
         PyWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MljYoFJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si194091uap.25.2021.09.01.23.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 23:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=MljYoFJE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLfmn-0006kg-Re
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 02:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfmF-0006ib-7B; Thu, 02 Sep 2021 02:00:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfmD-0007G4-LT; Thu, 02 Sep 2021 02:00:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so979807wrb.1;
 Wed, 01 Sep 2021 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B1vyF0FWQId7bwTXnHEeutDw+FkCAGcy5KQHf8ZJDTw=;
 b=MljYoFJEaIwmS4dEg0e7YETX8lV5qIR2vz1h2VVpTgq/xhGtpeJpZgbpvqt0bJoZyZ
 eiFcyzOqigqMiBZwW04OVp/3nAHIPILouTkBcFNgTy9UnwbTL7l6GGcqJlgv1xPZi1Lm
 AyYXpU6pxnEx3zrijoKIhlqMc8aV1oo3JvTPbGY5/LEzTLIlIG9HovmUrFLNC0EPiPyR
 2BgEg+ly8chT1FZfj7qaGs995d1Fb5IxFP5q1yzOth7t6gUsyzBgw7TWGu24D3TSGQ09
 y4XH6EXVilAxjmsfh69TwDSlg3tR0FSvn8vWzK85l6RJCubaf4ZfV20qzs+X1LYlhuaF
 pknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B1vyF0FWQId7bwTXnHEeutDw+FkCAGcy5KQHf8ZJDTw=;
 b=AgW18bKhkCCjA4eIm5oOezlTIuxkZk+u+XEoh09R3LnMN+kvIsdbod9DU8LN3wrskI
 oFwETU7zlsWYMYv1adpA0p+DRFnvpGowkZyjYuyV4MMrho8gEoXuGxqKWc2z4q1MUZZN
 RdXoWtLu2t91gKgZK0uh9+zQsrF6GzDAhNrFFbXjUC31jUFcHbe1QlxqOgR+cGDUKLvT
 px2swyMAQ70+mYku148RSLFcLKfEg5IVMo9XoFwqT0V23FJjUxDyXXsR4ZIJbb9IVYfy
 Nozk+dAvIdJjjowG3lBgqusXFgoOesJtOdShYIGs2QYZ8bA4D405wR+cIek18Z1tMlBX
 Avuw==
X-Gm-Message-State: AOAM532DvMomr9uz8YtPDcQear2P3F9TXzuPPACW7R+UFAwokKbxpyLu
 k0FRHbCiN2uzFTZFKtXs2eI2GD3trTk=
X-Received: by 2002:adf:e10c:: with SMTP id t12mr1563976wrz.36.1630562439269; 
 Wed, 01 Sep 2021 23:00:39 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l124sm670702wml.8.2021.09.01.23.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 23:00:37 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dd3ff9bd-9064-6a5a-3baf-3af97f1aebb6@amsat.org>
Date: Thu, 2 Sep 2021 08:00:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901032724.23256-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HyrL3VWQrYe5

On 9/1/21 5:27 AM, Bin Meng wrote:
> Currently the clock/reset check is done in uart_receive(), but we
> can move the check to uart_can_receive() which is earlier.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - avoid declaring variables mid-scope
> 
>  hw/char/cadence_uart.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
