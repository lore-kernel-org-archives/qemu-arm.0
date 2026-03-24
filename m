Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA15FEC0F1
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 18:36:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w56bZ-0007HT-FK; Tue, 24 Mar 2026 14:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w56bQ-0007Fa-8y
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 14:35:48 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w56bO-00032N-Og
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 14:35:44 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-79a2ee65171so43376127b3.2
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 11:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774377341; cv=none;
 d=google.com; s=arc-20240605;
 b=T/S9rDCmDRaHS/Fj8kjSedYUoL4RHe+9V6xn4Xn00+bRUGvouinWYrs/SPQzeDlZuA
 SxwKl36dLNYhxd3wxy7r1k5RGmqFZcSdfghpV6hK9+BJEkZxmJ5W/INT2iwQOFHgmFmS
 GQcZ684EO6fbgaZP+eXwKgOhNU1CXRXhu6UJnzprb45FyNkQg4Jrhko0WFo18eZhvno5
 vt0KfN7BbAgdVZJfkSeZ8OkiUNdLR0ZqZs/6V0Pc8xthPKU6TFson6DcDM4ZoT6tzdw2
 EzE57iT7HZDeWA2n1KqOiT2AijOx+q0jiFGszOabMHPaEeYIJkxbigGF9dENCtSgc4vp
 Li2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kiux1RVEUWOxgwutrdGWLijSZiyQKam7x1ALRKd1e3Y=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=UvU6nuZH0SNBqeMi08sfxyl++SpsdjN58gPcSU4ejlHUaBB6JoYLePlQp2jrQc7nvk
 bd+kzskPZvbd2cU9cWpXas9f1NQ8gyYq49h+apEfYRgQ0eUEF78Ymf4SAi/cobLwIWKO
 Ggorcn+WQsIEUxighKiSLcP5XW7IhZbzz8x5PK2WZtIdOvna34rEKWJBrRPnj/OA6kV1
 tpOyNvLQdbYbQCdsdICMYaZLxEgBC8f3XeCgAxS8JzqN/n7xMD+XC3HnQPv/6sWKgECl
 dLd0vETNcoZ/Xkx0xQgw1+K5L49+kblbDhxUMkN1TLA08L2gdBXYP/wJVRI5haqwBNnr
 XRuQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774377341; x=1774982141; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiux1RVEUWOxgwutrdGWLijSZiyQKam7x1ALRKd1e3Y=;
 b=MeB8ZAQVJmfkWaqAm6g0X1C+yvlMKFUGTyUzFIoAOw6aPBtbiG4eAjCn/DpKQdglDF
 EpEzrI99hROfQzFbjL2ZPAHvf07BBYTI+RarzKEwOgHIXMiqqLFiCo1L46we9o9xrj+Q
 HEyQYjvlnBdhAP2V1SWsCHZKqVZgs81FNEVIO9n+1LnoRL76axaw/k4oNQ7dpLzfTjst
 1nxhMtDu/7b3zkAXSstsHuNkrjdDiHwF6wqDK+FowadVgcvqHUaVuSrUi9FIyYkA0M06
 v32l8xAmHe7k62LMg6X6ytgAGX641rdHbc4bczdEr8bOxXEsarPr/cM7N0JjMs7bX5ui
 dr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774377341; x=1774982141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kiux1RVEUWOxgwutrdGWLijSZiyQKam7x1ALRKd1e3Y=;
 b=LM9HWW98fnuH2b66jgkvwJqhfUDlIZhOmde3LHWVNaAQ85a7FlR0t9eXf5ZoevY1s/
 05eGpJRAQ0WZTdFQQ569DoZ4/TQVuyP+jcofF5Q2ugcZQ/PwmKzD98EkWjB+IkLIUAGR
 l8EV9mE3brPZgJXp1BKWOJly77ZJwbyIytGx2CcNyrm3D4jrRRM1k1z16q50W+tuWhPk
 jxxonAUptODQly7gyV08yhqwE9dokMO/DUY64MdMrL5FZYeiuTpvdFAwvToCy+PmDEB5
 T7xEVVqm0HVJ5ZPucYqwo+gB4GvoYRFdg+sZFx58DCuvNSqJkKfOxvQ0Zxq/Hp42RTSR
 GXCg==
X-Gm-Message-State: AOJu0YzS/tGvnsE94+Bdtv2VvM6DDYgrfW6k2qCiKHHrAwe7P+URchU3
 ZBGpnla6NkwJAiH+k9z05/KD9W9rjpuhds8pc6p3yuW2UBCRXBkjL0sdeSs7D6wlOMF4DreZ0Sj
 I0By1l5y4LFdozXcakaxMA++FyNkHdt1nHQj672nkDw==
X-Gm-Gg: ATEYQzzcs3PVazydt0dVtNUwzDfoq5jFi74lLLu0PVjmFt7iLWhZ+G5wdqS/+tBV0VE
 qjUQmjv7ZdM6sXM3seGQsPB5uev2DMMMU1A5Wn4TA1bhGM37jiw9iRCJdDNO8y0jbrCMYxqZQRP
 0l2EANdcft0sMfergZiSEctj/n6b+dG9k+j/s7to7lYF5v0O/ay1OWlrDIlN7tN0wA97mw640XP
 y7MJTGDiQhR0qA7OWNtAqjkJH5/p/1AfJQhlK9BuASKHCNJpN3X81Mt3vfAFD222xzpNLKDqbzL
 PtbEB8vXz/8wCFBR/RQnqsWuQ5F495pqx5ZexK842pgFIwGBtKM0FiP7uSuairvv320=
X-Received: by 2002:a05:690c:46c8:b0:79a:c28b:b077 with SMTP id
 00721157ae682-79acf65e59fmr8163937b3.37.1774377341102; Tue, 24 Mar 2026
 11:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260324124131.1053711-1-clg@redhat.com>
In-Reply-To: <20260324124131.1053711-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2026 18:35:28 +0000
X-Gm-Features: AaiRm52kyXe-2Y6mgTI-LWP4Ac1Yi398JJQ-TwYhhmh-w_n_IkTSKXY_V29uuKQ
Message-ID: <CAFEAcA-1zYJKqJCaG6GVnYfRj2ukhFjAPE5SZqPhkNTaE23PNg@mail.gmail.com>
Subject: Re: [PULL 0/5] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 24 Mar 2026 at 12:41, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit 750ed363ebfb108082b40bc532b20564bf00f9=
13:
>
>   Merge tag 'hw-misc-20260323' of https://github.com/philmd/qemu into sta=
ging (2026-03-23 16:58:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20260324
>
> for you to fetch changes up to 5fca367b89de2d11631cb27a90a8c5431d004f58:
>
>   hw/i2c/aspeed_i2c: Remove assert (2026-03-24 11:19:40 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Rework Aspeed SMC mem ops to improve error handling
> * Fix race in Aspeed I2C model
> * Disable kernel crypto self-tests in AST2700 boot tests
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

