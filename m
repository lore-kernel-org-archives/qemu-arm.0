Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08528C54F4D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:31:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojmE-0006Y0-4J; Tue, 28 Jul 2026 11:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojmC-0006Xb-Fo
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:31:28 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojmB-0001Tc-5d
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:31:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c15cd3fd760so428246166b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252685; cv=none;
 d=google.com; s=arc-20260327;
 b=U3V2kL4hLjmtooffgXY4Jqp3So5GagRmzADPBbEIrYAqUxKSLSfXLbFJnO6ycKwIGz
 NJUJz9aJYnhYkPsDp1fhs620W1ahgfbufL43DFou9ZWIx+XIX2wuSVx0Wk9VARWwpSqt
 MgdF+jLEoKtaY81FawEG0tzb9FYGNtO/K05Va9lhGrY+v8C6onXLlLyg0to6Ll38P8tA
 PAGbbEqm0zEQ+oltwvw+0Teb7uqNf3RCZWFJrU6Pbmnk4M/+92+OBG6KXllE3Fz/CHXu
 UXivm+GDFP59g3Zy6g9OSxhaj4laSsLtiQKGKOYMAkLj4XqMdNRsBMEoUuU5WWMBoB3y
 H63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JD5E+y9qy4TbcJnbWAMo8UfKZ6hCsr1Z5zR4NiSyrEA=;
 fh=zOVpbzW/kyNQp4jKh9QE/cdnMDs8uMoG7l4CGHK1Las=;
 b=Wqx3rF0MQi3cM0u6bQloIehBNCvDD/zGhXz8o7ogMfHaRtlvY1/52TMi/GOrx/Dz78
 CXadetejj1iYmaHd4kWMRtKQ0xeQmFKw0pFmMDlmWDznzeaajhEceGYbdLTk1jHJG16H
 F1hlrjY/DOf5leQ1uAE1eg0rMUmgbm3M4svXZWn8g245z4BGQEjg8YWX/49Yu6tBvljv
 So2gtC8lsn6FWvk4GVFgvegVQLH9eHF6T8bsJ85mQOSz16tiTUrGh+JHSAmK3SacGlzp
 cp+AHZa+hlZS1di/aHpmXsdVs6wqfIK2WQj4A0povZH5BEMWyhM6K307wP+7DFjzZ1Ty
 p04A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252685; x=1785857485; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JD5E+y9qy4TbcJnbWAMo8UfKZ6hCsr1Z5zR4NiSyrEA=;
 b=gCcuN33zxXakyqVkr+mBzzGYXtdBwqiOTbJLhzna/7ItGupxhjVwZkVts/d4Z3h1Id
 FItB+mBTNOZVICTqeSXR5KKrAh+WDEJVZFu9cU5VmupbFQzz2Ptnb3X5cHXDQ2tyPuWw
 SGTbQZWhM9mfAGZOKPdzWCsF9XAOcEbNN56D2WpZ1YJfSDEO2QRS47QNttpb+QZCXvMh
 4hpec1ETokLTkvpcJNAiWJMSUePZMyd9MRR6EZ8703bBnDHdfApcKPpL/8RYW84vjfAp
 Hd1v6xyc+W5mMFNQq+JY3UHRGaf/u14o3skCZlf7KRneO3qYGF2Rv8ISeUwHzYBjola8
 0SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252685; x=1785857485;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JD5E+y9qy4TbcJnbWAMo8UfKZ6hCsr1Z5zR4NiSyrEA=;
 b=PfCx3ByCZR+f0o/4bd0CJTM3pb9eaPCRLGT2lrmXvJRfeYnHG7Y7RLCzdLH+L/QPXC
 PQwjn3jrmX9deHGaZYmKT6HBplLRZDupYeGneue/c5cLHyWF3dpZ7DX3fzyq9xlLYLz2
 NqUzLM18j3ZJ6j2W4F0MtKMxX7Tz6VqdS0dQBGZk93IG7H58pIaAR+G7F1etysiCKaXl
 W0/iiqKYuEmc4LwhG/gOsDgIwu+mld7f0IyCmp+B9B7Vso0sLbnrO8FS6cgRNWNMJtSW
 BJbZ+C3TEIoD39Zxwp2xRpqxFuCYJ5kxa7yu8Aa+DY14nvJWbsvygADEWVgCGp5agDvj
 FKLA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdgcsdfWMeQO2ve2brwhGHZ2rQ8mJIZoElk8z/8YGk7iFzKRbo/QyxQE6LaHqYClkFrfi3LQlIng==@nongnu.org
X-Gm-Message-State: AOJu0YwwxhqM75VrqlSg3mQ6xVAnlf3s1U6HJaJft5e62AClXe/pBECt
 QkmrnMbouQazgC/4QfwEG0mzZ6Ljt0B0LBtl3SgwYCi8KAwDDKfDK78MJKkeqzhS2npwZ2neiGe
 BVNGDq5w0AWzMlO1Ddt09o+XmsGsk5xmubtV3R8hdLA==
X-Gm-Gg: AR+sD11C3DxLmhO9D5Nkoaru/kB2CT9FX0L+PbJgmjlUZ4woWWo4kuETlq5Zea9EPcb
 J9lt14enfoxT7UDFFLnZgop03U7knqucThrj2l9aa+u2afSlQM8CRXkLpLJcacfgKn8LYvP01pK
 GXWzIYJzeUZHj8ytGjjQVKMRd1/Jhdj345PId/bBf5UCx0cTyrDyJf/+VJvrQOMLoDaRemluiJx
 rAlJSTzUH9no2j9RLF8bLf8nITY4aoRzXKY5crEEZbYiN0d7AGiCiNkKd5+iRmi9KGphO3icHLD
 ul2bRF4pi/u7pqV/VE2Tz3U1LEoWKzLlk36oSJlI0kLqIQ==
X-Received: by 2002:a05:6938:a08f:10b0:c1c:5aa1:de57 with SMTP id
 a640c23a62f3a-c1f71eaf157mr108025566b.13.1785252685212; Tue, 28 Jul 2026
 08:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-9-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:31:12 +0100
X-Gm-Features: AUfX_mx3mE50vKY_wiLQkC_DqmCg1Ew-KEdZvyc2ywP26KtO3g7O2tsJmbLTjJU
Message-ID: <CAFEAcA97=b1q86sbxe-ztLZnQrgw9ke2z1Qo2f32Q+5hKm+ffQ@mail.gmail.com>
Subject: Re: [PATCH 08/20] target/arm: Implement SME BFMUL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c |  4 ++++
>  target/arm/tcg/sme.decode      | 24 ++++++++++++++++++++----
>  2 files changed, 24 insertions(+), 4 deletions(-)



Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

