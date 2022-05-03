Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1557708lfj;
        Tue, 3 May 2022 10:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyZeaQsrXVg8hPwQV+YVsTECpCvNvKtQFTAl44qmtYdtTleLzJULB828KtiT7sprlO8gZS
X-Received: by 2002:a05:620a:d96:b0:67a:ee04:d947 with SMTP id q22-20020a05620a0d9600b0067aee04d947mr13493197qkl.237.1651597923609;
        Tue, 03 May 2022 10:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651597923; cv=none;
        d=google.com; s=arc-20160816;
        b=f66v3lXjLRvV+TTmbNjgZxPSSSJtMIvlu1K+s8aAKGby7/CBTqawzPeSOily3UMhwq
         DevhJGTfLzLhWlL0pQtRQX+SHkwlSOF8/f0353/h8PVHU3PR0d7/N9UxYNKCVghT7OMk
         uXN/0OjfWFCjgGx98MJnodvoSALQJKT1BOTJpXx7F7dz4DaKXKJ1N4wCsrJ9glW2DEJx
         g2JAhIZFAkKAVrQC0vEzhMQDiBgOCnK4WdVWoU85bqhdxd2exeCKnMY3b8Gdir/75a5g
         ay7LFqLgU35mom+ao7vT1a20mFxe2bjcKs/rX5pU9Sne9Y22CeDzVkljzQCClDIdJYTu
         Xidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=r//vFGk0Yv7h62VAJMS8wStI/+Sa+nCqE1h0xk/1u2g=;
        b=GZT5VPvQTn9KrEhg6uSL0Ybz2EFOi+BZLAlwiW87N4rUzEsXY5ZZXPpCLuCA2F6H5b
         ft5pvi9G+Dkshlfx7IDPU0BzCuUcQb7lxX/VG+qids3zTLPoPI8QZ9HGU1bMWwebb+pK
         CmXjSOMeNodrD0lvIbNidiy17qnmn0zu0ZP49Hfaty5eFKdvsywci4yp09VZeYH1YRsG
         OVToSa8pOP5EaQtuz0hNCp2RuP/RxBi0J5BN/37GyHpgUQRkPZWGGx5hnds4fwExOSFo
         LIEbgmqF7aueYZFCPq2yjjEfFOy0WKK525SDW6iwPiaGDSuFLeFgEFdkFb/Oh4VHeNXk
         EYeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgc9ArAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020ac87f52000000b002f205c68ff5si8672538qtk.515.2022.05.03.10.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 10:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgc9ArAP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlw4B-00018J-14
	for alex.bennee@linaro.org; Tue, 03 May 2022 13:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw3U-000184-H5
 for qemu-arm@nongnu.org; Tue, 03 May 2022 13:11:20 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlw3S-0003Xs-FS
 for qemu-arm@nongnu.org; Tue, 03 May 2022 13:11:20 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f7ca2ce255so186872077b3.7
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 10:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r//vFGk0Yv7h62VAJMS8wStI/+Sa+nCqE1h0xk/1u2g=;
 b=fgc9ArAP2zX4As77WjJAeiW5bIPeeDnH4n7dxJaRX7Yi13xGyPz3Z1JkDSAKGRbp1N
 okDrUOOKiydeSc/pfIc3a2lazz/Kc3z2Uostv6LKp+nMB2DZaxoLkH7O4IkIZdjSmxl8
 7PwV5BWI/xO5RRoGTZ2bRXI7inlx/AE6xP5NzkHSNtZ2wFKxJKpRSfulgnZcbGzGYgOf
 SKwF4YhinywUEiW3iOBD8CBaRabhzdPKRZrrtKBwQ0dCwHAJzoAOlnU242wpDPyd+98N
 vaknmRBe9gerxoG/4weNVGbQcDNB7kdxHpr6pemajT0FdZeyprlN44hz61vPhs9+2FD0
 bVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r//vFGk0Yv7h62VAJMS8wStI/+Sa+nCqE1h0xk/1u2g=;
 b=C5UpfpS/sXROhAkVA5KkqAtpl/Z4qxOVaCkKbopzN+7YiIduphQY9XoEdrTl21tsAb
 zQNO82NztF/1vOjlVQPMhlRlHpwZvZCgeWo4+huCeJTYkkmP3Y1HldlFDH0cEKzYsFE0
 N3yhac7+R8U1zRakBMuNULVl7n1VRuwD2WVC9AuigbNNAlEYs5wIf9SMZdSyHv6du+4e
 hfvKKNtHfkejklsRxIsUl6r5P835WvxLyl1R6xr0DcLxaqlu4j2ESkJIyJW2/qtXiqFU
 DxP9NzAW2UgYb6Gti/bLgGSI3Z5kjR1KQWHX6sKAv5KAjAYgHPaslOrjM5+IC2JrIOKT
 jHbA==
X-Gm-Message-State: AOAM533JCc1cb+92VcEBoPP9HWSD40ydrR/8ZOAwaxQ5lHkHVbAr+sZo
 5jqANt/V3StHB5oxYhJMRBmd/tTsKUedPz05IksVpw==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr16061286ywj.329.1651597869116; Tue, 03
 May 2022 10:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-42-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 18:10:57 +0100
Message-ID: <CAFEAcA9fWYT-2RucwzmrNhMxsUqu3zd338aBTGv7-tFraRVrAg@mail.gmail.com>
Subject: Re: [PATCH v4 41/45] target/arm: Enable FEAT_CSV2_2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q2X70EA6fz4C

On Sun, 1 May 2022 at 08:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no branch prediction in TCG, therefore there is no
> need to actually include the context number into the predictor.
> Therefore all we need to do is add the state for SCXTNUM_ELx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
> v3: Rely on EL3-no-EL2 squashing during registration.
> ---
>  docs/system/arm/emulation.rst |  3 ++
>  target/arm/cpu.h              | 16 +++++++++
>  target/arm/cpu64.c            |  3 +-
>  target/arm/helper.c           | 61 ++++++++++++++++++++++++++++++++++-
>  4 files changed, 81 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(The handling of SCXTNUM_EL0 should Just Work for user-mode-only,
right?)

thanks
-- PMM
