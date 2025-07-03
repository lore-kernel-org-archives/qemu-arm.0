Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp500435dyc;
        Thu, 3 Jul 2025 05:29:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvNlYK2JrdBbLeFjNhO4VTHv+FEkPnSkzCqnWbOohb4URknJZCKLvWdA1SADAMNHASt+MHsSmrv5n5AA==@linaro.org
X-Google-Smtp-Source: AGHT+IGmtbyMgqwqafdSaAE16c93yWYogNNy2/YMrjUPzv698gMTPgMHbHsrUxSjXSihFnzNrwMq
X-Received: by 2002:a05:620a:7085:b0:7d2:2730:92b0 with SMTP id af79cd13be357-7d5d14758f6mr465692685a.38.1751545764676;
        Thu, 03 Jul 2025 05:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545764; cv=none;
        d=google.com; s=arc-20240605;
        b=ER2M0y4RC9ac0yAX+AYDZfOGF2n5rotANZrl51IYeHmPXaFb3rCe0rVJz00UEbiB6v
         uIYVIv9c7iEZRG095kiAM/vJJc0kSfiYgfG40wPLx91GJkCQ4N+qpN9KuGeT1V3Rx9Rd
         V5HReJS+xEwNfYmce36sU1oW22czLhfYfYKW2ha5CSofOgE7CkLZyXQc4Ko7zPchqGfr
         yi+hF3/rmuIHRAsRS7B+6ZHas+6foIS4so+toKKpYkkuc/lQL+gZqdVKQYp0X47Md0Fj
         umRKBFzE8LNSAhGAwijYTNYM8QpNej35UAZy10EiOKb+3clpkdtdhLK/db26kFpUHeW0
         V5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8xdj6c+38EuRY+1BuRHUGGDUpfQZzXq6foPApM0LJdg=;
        fh=wQYjbGB/tJBDEKVKpFP3/m6CIe7uLmI3eowfhjggOVs=;
        b=O3q7IGGsgaT9wnponsvM12XS98feI5aVTjEFARluxkUHCEoqnpPKssaI7pbFojKMY2
         hFr+eAWhcp3HzHJb7GX5AFp+R3ob+KPQcVl4QNYXhofMguqc9VGpJRXlKmWmK0sOl3TH
         HjeO6fx+7YRpJjIaW8GcYpfVAn6PjsNmsSZH8pEpYJFIL6Mczic1pFGbaArv68sj+Snq
         h4Ymd5g+EYCf/jTf2xeahlD+UVIF8aob/g0A2l0kzGdOnaMjnmYnUYcqznI2+ZmBuRpj
         BeyRwKjHdaOmo/J61opon1x0Qq43tW/AO6cqOq9ILvM6nvi+6G/bQw9W/xySfffo4r4T
         aZpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SlxU4aKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44329dd6dsi1495762385a.587.2025.07.03.05.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SlxU4aKQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ43-00025a-Tm; Thu, 03 Jul 2025 08:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ40-0001xt-Uk
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:29:17 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ3u-0005WM-Fm
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:29:16 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e85e06a7f63so4803756276.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545749; x=1752150549; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8xdj6c+38EuRY+1BuRHUGGDUpfQZzXq6foPApM0LJdg=;
 b=SlxU4aKQnPD6ZbeJbVrf59oPVCyAjZ5vEWFoX7HiNiP/r/VWwQrOprqb0LnYcGPuMA
 sGyTQ5OUk7+mZ2IywVg65czgdB8LRapfr4sKIiDHvdemh7lUWDDOcCC+7F0bDj34dGjh
 aqTeI6JQMb7NrCeOO7fCFsRtWxj3Hhj8P64iJ53VTvTIsgz5Rjg5jdsiYC/8sjnxIkTz
 Wa68q6nuOWmXoglKCD8Lc9G8oRELJtPtnRCyZ2aND6OqQLeG7Wi/hLP4FZTTLpFTC/F0
 pkKLceOIZLOO6F15MIRGC2UA3eSq9Xd5qzBh/HwtDEQbzVORcAQFAed4Sb/PjLL6WjzE
 kBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545749; x=1752150549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8xdj6c+38EuRY+1BuRHUGGDUpfQZzXq6foPApM0LJdg=;
 b=Nc6qGOPIogLvBBMz0dXR5ctMXHDEf4JFXBKoWz+6UnvoUYqtNhdDKgMd7TPwQgFOwB
 86TtutZQvie0lwDOsG4zhoAaQC0ZIHDa/T8ZXc4gbB8eUUewu63Opv2daNCiBAHwD2B5
 PnljXpIqKgV3X7WvA32cNZu+pwDA8g5oDDXlxQjNnFyRoqazTrmCG6fo6WEZVGVC8RsZ
 5AlXVt6P5AnvlPSqtJhKPXyN+TGX7WbETQeoKVhuGrdK/GsnIdewJomu6sIDYoPlfvYK
 Xg053ZLPdWIxZwwWR6P+Rjf/kdmibYoX2KJqC/OhN2j2TEnGCkEpc++mOUWZpKbBgX95
 whcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVty5SKVKhcoSDV/rs7NOPRb6KwbTHYFgN0coVdR5ly9zCgZUeCS1EEqu9cjn7igZlr+Syikbewfw==@nongnu.org
X-Gm-Message-State: AOJu0Yx8easYXZzQhoQtTnGeWWGfHqmyRas8EW6eqtRy2NrGC5L4eP7E
 LAnUqYXE5wL82wrJ2HhUpKgE3C8L8z0RA+u5Vb1s1sAOnFbfhkgZ0oOY6/RwMJpT9e7tSe+6eD3
 JWynnVpmnttCfjn1MdW3nKbD9Frg0Di8VStGd2oBliA==
X-Gm-Gg: ASbGncujSafT/90jB3yLIFCpn6cxv9efPTyqyAbxXsGaqs+uTFptUQYhbHWzGYVd0GX
 VhPJ0VAs5kRrXqQZMekAbSESDT8FfcuNddbM0WSgN5cbzrtsO5mrUNPBzMveTls0fAvZ4fE/0Cp
 0cGWV+3l7ul/SR5RfUPJasCeW2KtUv6/+a2ENday/JWH7o
X-Received: by 2002:a05:690c:dc7:b0:70e:2d1a:82b8 with SMTP id
 00721157ae682-71659114e63mr51031687b3.34.1751545749064; Thu, 03 Jul 2025
 05:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-81-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-81-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:28:56 +0100
X-Gm-Features: Ac12FXykxzDQygu4kX1dW4atCoFqSZBvU5F1kOYcZPBFtT4VMBE74bTKdnJKwC4
Message-ID: <CAFEAcA-jRUBh223-NL0fDTfdo1fWAafPj41e-nuHGi-OMPmAfQ@mail.gmail.com>
Subject: Re: [PATCH v3 80/97] target/arm: Implement ZIPQ,
 UZPQ for SME2p1/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-TUID: ZJv6/RPPM5qP

On Wed, 2 Jul 2025 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    | 10 ++++++++++
>  target/arm/tcg/sve_helper.c    | 29 +++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sve.c | 19 ++++++++++++++++++-
>  target/arm/tcg/sve.decode      |  6 ++++++
>  4 files changed, 63 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
