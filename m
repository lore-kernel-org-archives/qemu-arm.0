Received: by 10.223.159.74 with SMTP id f10csp628657wrg;
        Sun, 3 Dec 2017 07:04:27 -0800 (PST)
X-Received: by 10.98.58.208 with SMTP id v77mr12216422pfj.150.1512313467580;
        Sun, 03 Dec 2017 07:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512313467; cv=none;
        d=google.com; s=arc-20160816;
        b=eSXykFF3XfnF6NsnZN6l4BVG9iE4JINQly3+KXFvzZ2EUiUOKgnDbkrHSB2KgPTyK8
         DjH0nUI3HZPSO0WARgCQc9DYPyCqfu/gad7CSs+wGbdh3nwPZPJ4eVaCsUaKEkK7cVO1
         2pSRhMkubIB/WlHcXRuztBqVADnZLGBsBJuI7j6OxsnjALWzrJ5d4l+Gqpe9lmU17WUv
         gFGsxITHltbuhPYEDb2QLQnteQeXjg4EJYGPPhVQe4667/R/3wASMW5bjl5Cfj202P3d
         1g9FVkNr6HR27bolgdLNO0CvofkaQskOG7abJYxFhFGSzkboy7AFdr86DC2gFgf32GvJ
         CBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=xBAl8LC3+kCYGX9miTUr/Wr3lv80nKbaHndnXA6iFB4=;
        b=M06wSH8zn/P4V/TfWJnW+I0fwuKeEszMra09CIMvRcpCSSugdbuV83ZAjTEj7pErnk
         uwohHKcEBGlJGIGT1y5UM9+/pHBDiZA3bDZVucNxSYk0t2oPXZtP0SE25wZPMaijdfpt
         YhkJiN6HM0p5X4oNij4FpcHMfv7cnzvPp7Ub79DdFdm6RZXLUVBdd4C+tWoMNvzLnM3G
         tWXGXqQLyZ62o2SQxsX4csvUXdzsxgcjFl8lcx4muYw/tY726Gn7nVxchcsy4Cuj54Ug
         ELem8Od/h1ynOgLPWJ1QCo1eEkugS/ijyvtIf4om9w5xZhl33qyqwOVh5zIYfa5AIS4D
         DShA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQaPiC4+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 63sor3562287pfp.145.2017.12.03.07.04.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 07:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQaPiC4+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xBAl8LC3+kCYGX9miTUr/Wr3lv80nKbaHndnXA6iFB4=;
        b=KQaPiC4+hbWktV7r0gs9LrOASfJdcd8ndbVLRGj6lzBAbwCAusSVZ0mi7Qqhd3QCcF
         aodZ1eaMj9i6I68Fdlo6+g4b+k4Ucik7HdX4IPsDA0+OZOgBrX9bwEe3EhTn0p0Dk2MG
         CA1twu+/q+tJVpT90afWMcKFASdAAfx8TtGA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xBAl8LC3+kCYGX9miTUr/Wr3lv80nKbaHndnXA6iFB4=;
        b=qnzuNvutmcVqtMai2KmYrA+coGCmlOYHtKkk30cP4p/bkntcNkx2hdUEX/KRuwJHBE
         byO8qqbR2u6uwyjG3yLP3VHfLG4Lo/oOWuG8jQEgAfzZWJUeArtjoxummKPs2On2tx9g
         vdzPQdiylpx9kBFJl+k0hvPuxf/9OoYIelaL0hhAnCM3Gm0fgpQvhHhFcdULU4ot566w
         Jm6xYDnHW4atx6vbe2xk+GJK1CDmDTYhzd4PCtHaADYMHAWISNk0yraYBejmaCx6ys1A
         OkAOIZHV/ujymbwT5ppz5qGbRN91IWf/V1KSSddtRFyXCy8oZRgkHvwxueZHyPZEp0ki
         H5uQ==
X-Gm-Message-State: AJaThX6QcK9pwBo4T9SloXKldf0mTjlIJ2By9HNNdpaWPbq7nUwbh63S
	vhQrH3VwF5JW+suiarg4X2Y6hodBQMHjhA==
X-Google-Smtp-Source: AGs4zMZx7Uz1VVbM8g3iZ/yv1YeDK+YJCr087uYBiEPECKmd7s5lfN6X3v47hOvNxdCgj4IyhmJDow==
X-Received: by 10.98.181.25 with SMTP id y25mr16586781pfe.206.1512313466816;
        Sun, 03 Dec 2017 07:04:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id v9sm17914698pgs.21.2017.12.03.07.04.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 07:04:25 -0800 (PST)
Subject: Re: [PATCH 3/7] target/arm: Add missing M profile case to
 regime_is_user()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-4-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <228027a9-1b2e-82a5-64a0-bd70e6c93a29@linaro.org>
Date: Sun, 3 Dec 2017 07:04:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: AipmJ/WkDNqB

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> When we added the ARMMMUIdx_MSUser MMU index we forgot to
> add it to the case statement in regime_is_user(), so we
> weren't treating it as unprivileged when doing MPU lookups.
> Correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
