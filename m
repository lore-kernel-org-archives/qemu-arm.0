Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2323849ejc;
        Wed, 24 Aug 2022 12:34:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4e7wF1r5/Sj89To8XbfPK/BNjZylTLcU4spKUYAIgy8OQKJCGB/hVebzJjeocgLjknyCLd
X-Received: by 2002:a05:620a:2809:b0:6bc:5e0d:d7b1 with SMTP id f9-20020a05620a280900b006bc5e0dd7b1mr609130qkp.545.1661369697769;
        Wed, 24 Aug 2022 12:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661369697; cv=none;
        d=google.com; s=arc-20160816;
        b=ddol0ocgyydqT2Yd0136XrDbE4b0k4/OObQFuICm77b8fpc5YpsNWHjpgYksuVt7Qs
         /Mf2183NFaM1heehQaRawxKVz9aAg3ekPtWWLBlhQn4U86Lq/7/mHsh+dHDrRCgC/BRg
         k/0jDH0QMKDR9DNmpzKGcPj0+W2K64godaGsjUdyQ1idUcS8TzkWhXQPN7FdcceLInUb
         tNWDXBr+weAOGgO0RJ1LYRBcpGbnjBrSOo/V2AgZr2qGQ/p9xkkW2w5pxt8TrzJhvrHr
         wVd158mSnGtuRwPPJ2KffyrZp2Gc09XKNG/qoLqqhTW2gJ0UHHBiY4AlBgpiWFfty9T9
         3/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=v/xqGJyvZYMKKfbROmLr2EAVrKfTClhX5pgkPYTRyeQ=;
        b=UCDRBvh6MQIKgzZLf6YSGTrou2GXUSzh5yA3ThBdNx4zzpg6kg9czj4t4Zd/yzfMcP
         mBcx6Lgh5XwmShKpNfunVyibE6DOC8FJyhgvv0PbW9J3R9WcVh5RxGyyphBL5TDMk20G
         24/zqHyYvKGpGSeeGdJtMMuSfWr4JOU6zFYsrngW4W8d/fxnn6W7Jfnup3PG8Fl8dYeb
         8BMQ0EI/V6gK12s2mhW3uf8VJhyGnrMC32BkUlh97HsJGbv/78qcSJBthz7MafNBBrqZ
         2c58dVKqrzRldzltSaF1leLatihwD7UrpqeGdRTEh3zEwBBnVthltZ9djFlldxpDx4RZ
         iYbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5wKHKjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2-20020a05620a28c200b006bb7173318bsi9715028qkp.723.2022.08.24.12.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 12:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e5wKHKjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQw9R-0004h5-An
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 15:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQw99-0004S0-Fe
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:34:39 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:45768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQw97-0006Mc-UW
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:34:39 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-33dac4c9cbcso38224517b3.12
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=v/xqGJyvZYMKKfbROmLr2EAVrKfTClhX5pgkPYTRyeQ=;
 b=e5wKHKjgagG6++ESRTSOqUqWaAH2SK8vcLJqM6/IyneHg19uyTH/YDy3iTBYUsKyGQ
 X/u4vIebWMksOhZcdfo+NKvL+1rBLQzHPNk+23h5yu85HHJGWu3wiVhuxuIh2ak1oNpb
 joA2MWkaRmMq3W/UKEu8rVph3LrzSvd8qM7THb7oculOEIQ+fc0drXTAck95J6xlVLYo
 S5avXvy2IIuPI1C0OTEDeL2JbRtSPLa2nNfnyHg4bvxa24RXhlD1yShR9/q9yyM5IX78
 36devAIzDqEnn1D7WlLLR09NJJq0D86ucJCMkbgsG4PxAqHZFo8sshmit+an4o6gouPJ
 wcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=v/xqGJyvZYMKKfbROmLr2EAVrKfTClhX5pgkPYTRyeQ=;
 b=f8swBhQP1gBWzEk3rZ6NMpXknHm3FfLPVtAd957axFCEqfNNDmd4Kai/GBsCx7mA50
 YnQxo5u+/OqaOpNPL4UZxEpedWiy4J8gt1YOhA8OjfrQgg6mh7VZaKbS8aTJRotNQ8g6
 /tDlKqP/JXsh9IZfIlwFMLYVF38tUbETHYNNXk3lF4b43Ijd2T7TJ0PR155AVTPzZy+C
 EF/9GJnGMacfdknmrHJCDz0zxnB9OybWqLVt9d6O5lE6w234Viy7AKRdb6CZobwJw8Gz
 LVa8kpl5W4CWwWotjYq4oYBt5tHGs2rezOKg/5JenY+WlEJSmom6aisbTE7uQWWP4waT
 U7mw==
X-Gm-Message-State: ACgBeo2aT7aZj0Sb3zoITnGFIBNOdz+WGvulg31Eq/zegXeSuw7dpy4l
 lIO8QLssuK30i/uTiBvp/0/HvrULQF3s/ktQYDgqIA==
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr742302ywf.455.1661369676566; Wed, 24 Aug
 2022 12:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-3-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-3-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:33:54 +0100
Message-ID: <CAFEAcA_dXgmFeZnrimenE0yMnupM0pWuj5s96vk-sBDmtvZQxw@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/arm/boot: Fix devicetree warning about the PSCI
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: 9q/Yq8c98ze4

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> dt-validate warns that an implementation compatible with arm,psci-1.0
> shouldn't have arm,psci in their compatible string.
>
>   psci: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['arm,psci-1.0', 'arm,psci-0.2', 'arm,psci'] is too long
>   From schema: linux/Documentation/devicetree/bindings/arm/psci.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index ada2717f76..527918227e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -493,7 +493,7 @@ static void fdt_add_psci_node(void *fdt)
>              const char comp[] = "arm,psci-0.2\0arm,psci";
>              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>          } else {
> -            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
> +            const char comp[] = "arm,psci-1.0\0arm,psci-0.2";
>              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
>          }

This doesn't look right.
Documentation/devicetree/bindings/arm/psci.yaml says
"arm,psci-1.0" means "complies to PSCI 1.0",
"arm,psci-0.2" means "complies to PSCI 0.2",
and "arm,psci" means "complies to pre-0.2 PSCI"

If you want to drop "arm,psci" then you should be arguing why
we're not compliant with pre-0.2 PSCI. Maybe we aren't and we
shouldn't be advertising it, but you need more rationale than
"dt-validate complained".

thanks
-- PMM
