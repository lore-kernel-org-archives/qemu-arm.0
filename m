Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C545C9833F
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 13:55:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBol-0003Cv-C7; Mon, 28 Sep 2026 09:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBoj-0003Bh-10
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:54:53 -0400
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBoh-0002P8-Ee
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:54:52 -0400
Received: by mail-yx2-x2b.google.com with SMTP id
 956f58d0204a3-6755a6109c1so276029d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 06:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603690; cv=none;
 d=google.com; s=arc-20260327;
 b=ZHYV0qFeaogIJz66YkEHtI1w5iqodwUp4+f6pH0GnLztkpw6fMFPF+7UpsiducBG3a
 sc1XjkVNyumeFrGkNEdVWrSSnu9ZzryBZDXiC+85mrQoJ8eIJ3M6J0i+Fr/wP3rPPzvd
 07qUDjr8BxzYl7wZS+oth3mAOscJnr1S32/Q7aPmS9+Ol3WM/8g3U7zKkVjzO8qbbwEx
 7E2WFW/taDafDFtvhQVi6sgMfCSiAt7VjadggVGeAgTxq0l4k/yuN3Bq1Y3MQSmH/Cd/
 QWot5otpUMUThsd+XnyhCqhKYY8dPkWRzXYlth6c4W7lqTZMk+XQ4Zu7jaF5dpwb8BFo
 ullg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ij4uY4bkMYQGxRppabaKag+gIL2WEZJ23RiGoAkDOPo=;
 fh=hu3+MK6h8NLHKZuRnKnzWMz2aGar2PXWnfhTTZ7TrNk=;
 b=Gn3+N4CtAZc8cEjbmhCkMqXkkUsbyHm+xJEdchZH+BNGXzdNSXMVEffUt8AiUbQagE
 N+NfFArtFJccOPDDW3Me1utXZs1Ft3aQnACM01e4csZo209Ax/oynQCG/VWk4G4edWgW
 0PKnhe8o5yEoRdaHt7JJSbRVJZLmZH5p/zC2klO0NNjzrjleQHlTasCNvadSUiRxtrKr
 unG4BXEKbeffMrxoYTIQ0u6DNX6tCBjmbRuAWwaF2FImFNazqcUT4LYbmyXen0WsyRsn
 L5dWxt2/UJIgKH8xK6dFeDDA14BXEHZ0+lEzOP0k/tJYVYzJcS1iCEXpBfEbTsKUoWTR
 n0qQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790603690; x=1791208490; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ij4uY4bkMYQGxRppabaKag+gIL2WEZJ23RiGoAkDOPo=;
 b=UoNhlp7ZpUmZr810zn1/gIGDYwA9rfVwyWvgE5Xk9HUpeS6OMMZ76dO4874tX4POC0
 KGRO/e2Nt6dUILsnMpQSoqF2OKSr/lTKWBr8ZdID4r9Q4NJiRi9yEelMCuRospwFAAAL
 GawHPZAJNBKEWqDeQlDcDmzIP5KN5f4Az3je6FnZF5bH/gYwAt1zbLHgJ6bbZEMUUQZi
 jfIMHSBLhCTloUMeNFlESjaYD+uutAOEn7YYWQSKc8JU5H92LEmc/V1eP+C63NfxAf4D
 2bgvkl3OsFtqEiOaNDzktTrYG3TQucTUwedHXs35PozIFU2dpKgdCGtiN0Q6Zzx8nJiy
 6l7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790603690; x=1791208490;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ij4uY4bkMYQGxRppabaKag+gIL2WEZJ23RiGoAkDOPo=;
 b=SddR6FgCqi4pvqD4v+bTlutX9bYg1jG1OmkTUY8LWBCnyDbHYuO9abyuFglU/amsWv
 mfqYxKdKDa9NOj08c2ClY7HxKmPknQMGuu3H623N4T7XNGTDpPla8dSs/UMsGqpp/b4f
 Gc8LGLsQdsmW+5smQ4k0mXUsswi2Iyn/bLnfDRR+EDa7bfAWurF9lkARFd5ziEci+572
 L6QBjLsjEZtiAfcDI5rK3sXAV7mOMCM+jP2XLCX6Npt3a2TkN1OfcTrbmVoPabJO8Jdi
 ZD219BYBeF2GIcJ0Xj6mdGvw7uv0JAKIq4373uEVoCkkeArpXQMwKPonyqdHvg20Ecl4
 QYqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwir2XhH621DSgiYjKT/KF4o/x8t307Ll2D/6xzCsNw4IIBw99WG3nZTuAXRLI6VPWBAvr5lgjmJw==@nongnu.org
