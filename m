Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1201477lft;
        Fri, 1 Jul 2022 05:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vDZVQzFJ+CspNOMlMz7R47hjECvhPS4PkWmGQMTjgnR9jKNVkEit6kgkRmnUzuIKCOJgu1
X-Received: by 2002:a25:30d6:0:b0:66d:350c:e641 with SMTP id w205-20020a2530d6000000b0066d350ce641mr15637621ybw.379.1656678464718;
        Fri, 01 Jul 2022 05:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656678464; cv=none;
        d=google.com; s=arc-20160816;
        b=NNtbo4zPXkhGUsEOLXphmP4FkOZPmBvTRhkrZaXtE3LxDac4XsbStZcTJeeQsIdWqv
         s5n/b7tdLVNQcq71EGvZFqzraFt+vzbBhago88N3/JPzp90YoNRwsf7Dl2x8+4Hagm/K
         Uj4VUxs3kCy3INiCxF4tZJuFslvWMGpgRaXpkg1ymxhtSUnE9Qb+sZE5ueX/AxRgcSuV
         LslSmyuUx5cjlVMzAaS2M1ESHzT+CSHLxoB+LkABnkzEdakPpppwUKC9KWcbZErdLTE4
         +A32BOciomdgSvSbyonDC8wLw9kC6aOCLAWGzfPgylFmQTWXLEEwZRqkkEaV4xNdahWu
         tDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V6Aq7vkZup3TLghKXZmH6o+sQDcuPS2VK/HU0c9D96M=;
        b=cjoNOf2S7BI6/h3jYkoephIfdxYihJ/lNMFjnkttcB3OnfYRX6r0Kvbrdr6mOvW5yJ
         3sjJRHwLCi42oANDed2tMMZIVjynrcJWlfG4wEg+1j/wQfBOlYDYrkslwaNtDI7SKv4U
         bHNyixzK1J+0LEZr7b0z2FU4GV3OmB6JJ3VZJumTF7uBiLnFSpmG8pYTbWcoiIxw38Rg
         rIh5HbBaM4yIH8SXSoMhGkJn3XMjnNNVgQQ9OIZ1qDuk/VbZijyVmINndP1HPrqlb2gA
         C4IiY/4zswNQ3ypjGLgPIayY807MV5MvljQmMSj1ZRFnj7Mv85ssdXXRle/c+z9whQO3
         2tvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EbLsKfAS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b128-20020a256786000000b00668daa7009dsi25478541ybc.91.2022.07.01.05.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Jul 2022 05:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EbLsKfAS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7FkL-0005jh-30
	for alex.bennee@linaro.org; Fri, 01 Jul 2022 08:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FjB-0004ri-EF
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:26:29 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7Fj8-0004iV-Uq
 for qemu-arm@nongnu.org; Fri, 01 Jul 2022 08:26:28 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso21832697b3.9
 for <qemu-arm@nongnu.org>; Fri, 01 Jul 2022 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6Aq7vkZup3TLghKXZmH6o+sQDcuPS2VK/HU0c9D96M=;
 b=EbLsKfASIE+Uqpx4B3exUtlxPTOWyFd0PR+Pzhr87D5jQRQP6uUYqFw8aGq454m1WN
 EtCfu4KMr41XXPPFCoq23GeR57XsA084hvlLwm41KDeWdIvjciZFBN1rFXs7kxIUiDe+
 fbzhAqwpWJvWlfwZcSOiRW7IpcdLlpy6rpo1qfPO6Hj0aGxES36Mt9IXWiH8j4LS5jwO
 QTViZdP/5w0Sqezl1sKSmAqgwXE7TvPbzdxI3hnSOqouyCjizQ6VBqhfx4x/uo3FE7ZC
 doORwpd+OZcz3o75yHtK5WQIEDJR1pY2GSLPKldXfu2rUBTHoY3xK/dkzdiWEidrRRRR
 ZSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6Aq7vkZup3TLghKXZmH6o+sQDcuPS2VK/HU0c9D96M=;
 b=4zuCiRjyJRacm8Z9ysavirz1Rq4KSTXQ3UebrVtuLk0cSOk4ifm67SzhZLxY9kPzT+
 +uowjCvQyds87tVf3YbULOD0/nhvc0+h4/42oCCa8ypRjq+II/ugpgQ95/+CEyM842ep
 iZ/iH0YNwMBqns212wHXeqceJq+FrqhQyeGKEYB+KqC9E7aPQvd4SbpWVlezE8FBuF+U
 8iYfOb8+1QdbvNAxhc3YkJE5t12uFFAMEFyPWEw1RtYCDrfDJX7DbbJ3PBOXN/T3U1ok
 mOnarReqqFmIlfnrH29Yzdpgi16348VLMh3jn/e+REd+QkksCfwuiGbA9CF68gg2AV9h
 VTtA==
X-Gm-Message-State: AJIora9mO2zVn6LUKhjGoeQdZkiDJb4bhLYiOtWWE6sFLPOAcqpRGq37
 8TQfc3ihy27F7r3Z6Im22SGkhBuO+lcDxcSYb9KBdA==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16657804ywb.257.1656678385863; Fri, 01
 Jul 2022 05:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-11-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:25:48 +0100
Message-ID: <CAFEAcA_gqDJ7awdLwbb-a5Rw+8FfU060NdLShrXg5FVs7W=SOg@mail.gmail.com>
Subject: Re: [PATCH v4 10/45] target/arm: Mark string/histo/crypto as
 non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X7Nqz0/7QnmS

On Tue, 28 Jun 2022 at 05:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap

stray "a".

> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
