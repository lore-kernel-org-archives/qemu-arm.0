Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49330CDB466
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:32:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZKc-0007Vi-Ii; Fri, 19 Jun 2026 09:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZKb-0007VJ-0K
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:32:25 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZKZ-00046c-Jd
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:32:24 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66043ecf6b3so2028615d50.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781875942; cv=none;
 d=google.com; s=arc-20240605;
 b=HMdpm0utsfyBmaDBWFw/U3BruMkF9AWbGiLzpIRFviLZMrEQ/0QDXNmts7wJvir6bx
 Z2Hckj5ewPMJHqdmV6SHQXLtVooBkMmGiRauJhLxRx4Ntcy+RQmYlebJP7Gln5iZ3UCG
 TyyPqdeygVi/xEJr/5tAY27aTY9rdI3DIdo9qPMgVbWJlYuWXtFBRnBaevwxbXpB3zFr
 pT7FVYw6VHIGPkfmiiuFkpwHob+kNN0/Ajj+1J3rBOoiGz/P3TffCnu33Z4tMg8TljXs
 uGefQ77Fpy3gLCIRIWDyGEq9s3prvzB/s7tOrYmfWf7vGIM48c0EeFG4bEJ0yB0vqOa8
 K5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=FWx3SQsaaZvP/ihMY29sgSd20PLBhVOnHyRpXFlR+/A=;
 fh=fSWOU2QWsP1iTDDugPJD1X/WyDuEQu3ssKEVsSOoLZ8=;
 b=FXk3NRfZ4qsh4c94NOK9SbKlSMBjEdpL7906qYRXSFqWn7cQgeBNONJX+rD5ZK6LE9
 aNR08meU8vgG2gMbtS7g/GhKEuuYIrT09giARJW1xsXpagnhoFjoXZZGw5Km6ld7sWN+
 4DcQuWDqxTlMVf/Kf50xROpZyQyIn5aSiipqlM1+qqasQDy+XBQWVbGdJHIpW1k8nU1P
 wFrwOy6F/WlNAL3dnbRyncicHaU1cGY5sRgtg3EuLUMh0imQnNfPZg+30l106MGHPZM5
 Mk5JpXulJE49KMx4BT57Q2fbR6h1ibZVTCqny4n8QXzGoVT24eOONKEajGPLTqGsPdkn
 Hsxg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781875942; x=1782480742; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FWx3SQsaaZvP/ihMY29sgSd20PLBhVOnHyRpXFlR+/A=;
 b=vPvjqtL+ZMDm09fJlb5035yeeoBEktTnMole2u1f8iyTmtYOGfl2ox7Ype+FxYntlR
 +U61R4NNB39OrwHvZNzCIfX+ziFvCjOBhstEVOF51zxbixqHKxallq7Y4DwixGceEPb1
 CMPaClAYPGV+mFXWJdRlJVpOVQ0BBeJ/fJ3ab8hpqVcRA90g0c4lpdjtJbg7xvm2YcZU
 WwJB/Waif4krIQojTVQulJOe8mntOdllSujODhy9ryWxK5gA9Tr/Oe8HZH5GR9bqFOlO
 XYIzM6PqSzl3Bnu5OoYpwTEisaHwQLbCxz/4JJSPO6zi45izBN+wLnNcYIBg9jod4HET
 8O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781875942; x=1782480742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWx3SQsaaZvP/ihMY29sgSd20PLBhVOnHyRpXFlR+/A=;
 b=Cbx+VXFsCXFikrOJizSKS8qh7LSCJzCNff2vNpV8Ceir2u/Cc0n1eaDt4QKYhglYcO
 HPxXp4MsR41cRhu4BGffNNUZxxzWV0mSHkYIsj98VzSmixZf25lT5Io0AocxRcZEY8wS
 GQIH4oY/AyImb49/6acCRIvVfeURIQzcavtddVOw3m/IrXIzSCOkPUbC7YrdKHOYKLE+
 GhmQKmpzO5thyxYC2wSwlcMk2XqYniEmBclFZqdcgyk2vXtGj++/5YdEbzx9BeaE1MkE
 sdLfbxSnDd16U+YbNQ8stoKCcOUG7EprQ2RI5eidYuU/PSySKc1b0F+pAcV4jdNJxVg9
 GUuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8TE7XJeegK5zo5T0adbopi0J0a3q/SjZeEFerS2OxoTFoPNv9r/94jwSiNVzz8QAerqQOarKcSew==@nongnu.org
X-Gm-Message-State: AOJu0Yw++RvkCEJMwOu+cbMAlpSPKHy/z6POV6nI4YboS47v1ew2PEIh
 2ihlt5l86tdMd4BwFKwQWd7hZeD01Dt6hd8lzw4SAsAjhJVFl1tXDR3TBg6Rd1Ex/5WdXo+W3xq
 zB3vS+2xi3ry7MOCBHIMx+koGI1It2yBauioxN8Ri2w==
X-Gm-Gg: AfdE7clVdXmd+c+EdsTv8oX4lyonxjoIVPr5kRgeAcpi50PVxTouFjipC+GupmskWHs
 ElRojmq9rIKZPQz8HOAu6NqWGgQUOG53qGGGJE+68MvbWygB8Bp5lBpqdKULP9lF7CJIDml1va/
 5unqX4I5mbp1dFLByfq4npdbcuxoJlLP501k3QasM9Lapgs4Wv+2MEJ28woJkSKRIz3AxS/Wiv+
 bQteQQiW+8NqKd/s4rvqNZu1uMXRe+dQLkBieXToi6KWtfclDZqoek1CSRjW+JNcTpL5zYfSfUE
 1qUg704mWKkGqR2a1GvX/TMAQqGhgYRwi71fSvCdrI/vO7zZxKI4fiR9
X-Received: by 2002:a05:690e:4894:10b0:662:551d:b987 with SMTP id
 956f58d0204a3-66302ef7ff2mr1562872d50.12.1781875942348; Fri, 19 Jun 2026
 06:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-5-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:32:11 +0100
X-Gm-Features: AVVi8CegvYBPu03QvBx4q7dcEq-0y1AGq_DMN-DlK2wQpyhem-MDEkYtWquuGBk
Message-ID: <CAFEAcA9Rs4HJruPbDqQBaW3-=JLsAdf1TJGjcCse3QVfv5f4Fg@mail.gmail.com>
Subject: Re: [PATCH 04/10] target/arm: Implement FMLALL (multiple vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Thu, 18 Jun 2026 at 05:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 1 +
>  target/arm/tcg/sme.decode      | 3 +++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

