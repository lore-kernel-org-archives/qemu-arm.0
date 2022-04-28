Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1620722lfu;
        Thu, 28 Apr 2022 03:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz0XQM/+wczb1CtBLO9+hLpIodlaorBG5XNDiZQ+v+gtY2Dk5Jmp/fUFAD1ApRY8afV3UR
X-Received: by 2002:a05:622a:60a:b0:2e2:7b2:ba74 with SMTP id z10-20020a05622a060a00b002e207b2ba74mr22492459qta.293.1651141493865;
        Thu, 28 Apr 2022 03:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651141493; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0669V1onMEinN6JowUZdubK3NbofyRj7I0hrUm5ftMln44KECDy4ZQ7uBIzbmMPhA
         62Ykf/6zDkJKUWE5R1vwbQyuHSIwmsDR5xB5+PLGBzVo453lirDJsyYY/d4jAnY8yuBh
         cLuEGU2y2/5vrlo2QKv7jRjurH4mrwHzlhetRmD+rmUqTDEz1bm6piunJvqhPXgD3ysj
         fiN9ltcZ/oUQQheWOJ0Es8iYZ4G+zJA4C7lhRwAPCJg7WZLwu08qPGOtNYpdzdqH6J1h
         7MGfXMkybBuYn70O2i4aCOkuPJr2q/8Zv0q26iOpH4eJ00Zwnoxf7w4JAIPtSvYExcuH
         K90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y8SQJgqLX6iduoygyvSwIudjjttO5h5SAuzxFYav73o=;
        b=A+MEsa9k1huJmYnQdGrM3BMKWoUK3ea+PnIut/gC+p60x8+OAXylbqj+Grdmy6YRD+
         gYC1W6wj90XIQ/wQyBWU0bAEL+FMeuqAMuAKFpOYZJpxwuZ8uV+2lInG7p033ZDFsEKw
         DMVQs+jJiWL4qasqmbuBzaGEYja3QWRBLK3iHHbk7Q9Xtc4iXn/JXekAHu/rF8RV+wjV
         5LHRIklIKI6B+1Df04t6mnOahj4XY0Cw7C8ttFwUzgOnCDz6qcZwm1/uGgEdAGgGRf+V
         GHlG8bp7u8534O7VzYSyPB6JuwIKd4hEqfvDGVHZ91/xgyLp57vNNZ9pSVVRlSWAKHNP
         UcQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IH7OvMuA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs12-20020a05620a470c00b0069c2e712b12si1578569qkb.600.2022.04.28.03.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IH7OvMuA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1KP-0004v0-A8
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0vb-0000qx-QU
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:59:15 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0va-0001hc-9a
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:59:15 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r189so8059441ybr.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8SQJgqLX6iduoygyvSwIudjjttO5h5SAuzxFYav73o=;
 b=IH7OvMuA1qkPZdqOVlEtx+SzuckTyNB52+IowMQ7atd2H/fxE7BAsY+Lyckgba++ma
 RdOCeQRZHL4p3dhUu7/DvOcRqX7c5hO0mY1rf8dLklWS14jQRtZ5f3F2IBl4qAGjwDB+
 S2G/Z+BhsDhaAv+kYEojFpYkpWCLr2X6SIIKxoqG7p5hBgSuI676zkB3+JF3ireCtJb9
 pvd+BHYDOpXir0rAgP+bbKWVy+fvFELaOA8LWUSmd9c7m9h8V42aQXRmJXYUDluSj4hN
 DfELRrB2MwbUd/DPgubQ+pU9TybCZbnYRUd4MZykt+F/C1yAu7WUQhaEZJWX9ZrBBUT4
 DEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8SQJgqLX6iduoygyvSwIudjjttO5h5SAuzxFYav73o=;
 b=YSGlGYPmzMQq+e5NJnbI3QE7DOkdS35qvaOqyuporWidAnrTlmapLwTLuAte0W40Nb
 KdAb/7g+YP/ODsnN3b0HAMJjZcx56xSBHvMfUzCoEGj7vXQzl44CRWIRWYw7kGvCoh7D
 L799Vgft2q4nRYlu9oqd9v1f4nA+EX3iGiJCsZTNsRFi7g8UMgvBn/LSnkoynH8T8CSk
 CjXJF1iJ8xFvX+FYoKeJeTTIGgLDdML8LDp/9068xs7LM6MyQs6xyRDoQ8Vgp6QRIGIR
 1j0iMAdKr/9wadHV7cKkcAZiDUmVNXa6ezmLVqjiemu761/2BbpUgNFs0+zreo1i5Z8a
 7j2Q==
X-Gm-Message-State: AOAM533YbK3d0ahd0d5YnVIx1WneCRC9Bp8x8fJ5n+Jd8gy2IhgtRByA
 9CPRhqh4iEw+sVK/AgF+NU1ef+5T/L41Ch8fIBqdxg==
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr28088461yba.193.1651139953282; Thu, 28
 Apr 2022 02:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-12-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:59:02 +0100
Message-ID: <CAFEAcA_tqW2hz8KJeTRSvBn8eS_Gvx2uTVhKZ9Gt5xGwYpxE1w@mail.gmail.com>
Subject: Re: [PATCH 11/47] target/arm: Use tcg_constant in disas_add_sum_imm*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 29D+o6s8HvYj

On Tue, 26 Apr 2022 at 17:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
