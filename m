Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2328374ejc;
        Wed, 24 Aug 2022 12:46:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR79Nq9TjF6Ac5WjOI11hroAc3UqF/0cenbtai4dNq5BNEAlgEQmUFSgE2KoUfMso7/JxvSe
X-Received: by 2002:ac8:7d4c:0:b0:344:8bfe:22cf with SMTP id h12-20020ac87d4c000000b003448bfe22cfmr791844qtb.580.1661370374916;
        Wed, 24 Aug 2022 12:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661370374; cv=none;
        d=google.com; s=arc-20160816;
        b=KMDGPR2WXSuYtdbCNVChiR+Nd1u1EUO6TUtUWriFZ2Lyb7yyG+F+P/nndostZoFe2g
         qLPgZkAg7ISCIixtYZuIaxr9EKJvzKfTLd3Ite3MahayrtgpvgzOAmJmsDVg6Yd+LIVr
         OCMapGHB8n1qk/7ZbqsSQOSQ/a/DIK53hAZ+d5PhaPp99DX6keNIME1KxbIeyvvBWVVT
         V8xU7LMK1qFaungCwpLO3K5Do6g4pdtZ+BjL14IlvOMN7ikxuCGLUrN54Z08vioVCibx
         eJtRmzt+A+FEviqHw+MhcCen10IBXLt22k7jiKob3OfbPbOZHjPG8C1X59pB2bzFvVcE
         Bb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=B82TO1hTveMJiaR0bcz6clQVHDfpyBNs0EFwsMsV0Ck=;
        b=zQGwzPlZaLu+2Bt3gcw1VMUAhxbXgDDbHM0SI7EwXFJChzKtsKHH1RDUtNfpHYTfr7
         r3QPHRe2lNm/66gA0zgq/UaJmqW0UmIJK9Y5i12OKgfSWGyB1lqvsRt61FTcOhLI4UFZ
         WvjjCdDITeH2VDgUTvv5gqgsMrpMBoFaE0qEzpBF+APjOtS2jJ6iSguUVAGqVPPh3rTf
         VjR8HxKggH1BieA5CgeNFAIAkgZsgRVQGELX9xgbiELL9Ku1ossCuIlfCxZfORLRE4bb
         rTprvKIa9a47uWKWzfmsPkH0jCI9AuO2kFJY3d3nN10ajpLNxdstOl8bn1VncqvAcOG5
         7zuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTeV6rON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv2-20020a056214262200b00496cddbd3bcsi6252565qvb.373.2022.08.24.12.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 12:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MTeV6rON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQwKM-0003Gw-F2
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 15:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwJx-0003GC-74
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:45:49 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwJv-0008QT-Pr
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:45:48 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-33387bf0c4aso487214547b3.11
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=B82TO1hTveMJiaR0bcz6clQVHDfpyBNs0EFwsMsV0Ck=;
 b=MTeV6rONS3Mzk4p1uKlZifokkkuB+wKgNahEKLIaYaTfiZmQWJuVstRa4cW5ituhy6
 u1gxuAvgOSH/6F5AoTmBG4Qe8Jpv1JzVRvH0+UJRJaXAGWyNQ958ICSHDBqe2yFVyvw5
 6P+0UNJsDZecsYa34SEXkdRklUZwMQjfOEXvFg867d9/txjpLHUumUCufIp0V0R6cwsO
 7FuEijs2eZiYX/d506ie2T8Q2FzzFrWvCm6o7HPQOHhoKVpwwTefkQuzKVskGE2nlFV8
 dMAWmgu4ww8HeLkZQgxT188aavrK16XVVpPWlpXTxQvz06LR4uejEJZh7WK0c7Ao7uxw
 AVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=B82TO1hTveMJiaR0bcz6clQVHDfpyBNs0EFwsMsV0Ck=;
 b=0Y2AgEZsNbEsnGO8z3LY6jiiRbChXYx0r/Zd1dgBbRKWq7xNLxXVi/ftFKDlmQG/NH
 VM6vS4WN72Y4XEPPoYs4HHdcrbu0ZmDwcTPyfDMKBoeuXZeMwyF44wPRYXsEGfUDDhkm
 eMt3KjSKakruNAJnhtKOuFV/1EHfPD7TzWISlRzgbGFV3hoLrP9/Vr33vb/aN5h+Z6xA
 3yARW+i6nXlma2f1Qeooq0QeOWwk4YMOr0EF6WL000s16FVi1VtGGUyvruxJdVvyhpjz
 SlSsVxlp/HDYJKkrxYsWP2+Q6z2iL+Mho+DK2oOMINAP/oeswKNPIuyKj7tXvRT8VOMn
 98/w==
X-Gm-Message-State: ACgBeo2Oo4XO/dWj7JQ7IibsBhOUqBBzT7h1hDGmJqqGSBPZNHBbHknh
 9T2rw+idnE8gMI98sSMcx2ElSSflT0rjBePohzQUQw==
X-Received: by 2002:a81:5a56:0:b0:33b:52a8:c360 with SMTP id
 o83-20020a815a56000000b0033b52a8c360mr740384ywb.329.1661370346904; Wed, 24
 Aug 2022 12:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-10-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-10-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:45:05 +0100
Message-ID: <CAFEAcA96dPtH2tAotFCdkR1CzZHU6bAnNyUXqKUrNh++5Ecd+Q@mail.gmail.com>
Subject: Re: [PATCH 09/10] hw/arm/virt: Fix devicetree warnings about the SMMU
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
X-TUID: BMY786LINmjN

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> dt-validate reports three issues in the SMMU device-tree node:
>
>   smmuv3@9050000: $nodename:0: 'smmuv3@9050000' does not match '^iommu@[0-9a-f]*'
>   smmuv3@9050000: interrupt-names: 'oneOf' conditional failed, one must be fixed:
>         ['eventq', 'priq', 'cmdq-sync', 'gerror'] is too long
>         'combined' was expected
>         'gerror' was expected
>         'gerror' is not one of ['cmdq-sync', 'priq']
>   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
>
> Fix them by:
> * changing the node name
> * reordering the IRQs
> * removing the clock properties which are not expected for the SMMU node

Why does dt-validate insist on a fixed interrupt order here?

thanks
-- PMM
