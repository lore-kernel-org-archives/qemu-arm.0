Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1150784lft;
        Fri, 1 Jul 2022 04:12:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+B1wras5rwh1zZ9glno29KA7gVj4Z027BljkWe1uc4QZGlDaLK95nUyw60V62p/7QGgrt
X-Received: by 2002:a05:620a:d54:b0:6b2:5a9b:ef2e with SMTP id o20-20020a05620a0d5400b006b25a9bef2emr1131802qkl.715.1656673977431;
        Fri, 01 Jul 2022 04:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656673977; cv=none;
        d=google.com; s=arc-20160816;
        b=X9/UrHLVcdAN0UEw9uBXorIAaX/+eHI+V1lobFNQv2jXoSgygi+9eTgy1ae7+qaybG
         h+cqNIs6M1TjvXcYD0PDvfyYO6KNtpmLhtRNNW1fdxLxsim6kighNJR9mSahWsPZUibq
         AK4n5PD9Q982tINQQEnWTE3w9bndVmfidHUHjcA6KzyL2bJnEYg2bM2uUiqY/egUKCwm
         5Ri9ZV3cnEw3MoYPHRvBAMG/tSAzPJtYDTwVbjJzCEj0KMW4NqHYXDYGibLST+8KMhT4
         3ZvTvY0EIiq3CHerXBDGrdUW8ZwX1CK0ISYWyLzaLFDr2KYNOlhcxOxPgf6fOEfEcseR
         fwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X7Nc/ob3uzg9z3PYFM8pGtwVQITXLNSXt/fdwKejvrI=;
        b=0f+LXqguTKUNYpC+THv7EogSUzYTcST4zoJyLB22etdWwHcEQihzfaWqz6sMFzGCB6
         irX0A1oLT6el/37w/4XCsedr9LfR1QcRAVREPFGpFy/NT7wcLzGuikVVKu4VkbEon8t5
         Lp8POM6oHv3GvdBUFNe+CrO6oVJLzTSnvQYs1nKjwA6RRhCVWI/VSWbayWfljjBP5s5r
         RSdukA/RR9jkuIsPGTf9zG3JJcNFsY9UP1gGrDOPoV93Y20ihQHYuuE3kiq4zxFaCFoZ
         D5I0sJ2w7Fci+oCofB1cxqm4A4NfvUTDrkyOl1LgtrEUfORiPUxDnx3IsjmPKlEkXZ+Z
         dg9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smZhzr0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a0562140b0b00b004705fa3a257si10389927qvj.587.2022.07.01.04.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 04:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=smZhzr0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7Ea0-0006wJ-RE
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 07:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EZG-0006EB-PI
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 07:12:10 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:46042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7EZE-0007ym-5Z
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 07:12:10 -0400
Received: by mail-yb1-xb29.google.com with SMTP id x184so3396637ybg.12
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7Nc/ob3uzg9z3PYFM8pGtwVQITXLNSXt/fdwKejvrI=;
 b=smZhzr0djX4YdwyLga4agJopjVmmEmMoCweVUuuaU5xQA5tOW3p193jTLzqcJyOBy2
 ud3BUOXz5XEhWDmYhjf0KhnlwV23UmU5E1r3oeHPr+PG+5Y+eWwa3V3Zic1oqLDBTuwB
 U4usfdfSsRq/nPutrZ3g6WLhCn4U6/NTGPx+Jw3TpTTMC0EdNMkUIv3A3S2mYbaSMWNY
 OgcWMm62QeFcTNLYU0eC6VDSrfI8XHkBHnZeI+mtjdqJlLBREGBtRKqRxko0F03SpCF2
 L+yE0o0sLTMvanJGNmWXvpwiVFq3axYLFNpSqpuvIJnegbbd9UvTl+5O/AS5minPlgr6
 vSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7Nc/ob3uzg9z3PYFM8pGtwVQITXLNSXt/fdwKejvrI=;
 b=7UQHEvxtw9SbujcDbmoIceDcqhE+hlxTrZxsxgSen55CViygHqHjYHMeiAM/+1syyW
 KRGVP0yAph/jJM/GwOiGLoQ0Sm7L7nR+zAiMzSWP3CaP6vlv4wGqX4K/3yc7o+D+CvhV
 dJH0v3LhNrcNFoLNbZvw5wc5LrfRxQBwz5FfzWryQ9I62LzZ3x1vcb8jdjobr/0zMtSZ
 6jQm21Jn2eYXzE/Y4QqiyJm/D4UprNsN1nDGt326irluFRJ+YNxILltx1g2CMmVmpKOl
 xn2YuKJk5/L60/jlFMKcDBYeAvfAPiK2rn1psqAO5yO5NVqzlWdFBH/bS5KRVNg3A2VQ
 VWnw==
X-Gm-Message-State: AJIora+rpfLM3KpmFfYhiO/JJOHQ2KLA731u8YKZtGHgaeqXBFAro42W
 vkkPMQTD95dMH++TtnkIEFPRuAXvPKNcydLWtRJH3g==
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr16245325ybg.193.1656673927047; Fri, 01
 Jul 2022 04:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-5-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 12:11:29 +0100
Message-ID: <CAFEAcA9dMwOzU93ppao9YoHVY5jtYuqbUx04OtHAMjk0moSrQg@mail.gmail.com>
Subject: Re: [PATCH v4 04/45] target/arm: Mark ADR as non-streaming
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pk2TkAuLRMyJ

On Tue, 28 Jun 2022 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark ADR as a non-streaming instruction, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Removing entries from sme-fa64.decode is an easy way to see
> what remains to be done.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Yes, this is a nice way to do it and easy to review.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
