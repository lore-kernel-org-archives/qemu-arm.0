Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1599466lfm;
        Mon, 15 Jun 2020 04:22:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO9LW2768pp3S4uIQ2ymOZ0XvXTePMPFTPcpHiy0edgHVTrI/qSXxzUIWRGXHmxHGlyBkB
X-Received: by 2002:a25:2fc5:: with SMTP id v188mr42640753ybv.130.1592220136742;
        Mon, 15 Jun 2020 04:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592220136; cv=none;
        d=google.com; s=arc-20160816;
        b=j5gR0qXAnFLhXPa1TdS3fOC+MmXgxKGNkNuymzUc1nwnXp6pQ7ExcjQGSake2T3gqo
         d3sGQkHJumRTnEE/EArsy/37YoDkQVATVjph6vq2DxiKl9iDsb+yN9Vt3tYu3gg2LJXo
         Mr8ms/YdEGWH/O+hyJ3hq0w3xoG38WAnVVSERIxo9Kof7Ga/wuQVc2qS2Q7xeh7iKAOM
         QjzQdlfAKwnkKY2s/j6yRsfpr58Uu6I/jOJjQ1+uEj52DDJc4iDS3c7FlmJ9LuF4F0Ys
         sGhbsGiH9THU9WyMtpgmwAMJ96206H3vqeuLFMzdFCYdRwMEsqP2NVxwelauQ+Wuxxt4
         TkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oLHiHHn5wO2Tihs5EiE56VABBjq6ipTkl1nGQyWrv6o=;
        b=uuwB8I5pjBQ9eRU+qNtn9NI97dvyzSLdJQ2fJtX8g5kc0cMdmfe5zOi8XLclxJ4y9r
         /2ws1IZ7bCpo7B7TtSouxYPd0WAFb9b0Sker2W6LxMFA7gFUSq4h3W5/ZmvjYZm8SNnM
         G+pmN5f7Ra+O0bRkDp3aI11ZLddOPx8k8Fqoqj/qkGyZJEnYOrS4MeqT+nJn8ZnBKdaq
         8MHABFELnsXAELIXTYEBBxZpK3JQO/9+tQUa2g9MRRXf/+hekpz6hTC4hVZdEb4EeZUc
         YieAGicgv72gVZe7XfnXZzQZ40vbwaro9AY6uQrBlpwdPFW/tTKVzOP+7gyxW3m7bb3C
         ZZgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QjQokknK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w78si4130198ybg.320.2020.06.15.04.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 04:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QjQokknK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jknBw-00055j-3o
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 07:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jknBo-00053Z-0f
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 07:22:08 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jknBl-0006es-04
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 07:22:07 -0400
Received: by mail-oi1-x243.google.com with SMTP id 25so15492613oiy.13
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oLHiHHn5wO2Tihs5EiE56VABBjq6ipTkl1nGQyWrv6o=;
 b=QjQokknKY0K8Ckya6aedOpfnXkKeIGenNyNo2gEU9AXW45ezpqfJABRbFfIsz+Cwrf
 LZE8rLEXJZQj9K0oEdg0jXqBzcnXo7RXF+Ta1nN5/DHrbrvCPW8s+BLdwy8YmQ2ae5mq
 lo/VXlkzrl/TUBG7EeVswMbDnHRXQfO/73Qt0Jr6qYsw/7nApEWctvJ2ahPdPRDhaRL/
 JiSEYXPeSzjQyBYd09THNTauUQxKJOsp1mjq9koeWVr3tRn4irYMf6FpbI4nxUAgbBfN
 jClUpKTxHp5qIh2NmiS92zllvYJsoxawqg+xEYHM6ZtVUFNin7gec33nqNsMCk62oeY1
 xFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oLHiHHn5wO2Tihs5EiE56VABBjq6ipTkl1nGQyWrv6o=;
 b=hZW/j1iC4xKLxu87aumyBeuiZPIoKo0RxNJxYrR6xtBKKplpB7FNBxdyIuIuzBpl9Y
 ecGuj7IaoA08NgE8C1TFG7WWCpqvCUT0WlwdP9kReKTBMEgKL5xB9A/Ky9X14JuYj+cr
 /z20OI1hfcJJDyP8pJACj5HNhIVUKRJPC5iSFHR330q4z8KUrYtDeSJ3k/3df1NPDHK3
 8er5JM0Z4/MzWS3WO1jZYuvxNn4E+f9s7qA4HNzW2G8GpvwNbr26fqV4sx2GGZAJy992
 3T2tmFnnvLQhFpXGL4Kyu8DgrU1IEjop8U5uXAzrZyXfIVdeKR7An6u8dqQD6A87gawe
 1qjw==
X-Gm-Message-State: AOAM533gSkYCOYJo0IS88+1h4GuOX0+uRwBhPyU3exp9L6FA0RbeurQX
 EPeghXilpXJjAldwWKFxXFWxcC5Y31AYdjbdIvcCaA==
X-Received: by 2002:aca:568c:: with SMTP id k134mr7847554oib.48.1592220123436; 
 Mon, 15 Jun 2020 04:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=QE0D-RS7+zxF2mtsw@mail.gmail.com>
In-Reply-To: <CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=QE0D-RS7+zxF2mtsw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 12:21:52 +0100
Message-ID: <CAFEAcA_5uUXtEfKLT9isq3jWMfoSebx4OW3XbDKXZYhSd6-TgQ@mail.gmail.com>
Subject: Re: [PATCH v2] Implement configurable descriptor size in ftgmac100
To: Erik Smit <erik.lucas.smit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2EKEawPfSMh

On Sat, 6 Jun 2020 at 10:03, Erik Smit <erik.lucas.smit@gmail.com> wrote:
>
> The hardware supports configurable descriptor sizes, configured in the DB=
LAC
> register.
>
> Most drivers use the default 4 word descriptor, which is currently hardco=
ded,
> but Aspeed SDK configures 8 words to store extra data.

Hi; I've applied this to target-arm.next, with the parenthesis
change that C=C3=A9dric suggested; thanks for your contribution.

A couple of minor patch format notes, which are only worth worrying
about if you plan to submit more QEMU patches in future:

> ---

The Signed-off-by: line should go above this '---' divider, because
it wants to go into the commit message in git; anything below '---'
is discarded when the patch is applied.

>  /*
>   * PHY control register
>   */
> @@ -553,7 +563,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s,
> uint32_t tx_ring,

Your email client is wrapping long lines, which corrupts patches.
(You can see that patchew was unable to apply and CI-test it:
https://patchew.org/QEMU/CA+MHfovYq1UAQQ341MnyGas7ScskWyjR=3DQE0D-RS7+zxF2m=
tsw@mail.gmail.com/
)

I fixed this patch up by hand, but if you're planning on sending
more patches in future it would be worth sorting out how to send them
in a way that doesn't wrap them. (Most long-term devs use some form
of the 'git send-email' client.)

thanks
-- PMM
