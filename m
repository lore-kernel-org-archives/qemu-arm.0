Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3754DCD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:27:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsjQ-00010R-TD; Tue, 09 Jun 2026 05:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsjP-00010A-K8
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:26:47 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsjO-0006U6-4e
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:26:47 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-660e9fe3c3aso2542558d50.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780997205; cv=none;
 d=google.com; s=arc-20240605;
 b=iHZiD28MvaZiqnsBCX27e+yo4tvX4UzIZwwnNJuqDnxlgShkB2jqH173c9xEnQXMcl
 3N/8TIHQccay9iBJn9oKzaBHsI3yH60/t26MJcGE/5b5bPwgfxd04NNl+13XQmOKfjGT
 iKSdMh6MMgvw1NS8+UEmVbD89TxJ3VKJGbHi/NqUhJMy0PQdywhEOpa51eqMCqkWxIUU
 LlDYSfCdWBRAoIZrbZ3F79jhg9Vg9kL+bq4qvIhSQ+sl5MtX/m3nuRrQUjZvcIY+S2V+
 sEECQ6VMJ7R+/lYC44I3TAn2dTj+nba3N2v2s4xvkxWAj4Qm1PxymElNw23+f3Hzlx76
 TMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QH8QnGRoMGOpdIvL0G00X1FWB9M3SwC/e58ot5dOTso=;
 fh=nnmyqmDK6WCMHZEO21/jUMQQ299QJ7dHk2vd6PbADDU=;
 b=lClDFkqEulj+o3JuvghOgDUIBgpZXjkLLZHxXKSNbH0ly00M0cRZQ/zInovX/PW3T3
 tH8c2WIFOifn0SZGEA8lZ7eJ0C9h0eJ1b8adRDBVqZ+FRz99D9/w1bzezx2lRfClhz+i
 pGIBZVgBINIFHnQ9bVHnNQqqntC5tm2dyES1JAi0DKv6eU8fI4993TzNcvMeat7uOvvk
 USC6dqdUfglpYisiSOUTwPKlqxjLz1NxXdmN6/RL9ppfY3aaoNvWku8KTEGu6E4XQnW9
 I2dKIp/3c79cNzhlap7tgfp6PB3Tae+6kktLoUorp8g/6eiABVD//08SYEG2GX0wdVX/
 c1Pg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780997205; x=1781602005; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QH8QnGRoMGOpdIvL0G00X1FWB9M3SwC/e58ot5dOTso=;
 b=R7G9X5hIu7Z3O5hiT2GL5ejOH72AUv/2loxuR81bYN/EwX+zu+mByQO2T3JG9BbrTd
 kWbP6Q/71Qk3TWt+tdIUZbk/ezdx7ZQ6uLU/q08gbV8gUxzkpREQZBUoelrH0h1n8a5r
 ooV+onCUnZfkUS0mwC54URtaPfC2CcGvb+XsYwa/4L42O7aOxhMVZOZ1sB+ty38z2gVV
 +e454pNEfQPed2TgLeffYX0zCfBaZRsj4bA56vK6MQZwhOUcYwnkJg8aVAjm9afh8cWz
 vj4woFXSd2Jm+mRRZxhpvY0jALJtaxcr7Nl7TVvefmOS2wNlcBehmBtaN9Bg+X4n5CNx
 TCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780997205; x=1781602005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QH8QnGRoMGOpdIvL0G00X1FWB9M3SwC/e58ot5dOTso=;
 b=S5Qgg6YPjaOGOLLwWEmPERKpK1WnSl2TckYBTwzImFrBCjIADj1e3/ATDCaxWFm7ki
 lgxb/z+LTVFzjCfIh1ujmoK3tgBlBSrHASvXBOQSb4kmTuqgb1VF8H1e0THAGq9Yiwgl
 w0CMDoXvDpO1kMlIM5J9b7YWEl8dDrmsXW7rkSRy3hOqFrtPSx0O53DKZ08N5Y4jpnjR
 pZYn1+o3JqSf8rPe5NeqhJMaoTA6ny1MUyraZx8utZF5AMeYPTrUp8p24GaCW2ImnpNv
 g6tqKy/9LkWEEeaFTiCp9ptfJr567AjK7D3ePpomDmGTiiiHQFyjA7EuHKXxX2+kTMaJ
 ZPsg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8SttR22Ldi6YvNL/hWdsOYyOYJKtVKiTpben/qg0vWEs8BLXB7Av66Qebe6CceKOpkb+4Si0kC5g==@nongnu.org
X-Gm-Message-State: AOJu0YylZT069b5Zlcngo2TATuTrUuH98wwraNKK8bGXAsjS1hgDMgL5
 kd7KV62dBH5LDuOuiXZkQ/3mTNAEFaM41KdSTnqLdsOT3KZDWJLfPiMVv0YL0TTG8a4XM/C5vfD
 +aE0KZAZNrSSBC3vJiZOWWzyc4qYvBh+39BfDVTP4YQ==
X-Gm-Gg: Acq92OGEHMrhujZb+6gcx4+SlEUGA/wsaLdaHuIp55teobR2qqLzlNjrYowvBVW4Krr
 /7LRLgmlkXyTqvdsTvFVKYjyJgsz0evm2Ez98GdQMOH24WBzyyzo+UGa8FEubLn/p3445r4ONj7
 WP/3E5MrVXMcMWJVK6EHgvCN+4OCKPMEZ0NUDVBT8Sssua7jdND7Xs7yRjR/4ti1XJBx8wy8wCN
 8EQtCeWjpVxzfKtPimJ3R3BDBewIQiSE+dDumuVfnEgkI5p+48FQtI9qmoK0Td0cFxJdF1QUk5U
 NrtJJZOaYdQTaCJ7GqXA5aG7leqxKxF8sRY+MGn2/4xujwJGdjP5EQ9NEsirXj1r+tG3u8cTZpe
 1Yw==
X-Received: by 2002:a05:690e:e8f:b0:650:1aa5:8594 with SMTP id
 956f58d0204a3-6614f80009cmr1452729d50.49.1780997204805; Tue, 09 Jun 2026
 02:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-24-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:26:32 +0100
X-Gm-Features: AVVi8Cca1su1Q8MFbFY3shS0pJ81iK_sgw3qIdq3UBnuaoCm_9TSUr0Bmd3VHJs
Message-ID: <CAFEAcA_PLmZxVA+VVFCWsy8Jrq05nWLH3AUTi4Xj8BXw+oKTHA@mail.gmail.com>
Subject: Re: [PATCH v9 23/45] target/arm: Enable FEAT_LUT for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

