Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1479770lft;
        Tue, 21 Jun 2022 13:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ub0QuzoO96Fo3LxgF9P8t07yxONlvqehZPHaPV14CULYtSps6Mc49K9iO3MpHj3VSo6AcK
X-Received: by 2002:a05:620a:4eb:b0:6ac:88d1:e545 with SMTP id b11-20020a05620a04eb00b006ac88d1e545mr11444572qkh.421.1655843142321;
        Tue, 21 Jun 2022 13:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655843142; cv=none;
        d=google.com; s=arc-20160816;
        b=oIZOkHzNnx2zzDNn636KfMKmf7h0cxWYSDsqr6TBp9pwYSiNOaven4Gbh5bIC81Wx0
         dvhkZR85hA3bcPnyiAIFjg8GntjmF+sRd5cewT4lDf/262wyDuPqVm99lzDCt+PbjSa7
         zzSU0BiC3MIPSzrNICoghoRbZ6LmZDQkZqBLlJM589DTAiRHPDJj/C0A5w3GOKUxO2YG
         tBUMKr1qEb4YoUopmzilSrPmFTxLKjqApLowDm6VkQT+wWYJG8inwsfHxJggXikJglqe
         kDjb0QjqNSvK/Ybd2PG/P+xYrIKany54q1at1cfCdecXtlmJuXL6T+ObDEPDQhZRsRay
         NBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0a77wvI3e6hZO199wXBDEA8vqz4QenN5q9UW72KPUeo=;
        b=hengvGOWYrIVXCpt8mAXMTSjGu5eB7DHHsB03txVwD6C6nLvA8rnDm3euFclwe3/IR
         Y2vWmiOk+8IsUAh2Go8JvS76IfLfh2yd1HSJ1wXK8Jh3IPtnjHcAlLX4cMa2PX8Q+nla
         LO9hAXZO2+Sx2Vr4Pd8gwQi0Zo8hp8T3bxtn618am6wlk43pTkClilb7BozjTikqJhRn
         krXYPelQr4M8AMBhlDCD1AiG3rekq4F+2x786lTrtOZnlkf2MSJzUPlXeUAvZzF48ylI
         2bFZi1sdM5Yl//eAaIcPJoKhuMzYVkgn1lcgMKPw4JBTNN/mX3rL2pBx9Wa573jrcZw3
         iJZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VW++E8Bm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05622a164e00b00304e70585f2si10915806qtj.372.2022.06.21.13.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jun 2022 13:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VW++E8Bm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3kRQ-0005y2-9o
	for alex.bennee@linaro.org; Tue, 21 Jun 2022 16:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kQe-0005xd-Ck
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 16:24:52 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:35762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kQc-00065v-Pf
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 16:24:52 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-317741c86fdso140879077b3.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jun 2022 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0a77wvI3e6hZO199wXBDEA8vqz4QenN5q9UW72KPUeo=;
 b=VW++E8BmNxK28FK4BkHERJQgtW/ChEiwFcccYvO2afxTcTNS4yOychceM1JsBufBx8
 6ijpFMVwTiHXzPn1KoH/Q/Y6itUhpKwZvpFBk6Njr4TY0NHdM/d8zIB9UIOzO3uf3tUa
 NyxEFsvcU+Z+J+YbOd4MuDvs5rCTV5WDuOQIrsAw8ZCjEHIURz0ttvzGddaPhjCLQVE9
 VFOUy2S3oku7/69Vl6iVnvtmPJRchAYxfdFeNrV7KPqrurtXf+VYzJGpCk91fmpM6Z37
 ipDVDrD6A4krWOeYckMjSehaPIdFcuDaFHMemNix0kIGIKX0/sj7yLWCA5Ii1FAs/CQ/
 qONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0a77wvI3e6hZO199wXBDEA8vqz4QenN5q9UW72KPUeo=;
 b=1BlhP+M4ddGL5ok1yenzIshoSN4c7hC5nMC4W7T+nhFZvzQZSYlSHRH05Ffroaabda
 sJj97JJ1PriOE5QqHFkue0IprNNIBylSdN0+QnAMLRKhd0TaYz4NOyHQUUMNTHC/hYlj
 S1DjirlFhE3Iy/dxu0yUgcI/D+ZnGx8blWz7iaRHkwitvyiGikKq1+pkzOJ9CL4vBXFh
 5GanOnDFINThjdw2CbTMnVdydgoPsjAm/JiY8fplMQ1NMnn2BSZbD5AKJaDE1PB0W4eO
 YgZrMPM9l89OP43Vu4t9WAbU1egPwbPvhWAMA1HUJLNSIiz51rQCsll9vvEuX64H+qCJ
 LWeQ==
X-Gm-Message-State: AJIora+Qqf6QSTtnbJ+Q9lC+RgqqVnLHiXBGmGPhwOfrRO0jZKeRdx9J
 WG4te2PlrRU4iiW4EGaEtltRrG7f9AvmxmIEYQOqLQ==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr20045757ywd.64.1655843089405; Tue, 21
 Jun 2022 13:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-10-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 21:24:11 +0100
Message-ID: <CAFEAcA8wfQhBxV+2xHpCJz_KWOrd5m=cj52QdgMQ6L2rBr46TQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/51] target/arm: Add the SME ZA storage to CPUARMState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xaEDgfM2A4k1

On Mon, 20 Jun 2022 at 18:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place this late in the resettable section of the structure,
> to keep the most common element offsets from being > 64k.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +
> +    /*
> +     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
> +     * as we do with vfp.zregs[].  Because this is so large, keep this toward
> +     * the end of the reset area, to keep the offsets into the rest of the
> +     * structure smaller.
> +     */
> +    ARMVectorReg zarray[ARM_MAX_VQ * 16];

Suggested more detailed comment:

    /*
     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
     * as we do with vfp.zregs[]. This corresponds to the architectural ZA
     * array, where ZA[N] is in the least-significant bytes of env->zarray[N].
     * When SVL is less than the architectural maximum, the accessible
     * storage is restricted, such that if the SVL is X bytes the guest can
     * see only the bottom X elements of zarray[], and only the least
significant
     * X bytes of each element of the array. (In other words, the
observable part
     * is always square.)
     *
     * The ZA storage can also be considered as a set of square tiles
of elements
     * of different sizes. The mapping from tiles to the ZA array is
architecturally
     * defined, such that for tiles of elements of esz bytes, the Nth row (or
     * "horizontal slice") of tile T is in ZA[T + N * esz]. Note that this means
     * that each tile is not contiguous in the ZA storage because its rows are
     * striped through the ZA array.
     *
     * Because the ZA storage is so large, keep this toward the end of the reset
     * area, to keep the offsets into the rest of the structure smaller.
     */

Arguably para 2 is repeating architectural information, but I think it's
helpful as a brief summary (compare the comment earlier in this file about
mappings between S, D and Q views of the vector registers).

thanks
-- PMM
