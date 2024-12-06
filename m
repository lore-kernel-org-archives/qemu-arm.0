Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp840572njb;
        Fri, 6 Dec 2024 05:23:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdDq6Okfp8OsWgsKZKFgcSdlTpeVGZbVjokqVVjc2VLksAkSf3rFH90a33Hap9kGDjbm17ZPPszohtww==@linaro.org
X-Google-Smtp-Source: AGHT+IG36y/u+FqT/N2/1swAVHXd2+5uah3XghmSRfxFEe4V29uge2LE/0gi/dWB62nNUX4R7F+T
X-Received: by 2002:a05:690c:8b1a:b0:6ef:6f24:d0bc with SMTP id 00721157ae682-6efe3c6c947mr20300217b3.27.1733491423572;
        Fri, 06 Dec 2024 05:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733491423; cv=none;
        d=google.com; s=arc-20240605;
        b=XVV/8rfxzp3IkP0JaItCdM3F2a7Oess2k8mpg0U/+ESMQvbYBR/U/1P7W9nnnn4Amw
         bj9Koa3sTr5z7B6+d7PSy4sAr/1OIJCc7S73L8kAH8TpqssrtzkwbM2sUtuHcux89dx0
         SihpTIjuQ/LnQjEvgXaV40jooW2YDKMh+mmAH+gHfLuFOkpkFrSXTC5MJbxrK1ckViZL
         aofUb5K+M0DrkVq5ciCUwL130zm7RlwOSa217Xl8TVL/5McYFVudFpptVdwspn+Mgf2Q
         2groi2G46KVefsRstbfK1Aj5DYyn5iImkJgjvIm6B7EqirdG1FHDJKxG4GWaDDlsd/al
         02Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Z9xhYEb0O3i/4W/fQ5Pv3JovXnI2mGhEkf1tiEnaxSU=;
        fh=MkFoVRntwxNKXUcnDhNteHQ/jycH91fCF6z5KczaED4=;
        b=VvhdfzVvoEEbutNcBG19PUr32gESP+lnv6yirpsL+6YsM3ULvnu1WkmHMosDbhEF/4
         svNwbkf0Ka3TCHPGeg+kfGtLRvM7mei9AnkKpJ95rzqmAJUdUtA4YNjAo2Pt3dRbsgKz
         h6RjxzB3ZRMYdQJ+MPSrxpG+c6RsWuvJLpSWOS0Irl/VpmU7EzOAK6NKsDXK6SXTWaTK
         KtNPoqgtlvXwMZ5q+BNGFwUlULaEy9ux/II9IG8A2rLxHfTS38pTysPo+p9cHgSnd6bN
         aOEo+79ubzgZCpd7BjEctfLylXniLBGmpwKDllaBalGsYri9+BU2CUYqZflJqN/gmA0Z
         mEpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRzCkiRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297ba2absi46801711cf.254.2024.12.06.05.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:23:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRzCkiRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYIo-0006Gl-Ec; Fri, 06 Dec 2024 08:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYIn-0006GQ-8x
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:23:25 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYIl-0001Zp-R1
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:23:25 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d34030ebb2so2207223a12.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733491402; x=1734096202; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9xhYEb0O3i/4W/fQ5Pv3JovXnI2mGhEkf1tiEnaxSU=;
 b=WRzCkiRuMtSar5XyBRIaMBYbNEsVVA2YgqVOqFEfywOt1gqpb5vGsEPtHo90Kb4nNG
 2mUZwtU+NM4Dp6eeIcCIuUeLeH1HqGIXMA/wIqlQ2iKOU1RVRcIYLEg/do4EkAIv4T36
 CryXzUsuTzSDrXPXB1YXH+rcfadV4QITVLuGxUORiyfBAgLzLZmC0icIYbss7+LJZOw1
 YxKMsvHuHi/rrkMlGpcaHa5HjKXj+9z/cIXoGhZs4dXzKKcCfVHY5bZM35InyGtydS06
 gjEAbbdAFKpWT1+fwg4/wwijAgOP9ccwkV3mxNfJ10Qf6gA9rE3K+NPcghHo5rX21NKJ
 x7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733491402; x=1734096202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z9xhYEb0O3i/4W/fQ5Pv3JovXnI2mGhEkf1tiEnaxSU=;
 b=OU27R0rdIvRC5Jy88DXzQZG0LCf1fa393+Le2K8j/9EuY2pv85RrbcQQjx3goolDCM
 +QAxSQsMZmwXzlNIzTbjlRED7X0hlWJWnKE8zHeviC94+ne37dAarMG5nkOkKerSvlil
 jC0C3t9bCaryaM+elp88iT1A3TDhJNDIVRvpbo/6he64806ALGzuIqIcDJWtwp47Mzvc
 Dddh789UY+k/ss+8hYyWoNb4WWC78KqmXQHBIEpmRUfaef5RlMGRPDp2KHrcjjZUxMoe
 GRuggkiB/2wXeE1QU9E4SPnKshv52H8lsdfdzZk72UlyzSRi0MTfCNmOFiUUsKBTJFLc
 d5cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0BcJLNZa1Mc/nKzSdIDgaPSms+o4oS6Jqt+l8ElhsKnk3XuI8VHvVGlVxf/+ZZF48Imwu6zrkmw==@nongnu.org
X-Gm-Message-State: AOJu0Yw8P2LfQpllLWcz3tS0y4CtZt32vQ2NmmJ83ea9zgZsdkC5IhAc
 xEF8QyE1JYGGvGpkY9SVd5qwwo98aSCBO5nSzlNmM1umYh244+7Xtv9MTVB8eUhZlXLTS+DLR6A
 JZGWvgvAOmHnq47N+6kzgoeqTN6Q03Jvh5McLoA==
X-Gm-Gg: ASbGncsq71WS/1Chv/3o3M0v7KMUSNK7JDZGyvqPs+wNoMfiWnaDg+ayrsFDU7HzzUS
 Se0HM+IZXsxRdx1fTRZ3KcKhinePSZ14f
X-Received: by 2002:a05:6402:354c:b0:5cf:d078:c9dc with SMTP id
 4fb4d7f45d1cf-5d3be763173mr3024162a12.22.1733491401875; Fri, 06 Dec 2024
 05:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-28-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 13:23:11 +0000
Message-ID: <CAFEAcA-fbGrd7R8FXnJL+wHx7FSSh4Hctkm2m7MCJmZuvf4pSw@mail.gmail.com>
Subject: Re: [PATCH 27/67] target/arm: Convert FRINT[NPMSAXI] (scalar) to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: bLHpuazMkeMB

On Sun, 1 Dec 2024 at 15:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_fp_1src_half as these were the last insns
> decoded by that function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 107 ++++++++++-----------------------
>  target/arm/tcg/a64.decode      |   8 +++
>  2 files changed, 39 insertions(+), 76 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
