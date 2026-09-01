Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5BDC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1Phf-0004rK-CT; Tue, 01 Sep 2026 10:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Phb-0004qJ-ED
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:43:08 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Pha-0006Pg-2l
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:43:07 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-836cb2fa1bcso47293317b3.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273784; cv=none;
 d=google.com; s=arc-20260327;
 b=A7d4gKgk4IDY9kdR5+6V13IotgEJM4yNfoRt3WuctZ5za1q2maG9p1AurgC6hvKdqp
 DTMFuZ3iJ6cBb7xdMnq8YRVLc4U4Pt2dOYepeLtYMmAM2WVX8I+8Ai9Zr8tnAA1PwnS3
 96NbiZ01kc8WFJFvnlfwTB5ESTyIsCxI18DiZn4ogSfAF540cL6KykpTxoV5+WmYJf3Y
 jypzvcGd5yEBP/85T3MZ+ugDz3qDhJ7KynumwSo6IQKV/06OuCP4Ytcz17luMFGqU/OO
 C7sGUUmpk+eA3MwUOKzU4lwEdu4Js8+UgpScgUonbGbf7p6N0+x3OOkPxzFMq3LbY1Mj
 cHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QO2CmtSZJqRqK5aZrDGJlW/UwjtyZh866PfxdVIqIuQ=;
 fh=fnHif5dwXgu+SSLGrd5fXa5WSGFzu2evNZSIMVf3AOs=;
 b=Oe3Rfy5SyFO1kl6xxqqypwKfpb90eqeCS6MOVjTrh8gH3vu3wgxURpHynq38BaQHRM
 vxVjWuxzixyxG3zEeEoKWB8HiAN8Vevlq7Uirn6QPlG2eTAZBAPsAUdeKRX+tC58Tn/+
 5zYPOyr2wPlAtMpSAma3Sr6RmHhTvfny2dkeMw+VUmyVup2VxA6yEeAcC2XhhvcMS/Mp
 kwHbGswuq46NgzUyWNZR34UX3cMJMpDpLPrWu3R8QDS2zccEu6GlHjDT+K6s0nPNjCHc
 xJa53lWogOyvbjNZyaMuY3DcAAjmUT9Lnu1TFm84Gr/hnEegZ8zEJKArpi1pyer1pIB+
 xd2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788273784; x=1788878584; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QO2CmtSZJqRqK5aZrDGJlW/UwjtyZh866PfxdVIqIuQ=;
 b=uXvD7SMGEXx6PRUaPe504z3NerunQGVMgPA0FaWdmzG5CiQM/SyCdQPuXUexcZ4P+c
 CfqeB/hIFQWRfSELcMjjqPYxFwXChbibJual5evgKhTHS1Uv4sso7DE+Sah2k7Nkqnqp
 cL5JADGyOvVNU0zkU7/sUI+l93ZER0QPDv72Lagncl6XPyxG8tFbFkFKUA03w1S/nieq
 jfjsK8/VwuIij9mYema0PA3DcRdqUoqb8qCnKeZEp0qqsWQVruxxxvlnw3ewybeqoOJN
 AcYoO7g2xU53kwa1nhgoGdU2hXv7P1dfrQqSu4D1/7AA0khfwc3bloi4M2CuB6oWJ8rt
 KR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788273784; x=1788878584;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QO2CmtSZJqRqK5aZrDGJlW/UwjtyZh866PfxdVIqIuQ=;
 b=I6IE6zKbQ60lFA2qP9sxd4DpdchaGvRxp3iohZ8GjkfgvZndyv+UMC5d/RlUcX8oNn
 je2J88SHyZdwWKjnGYd3bR7g9lkQbK33x+V8zXp87JG5/L0Ge1qRkdsnmtsgReL0TxN4
 Z7aW3mYRMyrk9ZYGMhSFaXVfnMTNVPnnUfKMaH4elgELSehO+Ttbd+FKt9CAvc/Ocblq
 zzyePdn3o/xnY7r+JoY53xatvgnRaZ9c1GgcxGm8lOFdbz9Leez0SQmjAFeenwmWLVVZ
 FRtnWIzFYNQCfC7Wiz1VmTiKq9x53mlBT07pooWyPWAQGHjRtuY0LG5eO6vorEKByJkG
 iLDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBySlCbACtzpu6Rik5vYk7MrRQiYmuBkz0ZD+3tHlGfznuc74gKp+xyPL5Z4x7wWaAI56InZSmt/Pg==@nongnu.org
X-Gm-Message-State: AFuF++nMAH/kRjsqZPrzWkmdOV/0WtF3sns4AS7AU4DIDhjnYB4PcJwn
 SupfQqQU4LdomHVh9ywOIVbMZWzLoRLA6ZrvNNiDb3bdYkqApCO1TYQ26vIe2WdNaEdXwK9mVIc
 doP5BHbFy4Yyl9vWigWMKgVWO1U+lJVi27ypQ3VYi73tOttFlF0/8OHM=
X-Gm-Gg: AYBFou1jOXNdnDqd8/qG4w0kEYuJ2cj1b18IW3eIjCx1im/UOswuVcTG+3iR4XCikHv
 ihnxxUN94UwQ1GmrOnqo17iDDP/6ksncdRhxJR7KVXBhlElSXTFksRJc0jQkk0qQTvp3rbTdi5j
 mhzDmPhFe8tCVwf97RSwZ0oK57NljnrxFzp72FKYFrkBkIVzBzPdpCiFxTo+UkUZ/ckV0ErTBvo
 A4pAAbL5OpVj7P04yxjjZ70Y0GlZSilnlearPcqjitN/osx7s0aOoU3pgvk1L/UqmLqNktC5i7y
 aZ/9uHcZwhiqQs7NNcPQLtJrjpdvDTCfWNxKtQP7Ehuv92+cZ+KbVZOPnRQv23k8+5i1l0i9ltY
 75xRCrtDMTnEDUhI3pGddkTeFL8tP
X-Received: by 2002:a05:690c:7003:b0:85b:f1ba:b076 with SMTP id
 00721157ae682-85d6a7c5a18mr131247437b3.9.1788273784203; Tue, 01 Sep 2026
 07:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-6-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 15:42:51 +0100
X-Gm-Features: AcwNN1UoQR0KODSwrd0TZhPptNbegPArztbJECkLwRb1SLvhT8Z5ysKRnE0jX3U
Message-ID: <CAFEAcA-+AJwEE4MOw5WgA-RgD=8bkcjcMQc+_9wkGoDUXX8K=g@mail.gmail.com>
Subject: Re: [RFC PATCH 05/18] target/arm: Probe second page earlier in
 allocation_tag_mem_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Sat, 15 Aug 2026 at 21:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translation faults have priority over everything else in
> this function.  We were failing to trap for the second page
> entirely in the user-only case, and when tag access is disabled
> on the first page for the system case.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

