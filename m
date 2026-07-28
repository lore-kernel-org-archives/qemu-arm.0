Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085F3C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:16:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohf7-0000xN-TN; Tue, 28 Jul 2026 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohf6-0000wp-Hi
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:16:00 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohf5-0002rC-87
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:16:00 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66896892b6cso4510749d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244558; cv=none;
 d=google.com; s=arc-20260327;
 b=gA1lEoe+toLz+aiZP3FMxwav3g8KdLWGx0oiMRvMZ05L7Hmga69ePyJG8ojkVa3vGk
 4bz5YWw3U1QbBefMmjOMhDdAyW+9Bv0p5xiVF3ASte+dxAN0ChuiphWDK/mVlVR3M2Xe
 5VvQmmHgffYJlSU10y3fnrypmyAoI012SmQOPKgV47Kb8PLbVOB+Rq1HJvrQJ3QR6fI7
 QBXH0Ycpm3fiJtSrO/C3T4ECt8AtJhpIjBginyExO2d9G8bJvg1Jdna1IHhi2ZaLuKPE
 kXmbgjOJGUDXEdnmmPJBWYgiP2L+GoZp7lAXeUEHXJnUWrprc0WK5svUroSg8b6cG+9q
 SiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Xa0DYdYtToAFFDn/isRQI4wrwxWtYIxmjrregOyaBAg=;
 fh=ShpVRruWcBYkbxrlPVybkTixu1IeoT2xPuEN5R8rFYo=;
 b=BURRCzChUKDcIEWIGrr7m6JgOqPFeGvVS8A6QctqrDfEZ5eEo9R44T4+Timhw+TPWw
 tXMw9/UK9BuYu6+3u/LkbucCFqyXV65TPc2Yk6NUhJ9lJGT4uK4T/x0rRHGnY4XE6oVo
 onkAQq3YCmmj1SDyUSHRdnGJmdaJh41t7BIud++C1OOxETH1ZhaJ3PgDG5toVqeDcwhi
 TW3sNLWgKqW0F37PwnZWojIHDVwkNJPT0hgXp3t+R76oI9xJLfUkHaGRXGTkLFT46ZKo
 3A7P4mcsQ9xjV6P4TvXoCXOv+Iau3PcvqaBeL1037R6gaEZFfs97ggL/QEBqeINDrEgr
 1reQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785244558; x=1785849358; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Xa0DYdYtToAFFDn/isRQI4wrwxWtYIxmjrregOyaBAg=;
 b=h8EUq0gGL58C3OOcXhZ9c00gnGUWFKNfNbZO8p0XrTm77DotdRtFpvzSLxrGVhRSri
 mFiFw6bV9xDSFf240E4wUdS1YMrBXgk6SLLbRK6tSxWDoi5ReSQGUAKnK/V/HPFvuP5w
 zkAVm7vflEa7NTzlT8Bp769y2Urs1AW6Pw6TtdBprdID+QLH4nCFIYERE7GNt7OGdSGL
 ajyGHyFNZdtDxVhix11PtG2nC/wdmuGf/oKJiMndU58nADcpfUibTzKXrlnk7Ck7ip+L
 ppghIpkOXKr4LdSh4/37oO64NotAe2CmDbcYpgUKsBp4zrTUT8H+Ho9DJktAUFu3Z4YG
 Zi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785244558; x=1785849358;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Xa0DYdYtToAFFDn/isRQI4wrwxWtYIxmjrregOyaBAg=;
 b=M9dEcg731K5+u32g8JltLGqXicf+E3yC4xdz7i8dIapehkFsy1Khsmv/S4pJOPxzhn
 uLITJYhO0JRMN+tN6dDKXd+FpNe+glpjMf2+nHwC84rEsZGovBy4TcIn4bcZhEnKaRKD
 PF2oKZMnZ6wJRC1msoV5KkmxyqiMqqhZLclUXsW3yG7kuJscwyJa+VedJTLft/MPKUWx
 dAB4onJM8jaEpFrt17pzrXcTnWbW/KXorvcOjOejF6Vm4Vsg++jlnhUKrHc58LC1/n6q
 hBxbxQ5s3V6/9oZvmEghox8v8hDVlTjKIp1Q61WweFUAsaqNEJzblRpK61EihFJI1/Sg
 p7pg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqrjR9pO95CJRX8oU2/1tnpXZJj2x+ptZW49H8TSMPePxpviLw2wO7Xazuzfd+JSev7f/a9+tkFg==@nongnu.org
X-Gm-Message-State: AOJu0Yxz+ghJWgl0vvpS3FZdxsTO6n/X3dN9UxRtND6PRseFdlUz9YQb
 9vZv8uiR9YvDwUWfsduMVH6mRKk/LpY0l0KFpmzRo4R/J0+/zyoroGUALRGLw1sn9jzJMo7wXMt
 tYr4jFPbSRxYNL7/uuj8IjVI7k2o6W1DskahUepf0CQ==
X-Gm-Gg: AR+sD11BxGXkJLXLWvWmPMVVIkQl+w3A1dZs9FNp/nl4DHu6d1RuiJZVdA0ynTfll/p
 VRzPSNbXYbU+THmTnLUwU3wXQqfe38YEEsZSJ1ULM2qaBwPESKAI9bgq1MDSD9jbrqxFKtzaHhq
 och1FKK0qQ+bkdoXpr6ebxGr/JBoZb0xUEdt6JaIGnBUrB9l6slzgPjAv+pH9caecNCZoYhqW7q
 2uV+Klw1nQbJLNzHYgZbUEJT77H4iqWZAOejlW+a5/5c84L20wfgy/TtdS+W9+MQTx5fjx9HGWR
 +gykT4IVIfdfyiagNcSyUgjObMpzR9dFSt/89lw8VWBTaw==
X-Received: by 2002:a05:690e:4851:b0:668:2c6d:92d0 with SMTP id
 956f58d0204a3-669057dce38mr540563d50.66.1785244557613; Tue, 28 Jul 2026
 06:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-8-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:15:46 +0100
X-Gm-Features: AUfX_myWn4zQYVwmJgMt7vTu_ft70sbE-A60C_eJBM19HFxo5Vq2yNIQsBnBWG8
Message-ID: <CAFEAcA-kMFKoK1vJMVsTHqONdh2AKEGWzv-KPpe40RQfvWZikA@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement FTMOPA (widening, 4-way, FP8
 to FP32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 ++++
>  target/arm/tcg/helper-fp8-defs.h |  1 +
>  target/arm/tcg/vec_internal.h    |  7 +++++
>  target/arm/tcg/fp8_helper.c      |  7 +++++
>  target/arm/tcg/sme_helper.c      | 44 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   |  2 ++
>  target/arm/tcg/sme.decode        |  1 +
>  7 files changed, 67 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

