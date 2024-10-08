Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp213674njl;
        Tue, 8 Oct 2024 07:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm3n9wOahcRa+IpQ2a3+EHVionTIhTrCqO1RT2whcBvJ1d/UhQmit6HSoRWq7jzOMKay8tZCd+JwUumA==@linaro.org
X-Received: by 2002:a2e:a985:0:b0:2f5:806:5cee with SMTP id 38308e7fff4ca-2faf3c5f7c9mr81673601fa.11.1728396330073;
        Tue, 08 Oct 2024 07:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396330; cv=none;
        d=google.com; s=arc-20240605;
        b=b83+o3xR31AkIg1YsE2zOqdoUTOsQDbMAA5HjXPAm3wygbONL0WN+X4SLtgrWTB5ms
         k4a5D3jTYeP9avy9/mv4KbzqqWPNVrPOzZ8/X8JwSJW33Wmr6MMo9eGg3PGe3Deh1Ajc
         Jp7Onirbd12GOEUUrnGm2AuBVDzNP/yRJgbVDo2mPRpsgUd5/oimXfhv7BMKPHQ+pstG
         O8k9oe2cquKFspJYWbxEVOsZaG7Dwv88jnzkSccBGLE6IGaiEUzdcrm8M08Ho0MNCJn7
         JCJnvuLVzJKne1cETNsxBpGlPYHJmJ+Jj63j0dGdbx5ilQRzsDFNLmjMUuMMutoTDigG
         FYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2l3ZDx6KfEzG9FBRNLYNkBYdxJ2VQK7XfM57EJm+wcg=;
        fh=L4itmZ9+qYqJPSkdvrkrrP1qUmVyOVnNIy74aiOLLoc=;
        b=K5PermAaB30IYtLfNVuXSC51LDVvUNF3mLnSgtnMCZl9UY09BJ8RiDGEkdP6H07vTt
         4bj+dAFa073cw8O8kGsouqPpOKglYRd1W8lM7YdQwTiTvvnZq/QKB2rNjF4eA4GYJs5F
         9/yjLyAaBO7O+ctAHdxP/fxteseUxc/QvMfBs3m0G3si6Id+U5JjWs9hmJtN4EzMTl6N
         UbXle7u+X+8stmarA3JKleqOqdQJEMaXERWVBgK/uNqvXkbGpM+VJEJ9zYFQ64UxLFoz
         q9+5CoBwZHYuMMgUPZJdpaeu8Gty0qTzoMck3JMuJnaY7ey4gw7CmQFb+rSBD6V1YRin
         5dqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5g7YSF4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2faf9b3f20esor9147811fa.15.2024.10.08.07.05.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5g7YSF4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396329; x=1729001129; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2l3ZDx6KfEzG9FBRNLYNkBYdxJ2VQK7XfM57EJm+wcg=;
        b=I5g7YSF45muEU+GvriktenmXC/A+rv7h4pJZ/6xbENOas2Ul1rIR0rJbR0Mb2WXn3i
         IicOmI/LMQT4OMCaJ6teH764jCLUJ3tEWjzxqlZpj8z0fyKwptKJJEU/gZa0eJEtH5JK
         uLvQYh9L1QhGcZrEXsKmmxUZ40vphF+Oau96jGQgMIr+EIU+GoofcRGLMAQtf/YxVdo4
         t5rwADlZqn11C0KWVmTpDcF0+wNzCyqeV+Bkt5I/ascgpHA0d4AhI57Tupl5/vbkaWt+
         tIbTvKwUvND586olOSSb1qTextzMWoqb07axStMt7WRYU05S52Pnm4/dSlBfXmmK5YR4
         nYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396329; x=1729001129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l3ZDx6KfEzG9FBRNLYNkBYdxJ2VQK7XfM57EJm+wcg=;
        b=B6t1mTQ4HZkz534xufNzh96RaqMDyfTb90cC5EJ5TCWdkuiqRR8AP3slsOM5BzoJF7
         HaXPSDz3alLWfBF0cT9VyG8BuEdIAyEa18P+VfQy8Pe80KaHSfAI31F6DfE34r2NC4Sr
         jIOFalIVnlMd8W4zXLCBu/9pMoDnkJJIH8PettrS9X8hMX1sLAup+sCLHlAeotWmN/RP
         ToiGgvKLycs/8GanlZFM3vl1oHn00rg9/XSZ88BvJH2UzgXs95QI++WhO3b68AJliSBX
         Mlot/BorzL4tHKPrDqTzq8wu2tY5j0b+WICg1yKfye6lk8EzxfFfn2bJGQX5wH9PGUDj
         gmxg==
X-Forwarded-Encrypted: i=1; AJvYcCXHxHg//mGTwkJTpZGvdh01EOYwnfmm25h9nSBf3+Qp3t/QO/zKYuHUgm0sAzVQ9gE/U+XeRTL1ZxBt6g==@linaro.org
X-Gm-Message-State: AOJu0YzkIUJhnKpJ4Nq+BMtza9BKU1tPYWVkOIGeYraAVGIjytd01RBA
	DpJV+uhrD3ZBNdXjRO+cxMruditFBkn7tsS/1TNjiQOcWDlmFP/FdpcPpOrFeIT3QUH80gtRpHS
	LEyG0Y/5e0hkQw0X30HCwA6XQDPLHQCkCrfYllocR
X-Google-Smtp-Source: AGHT+IHBZUuuXGIdrsRP+B4qX5P0Sr0NlGymNkJEVP1ALv2MaP/eBYA9REXK0nzhHDZeS8C0X8vz1WSBjTAJppTqxcI=
X-Received: by 2002:a05:651c:19a0:b0:2fa:c49b:d14f with SMTP id
 38308e7fff4ca-2faf3c509a5mr79361221fa.2.1728396329406; Tue, 08 Oct 2024
 07:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-6-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:05:18 +0100
Message-ID: <CAFEAcA9V5-hbQm6iDP80cH9LQi3zcCp4kHZDp4MG2y25SP_PZw@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] include/exec/memop: Introduce memop_atomicity_bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: J6UpDr/MVl3j

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out of mmu_lookup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
