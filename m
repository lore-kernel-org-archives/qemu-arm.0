Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp295959njb;
        Tue, 4 Feb 2025 07:43:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiCyDFl84HsteUUnooIm7cglTHVZe+pj2qjxU4+l3gSGgsEMxO+jsh8NuZ0sHWXj51/pI9YUM2SLF4uw==@linaro.org
X-Google-Smtp-Source: AGHT+IF5wnhBjVty4Vj0gl801evdkx5gjCir8OOX9RxvDZbH8sY5tzr5fXQnCyMOVvfv5LzCwvCf
X-Received: by 2002:a05:620a:424f:b0:7b6:edd0:d752 with SMTP id af79cd13be357-7bffccc5edbmr3619513485a.5.1738683785809;
        Tue, 04 Feb 2025 07:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738683785; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1h2JpqxRRsOhxRDFxSbKAVknzeVas2ZRJUCbpKcK3Vs5ct30TO0Ahw4tT2dEDGTVo
         DeqKvCnyhgVqcvUXpmnCWHO3cAoJkukhjm2Lw3YKfhu3ZPlxrDV7T9OrbWjb5ssotCPC
         mSgniy4g7iBuu/8La8Ik/eS1K3jkJeoTelvcg9OO6g26htEb/03AsdOnTyF4QDD7bdMQ
         76T9mT29eIjptyV9bDXC9knfTA4AxXM+Ho9VSM1MVSEWIkDixClKZWZaOYCyBe1VoXcv
         C1wyLhjwHqmiFwLj9S8AT55PEt5vYfbtMv7gIc8/o+3FhvBovWuDBTB6cXRWy9G6rZ4W
         6eyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DnMZtMniCxINhGi11kvKfO5coLPW3VGFNFzuESVF9m0=;
        fh=v8sq2hfXVUCGq+4C8Ng3qsm3w1vZp9y/0ZccxsLtJ/8=;
        b=dfOCryieNWFtXp2kG9G6SvbKW0T9cloZFVGcgFWtcGeQLTjkSRQZHxBE0MDYemahRA
         6LWzmgBx/hRdxWSfnL4Yzg2ts/ijs6S07EFfC0fl8557ecUZk+AHmEA5bCyNvY6yTV1p
         JSoeu7WSEDkc+1klxHz9RMOX4q97HSsTy9UQjBriaZzXg9XaGP3jd2oHz0Wa55vQOcXw
         LXzbSYyLsnYTL4/relj77i4nxhqx68oWxw96qJlcfOJ2k8avV83E7OHBb//XOtyf7yak
         1TtWqg/vodZbScYN17qIwl4nSvaAV4QY27VJj+V+OPc1F/1xCCrYk9iZtmImZ0KEELvy
         3cNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2nCrmyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e42ba0f87dsi7736876d6.36.2025.02.04.07.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 07:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2nCrmyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfL4j-0000pP-Us; Tue, 04 Feb 2025 10:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfL4g-0000ox-Fb
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 10:42:54 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfL4b-0007Tx-Ob
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 10:42:54 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e3983426f80so5045373276.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 07:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738683763; x=1739288563; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DnMZtMniCxINhGi11kvKfO5coLPW3VGFNFzuESVF9m0=;
 b=u2nCrmygS3D8NkbGoz0H+/HagDMpYbJ90hyykyfht/m2CmEH6DVk6CtnDDYMh6hucV
 1xQ7Gg0bLCzAG16ccf6wRtqML/LgmZz7X3x3g+FPRTDyNr0yDEGjocK+Qm8X/Vl2r9I0
 fo1fX8jVq21UB/dtQHB6Xr9ILvBBRyR1gFOEh4kTErSgbD+F8tKpsnA/zPdjFrXUr/h6
 2w2a3NHMYPgDqKpVMsdsPUQIEJPD/AQ91WMyhapIdURpIL4DDkxv8uC9vqrz/MIYYgZo
 Muy5cuKDEmMYX8dNgA26ABdp22MZ6mjMibTYiVXPuAvs6v2xs5mc3FlHXRgT3BT2DnnH
 pJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738683763; x=1739288563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DnMZtMniCxINhGi11kvKfO5coLPW3VGFNFzuESVF9m0=;
 b=fCJZQJZJuxLMal6SveV86AQ49DYM3aVCuBFLbNYmyehUuANl7+FxA+cexHG4Am4ugE
 n0D/HAdO0NNynUWXmjVswXN5wTrVPg6cA3MahEFMyiP5DoZY/MefmY86ZFm5/GEKKwXn
 lRuvbxDk59BXEbqoBJSVFKDG5Qa8Ihoc1a/22XfLghFGAgfUeOud0DiZ4wsKxGqKBbi2
 o5vrHcdBFLAh3URXtaVFtEufEigI2IVTygu/N84XiKx6fn+bw+f4do6PMjfwZPUx9q8j
 kpM52dHnLg4VrjuP6/Cl1a7x4yszsUpeQlHlPThQOQ4J+UBlnGIU8qMFshga2q6LVvXU
 fe1Q==
X-Gm-Message-State: AOJu0YwiA7wEb2+5NX4LKAUDfr3Gp2EKxUkHkaHHc+cK4sqTAWfat3de
 wVgs5BW49iVwkWuQwhSB91A5kpM3RJ6quYYrt6we4p69uq1uY3Ydn1idlQn1EaTgxuzcuXiE6U7
 mDGx9YyRTV2Ffx+6qRGAGSzDhuTK/hm/U+5qX7w==
X-Gm-Gg: ASbGnctz2li3cJNeyX2Swn2/T4ZcO4gYEJhy1rOrUr/ZRysjp9T2eLmLFPOlnoa8ppI
 7cW2mqiFxeiK5Bu0JeJqteekgHjmNBUclSVlKYu1+kvLdAFGWD4XIVWQJE8qQNji7odvEQnM+Ng
 ==
X-Received: by 2002:a05:6902:220f:b0:e58:3565:8ad0 with SMTP id
 3f1490d57ef6-e58a4bc462cmr20195546276.46.1738683763604; Tue, 04 Feb 2025
 07:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-5-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:42:32 +0000
X-Gm-Features: AWEUYZnJtlKhxZoNMXLeiS0vTX6mNhAO4q7nYO3RAE74kMk4Ycl8zp4rVWwFPLo
Message-ID: <CAFEAcA92L87bnPaTAXnzEy_pGHoFRkVve6-knTsLYb8PARAz6Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] hw/ssi: Make flash size a property in NPCM7XX FIU
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cuPg9JQULa34

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> This allows different FIUs to have different flash sizes, useful
> in NPCM8XX which has multiple different sized FIU modules.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx.c             |  6 ++++++
>  hw/ssi/npcm7xx_fiu.c         | 11 +++++++----
>  include/hw/ssi/npcm7xx_fiu.h |  1 +
>  3 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
