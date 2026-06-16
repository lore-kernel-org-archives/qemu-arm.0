Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24904CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 09:10:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZPoZ-00041e-W3; Tue, 16 Jun 2026 05:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPoY-00041K-Pf
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 05:10:34 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPoX-0004z4-6J
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 05:10:34 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-660e9fef1d4so4570560d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 02:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781601031; cv=none;
 d=google.com; s=arc-20240605;
 b=MtAymRQbZTVq1vp/7GDVFpIAgQh3/KfW3WETcfvf8thy6TdyUD7jnYJzWDspHRrl0g
 jF1SDIOL2PwVOjv/RPZVAe51ffPGwTXnfNN65pmIcU7LQOkSM773AHvmkJuqRdS33QdL
 wbYDsU6ymMtb1kdl4HPCd/AqWYPhZp+I/wfnLX5/7EV4uNDjd1oYuo0XzAgYeNdBgX7X
 0TfLufQWNd6KgtO94Q4ZhWNOsJz8yRQnr2dMZydd+ncOZHdvXFrwAfoNg840J6UDTPsF
 1a197BdEkkq05x/bwGHVQmn60MKzfZeANDFsfejlIPfM2vOqRnX6IZVNjLSlAADGN2O6
 dnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9ErFtHlNefnfvOAXcetVfpHe+L3xBA08nmoOEuggZR0=;
 fh=oG+53MsbmDmhmmXFFz1mQNyImwWicRcBuUgrcYPHlSg=;
 b=Wp18TFbeW2mnw44brBYmJ87fdHOIcijwM1zCdDBAiOdoPvu5y44sKRm83NjMf6QOmN
 c5tFwlZzTqvgZppTahdKYHcRvzt7hriLSFODrSpLmXAjl8pMAf4rp3amppnvvOAy/xP7
 iJ4zxlSMFmW1R0Ijdg3eg797xGjQUB/Rufn9qB3dn/8rpXWbul7OkuCK7DX8SRE6WPU0
 qAM4FGkMB9+UJktHJDqrWYqOsFZFpI2TPeeb22Lkci00PAAPAmqOKoXYr+SA1Y9ffyjg
 e+YfEebT0xPezf0FBtXeg9KsbrVDQm87rLKQGVxteB1k8lvJ9nFby91gmYvE8LJOpnLH
 VJGw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781601031; x=1782205831; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9ErFtHlNefnfvOAXcetVfpHe+L3xBA08nmoOEuggZR0=;
 b=OnRkGJGFUjpZQryP5pR5ChWYpHl0V+b2PiL/3qCmI3iUcTlZL7V4dHt1cgYKOW8rXH
 +WxWNXsVVfZLAphanCn1TP6hpeYRmzjbhLsI70yaaEYGSWRUqb+5okRlxPqYGYWV5C9M
 KczZ5pjsJnWs+axN256t7YLsnbdHZQ52ZQk9yt8cubv3E0fUtSxN/lMBZPG5XNGDPvYR
 TXyRdHpcc0qo8CfR2okc7L0VEXxEFmYO9XR3iw23hkaBqFNoHrBWqHOpKgPbd954sKFA
 VVCrtuDjoAcuC52stGwevtDmQAOVYhfOBXNCQ1c9vxLDIrZ+gMRrfAibxRQlH/tpMauW
 RKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781601031; x=1782205831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ErFtHlNefnfvOAXcetVfpHe+L3xBA08nmoOEuggZR0=;
 b=fVJEwuleD6MslHy5alSFH+CRSnRZKvmcykoyx5FZct3Q59WSJE5TP1wh1JMOYNBb55
 utXuj+SmSc7SKwTyd/aU+dvKi4KkMJGkKbtLp9XPRVsyXyANf/XpTkrunKwI64m2uoYS
 7DD/YViKjgqevX6fM5Xav+GXUeOPn1ubod89ub0cOShJXk+VzwqHn7Uuy8djsD5Spyef
 SRes98wOvJU1R3IqOdQoWShbAC59qM55HuvFpu3ybH5K6cNecksk4Pe+GjwiksfFoVEt
 DxGQP49CmvHViHNvwkRj2HmFKh+DH5z2ShyIOxHDG6OCtwFCdjLytm3q5r92zsZTbyqj
 zgYw==
