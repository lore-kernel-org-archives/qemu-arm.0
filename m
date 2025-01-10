Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp274793njn;
        Fri, 10 Jan 2025 08:30:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWz7ONMe/fCn3q46kf9oQAbyqmga7Ggypa65uxM7E5NitWsN5d2wa28nBiYLB1A3VG0WLyzpFAjmkb83w==@linaro.org
X-Received: by 2002:a05:690c:6a81:b0:6ef:5013:bfd9 with SMTP id 00721157ae682-6f531224addmr99114707b3.10.1736526655900;
        Fri, 10 Jan 2025 08:30:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736526655; cv=none;
        d=google.com; s=arc-20240605;
        b=FYvoGe7DJnC9zN83IiPpj4011zJnco4tAiTYMwlidz94QJJBn3hj+jeux+ZEMpvzOS
         ajr/5l2lwAnlYuYe3YY9uTf6SZM2ITAU+qhX/4Dl8ZlgnEKSgQeDPEd/E7YTMW5yvP0A
         ri4k31jqIpQ3d9b1Oa6EVkHh1JQb9JHxTqfyH0E9k92CYp+r8gh/YmxxfVrcKW+gflIk
         Z6Vehs6S6nkR09Y/S6T5EWP8f9ovNSdbcnpq3bMeL3U6ffM4VdjBqJS+Us4x95e70oeG
         gv6Xs19nRX5WlaAvEn5TxcrX01ia5L1PvoHVwUtkiGmhtgVW+q1djWcHm55E4F5cDDFK
         CJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tOjN8m6pAWWKlrF+UoiZ9BUWdCEnhAqrkAD4Lc4wiQU=;
        fh=AS9whVWzkgWOurQNJuM80J+O5NdS1O8OExK9DVSm0tY=;
        b=LBDH3G+xuOJtqL6LAyL0ubxNZiZMYhSh8LfNKo7EWDEJKkghYsU0fOOJH5M3AjlJPI
         CXGWj8VULqGGAHTjPKW/aB97y/NkYXQtRz4vTnqsIeStoBNofSZRzS27h7rkysF1BOpJ
         CdN5qUQbxKTiSZkwpOOricPZCDgDwaQwl/28r4pjgUR4m7m1y58Yk0otMpLLpn0J00en
         TWV90ENd/yOi2Lp3dn4hfMhB5AKRISp14dVVlSwCGxh+Ean38LMsy8gjBHN/j6wHMQYZ
         L8T+oYLECSjV35JXHeSkmrHCVNmNR/r7IgVyHbeLIFZ480z+C/7+pPBX9RPTTMKub3gR
         dNWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbHFwy9H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546e5abefsor24205947b3.17.2025.01.10.08.30.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 08:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbHFwy9H;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736526655; x=1737131455; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tOjN8m6pAWWKlrF+UoiZ9BUWdCEnhAqrkAD4Lc4wiQU=;
        b=ZbHFwy9HQfJiRTYWsTJ+HMKjVYaoAdLoHLoU3rAj+uEomBTBLqDYVsA++7XctgBx2/
         h+hySgvN3xo+0g5RZvfxOpJnBY9BQw6OAG2kAOrBe7LYfjeJJk+na2CK9evbIQl8FMkA
         ssdI5D70PKuZ88mbfCz8CuFM9h6YNfl4ql71QCqqoPF81csxZ+txX8Xvr9Ytguo9k45J
         iGSK2IQIMiO6++SOsoC2UTuJgZ0VVXnPaytsUH1oJcaH+w8rUPxDezY3ibdK7Tb5Frf0
         6B0GLPNErZmnO5UBcF1Qf7cnEZwZdiOdKnwV9xlwno4uFzudAPNAd5DPMbvmfDSiPE64
         WcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736526655; x=1737131455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOjN8m6pAWWKlrF+UoiZ9BUWdCEnhAqrkAD4Lc4wiQU=;
        b=DqQz71z4C+fOC2pv9Alg+B4AVQsRZxd/s/o36Vf7yaRb4p/U6028u5YpFkd9vTAXQF
         czu8RMF3zvHVoppeNiuB77DQN2YoaebbcZ0aEjKJOwtTIy6I4tEj9sStlz9JSTjDu+wr
         qV84P9JqNNKXGjgljTi9sDzG6vvfdkU7piZUdMRIcB+cC2tl7ZqBkj281iQ/XqzqcUUh
         AVx/Si9tWiW5602BBzS/KUfTODSf/JOaXYQRuDlNQMoUiK1xYgCLSmbvpxMU/IEcuze4
         mFku756hHxmPEt+KdsuXU9h0ksM8lTvdNh7F3xdzqny5GtqZymQYgNYdb6MqUPZ67/4+
         l1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3SH01KRkRVPNS/Tjp9ZqVJsZCCNW8mn+9DlDK0RnILRThmufIt3qLskxKS7mo//IP4B0usqRHym0Hyg==@linaro.org
