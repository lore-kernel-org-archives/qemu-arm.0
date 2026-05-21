Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6013BCD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:14:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Dg-0003FZ-6H; Thu, 21 May 2026 09:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3Dd-0003Er-W2
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:13:46 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3Dc-0007NO-Cd
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:13:45 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65318dafbcbso6071156d50.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779369223; cv=none;
 d=google.com; s=arc-20240605;
 b=iyuTlAFUVVTH1m3k/INAteIQVKvvHj0yuO5RU5iO2J3f4+Z+byVjth+UDdyYRsIppk
 SqS8Pq78sifRPjdYSUZs1JqfdyieI4ULxue7L1t2BKfJFxnLJaoWEruvCdqOqLq3INec
 YJ/JH9O7xq8aAYXRI1wvDNgDbTjKMu2PSh7PJ9PaOywF6GgpAuQPWZS4bywU0p0TiQ6E
 TZCPqFz84qAOUYX+hpx06X3hSiCqkuMpA7G/rSjlQxL7D/AeUtUnYWCRDnqV+8QxAFws
 at1D3VHk4LTlvN8tLv1v8EDKsWRQG6Owmh3D2zMRAJqYIGJe6rm++yP6OEpmcNgUcHvm
 HQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=A2bf2Qa6b+aZl5QhGuVx9cLh1flJJ6/N83rTs+ubI4Q=;
 fh=zM469050RSd+cHR4f7VVgp/e/cpHmrC8cCGXSyxqovA=;
 b=AZNcRqmgTW5LWtXt/ZduJpriihNn6vj9wnzCkevc5SqMgVwgKv8Q7nKGqgEwMQD8eL
 AQpkr6eLFvR6wiENGZOHTNFA2QPT+tHY7pmmWwa96ViQ98FCvx8TsOTr3X1URUy1ZiTi
 UmK3monjD8QEG2nOrHBHQMudIs7kfzSzK4gGi3MTAtjQJY0Ejck6oL0kaBNWZYLBwKWy
 xgAGa9G4D9ZvOU9CFrM3AjLliUxBqpGLa5hZgngBosnt+JqcmghvekgFsgq9OkkmnUPs
 xcYIDbEtX7twvCAk2So2Yyi1dll5UIh4ONmOqJfSHa/X9stE2vG76nRa9uVlhQI4Rtrc
 OkWg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369223; x=1779974023; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A2bf2Qa6b+aZl5QhGuVx9cLh1flJJ6/N83rTs+ubI4Q=;
 b=tw16Lf6lM9iHDBwCtQRp2BAQ4sy2Obx8lpkB4fi0ZuEJtV4ZauOwoTmK+Id2KBqSJh
 PmNegj7ZSxgRiXqy7zNl/td0QrjI+2J79CJVxZzf3PEneL3lpIPi6KtublMK+5u6fLNk
 Pexfe4m7hdZIh6yfwrUjwKngOcv0/ATLpC0r8AMdSF5KPZhoyeuXpQSYpkAoOKd3zZ0g
 BSaihr1rAtCz6fGObHsF+wrk0gHXZzPw5URfGQG5Rhju6G/FzbXaJZUfxp9H7liu1yNJ
 SZwgs//FtyllWcbaSVv8syZHnCLB/5AmIwEk1yhCHAJccBa9mNI2+zb9Lb8cs9/l+dQn
 7RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369223; x=1779974023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A2bf2Qa6b+aZl5QhGuVx9cLh1flJJ6/N83rTs+ubI4Q=;
 b=YUM0+L18kEJBRNian9axBb5TJ0hLjZbBRpflxIbkQttuG9JaYTVBfjqcR3wXBYRl3E
 fPO4LTpSEAMrZV/HOXWo7/9rnih9i8V18vG/WJr05YoIXWbu+7vO6UldhXAIKsrRGVzF
 Udoqhb/I2AdQTsho8XtBDyc1PKj/pkTWVvjelIY1bHjkIIFnpxVSlkK1RTW22zu+n2k/
 2v2ZmPt54xJt5JV3+CW1pHacu+GJJkcn7BaRv6OTIGEDjQiVe9p9+M9l2NUTkkgxH+Q6
 wA09MdUeL/bVPKekP7tNPEzDy8mqnd8FsMKHNY84qCMIPPm12NnQOGDj8gF9D6EsILv+
 VpqA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yjtknPDxzTPKmRNeu6rRy+fz/+lCILc0z2IOv10TP3q2lGGe7QPIWhbv9pJdXg4r3gvLt9qnIEg==@nongnu.org
X-Gm-Message-State: AOJu0YwV+Auknd7G2htnHm6D1M7d+b/PSvKy1V2z7SMulPKiXPOVQRK6
 oFR6sWKs8WMzYupbRrUrlfYeOjpgvzU7DNelCKAfDeBKkq/GZbS4OZVE97Zt+FCCa1/7vI3wIYI
 0QrX1nqdX9fMiJQQ7J9zNPn4GVscNREXr8g4PGmznuA==
X-Gm-Gg: Acq92OHIcDtYvC04iPKPZ4PfnLki+pBCWC/NCcRbWs/pS1ExXHM4CUKkUxd3/4v6RN2
 attW4hEZ+jq3fD4qt6yDlkShjrNrN1kIAgYJo+idQ/PG0P5S3NZfjLzH2iUyyK+dApVcWmHC60Z
 171EdpNGENgQkAuvHe8SzxLQmwkIIgVTs4Mz2bPSRQgVg0M8/4letJZjN1c0aEKXIqIzQLBYmDT
 2rA+157VH46FL6P8xnQnr82VYUdZRROtdkPqPliOwSWqZW+PVGDbNRct9iiYh7I6XKYk4mj2Tdp
 ZpDSNsZEMMfwjhr3m/zdfu6e0h0sg5EmXeJefyQCc756Puqdo3oZrK1ITQ7Qk/EHGrs=
X-Received: by 2002:a05:690e:1688:b0:65e:4cea:a088 with SMTP id
 956f58d0204a3-65eae0e4aa0mr2250227d50.36.1779369223028; Thu, 21 May 2026
 06:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-3-richard.henderson@linaro.org>
In-Reply-To: <20260520171820.848839-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:13:31 +0100
X-Gm-Features: AVHnY4KeuglWnnjUzg4G8dK-F4re91abCB_kfx9uCAUhabP0IAr2WUP1NTuZZF4
Message-ID: <CAFEAcA_D8ssZdY-ve7px5hZ0abvivWSGeux9d_nVRn4F3E6m3w@mail.gmail.com>
Subject: Re: [PATCH v5 02/30] fpu: Reorganize partsN(muladd)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 20 May 2026 at 18:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Check the likely case of normal product and normal or
> zero addend first; shift NaN and infinity detection down;
> end with zero product + addend.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat-parts.c.inc | 156 +++++++++++++++++---------------------
>  1 file changed, 71 insertions(+), 85 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

