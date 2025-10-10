Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2C3CCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 11:40:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7BU2-00046G-S5; Fri, 10 Oct 2025 07:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7BU0-00045e-NI
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 07:40:25 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7BTu-00016T-SH
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 07:40:24 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-71d601859f5so19572687b3.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 04:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760096412; x=1760701212; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nE4OJaR6JHD+vZ3ePXJLF5rf77/HwoHCC0Os95lHZkM=;
 b=YJGtrsooEky2J5brMejbua3YD57yDJncM7aYmb6922wCk9UG9da/x6CSfTd/AtuCgV
 dMGQZ+fpYdkMZR919IbhX2l7gxA9KNJ1BvTXMRl/AvgNnFZY5+IP9p/4B3K4/yI4jqNh
 ZLhQdADDxrXq7dbbQJEnS5ntRicLKqA/Mn0/6kwUDlqAQVILAjuSef1fy3FgHOqDOvsO
 A/KhLdd1yWKEoEL2uk2/T0ZLsgUGyL17AHw0YKPXIWHEd46twGFALz7n+iT+1AelBj6i
 Vd6MnZhlUDKXqKHx0kSvLkHBBp3Llf6deM0ZiXRFtPagUZnMtGmWZCvIwlr3BuER+bNV
 r/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760096412; x=1760701212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nE4OJaR6JHD+vZ3ePXJLF5rf77/HwoHCC0Os95lHZkM=;
 b=YFnHD4nobQtsh7wd3BKDCmWct7yZfV6XrVBCWu+gXMKTBBgUl+nsphMAWD/Kb6rev/
 p19VaaRWazXo/9cFuPw3ifatBL/nJDz3e3jm4xBfCDRr+ho9XF4SeuaoKSPK+ciOJ0Un
 HHbyurZe8PDbd+tdSOal6eu1fiizbXfpX3SaqxvdeJGJEgvx3k3k9H55Rdv4XC7PkLVy
 XClUYhl8ZtakLporQ4t/GvE6fgVQNqcN9WAz/tT4+bwx7PEBfOj7NEFLBp49Tl+O2225
 mlvwO4otGrW6slStvp3IH6rar4zQ2BwXFGf2tOEBi5lAm5Syrye/mkor5qjVJmTr2jKC
 gB1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWn3+6XUeHDv8DXkV4SZBNxiULxjl104SPxIhsvVJyKLFSRoEz3SOqLWXzLWv0L6PLXbcgEvgXmA==@nongnu.org
X-Gm-Message-State: AOJu0Yxvczx48iV9KATD+faYokj71QxGqHej5Er1yI2aar4NkK8cDCG0
 3xS/yea/X9N7e8ze7Nijs5BaGx0jKBFHSPe+7cCqyvZN95tT6SitxDbFLP9VPk0vbScJaI+T7c2
 oYDKc/+kagknFk6qfKbjO0+H1zjTvp2ehoZyBJHbhUA==
X-Gm-Gg: ASbGncsmRi6Yb4n5ymteJfHC0d3u1Zd+SAjuJtIWKrnoF0P+M7gHEn5/0D2Bcae5Ssp
 YoES/SVU5SCKut1gF5KCbIK5DSNX4GxeLugnJeA2hVAnBmZWq9YmzLvRpiKn8G524Z6+RIBb1QL
 OXi5FLy7cbdpDDcrduyU0NnzA9V48sICRQ+Jm+x0/k5Tw/hVPIylacwlnKAta7iU561jUUDuZSu
 mK04lcxOsYrvwL1FzELmPc8Ss0bXMs=
X-Google-Smtp-Source: AGHT+IEyGawBswG4PVicaHyv7NSxtYFnoB4EhY58ZSB27hPh/B6hkENP7W7CgYLZegIMqBeRdX+a4IRYVX787yAkI9E=
X-Received: by 2002:a05:690e:250e:10b0:63c:e8ef:56a2 with SMTP id
 956f58d0204a3-63ce8ef5abbmr3446370d50.10.1760096412067; Fri, 10 Oct 2025
 04:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251006001018.219756-1-gustavo.romero@linaro.org>
 <CAFEAcA-S-U0nsDcEV9cYyZiyShRLN_yuKkUD9XJ_GrOiGh3=-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-S-U0nsDcEV9cYyZiyShRLN_yuKkUD9XJ_GrOiGh3=-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2025 12:40:00 +0100
X-Gm-Features: AS18NWB82rt9BrlfNuckiB1piWWfUfZ6yokgNwMsV2lK1yzq6_X6yVS_oHGcd6w
Message-ID: <CAFEAcA_1GghiQQTEjLbhUvEHp7QyktaYePK==RKSgW5QJxa8cw@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] target/arm: Add FEAT_MEC to max cpu
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 7 Oct 2025 at 15:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 6 Oct 2025 at 01:10, Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >
> > This series adds support for all FEAT_MEC registers and cache
> > instructions to the Arm64 max CPU.
> >
> > It includes the FEAT_MEC registers and cache maintenance instructions,
> > but does not modify the translation regimes to support the MECIDs, so no
> > encryption is supported yet. However, software stacks that rely on
> > FEAT_MEC should work properly at this point.
>
> I only had minor tweaks to suggests to comments in patch 1,
> so I can take this via target-arm.next and make those changes
> there to save you having to do another respin. (I've just
> sent out a pullreq, so this will be for the next one, some
> time next week.)



Applied to target-arm.next, thanks.

-- PMM

