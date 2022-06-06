Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1394864lfb;
        Mon, 6 Jun 2022 07:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrEPpy4HGn/QRo/3LVEtG7kyFeR4Lnmv9NpRa/mgFRPoOaa1JS1b695bXfgUd/vTn5IHNZ
X-Received: by 2002:ac8:7f08:0:b0:304:b3cb:8f5d with SMTP id f8-20020ac87f08000000b00304b3cb8f5dmr17758036qtk.532.1654524482954;
        Mon, 06 Jun 2022 07:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654524482; cv=none;
        d=google.com; s=arc-20160816;
        b=rWoJmL8cugSqvOIqf1rmuPCsUtcKrXXGyEL5/xRSVXXYtogJNJcNPu6CIk10GTkZz2
         eDd8N8elkQWqwSKYOeW6wAAT8/nT9MjOr1LtLq3FdkBzs1T+l7PDaRz/3BmXQeytjTB/
         3jxO6nhLjcRJ/h/P4CUN64/G/pER6mQS83gQRXDGFDT1F5BJ1AHmZP06/dlrATTqOwII
         8F6T2zsl2BgxUgMnsP2xK1NH2/Im0tQkbIag11wXGPxJiKi0UN+o1f8/JVsKmE+lJvDU
         pflfRZm1XpcPK7RkAZ6na4N1r3lukaDd/TPwVMrVxs+UxZB9qR/4WA9z3Mf61KzcKIe1
         0Lug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I2v3Xru2fmuRgDrLBzyxs1tMIRmpGWZlqlXKIH4ToY0=;
        b=IfrROraJ2uvvrhIrafMctwDd+blvK+dXjv7ZK6SzdTxvHmci++g+n4JaqyzfqALyDV
         nL2yF0BHaNn7QAlHjzwLONYTgYO6ChCxjBZYFC3dxg/owLnl90b4npMCHe5Fzpx0rAva
         kcQBNgQWs2E4uyW5JUUN8TUirEJdQOZLZQX0autAjyTRNY8EPuGErpaAjvPfoTTMgpON
         sHBi25fxpxeGxH1J9LV6dJz7mtAdL7grZ+SWNw8UZ73X+IqxPEXXNVSktT4dyZftqbmh
         oVQv3eVPrJASsFSTcniehlx0CBiTqG/S7ZOdsRYbfZRVIQwDlOjS9sdTJQ+sSZIvAPEB
         6zCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFJSXlNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05620a288b00b006a39e94bd8fsi9287756qkp.307.2022.06.06.07.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 07:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFJSXlNs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyDOk-000830-A0
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 10:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCmJ-0004Fi-Hv
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:28:19 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCmH-0003M7-UK
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 09:28:19 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ec42eae76bso142831317b3.10
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2v3Xru2fmuRgDrLBzyxs1tMIRmpGWZlqlXKIH4ToY0=;
 b=YFJSXlNseLsrmXnPb2dk686Qorn7np83yfrOs1sQaMfpDuL0i0Se/umq4HOxunKGXi
 95+hcS0PzejaITPrI1F3mK7Hm0QwbrWB7RkYVM0hp3wPERjawTe3yp85rCOdjkOU3Eb7
 R9Ug8YNZcq3mOQOXaFH9QrsXShCYLgCE28LNA8vMxNJ1z5WM5eLFOT9NXcIGk/aKbx7E
 K2AqD9n5c/uGDj7e5YPUjZoiWAx55vsceoLdUtVmlznwAMJnIUVqsSTPa4LQKaOgYJuT
 ehLXBy57rjENdiaQifMfXifQzJQ+bdIV3T77Uq3l4QsczHCq8+GSAYAaXw8if0sRXihQ
 hWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2v3Xru2fmuRgDrLBzyxs1tMIRmpGWZlqlXKIH4ToY0=;
 b=bR8T2vpJGPaMmn6UKh9Y5JXJ1efQNglboAS9ADh1I+0/dnet/whPb+HO0jXpTGMup+
 vo6FJywNeWzGqBxRAILvdfMIMto8KOZ5tnURycnnm4ecnLWe3ZxuPBRbWHkypR6AB21U
 3ZuyglSCY/I0/iR35aQwEpSfkzTKhlPGMBfQ3emQdBjI0xQZMOArhXlQiPxAjwCXIABK
 znDLIQPHFLsvIYgxFZo5AiSa/YSg0s45/uRIG3c/fXs4KW/0uGKDRdM2eNBPUuG1jEo6
 UVKfZ4ufc+8zdJnhSZ6nZgcRzw85LCBRJqQ3GtJoRrGkWIIUUW1tcWJtmcdmSEs/lDos
 MCFQ==
X-Gm-Message-State: AOAM530w6tw5zPtXZfERz8Vi4SOb48eO/jDTeQ1gwqYViFE+Wz8xniJh
 dca1dlVxQQEW+hd5Z+fwvH6WGakGJ+y8xmIOrzRiVaSgOru7Ag==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr26113258ywb.10.1654522097049; Mon, 06
 Jun 2022 06:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-24-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:28:06 +0100
Message-ID: <CAFEAcA_wTr6in4pz=i_hLu89hp+rmo8_iMCaOytGNkZcgH2XDg@mail.gmail.com>
Subject: Re: [PATCH 23/71] target/arm: Add syn_smetrap
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: TsyzMC+W3aD5

On Thu, 2 Jun 2022 at 23:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will be used for raising various traps for SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/syndrome.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> +static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
> +{
> +    return (EC_SMETRAP << ARM_EL_EC_SHIFT) | (!is_16bit * ARM_EL_IL) | etype;

Every other syn_* function handles the is_16bit argument as
"(is_16bit ? 0 : ARM_EL_IL)" -- can we do that same here, please?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
