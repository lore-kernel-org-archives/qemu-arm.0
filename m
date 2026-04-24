Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67180FB44CA
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 08:11:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGBd8-0004Xw-Tq; Fri, 24 Apr 2026 04:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGBci-0004AE-7X
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 04:10:59 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGBcg-0003Bk-Nn
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 04:10:51 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6501418152cso7177177d50.0
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 01:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018248; cv=none;
 d=google.com; s=arc-20240605;
 b=S2ZyvSEysZs4KgkDV9gkgnz62U5LRTKbWSLwc3SYU9KKQq9qEtEh3lQdxf1pIxujrB
 fP20ZHIdYuWQYIVG3h2pGQ3znR5HCSibSq2jCkwhThBnanl2IpyHFO8mFleg9w77XOiN
 iGGRlfOoBKb6WJL8nP4nzpopxFUWFvtOy4I085BnvORu3DTWGgSd1dMIZTXsn+cPcWyk
 8pfVmXNKOJZ1CPuNgVt4a3bo6OTcEYp3QYOqSiQMpOB/9g2IUyXbiDn2WdG2+G+bhmkX
 +mXoN6CxrSfDZW3pIPqDa+LDqgBaKM/KFZusFyc9NMyu0fPSjVLzea6cB3vbSzXQvzlH
 wXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gxJWurcS+1K1oWc0W4+lon7MvEpckKjZgKf0N3mbbME=;
 fh=sFS67Mu382Gvw9pVtZiMXD+q+OlDBpBoFlyYmYop4yw=;
 b=VoNeJIQ6v/HGAK879tUbLYKGf7IWShDBDKf/+SDr6E6EQiC3HZCVaF7t89i8rJ1SA8
 gpou1PRZQ4zgTgcVh0S+D28QKtbFTvD5nBjI1S6OCp4d3AORp9yOR3LfYc9xtN9191vA
 VHUPnlhJ8Xs2+mdQ/1HeXHZu3nGKN3V+DinC/EdahDitVLdN2eiTPuVoabOveHc2yqFB
 WP2m1eKVXlvHJ+L93dMsBmMd8BqlLzMGpBv0Bsk4pzNMxEehIGgEdsAENZSCoMULmRP7
 yd5uglZy0FohSZZdyYER/Sqm1KPLNLSpusHx6IHaFVErf/LwcykbJZdn7XQ85y4AvpFM
 LVPg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777018248; x=1777623048; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gxJWurcS+1K1oWc0W4+lon7MvEpckKjZgKf0N3mbbME=;
 b=Aqq5zx+0pZsQnb0HCZCe30N0Mcx6fOyhcDdyl9cRY0XC/Dtg8onfbgyMU+1Re043fO
 XXpn20VBw+fcDI/aSblaBvS5m+DdDwflTFU2RrNU6OZMeJsKbepVtGeSHKuhhtpdqr+6
 +WXLNVGx9Hh1vwLK0ewwDBb5oHM3GZeCh8ThsqxLn8m2UODx9ZO6KEsrjhZ8QtJdAnti
 KMvNvfaSIt+Xpq5Wj37js5oJ7HNWlQ5EPcKrgHd/UlJ/tjMgmnKnKmkxEVpSkWGWA9YF
 4YwMRTpi3mjgSViB0DCoo0cFseolpVhCu4f34kkHyzoFLddNtJp/1d0jqTOqT7Nj5ZZa
 QM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777018248; x=1777623048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxJWurcS+1K1oWc0W4+lon7MvEpckKjZgKf0N3mbbME=;
 b=O5DZ1kwcp/06xSIT0L37RVqbFeoU32pVi/GqVAn0acVkR4KzLbXYmnKYIoi62W4Mlv
 SoBIV/LUA2lqM2c3bAihz7rqrrbdZHOPYMqJtqeBcgZXqjFEVvC3GdQKOOG46kh/r8Bk
 IiDEIYxXNJuewF+9YSAmB8nSHChatkFUbWZW3PCInGeWIrEM/+sh41I4gTQLJehB0utv
 TqMhOvaCvelUauSRI/j320FazrhYipWbnV4qQ5VdlZgwCMwYMSEchCc+i+Y/q20bTseQ
 LEljR1srvCEYmPGoTgTkeLd55DIUqQXfdG4VDE9m4sLsRLCUwEsWndsFtePPOhhkuc3s
 BqKQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8o7oyePN76FO5rtSaQI3G4EW+pwOEQc94quCUeYV3zAIM/kvZSVPFl4K81bqYKDitTYL5tcHh4yw==@nongnu.org
X-Gm-Message-State: AOJu0Yzzxr8VbQ/3VCOnLvqk7VbSRGFa1+H5kjw1iFh6iAjBbhr3h86S
 3Id0Nu6dc1WHCEZkCi+DHlPCC5+meWnI1naSg6/G8ylQ4QT1kwemPYFOu8iWBEgvsLUaw9ikCYr
 VMj3CJDSlkT0YA9WVmp4r38V/qFpr/nrCXIKHRGyu1A==
X-Gm-Gg: AeBDievEgO+X5XEaYX9iW9zf2eQZdDxFaF9CRjgiRBAFYgoz2grywG2Ltj6ozR6WkUA
 QBxoulI5mPEPRMfDW/iwzs3i93r5aypxlYzQcWLJrlI6QTxR4MDGFtweAhB048n5uZoER+1jNcH
 gX9Lh2r+ILSnWqiuS6f4aSdfRb3Rfl1IxRqOaR1F0Yw7WXx9gz7lIpvQr/SaOauqK67DGqAgofQ
 vegoyJ2JWmLIAAtR0mKVJNKXnCO6v+S9XOm7jDu77tYZ7zgYFyhGzLJzb3SqqNcsXlIya157sqR
 EsZgJefW5TKk5E1atvnUbBW7m7PvZjWtkKjfpnniq6ifg0hy9hz/rfAh099/Ia6uKdyiI2Mh1jj
 LKw==
X-Received: by 2002:a05:690e:b81:b0:652:dd57:af1f with SMTP id
 956f58d0204a3-65310b87f31mr26714457d50.61.1777018248223; Fri, 24 Apr 2026
 01:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260409220614.65558-1-lucaaamaral@gmail.com>
 <20260423180304.53789-1-lucaaamaral@gmail.com>
 <CAFEAcA-mqtqcgMVeNgMawjN+RJF9DsfXvnLw5ncB9fRvTo2iJA@mail.gmail.com>
 <CAFO1s2OoAe=qktioe9uWLWR5bHL+LEzrrc3DuXzremfWPQigzA@mail.gmail.com>
In-Reply-To: <CAFO1s2OoAe=qktioe9uWLWR5bHL+LEzrrc3DuXzremfWPQigzA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Apr 2026 09:10:35 +0100
X-Gm-Features: AQROBzCrjIGT35RJckDSmicD2sY7uoxv1TJZ71xt5_A0UKh5KXMM2XbNIJTbQ8s
Message-ID: <CAFEAcA-um6WHbM9+LypV4fJpD750vBO1Vo2vhCdWS4Ko_yr9cQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] target/arm: ISV=0 data abort emulation library
To: Lucas Pereira do Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 mohamed@unpredictable.fr, alex.bennee@linaro.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Thu, 23 Apr 2026 at 20:07, Lucas Pereira do Amaral
<lucaaamaral@gmail.com> wrote:
>
> I don't mean to be a pain, the contributor guidelines says to ping weekly if not reviewed, I just included that in my todo list (and doing every two weeks).

Yep, that's the right thing to do; pings aren't a problem.
I was just letting you know where it was in the process
on my end.

-- PMM

