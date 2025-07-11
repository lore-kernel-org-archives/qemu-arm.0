Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C4CC8303C
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 09:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ua9wp-00087P-MF; Fri, 11 Jul 2025 05:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ua9wi-00082d-OJ
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 05:21:33 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ua9wg-0003kg-4V
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 05:21:32 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-712be7e034cso18699897b3.0
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752225686; x=1752830486; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JBK3ePEWjvVjPev4cHFtsdsiP/pjj5vJWvBnCJvZz/o=;
 b=eJVN/jSi+gLSeWncmv89nfQ3pwUtfj+na0ZhiMbMqDyonh0rcR2w7IuwVhrke/iioi
 mFZFT7s9FE4SziS5PuN+YTPhCYXLdgRAEX0GWYMmMOb7+eJZgK/DpkV0QjQPnCUfY+Tb
 2W/YGkuEa9P/CIRKZX3IJGC4q6YXm4cPpT58tGkTg0Paz4DLqjrgYUcXW8b8RLDC/yvB
 hTtew7ZQtgbkd881invLnUmYhsfMTacuMWxbSKYuqS13LkCbGNQIML54pWpnHpyabAYA
 WOpQHUmJQOExUhwoSX+pSp7WoR40THYsD0evbC5MTIG1V5+zCvTI7+iO7eVUJbdCDkkQ
 kFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752225686; x=1752830486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JBK3ePEWjvVjPev4cHFtsdsiP/pjj5vJWvBnCJvZz/o=;
 b=Qtsm4Yo/0/DtKidDYOXxyTkLY7T035kOS+lonwemLW7EQvsV61Pnofn2uFGTi2WBkO
 BPwcl/UvWDGW0dTElvwjP7Oltk/AYpwOTxj1pZpalrNojGPuT8PuN80PDcfiW6FIxv9+
 whkmbUjyGOjE83AGYv/DD5WvbnGrKnBaUdAspyZlXQHiptfcygBprAlckE0peLJhvPX5
 CrjdheT3h2/LPy/mJVQ1peaLJ83fBZoj7ak+amCPoLpIvQXjY/NizvbW7IlVrq92Xdp1
 5pJl5zNV9MhOkLt1dU9FJ9X5tY97J+//rwavkmm0pKQKKAEjufdPKlD6nUsOrVZz/GNY
 Q0cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYLuenxo2g2wKQDrI8w4UtIPxu94B1lUZlQClhw+QKSdRclB1lqcNMV+ITMt7IYQIWQBt2sbxuOA==@nongnu.org
X-Gm-Message-State: AOJu0Yz5JiCoeJLOu0ManWxmIzFwB41OlaBQfsV2pTm80AzPOk09he05
 M+v4fHxM56DrkvveWeWRN/uMiOCOkklkFCisiWQfPGtxgRtWbNejtqChcMbeOGdWuElYB9jG36q
 L8bb3oBGhg6vDH4URCzWTgfHQr87gdnpj9iq+TNlgeA==
X-Gm-Gg: ASbGnctvLGnzKGosmidddCRDzXqIl6FkNYs+CImf6WqijInzF9oyZn66YnZYysnW4yM
 nor1D4siQTNHBIKRyFzolmjNLhn7N7ag694w7K+dz9ucr0zRNZB4WRSRuoHd/K28IieN5JsFV43
 XiEQYaj9U3QF3tEre70vKojXQV2rIOIGl4aoygwdDPkJW2k402dlRrp3dkr1VZeAdsiOnrGKKNm
 ox4fDzk
X-Google-Smtp-Source: AGHT+IGhScNy1QoZ9V7SEoU1ko5x8tugAFMtojRlU87mWt+pS3iCOkgsRmnR0gYtRg+QbdkVDe1qyJl7cMXPQCHWfdE=
X-Received: by 2002:a05:690c:4c01:b0:70e:a1e:d9f8 with SMTP id
 00721157ae682-717d5dade00mr42174647b3.22.1752225686442; Fri, 11 Jul 2025
 02:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250710173945.115428-1-richard.henderson@linaro.org>
In-Reply-To: <20250710173945.115428-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jul 2025 10:21:14 +0100
X-Gm-Features: Ac12FXw7FjjTpKMhpqKvQDQMei6e4MRrjqENgG4HjSGfcA1xYsESkSozoAt7Ibs
Message-ID: <CAFEAcA_w5jTEjNWmk-RSCvS1H5HJGKsB5_KDmsikqAjXq25_Cw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Remove helper_sme2_luti4_4b
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 10 Jul 2025 at 18:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function isn't used.
>
> Resolves: Coverity CID 1612139
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper.h     | 1 -
>  target/arm/tcg/vec_helper.c | 1 -
>  2 files changed, 2 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

