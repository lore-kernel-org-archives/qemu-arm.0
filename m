Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp378536ejb;
        Thu, 5 Jan 2023 07:13:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdcaQI83xaHR81fueSESBnLcPeOi1dOktwfH22rQ4uwZJljGyAf+9v7UaVn84cUlUGtlpa
X-Received: by 2002:a25:818e:0:b0:788:3d49:a131 with SMTP id p14-20020a25818e000000b007883d49a131mr26951660ybk.3.1672931590952;
        Thu, 05 Jan 2023 07:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672931590; cv=none;
        d=google.com; s=arc-20160816;
        b=hkEbBc6kiZ/dAgloV/Y7xpqKdGYK5pYVxu1+tRD/rfJ9AImQ/GVXdGLUCduOs8L+q5
         nK50ORHstnrsacMgPNO8UGYdzyGMHX+6u8vFeAPv7WvMpmc3jTzvlJhZR2hOtb8h3itu
         2R5g4h1tYXVJ+xA08kWD9QZfFj/F81i66+KD4iAYYal8ylhI/S11o5iFXgypmQpA7n/2
         rRxosDW0R1CEr7Rc7zsNubfWoezt3oNJP+4W5xkSSvzp6vIM0WlWEYfOjd3NK5fWxMZP
         WYFQQByzJcZXkMNPuWLGkojFV3T84jiRIR5HC573g6FJJW7MnRlQtlxIF6N3DETjuGaZ
         quEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kA2IQbg7QjNFO5SX4+mDwkeVBtI/d3z9EsVDhVYfgIE=;
        b=Q7tcdnuO98q6Vxo9fVApPEbodFUNMSnXcLOZp/H9tXdHGLedzmnlcKXxVP/8yWxSUX
         9Jo11xGwypnGmTOvtCHyP4LQc5aMK6Agz8tuWoA3QcScf/y/5CREoeKFGoTvoEf8XiYB
         N8A6Oo11caTRbXrkRsoR/mbzMi6dB9tW+AbAZx0ALMK+/VHOV/l0YHc9oCv7+bfdhJwa
         6QajBLAHC5wePXPZJ37vi1H5lwEbZSrWVHz327q8IwR6UnlY57OeFDwMXjiBQUoNUqnK
         VhT/N2qVpwPaLlELb2DlYcTrxMboTLzJXzbnFiSi3BwcNFUNHUxolVyW/EDNxFqBsVK6
         I8fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RN+6aCKx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020a05620a245300b006fec73e2573si21369670qkn.210.2023.01.05.07.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 07:13:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RN+6aCKx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDRvK-0002Cs-82; Thu, 05 Jan 2023 10:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRvE-0002B1-KW
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 10:12:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRvB-0004UP-J6
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 10:12:47 -0500
Received: by mail-pl1-x633.google.com with SMTP id n4so39637571plp.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 07:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kA2IQbg7QjNFO5SX4+mDwkeVBtI/d3z9EsVDhVYfgIE=;
 b=RN+6aCKxljBaeJ0JfY9XC8DQvXlJIrcF+35R3LGG3VZtszabksuNo9FwwoZJQEot60
 XigkELh1wkhnsRw7CuFbcrn1PjoJ1yjY6jMZjx/SzV0HXg6Er2C5w7pURIDA8QBrJxOZ
 0kVcs4PYWtnpV+UcFz/xJ3MH3pZgheQiuTx1VYlM0eQr8nRLwVuQAy/BhcScvUJ6n7Sp
 Vpys1zm5P+J4a4O3oXGdqLj8mxCSxaOkwjnfHBffdzQL1abaMZoyy4ebMuYiIxCiatFQ
 J0O7LaO4lYVb1mqRTuwaYlrZwDcHoWeWH1Gb24OIOe0xrVtPilCLxIxIuZD4RAiWfySk
 YDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kA2IQbg7QjNFO5SX4+mDwkeVBtI/d3z9EsVDhVYfgIE=;
 b=cePsTiKdjUYRxnvJFaCXstJ7ZIx0Rp7UHc+3ASn6k56VQ54Zze3RY6mBDx+tBwehur
 C9l9xddlSCjRbZHGDsDde7NRAaN87M91Ue9mTyMcXyVJ6jT/ph5rFZ6Z1p47/MPavByX
 8RWxmQ3djzc02jCJlywQ5htVy4c+IaGndoVNy5WGibPQ6cuyj3e2fKLiUmrtitEGmqme
 BvoboFYDIK9/g4V2dvK1/wxg0xQWs7Nfwh/RVKRHFGm9/eCp6UAEphD7DdjrPDmmeBx0
 1orAJzVyqzjyRSCPWADi3TdJubhQQAWQ3ngvQJwbXADYkrnoMSzvcPeiVyVCWCeLKa+t
 VsiQ==
X-Gm-Message-State: AFqh2koP2toK4PPDP9WiISSc1yVJc1EvEPMotZOdU6cUVAqmeGwfvYHN
 BDnCwGFiA/8H1aKMJR3IhdRv3B+AHyXfIEr20dm4gw==
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr489064plb.19.1672931564005; Thu, 05
 Jan 2023 07:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20221226101418.415170-1-jcd@tribudubois.net>
In-Reply-To: <20221226101418.415170-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 15:12:32 +0000
Message-ID: <CAFEAcA_HfPLHtm55Q_Q1X5-SWFwwEbT-=97RJ4u-FdMCROQL3A@mail.gmail.com>
Subject: Re: [PATCH] i.MX7D: Connect IRQs to GPIO devices.
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Skmorx30TN6e

On Mon, 26 Dec 2022 at 10:15, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> IRQs were not associated to the various GPIO devices inside i.MX7D.
> This patch brings the i.MX7D on par with i.MX6.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>  hw/arm/fsl-imx7.c         | 31 ++++++++++++++++++++++++++++++-
>  include/hw/arm/fsl-imx7.h | 15 +++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)

Thanks, applied to target-arm.next (fixing up the trivial
conflict with your other patchset).

-- PMM
