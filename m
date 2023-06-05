Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2799112ejb;
        Mon, 5 Jun 2023 06:38:11 -0700 (PDT)
X-Received: by 2002:a17:906:ee82:b0:94e:4285:390c with SMTP id wt2-20020a170906ee8200b0094e4285390cmr6408588ejb.10.1685972291083;
        Mon, 05 Jun 2023 06:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685972291; cv=none;
        d=google.com; s=arc-20160816;
        b=GMfd3oDA7J5T1EEj64INa0uKoKhOwjc4I3SRDQlKeE/0E5Zg1NdKvyc5gyqURmBj1O
         7VPTzF6LtTIKLorZQ0lNKptwX8JSNkF3kvOQVwBLa9z/bpGdPHYqqmJZLn9Oaqe6KBZx
         55v30HFPDPpHQp9vyD99wtsms8s/BkVSF1t4WhT6wDaKxFk7xiIC18XD1ap/PchSEfZ2
         rx0BEsbW2SkyitBT+KC8EoTMT330mKGIvl+g9UIWPruTXc/Qe5MbjCRe56zUL/UYvXq1
         INYlYban4IyrtZA3rO+6S6Lt6sKXMPAO/JsyfoEn0/sk3yOcGjwgtWZ//9BT0gQahyVj
         luQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yJRpa/GQE8w5GC6UZJoClHK77tuIGKMKbmNhSCVbhJo=;
        b=AP1AmHNZ7KkDiLs27DOdqcn8QagTicOtUCctfhXwj9vYyMJfjTufOJXEzxllyxpqAa
         ifdZqNjXhj+C4oSY3hvzOGNH2fSYgurAlbUl4YyEUYq4yTWXtpcvts/MvK3c6DaWqfbe
         6uDni19p/8nHbOg3FOYAUMyMS+0+Gv2gfMUvb2Ft+5x+e7XPluCUpRmLINIeIE0SFoBN
         Zt1QUw0DHQE2CDP8GaPO1BOIJlTGDYkjW/e/Kr+FjWmH9zwAwm7Ex6eXiqqDcWqRfZVe
         poBC7Iub46oTWTeVbtgcmMvTpgh7WNk2D4iBBikLmfDODKsU0TZGKgKz3AGa0bJEKmZu
         FOLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSQ0TMFK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qw15-20020a1709066a0f00b00977cc2e9d5dsor285910ejc.0.2023.06.05.06.38.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Jun 2023 06:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MSQ0TMFK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685972291; x=1688564291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yJRpa/GQE8w5GC6UZJoClHK77tuIGKMKbmNhSCVbhJo=;
        b=MSQ0TMFKNurHtw01IG7hV0jkCWiIEhd3HSOfslmAHPoPSoNhmKQ8Rin24LmzdWgUvQ
         kILAb6834R5im7ilmvBe1lCpvQIa7cQizJjZH0ptvvCK/7DOV2W7dOgI+RIUtiaNQZLf
         8dFFezWLPRwWemwsQv1+SNjSVPSLh+Eq0mxaqrd7b9oDHttgh5zKHzRq1xK2xbb/3RID
         XN5ocguAGSpQkxNYsWIZl1b8Nh3zSCqBOedbKPOp+pWgrlg7q/ZLW43Tb8vx/vkGQWlM
         yg4LcYh+ZUlO1qbtVIfSF/7wEHzq2bwk0rbLP6LWvsuWRfWnvDbg9ENpgA879Zma55v1
         D+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685972291; x=1688564291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJRpa/GQE8w5GC6UZJoClHK77tuIGKMKbmNhSCVbhJo=;
        b=KW3U+Kp/Kn3VNyrdKqPawInfdzMNDtq/n9L0W1ZpmTU0WgtWVoQcukAeHBenFrNCDf
         sFDZXgglB5ga/XaKFaSwncjFzzRcw7hhaAb1Mxs7XijTl/8XXOL/qGhVuWoZv1x6uhjv
         bayV7MVJ59itgev2ctpQHFNEEJsWNL+ytLw+yjJgFkt09HRsPjsAiTYmHFUWN4RYI3h1
         mZynnLfd7T4NKMzpUDamTbNoDWe/sIwhHP78rdeIhUzuZLPGxxitOdQGt1Lt0ji2PomU
         Z+uT2pNflg9aaKEAOev1b1f84mw4YwsEqmUro6CN6uyTvromrG06vgWINX+1zj6Ys9I9
         BUvg==
X-Gm-Message-State: AC+VfDw/iUypYjDj5BL/Kj/1d7D4zstQ6UAd3FAMQ5zg9/HLYQ0XCJZD
	VkWlcLV6aVnGcUfsKTLECA7XEvZz2x91XMiyFbsRi/1IL9XKF7uFl44=
X-Google-Smtp-Source: ACHHUZ4GH8Y/X1Jrogy/L6R+qO9bT6K+XLeuxd5C1hJYqFkx/GWmBr3QG44JaVxKvOX6hKRlxZVWo7rqJJEClU7ulAM=
X-Received: by 2002:a05:6402:354c:b0:506:71bd:3931 with SMTP id
 f12-20020a056402354c00b0050671bd3931mr10545012edd.2.1685972290777; Mon, 05
 Jun 2023 06:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230601153107.81955-1-fcagnin@quarkslab.com>
In-Reply-To: <20230601153107.81955-1-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2023 14:37:37 +0100
Message-ID: <CAFEAcA-8EBFJLb4SMCT=zy5Qy3gcybaTistVOckMOO+iQn_qRQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Add gdbstub support to HVF
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, philmd@linaro.org, 
	Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PDVKNQ4OhvQd

On Thu, 1 Jun 2023 at 16:31, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> This patch series aims to add gdbstub support to HVF (the 'QEMU accelerator
> on macOS that employs Hypervisor.framework') on Apple Silicon hosts.
>
> The proposed implementation, structured like the KVM counterpart, handles
> single-stepping, software breakpoints, hardware breakpoints and hardware
> watchpoints.
>
> The patch has been most recently tested working on a macOS Ventura 13.4
> ARM64 host and a Linux kernel 5.19 guest with the test script
> 'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work with
> Linux kernels compiled on macOS, see
> https://gitlab.com/qemu-project/qemu/-/issues/1489).
>
> This version of the patch should fix previously reported issues on
> multi-cores guests. No other issues are known.
>
> The patch has been tested on top of QEMU v8.0.1 dabb418.



Applied to target-arm.next, thanks.

-- PMM
