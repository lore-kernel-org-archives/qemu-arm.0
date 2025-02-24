Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1849152njc;
        Mon, 24 Feb 2025 05:04:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrR7nN+0ChKOZHSelbMBmIQMjU080GCapRyicjrIS4Wnwf6rD2NEvajvUI7DltOIAyG6lwVvuylAsYjw==@linaro.org
X-Google-Smtp-Source: AGHT+IFmDqLhW+cZaNpL8Ooip2eTfvcfKBL6jdTHgjUh9EYafKROeeoz9zbKWRbUmEmwBF39xy0Y
X-Received: by 2002:a05:6102:50ab:b0:4bb:d394:46d7 with SMTP id ada2fe7eead31-4bfc0021756mr5505362137.6.1740402251798;
        Mon, 24 Feb 2025 05:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740402251; cv=none;
        d=google.com; s=arc-20240605;
        b=X8JWyPnAuLzdB/2ZrAX3rWzGz6tospWoZ/sDAojXxJT4BGr0tNTxruazeyl7POAVvL
         xfQo2og/4i+5YsgmrBPQyYY9bxEiO0GGnHMTkIFZlgInY4bPsZ54pSId7tt6eFi47yuC
         fRXY6gbdPXAmdQgLXX/WBnP+p3boBXsrNCv2wuv+uym4g0veOPmdXaaEbL0ktMPbjDlW
         WAqY/j/8m1Xa7vPvIjSBIr2c/jCbhYyHXiPepTqqKfdEaxKUknwuOrCHaUEgnjqRcW2Y
         Vy2VH14C8ipIKq70gCjAAoTcHrMIYOUVvQjz7YseRgehvlcBRtTZ6tk+9zk1tJ0z8Qv/
         hoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/+ZdrpsFK/HAtm3Dc2KtifAwV0SVPDIBmAlaYqs4aDQ=;
        fh=/H4Y8qldXkOYASaVXmoNI+JzBYXEnTgglOALEsqKfn4=;
        b=ZwLoiT0uulNbL1a6G+CskTwraYnDwRFmVBYQSnYUKWt6pu4w8I7a5CBPCsAxZg5SFb
         iQ0zGCf57OoWY3iay+JC9yHc9rMsdc5B0Vm5W6ywXBjqFQMRgOhTDcnOzVH74EN3PU1f
         TVtQ0q9Gta9t5Tdo4JZmAajZudtJrtKiu/ctqx9oD4vDhuJH9B/qws2iTEFqzsN/DFWA
         q733HWfVZWhKR/cqUy0A8HcpPCFN4c7skKg+scBWYY/rebOXpPAgOO7LExWZpOnkI8Yt
         ffM6p7gtm68jgtSe7bo9Co4/islHpZpV6J5Ku2CiQ4KGvyjBsv3y2Su9Wxbg0+JcI3Wl
         Kf7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTMbO+Kt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bd352d596bsi4290988137.217.2025.02.24.05.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 05:04:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTMbO+Kt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmY7Y-0005ze-4s; Mon, 24 Feb 2025 08:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmY7W-0005z5-Jn
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 08:03:38 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmY7R-0002ma-JO
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 08:03:38 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6f74b78df93so40290867b3.0
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2025 05:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740402212; x=1741007012; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/+ZdrpsFK/HAtm3Dc2KtifAwV0SVPDIBmAlaYqs4aDQ=;
 b=tTMbO+KtS05RYMn/Bc6wZPEFkvk7Gle+NvlfHmpZT0yKPcZcDYivMINu226hMpKw2K
 mletR1D5XgMN5RxWkOjVy57zKXxyqgQoKKsrKz/0KOUzFKmqIftz4ITrdnpZxbWpx4vH
 F+H3WkJXjNHzllItz7Kf6r7O/KKiULFOJDK7zlA5unhqNYDQ+qTiCqtjnRc89LRr0Oeu
 d2K2cA/b3YuBARq32Z8lcC7+dJEg5hOxRe+uSYS30eeMNLvsCB66okgmmCILYxaVH7H8
 AN11y4ix4vF5R5cQPjzsXylZ0mjKfoVVbORH2VCek0IHdb3eHoHYwtn5grLSq9+N+WQu
 G++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740402212; x=1741007012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+ZdrpsFK/HAtm3Dc2KtifAwV0SVPDIBmAlaYqs4aDQ=;
 b=Vsd08skQlAiGT8qfqmC5ZF2lLW7D9mxR+Y0y7hD8kdr0WBshcAgdEvfUfP6cXdL+qO
 +2mxk6jbUd2VKieogwpAwJOACGizTdItMgl31+qQlVFC3GcJ3YYEe//ZiPyQ42bIJAf+
 +dyIQURQIwMzriHBYFRxCuX2i1gEF3UCpYiseIxl2Ho9OVc6CqWsSf9yQw6WRF0Yuc7T
 886bA7W1vC8Pkwk7jyYHco6xdH+JnAMpKina8PnfJGd1EodXi85Xqr0JIoxIRSNZRRRH
 Gm1LI8sfcT7LKrdB6M2GSJ40m4RN/Zu3BRUB/8kMe69+I6zhCfltHzORx6462lNEax7i
 UvQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXayoh8nN/3nI5lAnPWXJO48rAGKBU7DKk5kqJ4vA65Csb4hh3LsU0zdwPZ+j95RZ6MF68/euzp2A==@nongnu.org
X-Gm-Message-State: AOJu0YzBXGPriv6isVexyOlQr+lc7kWWvfI2ouJfUC43QN7DR2TPxdCh
 bnbzfdgNmwwF2DTpC6AiQ1rZy1Oa8JFkSGYi2CIhsc7M/JwS9ngSaJuS2iWJ2t8Te4hEmeybFyU
 fKEtnXOdi8Iabwspq9nUU1McY/SO3ZVbuMO54Cw==
X-Gm-Gg: ASbGncv3kQIBsHi1cDdHb+WJMMJtxtxc0X84cUIKivBi78o/mZTW3+o/bJuLk3dtl3s
 whWNdiYtdQgt6aaFW1GhpmvedSprHaIp4r1NugTS0RQ+oOaTkRPDYXXfu+DDXUP7brlphYMyg74
 hdb4cGp++g
X-Received: by 2002:a05:690c:6412:b0:6f9:b12b:8943 with SMTP id
 00721157ae682-6fbcc261b67mr122343087b3.19.1740402211085; Mon, 24 Feb 2025
 05:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20250220213832.80289-1-nicolinc@nvidia.com>
In-Reply-To: <20250220213832.80289-1-nicolinc@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2025 13:03:19 +0000
X-Gm-Features: AWEUYZm8lPJ2jrzALpypVuBJOIzZpsxNgfbF3HRsP2ZDKDW9lTsWKSJVT2Gl8zA
Message-ID: <CAFEAcA_qXpVkwps6ocR7CceYBvxWqv40QDwhRAfFECPQGwFbQw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Fill u.f_cd_fetch.addr for
 SMMU_EVT_F_CD_FETCH
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
X-TUID: lDtJFLt3dbHX

On Thu, 20 Feb 2025 at 21:39, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> This is more like a cosmetics fix since the f_cd_fetch and f_ste_fetch are
> basically the same field since they are in the exact same union with exact
> same type.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>



Applied to target-arm.next, thanks.

-- PMM