X-Gm-Message-State: AOJu0YyARpLqEZsxLYdxZeWcSwxbQqIUEf1AvYtXjNdHLYOqyu7IBx4V
 kyQYoYbS4G55Kq/jQZvEv2GPLhsnOW7BMxEXzGTDPD4qMu1iRTchkJxWsCbHuAwjANw1ztYwzuY
 r+0YpsUQEaiJHI2vD1SWKoyZmuHaRk+auL47tWbbFww==
X-Gm-Gg: Acq92OEyRtpvID5+vMq22NE5xD9I6rUgoMqxBaej9DsHr7ytfInwKHwQPRzpT2cpUwl
 lpdiTAnhUKhvRskNT50p9WI3E9jLMcOloU0lOKUut5/v+OAZoqey0SG7DZl/u/Wy3kL7q07cB69
 TyOoaog/1XU0y2dbKKV2AIVxsQzzB092w/4kl3DvVaJ01cnqpawBtC61CpB/yAJz4zqkpZ8YKy0
 wl4DvvQyFTBVPV94Yrk2UEeRCiKSPZ4ORnf/TdqkeKqJi4cMHeROr6/jYU+gNdBLXyk50wGIglO
 eF6f/6GhSQZlmk7jZrvaKKCQk9dCVGhoyY1R7PXz5xm44EJPbsYJIC9H4UnfJPMDGoBGroUdk8y
 8Jw==
X-Received: by 2002:a05:690e:484d:b0:660:5ce2:58e6 with SMTP id
 956f58d0204a3-66284f8d069mr9684295d50.21.1781601031311; Tue, 16 Jun 2026
 02:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260605035012.2876664-1-kylefoxaustin.github@gmail.com>
 <20260615000835.996870-1-kylefoxaustin.github@gmail.com>
In-Reply-To: <20260615000835.996870-1-kylefoxaustin.github@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 10:10:19 +0100
X-Gm-Features: AVVi8Cf8F-RXRP7xg9EdKC9DiH4MXMJcFVeGYWSGfUZjyo6q3DBexVXnKoPxwsM
Message-ID: <CAFEAcA_TpWZ4CsaidQwsP183SZdOLQaNO4oJZ8Ai75X2CH7rgA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: honour CCR.BFHFNMIGN for probed data
 BusFaults
To: Kyle Fox <kylefoxaustin.github@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Mon, 15 Jun 2026 at 01:08, Kyle Fox <kylefoxaustin.github@gmail.com> wrote:
>
> M-profile CCR.BFHFNMIGN lets software executing at a negative execution
> priority (in HardFault/NMI, or with FAULTMASK set) suppress precise data
> BusFaults caused by load/store instructions: the access completes
> returning UNKNOWN data, the fault status is recorded in BFSR/BFAR, but no
> BusFault exception is taken. Software uses this to probe for the presence
> of a device.

Thanks; I've applied this to target-arm.next.

I tweaked the v7m_read_sg_stack_word() slightly so that the return-early
case is the "take fault" one and we fall into the following "return a value"
codepath if we suppressed the fault because of BFHFNMIGN:

        /*
         * The SG instruction's stack-word load is an AccType_NORMAL data
         * access, so CCR.BFHFNMIGN applies: at negative execution priority
         * with BFHFNMIGN set, the BusFault is suppressed -- the access
         * completes returning UNKNOWN data (status recorded above), with no
         * BusFault exception pended.
         */
        if (!((env->v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK) &&
            armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure))) {
            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
            return false;
        }
        /* BusFault suppressed; data value is UNKNOWN, we choose 0 */
        value = 0;
    }
    [etc]

-- PMM

