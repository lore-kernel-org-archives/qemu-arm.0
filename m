Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4591838ejc;
        Mon, 6 Mar 2023 04:33:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8ay6LjVtR1kYsw5MiEvaPXHX3iV8kBzkGueVUgmglWc8ViI8fBo3kaYIdYE7wKmHvOQFyC
X-Received: by 2002:a05:6214:d0c:b0:56e:982c:30 with SMTP id 12-20020a0562140d0c00b0056e982c0030mr20387832qvh.16.1678105997029;
        Mon, 06 Mar 2023 04:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678105997; cv=none;
        d=google.com; s=arc-20160816;
        b=hHQUuL0q2fLVTrTJ/ldcZxtui6c0K8c5M2Oqlyo96L0PLbrukIS2/w2vWh8YwTDNbl
         UiRExtwE6wHpkLImxfjqY+ZimD4ox5frXK9KNSZFeCD5ntLa8EXQwuIurXHwP8ynKv57
         3ZUWnfaexLS5UWMvKp3ZrUB5EX9SChUzCwzLUDkH+J4/gWTKaT3d2y9C//NZ4+uOv+JD
         A0PlfQ9tkgu8zdKS0NfK15CxByO/deIftnkwniu9ZItLTdfB8FJ15SzqqaiIbxwnKbNu
         C7U/hwTAKAa6976jemiCGesQ4Lajfj9qUZUzf5BH6kiN0cbMsMgl5HzYPajqpNgDlkw8
         g+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QS9CEUO8FZB2RyDklnlhMkm6qwIfweSLqP97zJJaVkk=;
        b=jEu9KLA5RHjlfmzV/LqN6d/sHsl3RFZCUfBZyrQ4AN7ISoiTp1r4082cCpjuv1eQyw
         IqLlV/9OvOWGgfe7FYpvVX/b7Fsofy5XIvRiGBS/XNoO1tPPp9pLYcxyBTBj/v8U7xPx
         L3kcwJA77eBZDZ/OOj+S3gFkCujWmiKWcmRXylqYDk1y1SzIiN5s2m+R2MfOMm+4OfYh
         ehX74xsi4GrItEmnnW/3vHqVhSzX32o/4/n0I98HMdk4yo1DDwU4qrLlo2YN7GGpmxE8
         XDQEkd8np2QGEGSpmA+KAiOy4WV3/mz+4li/gWXmIIQdJa7G0Ay6HZa1NUhNxSE5IA6A
         5wog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GNesPDMJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020a05620a40c700b0074283897685si8077434qko.606.2023.03.06.04.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 04:33:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GNesPDMJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZA1h-0003zu-S8; Mon, 06 Mar 2023 07:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA0y-0003MF-UI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:32:31 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZA0x-00040V-8i
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:32:28 -0500
Received: by mail-pf1-x434.google.com with SMTP id y10so5623378pfi.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678105946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QS9CEUO8FZB2RyDklnlhMkm6qwIfweSLqP97zJJaVkk=;
 b=GNesPDMJlFbxiJuDE/xqtT066X6DciBJYPfUvmIKkAZYiYrrnsc2t2aUeoDASwgLzH
 6vmnOOuqJaC4CLIX/gtd+sVbYmyvbxqMUXzrPMB+vrPV7Yk6WR0s8YhPqTZRREYKqLxE
 V74vovnjpxux0L+Sj8x9QFj/zqQpqKVatwiDAuhhecQ+dFZSf5doWxnKjge1nLLeO5RO
 FUe3HPAVBcS/QJV/e06ksXr1XeMG11h2hUKb2kwzA9BtEbF1H7xvmk8ymNVbayRgyPUj
 euSIMbnAEfeJs+yUbRq6AZ/7Gkp1M4FXW7XZFI8ilSlwAHU8sFZjwP735d7WipBkJPif
 x3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678105946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QS9CEUO8FZB2RyDklnlhMkm6qwIfweSLqP97zJJaVkk=;
 b=F6YsJfDKfCVZIaGvj67omk1pHR26y1/WnKapcRrFiS6+YwkaKNjN2lXYFLqJfURSF8
 QV8PD6FOaR05ySbaMBvB1mpOyPrT5P0OpkYDcZmuOC2g5izu8M6AOb2nlyqveaGpSoF9
 hw/V7M1scEJF3qF7T+I9yZpXJLhbWG8xgZ2bTwbmCXe0vPXVs4XEXMsKp5SJWjxW4m3W
 aujMAcz/xD8qaTbIjNtJXAWe58CMwe4DhRspCuE1adxkSDJand/MpRfy0lTqgBeedAFb
 Ri6k6S0g1CPeQkl5GMDtRwjmx8ugZPj5pGROX6LvDXWp7i9f5bCKzLZZ/SIvS6QuV4TJ
 sQXg==
X-Gm-Message-State: AO0yUKWtjejK0i79xiohkgbXRQIQZ+cxOpDwHv0DTRfLsOM5UgjCxPxj
 73WV4MXaxsYdqucVywGMYZJQlpGWzOvQzZC/FvlKQA==
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr3710579pgb.5.1678105945809; Mon, 06
 Mar 2023 04:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
 <20230303161518.3411149-3-chenbaozi@phytium.com.cn>
In-Reply-To: <20230303161518.3411149-3-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 12:32:14 +0000
Message-ID: <CAFEAcA-4bTZcLXONgQECoO293xifX8ocRNNzSZfg2Bbycnh8PA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Add DynamIQ Shared Unit control registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +f3H8KJrN1om

On Fri, 3 Mar 2023 at 16:16, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> DynamIQ Shared Unit (DSU) contains system control registers in the SCU
> and L3 logic which are implemented as the system registers for the cores
> in the cluster. Add DSU control registers and enable it to the supported
> cores.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>

This looks OK if we need it, but as I mentioned in my comments
on patch 1, I'd like to see if we can avoid having to have it...

thanks
-- PMM
