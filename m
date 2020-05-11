Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp199056lfb;
        Mon, 11 May 2020 06:23:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypL9SAIVjTHXQieljIUKcYga5UquvqKMfULSXGVrkWgbTpbF4JJdtfdcw2YZYz1xmXivtpqn
X-Received: by 2002:ac8:6c6:: with SMTP id j6mr16271360qth.194.1589203431837;
        Mon, 11 May 2020 06:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589203431; cv=none;
        d=google.com; s=arc-20160816;
        b=U6izpHkiJsKNc2deOB+Q4KeSNDhlgdiuOyr13dPmvp5WOsF+o/ZpbMcB3V1dR5ceUG
         DHTZHTwhyIqB7hotrfAgqeT1eJeWmox6njkkLhu55voda7pp5JK5BgYJUwNtv+yaIY75
         +uyugLjFpdAMiiwVVQ4657RhsduEJRA2t7cFYLVAs3GhRvVTUU6WG4pxt4sg17aLdeCn
         xJumaVoGXjArawQlSGWLeUK5pL3xHauF3E3vb4eU3g/4qcMbYqLx3VaiuFHw6TI3HOAn
         zQTrGd8NNpshDdXgMjsHXd0m8W/24bcKpfiePsdae0sxwaOlBdWmfPtH8XLOQygldRue
         2rNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mZ2mm1X13K7VhdGcrTzAsOcmCjSGuWXDhkFlvmsEV0A=;
        b=vfcxpTOaZj2kGBH1zNNfci0jqk7G1G7jN9pS9MHABlYnTP4mU+0POebJfm33sAxMKQ
         3ugrlGmVW7g8Mx92ZSnEzQrICrhouJ9+MJ96OdLvo8wFNtoMtSG5rNFK587a+y5DHS9s
         cPV8T6AdN+UkoGfLQQsNqzZhcb6LX7Pxb8FOqkCEZjVL8/e81lvKXe3/dA4oym1B/t8A
         gxItHYF9Jq3bXQXk5kj99cs9wOIXui6LGpNzDaV4VCkZ7EmOeJ2u75O7LmaT8I/HZsz4
         btzAbeCdvm1ihku+cnV79LzWIyzFrSHEnNWNTtYMGte17WrMKaUKflx9Lqj7O5QipKjN
         nTCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pxZDdl9E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si5458942qkp.253.2020.05.11.06.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 06:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pxZDdl9E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY8PP-00039q-9y
	for alex.bennee@linaro.org; Mon, 11 May 2020 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8PI-00039L-Qp
 for qemu-arm@nongnu.org; Mon, 11 May 2020 09:23:44 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8PH-0003zn-PY
 for qemu-arm@nongnu.org; Mon, 11 May 2020 09:23:44 -0400
Received: by mail-ot1-x341.google.com with SMTP id t3so7489425otp.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 06:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZ2mm1X13K7VhdGcrTzAsOcmCjSGuWXDhkFlvmsEV0A=;
 b=pxZDdl9EK1T1PxZd6owq6Aw2uYn9p0WVwAOws590VO8HcpkD1CCG4ty/0FeRSI370O
 hGr1tWirka1EgXA//BZlBHqIvM0y6PPgckwbjbQK+2AuSV6HiyFfHibo2Jg9+H3d61Lf
 CMScmnHLyiGC/dmjVkhBvicpIMVJJyQrczRw7fwUArxMbeX3VYY+W0L17kjNXTVUV65F
 lK1L4wBxe/kYcdFF5U/f+uVLlwLGB0wbyNz5y71LaCQ7smwo3uNpI4PRZZ4cSOqKHePh
 mJm/Wq4k17zEG8sWMqmhfAJoUf0yHs0tQSqn+ubED7sNFEhYwWo+Am3VgIlbjqpFarND
 Eu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZ2mm1X13K7VhdGcrTzAsOcmCjSGuWXDhkFlvmsEV0A=;
 b=ZPeuJvVEiKwq/VNfK0DzTFmJ5WXQ5LmoY4fB55/1bpciYQnpU2eXJPCDukMrYVRqtG
 PMe05AVoKaGuvlX2whVVrcVwIwOhlMYmiarcmJMBvDoHIb9IrWzUx/Pwb2GNj+4L6M79
 P1BmdWoM+MtmS7sqKaV12vI2U+XZxQHAOtG3xnhlu2X3TE3oxrIPCZ4sTTJh9J/dD5Gy
 DYEkF3IxuacJiFU92NVaLQh65w8LFWcEB8RhHg0VoSIUt+9QIA0AUGVGUfQQteFK9Q1S
 S/FKBAAl+w1zLiLFIF5UxTkyO9womudDThwoiDAnXl8xxz0xkSqPjHFGTQGw2mZw/4gu
 HUog==
X-Gm-Message-State: AGi0PuYgO81s3OimFmjDdQpgE5VEPu0rKlMguocFtS0nTH+P5QJojEm2
 /T7p5Mi84u8TQ+COGrFCa6aVm9pp6BwjiGabjW1umg==
X-Received: by 2002:a9d:398b:: with SMTP id y11mr511044otb.135.1589203422325; 
 Mon, 11 May 2020 06:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200511131117.2486486-1-amanieu@gmail.com>
In-Reply-To: <20200511131117.2486486-1-amanieu@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 14:23:31 +0100
Message-ID: <CAFEAcA_2X2CY3Z6Pwcd=p-vboPuYZPJOfx4smoQCoWtjo5sABQ@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: "Amanieu d'Antras" <amanieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tbQ3xXHGGoC6

On Mon, 11 May 2020 at 14:11, Amanieu d'Antras <amanieu@gmail.com> wrote:
>
> This fixes signal handlers running with the wrong endianness if the
> interrupted code used SETEND to dynamically switch endianness.
>
> Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
> ---
>  linux-user/arm/signal.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
