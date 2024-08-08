Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp470295njc;
        Thu, 8 Aug 2024 04:38:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9U4HCfIR0SCvCA0eBC4i1vf/v3+DMUR0H5ycm9ROdIqDSCUhacSphlPgiGZ0gqQMx2A7SK1BHTSQCkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFIe2JKNJIRgXP6iMsUfEEC8EmXcy5PYHc5HnXq12Do7LMpEc9KPJZ/AGPFTIvunvfmoXbx
X-Received: by 2002:a05:620a:2550:b0:79f:7ba:1504 with SMTP id af79cd13be357-7a38189235fmr149151485a.51.1723117119261;
        Thu, 08 Aug 2024 04:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723117119; cv=none;
        d=google.com; s=arc-20160816;
        b=XFd7npmyC6K2XY0itzwjk/Mi7ndncoPbhn2abqGkv5rglRgpzX+rLrm+vSxHTnKLU9
         zmrUTnVj7y8EavjVbvEfjclcaAyxOuiZBie+gVSw8sRZ0YAcmodYNeFf8RLw6155n7wN
         1rMdiJHZ9r9QNmWY1uJqAGO3EHC1kEuJ4hjruCBotiEi2WKvdTiCujeML2w2fs5d0uTY
         dZ938nvRTjh7SKc84UogCuHJrPXetyqZ0x5AjZmWnRwo0tGdxalNLxz016kRtqAhaUgj
         W+XRrEzscFKTpCHx7piat/E4QUi9XSEGuN/KfZcP9Ct7Z2ufgf4MvFaz1TJK5sOMh2HE
         J73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YfXmlz+nOAUfmRvp1CaDOvvOZB8WORoi1slNH71/UQ8=;
        fh=GRrQ+R0AH83PprzI4vLWVFqkoNF38fQS458UHuMx9uY=;
        b=gfGk5/fpyJVo0YL40qsNXSD7dMqpG5Gif7/J94oMTJrXZKxxQmxCoePJPFrDCtompc
         nPCTCJZnQb9b17WdO3nkDab05tA/Saf0uMWm+MxmNTLg7Qk/E0FWpr3vGMz/ZjURl40E
         Q3MoNZNw8QRSV7G4D0c4x3Vq0Csq5r2BD5IOZI/7xCydAhJEjm/kcW+crqvueKQzSkkc
         xEeicOsJS6IUlMWIYJkpJgWCY8m4GXzlxr7IJRh1eNFl6/dxknzUYZho8F0yvhtu0ZtH
         c62h2DJKyOpnrFWtd8YBiy4bvcIxUzLh6XN/8cOXqF5b0CFmOZ8Ov6EAlMEKu19qDpwh
         djrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKfrvAh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a3788482cfsi400995685a.611.2024.08.08.04.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 04:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKfrvAh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc1TN-0006pq-FF; Thu, 08 Aug 2024 07:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc1TM-0006ol-Lf
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 07:38:24 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc1TK-0006MA-Re
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 07:38:24 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5bb8e62575eso258443a12.3
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723117101; x=1723721901; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YfXmlz+nOAUfmRvp1CaDOvvOZB8WORoi1slNH71/UQ8=;
 b=zKfrvAh3lJCsm7t7xIWWhNWAWiAcSYg9AdzqGUQ62Ha0gPo9SDksAoFY3RWHiEcK0v
 uGHjVybYRJxWrwMWDG4Xu4MMBCBafPNHRmShyRnird6yXEHdWhK5RzEg/bJo0InQ+fX1
 ZD9gKCuBObS4AJ23A1IKUZfu5Cba0evdxpH5NWj5iQIgZnJb7XNhhRk1sy2e65l82yVf
 rLlyRaxCH+eLLTGPf44wA40sqYRuEnGChPE6lGprOXWpB2gkqG8jU25tUV2qT0X+f9pu
 JbcjzLlFwGBuMYn/3NQIep95IN+WkzGoZ48qbVwyBoa2PeqgLD2yEqNSPu7gHsmu7NZ7
 ecCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723117101; x=1723721901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YfXmlz+nOAUfmRvp1CaDOvvOZB8WORoi1slNH71/UQ8=;
 b=U3jlw+4A1z6JPDoruj2rYDnVd+Gz0lH0rsLYScgh2yBjRCXlbc6FGlDQhhM0aNgDez
 QpdG1c9QEGPFhEH5CAFettBrtvGr5wO2okQXn3LBqbSyMmofEK39HK7NWz0wt7diyRdH
 MG2hJ/nNhabSkax0IJv6omVHbdH8HXsqFyG9gLd2ZpdzeGfCHntH/+CFtUeWHVLEkzpm
 hXPYl8GJmsX9MN4mhG6yL4Oe4xPncVC0BJXFE/I+75lduOfwtS5M7FO1whoqfp/JbSWN
 0N0B3OPxZuXur0nc2nJkRU7pAkLfqKFmsEsx12fKNcsju8/SvG3Iq6jgzlAAUxu4tU7h
 PEOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs7/12rQasjAUV1XafknIJhXBU4SCoER5piyreI3BsiK41e+stQt6eb9MZA81iDHK91Nx/lSbirg==@nongnu.org
X-Gm-Message-State: AOJu0Yx56FhFKq9QuCS1JTr5kn2z9tKrhbJc0yK7taZIupB28yFEZNxt
 J30iNXsfcSdZrn8GJTGyT/aZrJR+Cys4v+XskvVWTrQRuzJhxv3itME+KbBCZq4qziY1uq2oy/i
 4hwgjHnYZz3ebdt0qi9kdATic8E48XR3qW5NkcA==
X-Received: by 2002:a05:6402:1d48:b0:5a2:c1b1:4d3 with SMTP id
 4fb4d7f45d1cf-5bbb2458b23mr1507790a12.28.1723117100473; Thu, 08 Aug 2024
 04:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240802003028.795476-1-richard.henderson@linaro.org>
In-Reply-To: <20240802003028.795476-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 12:38:09 +0100
Message-ID: <CAFEAcA9h9uD+J0OZ6Vfo63EhSm3WnPwXm6p8fYTC5OC+cS+GPQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Fix BTI versus CF_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4ov2F8D64DFZ

On Fri, 2 Aug 2024 at 01:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With pcrel, we cannot check the guarded page bit at translation
> time, as different mappings of the same physical page may or may
> not have the GP bit set.
>
> Instead, add a couple of helpers to check the page at runtime,
> after all other filters that might obviate the need for the check.
>
> The set_btype_for_br call must be moved after the gen_a64_set_pc
> call to ensure the current pc can still be computed.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> v2: Enable unwind from guarded_page_br.
>     Since guarded_page_check is called exclusively with btype !=3D 0,
>     it must immediately follow an indirect branch or eret, so cpu
>     state is up-to-date, so unwind is not required.
>



Applied to target-arm.next, thanks.

-- PMM
