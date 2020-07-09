Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1465968lfm;
        Thu, 9 Jul 2020 07:22:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhTV3HJgMub5UOq0Cyy2tTgWQwKyLHCL3hEt1VzgUbjGDh+zoPO9Qg+6a9vnTuRLKht7e3
X-Received: by 2002:a25:d754:: with SMTP id o81mr52782332ybg.138.1594304551399;
        Thu, 09 Jul 2020 07:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594304551; cv=none;
        d=google.com; s=arc-20160816;
        b=GfVMRZMJyczn4qCsC9Q8UIly4l6mhYCJ/KKGiyx7IBcfAVT92oiWoNa+UHrKgNZA4w
         pVDKMeHCUMvZVquN54oLg1Fd8gIZR5Gt/qDsLHQRhxVbkOKhV/QJEO/INCZXx7BT1NNq
         3IR9cZp8fYOsHrNBnKubADo7ViQiZbTo4SRzlM4v/uniATDky6bQdt6VumfNbZItOxUj
         VY00hLD4bWZlL3oNvod2FjP1FxLYZnXujP75qUstqwTc1OIJiaz7YUk1h13i5Vjb/hsH
         MkMGvNPCei+Lj4f/5q+aNeFRzPxp3pMfI+kzwuZVzD5so/L/dSyDi/h3Lea0J8wkwBUn
         vkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SjSf6hCBtUL97Io9jvyEFUHtBwR9Elv/asoVkUIeEx4=;
        b=fRS/S11JJV1YeYTaOLgwGrMDfBzHUFjpiOw48NzDGDddSE5jNqL/DI1U8TyTVYXWgI
         AfywU+NEAEEp/bGZgDM9YdkB9czdkkVNLhyfLj3+jGbiuysfpa40HMr1v0MCVNm3KBU+
         rasx8rcE+Pk6h8IklW/SNQliJRD0FBS1d8zoezHnNco3rB85Cwp05PJ6BfnfoGwBpWYR
         B0G6FxE9SzxPzAnvGmz4N/ExJqz5+R6oXaD6eBG64u9fnBDN7YaTiJsgMmD5M+3zCzwf
         hy8ug0iQreIVJHToSynrd4j3lGeSwPQvBXW6anIBIAGyskGFKD5qm9iiFc3ruyqmNDpG
         iv/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FoxwY+uG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i145si2817540ybg.280.2020.07.09.07.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 07:22:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FoxwY+uG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtXRW-0005TC-M0
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 10:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtXNm-0007pD-Ck
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 10:18:38 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtXNk-0001wl-Pw
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 10:18:38 -0400
Received: by mail-oi1-x241.google.com with SMTP id 12so2002521oir.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjSf6hCBtUL97Io9jvyEFUHtBwR9Elv/asoVkUIeEx4=;
 b=FoxwY+uGGxQ04XDEwhyX0idakgKDHz3CfN6Y3gPRg/9mTc7lppZ+XkakxaAhlqz3Xz
 +GCnvOFXHVlFMIsdRV9/4mJo5QXOzFACXB0URygfmxErVryqi2+a3np4GUXcPyNvwS9I
 /fC8TZuwFxkKA3cJ4Ka/VZNiHdd+2vmV7XMc/VAzLHQtgrGYFbfjZNpfuEPI/ytug962
 zrzYGuhjjB4aKXIUJ6tA2ahiBT0FDvPkiRPtaYzgEfQ/IQ4a5TTr5RyzcLBEz/ee7f2d
 So/ms9ZonsIpDF6N3Mtd9uC9089ANwFNHEDs+Jm4vXOrZivUMP6rZ6+rltCMpmtm19iX
 luRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjSf6hCBtUL97Io9jvyEFUHtBwR9Elv/asoVkUIeEx4=;
 b=TB3w4faHa7RXf8GHND4Mmvf8B6E4DIAEDloa6+QyeW12VE10kOmD0fGqZHFnKkmNU0
 y+C92/aBaevIQjKWhQbnwAZp70+ed2+pJLSRWgS8mCqC59DQ/ombGnzNLEyQU4/590Q3
 LxEmbWUHE5uZ/jn5oKAJ+EhwZIS/fZH7unKxBLMA8py8k8uHz08d3DYMyjv40VZzA2H8
 J6AHI9HSV4+HBhGFaNpDwy07rigKBeb52QzDr/4xYTAjOkpT/vm+azkL7RRaAhQF6rfw
 hZxGGutLpIVQKVmV9gBEp+8qepGAixu7qucDZCKKtEiwh3k6fAIoJboyQuaO60LS3x7M
 nVCw==
X-Gm-Message-State: AOAM531eJF/H1OiyNl+Ac3rnI4BJYVwtLeWbzXgHDDZc+CAtP8IXb4CG
 gBY1EnHsMSmJVtN9DI9ONN/d1w7OluW31SNZYgE/QQ==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr166150oib.163.1594304314786; 
 Thu, 09 Jul 2020 07:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200708160147.18426-1-eric.auger@redhat.com>
In-Reply-To: <20200708160147.18426-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 15:18:24 +0100
Message-ID: <CAFEAcA_pvbeMEo9pmqbjEd1ojm-GF=Hcav9Lx-anVtU02GR=oQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-iommu: Fix coverity issue in
 virtio_iommu_handle_command()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8e8UJccGSTTx

On Wed, 8 Jul 2020 at 17:02, Eric Auger <eric.auger@redhat.com> wrote:
>
> Coverity points out (CID 1430180) that the new case is missing
> break or a /* fallthrough */ comment. Break is the right thing to
> do as in that case, tail is not used.
>
> Fixes 1733eebb9e ("virtio-iommu: Implement RESV_MEM probe request")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/virtio/virtio-iommu.c | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM
