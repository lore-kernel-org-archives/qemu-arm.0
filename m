Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4298319lfk;
        Thu, 27 Jan 2022 10:46:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwadZ12ZgTfXz/wOlrvVYHflfthyK0CBCIrPdXE0+75+F2xsg33aWEjRooVgafDD1xl3O9
X-Received: by 2002:a05:6602:1589:: with SMTP id e9mr2846058iow.131.1643309171945;
        Thu, 27 Jan 2022 10:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643309171; cv=none;
        d=google.com; s=arc-20160816;
        b=SOMFY6TgPWHH72FDWqGNe7aEJg7CqrvWb2swJZZwWyRsL7dpkRjNRWLW8vAHI/T9aG
         5BU0l0AuJtPnak668EGTJpqZnp0eQMcRnHBOySig3ZFOcC3EZTfROjn9fMS++xjorWe8
         OhwXgth9U+NursGwbVT73Ez5xggFyP4XCdIhbARIcGVWeaoBLctdbjSLPuLXjjFKXH1S
         EKEVrqARkrBh98lyFAL2cM9TxM1SRh5uhxfMTX0bnzA87/+4BREI7iutBpchUbh6pEqB
         QN919SukMPPuOOOiFnQVJuDS3cUx68GUiYLpNWonYJfw76sIIgP/CBluUhkmB5ToOttg
         luJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6v17n9HAxjPVsN5eEB1JV+1qlKp//pqJpM4+FUnNZc=;
        b=b9vfoi4UDa2iq87iXkglaytGERyAqTXRv9GfUf4PJtq2zJw7DTDhzc7iyUt5B0vl1p
         0qyljGTFvsoB6gMqvRgJpn0xOYK6HSBioAmfwM24pk44eefMTuwWqcHAG2NER0A7yJIG
         8MmWQ1o62vystGpx7rbIIP2xsoNRwNo2SI7PT5KeCRGDNV8BfliglP1nSJgXROpxffdr
         LmjoFMvCGLHQEGP0t/stFZQMQUWXXBEj1ANS0ql39lrDtZB+NRzibQmclMLnxrSiSh9Q
         1LU6L9NBzdcKuQE6qOc1L8J6BXOv4B/WJUG+3+Tlkuf156cYmwp9cX/DPKV8qpmUI+Xa
         8Jig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ILZ0aDzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si2548540ili.44.2022.01.27.10.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 10:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ILZ0aDzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD9mZ-000860-9L
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 13:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD9ew-000835-3f
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 13:38:16 -0500
Received: from [2a00:1450:4864:20::332] (port=44596
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD9et-0001p9-Ag
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 13:38:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so2433632wms.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 10:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q6v17n9HAxjPVsN5eEB1JV+1qlKp//pqJpM4+FUnNZc=;
 b=ILZ0aDzBX4zQ82ZtgGxrnncIjPMVP4YAcM+MKgqsMooszOlJzCTyqcUrQfV//6vZjU
 igsC7ri8IgnZ1xgfIy+WR4gDcJMrTQpd7BkCDCGyKR601U6/txXS69QdpItJlt+AFrOM
 ut3/7x6I7xqkqg2Cv3GNQBPN941LyMrrBWz6pxLnLXLP+Ylqjf8uXEa7MyEyPspeeCBb
 ICZRS1eun73/K1PJSNFvqpTGasmcWviKnZ7zYcM+spWKJ1JCksOVjB9Lr6N/DcoHKu7F
 AMgySH9pawV8uwqJhAhHYg7riiUYZR/xU5Yh/wPHgVYUzaxpsJAN01J84DcW71RNzAqw
 J0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q6v17n9HAxjPVsN5eEB1JV+1qlKp//pqJpM4+FUnNZc=;
 b=z8pTD08BEvl9ogzMWnfuvmEsX/uoJ6Io/THWfm+y3rETNHdVV0V90uy4qtyXqeTSeN
 dyE4QCkbW+eWSQCefRa8sNnfAfouDSCbzW2+JFw94k2bNGP+JhTFSIpBfE8QRflMHEBe
 vxKNBPkfkgb1drA1pbpJqBAMtmzmvTHXZ0dlpj/LRkZjRUzr4fFu/s/ETITWZcr9sDhs
 QaD24LDcwJkiyfYGqcEy5tLqadDdIzwlk3Z0GHRuChSkdYhyaa44XdsWXoArmQ7j9gnC
 6hy9iGzibQnpqMNVlOXfim4iBsebDvh6xHHO0pdmy/smdLyTPkTJSKscxCrz1dt5dvpb
 TxbQ==
X-Gm-Message-State: AOAM531h/bzp/REWN2vVUXeDGzET6hQno0BsX29e2nar5AoMu/CrqbB1
 wn8RyMxYoOwhwf5pkVDxuThImn6y+EKum1qFe/bgmA==
X-Received: by 2002:a05:600c:3551:: with SMTP id
 i17mr12814701wmq.21.1643308687885; 
 Thu, 27 Jan 2022 10:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-3-venture@google.com>
In-Reply-To: <20220110175607.591401-3-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 18:37:56 +0000
Message-ID: <CAFEAcA_KdE6GtzvCGShtYWSENDcp7byV7o25OumrR6Md=5K0Lg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm: Add PCI mailbox module to Nuvoton SoC
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joe Komlodi <komlodi@google.com>, hskinnemoen@google.com,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MFlASFl+dPqs

On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patch wires the PCI mailbox module to Nuvoton SoC.
>
> Reviewed-by: Patrick Venture <venture@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
