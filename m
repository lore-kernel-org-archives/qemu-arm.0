Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp532715lfb;
        Thu, 9 Jun 2022 08:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkMvGCj8aHnfSp8Xb73znx9qPDSdUGNHN9rltOYngxr1IZkTBzX5cCXIV1zZTxG7MbzCyP
X-Received: by 2002:a05:622a:183:b0:305:45:98dd with SMTP id s3-20020a05622a018300b00305004598ddmr8321723qtw.158.1654790140602;
        Thu, 09 Jun 2022 08:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654790140; cv=none;
        d=google.com; s=arc-20160816;
        b=Fa0dOUZvTJCfa6ZzRyoAIM8cHE+SrPz3AXGIp0pZrd9U06jE1G+gwHXZvbKLaCzOBC
         D/QxegfJSWM2MGtbfOlvc9UViXUgGrBhtNz+gRmN2I5IxbPKg2FlENgy+USrnasFu11C
         VfY0eRAfPPOBMO8GKdQLWQ5m3HRApoJdvbyoG0ObvdT3ramnJeVWFD/lBt5ALB/+9hht
         bdjpBjXnYpIs0TOWtILRrgoglEPW6RlqQ5sgrn/tzy2SZWItdZ3hKp7uXnOY2MPdDIXD
         In2G6ivKgrsmHzAmXtdDUxjO579uoJpa2pG3+3zZJ+hgmrtyDydldRSAem/ssx8vY2u4
         6pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+wOYvc5+YO8xJrz5nnNrLhoFJlpWxW9ZnRW66oZyGy4=;
        b=pdVP3MbC9+/o6spOOT92R7lafoMrr6EG51wVx2VeMCRNnf7ee5J53IGDYB8SOLVv7g
         IdK9+Bt0RWpnueRW9UugwUl36CgxWo1gpv73DbwcUJMGMChURszvC8POYP08kHVFx8tq
         sZNbHpJ5sT+PFg5cRb+8ISCfvP/7/bkb2rV+sUYeM1E3qSdBUULiLdi3GH1L/me3moa5
         SmR2jOFCrTMGYfheyT9L/wtudPY63nGXiN2yjflgpWDQ1mEJkdsGtyFp/NYaKwvNX4/i
         SQ/y3Hc5KK5kW73PXBmvEp4iEg0JhB6ZpLSaTmVOCtvZ0TpEUdDKJMF9m+fqzRaaim+D
         i6TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u4B2GgV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a379105000000b006a73b7374a2si530516qkd.552.2022.06.09.08.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u4B2GgV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKVY-0005bI-32
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAo-0000KE-Fo
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:34:14 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAm-0002Mp-Uh
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:34:14 -0400
Received: by mail-yb1-xb32.google.com with SMTP id r82so42326199ybc.13
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+wOYvc5+YO8xJrz5nnNrLhoFJlpWxW9ZnRW66oZyGy4=;
 b=u4B2GgV1eiZqiKI2SdIvT9Ef/Cc0l84O+S2cNf5chdTK3WV61UK6DrUAGiT/zNQ+Gh
 L/s7rD4BRBr1NJDyKujqAmToeCE361tZ3nVwpgzM1yEOPuqOuKoVr06K0HL6sbLIQRZd
 dCtNAvODMRamqOXekwQt4nP3vM/l8RGRlIoxrV3Cc/iIOqFmqF2ZOBtQJkzhrHqKw4MO
 GQbQ5w/DHblSoiSmqrD0YC0wtOT7z8wDjXuDE9k+DfJb8poeWl/WLsRoIUWNqEtlvcWW
 wpi94IIu+3sIqSnP9udy2daw+ChHA1TFRHwyZj+tbJbTl/Ezy+zrkM07g7IzOqCjKBYC
 hsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wOYvc5+YO8xJrz5nnNrLhoFJlpWxW9ZnRW66oZyGy4=;
 b=q4QvbR/C2Neh4A8fsi2KkTDFQTA1968i35sNJmpaJp7moim3PmMVlr3+3v/CTqst/O
 cmqUdlPJeAUxR5bYRhDM7PYqC9VvB8g3wjqE0fVI/h++byOF21cBhCrqBiKAorKnGbz2
 6NpceZhiQQKt6jzJ8mJrLpUjxOHth5hBLD3SUtwfGtm6RUz34MSk7/SDK12h/MRljEvY
 yNxgecw+neA5lmP9jBvspJ/eEoZsWiPqV8d4TkymvNhcPDyTwoubOpBWr2CWbqKuoloL
 4LSJOmaLx9jggp1gx6xQFn7haCtmuN6WPRj08lmLVa8jm5F1C1uRY7EzO75trBhPAGIn
 N3GQ==
X-Gm-Message-State: AOAM532kXWdsBNO0c4YkJIoE2BZjETZ7GH0itJWaHm7Nu0F3cQSwyFk4
 6IclEYYscxtbB10D053vMuIGgb4LYTwg9GfFNy3PZA==
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr40049697ybr.193.1654788851997; 
 Thu, 09 Jun 2022 08:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-41-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:34:01 +0100
Message-ID: <CAFEAcA_BCtnJZb6hzXD2zRB9yfSChNqA5RWY6n3E7o1k=8m+yg@mail.gmail.com>
Subject: Re: [PATCH v2 40/71] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: sS+sllrKUiJy

On Tue, 7 Jun 2022 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need these functions in translate-sme.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
