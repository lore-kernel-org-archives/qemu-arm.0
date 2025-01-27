Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2476209njk;
        Mon, 27 Jan 2025 06:31:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0sO79oYkUZSIU+X9aa8WwHBpUQNsHuuRRmxapuvF5w3ZJ/Dy2OLagxZQrzptChPU4FfLgUogVeuLgIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG+oIJZOSw8JbSW7xJF4RLkmyVQ5nDz9o2q5yv1bErraMh/fcAmto7C00LW1PPGgSSS3E7J
X-Received: by 2002:a05:620a:191f:b0:7b6:67e1:b4ff with SMTP id af79cd13be357-7be931ff9c8mr2897126385a.28.1737988294950;
        Mon, 27 Jan 2025 06:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737988294; cv=none;
        d=google.com; s=arc-20240605;
        b=AcBWCJZM2RgE4VVLRS1QQfxoGs4c1BquyfZ5UtoOFJV4OqN1FNhKAwnDGwUtum8o4/
         ad2irVcZ6ixPwBTeK4EcZUFdKZnfv795ZccHnhcFtCnjL2sgQfKOIdB0SLeIDxunwTSK
         Y2T0m66h1CKFm55PaFa004HXvPRrFtEc5O6FOgVlNASBptPwvdMjEflAnlHZrxN5PYli
         3fUAQ1ve/0uoUpDh7+3jMslGcMQSJCr5+vAcOq7zM1VfE6V45JzBNHJhP7K7tM1scjIT
         uopHECOeCghZBywMwQyeeWhVvZuK06B8e5uv7ny5GE42q5DSJYTxtouQlZiIQpXQ7hcs
         Rf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jxacrGrP0r/CLm+pmtQ3yNFfGjcJ7eTZMri8LzeUc3A=;
        fh=ZunbYo7vBCjqSWc9622LTLPHQcfFJMelhG0lIzAt0Bo=;
        b=GSQiT4B0w5vBfa2wgZmJ3mkHuE0XOh44FPZ/QZLE3dOjmGwxcEaw3HDHK6G8zBw1MM
         qRIUl/JMPjZ2DlolKyw6V7phEOOx1X3MAXhwJxyUz8ngfZYb7/7Yhg9PcnXf+qKNggKe
         t/KhjTT9gd4wqCY1/h3P9qNLgQruNXXeIs+ZY5TfTNgksXXw/ORvRYGH3v4bygBNA/46
         04mNLGv3Zwj2vOsI5AjrZ/yr9cma6pMSSDOp0f/1VchtoBumrPOE6PBRdJEA21phS6J5
         C4Xcn6tN0u+VzxMjEA4uUYNwtT/vhzm0kUIzNazK+ARzYfmnsxFagybpIn7u6SMkP0xi
         2tOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NR0RsMyI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2b80csi969015885a.635.2025.01.27.06.31.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NR0RsMyI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcQ9B-0003fO-0I; Mon, 27 Jan 2025 09:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQ96-00035C-KH
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 09:31:24 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQ94-0004GD-II
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 09:31:24 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e5773c5901aso8853037276.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 06:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737988281; x=1738593081; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jxacrGrP0r/CLm+pmtQ3yNFfGjcJ7eTZMri8LzeUc3A=;
 b=NR0RsMyITf9gkG6HOLA8GUvsDq51p+LLIgKKmPxjPJ1xvedcUNJrZxWJm2KAkHk8tn
 EowYtM/qz1XRFYovNw0S4PhuwtjZ30bWfafHuLjdaM+Wv2WsCASWKPNjCG7FEUra+gm2
 RAkHq7Tk63+Y8EKFWYPoNhGo8OtTFjdGt1xt1ZiS2KDg3LQCYIQYlqowWrOFpNwTX59F
 aZ5cE0+jp4z6k7s53f7bFaDssJJfHlsfLYHtYheRdLnn/yg2+pxfYW/+Zi3QEQN3Xze8
 Hw8STG7hWi4GvFFJHqemnTUJBuEOp/H+UsNKVdW10zvV88qOAoIJoUoWFtGFY9ox1VKj
 DA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737988281; x=1738593081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jxacrGrP0r/CLm+pmtQ3yNFfGjcJ7eTZMri8LzeUc3A=;
 b=Jp/TnoyKhpGqi0CcvrP+bZBPoY+QjURLlt3NlwIYY3ldZFZOSN+hDJ/kbQCAQQ6h21
 Ajz7lqoJA1pUf36Roxk0brjCmalwD3U+Q3W9TsBkIZ1ZZXO93mxNnUq1MV74+Htazvjp
 bzAHDO44FP6atpE7jcBSLZJw1yyoS10hansu5kx0BdkSo+jHWZLyQR5wah7JzAEJ7NNz
 YCVeQ8RhOJaOi7vMnauI7HLLcxd70usW4NC41EWI4P6H1IPLRY0ggicnvFRonP6lkwdc
 IVNnaWPYCtqFLYoyRo+CEGeboBfz5CW4AViO3CBq29vZqlY2wFlBblAZqNWrRjEUgz25
 WjAA==
X-Gm-Message-State: AOJu0YyqOFiZr5iFaDBT2ILt1aVRfH92Sk7knPcckEIGr+GFip/OfWuc
 httkq6nZDWc58Zbsj0JKNZ5Cd69IQZjUcFGAK251nxIKZcI065TrDFXRUiiWVctWnhzUgPYsObW
 2LKMfSDwGwNyG9PEZ5yEwRgtpNN97etxlQEuZPVKbN72vfFj6
X-Gm-Gg: ASbGnctOpiFE94nb5tLwjxumt91xoE7AznFP5FfpphUTy0SWkYYps+NHqO7qNLeRumP
 YgOd9B8tr7Ca/To/Z/9uZTltPk746dWODnmGs9NKeSa5rgsmmY9VKJaXcgU5hFSU=
X-Received: by 2002:a05:6902:11ce:b0:e49:5f2d:e722 with SMTP id
 3f1490d57ef6-e5825835eefmr13960663276.14.1737988281203; Mon, 27 Jan 2025
 06:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:31:09 +0000
X-Gm-Features: AWEUYZlw63k5VIdnIM4zLcNXk48nMCuWoPfkr8XEAdh1KP-asD5Mxilrf4UscJ8
Message-ID: <CAFEAcA95_AcsszEwqybegfabb-bcZK0qfvF1BjmbsSReTbwvaQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw/arm/stellaris: Fix overwritten IRQs and cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bQKJUSiTUOkc

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> - Remove invalid unimplemented I2C#0
> - Add DEVCAP() macro to check DeviceCapability registers
> - Check DEVCAP() before creating devices
> - Use 4 inputs for ADC, wire each timer output properly
> - Improve documentation
>
> Philippe Mathieu-Daud=C3=A9 (9):
>   hw/arm/stellaris: Link each board schematic
>   hw/arm/stellaris: Constify read-only arrays
>   hw/arm/stellaris: Remove incorrect unimplemented i2c-0 at 0x40002000
>   hw/arm/stellaris: Replace magic numbers by definitions
>   hw/arm/stellaris: Use DEVCAP macro to access DeviceCapability
>     registers
>   hw/arm/stellaris: Map both I2C controllers
>   hw/arm/stellaris: Only create MPU when available
>   hw/arm/stellaris: Only map existing devices as unimplemented
>   hw/arm/stellaris: Wire GPTM[#n] output to ADC input #n

Applied 1-6 to target-arm.next; left review comments on the others.

thanks
-- PMM
