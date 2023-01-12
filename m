Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4935607ejc;
        Thu, 12 Jan 2023 09:05:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsBjk6g/0j4oXb18wsUXcO4STYdIIxSytyHFB0tmP0UT1ahOgAoK192ikiHmxcUj6XG0HB1
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id fm13-20020a05600c0c0d00b003d97667c0e4mr47575742wmb.31.1673543121094;
        Thu, 12 Jan 2023 09:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673543121; cv=none;
        d=google.com; s=arc-20160816;
        b=KDycGmytmq7mQANB/PzCv9hGw6iGoPNMCWXHfTQi7qknp25vb0Vp3zDZvYlcSzj00v
         SORAGT5W0YStmWXSKN/A3TXRBMAXPT16glw/xA12PrxdpnLgING5XOrXPytSaZzMxqjP
         dLxbW02LLN2twPQf3Eq54rtr2Teq16MGQagHOecOxfUnhl9APMZOqVRRsFbx2HlJDe7x
         ++A4scR9xDmPwDnyJ1y/0msJ64+h1ITNtAODqA4sGPCHjXiyb54lWMZIkpT6KW1I8uCf
         uKmhMHOUY57VLxywHoi8MBYgozGnaoUCmNkpwhnA8xyxzCXfxEcURtUjPIfdbOJyoHBY
         xs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Gxc2EjV6NLWugYG9IS6pNMRiP9xSHlvQ3XCohk/TIYY=;
        b=ITZwTGCRcGAC16IetcVa6H9xbU26HCtUWgdLq0OeKqD8OX81mBDE993xRkfeOKVktq
         /+uf2X77hj9GpauKAbbcVdEJ4Dq2WGU+yt6MtcfUnbyXQ+txKXjq/AtAY0nZQT5HvVFc
         qin7KWcr2cOLx5kQTmDIWWk3R1bb10ZVZbbuogTPf0/YxXnDut2sRRIYUs4pWwX/6uRZ
         jU5qU/NbWA4Bzz4O7yK1cFFlBXdSkNDFNdc4nU3gdk2RCtbXOarB8d1GB7WSPuV+ai00
         7Ydq8xFtlSdwVKsyD0gfjRtkQ2fSw+HBnW0K5aDzxqHoNEgH4Zk/JF9KS3iY8uiB9par
         J8Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XUrQX3/j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fj7-20020a05600c0c8700b003cf8b283cb2si14233468wmb.147.2023.01.12.09.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 09:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XUrQX3/j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pG108-0006yr-6K; Thu, 12 Jan 2023 12:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG106-0006yF-8l
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 12:04:26 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pG104-0004PJ-Aa
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 12:04:25 -0500
Received: by mail-pg1-x533.google.com with SMTP id 78so13199766pgb.8
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gxc2EjV6NLWugYG9IS6pNMRiP9xSHlvQ3XCohk/TIYY=;
 b=XUrQX3/j2tTEj++/074OtKB2+WJM2Kwfy9E00rTJ0H003Aiv95Ao4+7aFaY+zw2p7V
 wg/fH2OF+B3vi1w9OI6hC0Dk6LGj1MQV1xQ2rzSpKHHBaUWI0Go/XvLbaJgUrntH7CG/
 4NOHvUUfy1N2e5YHAMu8psy+XZ/DPL8p9SUcQmvaKFIjSH7FOj4lzHLLvsjwX0bWOEwA
 wiCHcTheZ2auFaC8mottVJt+gHHhO0jBxW5uimSS3Lo5SnQ4gowPl+MmFwleLK8H8CBR
 bL3N9RwHwPmoyaqL5csOeGG1ikpgt6oTpg/Fk7YNJ6c7fpzU3ovIhoW3ArDG3SrKyYJ8
 5lqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gxc2EjV6NLWugYG9IS6pNMRiP9xSHlvQ3XCohk/TIYY=;
 b=pxuS/cKUZ7XLoXoKIhriM5+Fx9GfXII+MIQpXkDLoQaJfgeGZdal+PAK2h6ngCeAa5
 J3iEDd+LMey48u1j0/Xl11mMM0rd0MHj8W8Gkmi6tsnaUyi9fAHoK4CpZAxinlNI8KAU
 brg4OakDS2ZY8e9JToQst8thEiqHsTYg2kVdDUlEbKvqUaZPE+cyReYp0JFdCSNu+fl3
 Mqn3Sog5uT9+LSA0VhbeZBL59TQtfFDS2s9rccW40uga6v4q0t3KcpMDhzYRj2picSb9
 2e7YLWwI1E8vSLALRmbTziKwDSGz1pB3b0OQxErm3LW2I71tiqz2R3GHPXYxCbW/emfm
 CWEg==
X-Gm-Message-State: AFqh2kqz7CcUyZlQhquNjeKvKjt0HgFH7OCIhtnEwPLozbN1I+bnXUbY
 UeKLXKOP1RevtJH+e2Zzmsp049D/pUCQ8J2NYFXXcQ==
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1215404pgd.192.1673543062411; Thu, 12
 Jan 2023 09:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20230109115316.2235-1-philmd@linaro.org>
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 17:04:10 +0000
Message-ID: <CAFEAcA_8g5CVBbRzNOpiiBw-o951tfDC_=0TcpCnxhk86=3EPg@mail.gmail.com>
Subject: Re: [PATCH 00/13] hw/arm: Cleanups before pflash refactor
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
X-TUID: wacC+kZALfy4

On Mon, 9 Jan 2023 at 11:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Various trivial cleanups:
> - Remove unnecessary sysmem argument from pxa2xx_init()
> - Use IEC binary prefix definitions
> - Remove unreachable code calling pflash_cfi01_register()
>   (another use in PPC sam460ex will be removed separately).
>



Applied to target-arm.next, thanks.

-- PMM
