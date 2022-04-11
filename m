Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1610657lfq;
        Mon, 11 Apr 2022 06:10:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDsn2GhdCbSe6P0wI3nWGe77Gz6kGn+zymBTKY0Tq/DAl59te9SwgzfOqpHGixfxyTTInd
X-Received: by 2002:a37:54a:0:b0:69a:f10c:f533 with SMTP id 71-20020a37054a000000b0069af10cf533mr11024205qkf.525.1649682606855;
        Mon, 11 Apr 2022 06:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649682606; cv=none;
        d=google.com; s=arc-20160816;
        b=e1GiMtTa+QHwLwNWOltKTQ6cVLkcwx6f2Lr1EcCYEoL3uaCk8MPT+jj/uhH/96fZO3
         9NRSQ9ecpxu/JmcbO/ILryU7Lxnb10M8VjPjVDB7V9oeCz0P4CkIcgFvjNQyOpHIw00x
         FzZs8D2Xt2OxlwfZRqQAydU8ckP1UtXWqcArShiQyaHmi8z/JC9hcSVO2HxYHNkOkTkS
         +xoZep0N7lWByVl++Zpq18yl7sUsTGlaP4vf4ZFFBSmK66vCb7x8Gr4FkoUyrrNezoar
         p31G600PmFiIvurBsJYzGEqoTSoUL26vnHeBzO6kaJA8LYnhLo3FwVZXn+WEfOWQodWE
         hyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJeXZ6fkngkty4VM2TYGySPqW8K5Yykz+a2ja7udUu8=;
        b=VjjNJEPQiZb7NOm2rG4EYs7xxjEArmXCYHZG9U0c/YMI4XKZc9RwWs3uUo80aPKe+7
         5HQ1Xleube3Sf2p1MqjL5FTy94Gbn17rLGEVAQIb1vUtdrHAurJ7A/dLA3Ncnl8Dw/pQ
         VCzyq3XChYGS5HsGIVCPUq8z81gp9zTlUFGGNXmO4kQwAhH4ikVkpCJ4tcgcgckGXgjt
         FrYXYDNG44iL4yuFV6qTZf8a13sbwosAaIpMhRtlHRB3TaoerS8fYRtAroIpfKbdFbUJ
         6MmE34LE6RUxdtgB9aLdkOQqAMIGRxQUc1FJDeRCoaoHZJbqhzKTsnKBqZxG5uzu3814
         fP2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IfjUvnt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q27-20020ac8411b000000b002eb8e71940dsi4882282qtl.465.2022.04.11.06.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 06:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IfjUvnt4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtny-0000L5-0c
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 09:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtng-0008U9-0w
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 09:09:48 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtnd-0004oE-FT
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 09:09:47 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec0bb4b715so35895617b3.5
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJeXZ6fkngkty4VM2TYGySPqW8K5Yykz+a2ja7udUu8=;
 b=IfjUvnt4e3qZ/rx010h+vWX9AaE8mt79YXdyJThl4cu526lzr+yawnIkc8pPbNtqVP
 16rbPfNGRvz9DJoChZECiBoBlU/GrU/IW/fY7HNLabgA1ZxD6oMlLKQbfATAA8g86X9J
 /eLFftNtK5IJjwiBwdjn9N9qbPEHu2FZ3dDnBlfFrgIizeVHTQMv+YlpEvMq1YJInTlU
 bH+ezePqW2PRev6h1nqmtshKQjPKMUoOHw/0mNVQ8qz+f03tTCK65QxWHhD+GAvlxpHi
 qPvSaqCsQEnUBAoESH30lfGpKnSBC/o1jYzgTdkCkCsLiukfxzbqZMtLhy2fl5Y1Fjak
 GQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJeXZ6fkngkty4VM2TYGySPqW8K5Yykz+a2ja7udUu8=;
 b=Q55rO0UD2hfEAQCMB04BuWh46vnzsIO7YPeE9E5yTMJN8QEJjUnEvB/6GDOnneIXnN
 pqRFvFLpVUWcHpUuQic/IkvHWNmlma2fbNJXpAVWgVfcgj/oc9cIuRrMmIEgxRY3+JyO
 1ZiD3LuPY7EZCWdDq1+HylBmW5B72FB6UkBn0xeyU2MvC+VuPLppx4orRqbyVNah9mxW
 NcTWjnlRJUdWG3qRkN7ithx3SdrkW+m61hOi8a2REZo5iND6WQXNeYVxzYIaz0dV5IMp
 R9xnPOvcmivvC/1dVj/yaw/Anel7mMT5fdCibFvOHhunwIxLe757LxPoSdGr/1vqSiu+
 TIow==
X-Gm-Message-State: AOAM5333opkiFyRt9PoihVXTm1UP3//6rU3iLY6fD77QscjR7Cd7Nl78
 8IO5Pa9xeFMtW0r3iZu2uVH+4KYyMTED0ULJ+qdB4w==
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr3580609ywt.10.1649682584115; Mon, 11
 Apr 2022 06:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-9-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 14:09:33 +0100
Message-ID: <CAFEAcA-b5RHzJ0BxeyswL6C6Cr-6fzRF_a0SVkLdWQo4Xs6=dQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] target/arm: Enable FEAT_Debugv8p2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Igc3v3jtinA

On Sat, 9 Apr 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only portion of FEAT_Debugv8p2 that is relevant to QEMU
> is CONTEXTIDR_EL2, which is also conditionally implemented
> with FEAT_VHE.  The rest of the debug extension concerns the
> External debug interface, which is outside the scope of QEMU.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c     | 1 +
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 2 ++
>  3 files changed, 4 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
