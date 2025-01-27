Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2459729njk;
        Mon, 27 Jan 2025 06:06:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuimMcJWA4CC3F2XzVJ2reIYvZpMusCAi5xZyPEuD7EPvbgKwJiAE3lqfV6gzKPxBvKE+k8mgkT6W8Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IFSZb5cJfoLrk68Hyrm+POImke0JMhrP3N/miTg2OdZevVzZVXLZ4ui7M4AI5E6H9816naV
X-Received: by 2002:a05:620a:4094:b0:7b6:d88e:f192 with SMTP id af79cd13be357-7be63249e52mr5715065285a.28.1737986802877;
        Mon, 27 Jan 2025 06:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986802; cv=none;
        d=google.com; s=arc-20240605;
        b=ci3JxWu1pFCGxOrOBBbPrMMnwUfihaZ7Vo+/5Yj3VIkzz4aXez7x/j+sKsOj214mk4
         2N3BIIYfhRXDHbzWvR2lrOfpFuPznYPNAt9dUuYc8kbcq8S9w6OfsTpkbuie86GvbRum
         uPQqVggw35uk4eEvQCWDPRqYPuL6JSRXGhpy63RQ8zsAKVxy62E2EDvUkUgHdsdE/rhs
         kcDKYuMWOLpw6xWRFECpeWPlos8cT3hAEVnL91iMzSleNbPm05njQD2fgbP5+eodWm2Y
         Q75woDjm9dXJu/HMHEgpVqgXqRlWfQ5XNelWoA4qfcME4nWyzhYSBJEq11my5bZu1lTw
         5SAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0f/+bc0kd6n9shuuZMp6H7ri9BWeXQE2RqF5LIcHtr0=;
        fh=9SHufvXqRe2Y40vCqEmthO53cDnI7bb0pLMcbFXrVqs=;
        b=G2jiZO3xU6IzK7+M12igwFxrp9gvjA/yf56jX3bHdK9+erIwTFEjiNW8yQdfqIMPzh
         hFyNbazq+0bvxTI23pjMksA6JUcO7eiYqiZ8moyF9+j+jd2r7/fznPcwmG4jT0+tbCCe
         ZeoQF1wDwqwKblgMcKkSyZue1i448/0UmkUkBv8xUBdoukRfVH5zGeEGu1kHNHdhRyk2
         GI1x3hJQdNxliZFrOLVlx/kDgdYQZck1yT51Ii2zMmZtnaegQEssM9BjYLnjEXtL1531
         8iSIpI3K1hCg2efGjrgMmdYuvv1UdTd5M+ykv/H56DUnQzrTUVPbjezk1rAe5Kltna56
         fbFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCdYfZdI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2ca15si1080012085a.648.2025.01.27.06.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:06:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCdYfZdI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPkx-0001QH-TI; Mon, 27 Jan 2025 09:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPk7-0000yu-F8
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:05:37 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPk2-0000Rf-WB
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:05:32 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e3a26de697fso6506530276.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986728; x=1738591528; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0f/+bc0kd6n9shuuZMp6H7ri9BWeXQE2RqF5LIcHtr0=;
 b=CCdYfZdIlZwI74cnpVG6PvFb3ZkWMBKERh09FvzYNLkV6/m1IuQwB65ujx4CCLiDgo
 86pPvNVdlvu1RGXl5jK2QX/dktDycRfbdw9WbIETPlH35D2/MbljoGpGMXa+2AsqOrF8
 L/2/LdV4WSgs2fJXwj/QiaKK9T8kznDF1sLVsbdkVbqJzVaLUGEcBlsE0CsE96lxEGrR
 Rx8wGHl/rsrqFDFHYWTfYQUpXgGGaZaE4F3K2um+SvnNI1LvR1qJEmYYEBcl83bGXxHd
 VnIlI1hlpVn+nT7R1Z7MzX+iDJAW/QN4hUirWSgQpLCJ6vjsSshZXspFhj2egDnl81rW
 cRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986728; x=1738591528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0f/+bc0kd6n9shuuZMp6H7ri9BWeXQE2RqF5LIcHtr0=;
 b=i1Z/lcG4fHL1W0szEJOFn1qIi0mPifk+2yQ5eAJv5q71MRvQz4MtOgL1I+parC8Nxp
 dNmeoZO+ZHPmCzFyPEThsvyM1mgeJ1FtZ5+QEHRjJX6ziIdTuR010Xbw863sh3GIguYT
 SgNk2ZK0ll9KmDiT1IhpGqwvGPKymt4E4AdY7XuM2CujBy8+9ySD9lnuLjYKeagkIwiM
 4vD74nWyWDNvgQwqXRUg5MIB9iV8MndW62kjSkg5bKopiE/R6eqVHt9Wz8DzJyvIuAHt
 CgdKpYcnuEGFdSsFeGpzH/LkQI+0KRIRqc4thLsuahOlSYN9WxM7Exklio9lYaLm3qtB
 YN1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA+ToDISAFl1DEydyVrzk1AJZydKjd5ZNs36UdhXfmL4uYo+iDL5f6bMhjnN8a+SMViX59lG7TUg==@nongnu.org
X-Gm-Message-State: AOJu0YyjlDcoEexNje8rDLrtT2f7bYQo2dN9PYnRqiKkOKhK9Trnhq0i
 PHoUFKnjcEEK8IBkyvwgDLwlUdBEz8MptHh8/28QGME8VCYteLmN3UW7EF8sizARbTnelGlP1rp
 8Kr/S5zVEorsMr5WlDJia5QIWkiF555xb4DqCbA==
X-Gm-Gg: ASbGncsxYC8wShy5KlQSkXu33Jv41y8pSFsZcnkY9p+vitqOzH8iCq9cuWrula4uyq3
 KUOVNPnxD5QCtFhClCAx6gp1JwBLv1QewFAzQzV6boo2eT32BnuD/8P2bDvJGsNs=
X-Received: by 2002:a05:6902:2e01:b0:e58:141d:b6d3 with SMTP id
 3f1490d57ef6-e58141db753mr15722459276.16.1737986728483; Mon, 27 Jan 2025
 06:05:28 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-7-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:05:17 +0000
X-Gm-Features: AWEUYZlLgtIT2NpJoGkfIArakE_T3vp17KcCkow5g2Jv9sBxZMDSq4BZh342iUo
Message-ID: <CAFEAcA_u17=F2bE42bAfHkpq_ffLPaeEZ+0i6QitX=huMVB_pA@mail.gmail.com>
Subject: Re: [PATCH 6/9] hw/arm/stellaris: Map both I2C controllers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: eQ4NBeEP+PJ9

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> There are 2 I2C controllers, map them both, removing
> the unimplemented one. Keep the OLED controller on the
> first I2C bus.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 21 +++++++++++++--------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
