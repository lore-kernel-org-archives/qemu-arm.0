Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1506355lfc;
        Mon, 8 Feb 2021 13:18:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRDb6k68c1pDcwLX/a0JBvqpbtcX2+JeFdjIMYmwv172J5JSXjN/dT86Eu4WIJSy/JLeQm
X-Received: by 2002:a25:7c46:: with SMTP id x67mr27154856ybc.464.1612819121196;
        Mon, 08 Feb 2021 13:18:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612819121; cv=none;
        d=google.com; s=arc-20160816;
        b=tR+IcQpvKebYdrMemA0bawNTYYfxfAj+pbzQWNRPBTzXVemIbAjBGPJhq/a6UIYeZT
         WZ9vGN8brXBwgnBh+oVaGhD4MA5gP7F1B1mSueR80CVGxSlnABYwHCJiRTXeV5lLpQIA
         otQ2pGCqw2AxReIo9TdIBqhiI1E0XYE5fPA8wqzaZByBloAinN8KuQqN7eIxPzmMNn3M
         EkwAyflBODqJHQgIHTTndZ6cTqkzp95zjMFT+R6PWc0D2kztcgG1sLd6cjepoYBearL8
         fSu5DIiKnU3tt2M6ZUYXItKqZ6vyowm20WdJx2sePT2uIVOXoZRSYfB6Acosbzb8ewA/
         tZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kKunk7wR904qs1BuzOAma2+/9Q4cCHKYLwunFcaR4+A=;
        b=vDPhQYa1CdnlTH1yIQRl5F0CmpB37bM+WlGotDoyV8K548zAMCex15fgVV0+Jeve3Z
         FA/8My+1NqKBjrZwfAUTGzlng6++RiCQCpRXxmF2L/qKdnvAO/ktzNbt/X1NIbAM6sop
         ERTEUGrZC/4hy61/YGcV2ISSB6oB0GdR/er67drnAUjLThoHTIJypZmlc6Vp9xKrn2Zi
         ShE9B7BbUXOmx9//a4dmQFZLn6efsBk7i36KZc7Pj0nNH+eiLA2KV3qeBtBR8i9Y1q7i
         8y5Z9DOxnP/LcEy5g3buuDxhdqZbD8yZDEUVgyhrVzedinUnJ8o6ajMpfCPXfHsrlniB
         qgLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCp8qtPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si16668527ybq.277.2021.02.08.13.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 13:18:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCp8qtPj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Dvc-0006wP-IA
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 16:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99bC-0005tw-Mu
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:41:19 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99b9-0004fh-Ge
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 11:41:18 -0500
Received: by mail-ej1-x636.google.com with SMTP id a9so25896224ejr.2
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 08:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKunk7wR904qs1BuzOAma2+/9Q4cCHKYLwunFcaR4+A=;
 b=UCp8qtPjXyUl7ljVb/eMB2LJI7qlTHYEMGaUIFFkZJBP4OLbCcXWJWnM8swq5Qyrhs
 eia3CZEa3YrUoPy9zixNINaMKB88srqT+gLX/8bDg2OJYt2Foe2M8c3qsCl5S8PkOMMU
 d8D1UfHhz2g3yvCZQHFqG5t6TLO8quui6DfOH40x6pR+Oy8elUUvpVD8m89iKtlZOWh5
 8TRaqypuIjgkdHm748Y0NOvvBPmGNMkdyFSdn1r6+PAqK93Z1Pwe68/Kt+dHB3a6cnEB
 EiPTy+AkNg2qILYSzG9wHArSL+Woaa8tIcPtQZqdeOtLnoRmPt3OrI3u7c/MtMpdgCTp
 2NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKunk7wR904qs1BuzOAma2+/9Q4cCHKYLwunFcaR4+A=;
 b=r6rfkYMwI/E3Yv/JnzYcE2b8y8vV71xTEHqVYpdGA0LQv2bx94ZG1rg4gxqjDLNka6
 FSJBjJY0XvOeNMbOrqFfgm2vGiMTjqtL05gV8XnctVY8kvFJKSgYNF8AqKJAqhB3r0cH
 Y3HJbUQTi9Uo6osBp1fyaaj5oGwPQt+bkrk7aZjhATZ4UPFIzCtZm5MW1kyNu89/PI/K
 NnEKtBl+u+FHC09RbUgtM72oPRsgtK04GZgk5YnhFC+rWJX+dxulIv8NSOy13yHAP3f2
 eAig+aeA9H/ugq6WIGyVauKvCL8HIU9dfObaTumaRNaNmuquKn6iq9Joc/Ea/8lqs1ST
 ZCsw==
X-Gm-Message-State: AOAM530pRcyGOfkb/VZDiRgS/d1OylcgcPUBW7SxkM5sqItlNoRMP+nZ
 Q+PJZDmzNmJnjXQm7PeeUAkjvXTtaw4z2GeDO7Frgg==
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr17869421ejc.482.1612802471303; 
 Mon, 08 Feb 2021 08:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
 <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
In-Reply-To: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:41:00 +0000
Message-ID: <CAFEAcA8n8sLTaMGiW2wDKsxS6zCip-Vw8NQfOAv0di7M1kQk3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQsjYmGXBJ7k

On Wed, 3 Feb 2021 at 16:56, Mike Nawrocki
<michael.nawrocki@gtri.gatech.edu> wrote:
>
> The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
> to 1 only when there is no support for AArch32 at EL1 or above.
>
> The reset value will be 0x30 only if the CPU is AArch64-only; if there
> is support for AArch32 at EL1 or above, it will be reset to 0.
>
> Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
> is supported at EL1 or above.
>
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 16 ++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
