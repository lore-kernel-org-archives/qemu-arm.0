Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2616292lfb;
        Wed, 23 Mar 2022 11:25:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxNn28Gyzoe/1/qnTADrwR2wGZUeEDGCzUImqZmjTBYl2JgxDpStKZMEhz44XKSdTZj1iV
X-Received: by 2002:a0d:e297:0:b0:2e5:9bbc:2455 with SMTP id l145-20020a0de297000000b002e59bbc2455mr1296661ywe.21.1648059942965;
        Wed, 23 Mar 2022 11:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648059942; cv=none;
        d=google.com; s=arc-20160816;
        b=Uh/VdZ+fjrSRoaeHqrTYPPiKHcDuKY+KDir/uolg0sMVM92mmGsVsGQL8G16Sr6DB+
         MdkFrjVaa21cKO6WAO/XZM8TGcmylLupifnCCUpBTiQuWfg+7v/EAU6uziTrhlIrRpnF
         NBP1eWZ2l1vyshwjbedKoWJ3P3P94s88BWlG/HK70mTtvzF1UkCilszyepurgo/HcXam
         016bQ7M7VhSO3/04cofbJm7UeoSr0QaAApL6I5dOe79axCVUIXQQoyILidgc/riLGb1L
         Tm1r5AS8cLh3knfWqZrXVwr+EtilLr7OWXTdyGyxxRHgipY03QVzn5uPxKn2RpLBnc+u
         hgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fKIlr/RrF+q+SAsC9iArZV01cGc9v3oy4mGG3+be0o=;
        b=Exx4x32Cy8l/KJNTPom5AJefGiiVGNq+rEUQVrGDdTzYG5lNLv+RiAHtr20zIEiHtP
         otaIZsNTpUujWsQytvqrQUZqkPzVdbzWCBTUwrtEmavO1Ob5ZO3d6PU3WCuWy/5+PIm9
         o4zCtfhObYMJI+nRvowtC965m+ZCsR7SmdyCAvu+ysNHeYCGBDF53ZYbNCji+K3u/w7a
         Fj+jhoeahY2o/xP2vKhXfsCxbHCeAFSItV1iJ7hB/QuodvuVyDNX8okIye+2jsoG1XeT
         ehMND/u5ju3pMX4ZwZU17wObVMcrxP2zEwvtsh4cheJqyfLQSXKk0KnuM6ydEixoWXUK
         TQPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wI3HqqcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a25bac7000000b006339940462bsi18627104ybk.661.2022.03.23.11.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 11:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wI3HqqcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX5fy-0002pc-3k
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 14:25:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5dg-0001Rd-Uy
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 14:23:21 -0400
Received: from [2607:f8b0:4864:20::1134] (port=38349
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nX5df-0001tT-3a
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 14:23:20 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e592e700acso27238287b3.5
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fKIlr/RrF+q+SAsC9iArZV01cGc9v3oy4mGG3+be0o=;
 b=wI3HqqcRlY8J51LfM6yVlT1G6aU4VnsG+PmDwI1bOUsg2rmHzrLM0Ptr2A9u8Uh+zv
 VVyyUKTuIXrGzYTW1uSdrMdhgNNmU4XTKJCrI5cbFPPQQojV4SP7RykXFpUpOLppLMVc
 3rQkVOBqNTO8rouGwX2B1nW5Cmbk7h247pBtMOqKfBvvzUBNQ0brmGzz1oRX0yNdFeEO
 siuXkerJDDd+uCTKDaCjM2AGlcxqfDlMp+xA9FSiNiODC50oXatla5Q+wtDXVqT+XQvI
 /ayKgeAJfKv6ji+HQ3Rgz8EpMcWKLmEFEIXGQ+4pFrnHMNtAfFz8qyLIgH5Q9aYx7OEN
 ydXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fKIlr/RrF+q+SAsC9iArZV01cGc9v3oy4mGG3+be0o=;
 b=Y4Cx0LS5ZPxIj6zutQd8gKrLElN/eJsrfP1rUPeL0M/CtQ9PqqmLTR1reUXt9phDzz
 rQtSIcduHvglJquJIVXPyJj9dUiiQi9etPcDLwV6eCY3Kad+iyAnqAeLRHo5wHbx5vFB
 a+uNC7RCfrRmM38PTYPTL87dmofvKGO0uz75pyOQCifJD1lFBvW2fx4CWZFVw++scD58
 TYYNeYzNxxSRX4Ws9B6faK3KIHZDgCkGogBTKPRdQEi/6I82AghvUKbjSClC2ppIUNXW
 ULCClxlgbwYwbUeVluZiLpGwF326DpeALRIbSi3tltH6RgEJjwapsVsLEzaxjWXHu6hs
 pnnw==
X-Gm-Message-State: AOAM530pi/Il/E1P/Zsxm1gyHmaC4j0u83X17ykkr3tHuMgnIkgwca/P
 iz3gsEQInRB50yTTdoBJoci57/cIfcnZeNeI+Y8Igg==
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr1262297ywk.455.1648059798192; Wed, 23
 Mar 2022 11:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
 <20220323173543.146442-2-zongyuan.li@smartx.com>
In-Reply-To: <20220323173543.146442-2-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 18:23:05 +0000
Message-ID: <CAFEAcA_EX0Fcm3OWGj-O_RZ8DMZ=Zfrj1MMPb-bD_QOwAV6Wsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:Real View" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 11/yhRSpD0Nn

On Wed, 23 Mar 2022 at 17:36, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/realview.c | 41 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 7b424e94a5..97ace560bf 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -13,9 +13,11 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/primecell.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/net/lan9118.h"
>  #include "hw/net/smc91c111.h"
>  #include "hw/pci/pci.h"
> +#include "hw/qdev-core.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> @@ -53,6 +55,24 @@ static const int realview_board_id[] = {
>      0x76d
>  };
>
> +static bool split_irq_from_named(DeviceState *src, const char* outname,
> +                                 qemu_irq out1, qemu_irq out2) {
> +    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
> +
> +    qdev_prop_set_uint32(splitter, "num-lines", 2);
> +
> +    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
> +        return false;

If you pass &error_fatal the function will never return a failure,
so you don't need the if(), and the function as a whole doesn't
need to return a true/false indication.

thanks
-- PMM
