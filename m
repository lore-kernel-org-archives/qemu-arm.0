Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp486854lfc;
        Fri, 29 May 2020 06:27:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySn4u5cgXROx8UQKSv9/IbtAibrSdYD2dNi9XEkA24OKo4cp2s3fu8WKtGh4YnpdTpH3Ca
X-Received: by 2002:a25:7102:: with SMTP id m2mr13179034ybc.327.1590758877296;
        Fri, 29 May 2020 06:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590758877; cv=none;
        d=google.com; s=arc-20160816;
        b=EQu5VHS1wAhOFGORSbFxjg7xyhO7bwRF4QNQxVxm/dU0B0KQSbHTe328yxZHS/pxGH
         xkA+Mc5Ea/9Ig3TMdCSrlSPTFv2E6eqkv1v1lmB6wCdLkq49Dn4GEb0aUNKh3ix9P3q4
         8GiLaAT+PBGB+/+rVNXC3ceYL72XOCFLoq4AJtdeI+IPG+a3MVRnhGhl3y+Gk+I7YwT7
         p90zGSbmqH8SRyxLk5Yui+i9JNEoJ39/MO23BFTqJCutUhii3fCgRZDR3iFtP+5IdLba
         bwhQ5Xb8d6mIf7ERrgGokf/VHDPCCEzGID8fhTpTbsVVBCC6KFP9rvJ/+jYgaBiTayUi
         rbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=btgoFOOyR201ip2U5xlh75C3/9fSQsab6c8vWsLd7P4=;
        b=OkdLF+s6X/78h2G4p0iGzCya737mPOuMAs7ElsvpbAsrI8vvX6u6fNPaZ0+zZNWcU3
         zaw2pBjARbYgShhtHKF0gCHhphHziwL854FxsFWV5VtjiHkJAkYIUq3ayhc6BzvNPyrt
         mS5+/Ya90iL6ROAzvcvYA6h6xpqPLye8leOlm0J2uxOm7zayjDzVJeTO16iPxCqHGdHQ
         cVnjRgzFr3IxyVrZI+M+KHTNaZTyLBumtYwKanVSueIJ3cH8GQZLXzcDSS00rRrO5XQz
         Y6hxP5nWlcSfuUbGb0Fh6PSt8WhMYtlaPdW6xT/xZaNuwrBlH7E/kbWStI1+6raHDSei
         OvQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NuxkKdvN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e85si7626955ybb.402.2020.05.29.06.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 06:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NuxkKdvN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jef3E-0002as-MV
	for alex.bennee@linaro.org; Fri, 29 May 2020 09:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jef0w-0007OP-2Z
 for qemu-arm@nongnu.org; Fri, 29 May 2020 09:25:35 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jef0u-0004YY-A1
 for qemu-arm@nongnu.org; Fri, 29 May 2020 09:25:33 -0400
Received: by mail-oi1-x241.google.com with SMTP id j145so2529407oib.5
 for <qemu-arm@nongnu.org>; Fri, 29 May 2020 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=btgoFOOyR201ip2U5xlh75C3/9fSQsab6c8vWsLd7P4=;
 b=NuxkKdvNH3Ml2auKBoV2zLyLN4/FqjwIxufUiCdgDGEfKfw1XxGczx+UQ5NwEJsxeE
 080lEVkgPxa8r6xPQIPBv/15lS9xI7jrfQuaonvVKcS4w08BRhLfcmFiBLsePbcxxq0l
 KAaledeB98PniOyge4mrugyabLS+CsfOzBSstYIqmpuAiKTNhXaRACNtgnsocoxE3pFX
 ES9aL7yDEnRy9Mhr91q5F7A6YNkOa8q55CXD3VUlEvqTRZFL14qpx7QAYImAjqrslaDS
 er4APZSqstq91l1sYNCb4flgPVtbqAhVHidDFk0l6UIdLpqVO7UbUHEl3S3ZU0bTrEpF
 IrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=btgoFOOyR201ip2U5xlh75C3/9fSQsab6c8vWsLd7P4=;
 b=Ukwve4I5qSTAbKHISx0zXgYVspJo2HQEqjnwHqrms0jkWSImKmPG1Q09jQzztySJg/
 5MM3z2iGADx2kPBg3Bn9zgmAXQh0f20bcLuPeuHE9nBnKm2/aStD3qnGhhnr+R9wLVoB
 qFwwrx08qqxc+O/s6kOgND9+zNwsjykPfst0JfEzuzCf1w3aODj0U2i3Xw4KhUgAS2B+
 ce9P+kMzc5zNtFMR3mg2b8eBbRoMqx6nzN0nIru0cmm/BsCi8oJSzLjgL585TCFeYJAR
 vDk1n0kXgnuiZ2xImiXL3qqop0n8QYyvRh0HuSPdHURO63Bu+ruFprAjQk0utHCOSgyI
 WHzQ==
X-Gm-Message-State: AOAM531ruCDC2uwnsBQGVLWgSNIx3C/1bgzRQ0pViD0/WkQQFyn9gXil
 Ks8sExxyfqMD4JMDopd8m+2XWt1FGg7GFLNmlsHERQ==
X-Received: by 2002:a54:469a:: with SMTP id k26mr5702300oic.163.1590758730883; 
 Fri, 29 May 2020 06:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200525114123.21317-1-f4bug@amsat.org>
In-Reply-To: <20200525114123.21317-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2020 14:25:20 +0100
Message-ID: <CAFEAcA_iW32pJHnAOC0J5P3JTh=4yS6rzpSZ7a2tn0_uhsrD8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/pxa2xx: Logging cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lbBF274P6But

On Mon, 25 May 2020 at 12:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Last pair of trivial logging cleanup patches
> from last week-end.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/input/pxa2xx_keypad: Replace hw_error() by qemu_log_mask()
>   hw/arm/pxa2xx: Replace printf() call by qemu_log_mask()
>
>  hw/arm/pxa2xx.c          | 66 +++++++++++++++++++++++++++++-----------
>  hw/display/pxa2xx_lcd.c  | 26 ++++++++--------
>  hw/input/pxa2xx_keypad.c | 10 ++++--
>  3 files changed, 70 insertions(+), 32 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
