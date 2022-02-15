Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp621237lfl;
        Tue, 15 Feb 2022 14:11:41 -0800 (PST)
X-Received: by 2002:a05:600c:190c:b0:37d:1f40:34c2 with SMTP id j12-20020a05600c190c00b0037d1f4034c2mr45385wmq.115.1644963101299;
        Tue, 15 Feb 2022 14:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644963101; cv=none;
        d=google.com; s=arc-20160816;
        b=XVN6/4aWuM8vEjquT61FDLkGB69I+m9Vs8didv+CCh7CrFR6cfI0gpYQbBuxiuYrX5
         kUoyQnVME5ONsHqP4pUI9zEGOJ++Chq3dAmV9c+yQf6mv9/nNYXOMMTvXSCfIc4aKfG6
         2byXUzZbpHTZS/fLzdBUFmjjnsBJVOcHgzFIJXWk3U58kjqDbMcvELbwCYskd2AHGSJm
         jVkdEwDrb9Rz00BHdYVvhGqpxvFlz2KZiRAjUQrtOa0EfnQ+mjBfBePclZGCEqsMPP/n
         BRDGn14AJbNF/k7udqvfnT1fqmsw+ePTW4EBi2FLFOPVl2/LJr5boj74H0IiIhjnbS7R
         IU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6l45nITMdKQCVwIvIyWPW5Dh3Kr/iLLnTta+LHGaJus=;
        b=Sq2SK8Wn2vCSk1gNFxV4DEBG0BF4zf/5+GDQIBT4ZuwCjY7SC+52qpLu+angmOO4KE
         GC8avhEcUPLt7Pfr+eHBz/jA7BOwQks4uN5tDVKdsgbNMLaJTfF86FxPu3SGnC+u/6E8
         tCkN43oARzu7HQAUlA8csc8ydlYkj9JexCoqPAXj/Xm0o/Q+60n5f/fuhvhHQPdC6WWa
         /GQGzctJ9lu81qujqTtWmtgOYbpVySCh0zi9QT6YiWacfW044qYMeCAus300D2857Vel
         dk0+FjJQ95y/AmTFAOHj8s0YvuTxGSVQFtlwmL4st7lbRnx1be29F8APxkAV/b0DqTAZ
         FmCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6fG9N04;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m9sor1366702wrp.78.2022.02.15.14.11.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6fG9N04;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6l45nITMdKQCVwIvIyWPW5Dh3Kr/iLLnTta+LHGaJus=;
        b=A6fG9N041sS5Be/0wAc6v2GxbD9aNdbSo7MPI4caIMFsQlwGTnddSH/DY7+H5oknAy
         oiSK/G+JfEtIBnNd+gPaJgpLX7/WTc2vDI9XakXyR2u96ytUVGAkfRourV+/Pjb9JXKP
         AlRYfYPQ0/QWOj4eYZdjb5F4yucegN/30mxOA8ElIWVP1OxdVevymSdvKojjY9Nm/958
         EIjHtDqtruvqCzZuBsMmGe1BsUdPNnnIra4gPd2joGM58EgH/P9yHa0FZFnv/Plc+YOI
         HBm+roH2BCMa2iUS8tOoPArdqMzkCm0PHnkkj9yh03VsNQ8Vn456OinmjiLmUziAuS11
         t3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6l45nITMdKQCVwIvIyWPW5Dh3Kr/iLLnTta+LHGaJus=;
        b=G3OGuKlV25uMSmGkw8DbHv5AM8SlIpe7HltHG9OiP50AOuXe2+vbpY8ENjJLd8LbK0
         RKtiqMP7aZqEwfJjc1WCD4aGG4xNGiLOPsTLNGzTI/G8pIDT6ckt019XGGlz00ge1zaG
         EG0QzMlwmrBAypZmEIk8YRNIx188ASV4v79RlFdyZAY6osBK4Qk9Yz/hFWKaF5Wo5Vup
         i0vKxcJuVt/EBmjFDq65zNNOThM/YI8zrlTiP1dKsOGYm2WbFTRp6dzDRHMAcY3jqgt5
         CEookXdUch3EmTwSbMtMPBd3pZT6mOb2NbP5u8OyPF3K1LAbtPGwuYgFT4kKcfr5T1n8
         904Q==
X-Gm-Message-State: AOAM531Nl26lWR5ODq8MKDDFy7gQ1eKFhup+2KQpixEm7D6IXSQqZaIS
	DloeGhf1LIH+YYEnkrXvwUg0mH6He/VVItHFe0x5IPYQvDcrOw==
X-Google-Smtp-Source: ABdhPJzrBoXG4PYgmoTsWvL/EzdkE9C4e/fMXEEFOR1pNYkh6ULjuIKhgiaSvx5LKXBvgBCzQnJt/OFcaNNtv/N4YN8=
X-Received: by 2002:a5d:40c8:0:b0:1e3:e76:129b with SMTP id
 b8-20020a5d40c8000000b001e30e76129bmr19792wrq.295.1644963101035; Tue, 15 Feb
 2022 14:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-12-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:11:30 +0000
Message-ID: <CAFEAcA-e298ko8fecqzNV+w=xUNu1YRwWi8TfZpcY3-mjPVQUA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] target/arm: Extend arm_fi_to_lfsc to level -1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: jfve1eifFUnJ

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With FEAT_LPA2, rather than introducing translation level 4,
> we introduce level -1, below the current level 0.  Extend
> arm_fi_to_lfsc to handle these faults.
>
> Assert that this new translation level does not leak into
> faults types for which it is not defined, which allows some
> masking of fi->level to be removed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
