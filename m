Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD7EC61DC7
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 13:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzZog-0000VH-VL; Thu, 27 Aug 2026 09:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzZof-0000Up-0d
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:06:49 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzZoc-0003fy-UX
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:06:48 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8200b55dc47so34130867b3.3
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 06:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787836001; cv=none;
 d=google.com; s=arc-20260327;
 b=IoUBmgL58+lfLd/1hmsFjY3HB3v+mTyX+EnnfFGUQyw3/TRK02z6Cgq/r+iM9k3dXP
 phLrWr8uxCpJf1jFKjvBgu9/6eslDxroEuWfEaIXYxV5O4LramdT27arscbDHEGbuje2
 C7E/+9J5o5IfCyOWL79Q+GF81T/eHnHD2VYwkV+3qK7wRIbjUnW3FdQH7JzlO6cJ/Q8x
 DwJEd2mKEDQUOz4ilMFnpFiTzKOMywocS/d5SSdfi+Kp+5wKDTOyb1aLhhCm874CcmAt
 u5BljidiRMqOPtlamcvdTngwEAFqvElx8mcJ+npMKXTHCwQEcdgF38JDkKw5fmHRnQFD
 DtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HDL/+0Zqfgzn8IA0PGscT/LT+J6jFS9CRZtQ75YjUEQ=;
 fh=ibhPXyPpi0ho/xjQMeAQ73EfzPpVGM7/XiECu1nRK4Q=;
 b=OLggYxtpJtkzHeZuqprOyvO5S2X7+pm9pDyHs527UqMm4jqf3eF2uPbL54iMGHD9vv
 gEIF5Dplc5BeLOwbA0hqd8flRM0CVob6A2yFpxqg8GPfZYZ0iYrktyeRyg3/MXiz6L7a
 fQdAHKe8PoFfsqpz/2scyQ9mnHI/h4VXuDtZNEeWjwa4IRxd1oz2qt0XwAk4aAkcUcQ4
 W3ONSI0dICX4lKIgQTF79bwhbunzfPJwhb0rS05aTmgTVlBAJLkkEGazui4fcsEAC74G
 dmu/g4q4xrh3Zkqg5FlDss5NevUg9FTjB8t0n+Je7j5K4aNe7nLhoNVw+YmPcgWLM6aN
 uaSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787836001; x=1788440801; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HDL/+0Zqfgzn8IA0PGscT/LT+J6jFS9CRZtQ75YjUEQ=;
 b=CXkdHPP4biy9SwdJkQnF5MQeMrQW2WFNZPEzY5Jbr5swooZCXsTWRYLuZ6yo4y6wLM
 GApzJvtJ21twsUrdmS/NCSOIy4W9U1U4qxODQM99A/lwS2QTMR0z9KMW4VmSq7ksnHfN
 31C4qQbJDOngbwCfjQNTsns2pDlSlAId4aDMK5nldnAjkkeXM3bFoWj2z2mk/pkTHQ5o
 diCpAbxuis0zOcV+u0JJiivt8CLg1+UiD+lVM3k0qdzt+L7Eu682fjVkO0ygtX6w5/mg
 C+viJx/yPQovy3iZwgNkrFXxk4+AP2gwrmMAfeZ1eguEemtn/DP1aV8wtis0y1sDLNbP
 OkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787836001; x=1788440801;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HDL/+0Zqfgzn8IA0PGscT/LT+J6jFS9CRZtQ75YjUEQ=;
 b=cCAXxiFkBDqeBQZecle6G/tiSgZxn6FpJVAAFfPscpolVZyCo3e2FV0W6o2uw9lkND
 +icHchG1B5hNV0adKkmga5MVXXJfnCrYB4KgPGjCDTvqGLlJUi4LueHM2yjay2DQ9TZM
 do3eiy2AHWuUa6eQ6Z6ysKr4bJQ3xnz77nXPYG4WhLuNxkFqvNoDretBVb8B+Zhd0LJJ
 FiIKhSHnHcxFFy5AKJpWpqfD2LuWWqlKwXxMcjbBH3GOadCLOLmNZu6DFe8w7p5OJT5x
 1zqd7RddlaNwZ+XiJvhXlskKuP8L/q/71JbcIK5ZRH9G0lcJl1JRi/Juf2m884BVL+iC
 eFrQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2Fx6vpbJRF9EUCDSYlUvUCONABzz6rztvUkScTGY52GgkYe8RFVmk4BHY7UKfk8Zzhqvo8QZVFw==@nongnu.org
X-Gm-Message-State: AFuF++ly7UuBNpSSY3zpcT2a/zJyarSygmWpuZACa6NU9RiOyWpRByVu
 3BhXeYCNfyqpeM51yB3cnUoWIfQMcGmT5ErGUFZGRPfHxGt3Br/dDHpjjbdvLDkWuhoWh0sPGxe
 Qnakl7IaJegr3gridacdmC2cX7bGocFSkWyBdrWgH1Q==
X-Gm-Gg: AR+sD12cc2mEJ7j+RiYUNP3eHT7MtZsewmUJ1YoCI2MyuCjW1P+OOVJn745/2bVqTUo
 0Dr3nMYP0qvECM9XsHlD0CFdV38S5fOnL5OXlIEpbhByxvQiEk44NgX4CFLnIeFgJlLZG7KcZhu
 /F6tmxr9sdJuPljIvNdgQGKroMeHGByi4sOC+0mbJ3HCnhLtNdB0dNZT/ZyRmpO0MtiCFnUjZ9+
 0vGaOLUs38UlUylPZcyuag2CvIC+BrWFhSbuPivjeosRYJkIRYtggZrg1hXKah6WthFkyXVwx91
 V4Vp8CpvU3dLfEVD6ZUEodLz0WowaGoJENbq0Oa97IR+qIx2CVqQOxYnUrcs9EuJ7pD1Yg/niIc
 /nXyvxA2Qv7xFpwFySVZapjPxfvEW
X-Received: by 2002:a05:690c:15:b0:809:9422:8c47 with SMTP id
 00721157ae682-857477a395amr58939267b3.22.1787836001017; Thu, 27 Aug 2026
 06:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260826174213.614571-1-richard.henderson@linaro.org>
 <20260826174213.614571-25-richard.henderson@linaro.org>
In-Reply-To: <20260826174213.614571-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 14:06:27 +0100
X-Gm-Features: AcwNN1VZpws4fD-nc8_ovgsWcAiyjO_rGKB8pEBhVcgTeNnRBch14NazL5FeYkg
Message-ID: <CAFEAcA9t-WzK0f_D_p-41H5Ts1+PNWKBnztq46LY3+MvXBFQqw@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] target/arm: Implement PMULL, PMLAL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 26 Aug 2026 at 18:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

