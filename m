Received: by 10.223.188.70 with SMTP id a6csp2324738wrh;
        Thu, 24 Aug 2017 09:02:41 -0700 (PDT)
X-Received: by 10.36.217.70 with SMTP id p67mr6293635itg.110.1503590561153;
        Thu, 24 Aug 2017 09:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503590561; cv=none;
        d=google.com; s=arc-20160816;
        b=p2OaSviXY9L2BWDfAo4qkKqzy8+8I9XPezgYejbMIDiZiHoV1CA0qhD+lO7SoHm3MJ
         bYrVD610HUIQHFdoxGwi7mkw2S1Ue/umAGBprymulKnpmz180dyQQKmnnPeJjJxAlTSz
         OcVrbXLgkpu6QAUloX6IdEqTlcbfhADKD8T7H4IMAlmbyRalUGAydlZh/igaJ+kig8wz
         7yXOKvc0xFlhR20uk9YG46rs2lBSNb04YytJ4JJqsCcBmrezGv0Ufw1w/TXzZfPs4kdE
         uOq+h/l2MunxYt/TjNVPNGfukQmVxajZ2HvFsKS2KR6W7ztZbRJQXTaC9l1UHgQMhV3m
         tALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=0LgN/d6c1dD1ghj5LIlUZfkGDkIkXh22+MzB8OdnZcg=;
        b=MSSsxS0eJkwisme2Lh8w4ri9L9hXszINr2dEx7xQVnKuq6XFy7Jw1HUbno/ilDYeOe
         kNaQRFgxAPeBnghVXJgZ6/n3yTRl2vmGn7nJiYUMh5mlXeV8Vfak4Kf737U1tlPSFYFj
         5vWPxtn+U/jBNfQuwcTFBjS1nghY8YRmsKhC/I+2VJBLhdyARABS7Zl8xpuUaFnNCylq
         uO1JF3lJOxmuSyI+zFM93QPT16phcTnUEGh6Wwkr9uAG9uxbIf0UZqaUCRZ5SJD0d3ug
         znMTdDYIWm5R9FzSRevFdmzDIbsYqfirHFuP33p5BHCVSXuz8iSlMVmEqZxqzNDDWflY
         auMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DQCd9uPd;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t205sor488650iod.31.2017.08.24.09.02.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 24 Aug 2017 09:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DQCd9uPd;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=0LgN/d6c1dD1ghj5LIlUZfkGDkIkXh22+MzB8OdnZcg=;
        b=DQCd9uPdvnJQdBBbRpMsCIwOgFytROxJsOkiKWUoj/U+qYpEHD/EtL3H/55HEURbw6
         w/fDd4zsdoqR3uDAiPP8pVZy+OmGr8yR5drzzPpnEFT9AvfWsv6JG2LBVoITDiW4gYOW
         ozBgBsv/ds+7MqPWtS2toSiJTh9O12cHu7REg6WnuLFr+9Hz3zTX1IzKVgodbBv5BF4H
         rlDd4ifyIwe1CyWA+QtKF8bHlR6QCL2Bxym5H1frmoigw2A8uxqKD+iB8J01v5Iqx0Cl
         hITRCLu1SPPK4a/k4dLWoDBZ5AUZpOIKLszOwYuoJRJk+w4x6xaO7TxqosfluVDH7rLi
         HOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to;
        bh=0LgN/d6c1dD1ghj5LIlUZfkGDkIkXh22+MzB8OdnZcg=;
        b=CGDf65axyxoln3UqIyDyIdCbCaEG58xRDBBsWme7+4L9OVBG1dHB4ba6dsgVmjLA7A
         pfxaqoVUrXTV0aIy3H05qWePOs/P4N3MWXXt9tM7Yvbn8mcWL90u7StbNfY4Lfgdcqpc
         EQ0Uy2VnH8lRGdXU7X9E5M+7YDS44Q4Da5daqR1p96ldxsym1a5ngGmvLBiWnUo5mvzF
         +TaABqze5K75znwLVVKxU6fcY5nAol8WrKfuAAPBiHue3KukuYNxCK7yUpkwOt2nJ8Dg
         zI01/Gcya65fukcqSa7P8L9uuEo4yBOqvoxZbTHTL3fzC8If3/kDoTKYT+4hN0GJM1S9
         xT7A==
X-Gm-Message-State: AHYfb5gJHEhNoDqt4bgRRCsOWtFllQ1gBewjCPf8zySc6TAw9pzqUqJI
	nuSXHIL42IJ/EdzxurfhXYRTKBQn++3Sbno9Dw==
X-Received: by 10.107.43.88 with SMTP id r85mr5153530ior.177.1503590560520;
 Thu, 24 Aug 2017 09:02:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.68 with HTTP; Thu, 24 Aug 2017 09:02:10 -0700 (PDT)
In-Reply-To: <20170824155849.30799-1-bobby.prani@gmail.com>
References: <20170824155849.30799-1-bobby.prani@gmail.com>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Thu, 24 Aug 2017 12:02:10 -0400
Message-ID: <CAJhHMCArPfB_5kraiW=Z047ppFuMsVqxYftNpsZp7Q2KPd49=w@mail.gmail.com>
Subject: Re: [RFC v2 PATCH] tcg/softmmu: Increase size of TLB caches
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>, 
	"open list:Overall" <qemu-devel@nongnu.org>, "open list:AArch64 target" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: yXYN1hvUkxOl

On Thu, Aug 24, 2017 at 11:58 AM, Pranith Kumar <bobby.prani@gmail.com> wrote:
> This patch increases the number of entries cached in the TLB. I went
> over a few architectures to see if increasing it is problematic. Only
> armv6 seems to have a limitation that only 8 bits can be used for
> indexing these entries. For other architectures, the number of TLB
> entries is increased to a 4K-sized cache. The patch also doubles the
> number of victim TLB entries.
>
> A few statistics collected from a build benchmark for various cache
> sizes is below:
>
> | TLB bits\vTLB entires |             8 |            16  |            32 |
> |                     8 | 952.94(+0.0%) | 929.99(+2.4%)  | 919.02(+3.6%) |
> |                    10 | 898.92(+5.6%) | 886.13(+7.0%)  | 887.03(+6.9%) |
> |                    12 | 878.56(+7.8%) | 873.53(+8.3%)* | 875.34(+8.1%) |
>
> The best combination for this workload came out to be 12 bits for the
> TLB and a 16 entry vTLB cache.

You can find the raw data here: http://paste.ubuntu.com/25383585/

Thanks,
-- 
Pranith
