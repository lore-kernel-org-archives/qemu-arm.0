Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp765171lfb;
        Fri, 22 Jan 2021 03:49:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTKo+l0aazVO5VF/iI3ZixjeFc0hCxV71DM9H7KIZXCtOTs3GJu1Ig4ZJvTr914uS3INkR
X-Received: by 2002:a25:ab25:: with SMTP id u34mr5667135ybi.271.1611316152957;
        Fri, 22 Jan 2021 03:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611316152; cv=none;
        d=google.com; s=arc-20160816;
        b=0GscsBpqnitKqYy5EZZJXHK+RL7zV5wl54/k2EVYhZzoTvlPqriyt0eXfcuV8mMHnn
         nQTtbcKajnRcSLs13dmyHXMT/c4NO/0keP/99rm1gy2oHL8E2rwwzzWfzdNOHOG49KHl
         gDVjzuKIhoTg1uaFAbSiDQP6860lkxPe1l1PnOf9QGhfcV56Y+U1FLtvAq1IXC4z9CRy
         oteL3XQiDVtqKfEK2ZcgyF+R40wAmIllTV+w0I41/9jS+JWGaUhBMPtfhI5+wqKhFuYg
         nmjFe63WBmOxU3vYigkZKLdH48J4cc1KeJ/agE0NgCwCajUbY1dkhAke1sIGwRpArT5h
         a8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=da1D08BSFwrFl+/DOs3EwV7BlyBgYJnhBZVQpyydfnM=;
        b=Fj4DfYKUJ1o3M+k1dNP87kEG6eYEjStttQ++rus5UpRgJimDTYP0FGFhlxHlb+m+XN
         hVK56+bzUuD0sJS/RmBnydysDx7kGZTeNVK79nNrsG1Rzm97R6/lb94GB7rga24ck/w7
         bjMhDp+vkx4mv0rkjMW7VsitPRrdpb3l1ZYGgeSB2gjY+6/HbL9EQ6U1FeZ+7bjJMTB0
         MRENqPHLMbiLDSt51yIniMZj+uVNyMMC/JBCX0lLcA5KSyuUSXtXoWVDy7pIeFC7PIsm
         r/NLIC0PHGScgcITr0DHraNp8Ww0PLh2C+CqPJ+Gr80SUHnbxOY8+hdiTeXRQ8W0CHVl
         iQMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NzayhP2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w143si8421485ybg.455.2021.01.22.03.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 03:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NzayhP2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2uwC-0005Wn-A9
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 06:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2uw1-0005VX-5y
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 06:49:02 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2uvy-0001eY-4B
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 06:49:00 -0500
Received: by mail-ej1-x635.google.com with SMTP id ox12so7288642ejb.2
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 03:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=da1D08BSFwrFl+/DOs3EwV7BlyBgYJnhBZVQpyydfnM=;
 b=NzayhP2Eg4UbcmFqdM0X91zrHWKluhHq60VOZZ9SGFal3BvpQfOQl0Z2K14J0J18mb
 IbL7mXnAKz1VNaKcyAeeX59fJEK/fVxYEAr7hYL2nw774LK3IBpy3AzAtTDVisZMTpC4
 ApcsOVtfNAqVdj+3ko+NZn9yf+6JMELzJ6nYrwk6Ws7+WHC8zqYp2hsoja9au+/33fnE
 TUHgXkuQZ4uB0aQk6UjQzc4Up8oKsBc6kEiVp2hm5H6aff/xugDSSPhOwlPcy7XAKOzY
 YPJm0d5QH/ffsg3xKntFfr1eERK+Dtm+shLIRul/KQ3hXa9igXXu99aBm/J+pxoRpw18
 abYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=da1D08BSFwrFl+/DOs3EwV7BlyBgYJnhBZVQpyydfnM=;
 b=EBr03pLWLHHlGbVbtZCv+9NRW1RjxwkQAK/U6Qg3FzoC7duV6Mga71BGmY9xr74MqQ
 GEXMM1OYs+4aLdn5+0fom6iQf9h73elW77Am9bdH4BrgoI/qa1y7aOvXPNq/zPcDDxmJ
 MQRe3poQVRqCPl7fW3WHrD7Q+2pYlxdeH+jFXVoc0cFRiT3spbjlnydWJTlmoeeXGDgE
 ne6Fsof0cKRc7inT5DAZ5nytgDupeuY0uYwzIMi3Mr8CIudg3Rcx+SlslI88lde49ouP
 aW0MI8Urj7t/Hr/5fubu33wNe1L1O4+3GWdQ7z7UWwFi/dezfF5HnrsifKZW28U96pVs
 pIpw==
X-Gm-Message-State: AOAM532u5Xaleo+4OmDijP+BXTo9CNCoyzQELD/W8X8CNr0LqT6hD/t5
 RjPxsUaLFJa1/msme2RWJZVkCOB8aZJDcprnNJpGcQ==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr2754020ejc.482.1611316136532; 
 Fri, 22 Jan 2021 03:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-14-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 11:48:45 +0000
Message-ID: <CAFEAcA9Hh6hx2s1iYWatUYD2500PQcLxzOYMOiDL=7hF=va_aQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pyqVK8sQOmKf

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These prctl fields are required for the function of MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_syscall.h |  9 ++++++
>  linux-user/syscall.c                | 44 +++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
> index 820601dfcc..76f6c3391d 100644
> --- a/linux-user/aarch64/target_syscall.h
> +++ b/linux-user/aarch64/target_syscall.h
> @@ -33,5 +33,14 @@ struct target_pt_regs {
>  #define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
>  #define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
>  # define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
> +/* MTE tag check fault modes */
> +# define TARGET_PR_MTE_TCF_SHIFT       1
> +# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
> +# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
> +# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
> +# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
> +/* MTE tag inclusion mask */
> +# define TARGET_PR_MTE_TAG_SHIFT       3
> +# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
