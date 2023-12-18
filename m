Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp890227eji;
        Mon, 18 Dec 2023 07:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0ir4s0Exyj5MbaKiT009bWkW5VK/xHuTHLiYiELQpHdsCFPDj//SZlUkb7lSWpbPbuP4W
X-Received: by 2002:a05:6808:164b:b0:3ba:e7c:7b7e with SMTP id az11-20020a056808164b00b003ba0e7c7b7emr16887413oib.116.1702915097340;
        Mon, 18 Dec 2023 07:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702915097; cv=none;
        d=google.com; s=arc-20160816;
        b=BTomdaA8FmMIoMJ1OSjhojrnQVQARIw9vGlnwzCH2r8ub2TzyqTJ83xq2wMiDeLNa2
         JmvDYPmjaN1zBbPixdHOsrHHcOXpwkFzzETIKMb6c2B9Jlu+vuBweu8WutexxO0Qt49M
         FwN1G7/w0pjlWeBRdgeAYQFG1Ffn+th093hYFMHmPWVNmRuWikIh146O/5L09LdElTX9
         phYVgbLnhC+C5nUKRi+HQZsRt2OiDWt5/63HvgfvCX4szUDegaOLrjZ2/jJOpopMCnDD
         m9mv7boqCd1FOd6IKe1dGLGhcE5NTKI7toJyFw4Z0T+HOBq7X8R4/D7DiiBLqVM4wagZ
         9dlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rdUNuBEvLOOb9iKUWdoAuufDrfRnKV+cCKgD/Ho8T/M=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=EVrmSQDjFU/KTYL2nsi5nrnVEStIp5v7b8xSDr4+wi1NrrqUJn03QnlplZWOWMFJBE
         DJvKFQ99sIJ5YPWetkWpKjsyd6BEr6HQZ1H5K+PRt01nehnzWIVCtzRVYHgDb3riNG+p
         DioMlEDyRLQdkIXTEsLJzvdJQr42EiVdJsBCC/6pOeAqcIgOXlXOnGGGpjGDEvUSL1N0
         did4WiNqYv2eA6c6B5zxNvkyOwJh0O8gg7h/0jTZzHYidKPLHzzRXdn6tSf46P8qP9x1
         nxqycgWbPhbgKCwZ0HXymUTpuciu/OgY3Yauk92eLZrzQELW3b4+AJ0GSanhEqCyDeVi
         QAog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vWNi0pT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a0ce38e000000b0067ade4b5b48si6545979qvl.74.2023.12.18.07.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vWNi0pT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFG09-0004Nc-5R; Mon, 18 Dec 2023 10:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG06-0004LP-Jm
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:57:50 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG04-0001Zr-Uj
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:57:50 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5522ba3f94aso3867044a12.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702915067; x=1703519867; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rdUNuBEvLOOb9iKUWdoAuufDrfRnKV+cCKgD/Ho8T/M=;
 b=vWNi0pT2HRcuk9DVYv+9GJO9aLl8MJvW7Wm0HF/g8Os1wUDMVQFLBHy+cf7SdJ/1K9
 Hu8g0bNyKfCYBjTRfegGNzLWRjhPnlDT2oQ6gUxTylLn+CU9cfzfGLAOl5sdPQWZUg5Q
 xkMhJZKHr1Kti+qCkbVXRg5m8fHzwfTYNKyYQZnjEtwxahsvQ4l+kLVEWQrtcAUPvd2w
 LAZWlswfpD6EB2UPfuj1i39M2gRhL/ufiMgyloiIaJ9Boeu/IaoLrjzuet3Bgcpp9ukD
 IB2GVax81JNo3D61K+R2JXpoHok02vjEbe6ypK/SUq376fO3KAxIk52DqR/jWdkJfrk8
 ZKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702915067; x=1703519867;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rdUNuBEvLOOb9iKUWdoAuufDrfRnKV+cCKgD/Ho8T/M=;
 b=ssi/kuEOymQ9bkiivvk/HfacNx7RzUAPNS94rS/csPjFicAGXm8Rg9AMEVDTS+gnC7
 iB9tYMIFRTTieXbpg1N4zs5Zn/JXyIlzZKwNSIS1Kmj1Lv2oyG4OoS7maWnuW8pUO0Fe
 34FcLzBwmaGUbFUrNnEn4qusbkaVH0AoyQpXB8JSvipfP0aFEXBUQwXZRYWcGZmtVEVM
 kSwl6LrzVXJFrdLcHSOheI2Et9w9mMJpaBKHzDhZkxWIQuM3AU9DbxWtTuXP0lAJ+XW/
 lECZ5ohSJlD9Hf668AuqSqnEznL4tgKEX3epMTLBR/Z7Y/r+VAow9BiWA9MNAMl2pLcR
 aiCg==
X-Gm-Message-State: AOJu0Yw6+W1hIyko+aT5lj1tJ7n8czXJFj50XhWRGqHqiqTXWCR0mRTk
 1OKWJjX1+TtxGoGcTLd6XPOo0f6r3hqQc7o5D4b6IA==
X-Received: by 2002:a50:9546:0:b0:552:809e:5a9 with SMTP id
 v6-20020a509546000000b00552809e05a9mr2223543eda.0.1702915066303; Mon, 18 Dec
 2023 07:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
 <20231204002619.1367044-2-sergey.kambalin@auriga.com>
In-Reply-To: <20231204002619.1367044-2-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:57:34 +0000
Message-ID: <CAFEAcA-7O8ZDv0NY25nsXzLuBZVTiKm32ZoyKQ3PEpHURWQpwA@mail.gmail.com>
Subject: Re: [PATCH v3 01/45] Split out common part of BCM283X classes
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2Jf5JnyrPFSu

On Mon, 4 Dec 2023 at 00:28, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre setup for BCM2838 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
