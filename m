Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2325087ejc;
        Wed, 24 Aug 2022 12:38:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6y3mxyFL0xES+oQOW1s0NvN2IsiRVMcFDjQoH3dFkgk4a3Opz4m6eDSRzJbcXq7E75pwL9
X-Received: by 2002:a37:a9d7:0:b0:6bc:192c:125e with SMTP id s206-20020a37a9d7000000b006bc192c125emr632222qke.528.1661369885451;
        Wed, 24 Aug 2022 12:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661369885; cv=none;
        d=google.com; s=arc-20160816;
        b=BMTey1amSDegfkQYCdOnfS9aqJpANmVBJBeqJiK7hsbW4vNTJ3BINM71Lttic3F/z/
         /KigkC+T71uLOq0iDAm2t30hMBYATSV/LOo2t8w6MjOcI3kR1TRDhg/aQuXZb42VI2jA
         49YYgPHIhZpVTWCQHwF5jVP6Zba/Q28m2Xmh5fW+POk5XRbDNII9SFhIvVh+/8oPWUIP
         B5PDts7MLznIQbPx2UZAzf1/4KU7GR7mnYC4+XC/dG7y/ZiMrfJnFIcXiXe2DMsv3AMR
         eFQgukLFEVlSdr4M3CJLURvyhtHx4y7WBylm+ry9GgFXhcsw8UIOZjAh6PVNYVnTclUK
         MLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SKhuTriS+Iho+YNBSyx6qBvwjxOiPiAbNzZxNQt3Z2E=;
        b=cvb8X5mRnY82g/Lt0MxT3hMwpT+1yV+NxWI9v0sSVDSt1sRfq7kbHYSIgeJ/qzke9b
         eogq7USm9/X2K7Wd6PI/Fw2K40/M9KwJIc7RkyOLv5o3Ew+aQY2M3uty/MB3M6v00kLf
         e89fGflDqXZiIs2KzRKxA1YAEuEp6J+PbZoefmsUJkp5AIRddrLspY8IkQaf1JgyGUHA
         tdYzY5hUpXsMk3l3xLKcJLsEmCs4JwnQmGrQzzA3GL1etDpOK8FmRf6h90qy4vUme9AD
         /a+mVAMi7hnJ2jShGDwWsJM+nmJJmGL4IFMzppwxJnPPvMlXnh4hZFXMjX28jCoGkqd5
         lo6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d2PiyLTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5-20020ae9f405000000b006b9c336de3csi7422452qkl.416.2022.08.24.12.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 12:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d2PiyLTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQwCS-0007Sj-VT
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 15:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwBh-00071Q-Tk
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:37:18 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwBg-0006u4-Er
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:37:17 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3378303138bso447199617b3.9
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SKhuTriS+Iho+YNBSyx6qBvwjxOiPiAbNzZxNQt3Z2E=;
 b=d2PiyLTOVtIubKwZT/GwvQQKslbAYqBKGj38R7Ym50mgYNiZxxxk1OgLwyLeSzp5aR
 PTkt5emw1A8FqKureq/dRlrPmWJCK1xPqD6F05+SJMhX8h6yL1hFyhrWayVI95QJdCp9
 zUCLByfdksi5Nlb7agNSTSZKa1AwLdtKz9URIdIm5xQtFMjkaFkoej9mLyoU7705WR/1
 ejXKc8ntYi577Lm9sYBOBFGTva1eWwynZXUyHUec2XNcuDFoG8VZR+wiqbwRFOsEWZG2
 d5Cr+tEY0ROd1HDdiU9IZQD+orqvnRv5XfsN6ZVrMTQ1CPrjDiIVweHpziEOwY8gTT6M
 yH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SKhuTriS+Iho+YNBSyx6qBvwjxOiPiAbNzZxNQt3Z2E=;
 b=AqWcsUHPHpcqdiFSVIKFZLR0nAOpGyhM8GyyzevrLD1OH1YH/yf/e02a/wMgQTvQ1i
 OZmXiaR1CYzx2v5YqR7nQKEGXs5CnbXavI+2NJF5wM9IkITzaygpxn+EGEPcPOWGdpMY
 A9MQ0bPH5C7ZIF8VDq4RStdID42fDF8IFGyQYKd169ghMXrs18ECW5i9QSHNjEUzacgu
 Xs4a2uJG4Xuffkzvl7lP2cVJsf3SYB5yhNFO0kQoZbtWXXepi4mcYWGjpp0CZ6yMDsac
 xS0GwcOgn9gN1NCu9Ru54NnpZP+AY+V6FGKAilmcayK2rESp8oAvc5yBrsBa4TnsRLjm
 3GLA==
X-Gm-Message-State: ACgBeo15MRx7M/ky0hv7uEcF47//RMU15Ph3PGFnR7WtCQH0Qjh8CCHS
 0ZwaRNewxka7zR4Z3Z4OImRyRNm1FqPMLagwceOSFg==
X-Received: by 2002:a25:6d88:0:b0:695:9728:f253 with SMTP id
 i130-20020a256d88000000b006959728f253mr647372ybc.39.1661369835367; Wed, 24
 Aug 2022 12:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-4-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-4-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:36:33 +0100
Message-ID: <CAFEAcA-mnwzLChUp3_DP0Wz+et9sbv5mMowZn_tf7PPSkfWuSQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/arm/virt: Fix devicetree warnings about the GIC
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: gR2GfqpYi4Om

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Fix three dt-validate warnings about the GIC node due to invalid names
> and missing property:
>
>   intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
>   intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
>
>   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Why is dt-validate complaining about the node names? Surely
anything looking for the ITS in the DT should be looking for
it by the "compatible" string ?

thanks
-- PMM
