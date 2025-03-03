Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2651656njb;
        Mon, 3 Mar 2025 06:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9+CzDfCIZsIprvQUCCk3cmVFY3mp3hDHyn/tmhHjRquu65NNjCtxT8EU5zbm1SCTW+n6RJRdmVOUqUg==@linaro.org
X-Google-Smtp-Source: AGHT+IE2mwohneD8qOch0K2ljBKZ9tTKCnLKglTQBYQX3ZROV0NrVoAdUpIQAyKa8OQEKLIEiCLf
X-Received: by 2002:a05:620a:26aa:b0:7c3:c814:5919 with SMTP id af79cd13be357-7c3c81459c9mr125595585a.11.1741012425686;
        Mon, 03 Mar 2025 06:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741012425; cv=none;
        d=google.com; s=arc-20240605;
        b=Iel+O7/uACvoneB+4w3hN08nzotK973J8tIjgH/gWMtdcYXC8tE+Ta1nTmqO0qL7Sz
         SKVGySTIHQCIfMbFmw5rTzWrS5iQmo+EuUGzj5+6/xYbJXWdq7rmgqk5ltmrUZT6W4UB
         Up5WVONCqYLlMR6l4k7mSZL0vHP7hxsuJliO99BnpoSukIhOu7SKor8wjAgCTrOv3pnX
         o+Bgnipc1/UCBPmjiqfhODYYYQ/AjfMLDOdNYbRU/JbYoSH2yusG8LJKvIbckyVEyIMz
         OkjO2U9V4ZIiKUBGsO0eKl5tihF+668EYQFL95htfLFyJ5lCGuZ1WonQSuGccuEDL4tk
         KICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BG94PURy4Kn2Bfua32aXt/Ze4/q0cpT4/Ty3kd+QUZo=;
        fh=GiVVeap2IdcJ5YqpCun5H2y8p8DEDbFdBHAWyN0OWoc=;
        b=TYwyb7g9ULaTAn+B623wvroryxM8dsi6eKBIHDS8um85Nr4Ffl9FDh/Js9uKMlWSfB
         KZVDL/ZQUoa+1clknyF1NoXMQ7Rm9z9rGoT5wl8v54f7CUBNWrLPvXBAPUw+7p+RAg6h
         +lnDQR93QhsCVlvLIgNWa5fx6jwpniNXfCyBPeUUTbn9xAfHyoTYBhIpdpE2vn4Dux+O
         yyNnM5LYmeBYVYmQsaZKkw6Qz8bekE+9GdRzd2gxDfKfIm7CfvlmYjrBrG9rQqYbCUKp
         vl0YLlgjBDCi//iE8nIp0FYXlgVzEiIIcUrwkrghZ+lZQ3d4FMNXhjq9QyCleubXwfwy
         IvzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2AfOu7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3b7df315fsi252131785a.311.2025.03.03.06.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 06:33:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2AfOu7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp6rX-0006Tp-Cy; Mon, 03 Mar 2025 09:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6rK-0006It-Fh
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:33:36 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6rI-00039t-8n
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:33:29 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6f7031ea11cso44204377b3.2
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 06:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741012406; x=1741617206; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BG94PURy4Kn2Bfua32aXt/Ze4/q0cpT4/Ty3kd+QUZo=;
 b=K2AfOu7vkrVuyl+1cA0LBurjiYFpdIwuNflWz8YX0zDQyrFqcT7fAfwv1CBEJ+tdER
 gF2p9OaRwOeq/SHTy/wCdyflhJ8flpbFZ6A61DTDq3M2O3UjZJKl/TCNJVUVuirkGy/R
 Oo6mYJ8ZrhAJ6RtokwOAMDLDH7hPaLLZ249Pia4WliQZCghegtwXI6EybpzbF/Uh5u+U
 2RveJ/NKF4VhannDWYiWiFs7dWS4H3S6R67LZlxKYmhllkhqV4mcfk+Gjn4dyo9unWy7
 nzXWiP74FHwO57yPjfK3RMr5P+1m3UEQcGP6ZzWTQAfHbo0O0Zo8zfRzed/Ycc/L5k7q
 SWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741012406; x=1741617206;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BG94PURy4Kn2Bfua32aXt/Ze4/q0cpT4/Ty3kd+QUZo=;
 b=aLRGffaKRd1q6eGgxESQi2tsZKwXiytyl7Wg9h3zgGdgXr78Dt2avv+J1AtKDqJBfA
 XZLh3aGnvTFWSvXlGQ5jC+npSkAiptnaR0ZaKljiStDYQXK/x2rfu5eaM3b/XtiFLz8p
 lSFwsRjKx947GwjDbbZxbBFn9dz+vCGZCJbvkyTyilz+zxjLsfmDtXm37Dbji6VkVZDc
 IaIJ9lgXAXa4ftHNYfuiKASi7Bw/hJHwvVYE1GDu1LzWjY11iRjiZX6L7iTy2XT8kZ3W
 tWIra1XQ7t7m2iFnF2efcGqtUNR0zh3K52UtvR01ae3wdEHHdOvSc0xjZiS+PK9Rni7k
 aUxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiXHh0fs3CLZkVmI1mT9Txif+xOlx58OIUkLi4l+kAiT4UnVypJhaE1BaH7+oLt/DF0yC9gXBYXw==@nongnu.org
