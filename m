Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5294AFC5910
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 09:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvXnI-0004RA-RI; Thu, 26 Feb 2026 04:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvXnH-0004Qe-E3
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 04:36:27 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvXnG-0004w7-4c
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 04:36:27 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64c9a6d68e5so390947d50.3
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 01:36:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772098585; cv=none;
 d=google.com; s=arc-20240605;
 b=T5txN8bPhZ7yhncBAh3qQjRpOjOxZci7n+GHAH9zPi0ie2uePptiRiBz/GOJJt+/Vt
 bRbQrTqPHH1YxWviFwnimsjBubR59MqYpa7Rji82jiCDon7XFCMT7aXhK4CKEaW0R8TR
 WMwhyeIXQE9AKhZWKbaFfoULk43fC/kx9ZndQSd+ApmjUqL6movqQDFiaDMfTMp6IDqP
 N0izkzpaalEYjdM6jlQn9KqNUWfzdj0/8prlJPkuV9+RlEe+2u6glR/Q9XdKkFj5jANw
 rrgyIeCsuObjCNSU72EtVRs1WYiU6H5r/SGS6voCriiX2rTP9cp1oDi7DMNacSNSb1Yi
 z3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=exFFOi4y79s0qeH9rSljmah4q2wm8qi2k5fExASL6tI=;
 fh=+QDYs5mTY1UQ9tGYhqSqP22aiXOv1PLmNaIEtdekkys=;
 b=UJNFPBeOBZXAprNNFMqOH4iELgPVNy9MfLy8gt1OI4AcNejCHIpYdCHZ09AoJBBUZT
 CbCx/+tF5lyKgUI70wOtHj7yk4I5lLH7vIiJ1jOjhmC/zUPBz5QiIUldF6F/XI8DdnaT
 5F5DadYAE0um83x5sWdXB9bmg7NTou+pCVq8+IoIs7iaOhVLFCC3isSMJEuDbFWwgVCc
 +Ok8Y9QAxYtMUTtzjlZ5RdZWs5Sn/BweTv7lO398IeG5toMlxXACSuXaNgKY3yhSWMoL
 92dLTIS2pUmfVlRWykF68l41hNlYyhU2hGt7Wora/1USiD1+PlAcvyZOHzoE9w1nxulW
 a+YA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772098585; x=1772703385; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exFFOi4y79s0qeH9rSljmah4q2wm8qi2k5fExASL6tI=;
 b=m4Tn7FA4Hm1z2HToxDFYyVf5fjvKGBAKuCOmdqZoICPEpvLJngf+2Fm/IDj9qBZ+jn
 Y9VrXUEBR1itbo28d4qxUydIcQZumPasSoPQqlgd3H7Pso1KOmyvFo53xBXs5+Tm4Ur5
 M8pq+EgVet8Duw43rie0OPK+UOXaSqu9r/FMO37q7R6corInXolCiFsi3ZiEGUcN7khl
 gb/wd23Ok7OU9RRP4tLNaCLIeEQfAyBJUSrbjhasU4t8JoptGG7UBSkdiByNXmubU0yX
 nQt6ENa8fgF2jAdO8uu5vMcIgm6/KKDCTLoYrLETbbNGAo61tiTIAfI87CzkjeVHX4qa
 axTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772098585; x=1772703385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=exFFOi4y79s0qeH9rSljmah4q2wm8qi2k5fExASL6tI=;
 b=GOkMdBYKXseW4AZ4+Pd6AKnlDiYFc6m9XLXPmz94qYXYKwcTrvrz0bNeyOtRBw6/lk
 kpthDdzRlsMThJ2T7kiR9G0yzdDKms0HHRS9NBQygci+Qwc3fsuJK8OQ4jcN8MwdQOf4
 F/EUoGwsxXCf3jn7XEDd403liZlNS+PnaMsTVXag8VObRPPwX/wephliyC6l79+T2g76
 vIeToFbzhtth6EoGl/jww+vEn/HdqR20th14sUI/jbxJQu7KqPe2y7zUw0oPELNxbJ6y
 XY+L/XGWxzbEvEnKuIIWzmdd9BnjzedpZLFJxtWBqMlrUvNg6hQgymHFySHZ6zx+QA5k
 Kr3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4I8tenb40/EK8wQoAK/wRBopXQD1y9bncNPTPlcP0ZVpjTXrGcRw2xzJFTjWHQHgtZNuD3c3A+w==@nongnu.org
X-Gm-Message-State: AOJu0YyUiT96P6eM3skV5Qv0qE5gyEPQfiU+pSxgtMqbP8V5s4hzIlct
 tN9rUIVFXNkyv6ied5zNeIW+8Vk9/w0QZsdOBeK+RBEUiLOqmpSf+X0L6Kh8v46yjQ7O3HCppCj
 mYo/UxaEWIcQMcHLSad5iK7fEa2FdO87gpSVWWmcGzA==
X-Gm-Gg: ATEYQzwYbbI6x1boSwQDQQ7IhrbpfX/I3TLL1+0wENU5f9iX3l+zvvE2YpluhLhRCE6
 10tMHvIv5s2y6PDNq+mzEahEYxeIdpYHCYbchzmVwel/ofQG37dGkPKn050Ft5JgTaONFECtj58
 KUpXK4PiSOtvte+qVAU8hT5xaW54ijyaTfLphTWFwomStFXX1g8EHrV+cvaHQSaVzsLl3ACng2I
 n4grh6ICZNfoFJ1m+8j+pKYgzjDUBA8Jx14gGPmLS4kWIxsVC6C6iIhaJnFMcCkLpELJmGWgZQZ
 0bDfdfKbSZty5jQVUUfQEyAz85Ae2hGCfqZWxXIR+7O35UibkW73gO1sk1TyE5U7t+o=
X-Received: by 2002:a05:690e:14c6:b0:64c:a7d9:e1d8 with SMTP id
 956f58d0204a3-64cb7bf5664mr1110052d50.15.1772098584806; Thu, 26 Feb 2026
 01:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20260225034720.41495-1-philmd@linaro.org>
In-Reply-To: <20260225034720.41495-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 09:36:12 +0000
X-Gm-Features: AaiRm52M9nF0Hng6UTx1SMzEjHsh3PnEsfl5i3Ul4X-5bdYVsfulD1A_WQyHhTA
Message-ID: <CAFEAcA_gg-t2zwmQxf3Lunqbqcpmo7qyPDK80q2jRLiTwyPE2w@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/allwinner-cpucfg: Remove use of ARM_CPU() cast
 macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 25 Feb 2026 at 03:47, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> allwinner_cpucfg_cpu_reset() doesn't access ARM CPU internal
> fields: no need to cast, pass a generic CPU pointer along.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

