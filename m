Received: by 2002:a0c:9e41:0:0:0:0:0 with SMTP id z1csp2297890qve;
        Tue, 2 Feb 2021 02:27:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJ/rgDbYwY35qY0RmEz6rdure1pE8o98CNlOGBllB/ok7YpBeWRYHddrmd3kHGX3MYVIMu
X-Received: by 2002:a25:bfd1:: with SMTP id q17mr29722373ybm.2.1612261669995;
        Tue, 02 Feb 2021 02:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612261669; cv=none;
        d=google.com; s=arc-20160816;
        b=N6r+9cFZcCjVMux9r34dJina7+c3VJvpniPi3aJOAmWFCOB2/+dSZkDw8aFm8tA6MH
         hrfOk/tJq00oNFvTPeCo9iM1G4zlz8Se4xtbs1bcAlvohaOO0srXda+cJBncZErdRweR
         GU68wNarsxNODgmcvsEyU7v6fzrpabxstEUW4bb5BZYmmARJiwOxMEz/3dznNscnRUEu
         qjrgVknlXUsDfOwBxYHmbjtQKHfWKC6OduPLY+Ga4kgDiJq33TTvNG0eNkrO3jcnuR7M
         HgrjmGYCzyrAyOZCdtqtRorlYBIvTFVrleSgPqcdVjALk+MJrAwFzGyNu0wwOZljg2BF
         mhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDdfEeCYRik4cDZrmRBoM1D0iYOoCJUk5fPHfHXbR4s=;
        b=SOx9+VE9pkhnCppimi2sDHSLwDpXVnOcHC9PFeB5WNWjbInUsQEZVTdayx4zEH1JN4
         BLJ9zmK8PITxMEv6ONoTfbXzvzLxbv60IyrLkHJsvAKjqUSKh9kpVi89vXwtfuD4z1PI
         BW0gvbceoHVoj7qzZTlyMb/u1hnQtAbEBrR0BLUewQsiHzNa/jxCbEqPX8BxGjgiKYHy
         sxhSfLt3QgKCjkYQ4t7XWH2tjOpbn1FdY1ZCJ/y0IFIgKKj4KCrtE1Q2AnN4ABg+WL64
         TSgqVCTBdoCSayz6rk0KhLK4+vW2cbKaG7L6elZk86h6H7XGGxZNsEvVlqYLtsWa+Sg2
         xEzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TKffWAJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si18912787ybp.52.2021.02.02.02.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 02:27:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TKffWAJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6suT-0002hX-2i
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 05:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6suB-0002gk-3e
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:27:31 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6su8-0002QU-Hb
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:27:30 -0500
Received: by mail-ed1-x529.google.com with SMTP id df22so6320946edb.1
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kDdfEeCYRik4cDZrmRBoM1D0iYOoCJUk5fPHfHXbR4s=;
 b=TKffWAJrX9ftbdpRiEe0SlFPh+SKCqeVMkUitQmiOBNBuQTeJ8Q9MV5ruurE/an062
 q0HBFfVyQPzGy+XeYj0Yhssjo4bynQuGPXBufvqiEWkQ1lLB570Qc18PrJHkkyGBHM1X
 OPxCJVBEcf+ceSEU8g/hwd48xwiPDq0gFHyANsmSST8snCpg9IQHxKlCo4tCL6lrNrfp
 0EFmx7xNcH2y1jWoshHFjNdUH0VT1QiRnr4O92HzzujqH9k8gbmuoZRaFFnSrKdtJVzv
 lr7nGQ58F/te3wDERXVkvUiWBBhZRGis8tpp8MA31kazHzXa9NnhaZaB1Df3ZPfN6G97
 52lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kDdfEeCYRik4cDZrmRBoM1D0iYOoCJUk5fPHfHXbR4s=;
 b=EjAuPNg2ja4MAuAtXeEn0gLER4Rt1fP32oC+ibd5C0zUc5TshsYeQ0rsoZyrpysGjl
 u1Eb6l/l3YDccNxa2DDTRDodDWwvomkiwLh606YnG6iVjmign4CKIxhe87Q7xZxcqVJU
 lbm21G4y5qlv6YIA6T3YynJb+bhuHVjyCMguPZzuwIbNWGvEpEKcPKT56leYHR+eCPyw
 vvoYKaznFXHzerBOZnvvuOvHQzAu24h8LLn8GEyTzbRkRqEtex6efiPYSuLORkoNsLvS
 UpMQyacReTziMKZPcAl5ih6Vxnsz6mfKO079hjSUUKlScVEvpRzINY9mp75pe14zBPv6
 L6Pg==
X-Gm-Message-State: AOAM533VV5FPufSpNMspoTacbYJRzG3649C+J5blRXo3MYqNTRSL5fk7
 bJV3o6F6aWzZKBLMTgVhdOLwfiCrjjOKBrQPO+G/nw==
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr22609762edb.44.1612261646734; 
 Tue, 02 Feb 2021 02:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-3-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-3-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:27:15 +0000
Message-ID: <CAFEAcA_bzd26RfYmtV54fe18aFiWsPSc5t644s0V9Ch+nGivHg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] hw/intc: add helper function to determine gicv3
 redistributor size
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p4XXOzhsT/T1

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> GICv3 sets aside 128K for each redistributor block, whereas GICv4 sets
> aside 256K. To enable use of the gicv3 model for gicv4, abstract this
> away as the helper function gicv3_redist_size() and replace the current
> hardcoded locations with calls to this function.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---

We're going to need this at some point and it's nicer than those
hard-coded 0x20000s.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
