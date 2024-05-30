Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp130649ejk;
        Thu, 30 May 2024 03:23:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/HWXR55lf/wPh70d4KzyAiqD5kTf93wlxUa3Pj5vo/nw7gu+MoZU49vij0ps/Xtu3cTjqQiazQZY2kcMYrNFExcyiW3ae
X-Google-Smtp-Source: AGHT+IE4dKicLyE2kIdaC2JefXVXPhyZar7+i+gwwvTJJcff5X8+1PRYuFwzKUhR0D9xvx1+dZoc
X-Received: by 2002:a05:620a:2490:b0:792:d612:d8e3 with SMTP id af79cd13be357-794e9dc0232mr227645285a.43.1717064625145;
        Thu, 30 May 2024 03:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717064625; cv=none;
        d=google.com; s=arc-20160816;
        b=ckd2sOdnmX21ZSmKx+D7TAREKnGgMGZ6qD1Ho8OMb/m8m0ZsMsypCMIgfIdS6O6meV
         51E7+CXxlKgyyfoYFsVwtOQSOZtFkX1VsoXDgibSdeOe9bQOsTQqZ+DgEcwiEKBRPn7X
         bWqJHrIBkKcF3C3zcIUIKTbZa/MV7XTvDp+EDaqdQh7g1Sb9rUtke5c7IvzXm6koc93E
         m6s6hOuoyvrsCwNBPJDK9DlV3WrYc9JArfT2wjVzn9xhSKozGqtpDn8X0T4XXruGUbHj
         f/Xe6DQJE9QjVbLku8loqaWPF/zq/4FBlreAfel5G2IcvviLShwLDi2RyUYTcr03YUPl
         cOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Bym47If7hnYqCHRJeiE8rzTe+ZpA3hGmUg8NZW8a6hM=;
        fh=D6IYmlZKV5M/KYbEoybkTYVH4UFSQnS/igbCzutgG+I=;
        b=XyaPRJyxSPVBKn4+1bWXNwcr+J1nezUU/Mm/sfZZFqQQGW1hIqkAoWfCauypc2yiGb
         /itlwTLi23nqI2+o0A0alytttP5J3Sgrq5O9VmAzLB5oQfKJCjDXBqA/bJ0iNoj9fu+r
         KBAEt/bPHUD/eP0DPc5zMH57Be76hiTKkMyAL+mwcZ+5cedYgJFMKxEkueh3iHCJUDMD
         YkG6sCD8laIN5yVC9GzljO04TmPzAIoLGL9lZ2Un60rtLVokDArq6Qi++adnXwbSDqRh
         kN82siJS7mXY8LlhvQjLHfWSR3vxhxMgI66Z7h92JX8GM+0j2GssyIoBfMobCKd8ybPA
         jQdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAhmDR2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd3d2b4si1455603485a.508.2024.05.30.03.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:23:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAhmDR2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCcwC-00065K-IM; Thu, 30 May 2024 06:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCcwA-00064G-Bd
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:23:10 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCcw8-0007v7-Nu
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:23:10 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52965199234so664477e87.2
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717064587; x=1717669387; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bym47If7hnYqCHRJeiE8rzTe+ZpA3hGmUg8NZW8a6hM=;
 b=uAhmDR2DzyOSR8a2jJZtW9hkG8WMjDBdcTyc0w4H+CDNyRoejkwFBYnathjrBCCt4U
 6rpop/8ZaKhYOmIIXWDjXU+eBeHbfu+7cf7Lk2++5hwh3L02zER2jCsqK5dr57K6tX6n
 kIe/lYrwH+Xv/aECnryRQaRxkADO25l1oczLU+eNkB1KBl6W7/hoR80XpZM4DS0opOr/
 NSzSChIPtoALYT4pd5uA6fy8Sxa6edsuby0RSEFeySPBfefuWc4I2hQrbJrXVmn8mGNX
 s2+eDyq89FOQtIkFKChN53M8KHB5WuJ3ATyTWM5GsRjaPJDWfIdkvCv7ts4wGWSm7Sv/
 mPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717064587; x=1717669387;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bym47If7hnYqCHRJeiE8rzTe+ZpA3hGmUg8NZW8a6hM=;
 b=SXR0fyWupWhWJZgeNOD0oqG4GDM+B2roqW/J6qoWT7UUxIKD+sp6Wu0+s1PpXEbL5u
 qt0QyLRHbKfSQ5tEvJEF/rYHdadRMDzrT7H3cMLj4jRTLExhgbZ8//A4xTXKbCkrGWJO
 mQeguQhYgxUdEVRxoRBSypnVt2ApCS0wulQaEa2dY4yEuYUzx/HLIp6i2q1ud/bLdZNu
 R5dcyiD2hlkXKSZXxo2W+cYS8pubDxeou2xVeMHnXbyMuFGwyb8ENZMG3cwFyM+ZHwim
 ET09zQgDvYyqN9fK52L2aT/kGRN5mkn8KNJh41BLZR5fz1+i89gKpfMRSJJE/Pm/s0iy
 dUvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIafFZgFxf0pdc4vToFZVZPM9I6G9mRYXnZqmtWHqm73VObvciqw50JfbuWPqSZlo/JXceeCSlS9li1BwKm3ibHNd6
X-Gm-Message-State: AOJu0YyzivVGCR7cxZ87ANQO1NpiS8NJKfYI3lL+Asw/JL6rUq0jfA23
 nJry61oWXQOTruEUgLCGP1hSSIPUr1gK2AjTFOXjeOHgv2BqOQ+Xd3TW21HLgeFqHaWjU3Mh/Wp
 B2gBOEqfJNrDYbc+4tCaKffqX8tkZxNbuiFEMEg==
X-Received: by 2002:ac2:5147:0:b0:51a:ca75:9ffe with SMTP id
 2adb3069b0e04-52b7d47a4f4mr1244699e87.42.1717064586763; Thu, 30 May 2024
 03:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240523165353.6547-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240523165353.6547-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 11:22:55 +0100
Message-ID: <CAFEAcA8ptk94Zm+HpW8xRzcQ7eoGA0oU5v06UuQAm=aYdOfuog@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm/sbsa-ref: move to Neoverse-N2 as default
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: vPzlf2Qk6c4B

On Thu, 23 May 2024 at 17:54, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Moving to Neoverse-N2 gives us several cpu features to use for expanding
> our platform:
>
> - branch target identification
> - pointer authentication
> - RME for confidential computing
> - RNG for EFI_PROTOCOL_RNG
> - SVE being enabled by default
>
> We do not go for "max" as default to have stable set of features enabled
> by default. It is still supported and can be selected with "--cpu"
> argument.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
