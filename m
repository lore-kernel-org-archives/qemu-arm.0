Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp307388ejq;
        Tue, 16 May 2023 03:19:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56HVPbMjF1zMpP11bguJR63G/NW89K7yT3rJnPQ9UCfwNWuLQ70Xbgp5QwwV+FET2fPqfL
X-Received: by 2002:a05:6214:1c88:b0:5ef:4455:fd35 with SMTP id ib8-20020a0562141c8800b005ef4455fd35mr50601254qvb.4.1684232398885;
        Tue, 16 May 2023 03:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684232398; cv=none;
        d=google.com; s=arc-20160816;
        b=KpZjY+ZO4Nps55eEibnJI5bp5swRaYN9Xpm4S1DeVRA4NXbZm3awYOP/NrNcHgoklu
         LUzH00UBy95njCjQ2tGkcQVr+IZ+s6+OUUGHQ4pOqap7VeC1yaYwWSphhYF+ZvvNBXt+
         Gq03mixCL2+5RuXoizVjbGn1bBmNzgAmIDYmwmSL4EPQAFThmZC+UionUPuDiwuHZrCk
         HiZC9cbdpgqeUmyVvcIHbWRWmJv7BDmcYHUbhddGkNS625geDPo5kWf9dKeAXOpL5pr2
         ilbMwEL3zN7Jz35yznoGCZ+yXRCgy1aSiVMzZRb1TNqBdn0sXDAqt4Oz+uWEe4+GwKYU
         nV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=z81PU5yAGSxh43Vm5ArkixjsbrUez3V2cDhZjfPfHB4=;
        b=R0Ho1KkeqkiNSGKytGOiPx1TGb1iHdkJ/STNXEkundeQad2eIR/U8DILfTx4t1glT2
         6+Py0pEsW+6ApWUgnAuge2UhR/NEYtdJGTHhX/AsdheFIDnVIQZB0Cob+tATlZmHsh2B
         TyPSpRhqKkE5UDCnistbkiouGd40PkThpk58Lem0rrzuU00aGVIBc8JEmfwVBhi2huQG
         OE2CzScSMYg+mg0Rvr/w+QMbP02XLA+ixM+oWDAmnJX/uJwMIfmqPUQbOJT1ryLE9ADU
         9JnzALoRgMneKsMfywMYiLupZhjEaikRXt9P0f3rKz+JWtowH/+fe+U2fxnvPbH1kEI8
         X4Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cS/GRs+d";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a056214202a00b00621507836ecsi10364366qvf.92.2023.05.16.03.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cS/GRs+d";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyrmU-0002xF-RO; Tue, 16 May 2023 06:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrmT-0002wH-Ie
 for qemu-devel@nongnu.org; Tue, 16 May 2023 06:19:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrmR-00073t-Hd
 for qemu-devel@nongnu.org; Tue, 16 May 2023 06:19:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50c8d87c775so19342403a12.3
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684232379; x=1686824379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z81PU5yAGSxh43Vm5ArkixjsbrUez3V2cDhZjfPfHB4=;
 b=cS/GRs+deuLszh6mJBoU/oTXj6JjVpdwBdUFRy+ztmRfhEu7W03Dv9qJsIFNtJlkpe
 cnGXoELqTZ/yurpHeMU+Zs3BGALS6q9RFV5skPzDKrGCVYC9zNlQVCFJWJVP46IP1Ir5
 aSOzHTaeQmevF4HcdkJzJlAF1CmJcPAlcnqAn1PsLbJYdAAsGmmCWVfKjAzlFAtntNGZ
 CBeJ2J9JGUtAmfWsBjJuAXmR64kopoH8eQ6gMdbOnJG5XW6/91DhIy0dDWEepAlzutDM
 rrL+LdDuFNEXvQ81oP+7Ygi3WbQs60Cqgl+D3emaJsDl0G+a59jiV/7LXzfmcYfi+B1i
 7cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684232379; x=1686824379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z81PU5yAGSxh43Vm5ArkixjsbrUez3V2cDhZjfPfHB4=;
 b=Ya0uxVzIo2VOe+r/LwpYVGT+hdyz1/Ro1L/4GN20o9vu/+0sOOM2oP9MR8I5tApXDz
 IKmA/RAMZo0VC/IQzSwOKXgErgaj7DtlU80vPJb6Xh0/XSGcWV7aX8doK0Ge0t5mFJFG
 hmQJHxkxhtFfgDtgK+4P4XdPsbJtUzWnx3eQ/UrcCFu5bZ2CJIL1xgoqBb99ceeXb3Gh
 vv+lPnt/ntEPYJvmRNiO31ZkiwEupC36MEdQu0caQsxlhLy863q47uqZhHvLVyWv2eWm
 aIMiBMLDzlppjM0HVf6puktjEEvHTIreIQj4SPZYASlU4+zV50oX7NdBT7FNaTzMa8+B
 FiKg==
X-Gm-Message-State: AC+VfDxpYaXUKsoR2i7dQitI9/QfTyXrany3DQ/5dU8Z+vPvRfJONDWQ
 X9lwHjwKVafoLNveMF9puUvaXW9sX6W773Xq9oLEOg==
X-Received: by 2002:aa7:dd02:0:b0:50e:399:420c with SMTP id
 i2-20020aa7dd02000000b0050e0399420cmr13529013edv.5.1684232378996; Tue, 16 May
 2023 03:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-49-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:19:28 +0100
Message-ID: <CAFEAcA_rRHF35uaE2VA1cyp8GQcrtBfqUvHVLpXBzRV3J6Q07Q@mail.gmail.com>
Subject: Re: [PATCH v5 48/54] tcg/sparc64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VluemXHfeo4N

On Mon, 15 May 2023 at 15:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
