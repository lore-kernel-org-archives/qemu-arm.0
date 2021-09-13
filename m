Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3474254lfb;
        Mon, 13 Sep 2021 01:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSA+M22/U+7dhPKei/qZFyc1k/ZAo2Uz4BWpzKzxmeXIuWhb8NsJtuSQ8mkOzs9KJ8G30U
X-Received: by 2002:a25:bb8b:: with SMTP id y11mr13908358ybg.384.1631523187002;
        Mon, 13 Sep 2021 01:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631523186; cv=none;
        d=google.com; s=arc-20160816;
        b=v6TaomxFyJNS5eaj8RQcdF5yk1SWwkLyGfxvnmYsxz9/jG1MRYmGwJ25/TOJ+0TVtP
         BpvENCE/Z3qBGoNoFsb+6ilekwQMMln2e2bQkgDkgi4Z/pr6YttGYp5oFSfMUFycwyae
         tDyiXrKphKFtyOyrlpJ0/ohcxKgWbzdF4pJRlK0bRI8/BHxnQV0doyjRcXafc2zEWHk0
         rEHuTZSeTyFKF1VYHaGitboMmi5s34x8Aa4JdV4+tHPlpyzX0pPz9IUdTiJ+yps5N6Lg
         TAPUoB2NcTcxIoPPcjiA9Jf7W7I2QdcdLPAjxlgZ2LoXJFOwvY2HHwjXGscu93Fg6wlT
         urKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08eP+0Wy8C9Y+icNfsIYmS8byb2MUuvsGf1B8iV7bY4=;
        b=b83fNk6vNgmMDOlYlHQ3u2ZPxj+cExS1ms3/yjws2d7oZsa2nXyOMNoLhbBAREhtgD
         3UGieeFOXi5jjJw6S0gl5dJZte/bPB/28cjUg84wxOvEHtDfbPNnjMbAGAqfoF0Tqu52
         EnQpDLr6eM56zQegI2mIzyLjA9SH5foK/Z/aWJC+QJ5Lge1PfpF9EE7s9z84g+zKUu7y
         UePqEN3vOjTkrTgoJtmz6ppL1t1zXOLBosgyR943gMJpffLcv/phVdzXmE5NhpZsYQg2
         NBY+bKNC89auwrJSnbMNI2+iCWJ6NyiUG+5W9Tss3LDlyK6VZ1DKUWZuR1pPCN2o0WmX
         4THg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ho2WrG7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si7321325ybc.145.2021.09.13.01.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 01:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ho2WrG7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPhi5-00067U-Cr
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 04:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhfe-00053Y-C5
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:50:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhfb-0006ZH-7B
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:50:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so13423673wrb.1
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 01:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08eP+0Wy8C9Y+icNfsIYmS8byb2MUuvsGf1B8iV7bY4=;
 b=Ho2WrG7ybyiqDfTEsZp6zIeD0BieVFY/5J/lSfoV/4YUXDevlLzf0GQTLwayNUt3tw
 RQJD/9mit8Aa3bj+mpLzXINzy9i/1IyFA6H0rSt+wvqXCNskW2QQBQ9JwyTmCp/kmNEx
 6FFtrJqsyU/8FPuMLFvwqfmWR4ipCJIwPw+VQk8sZPTMkEiUaPJHeMufXXcueWQF6IH9
 d5LWsAI+1xkIdsJGJnOQBmxQfg3CDxBGwWlvW36zV3NPpz5HfHhD8vmt+lVi5v3Ud4WE
 Bve2HIDQuXks4cD+edvslbx+tY7ZT78k8D5yLDRSQp7ErEscnCoSeXxQS0V8mWbB+WHY
 mTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08eP+0Wy8C9Y+icNfsIYmS8byb2MUuvsGf1B8iV7bY4=;
 b=B293Nj47Du9pUibZ/VGSQ/zokZgN6T3b3PSOuYs+ca0k8M8p1HD7v4W9TEVi7faqeP
 690xP/k7AQ+Co95g71vmwYB5GkWr9v9YW8RkhO0s4SpyWNKvLpFyvfzMx9fJxju0k6WZ
 51fNflgp1dhrZQHP0Df1s8e+TiBvHMnxjKzG3X1QbDlN8cli7DSBdSC8qFI3wavoN1pR
 uh58ZN8/rhPEm4wbYF6hyYQy55i0pL/1K11XnD42uML93jQChtIDcsZWd3kjIuC3aafd
 G3S9FcGLHSLAIjnlKUP61g7N4seodAiRW0F+nrhKrw2u6Q5Q1lythcRtDlWzbG4sY8WG
 WJ8g==
X-Gm-Message-State: AOAM5331cG3cmWKihg1opDj4PsNroOt/ycLGlJyMsdzFEG9V60haQQbH
 pNr+jeoMOqGUsUz7Rvb4QAPeN5q2CXtAhEfTplfZgg==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr10993767wrq.263.1631523029493; 
 Mon, 13 Sep 2021 01:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-2-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-2-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:49:39 +0100
Message-ID: <CAFEAcA_fVeTv9Hj6cuf9KMVf3x76rnMVXqTt9hGT7wcW_iKQfg@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] arm: Move PMC register definitions to cpu.h
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JEi1sjQmumQE

On Mon, 13 Sept 2021 at 00:07, Alexander Graf <agraf@csgraf.de> wrote:
>
> We will need PMC register definitions in accel specific code later.
> Move all constant definitions to common arm headers so we can reuse
> them.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/cpu.h    | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c | 44 --------------------------------------------
>  2 files changed, 44 insertions(+), 44 deletions(-)

Do these need to be in cpu.h, or would target/arm/internals.h
be good enough? (Lots of files all over the codebase include
cpu.h, so if the only users of these defines and functions are
in target/arm, internals.h is better.)

-- PMM
