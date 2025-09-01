Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DAFCA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 16:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut7Js-00037K-Oz; Mon, 01 Sep 2025 12:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7Jo-00036S-F4
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 12:23:44 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ut7Jm-0006sc-53
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 12:23:43 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-71d6051aeafso38289817b3.2
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756743819; x=1757348619; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RNyMi1J9ComDo9kbsxnoSfvoNlKLpUo5dVx/FtaQbbk=;
 b=d25RdqKf4rHmW9WM2E+mflatTZICLXDE1cMfyLJiaAlSKhtALwvIF29cb/nwDqzvCO
 aFrU/AvMlgo0PdoxdlJIhOSqkgn+gBgolqKv9P610MCnU7WJJ+cMqKNe4g9gyl0c900u
 XJKGq7EZwthAAtaq9bGbkkQxsi+z2AqKMkYg/UHjBA2/Bs2uDP7qY2ctMJ0unGQ2AqG5
 yBkGooba0MyEaWsY4CVaUgRGGKOOrI/ml0427CLJAPyb8KqwiS13cuSCsBnroCheCIxg
 6Nv/SJbM7Dyf4Xts0AdOvFixKYgTV38fuAwB/YV9e1pv9NSJhTQTe9T3fPX3bxlYNgDY
 5htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756743819; x=1757348619;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RNyMi1J9ComDo9kbsxnoSfvoNlKLpUo5dVx/FtaQbbk=;
 b=ZJkCKtGaoYcuaZqeCcYGUgQ4OHhVEQCzSZ8shtlN9chRqrhY0w+19LzunL3du/p52+
 K09RmOndfRjCfdjppQHzuDG+jDZdchO4nFJYpzS2UfXH4hAKy4wStE04ruTBLE8UBpmE
 i+RdNw9MSUqbI7Spaf1c1TNz53N5LVYCB+5f8YgNi5XkRmrghmXEevlq+Kf9AkloueFS
 4mN89oPaMNPsJJUNuR3JohERCokZLbQbaDxqLTy2qIST3Sm3EKXOA31eJP2OrXiO7XjE
 mSWAymuYFrA/ybYCFg1j2CBNZdmENw+o+KLLstjE2VhDok9v8S6z30ZBg7+pYYXVb2Vs
 GNdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH9Hhup9z8pF5npoYWppOAu1j5Oox8pqSIME/+Y4/yY31XXY7Wzzo8IyulI+jwXW1+t2n7TVGgfQ==@nongnu.org
X-Gm-Message-State: AOJu0YycqTAOrLxMnt0lWSfJ/rFYf5dQUR7i0da9JokxEWcAsWQy9Nnk
 sdKfEHqOhrbnwcE2sh+Iwdk2L6Nnq03ONV0qhPPi1bg7+SQ4MWHOxkDmIQhQ6w+816cDHWxQQju
 sikjX53OOkeMJ9VP6y7FddcVUC9G3Z4wz18NWXnp+mQ==
X-Gm-Gg: ASbGncv7SueEmko7flhqV9AscoF60CE3csEIzL0k60CPKe1L4xB7OtApGlipuTvjCMe
 tAFRPoRQz1H45ph+EwX/nHFFXECitegJThLNGT3gkSGQ0Tj8dC6hqtua2tsl92SKPUOW7lOleCg
 rRC9Nik3VDKzXzTEziSs8xvlbGZ/qgPwJQUU67ljVvYBaHEQDXnMtKg5Hc+bzS5N1Gmn3egMIOc
 iqjvrXJ8SdN0iIoRow=
X-Google-Smtp-Source: AGHT+IFvLECNQksNxghAcwHL1zamWpO+A2RZPzzzPm5JacMBFgDzRH7Bco3UbD3VpHd8AXCzDJMc7le5dC0k05M93Pg=
X-Received: by 2002:a05:690c:a04f:b0:722:875f:2cb0 with SMTP id
 00721157ae682-722875f2e81mr54814237b3.49.1756743818941; Mon, 01 Sep 2025
 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
 <3ca7be1f-267e-45c9-9894-67e920ad5ee9@linaro.org>
In-Reply-To: <3ca7be1f-267e-45c9-9894-67e920ad5ee9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Sep 2025 17:23:27 +0100
X-Gm-Features: Ac12FXwVzDsCE9Vu0qXTpOqpX7ZsS-dfR9s2jxtZSCwM_JomYkB68eSz7bOBIh4
Message-ID: <CAFEAcA991uW624qVvQe9Q+6JY7Qu7w+ksWJH6AExYghD8UtSFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] single-binary: compile hw/intc/arm* files once
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 22 Aug 2025 at 15:31, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 2025-08-01 10:40, Pierrick Bouvier wrote:
> > We simply compile them as target common code, without moving them to hw/arm.
> >
> > Pierrick Bouvier (2):
> >    hw/meson: enter target hw first
> >    hw/intc: compile some arm related source once
> >
> >   hw/intc/meson.build |  6 +++---
> >   hw/meson.build      | 45 +++++++++++++++++++++++----------------------
> >   2 files changed, 26 insertions(+), 25 deletions(-)
> >
>
>
> Ping on this series.
> I'll be out next week, but it should be ready to be pulled once the
> trunk reopens.

Philippe -- I'm assuming you'll pick this up as part of
the single-binary work. Let me know if you'd rather it
goes via target-arm.

-- PMM

