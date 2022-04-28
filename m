Received: by 2002:a0c:cc02:0:0:0:0:0 with SMTP id r2csp733029qvk;
        Thu, 28 Apr 2022 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySmbXyHC3M5OcWsOp2LakHdRVxS403HRIrpvpHkgtQxYyQa5gDIkhpG1C49ovk9iuPqNxZ
X-Received: by 2002:a05:620a:4449:b0:69f:9b7a:926a with SMTP id w9-20020a05620a444900b0069f9b7a926amr3176873qkp.740.1651143144341;
        Thu, 28 Apr 2022 03:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143144; cv=none;
        d=google.com; s=arc-20160816;
        b=zwWohp4MJZvaHh4Js4wPHifYIMOqXZDi2nvchPeiCWPeTvLchQeKW40z3CXb0CapON
         Oj+vgNmsShJrLprgyvxXN6NIlYkUsVkVDv8cs3M8BDW8jy5ksnPX+TvKt8Sx4aP+OyaT
         QvsHtWLX+5LogA1fENkagjNHDOG/vFce3yUw8X2kWA50QBYySRgNMp4qgYXShmOv5be7
         yurwelAL7j/8f1qQpksgA2t16muXsCkwugLM8FeRQpYEjcZ/fXz7jCvzCERdqSj/JCZQ
         2wlVo33pS62W5i6RTmASxM/RZUcC31kSaw2pGNp7KIVkh7rfGXEw4/G0bqXiPdxQLIBV
         KCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0pxI2wVqd0Dug5YULil1Ey1Xq1IQDlDFV2kYJ4XQoJc=;
        b=RsOeIahLIBKenoH019VcKoEAb30H2UNqiLthzr0xQWYS52OPwx7m1K9Fc7QI5j321v
         UvZGKtNXzc/O8LY+LT0RH2mjFFyJgGWv6NZ4IpIQs/IWcK9XSR+1YxMMkX6rsGgivWOf
         Yt7fE5+rrtvF38LPJsCXXA5m0PcrqpBVvn6qdUA/yOYlZZOLknfSZUEi6m9yRaAXodZX
         oDmDdybmLLxN8YJUdrO8UaEVVOikY3kJK1yJJd7Fna9mOEvIqC1bW0l1WGNJJn9F1Qs/
         h2LeEsfFVaRDMqF0Xsk23VggLTxc4VzxRhKUaxuUbbSBx0fLOOWGvAW8LI1pFLog/en8
         K2eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RPevlgOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05620a22c900b0067ec1ea37bbsi1347121qki.660.2022.04.28.03.52.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:52:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RPevlgOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1l1-0000dY-VD
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1M0-00072u-IF
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:26:32 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:37255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Lx-0006zh-Gl
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:26:32 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f16645872fso47585137b3.4
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0pxI2wVqd0Dug5YULil1Ey1Xq1IQDlDFV2kYJ4XQoJc=;
 b=RPevlgOgH643RYHgEn3lTLfGFzJFGtz3qT6qPZq79GWO1U3IdMy3hgYcaxnaBenWn/
 8yQjzfr3mw36Y420p8wOPuxDJwO2KAleMnPnjkmzNZRDKs/U8jUu6S7zOXz7pyUrzY4d
 EZ2K5dLdJoHti9SWmTDvbzNCi0xdMerCH5KkdLvtid1OPrTtvRuwy4dE/kRzUFenUsSR
 Foc6lw4lhjgSYTHa76jIsIPYHxiFeshwqI4VO7LcTb3eHnLuV5ouSmyyeBfq0jNOItlC
 Jhwe0vut5F+vqGRCQWsVSIOw7Oiy9sOcANFg98Z/tJ6kkp68XM++QWadkmhpxK6+OWCI
 qqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0pxI2wVqd0Dug5YULil1Ey1Xq1IQDlDFV2kYJ4XQoJc=;
 b=3q68SVR37HejElr5/rm7X8CgGWylgbtGX60B2/akIpm9yBUfr5pi5ch2I7IWNzaYSF
 D54OL8k7vQYPVZCWPqV9extnBoTapCReZMOkIGaKAIqZKWH7lik4hK9BNfdMP0HgE6QY
 reWoSC5m/JgHGJGAnpOS1RiAjOyRZANJLrSi2iYdbAoyCGLqTfj2WT5eLXbXcx6hoRb3
 0ZcKDKjeltN/VEZeM+f6Pntv8tZR6wV3wQkbM5JK8fSbLUPhWKtXDMwz6phisRNK5XHy
 mgW5dBP78MjIpAYF2gEg1BdHc4PCcgwXejpo+hE5qsTMYkZdnkeDBxOZyGQ97cJQgcaP
 Q1wg==
X-Gm-Message-State: AOAM532uAPdtYzt1PEutmv1dhZNiQqGkfMy/lWpx1eddQaW9ROfkUMZM
 3uuXglaWsvrtserNT1A0emuztkNCS5Y68iBOXWFKxw==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32508088ywb.257.1651141569842; Thu, 28
 Apr 2022 03:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-26-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:25:58 +0100
Message-ID: <CAFEAcA8vM=y1fuBVmi0juJP_3yatJAWRT36d9nVnawk=e8rT6w@mail.gmail.com>
Subject: Re: [PATCH 25/47] target/arm: Use tcg_constant for vector shift
 expanders
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RaFkq5/EXWso

On Tue, 26 Apr 2022 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
