Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2182737ejb;
        Tue, 30 May 2023 06:37:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6v4ZA2k/pAGbDxpb2lH5PPjvZq/4eDeqhakJrPDHVqRgzKn4NDLPuPicAskwfZKCHT/5lY
X-Received: by 2002:a05:620a:8390:b0:75b:23a1:8e61 with SMTP id pb16-20020a05620a839000b0075b23a18e61mr1781731qkn.50.1685453855177;
        Tue, 30 May 2023 06:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685453855; cv=none;
        d=google.com; s=arc-20160816;
        b=Ma+72V16TwhJUfRjaKr927ma2lNm5jtduLskbtQjCGHnqaWjBqo77Ee/l3VXDVpoeY
         U7XTgrFFTguXtaQXQwGRLQ2OhV59XAs1Sa+AeNLVKMkUnRYfYDxCSyFzISvSWHg1e26o
         d2SKdgL+ryR7i+azSeeMEtrgIst9Ye2RNAaN+ZEt6VmIwcT1N++TNULKgWGKokqJfbXs
         T2X7h5o/7mHfIm/amERGZKlRM/swsKKC3lfTFwzzE4FgX7qiFmXWNQzbqMrY6q4I9fwQ
         pahG0EmEZ3KISUI7A0tfFLLYLtqtL15548sOQ+K/7XU8uCh3pSzCj8zkOAgdLmoL7F75
         PprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mNjcxgptO1vtZRA+UZ7T+LHPbP0g2wNlcPNeVaO0qCM=;
        b=0qBB55q4q5J3c05jZRCpr3Csi0ehP5Xl9UL65dgnNvOMjPDkNK5+flouEEMRlYW0sa
         i8QWd6V6AmgvyRurD4Sw3qyIfrwzeDOgjBZvOg7kCeUz6d9+u9BoQSFrwtkmpyPpMIzh
         FPtdbcXThaUYw0LCFSp3bA7003eeJCGf/Dx4JMWfPVKNC5aSkk/PffuE9FW/oK9VQ/Bf
         t2JUiEWJNMUGDbiazfZ3dEVfwFgwKdnNxCzVwprLhoLdqYxeZvOMxYRZxQC8FPm/k28q
         Bkl0vahbaJHlgpod2o0VL4iDKV79KH2NJeLwSM2mvBadbk7RTohxjnp0wK96vk8PVVts
         YAlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVxZkY6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a05620a078900b0075cdd7e2c4bsi3648616qka.368.2023.05.30.06.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVxZkY6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zXT-0000lB-ME; Tue, 30 May 2023 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zX3-0000Sd-FP
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:37:02 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zX1-0005FC-MX
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:37:01 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so5134375e87.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685453816; x=1688045816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mNjcxgptO1vtZRA+UZ7T+LHPbP0g2wNlcPNeVaO0qCM=;
 b=kVxZkY6B/cBDk4A/8ymKw4+2yUFlYc/xvEReaGnb0gTk6WrQDe4/0u5NeqSOMS/cIV
 R8Z6mg1XLyM7N4ZsIv1BzG7/IYiP9o6KV9ZjMRtkXX9G4aYnZsPGjDQXD1iGyc0KNGVK
 RhQqiL4PZJD0G2/FJtAJbjtXGrSVUjTLTJ9xxv6an9Yo4ldGKAaHhLr5dVpA2JZ1px+L
 iS6FoUM8fMQ/feFj+lj4L2yC7spgmBeezO148Jgmh5QFjDym0yo6jMROF/iQ3CSljmgq
 rXpsSitiVuEujPFnaxzuPGw1V3xZViW0xgkGf7Qn54bVEzTbY7cCMa4vSM6AazEKVyqT
 RFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685453816; x=1688045816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNjcxgptO1vtZRA+UZ7T+LHPbP0g2wNlcPNeVaO0qCM=;
 b=Gz86+K4seo9VXGjykeBj23CTORsUoc3GA6ywEbBSo8yddXHpG4X5VPbS6nqCX7PD6x
 /Qf/WheZVLPVhXSt/HeZzXTDA0Zs4ubadMqGHtx9JN/jiO6mc5nDsVhB2zfyZzvjUXKj
 2PlFfy/n0dgWfxyTIkIY4r1YHOS2oBLvrJhHsLffRlV/Vp1XoodxUe78pVlTMhWWZXlH
 cezrYUeV/WVoL7VvSsfjMg5V6g7fyx2eEGGLcpyG5GP85qN3qFfxu4DMoxfTJ1SU0kCt
 2Ga0iYVF8sRw3OMUU8+k7loJHey8iiDbwTBoI5dhXV5riXVC7vczvAqXWvFqh8dcTnV6
 6YvA==
X-Gm-Message-State: AC+VfDwxh4RqFwyKEt2aKAZDwgx5/ppL0D9hxnQAjO//n5G+mOvCjUp+
 8ttZMH1zc+sKnMQ+NXsz/k0EJ6zjsEU63N1PX1koWA==
X-Received: by 2002:ac2:4c27:0:b0:4f2:53f6:d4bf with SMTP id
 u7-20020ac24c27000000b004f253f6d4bfmr765351lfq.48.1685453816365; Tue, 30 May
 2023 06:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-2-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:36:45 +0100
Message-ID: <CAFEAcA8AF8+fZV7H8HnN3Zpv4w9QOMFnP9jRagHZO=CY14P8Nw@mail.gmail.com>
Subject: Re: [PATCH v4 01/16] tcg: Fix register move type in
 tcg_out_ld_helper_ret
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: BW7UC5oksVCa

On Fri, 26 May 2023 at 01:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The first move was incorrectly using TCG_TYPE_I32 while the second
> move was correctly using TCG_TYPE_REG.  This prevents a 64-bit host
> from moving all 128-bits of the return value.
>
> Fixes: ebebea53ef8 ("tcg: Support TCG_TYPE_I128 in tcg_out_{ld,st}_helper_{args,ret}")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 4 ++--

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
