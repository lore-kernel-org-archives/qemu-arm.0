Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp501701dyc;
        Thu, 3 Jul 2025 05:31:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHqK38op9AL+dnB7CeEChYF5meyWK6jnjkvZmr5CgGNjZ4D4nRQRd4pj/WzXIRRxs6avA+xm+9tOAORA==@linaro.org
X-Google-Smtp-Source: AGHT+IFxNxJDw+mdclEAaUirHTI6DtbWVFbpdpsd6alctRkGI07/3vTFV+vQpmhOguQiT85Veah6
X-Received: by 2002:a05:6102:2b85:b0:4e4:f503:666b with SMTP id ada2fe7eead31-4f16106cb33mr5741853137.3.1751545891452;
        Thu, 03 Jul 2025 05:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545891; cv=none;
        d=google.com; s=arc-20240605;
        b=GD75tjCNqHZ5Fra/nHGm3abQFhIlFs3JDXcnZ/HauiHq4Mk1z/nRH/ueliQsXaGdOI
         skBR3uRiQ8zZntTXOkxYSpj4WRbc52ufnvHQCtJGTt4zqemQ0p55oZNL6u3BO7SCBBIC
         6iOocuIiso0WULH6CyoRtzM7xuH4nvS+XS2RA87v7EFMzbXT4Eyd0kzLTtRKxEvFfAiy
         1Zt9y69LvVYPqMnqyhW8FOUPDdddHJkDu9pqEa/2R0S6tKmQWMXnSIMoYUhVa3NldJ8J
         IErWdjlZa5JvxnyucyOjSaoSFZfPG5vSmYXQPZbiObnRcm7pqFABEgNC8IId1K9NHxFy
         z6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tkAbWC5TLmnYScx+o9N2DERmKBTU7is23HCejASsWdk=;
        fh=IyV8IP/BRD9FUbxLz2F+lcmGT2C2187/qCSumtLCJoQ=;
        b=WGUaoPk9pSu2OCUih0ED3VndAzCKxGTp/FDzMdZb0OaLuZQntqwDEIyCNk/5A4IzB3
         1nROm1FCQrO/akW9jBHXe9eXGPv1ApsgO5+EBlaVkP8+oOn0bP2ozg8vaK5sonKhKAsl
         Jj1GqPk0wdgtPViuqQKTb35SnsbyjbHNkg31a9uiFCWqn9oQQidPE1olYlQdaEP5+P6u
         OJRLet7qQTnqkqedCjqYzCCee00XgVYUaBCVv/44AOdeVgcPO0pFIhlhDNDhqDCPGviX
         SJA9yRhrB0H4g6zKfUnUC0Zy27Zyru7QQZ1+9x+UnwR/SqlQo6tJVT86AE6k5CynrHAD
         n5KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7qJck+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4c75b796si3397853137.88.2025.07.03.05.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7qJck+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ5u-0004IP-G4; Thu, 03 Jul 2025 08:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ5c-0004E2-T8
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:30:57 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ5V-0006EM-HV
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:30:56 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7115e32802bso54204807b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545844; x=1752150644; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tkAbWC5TLmnYScx+o9N2DERmKBTU7is23HCejASsWdk=;
 b=U7qJck+N+u7fUA80IIxgligpyxVX7JQVr1IAMGDOzwavFnh8qTCD/8WP2cvwKZCekf
 ynlqkMUe9z9lOe6EsRACS+GYcO3qZViy3OZ6o0N6IvFexoBG3H5YGm/x4KZo8o6nC4bD
 DCpMfiC1S/FRiMFaKpT48I+hQlFxt8VUkZYbbvQz5Qftkka3TGTTRCW3mKCZX+exnbM9
 DNdiYVGpeOokyz+Waacv8jgKcdHoSc12t1PkaGGry3w3syFBt7/sAYE/UvEivTfJElf4
 mExE9KjBXNhfoQk6a80bU4jMoH3GkCZbw9nD5xBM8xJjmlD145MVBMEGPPRLnmyfC+vX
 nAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545844; x=1752150644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkAbWC5TLmnYScx+o9N2DERmKBTU7is23HCejASsWdk=;
 b=M8ESJ2rYqnoPaJcYFbQ9GNVx5zkrlvXIUO7SWV+Vu4II0D6FKTQa9Te3x/wh0ikpsu
 aVsrQKqy07YLevq+xo1DU8nzP+hbFJ6ubUBR/1a3p/aLB7zgBda+VUmk919q+732V+Gs
 vYmkCIvmO0JGmK0qyx3AbvREqL832e6krFmKNn/VkYAc4cFScmOfw6L30cwcbqW0tShX
 PjkLyN4JicMZx9gaZGSKannX613YVxCR5HPzB52/3QxcjzgACHagUc+v7OaFwhmUTF7s
 yWz/QuOA1z1oMJ6aYr6CbErN628akXbsND2xgw4UJS+cClCLYLgXTbT7MMkeWBY4c6u7
 fr6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGFCXf4fBAsF0gl6VgC9bvysUl5YRDQ9OMDK/myx94rhSTGIQdPLhrDJEMblB4o3vyo+CsAMOJtA==@nongnu.org
X-Gm-Message-State: AOJu0YxulrDe+CvN+JF3wXwOdxdv+bPDGYfQwtj7umyEbsRkxw5a0XSu
 IDfBlBDewvCg96VCTmQ5X7eKu9rDORqcFIHiSSlrzRYoDQcnf81FnAkCZbnYp11dG4E0YA/GTCM
 dmw/15wsAN0GBNjd5MromkyoL6Ej35DULTl/x5/2v5g==
X-Gm-Gg: ASbGnctGyaH+X4hCsFAXBjjtwJkDXlPnjFmbJyO34z6D53p6fISI7XjKcUJW4UO3lOK
 gJYG3cI4RrCMCS7YcV1XdRJFUT2bh8UIQ2ktXfmWH6GPGJNRy7FU7u0GS0oK4WDbG8OYJpuGexF
 xvVsraMp81zP3XKwuRTXd5pCO8kUgGpNFBfBzUnO0oD9Mn0WbaTdmMkyE=
X-Received: by 2002:a05:690c:318:b0:70e:18c0:daba with SMTP id
 00721157ae682-7164d476981mr84347807b3.25.1751545843699; Thu, 03 Jul 2025
 05:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-84-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-84-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:30:32 +0100
X-Gm-Features: Ac12FXzAdUv6Rr86Q0IC_G5Y3RSSGie_T6WyG7dP3rTdIGoGgf7s4NXYzlLfs1Q
Message-ID: <CAFEAcA8j7+dcqwjXhyZZ1fwBEpDzg72gyXogoTioJ=0pOVE6zg@mail.gmail.com>
Subject: Re: [PATCH v3 83/97] target/arm: Split the ST_zpri and ST_zprr
 patterns
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-TUID: SYYEsgJLJEtk

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The msz > esz encodings are reserved, and some of
> them are about to be reused.  Split these patterns
> so that the new insns do not overlap.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve.decode | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