X-Gm-Message-State: AFuF++lpZKc3oGCt+GdfoYFzDj5ul1/2vA4ZhIMJImWP03Qv1Ned4rtK
 wZIz9P0letnNUpV71osq16xQOlUIkLoxW1jE5JupUEHsoHzxrxnmB++ULCNqwg242j+e4Yc0BR3
 YkWvmz3xDz8eXrYcbV8NreKggpO4IiN2xdQbVBnA7+Q==
X-Gm-Gg: AYBFou0SpoanvDZ4dYZ8ZG4xRKtDxm7VfxS6yibsuR20n4zU48x0nqE/siYkC0/Mls2
 IvwCgMBNXjvb2u+zZQ1xZF5y3JxXFTYHryBOAov0f6CLCIFhFpqVqUSm0Fm2wMLZV+k0XRuyCLD
 OeXfDuJmjNiGheulLFTch2OfsHvHJwDs7C4k507J0d9al46de5/rBjdo0M3DDPE0qtsnRudUm11
 +T2eiE+eBVjxUIavOPz7uAW9TNu24mSkdbOCeCOGELZp0znEeXXA7uZt+uFP4EEwDQegm2JpbJm
 1A49czaQ5eBR6b3sNZMs/3pDWVoUlBtGwyx2fQTgCarpHRV0Z5tLh9eCrsOuqUqNwlJUMpLiuFk
 kjEkzXt2l1J8G/w67lMJXJx1tM3+f5T8QcKOO3ao=
X-Received: by 2002:a05:690e:14c6:b0:675:3d40:3c1f with SMTP id
 956f58d0204a3-6753d403fcbmr1555494d50.71.1790603689729; Mon, 28 Sep 2026
 06:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
 <20260914192323.29250-3-gilles.grimaud@univ-lille.fr>
 <CAFEAcA_=sRZboB1GyGDxEa4vTZe5YS4GwJV9aK=6h-fONgLVkQ@mail.gmail.com>
 <20260920220722.73501-1-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260920220722.73501-1-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 14:54:37 +0100
X-Gm-Features: AclHuK_eNBIKBT6Poa7gPEOoGww3X56YJ7ArQXHNcJ9lHMik8ltiNnY_jjJbN8o
Message-ID: <CAFEAcA9ScL5mmu1LKEhq3Qo0OSJL+-Ee4K6ura+2SgYYZi9O6g@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: model Cortex-M0+ privilege extension
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alex Bennee <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Sun, 20 Sept 2026 at 23:07, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> The Armv6-M Unprivileged/Privileged Extension is optional. Cortex-M0 does
> not implement it, while Cortex-M0+ may implement it. The RP2040 Cortex-M0+
> configuration provides the extension.
>
> Add an ARM feature bit that represents the optional privileged/unprivileged
> extension. Make ARM_FEATURE_M_MAIN imply ARM_FEATURE_M_UNPRIV (handled in
> arm_cpu_propagate_feature_implications) so that privileged writes to
> CONTROL.nPRIV are allowed when the Main Extension is present (or when the
> optional privilege extension is present without the Main Extension).
>
> Update the microbit Cortex-M0 test to verify that writes to nPRIV are
> ignored.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---
> Changes in v2:
> - Removed the Cortex-M0+ CPU type definition from this generic patch; it will
>   be added separately in the upcoming RP2040/Pico series.
> - Added the implication ARM_FEATURE_M_MAIN -> ARM_FEATURE_M_UNPRIV in
>   arm_cpu_propagate_feature_implications().
> - Changed the CONTROL.nPRIV write condition in m_helper.c to test only
>   ARM_FEATURE_M_UNPRIV (Main Extension CPUs acquire it via the implication,
>   while an Armv6-M CPU without Main Extension can expose the feature
>   independently).



Applied to target-arm.next, thanks.

-- PMM

