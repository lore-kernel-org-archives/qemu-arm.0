Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265E7CCF2C4
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 12:41:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI3iv-0007Yr-DB; Sat, 17 Oct 2026 08:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3iu-0007YW-3X
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:16 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI3is-00047a-Oo
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 08:41:15 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b0f59a5fdeso3102177b3.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 05:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792240873; cv=none;
 d=google.com; s=arc-20260327;
 b=QdBYAASrUGm8adN12LaZ5V1a1oKlncFZiPak+TdSMEuucWCk9p4IAv6nQWQH4JbJ30
 lugfZAtneJBV8SMmbqY84/QtCfZ4EmqB5EKWptPNyP/9LuwQ/jZOpDsv+Qf0lqNWOjjR
 6/8cxaK49MD5E65Wm+U+Ul+giLJy1xDjKob7X9mFrCyoeHf6EaCjQFFUBPsAa7nW8nPJ
 zWqoTu14xzg1ofe0avMeW8lURPOlodWY2CLmgdkjkQZVjXiADAulkXHKnnBIlIy0Ub9P
 iuAqF5Y4Q7isS4PcEXBr9j18vTbOxZFV9JfSf9/ZXbY9Fo3u7nYUwtbB8ZqVS/+AKoef
 hKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=eQ4uXyWKz4n12BhIGvymZiStphOTlPHz0IVI/q2BL1A=;
 fh=D06zqZPu22nz2g6MNHi6+8Pk734UIYuRfbPANWhJhq4=;
 b=c1iEv8xzcHHQghCuJd8F1TnPhsBAgIndCCi9hZ5++7Xl01SM5vUjEky6kW9rmbWAVl
 PM1NQtpPXtm+krRTWgYkmn2SMAI4st1+e8eDJxtESRPGxYxkgRTzwHFAcrTEJEanswXu
 2Zea+5lTS/3ze4be60FmLd4rfqEsPVh/AjwID9ek+LZGnMJltg67pWdDrQoX5fQdfW1m
 xDZTdLtSBbROdKYecxmEjR/BCUwIRYOu3uDbqBr1ZMhlNspG2aZoUCS0WNpFyZZzdqhW
 nZwvuEMFwmMr1ptWz7qxd+jWP9J5GqtyJtyBA2J9HXQBGza8+73iSj89fF8FeW6mgndq
 a9eQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792240873; x=1792845673; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=eQ4uXyWKz4n12BhIGvymZiStphOTlPHz0IVI/q2BL1A=;
 b=w893OpVisqBKqulF0tV6Yujo+v9i5uHtmc9DbzmcH78v11mj1zFog5u3N75kTARSKa
 C4URcVG/pN26qu25rATatHY0iFQzWdc6q7r9ENJtWRkGqHnfme+zEgYviA3X/Tbn/PGR
 bQT3K2O4yHBgU8JEboMOSXumEMRQd6RG/Uqz7hBTXAEKbIbq5jGacGGg+NCQp31w+947
 63Oq3O/2DYIKsmknQSU6BlhuPYxONwR0/eSwHS0RWMGx9kH1CR/kAhQkAWaxOGpFylcm
 d2lqPKYafg0QlbXDDjqym2ADgcYWNObnjAUEnujD0hWax2sDLOZAB2901T+7nWBAHpkV
 ow9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792240873; x=1792845673;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eQ4uXyWKz4n12BhIGvymZiStphOTlPHz0IVI/q2BL1A=;
 b=HkM2UMAjikT2sCeWJYw2ikrHyP1sjo8NpuXvjL/mlIbp429XSYiJucVFCPmOmYEQCt
 HCcVkmlmJ7TnoR6VDtlxNU5Xk93h6AQp1LQc+1kK/JKpR3wEA/V0+1hxQoal94ME+VRc
 juW3pDva/VlQqwuBOBMV1iDrWYBUKnmsjXFxiR3za6Txr7x8m+Ybq4WhPvhUL+jPpoq2
 jx+xelyVeMFMr9yYt1QsxmS5iJmLy9daGHqeSrWdloCwfRJsZB/pqjodaI3JdvMwK6si
 4UflXA6dabSy4/2aNRtj6rLFgJc7dhGHTrJI0XC1K2UxsvyGxgPbqAB0l8jorHB9cr4e
 ZACg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpwvYU/myhFbI9tu4HmWSjUOTuAwTm420RjCOYjpK1TJjgYTFifqjurOsKD9NBBYcxJumqJOTV7Q==@nongnu.org
X-Gm-Message-State: AFq9FYJ27HgLKfV7FE82lCrNE34vmk8XttAj+oileqDeO14yci/+rnr2
 7a+jdChOjgVkhmLM3+Hae+GtxvKcGr4qNGjWZzfWNuufOGl8Cta3PYCX3yIufLxt9q1DlObEDy5
 RRYVG/ZfP3Uww+1R7u4UL0LQgTJqruUkHwqBUrqwNVO6myTyLQM5zlcg=
X-Gm-Gg: AYBFou0Mt9dEZD0OO+f949QY3MGfE3fO/EJl+LExNdzxvV3QFUGBymZYjZ5vIupDYxi
 ySCRFeD0E1/ZB8akXfuKGJ3HO1xWse4hqYC6saiiGqs49PYiXLzSA30mrVYnq+9AtDVFBJU/q/M
 p7CBVDMs572QvQv4LaFx0jRGe/hG9tVjsB420t55/sRhqDYQIwJ9nhIaygqV2JFenMN7tNeQ3xq
 Ee/AtMm5Rshs85LnF2KLluCmrBnV03P/HZOW+QGgucIs+O/lwBtvgVaT0Ysg2bJDyuPK2HdSJVD
 qtNVeN7TEBI6IDdsvyXXqwI7MWpMExET8oDNBkvE6XLZ5k1VbTSnVU84TAQoAYdXgNnEvATGwJA
 3kKrK3iuouGWG78XR+JE+XLpGjZYFB7dSYCpvVT8=
X-Received: by 2002:a05:690c:c4e2:b0:8b0:9409:5ff with SMTP id
 00721157ae682-8b0f21f78d0mr10965137b3.47.1792240873426; Sat, 17 Oct 2026
 05:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-6-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-6-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 13:41:00 +0100
X-Gm-Features: AclHuK_o6dt3oJ6AOKTeKfU3h70t4IDBQLOWhVeEWUh42UcGMqMxDwFrc5HBQ1U
Message-ID: <CAFEAcA-dDUp87JnYVZjTnd6TMAj7nMSSGfjA=t=-=PgbU8ah_Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] hw/net/bcm2838_genet: add GENET register
 structs, part 1/4
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Sergey Kambalin <serg.oker@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, 
 Jason Wang <jasowangio@gmail.com>
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add the SYS, GR_BRIDGE, EXT, INTRL0, and INTRL1 register block
> layouts and the top-level BCM2838GenetRegs/BCM2838GenetState
> structs, plus REG32/FIELD accessors for the revision-control and
> interrupt-status registers.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B PCIe/GENET
> networking series (patchwork series 829638, posted to qemu-devel in
> 2024, never merged). Carried forward and completed by Marcelo Manzo.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

