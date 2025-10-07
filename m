Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1C6CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 10:15:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64ih-0005sG-T9; Tue, 07 Oct 2025 06:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64ig-0005rA-4Q
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:14:58 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64ib-0005oX-Dq
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:14:57 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-71d5fe46572so83477067b3.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759832089; x=1760436889; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hCOPQgFfIrKcPiKTSIcm7cg4tw57aIbT+DFvw2tpPeU=;
 b=tXe+Y08Qgq7iOjH6ebyqO9tJuEjxihQckLrifrraQQlzwvGrgTwYETJndupMolXPqj
 W5slKA1R86cKCQZaJScS6jT4L8qRAU/Q9i+OWO5MIj3J/x8YwgKngVzcQTgxGBfVnYpn
 8n8/+xUIIzZzvStQstqd1aQaN5bMxizTvhXBzMD8fvcvCGL+LFI2AighYFLv0fL3blyi
 zty+ILgjvYUi3W6ltpztJ+JxgHfHrSfIz82kom/EuuAkfbWC1O0mjNDSsNnW+KTV85AT
 nhWNxcdpClsL1vAUpMmmgT6YlTqQ0ETBE5R76C/H4EWdFFlcUftAiL8uW4zwKbq3VIpF
 uozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759832089; x=1760436889;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hCOPQgFfIrKcPiKTSIcm7cg4tw57aIbT+DFvw2tpPeU=;
 b=KrKQbYp0ItrPgSwTCHBJdv8wObGPRNPtL4Sqk+zpu4GBmPoqiuAxPE+VX25eAWL24Q
 WbvJ8W6t194Kee1iAAbCGVkNy7SO72jNH1p+4Tc3w9j7A6iRCzLSlZ3wHfjh6vgn/L7J
 y8NJlJhYTmFt+L0W5q/TCQ9QSxw40znLvFEfUA4hp9jc/soN8ANsMz72pSoDOk58uNF9
 yaHiZj+pLMYPFYuZWz72RMHPXMVVyBUCqLUgIPm8X/REiD3Ej72dD5w20yXODUG76BxO
 nsfQqNUXgsmaSkGb7BZWFwQEi8jkSOIf6HBjA1rF3renY4q1ILSD26ULUDrexf0uqNHB
 4p5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+mG+jIv4hEUPi2FYyvbOE8YzF+Wqfp6bproCnuSPZZlCzcniamx3q+9Mzwbbdt67v7pRyv39kaw==@nongnu.org
X-Gm-Message-State: AOJu0Yy2FPnui+RXsqyHDCwVUAwO7sAm8Jw20HKc4LXeJKy7zbCRBegI
 xkO+lIa3ERRsvjP5RrqOiV0RkaKfEwvv9GukzO0yei9dhGAgWUtgxOuFvoMFUfMh4dEF3N7A5ya
 MweHeKgZdamBWQUnhTt4XybXD2MfB49ybQtmnfH+Lcgrj3lvOv7Er
X-Gm-Gg: ASbGnctesIK5H8DNP3cq5gvt3QtJmY/Pv9h431jMHlQTLWe7ZNkuB8XrsB9zq3Sila2
 C5cHZN9i+E9xKxFtW29dO5FrW4vO7Ek5SGEOJOQ5Nuz2e1cWsKHZw78N/1qQbKuKkhBokQ+hNkq
 rvC02MwAlFyVyv2Ya+oNp7sidVEbodQjCrc0DZCUtYGVvCRS+V040wKCJTtbNChIZ757fl0A773
 nMd2nh61nS9zT66e2lcFavxu7fpLq4PjNLk
X-Google-Smtp-Source: AGHT+IFpfMjKn+8aeWKpoWtTIo5pEWPuzHYO5Vd8OikhHmGrykFhT2iMzrVWHIF29hJxGNcjBbOopE47SK/yDCI+foI=
X-Received: by 2002:a05:690e:2d2:b0:636:cc3:af35 with SMTP id
 956f58d0204a3-63cbe13ede2mr1946421d50.22.1759832089102; Tue, 07 Oct 2025
 03:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-41-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 11:14:37 +0100
X-Gm-Features: AS18NWAivW2avSMrlThYsZLutULbYT8hshpm8JbPCs7efEIMLxEgKh3OTAdtd7k
Message-ID: <CAFEAcA-XoDckJuJ-6pC3_JrxmS-x7QBBe-Mtnvqm17Xq9oCFXA@mail.gmail.com>
Subject: Re: [PATCH v6 40/73] target/arm: Split out access_nv1_with_nvx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Fri, 3 Oct 2025 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

