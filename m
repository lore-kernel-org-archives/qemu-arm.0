Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2430493njk;
        Mon, 27 Jan 2025 05:18:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8RgGwsG2PPLX4DAo+WCfqGACFM17xl5E+uPVJrK5jHHti5aSoLJ31xigIVJRPMz21oiwmwfScZ0LKRg==@linaro.org
X-Google-Smtp-Source: AGHT+IEVyJ/eJoxgtdw72XQP6Qu79NqIDPb7l7vFiQ1RZed5W23ISkSrOH/CLqibYbyHca30+TGF
X-Received: by 2002:a05:620a:d86:b0:7b6:cf71:2788 with SMTP id af79cd13be357-7be63219877mr5710451085a.11.1737983936551;
        Mon, 27 Jan 2025 05:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737983936; cv=none;
        d=google.com; s=arc-20240605;
        b=dndhkZjOCuuEei9Hzz/nTDj/dudqTDG0CKc24+RI6gNHcPRXjp01tk4MCl8DXSF+sO
         P1C9h3nxM+9Nn/CZ8DDwAGboKeUhFaAG0VqNE0btMABzap4UnMpEIVFut+So88zCT0Ch
         Bd2DSDyS2zNIodwu5M+ZH5ADYouLC4ltUL7raQ6R6enCAqRmtRIQOTIDGLBnVM8G6Bpn
         O8BBvuKDtzqwg3gFRvAmL1gRfBML+Sfde//cwr6W2mggXObuyE9ZyjgqvBPmH/sW2el4
         cjDi2DUELmTdn8kuxUYQc2+74IcQ1iIusqQuDA4wMFnbLAxAl8X2+VkQxeZQM6XrtbwC
         ixdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xtpi4qgkL8JkagCn6wQDzBxcxQZeuPDplrYKg6/I3qY=;
        fh=otWVY6KymRAOSBtGA3m7fl4oCh1SzFNoDv25lf3bhcc=;
        b=FzuXSH/S3q/gmKly6gx0pYWefM1h3lXsK6jMpbCdLKc5xsJqETd+lzmoG/yvK7/KTC
         TZHkJsqpeylSf/YnlN6XMPWJfsL3tulEWKqJhN3SAriWYCsYi3nzV8DpkDvYMrh4c7za
         MLpqZUk9m8cedjlm42zitzII6PtWDJTNipxigx0Ix0QtvxRjjzIUffIGYj84xIu4CchD
         6zxc5c2gkFTuys6ljRdFq3Kq9ko3bmM45r1tTbKha472GOpFIDYoBcgK3dC822emaCWI
         q/VqCrj5Eqd7sMrwadDpzjO8dhbaweQLd3y15SAI85A2obr7eWYYCqR19dTCyQbVUdWr
         6QQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0msuB+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b844cfsi92832061cf.359.2025.01.27.05.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0msuB+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcP0R-0000Ib-NL; Mon, 27 Jan 2025 08:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcP0P-0000Gk-Op
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:18:22 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcP0N-0002oD-Fj
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:18:21 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e53c9035003so6943225276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737983898; x=1738588698; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xtpi4qgkL8JkagCn6wQDzBxcxQZeuPDplrYKg6/I3qY=;
 b=M0msuB+Rzbki9GfIcinDEIUyMrd/YFUpftR0brYgDz1QyRiJSr3DWbJfV+g2lLkt1Z
 g0jgniCNvaMqlJIg00kV2wSOU+T6BHTdmV99qUCrPT/n59FetDO4b/B6MXpwL0SZWNqD
 avvN0CMK1UJSyAm7BgkNp5os30AOgtdZJvHp/T/yClDc5En7SobP1LVHxE3e4e13IqMd
 vxwu3Gkh/3oOPLybXKcqDLhujYd7IQsfT2YLS6vnLlErnSqU5IErGGLs6yzd7WrAQzDo
 9+gHQD3AcquBIy5DtNOBwFUZH7ld0lNlzBNensS2RBB/hKxLBuqioyNzX/B93l6TOzsQ
 i7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737983898; x=1738588698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xtpi4qgkL8JkagCn6wQDzBxcxQZeuPDplrYKg6/I3qY=;
 b=OFIYtW86WzEHeXZrFgPduWNf2zOLMjKsEbHNfbZn94G/zz1fuIZd1EUxXSNt0xWPLQ
 P8uRM2OPAi51WATg3cE/zBtVbVIJTysPmngxF4uGAPfDhOTtI0iKMEPC2pW/rJsU4vrA
 ni53Q0jxg0u0vNSQkQJkp1kN2X0wmH05qo1uEdoW5EFobPs3zkMjEZHOqzGxz2tw2Wp+
 BsTQKewc6F7dq5Cs4W+DZCEMSIEW6xk+nSbUVvWvO9pfF+w+5lKQok5vBNnCLnZvnlf6
 tMds9/R3JBgKstEjLSarO0lsU6CkGJPq9Po3VIMbWFiv7MJiClsEYxrsqLhbCP6qccMI
 ATbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGyTF7bFYarrcdj3PyMhgXRFsUasaRU0q0FJWbxIF0qrTXDaYqHXmupgRojzOL9FeYRRb1AZIIug==@nongnu.org
X-Gm-Message-State: AOJu0YzWK0d2No9UEiDiSdeklyxxF2iq85iQl36hKYPw2Vx90qUTm0Ko
 d6nxpoIJ3GDLYX6WFEZNUm6QolVLsdJzsR1h14ofuaL+QNFPgcVelp5fcRWxgmwO6n9ksxkP65o
 EkyFhg7SYaA+SFhGHMcxxizcF3JjEUBaQw4vb1w==
X-Gm-Gg: ASbGncv8QahrKI4jIij9UtxM6K8kRufLd/5Nv59cBO+KtlwpNFPAsydQHiHtCD8G1gU
 sr4S6s2Ea0K/zCKF4YL2AtBe36YAeG90u1iemZXdhDf/JQR7FoijbJmx4cHXUWjM=
X-Received: by 2002:a05:6902:72c:b0:e58:32b4:4868 with SMTP id
 3f1490d57ef6-e5832b44a6cmr11961205276.3.1737983897770; Mon, 27 Jan 2025
 05:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-3-shentey@gmail.com>
In-Reply-To: <20250111183711.2338-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:18:06 +0000
X-Gm-Features: AWEUYZmR7ST3QpmICCYcdkXNbaVyh6Mt6einpxGGwOCmVeA0KUGPnwzNeWgAzn0
Message-ID: <CAFEAcA-LYW+uAXA4nzkT5mXYr_rSmpdth6K+roBxP_2ySfA4Ng@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] hw/char/imx_serial: Fix reset value of UFCR
 register
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FqdajXsmdLw5

On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The value of the UCFR register is respected when echoing characters to the
> terminal, but its reset value is reserved. Fix the reset value to the one
> documented in the datasheet.
>
> While at it move the related attribute out of the section of unimplemented
> registers since its value is actually respected.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
