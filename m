Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E8CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 14:45:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXKAv-0004up-LC; Wed, 10 Jun 2026 10:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXKAs-0004uB-3C
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 10:44:58 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXKAo-0005A6-Vf
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 10:44:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-68bac6e24fdso9262087a12.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 07:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102693; cv=none;
 d=google.com; s=arc-20240605;
 b=K9DnuqPpGTAs/2lx0x4gWrUFJ+D4U2Ymyu/RcgVpTCWnSXUWgDRKSVWNT6LnYSjSUN
 2MfGsysDZLo4zv6W1xmJY7NFAyM8s2lYcrz8+dYiSibGGCKM5aqvQ7ohRfnfGBpw3GQG
 g86PMtgxbIyheH9VKgK73WYrHI+DZtsapouwO+CmVbE6GdteOG5ZHzVI50IlNppdVlHP
 OcmAaaLcBfrfhPm2/X1XhGx2U0N8TD4ns59KCA5sJAJeKz5weXQQhQYtcwwkqgOIMRs+
 0bXfKcjlrf9TaC1aalquZP8DYSCFnmOa8OYppN8LOSvV+C85oc2Ki66bvnhPa+gS5lUI
 ullw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WH2suyGrVwKp8TBKLRrVayQSilUAn0jK/Zs/palhL+U=;
 fh=9S97+6D6glSDpWNaRC15sZwBulnA6cBYLXIwePrasik=;
 b=I7IwCC51EgEepo+CF5OFc5hGhaM0vnrjw1EFOFfDNUKjbGRGcR8BSg1U2fJvCN2zVU
 8BiQRM7UmseIG1hYwls7fcqH0ZlmD6rsa/fJQ25FMPRdeBCacVpad6UwFjOvXEj4dav5
 GS4on+9K37BY8gAU8wll8a05E0SfkWJuTh1DKHQVJWNAtdTJPbLZjC9MM8LrQ94Rut2G
 eTUS+ib49uiPNQlAY8Pg7Vq1UVxmyG+1THYp+cBK+wJNvXuRhUkRAcVJIbrdwftzrsPY
 9nWs2gtYXosBWUhNo+Igtf1gR1OxJaGHigLAmOGoSHJdQWFUSGL7DRUukgxrhelcLog4
 +oiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781102693; x=1781707493; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WH2suyGrVwKp8TBKLRrVayQSilUAn0jK/Zs/palhL+U=;
 b=G9N5rJXdqWsZo87W8rRb+/1HkF3+113ls0tYQ2zPf1X0526jg0mlrBmt+KmQWtXkOW
 b+Yo7SvuPNZQoXsJl7cmSzVIA/26fu/ZM91leHr6tFhIOphhi+a0W2XY/ryKXwLk7xTI
 O1i5AwaKREhbsf3moemxYsfj0H8H9A4F9gRBsIO8C/+f+RhgelRKnYz5b5F1pelZQ7KB
 Yuo79xssyrePBSbcW8R7LhMFpBAte83XXYc0+RwDp2MxFJI9AmbOvdYxS28sjFa2GOJP
 wA7E+LjZAvuUygR2FRbd/S14coHWrujiHR/pYeBIxPp17iwVS5EV3sjjD8/i/WtoOmB5
 L1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781102693; x=1781707493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WH2suyGrVwKp8TBKLRrVayQSilUAn0jK/Zs/palhL+U=;
 b=JfTuW4tXncMcJQ/e7+Z6FJadqkgzPtiysZsInHjKh5AU2Rc2YpclPls6WXw/XP+cv+
 7XNWLWYk1fOC22WUPhATJ1nOkbwoJw+roQpQSWcK8fWd6YtnZ6+5rg4UXcBfQBQlGgcp
 58zAwe1XBwbOwkFZQGaXJZfpr0HBBcvePv4E0VX2IwR+x/DLHc8J+g/BF8xLXi+iWXf+
 GlT0y2sYwqcLmDWrTYCYvxbeCX3QI2whdctHJJt92LgYjjP8+6fSdLiWJuLcWgmLgBbg
 d1P7LCZR6wzByUJzm4qvbaLGDNy624S9fhU7D8TS2artOIIite+9K+zJtV8nq3zkR1pA
 Jx1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+OVwbBkGnhAf+OXdOeeSpIdRGTeOmnXzcdgwQEuyNZvWajFsDzCNAUBw8xUXETk7ICo7+bdGH8g==@nongnu.org
X-Gm-Message-State: AOJu0Yxw5zyC+5KDESj0fMZgyY5+sQ59ZLc2pxx59b69n6Y2z06HgvMR
 9szDEVyScPYRtY3yHUjZQvwop+bdu4xjfbNzZ+yd51eJmUMLqYKcl6tLv2pQ1irZ6LG0EPLav3F
 QIrSa5ZaVoe5LaYDhGnhuyqslDrFYH1hhu4OZKlVn1g==
X-Gm-Gg: Acq92OGtvJorTE/N18JNBqILkzSPcgznlNIQfgq2fs6XFP/5m3FxRjqokF8attyz0AK
 ydO8QP/ZF1F6yhGvr61oijVcC9kU3R7dkYeBxLXEAEvcLfnhtaa3BZjdFYPmwiI6Cai5HBVS8zx
 Lvf3j0kIzhaJh7K+5Q+VAgFv2PYrxKfDwEtoUMF+FojPuvIysSoGSpKy8ZHze2QpnSykw//83mM
 jICmgU0+b0d2D1/zB3Ro80xp5pg45tYaLhQyDoee5uW8p61cu1vltiUn6BZKLnG3Md4ilddmaEV
 Ao2B+z3qB4qBP7gPcfCmMu9CyG+9yBTkGnkbbaq0LNOrZbJUDdVyuCTTKkGtszqMRQ9gL3FfuXg
 5kg==
X-Received: by 2002:a17:907:2712:b0:bec:5865:6c63 with SMTP id
 a640c23a62f3a-bf37234ab8dmr904048666b.26.1781102692667; Wed, 10 Jun 2026
 07:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260609192110.752384-1-richard.henderson@linaro.org>
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Jun 2026 15:44:38 +0100
X-Gm-Features: AVVi8CeV1Vu7-0FrZRzBrOafxPXGsdhgC9TVZESSrwEqtaZRDVeV3EzMG4oslMU
Message-ID: <CAFEAcA_Lxo-6KDDJTrxpEfbYGrimxai4LciOmSC3CgfPVmYOAA@mail.gmail.com>
Subject: Re: [PATCH v10 00/45] target/arm: Implement FEAT_FP8
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Tue, 9 Jun 2026 at 20:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v10:
>   - bfdotadd_ebf and f16_dotadd fixes
>   - streaming fixes
>   - comment fixes
>   - All patches reviewed.
>
> r~



Applied to target-arm.next, thanks.

-- PMM

