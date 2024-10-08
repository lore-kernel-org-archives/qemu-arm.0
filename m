Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp213456njl;
        Tue, 8 Oct 2024 07:05:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUM+spcnAYNEYPK238v4hRT+F7c9fOmibOqCWA6h9UHJMxHkQE1G8fWoHdi2Fol9ohGnPs50C7CFyRdKg==@linaro.org
X-Received: by 2002:a2e:be20:0:b0:2f5:2ba:2c99 with SMTP id 38308e7fff4ca-2faf3c1400cmr72485181fa.9.1728396317644;
        Tue, 08 Oct 2024 07:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396317; cv=none;
        d=google.com; s=arc-20240605;
        b=kGQ2bj3djzmw97WjAMDSspsMMd+oj9JHLJ4mcYn2uPpx7nDm5iSD2gvZKv7DGaqSVm
         uQY7XI+OlZFHkoavGs2F/WdxxJaAlyUIYHupI/lnVRuyDoTMb/CaS7nzEw/aGLAy5KS5
         4hWSrkbLoKuHs/jOlGCT8w1Lt2dSJizh0ssu4jMStTjWU2XCvLDjn/4O2h6AT8NKAAZV
         n5Sx0+0rmeKeCagYoopvGctUt5aWfnRwW2IZV63seH7lAGY6PFQwgN5gDyTJ7qsb3pdh
         C1wug3R33LYvVVOxalFECWwFRLOc3zKIgREayCOuVNpswBaNOpEGPVk8344f1Lw7LO34
         K9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k3zM5SZzFFXff1PcUoOOg2pzr9xc0jKIhsNlrWCEwrQ=;
        fh=zTN6i9bWoQ88nKlTYozvxGnaX5TJ29RQCqAyyR4/LpM=;
        b=gdGb+/pZxd7h9lIVZfMXHoRTSNdDKjnT/ED7ZyIkWdHrzjF21lmMc1Z4r/KUzMj2bA
         IKWskClWEeFML8cFug6HxWcwKlrn6eHAKWOxG0sdfLJ93TRROWX9LiRakRfLAc7GMZbh
         OGgxb3JNzsSaP6JRiyt49cHGumie5HynLcLWwgAFlGJO5SSB0v+IL7NVBK9nBlNUgkph
         kXcyLnyp4kQEBynnhXrUl6eLpZEmAi8GLzIk72gTJtbcIhLZEYFGgod2SHPIkyfpwd1l
         LKnyQLfJC7AGKlkXXIVVSJQ0QIXbmYWXi+/dA79c6xXE8gGI7w4S4OoaB/+Qxa8LeVSU
         7VXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPldkTT6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c8e0590cf9sor1966181a12.2.2024.10.08.07.05.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:05:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QPldkTT6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396317; x=1729001117; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k3zM5SZzFFXff1PcUoOOg2pzr9xc0jKIhsNlrWCEwrQ=;
        b=QPldkTT6Qvn0ppCryNAi055R4wFB8gk4d+k6Pzk4qX5Ob87UWcMTYGSHZvsUZsfYJn
         BjevPAX1qfIpPtFApksVjSme0/IfFVVQ7HLxpIV0mcTYgU5B1zKaqiWpH0RjqJz3PbLF
         ZTnN0xUHor34qvN81H3GU39XDw88EKbzU9sCjXfdFo/q6u0CMuf6cZ5Qp2I8lIg3iuqI
         883hXAgRwjmZl+hEx61u1OywTOZacecrjlUZBtnRVrXQcm1cMJ2gwEnQX0yY2VGSpWjs
         VGxIuALiBvWuK5Z+CpdKtdqrz5AJwOKY6g5BeclrKpHGlNz9TSFG6keXeo1bTa2EvSA+
         FQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396317; x=1729001117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3zM5SZzFFXff1PcUoOOg2pzr9xc0jKIhsNlrWCEwrQ=;
        b=ampPFCTfg08rCoqcmN/DN8av1yzbDORB3xlK+zxVvVw8N18AMKTkA7AciQKzG1uP5u
         2krhXxbrdTuLQYSwdOfoSzA1ZRD7ZLNZuM6GL4eGQoO+HpyF3anG9uCxGrjjI+DWeEvP
         YqA01EQXarAid768DxuUvAlV+10o5ZhGUUavcyJO4z03NF22s0sPh7oiIhO6SBgDrf5t
         8mc0XnvKziHcpX/UKIR9ISpOGBi3oCrKWwPmpCqhmyl2sFntbESKS+V+k+TUNhNgzoPt
         3PEV3M/iFfL2vdK+d33Q2PzBgGSb30RM8Mres+6Os5jflGJDmHyprBNN6PC1GzaygTa0
         Rotw==
X-Forwarded-Encrypted: i=1; AJvYcCX12cDW2/ka9xjFPlcZp+rl/VHe/i63N7mj4VK3c92fkkOW6eK0uNyFABwG3yicn3KO89IrFMSsgxoULw==@linaro.org
X-Gm-Message-State: AOJu0YyrMNt/0aiqeM3Gif7asRQz6HWABYHM864TngM3WEeG22jmuGFX
	RhTgbdpiF6pDwi5b2W98Nm5qgJ2SgkGk7k9zj28iihf3hjfV8Y4Xb/H3vE0Tct7sDi1c0623mHv
	pmqsU2ZkIdPxnDJDT+9S1Fmikkn/fBF6wr7jAsmQe
X-Google-Smtp-Source: AGHT+IHNjcrGqvYeAx+CtcWJD/2XeNoJIOWs0WM7Cu599a18mWnVOQWoNyZ2UU1PgsioPILapS7mhcrrDQaS9ndYOJ4=
X-Received: by 2002:a05:6402:2350:b0:5c5:b679:cf29 with SMTP id
 4fb4d7f45d1cf-5c8d2d00fc6mr12862570a12.1.1728396316888; Tue, 08 Oct 2024
 07:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-5-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:05:06 +0100
Message-ID: <CAFEAcA-dvX_4evZJ98WwB=Wkkf3N5BDER9aoV2WA7pzn=kmXqw@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] include/exec/memop: Rename get_alignment_bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: tz2apP7SiQQl

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename to use "memop_" prefix, like other functions
> that operate on MemOp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
