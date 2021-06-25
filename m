Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1439625lfg;
        Fri, 25 Jun 2021 04:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq6r3pmrZiAOljfO5rxWW/3/eFWm/zrewnwaWxKac3SkjsznGb+HAMDk6DswVPkdwxZOJZ
X-Received: by 2002:a37:454a:: with SMTP id s71mr11006015qka.88.1624622283196;
        Fri, 25 Jun 2021 04:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624622283; cv=none;
        d=google.com; s=arc-20160816;
        b=bXHF7yvd+pHI3MCo1JateEwH87ds2DTmey6A2cEcHhIBdoSSjekuSkUEVl8kUJrYjK
         ZJGheCa7IkFj9OEMEayFyzdk6oxY7PX0pXLbSuCE7Q+Q8h7YM+W8cRImFNunEfNtwkbH
         CRIQkno5WULpEkwtrBfkd5i7jddlu5lyAXhnif7yaIYtBWnMhDCr8FmLnOFGvyO8RB89
         oraMX6Wv/jEFmOtTZ4xdwtFzfExPhgpHIfU9pj2pWS2gLDYtGo2J0rMEwfyCqhesXMVr
         wHDWBLlpt0o52W4kI61TJL6EkhZpExuN7MlxErWCYzHzDVufflwhFFkId5v9SaYt1TCj
         JHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o0kJ2o5ve40Q+LEaLQfjI3pVB91S8+tSBhZeiIUy454=;
        b=hQ0+lwQjYOdaN/LHiL32Y71pVxGC70TnbeVLgpY7GV3OYeWqiCHdB0JjHie8Zb4QWU
         OUnYzCOb0ydIZzN/J/bKIamCemoLiqhgAibT5AUuXSfwrkGmkPYXXODF5muTTlMPTnjr
         t1urx6aT71mZpWA6IOlQBlicafiHLSxVGCTfsRKNHHkNakn7i14Iex3w2/8FllyFlMRc
         ecE2RB1x6QRWCc14owLy0Cjo10Uu4YKV36zv3i5NzKCxi5tyMRxXZjL9OxajXWzKnxSW
         W9iVwhWght5dO8kCjw5xr8KoBb7WIy0hlKjtS3KwNkvs9XL8cy+IRoeJT2ANgUeuiCq4
         KujA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kUsVBelK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si4853135qtg.242.2021.06.25.04.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 04:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kUsVBelK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwkTC-0001s4-J8
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 07:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkSn-0001pv-J2
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:57:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwkSl-00074e-Lh
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:57:37 -0400
Received: by mail-ed1-x52a.google.com with SMTP id q14so13026894eds.5
 for <qemu-arm@nongnu.org>; Fri, 25 Jun 2021 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0kJ2o5ve40Q+LEaLQfjI3pVB91S8+tSBhZeiIUy454=;
 b=kUsVBelKUNBKrAUiutZOAQnagZeP90XxQB+MMspRWK0/6LSgXX3DREvfpAavKmdJmW
 Lzg5S1MzNiSCesFI75cNvi9aeUJ3cfxrt+bxH1rvkF8D/sp7V0Rvd8Tn5c+Nt1mKuzsy
 OqBJaOCxTuPRJKNayDrlRVzcvnrbGiIVY8cHy9Y3odJvU3oz7KMl4Tsg+43eBGle7gE0
 XgUELCtM1eE/+8hwMTQ4TFEGfrYReyB/5mW0vi/jNiFSMYJP79QUxo2JN71bc64o4Cne
 KCCiSD7/ea+f90f5nXkNTzM0WcYCRhjjXP1T2grWO+Mu9Gl1etcooP7rGpgzO6+CkDnk
 eJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0kJ2o5ve40Q+LEaLQfjI3pVB91S8+tSBhZeiIUy454=;
 b=FfpWOmryECJ0GHsoHXKdJeU6lzw8IEJyqOW/EetelaJiSjEnalLfumpsn2IKTgOBA8
 3Dlq+qgdjaQUEuusDkG6x/GSSLyAoc4nrRyWC8Nvlzp8UNZpurbsTPFkiwOJwjSqL23g
 nGYqfV6qcdIoZC1AEICHCubiN/4jOtkNaTZQrlIC/djSpFumxo3yaqates8S7Vnikpl5
 3h8tbcoRL/YvLIqO9kwhqwdykXkmhxmr1ebLFOQqHmHKsYsfovIel/boOVvZDGDGmlwY
 v+NvbKV6eTMQshJKNq4zSzkWi20QxUFdcSmRbJV9xVhUy/DCsAH1p2l6dtFawGqf8cjo
 IfvQ==
X-Gm-Message-State: AOAM532RNbDnhjmo9qdUIjr/e0yXlxYTtD5zh0h9f/FVx9S4pGgwN2WT
 6XLCFQqH/OORN1S5CuYHgHNvpAbZGATG/8JBU/XJTA==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr13790595edt.100.1624622253738; 
 Fri, 25 Jun 2021 04:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
 <20210625111842.3790-3-maxim.uvarov@linaro.org>
In-Reply-To: <20210625111842.3790-3-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 12:56:57 +0100
Message-ID: <CAFEAcA9K642UHLF5D5wzS0sN8fVurcs4-TN0x6EaT=xBRB0Fkg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio_pwr: use shutdown function for reboot
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uf6NR4/Bztnp

On Fri, 25 Jun 2021 at 12:18, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> qemu has 2 type of functions: shutdown and reboot. Shutdown
> function has to be used for machine shutdown.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  hw/gpio/gpio_pwr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
> index 7714fa0dc4..dbaf1c70c8 100644
> --- a/hw/gpio/gpio_pwr.c
> +++ b/hw/gpio/gpio_pwr.c
> @@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
>  static void gpio_pwr_shutdown(void *opaque, int n, int level)
>  {
>      if (level) {
> -        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>      }
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