X-Gm-Message-State: AOJu0YwlTrj9wGur83yjtFa3913ocpM1+HKYVwk+AZ2DjX2XkCLvVntC
	Tnu5FZirV4RUnaNCnQiNdvO9zYkJ0ZWSV3XfJP0uSE8T+XiCMfxq75xTf2QvqPxLmmqClXqPR9k
	h6HUT7/aVM568nHyofUE49DcJ8RB3OuBHTDGFAizI
X-Gm-Gg: ASbGncvxb5EkaIX/KpOifwJbSg8N+UE3A924CJIBHBjrCQ0B0Q0OMHMJpqc6x5coGfT
	ohAdmEotREgh7sIqlihZyaswaqtP/FjmhAyGTvmA=
X-Google-Smtp-Source: AGHT+IFIThR1nWg2E2ZbcTQ1CB6HxWK3gXQFQb3UMHPNlFswAmVdNbpsenaVwBSS6Nzr5+VyewZOoFjzWUxAry+zRKU=
X-Received: by 2002:a05:690c:4b05:b0:6ef:4a1f:36b7 with SMTP id
 00721157ae682-6f53125116fmr94518747b3.25.1736526653899; Fri, 10 Jan 2025
 08:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org> <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
In-Reply-To: <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 16:30:42 +0000
X-Gm-Features: AbW1kvbDlPjtMqJ70EJJAZfqo4gcYiCApNqqwcyLmxpQWs7Vv0GP0MPiMsqw-po
Message-ID: <CAFEAcA-LYWhtFaUanq_qS8nDEVdhDOhDR2kcKv8Ch_5fKSnv-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration information
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
	Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
	qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: aPDatPUWTt4W

On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/system/arm/virt.rst | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index d25275c27ce..9f1457cf9a2 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -17,9 +17,17 @@ to have the same behaviour as that of previous QEMU releases, so
>  that VM migration will work between QEMU versions. For instance the
>  ``virt-5.0`` machine type will behave like the ``virt`` machine from
>  the QEMU 5.0 release, and migration should work between ``virt-5.0``
> -of the 5.0 release and ``virt-5.0`` of the 5.1 release. Migration
> -is not guaranteed to work between different QEMU releases for
> -the non-versioned ``virt`` machine type.
> +of the 5.0 release and ``virt-5.0`` of the 5.1 release.
> +
> +When saving a VM using the ``virt`` model, the snapshot is automatically set to
> +target the latest ``virt`` versioned model. When loading the VM with a more
> +recent QEMU version, you'll need to set machine model to match the version of
> +your snapshot. When loading it, QEMU will return an error with the expected
> +``virt`` version you should set, so you don't need to record it.

I don't think we should be encouraging this -- our standard approach
is "use the versioned machine types if you want migration", not
"you can start with an unversioned type on the source end". So I've
dropped this paragraph.

> +
> +VM migration is not guaranteed when using ``-cpu max``, as features supported
> +may change between QEMU versions. To ensure your VM can be migrated, it is
> +recommended to use another cpu model instead.

This paragraph is good, though -- that 'max' doesn't work for migration
is important, and we should definitely document that.

thanks
-- PMM
