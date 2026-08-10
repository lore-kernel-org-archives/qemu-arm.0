Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD3EC5AE49
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Aug 2026 14:39:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtRAG-0007mx-HJ; Mon, 10 Aug 2026 10:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtRA8-0007mA-PF
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 10:39:38 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtRA7-0005JP-E6
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 10:39:36 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8114a4542b2so28706067b3.1
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 07:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786372774; cv=none;
 d=google.com; s=arc-20260327;
 b=ayC8u//cIbDwqdqD+ZHhflKVN8v6jxcYoaKZLhyI8RfBF3XC8m9U92gi244gFbq+Vr
 5eZwtALLYpP37xPZ+4W2OSZyc6lBPWqS65wwpEEKuhhbjAbBWZ0vmgDVxYcoiU2z5/t4
 LSslFvu4YaxKUq8F5Tk1jwNA1nkADxbUg/rxWcP2Ta9cbLAsBR+Aukn/jyjrGEPpZ2zc
 NARvFyAkc3K7QruWXmzQQkQ5ibSWFHLKKox/M+OSAi4TStE1buzrkozTV2koMUKA/Gfe
 LrIFlCLvyhRuqvoY0WF1r7ChbhcJg6qWr7CM4xpdC5UJOi1H3tReloljnRMC7bKMSZkr
 eSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KYPrTKBg0uDTSzlel1LnvppHKk6QfkRtH2dKTdsM+5E=;
 fh=b14I9SlNyyOkGLxtp8PbzlsdeyTItMRnICEuaS/UC78=;
 b=YHZYi0CvwhPCIukLwS8Xgqgc2kOWoSvMzgZcnGzXf6QHpbNoFXVguLtFcwLefKyFEq
 2GLG3Y5OT2/fgFIbwLZ+RqN+lZ7pKAeFh/q6hZ5mvex+r+9b58cfpTRM9qpvre3BNeCw
 1Lg89cmLRHzGhdBbfmu17Pc+xb435kzpPiusGbRldn0U1LC9FJ6GpypByKJBYg0uXQou
 0HiGTAsjoMBTAEtShwGWG4q+UNrP9qonIvUSZi8JDQcO3/j2WusyDFhI6QelArJ4Iwh4
 O0aezDGNEDrpndaXX7yyNauRhf/Uy3lqfPxs26j5bEcqQ+2/Fep6IzlgCFvoXi76H4/l
 4pcg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786372774; x=1786977574; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KYPrTKBg0uDTSzlel1LnvppHKk6QfkRtH2dKTdsM+5E=;
 b=bfz2Fq9u+gbOB/EUOPvu8SR7aMC3waDnG0vQlLGitG7r87td6IFAHr1XgBvj/3UYF5
 BqLCXJJeyXR0FkGkg8CPS2d1z4DS0Ht8l2Q1iNxi6eWCxdg+X5fHKObUy+oynwKe5Aqf
 4pUriOtXnIUdYFoyf2vuOUsSfWWmOFOBlwuaa31xV3qwjZNS7nXHNWT0PLaToHN3EueT
 gBdraB4eL8tHYEdm8knNHuq9y1qcqfT5KqbQ6eo7YQohAUnjpUzrxOp8ti29Ih5Bnm2n
 ZJEJ5UmDxzalQ9OxeAQyv2Q+x29KuF4TpKcw7vAgff7EMjroFLqKIl1lIFVYEFi7oIGN
 KCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786372774; x=1786977574;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KYPrTKBg0uDTSzlel1LnvppHKk6QfkRtH2dKTdsM+5E=;
 b=cPd2Mq22zNSwVuBFZrtRBsr3BAmWey84HFzQxQhs+Xu7taqblYsfSioxlyzQTKPrfC
 D/0MCiluxbiuyluA76xiarrH52lWmkVehK7qgUHTh0pd4YD5DwyHGmA2x407av85Vaji
 uuHiWECRQzV1FM3PLbnzZEymzF/NFWmKv0ji0pQUe3lJwD9OPvtImVZ63wCJNaiQF+un
 sa6MGi/yl7TXMOMMbr8J71r8WsTn7JNTV49J+AvLYwLJ9emIBJiwKJ5B7QWlY9pmP0uV
 +zNdX4oPtqdYrBTIPM0q+QjK7424oWMMRYTt7mhY4AzmH/+Lcler+0k2uQvO3cMex9rx
 6fxA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rov/uVVNInF+qN7f9mq9zwkQXCWaqVipky5un3GumhMZvXDcV6X129+Piz/env7S5fko+UTSzxEMw==@nongnu.org
X-Gm-Message-State: AOJu0YwmJJimtjYI6IX7jGuk+k2KJT4vSlNX8kfO9BVOdq8BJ2k06iUz
 u6F49vdkGxF4WXb7APVxBXCqyPDzqVjlwmWDihoSkdK5MHR/ic9IjIuy8J5iDkrImjosdP3HE+s
 a23dq4JHH3/xlZQwmP84Rt0XRpUOBGOoruykIeu09/A==
X-Gm-Gg: AR+sD10z9ecwpUg69E3dXBPe03XPYqCaWGAMKR0JIIB4yiK8kFLF7d9lc5HiTMgOap0
 AXvvYQzoz2zntHnW0XDl+m4oJMk6Z+RGFVY4Ql/1XeEVUT5+FMc76vGMuBSlscaLsGeqhXWOv4z
 nAwuDoPfrkAxm4uFKa1MTUKlWGccm+LkSyFGv63UXs7wB8cgxivydjGakK9uxuqlW9IGse0hVx8
 BawYrGwhVJFoP1k2iJ744k82puRHWy4M5Ct31Syqud8ZC1bXcRtgAXW8ChWDY0shdZYHYTr7hDJ
 ova6UykVR8ZfrRHMdMz7v5kU2IBkGb14+TvFV6a/UubdjoYmmUusCiONbcA6P+fbNfEIex7UBVw
 n6S7neDtwPsDF+vwy2RlWjj9dSWjV
X-Received: by 2002:a05:690c:690c:b0:80f:9998:e614 with SMTP id
 00721157ae682-825778aa66amr122891567b3.28.1786372773762; Mon, 10 Aug 2026
 07:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Aug 2026 15:39:22 +0100
X-Gm-Features: AUfX_myKvanqCw3V3p6G1c3PaNj9pSGi9n3Vi6VObv5sv2o9b-Ybzy_rL-I0ckA
Message-ID: <CAFEAcA-puCcXP67TEbW6-TySiFax6-N-N8dXcn97GMJFcAZfhg@mail.gmail.com>
Subject: Re: [PATCH for-11.2 00/10] target/arm: Implement FEAT_SME_TMOP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Tue, 14 Jul 2026 at 00:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Another SME2.1 extension that becomes mandatory with SME2.2.
>
> I reused the little helpers that I created for FEAT_SME_MOP4
> without renaming them to something more generic.  I hope that
> isn't too confusing.
>


Applied to target-arm.next for 11.2, thanks.

-- PMM

