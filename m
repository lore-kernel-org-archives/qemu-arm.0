Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2882347njk;
        Mon, 2 Dec 2024 06:36:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvOT24bi2vlB8jp6GMq7461oJopAdAj2QEDLXvgpPwacelzJMJj9WBeiWqHAAFdNgYRTi/NwRvhwYXUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGs5tl4+Jh2rlpFuyHs6B10r3hxXotbjXEpIt0cB/F06DpSG/1WN8NKoUguV2AzwhVHpyw
X-Received: by 2002:a05:620a:2915:b0:7b1:3bf5:2da9 with SMTP id af79cd13be357-7b67c2c0f89mr3287346585a.31.1733150165644;
        Mon, 02 Dec 2024 06:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733150165; cv=none;
        d=google.com; s=arc-20240605;
        b=iEZxmQPWOWLw5sycXox/tQVeyPI2nDzHEaPdGREkdyHpMBQrzqDIryGiM02/ReAsoI
         FotVnDB9PUCXhvixj/w98FIFXOGmAmGLQPhFIK2uDziFeDvHPu7x8gxRgCcEy6t/TbJ+
         O8oddyRRqw1G/5uJ76cs7975/BMvOovHYsAyHjxbTE2sH+gk71xFXkgIcGaWjjSivIsc
         hKCPuLjG+pc5U4CMQDD9guUSQ8DBjNdmJaElJNWBgwlcMOKh38787Qgt0SKtjtZRHja5
         ngOTs6hcJTEHd5DAzsMO8hYpZOUwI5EiacM7Md2/HaG29Ao8udBfXzZnQGbeiVb+XErm
         ljoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PqJJr9y8Dl0BPwYB9bun4zqq4pTFEC9sPqFDoiAozPQ=;
        fh=svCYSS0bv+cTUa68Yh44hSoBeWkZ/DlrMjrnNq7Po4c=;
        b=RKRWYi9ve4e+5CKXjgPpIxszPuZxjIESpDgvfL1N2CWENQf6dW+FFGaqxeG9P2gF1B
         xG5MVqYKyHKpJtbzwjPr4po1/YurPUC5MDvYAqDtWlKrzl6RE774YA2pRxpZ8rC+wyrS
         O+52GmERbldKceTVy8N3dFCL6gRq0nDtMtdN3OFzGtd1QHpGya6beoP/06Bqd+w5ol7A
         pHxZhER+mml7cjQDfKDC9dnn1lvUDY1mXwUB/2FScf5lMGN61ejHS+0fQIH1ZQ8NvgCE
         ecZVFiDJETGpMFWJqqfmeHuGNlVHv0hu8w/9FvNRKHdCYnA9ia0qyaxtidZOmTKvR6qA
         tRig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awgMwydz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4108025si121043661cf.261.2024.12.02.06.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awgMwydz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI7Wd-0006ij-EM; Mon, 02 Dec 2024 09:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7U3-0003Cs-A9
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:33:08 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tI7Tz-0004U0-Mt
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:33:05 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so5024117a12.2
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733149979; x=1733754779; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PqJJr9y8Dl0BPwYB9bun4zqq4pTFEC9sPqFDoiAozPQ=;
 b=awgMwydzzPlkQgRia0rql6tnYfQRXpNJUhxs6EYCMCnJ/urIDIOjHGCqAWM2cjZFY0
 ABRBEVoZPbDCfwBNbpttjLcOTMZAq9BBIeC9KReUEtwK8+bzXeY4cwstTL5YcgRCNT9i
 3HMO7yeq5zq5whmnfzsSGgzK6QIgXfSOaiLqSSYFNfwIAXDpkJbNKSEPRzJxT5Xww3GF
 KxltA5pm3R59JC7KdMLGSnQf3ehyZIWoYTNgzEvPH/kWcXpvCvNGuFUelIXr/w7hZQXZ
 Ys1HkINte2dJ9PYTXZYw3u5mYuH5Fo+z8VWLpmi5FjRhFcJpAQyHL6GwuAIXa8y4XaIO
 c25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733149979; x=1733754779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqJJr9y8Dl0BPwYB9bun4zqq4pTFEC9sPqFDoiAozPQ=;
 b=EsPoAuvuJ9SPXJpNwE2b+/u9VD42YwGvqncXZr53GNDdEMvkLpFwJzizkh/LiXZX/I
 /QvP9RjKIHj6kQGU64tur6gpSee5jSyjoj0c53V9+ss0Xq5kecIBqsyVmlv6y2Aafi8c
 HcdhBhvrlI/hobho+27BLhk4ZE5JPQtcaO4iJtzUU5frwIgrj1CimpaiZ/MHtH+BVoA3
 ZiKOZsHS5hpP5BrVlLv6fYLUiEiRiObvg1OtYmSwIgq9rMmJslo/lKJWpqpUqIhlSMeS
 SgCmddycIFEDdVi/4Js+v/+fp/0b2pBNDaoU2/AahoTpmFc64zBprIckNpjbKZ3HF80Q
 YQxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKrfRbKKNthscGuh5qjaILMEOmBXe8hwDBeBRE5Ourw9Vzfp9p8b8ObDWkH/gXO0FNBYlbSW8tg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8aZpehO8A8jRzEnbqqPJdGjI6d3auVKlFHHL472UE39/eps1Q
 gYyXQSs1t0zzp654mhQ6w0Kl7H6tj/SZfijIwUw3h6bo5jymIP4ePN4S+1mLk6aW9Klu1My1XPE
 XJQpqtBaqMXCzt0PgA4dAhITgdB0GhGUbAwu04g==
X-Gm-Gg: ASbGncuNyD5/AH4qvLjQVLpW2MYonqzXy0QwuAltqcYVcqsJbSdWyQnlj20uBx+/etj
 ZsFJtJZx791EIWPIo/PwMRb5zWBVRrNVI
X-Received: by 2002:a05:6402:5252:b0:5d0:c755:4d85 with SMTP id
 4fb4d7f45d1cf-5d0c7554ff6mr13363582a12.0.1733149978941; Mon, 02 Dec 2024
 06:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-3-shentey@gmail.com>
In-Reply-To: <20241102125724.532843-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 14:32:47 +0000
Message-ID: <CAFEAcA9-R7sQ_0per6PEOjw-She10XkXNKdYZb4sMm2ALn_sDA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/net/lan9118_phy: Reuse in imx_fec and
 consolidate implementations
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jbf19yR8xE5+

On Sat, 2 Nov 2024 at 12:57, Bernhard Beschow <shentey@gmail.com> wrote:
>
> imx_fec models the same PHY as lan9118_phy. The code is almost the same with
> imx_fec having more logging and tracing. Merge these improvements into
> lan9118_phy and reuse in imx_fec to fix the code duplication.
>
> Some migration state how resides in the new device model which breaks migration
> compatibility for the following machines:
> * imx25-pdk
> * sabrelite
> * mcimx7d-sabre
> * mcimx6ul-evk
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
