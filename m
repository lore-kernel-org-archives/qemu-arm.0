Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3892871lft;
        Tue, 5 Jul 2022 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsge1YlZV03HcK4qsopfTB6a+zDPO2v8/1jWYsCkkmKEGk80ofcQGSOs/UYFBZXu02KMUl
X-Received: by 2002:ab0:70c5:0:b0:382:3b0:599a with SMTP id r5-20020ab070c5000000b0038203b0599amr15543504ual.122.1657022976701;
        Tue, 05 Jul 2022 05:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657022976; cv=none;
        d=google.com; s=arc-20160816;
        b=uiHBZHA/RLjTjBSGYBSrXSC0rXy+BSXLjf8g4hjdeOI5z4/oq/Jgg1Xeyg5pL+SP69
         D5Gkj6keBOx3OCvLjAdMNrlj2ZoIVf9IYQpFt2j3XN52wvQ2sqIBQAW57cTu4iGmnreC
         +5zvD4hiAsUTH0mm10reoZTH4S9Pe3k6WxVB3p4aYsXaktF6a6Yucd4x57OX+9ERP0tk
         lFx/p5HITGhMhhUBUP1C+1hiwc1F2cAzYIzdAGsHDyxBXMjn8UrpnGNUJLUuberSgg4v
         i7QtyXYuQQV3glDz1X9QMDAFXFHi0K931TmjV5oHkmv/SWXkyxzFk0CHPwEwD1CjXL6m
         cCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZQEr7bRZVPwz/woTzs2/QHh1H/x1QhJTT0mo/i5Mr+w=;
        b=ILxnktAbeutEuy/McSHQ8GM8+ZQQBzo0aC8K+n8TaJj3RqWt8ujMsyJEGnViO5mBcA
         iDvglrQp7HGmlE5TPExNDJPrHo4cLmfVHFfaboxII8gUMiYQn+/JmC9srtotPypE32jY
         8mVPjRwZMGdZeCSxAU42bFabOwchqBDKaE89Xvn3WWM78arEHtGOQPJuxX9GERzxmdrc
         ccZ9Sl8n/8SL4c85Hvuw4v3IJra6w2zLmOdF0A9V8yOgc4JYSgKr3rqUuytbFvlfIF/K
         cQx4WvRHuzqVAMrf0qTyKClVqCYRL9zKwL0ZJzkdGAvibyswTgDEONTylnbxmX5vpgu4
         cRUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CaLrIneP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4-20020a67fc44000000b003542ba65567si8361892vsq.696.2022.07.05.05.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 05:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CaLrIneP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8hN2-0002Sw-3r
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 08:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hMp-0002S8-TW
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 08:09:23 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hMn-0005S5-9R
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 08:09:22 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c89111f23so56192887b3.0
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQEr7bRZVPwz/woTzs2/QHh1H/x1QhJTT0mo/i5Mr+w=;
 b=CaLrIneP9pgODmDggu9l3tlEhAEh+yJU+A/3pnvapZ8YRG/xEl/AOpDa+ZEhBHyFyj
 A1yxKGcALcpoNbqxexCcds7NhA023nB0fe1non2TBk/XlNsku6oib9BJOJBgcbZsNnoj
 lZGoCjYFnPk4Lpw+AbKgDqIS4icqR6jv2w3zpsh+9kCWT7L76R7oG+HZSdJT3kPSzZeA
 rX30mGSzkEloizTc9QnzefjD4GbKczz0G6jPU7c1BMpjRsLkkZLfJxsdRVnqGvAmUd5b
 mUh1+ZUWOfyGmzNAXSFUkn2ggYaCN7PzdwTIDyVuiR1PV1CqcR6mQm/a0SnKzFf1dMvX
 7gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQEr7bRZVPwz/woTzs2/QHh1H/x1QhJTT0mo/i5Mr+w=;
 b=MBGVG+fMzdd0aIXIX5pYcHoyuW1v1rd0/olkA83HyW+FmQ0I1PgLsthDtbRuD1UbtO
 vCILCg5FQorI32JTPX0n6gS+SwNePq4ikagef6cdSKuTDx1zd4KRoVVOgEdkUNVwR5ft
 C3fbWoStuCMPmnHtcsANdRCZik9i5K0hAsA6qVdQotkvoK8xvmYSubMFooSGH+/SBdj4
 KzJv7ZZKkyYiadg0+W2WFgDFrqY6LS/tOT+A1FlQACjw9fUX76ZgKZ7ZEn/hAcsV+wp1
 cAogcUfgZDoVDKoWI2xTtUHgZr32YB4XEGUUd0Al7GBAbHLI3jPXegam0hLHryOfb/vM
 5Rew==
X-Gm-Message-State: AJIora/yohUpQCmOA4IUeA/oHPmx4MoF6O2FSpduljVBsl9rRtykG0Km
 J2ugrC04fkiG41qvD/ayuSoaPaolzoocJp1Wn+hSGw==
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr38138248ywg.329.1657022960165; Tue, 05
 Jul 2022 05:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-5-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 13:09:09 +0100
Message-ID: <CAFEAcA-Y7rFFHeXmqsNvXz4M45CkzvvUuNzaXACGS3vmbH5svA@mail.gmail.com>
Subject: Re: [PATCH 04/62] target/arm: Record tagged bit for user-only in
 sve_probe_page
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nUO9qI8W8xqp

On Sun, 3 Jul 2022 at 09:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that we were not honoring MTE from user-only
> SVE. Copy the user-only MTE logic from allocation_tag_mem
> into sve_probe_page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 3 +++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and added to target-arm.next as a bugfix.

thanks
-- PMM
