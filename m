Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1182411dyc;
        Fri, 4 Jul 2025 05:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3BDhTCwEFmB1mL8A8i096UKUu6hAvz9uezYWQTj/aKRQeUZsYOT1pYDKosipayCBOEFoxY58AWXWjQA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhbdl4i8yIMvXZq11ndPy7CDvpPL38g/lzO/T0XNn9lwn4SR3uqe/NqWmFPYz6jKssv9YV
X-Received: by 2002:a05:622a:d5:b0:4a6:e7f7:5742 with SMTP id d75a77b69052e-4a9987c0362mr27377171cf.33.1751632876130;
        Fri, 04 Jul 2025 05:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751632876; cv=none;
        d=google.com; s=arc-20240605;
        b=cvdVadWAAW2o3HfSWboB/8gQTBPlO4ISX7AzywtY+WdrPYNhHWD9fGwd4UBky43Kg7
         fBc7PD25UlB9noxcT3NOX9+iXWGeC/bRlNXgOxZoEYgAK8zR2lMnyKnojiNTtrYUxbTc
         NYbQe/AMkBOIu9H86Ji0n4hJiZTxNZkek9c6BzP6hcmMh//Xn1PZtpEneKykmApuVb17
         6tVmHllpX94JkUeqn/sFFh59fPMOVq3NPxA96FH1xk6FpjtbTKxlbgC93Ty7X5YSG+Dw
         CROKKSTpLVQi/gSeKqPeV2whdYbq4qXhmrpqPaSSSCHFc22ctmNBQbdagzH7LR9WCk3F
         Xhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Oi+QwgFyUTXPn1NiJvGnj1atO4ZVxhr1ZCjf+8aeKe8=;
        fh=t8oagjyY1JQg28KiLqvtEK3EhhlLWinSMWSbpJO54ew=;
        b=ZZK5c7xs0nRPI3gUkyhm6aa+D1mu7wOGEzWpGgwIJU9gOqz06rDAAgue3RRPKLcpqA
         qV+OCYLcEttBsysggGBWtQuRsz8WyXy8m3de4rd6fQvKK3RBsFMmOxNF8aPyV9gQuJt6
         epah7AsK0KxACA8lFYIWWmKwO/u8SiwvBquvGvcEk/KWqrFqA+mZBZY3jwVvQ0VGrtR0
         L9qz0rP2u/MdgMhsBDg5wKFNUfkuRIXhlI/gHFjAD/tVkXyMq63Wtcc12HZ18g9QXEPQ
         AfMjgU/DuuLpw3RsZrdKpUanbtcXdxIKmKw7tKLmgwIjgYGs67G4aVhKK9E/kME68MKp
         wbHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDmK1JJ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9949f3b97si19090661cf.53.2025.07.04.05.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 05:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDmK1JJ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXfiv-0003Pq-1m; Fri, 04 Jul 2025 08:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXfiq-0003PK-CS
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 08:40:58 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXfin-0005XJ-9k
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 08:40:55 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-7111d02c777so7307267b3.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751632852; x=1752237652; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oi+QwgFyUTXPn1NiJvGnj1atO4ZVxhr1ZCjf+8aeKe8=;
 b=eDmK1JJ+foxfmVOqoSmm91cxLnNV9MUkSNDR1/c4s4lwKeHm4tAd8bJXot7sPNFZ2Z
 3hGz4tWtZuJY9VpjIzL2OSczSWeO3D257KIPm5VhJWvlvfVIdpmdkTZ2Ll6hF1OMixfn
 98ct0rJjwjBnJ0jw0vcm48S7Uiw02noTWarTAXVppLzerXe2o/gfzzm4kGnIvT7tjqlR
 O7KeCmBYK0mZ1/6rjmOir+WcSm+I7NjjMdcxG84pmQ0hi2Fm2y4p3uZxPMTrSYj1MdFq
 9pEjwQ4/zX69UXVAVNrkcNFuzlr1bXCNkgYePTYNRxQa/DAO5BD5ASKwRChW3vW5VyEy
 /tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751632852; x=1752237652;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oi+QwgFyUTXPn1NiJvGnj1atO4ZVxhr1ZCjf+8aeKe8=;
 b=j68mZ6MtbnMPQhIyk/pM5xONdgg6jVZGVTo8ld66YNgyaELjwjHF1N31yG5lyOByej
 a8Jxb1LWk6DUNP5U1Ley7eVSTEE8FRFh4OQR3zl/oYZWioPwVhq0n9wFh2e1sQ/Xa2Zh
 1ZbVpoyfjkgt7YdK+N99I5cY76raaP8yGiTC73rVrsefTnUwFgLVDn/8z5j2QKv7BHaU
 IBAxp6SOfenGjlMWx9RhY4mVBy+XSdrW6+t71lxfkf6GcmGsJX/QxO8Uqo2XkJGs0SQs
 W8WaI4OqR6EqpbxrDM8aR2TqZDLD4NhQL7sJpN5nK4XaK91rGqxvRRuPH3HtmDWuZ9OT
 om+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZFDamgYH33B5ywV9f516l50lftyBGO30pG8782gUyOB6iYd/NKBqSLfKRnavd7XsEha70YTvCZw==@nongnu.org
X-Gm-Message-State: AOJu0YxYTc9aHxGblhadWZHeELDbObkkLq2u0iP+ghWzrUZSytGNhnuF
 a8Hx4BiLZXLamsgVgnd8WD2ryhWntVEk/bnQJgYSKUwPF+V+UO28UxJkdnZd1IaJxaA9SPVG4WW
 x2xLTjC8PsVUVNlAm/yJmaSu4rBmQmdCwfsRrU95iQA==
X-Gm-Gg: ASbGncu7zaluHZGJsWnMZvi5yGUaXAE3eKAK39xKDJxwWpiCKyA41t9kkdrMOjyAlwU
 Te+zv6dpDZn2acwRgpVB4bUWjsXUw51nRWMSYLqQBX344w1nJLawE9g3GD1N9gIhMD0bAGmVmek
 1H09HyhIhJUaIQ2FQPr60zp9mtGZ3k3IRf78BRhFMRbUXs
X-Received: by 2002:a05:690c:388:b0:70e:2d77:3cfe with SMTP id
 00721157ae682-7166b59391fmr21731377b3.2.1751632851568; Fri, 04 Jul 2025
 05:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250702113051.46483-1-thuth@redhat.com>
In-Reply-To: <20250702113051.46483-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 13:40:39 +0100
X-Gm-Features: Ac12FXwAQy-fGZxl-rZPBqEozJPVINFPiXiYb--VfE338vSNvFl3U_AX-A4dhzY
Message-ID: <CAFEAcA8_D035si+3n-A=px4nF+2fVvPqRvq7A9HcwSxW6rpx4g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/highbank: Mark the "highbank" and the "midway"
 machine as deprecated
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org, 
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: Vj0Pzidnq80G

On Wed, 2 Jul 2025 at 12:30, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> We don't have any automatic regression tests for these machines and
> when asking the usual suspects on the mailing list we came to the
> conclusion that nobody tests these machines manually, too, so it seems
> like this is currently just completely unused code. Mark them as depre-
> cated to see whether anybody still speaks up during the deprecation
> period, otherwise we can likely remove these two machines in a couple
> of releases.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Here's the preceeding discussion on the mailing list:
>  https://lore.kernel.org/qemu-devel/CAFEAcA_0Hu8+G50sy0FJ2rX-=cNymLddDdrS2nN5ZY-doKiT8w@mail.gmail.com/
>



Applied to target-arm.next, thanks.

-- PMM
