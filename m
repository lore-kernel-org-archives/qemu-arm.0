Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp555524ocs;
        Tue, 27 Sep 2022 06:18:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uEq/V6HIMHXbInlWkFU2iSeM4KeTqCKHUbx0rmhcIfHY874+uxj9zqCsO4zVKwQk2Z8hb
X-Received: by 2002:a05:620a:a4d:b0:6cd:edea:39cb with SMTP id j13-20020a05620a0a4d00b006cdedea39cbmr17766160qka.392.1664284710589;
        Tue, 27 Sep 2022 06:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664284710; cv=none;
        d=google.com; s=arc-20160816;
        b=KNTgQbcx+Z0AcTl2w42WxYFbTiK03VAN5Q6LAiivKaywYSPFsKFVR8l12yjTpqRylw
         zDjcvdcmH28p2UDQOpdx73ETVE2v0Bd2bNCiIWL0qLoU0ig7wb7aRf4OUjIiZik7KNwy
         J2B85QXGEXT8n/geGqUMrhgxROtPNKzleh30s1IKIeV/+GH95g0Gf5lxbFtPefTiHt6R
         tr4F4lllVgNj+mtx8RUH1w4s/8Z7uYtNqr4ySSE2pgE1sZmUROmJ+yfJg+jb+WJ7MYJ/
         r40A2hsbMT/RN+Qdmh51g+9TaW/badt8x1dbIfKXwx3oTnzs9OCoT/iTNlH8iQH/Mdhp
         yqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QvQm1AFjV6FfUABQJamfGS4sWyrPGtoIrsjVqBoG3gU=;
        b=K4a8KKeaR2TfIfjihvoOYuOG8ewSIUodryh3YFM17mtpAl4z8Pmb/lONToYsTQ1F7w
         T8CoUb9Z5BxLe6mfiDIz+WonD8krDBax24YPu9q++xTX88TyoDz34YJfTHiiwyQdZ74x
         7LyIn+J632YqQohEFiXNR/BHgeWJ6ZpAvC9IuzLrDyvodHNlYiEOMtuy+nx0bkw2beKL
         +N/BDw7LbTCGVMjf9TK2QGtMKXp5kOWMVVU3NBwNgCOVavUAOb0rQJ1raPFQ/7cYIC6D
         F8tV6Wp0v7oltiwhBrG215HWGmtDYTlUQrNcwDyOlCSBZHDiyYQf3O3g6IK+C+vUAuyp
         mEmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSUz7LLS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020a05620a248e00b006ce191f4441si1011057qkn.476.2022.09.27.06.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 06:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSUz7LLS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odATl-0000wY-Rp
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 09:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8tV-0007T4-6r
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:37:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8tS-0004Dx-W2
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:36:56 -0400
Received: by mail-ej1-x629.google.com with SMTP id dv25so20002777ejb.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=QvQm1AFjV6FfUABQJamfGS4sWyrPGtoIrsjVqBoG3gU=;
 b=oSUz7LLS0LPlgLx3/9tWO+pMY60ZTyS/bxKvjJsprTVyWz7UpRXOtB8L6IJ6LZjvjR
 quogHxiYZo2p/GvTzRuMO+DGPBoKmNbPDUnX5H8t+7oHp+wgv8r6VNXR5lIIPNHiA7fK
 eLTWR7kRQGxIxcKVA0i+GdI6HRCZZe8zPGpDuSLzAv5TYZqmjdf7bh0Y1LnlC9jEynME
 hjdBjw1RBZIrkYyQpLLXi0i/jfpSu1bRxvH9IRIAdFasr47m3CtwIhXpiLRRGOXsKxUj
 eWpXxDzzh8jHaFs7YnI4GsaaMDrb3ZqeDperEddrKhYS9uNPff4dyZeJNvDvrzkPQemX
 8hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=QvQm1AFjV6FfUABQJamfGS4sWyrPGtoIrsjVqBoG3gU=;
 b=Tnqfq1d9PNdovA7hAqEjo0Nzi47oqY07j8ApHMXAsPWlWjHfoy6Y+rGyviQGsxiMvL
 iyWRTKeivY4ToVPAiMgKtSXjJWo3zaI8cWOBxRdBYts0gBERek1Nyc7JCrSX+5DOOaZ2
 zb6lv47hq1GqILSUERiYu6b6WVoueTbrTjrgavWN6QTI/2RtYDm3FQYa+BxQmh8TVj+9
 XBfjAdu1S+nE1wiGimIDenYbyj30us+7dX/FpRnI31R48d3/7pPRIMjIC0g7o+00KsAo
 HTQy5cJnNdLptbD47ZoC8PsMPuwGOR0Q72wPZrLcUMD3KfWgKwjW1uMEWepgyPCyGXCh
 /ZAw==
X-Gm-Message-State: ACrzQf1+Q08iEvWEz7Nawu0RyajrSV6LJQcJaktCGlcvYjJHDFkTw/qc
 Qeby8XaWD/fyhUi2lnHkiQkhaZqwzxz8oy1hD5esOw==
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr21654946ejb.609.1664278611440; Tue, 27
 Sep 2022 04:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-4-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-4-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:36:40 +0100
Message-ID: <CAFEAcA-qM32oBA_X5H-Teug4ADnhpZ=2Pr=4kRA0Zi=OffUoZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] hw/arm/virt: Use "msi-map" devicetree property for
 PCI
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SCa+RqX1RSh/

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The "msi-parent" property can be used on the PCI node when MSIs do not
> contain sideband data (device IDs) [1]. In QEMU, MSI transactions
> contain the requester ID, so the PCI node should use the "msi-map"
> property instead of "msi-parent". In our case the property describes an
> identity map between requester ID and sideband data.
>
> This fixes a warning when passing the DTB generated by QEMU to dtc,
> following a recent change to the GICv3 node:
>
>   Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1
>
> [1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
