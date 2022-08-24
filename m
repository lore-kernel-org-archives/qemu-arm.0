Received: by 2002:a05:7108:4017:0:0:0:0 with SMTP id a23csp3885403gdh;
        Wed, 24 Aug 2022 12:51:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6wTlx1dJtdNECIXjn55KCBfwkuGHe9So5IsqaWYD6sN5JWc3Et063llspgL/XbAIikNs7Q
X-Received: by 2002:a05:620a:a95:b0:6ba:cf41:94fc with SMTP id v21-20020a05620a0a9500b006bacf4194fcmr662759qkg.671.1661370691720;
        Wed, 24 Aug 2022 12:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661370691; cv=none;
        d=google.com; s=arc-20160816;
        b=r4nOOesarP4E4fMj0HN8Fdo63eiE0sF83sgodeUNUpUzwCnP92kukhFqxruoo/49f4
         J4uN7dfrtImvLYYrcdzg3+hwgcgVtzqsZxVWZ6YEqee+5lM/KRzf2hp4X1kWE+KOV2wU
         p0iHgf5BXEtzL30+soH1zB59p7/qjkvqNalz0jQUxLGnj0o7bG7cwEVxLoTsyhdVxbx0
         omSAXVVdf1ivmMOvdNuNI4R6DyGVIqmNAnPBfAwDpOj59EeG+eTwUtZD7yBSBLyaOOfV
         /VAk055iYjFWXYQWzRn4Sy/GLMUmCnAlOFK0xQHZZ8OonoJkaoVPgCzVoKKsH14zjL8n
         goiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=frS57omZcQBWNsTqgKADA7Rlnp01wL2uTLt64NMkP60=;
        b=0osggbLRRZo2Y/W+m3TtQhQXCDUNG6NOxu+CEE+lD+KrzViBOgJKvWY83cXAr8Nh6A
         0B7H0swAEe4GeDmoj5ktz44PqWN/oOui39H29brT0LjqpW0f6iZ+NedwC69zlCgYZp8e
         e5uA7pjRatSWq0OYHRzJHi3lthCq/U0gvxP2zMkz6IBBkTIq08sGihxmJGVSM15efol5
         A+nRYDPmIWF/V5GvMUn6rVGlc38glmIiSGfOfzKkNRe7IxfFNOUjXBXZTptovPUIYfEr
         5ye95oPKJNJ41mDCVb8DxXQcKCUozNylnsPBbDNAnI9kK2ivUa6YcPOSpvaMxtB+WuQ7
         0h6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/sAfHIv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020aed2788000000b00344569c15acsi8978081qtd.172.2022.08.24.12.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 12:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="i/sAfHIv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQwP5-00077k-Bx
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 15:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwND-0005aZ-5M
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:49:12 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:45974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwNB-0000Qr-O2
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:49:10 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-33dac4c9cbcso39110937b3.12
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=frS57omZcQBWNsTqgKADA7Rlnp01wL2uTLt64NMkP60=;
 b=i/sAfHIvb2psd3OCXX7uB3e+X71GMqJ7MZeHTbxPMyvxYtRBXUuMGduMbKr2wDxkYV
 Brm4qLJ67Gi/PnoVyWqP4W5NqjCJGzaTWzJmvDzMz7rHb5NpdrQRefQak2M5sJGnO6xp
 gJibjdA3NXOQBkrdV2RrWYQmTdVZ1z4ZLAAu2By8vje9zubDMoF0WXLXz3iL5rH2SzyJ
 C8w2k/0fy+OKMRr37XF1i32S0G7Rw6Luf3C7ZN6DvFWw3QtURfgfGIu0De959mReO59t
 79+X9/fumifKxGFtqsDpxW1PJ70qqSC95G426FeDszlhtDAZXnOPYhEctWPWD6nKQERf
 UBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=frS57omZcQBWNsTqgKADA7Rlnp01wL2uTLt64NMkP60=;
 b=j0DfReoZNsb1Xcp4z8ZrXx1I8KyzlZQZ1iDGLkMOnIe7ggtpvnPXmkk9BmFTap7syb
 CU+F6wWnESN8hNibjsT1d+9S05IJaZwmn6WbEguWV3mku0KovHIeLIZxqJ1AJVxjR24f
 8e+QGlfnwkW7kVRSK/24REDURqZcME+7EZ1jO1JS34GvI9fyHZpvcPJ/KU1bFER44ID/
 Fr6PGc1ouJ8UVS5Y65KAELtjrecoml7QR/bT+e9F5I+qsg/cZdHjigHL3LOq5ZWiEgD6
 Nlz9HJL9PtRw07RlbWUUXzF8EH1EiS77inhPlTJgmah2cdJ7vkVCtgr74OSiC+tZd4bi
 oygQ==
X-Gm-Message-State: ACgBeo0QXbXfaOjPX/2QxVhTdGP2ZB5F27Ivcc/C0UVD4Az/HQaD6MwS
 9EsIXrnGOzbn2ekaWKfxqBs3G8JKOue4MuhFVat6PA==
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr709482ybq.140.1661370548772; Wed, 24 Aug
 2022 12:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-9-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-9-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:48:26 +0100
Message-ID: <CAFEAcA-8wCHuj6tZN0VB1boaOy50TtwpyUMziFgk2G4++Ay16A@mail.gmail.com>
Subject: Re: [PATCH 08/10] hw/arm/virt: Fix devicetree warnings about the GPIO
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: G+mSCvjDZAkG

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The GPIO devicetree node is missing "interrupt-controller" and
> "#interrupt-cells" properties:
>
>   pl061@9030000: 'interrupt-controller' is a required property
>   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
>   pl061@9030000: '#interrupt-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml

Why? This is a GPIO controller, not an interrupt controller.
It seems wrong to be advertising in the dtb that it is.

thanks
-- PMM
