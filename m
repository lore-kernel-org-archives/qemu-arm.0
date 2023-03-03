Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1347269ejc;
        Fri, 3 Mar 2023 09:36:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/1r0dfhTnXMlXiwIW6i1e3Hm2VrDd+dgvpeJrCCRHrMmnsGpCluaeFjx0etgglfaI2dxg1
X-Received: by 2002:a5d:69cc:0:b0:2c7:17db:bf5c with SMTP id s12-20020a5d69cc000000b002c717dbbf5cmr1571586wrw.25.1677864990607;
        Fri, 03 Mar 2023 09:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864990; cv=none;
        d=google.com; s=arc-20160816;
        b=t9FSC7n1bJ1JgLR7mrBCKUT+8ebMug9T2P1h3Tsciw/uevt1ryUuNM2bjxUYkI/sgP
         tFDSl0ZEKEm6S7tOb2hF3sB1+tA1IgPHis2wAOX3S9ZMRfqEp7tKpsOb5EMi8O2CKlbz
         wglmuR3Tlg7p1v8h7PAQX67lyoYh3LMVpmCm5win/YB3Ln0L9Toaqavg2V3+BtMgW/Ka
         oIpQyfAbEDIA4w0oH+iT4zs343vyrP+BHbdbeOMWv3kvod1PCcrCzzDPqkZQ7QHPgHb9
         iZCKq4NngX1gxJQ2LdeX4K52ZnnjAOOiVj6wZ2Qb3RUb5W6YdLLsypGRnSwUd5t44NbY
         4KGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
        b=vsUzkXUkW/gc3drRp1SmELvLwjXFwdaAM5liwJasx34nfU0G49gZXXzyniKeKaep1M
         rsGCBr04dNVFGK7dvrzQxn8sFF6dV2tW5M2o/9VA+MaqUs+qhkzaQp8e2y0I/atgjZqI
         PpWGCdGweXsMcfla5q2JytP42U+ocnRcX+4vipuJZQQSD1eYgtC55fu2LSU+J+ZF/e0i
         9qINkFNhlODgWeEdGy3WrpxwK5rCWBZYjNI+o6PxkmxluUuQg6TTulo7tXMLMXo+82nl
         ZKM3ypwtnx8sRUzjKH8W7WnLqrVBG8MZA1MhWocQngSAJwk6NP0JjlxD1D5Q5fG4evsj
         pdxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PKU/oOKj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020adff182000000b002c54db86defsi2142595wro.321.2023.03.03.09.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PKU/oOKj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9KP-0003Fi-On; Fri, 03 Mar 2023 12:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9KN-0003E4-Sd
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:36:19 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9KH-0001aN-MH
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:36:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id oj5so3285224pjb.5
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
 b=PKU/oOKjFSmAT3MEyaSd36VK9jdl2q0iX/nWcUGvaS857ovup/RX3NuCQYxwOeIVlh
 ba4KdBD+GJUNQHaMtebPBx7XDuwBi3DX7FSMCEAJDTac6KVxV3z9WeVS8kYhKMi8uIe0
 hNIfOTgXIF1OM6b7kHWudkyHlAMnCkOgTwcCJu/GMnCP9jl0Ip/Lu5kbzzqrVqPI+kXu
 7FUd2iKYtHlq7zux4JteufqS+6AV3ooXN5o7/6GApGr4vopHrTUzAqNkXbXnQMSczo02
 WP5hG9dIYw+nE1YS23AsEWj+nlkaYuCiAb6sgLAlDWlePGikMNeXT4LVpMfeDzdyqVfy
 kMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864972;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2uzFW9k8BefPFcSpW3FfpQkumhKuKk5wcl0yvFDZIs=;
 b=dyenEVkYt5u6CPFqBxQzLvB8P4rlbonCbSECQYP/M12ZX/vPtHJ5W4YJlrZsc+3ojg
 v20voX2Ldj8DeyqMiXELKTl8hALXYRK493rtIbflWL5SD3sY4N1Xy3KO+kN1e0gWA6Ea
 aD3s7iqYCdoJaD14MFb6/2CEm0RafqzP/EtAQMrx8yu/bxKZynrhaSjwFrnKXurmYHqu
 gxcpUvzfFwomfEKuKuPvu2x9r7EmpyIOt/u0FRhxAiNsBdm1K+YF1KxM67qZKFyBYTbu
 lG42BZ635TOHljkvnK32FBa6GrmSJTCzG5ZrgFjco9Mnts+V5FgbfcbS51AicGCkyxh1
 oMww==
X-Gm-Message-State: AO0yUKU094ehc5Sp3pzB5v9ObXIxD9AwVtNcmqeEDjCvQ0i4vj4tkzCl
 lGeqND+H4xQAPzhkNggaxau9tb3zbe90J/rvBf+b7w==
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr923483pjb.0.1677864972091; Fri, 03 Mar
 2023 09:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-11-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:36:00 +0000
Message-ID: <CAFEAcA-0EgYyMEt8a92b7qdxfoghgWLrAp3Q_vmLjhJbi9NYsw@mail.gmail.com>
Subject: Re: [PATCH v2 10/76] target/arm: Drop tcg_temp_free from
 translator-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /Qqi+9By0sGJ

On Mon, 27 Feb 2023 at 05:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 468 +------------------------------------
>  1 file changed, 11 insertions(+), 457 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
