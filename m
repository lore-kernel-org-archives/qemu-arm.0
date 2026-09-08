Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4129DC79F82
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 10:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3tVs-0007Gt-A8; Tue, 08 Sep 2026 06:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tVq-0007Gd-QL
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 06:57:14 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tVp-00008z-Eh
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 06:57:14 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-87ab6e5f91eso11989327b3.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 03:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788865032; cv=none;
 d=google.com; s=arc-20260327;
 b=Bt19+CkXoHqc6vktSSoqn+3F8oz0HrAug+wXMx7W9EXgFJ/KBZFcLE/vPZow/oPzCC
 gpuHAcoCs/Ymb2jwA2RruG8yWFSIwMJSN7at2q1IyFzt4AnkiNW/Vod0QvxJcF0Pf0NY
 WEg0DLqUQJyigQybpkhxI0Tzpz/BtgYqOVwv0iz2ISeCbx7s8HwnSlbZzBeARkm65NUh
 A5Zx2iCXiX2xN0j7axW/r+EWRpoiTKxEMgK7u92FY6eGwbEmwh7EAMyqv/yaUG8jaDRd
 9qdapJrVoC5q5Yse3/AE6IxHukgsNNAYq8wk2jmnOUqmBqt1JL/z6rTgOs49ETj/vDpT
 D2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wQ9WmKGL8giA6BBf2/BQrVAt1bLQIDDgWR/2kPbzTr8=;
 fh=dFiFUizFjUxh0hT9Rcu7cFWVxV2Sph+Bb2aZUqAWqoA=;
 b=gMd+9/OURKsVbLdquJEhtZ3hc9c2SBVbTu8ry3HhZnj0Ge/tRqAlYHB9QjrAiA0HYO
 q6GGIwLWZ+DGDrz4XY+/vospkUlONVjXq1Ml0PO8IS6bjzF02AWthsBFeyGegZPY9K1c
 1+4rA4D4l0w4YEjxGS+jwpNCQBogQG8NMMopgauXozMcLJJJcHXP0hlFLGAj/pfrBWYC
 Ig6xIttd9egNUVIzLiUqasHycsGs+x68XxPjPdRmPxnvKT0se5kTP/ZnlGxbQIr0GWYu
 9YzKTShw0S5PLgfACsuV4CZR9UQLJMJKSSknyR+q2ueTvBReEWzG/NkL7UUbsfzgLhBd
 mA5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788865032; x=1789469832; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wQ9WmKGL8giA6BBf2/BQrVAt1bLQIDDgWR/2kPbzTr8=;
 b=vQnJmQSX9Uh1felo6elQlvYbJNcwqZab5gLgmPwE0C/jhdmZFtGqgtd8sJAPz1mX/0
 0RpAAfzWsfqB3/ZCOpFUY8LKR9frHtDpXj+ULM3arBviGs+uZes3vmJW6CUF16tLSpkE
 Jc4JO3E5m/qzYZ49+SpqBirZTu8Jts3AQ56GBwiU5hA2XVjbTPjUqYvIOf/UtgucFqnL
 e9+9RYAGvqux0mztmbN5uvqHbirvF7EuWl6YlCRdMzwkUFHKagWHbhGqgkS+uhDWEUHD
 RKxUrJOee2k2o078/OCb6EDJtz6vm6dmOE+B8UaWhM4q5xP8GeW3eEJ9uJ0C7nEE9GGf
 LlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788865032; x=1789469832;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wQ9WmKGL8giA6BBf2/BQrVAt1bLQIDDgWR/2kPbzTr8=;
 b=f90O7Cm6UZsZbRlDjKGtqGt0PkKR8liRCPePgObBN8Ycupx7ZOC+HGPnRK/h6opffF
 RqdMK3gePPD31q32mmwF3tcToHsCLztx3DjNLAcaf10fe98j+SQz5ndOCF6gxImSSDtC
 xcgLPwY0+ho2G2ORFvSU2guO+YRm8HKyGUwLdIScbvFGiUnwhnZVf8+yf5WkKEE5awEx
 0i+ajOvKlB9+JjVff+hKzMLQCL19GcKRwKmLHfQ7jIkUJFj0eQgslgq59QO9BU8e5VQ+
 CYwlsfq02qMDzZihjPWOAOq94foE6E5H26THDsZvhLgjAmaT9koTCj/WKGV4gUGaAcQ5
 nCqA==
X-Forwarded-Encrypted: i=1;
 AKwUvByJX7pos+o733gT6bERIhVvmRzMuHU/6J+q5sr/hJMWNCnbZrkTO20vndIr48jJIBmtlWhruPMW2w==@nongnu.org
X-Gm-Message-State: AFuF++ktV+oQS3Prt4y7obBVOcpRmqeEVQ07kFUfaHuZlhcWBGBcEetL
 dxR338n5Yxg9fDjjtatpOwGcyeCi4tkPcK4pdyylxItkS/OchBxqS6wON8miUuH+GGJVeoTbl7f
 bbxNq3RoJ0tmEwCgqBF1CuDbHNCZWpzepNiM6FAsn0A==
X-Gm-Gg: AYBFou3VWIM+AkSuULQQq+A5yEDbP1flQzDwJn/qTq2UAuDSEF/LAbJmXjB0D92Bv+G
 htng1PDpKbnYCDuZ1GIjk+O2eTvrY7Oxo5qaGYHOMXJWRRy5JzEODBKm0zbQwS2lEQrIvDMM3UL
 NyNDywMldWLRdQXgdOJeOur6hyFULjyla7Xwdn/BZRyWHyMoXFR6Hl/w1NJ8AxgPO6oigEY4FAr
 mGJoJBs6G16IdTxMAV40h4v6MvUckJO4JZgHnAkAp9+98WEV6vOsOyTCeSSrx6cGSzmLsAqEZEC
 VZud38kR/XNaZN/b/XZUUOipC/Q1HMsKfjbIkbygY5xljiLy6CoAQ+a4Sk+XU5JORTSQKDFJlBm
 VOKaia+JUuFO5qIC0mPzO/gPjgCxN
X-Received: by 2002:a05:690c:a4db:b0:873:5c0f:28e with SMTP id
 00721157ae682-8735c0f0462mr53492697b3.56.1788865031998; Tue, 08 Sep 2026
 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-7-richard.henderson@linaro.org>
In-Reply-To: <20260828222639.1432046-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 11:56:59 +0100
X-Gm-Features: AcwNN1XLGSYVeUq5PVnGc0rGldvQYhb4Njf0MMqwKd0YpvF_bZke504yFYXChrY
Message-ID: <CAFEAcA_i+bbSavAZ8tBBaspwn7rn41di-n1f24jfrq49S_McPQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] target/arm: Add isar_feature_aa64_uinj
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 28 Aug 2026 at 23:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