X-Gm-Message-State: AOJu0Yx4a50IUR7Jf4mA0iJeUk0ZglF6P53K+Ehe4LakN+6SYT7k+iHU
 fxj3msdrYRXQB68nhVLwXwtgE1rDaiZ8fKcGeac9glgdBVnUs9CvtgyRDnCA+kokaaNWVYPLO9p
 ggXddqMrcvgsPV73EhCEiA+29SF+DCZKaMX9eIg==
X-Gm-Gg: ASbGncvTE3bAWdTBbV9SMZweGRZ8SHdeOuzOYBZIMmiXV2S1Z3yVFHrh0+BLdKmRN1l
 avwPmXPFiuZg7zXXq9oReAoHktLW0/lhOohnvsolZiFiV7qOKfFtkU454hlAJDp0aB1KFUtEMcL
 zhugxlx6iIujYgzrvkhU7rULZwUKA=
X-Received: by 2002:a05:690c:6382:b0:6fb:47d8:79ba with SMTP id
 00721157ae682-6fd49fe0297mr165608147b3.16.1741012406716; Mon, 03 Mar 2025
 06:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20250225074133.6827-1-kuqin12@gmail.com>
In-Reply-To: <20250225074133.6827-1-kuqin12@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Mar 2025 14:33:14 +0000
X-Gm-Features: AQ5f1Joi0jVIjWjz2dEiebZ9_9YaJNZyiE_bRCgMIVi-PIGKdcgenlOHf-vs-k0
Message-ID: <CAFEAcA__w8-nJjP8zPk=3vLEgwOcoXa8K_opqeEo_UYBo=skhg@mail.gmail.com>
Subject: Re: [PATCH 0/1] Adding TPM support for ARM SBSA-Ref machine
To: Kun Qin <kuqin12@gmail.com>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hdE500WBBYfK

On Tue, 25 Feb 2025 at 07:41, Kun Qin <kuqin12@gmail.com> wrote:
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2625
>
> This change intends to support an ARM64 server like platform that has TPM
> support to unlock more power for sbsa_ref.
>
> The idea is to add a TPM create routine during sbsa machine initialization.
> The backend can be the same as the rest of TPM support, by using swtpm.
>
> Sign-off-by: Kun Qin <kuqin12@gmail.com>
>
> Kun Qin (1):
>   hw/arm/sbsa-ref: Adding TPM support for ARM SBSA-Ref machine
>
>  hw/arm/sbsa-ref.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

By the way, single patches don't need a separate cover letter
email; only multi-patch series should have the cover letter.
This isn't a big deal, but the cover letter on a single patch
seems to confuse some of our tooling, unfortunately, e.g.
patchew fails to find the patch email:
https://patchew.org/QEMU/20250225074133.6827-1-kuqin12@gmail.com/

-- PMM
