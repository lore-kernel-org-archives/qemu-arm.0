Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3433294lfq;
        Tue, 12 Jan 2021 02:42:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNl3f6s9Oh+cQSGgzyZxEVg/IlbQPYAHds/5u/YKY1TEPtiSCWN2F/3UvFJxOARs8TLQVx
X-Received: by 2002:a5b:2cf:: with SMTP id h15mr5774410ybp.475.1610448167165;
        Tue, 12 Jan 2021 02:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610448167; cv=none;
        d=google.com; s=arc-20160816;
        b=GH4dSRVX0x7ywi5OflckvMqcIxwZ1DFHudMpuNUT/FYTiJzAxPjcUG02vrAh6UWsdp
         L8BGgnoo78vRv0ZbYLptjQdPlHRkzV2Ft55g59NmSGXn1jg//Y4SjNNm8Kc3WWdT7Qas
         JhL+IwZWORStc4fKacjefSThxIaiDqU57TsoO/tzSfE68lgF0OiO638jc4/OUkKTAZ+3
         jBAV6OcmzREgz6WYHiTHg4r1pum4FEiGGdBcOW8PejJeUjThV2OKL9hwLevvC/bhHei4
         IWIuL6MVuwLeUUnUtx/a49bK+MNEnu0lyKBoPTLf+UyFEDPe3tP/MZKRNW0mF1KdNYPy
         YkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3/Y7ppQtuS3fpbvTdFYBXtOH/K4xhXeo13718pbsi7w=;
        b=M11NvDE8+eDb0YE4Tyc9cdxeRlWZeUGNftWeBUcqQZeNZvNERwPbHrWZImbyN2X8HM
         wzQ7LmzWHVjOzc81jTqdRZj+vpPgIS//4MX+X3UoRVNmT9Fzjgvx7492ejF6r9Rw8q36
         evMkdVUmTQrJLx99C9mxqOREehv7A+fqIVjoPRtckuaNEMCs2LziL0lJDzxP9ubCw9b8
         Zz5bsEqDanhYFYdZ/rKIqp1VcY4F40IpiqtiXVoI7gei8oxuXZinuA9InQAMfoG/4MfQ
         1X6FnSz8MplZHdqqVVD0BgdkSiqENwX+IutWn3LTZUtNDUrxl/XXcZbwRLCbQq4XGRQ3
         hriA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2Lo5Aap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si2395708ybm.46.2021.01.12.02.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 02:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2Lo5Aap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzH8Q-0007i1-G4
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 05:42:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGfH-0004is-4w
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 05:12:39 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGfE-0000hx-V9
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 05:12:38 -0500
Received: by mail-ej1-x633.google.com with SMTP id d17so2663321ejy.9
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/Y7ppQtuS3fpbvTdFYBXtOH/K4xhXeo13718pbsi7w=;
 b=T2Lo5AapG/JU9dByJ+7LcCJwR3tSTlaWBFWfDclNmZTqg0IqKwQo3xES1dRlZzd224
 Zngzfo76MS5hrKPz0IHSrpU0iJBy8r986grm17/l552Mwr7Q1Y9F4sgOf00fYJ7OsKHt
 ZUbMuJUqRqXc1V8wm2hFvwvYUlcE52BytT+3uMQu7VJrfE8WmFn3fblL8D9Nh+TNlEev
 g0W7CpiSD8B/GL6YvN7FX0pJIPO7AoaiDVXG8lLiTNF4XP5y796FGGMWkgS5kWLcxKys
 DdqmceMd7zce7LLcMz7c9ARhIEJQzlRB20NbtDjKEE3h4rZ0qCXPoF9kSm0ZD5LX68Sr
 yyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/Y7ppQtuS3fpbvTdFYBXtOH/K4xhXeo13718pbsi7w=;
 b=ca1f1b9KTj1+DrnkSFbcakNklZ4cHWiqoPPJcyt6JK2lLONN5l+MxKXTRj6smVJdfN
 eD2vcB1mTvOV8tI8ptBSAmM6p2F4wDpkWoZsE2s19tHds0Yd1RVO2QWQ7sUDLIYwc6Gf
 tjrYtMjrtQVLfgs1wtzN3ah31xuVCKpkAhk3vHihNo5ybcmIAVtmoc4nJC2IsBPKjjEv
 VQSo5yh2igOI+A3qWBn5cxnzCnSWilhPMvU/XetXV0GwZfuRc7pcn9Xf+0RDHXCNBWE2
 67FPLkXlz8qxh23owzBuSbe+GSL9O/5wtpOoaI95Xz1UqXwNdDVC1W3kvSLnefQN3oJA
 9aRw==
X-Gm-Message-State: AOAM530Eaii7cG6+zsPaTar2WPPtX7p8EqBE3IYSo3kYoIO0YlEbQQsv
 iFAikJy3DehshMTC90C37wMduPwnJKU4X9vJ6vPtZQ==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2622714ejf.407.1610446355490; 
 Tue, 12 Jan 2021 02:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:12:24 +0000
Message-ID: <CAFEAcA_YnV7dOUAGtxqVm==wg3W9PoVNrh4U0EJHK1C8o8f5dw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: various changes to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: etWymFxsLdsD

On Fri, 8 Jan 2021 at 18:51, Leif Lindholm <leif@nuviainc.com> wrote:
>
> First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).
>
> Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
> by the ARM ARM.
>
> Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
> I was unsure of prefererred naming - Ttype7-Ttype1?).
>
> Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,
>
> Lastly, add all ID_ (aarch32) registers/fields.
>
> Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
> submitting shortly, and some of those features also exist for aarch32.



Applied to target-arm.next, thanks.

-- PMM
