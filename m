Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2082803ejm;
        Tue, 2 May 2023 03:35:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54GXbGj2rVC+Ejkbl6hsLLlDVmIjtLxE733C8e8NrTYQNqw7xK8Z0rlNw62fxrNgqa4tz7
X-Received: by 2002:a05:622a:ce:b0:3e2:e71e:ff78 with SMTP id p14-20020a05622a00ce00b003e2e71eff78mr23252272qtw.55.1683023718054;
        Tue, 02 May 2023 03:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683023718; cv=none;
        d=google.com; s=arc-20160816;
        b=T87OO27DX8P7uIdGaqdx9WREx/6tlv/4jxVFvaB9S+gsvitAnRMlbn8MJUaLq/687X
         YgulmEaE4A1E8+VFR/6DoidoDi1geX7jPOTxjgFVOOEBFb1e9KQbKGnqsTnUGNkBk5Ge
         zVfHKHuVCNqdqD55Cq77kx2mZOv+ShVVVBdf/jhGstqkzQ0Re6YY8CGeMuuLQsryHiRU
         ml/92OOdVYVAcjdOtcKierCmFmCc50wzh1/5zGTrGWle6oHFAZQ/tBQIaMu7puOlAtcq
         yvz2GI6JZNpJle4GR2ARw6bZVcU7F61hMZlCEVN6zTvECrAEOMmvO48l2U1o63mWEIzH
         mhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aiyYJ0ImMCySqbDkjLm3Tw3sPZflI84Ir4EXdvP9qvE=;
        b=c0d0tbdNZD5Ta/y9eBDwaCWgxeTy6L5R2SQXLRE5oUJkysndkyczCN4IumMGKYwgri
         hVwUOhJajxi9+Wc6sBR4eRCvqz0vLM3qKajkJRMTOpPxe5VuPQeYXZRegtmNsbOWqoh0
         CBmZgo0KaYxcvx4DC4gGDbC/ysnBlGdmpLBo4doIPbkKxKue8f3KZhel7q6eiOPdhiS7
         dpyFnm82BPQpuGhldg3lyKzIJAUM2y8RX5DGJ/ds4GuxKjXN4bRx5sbBp6rpH46RYorL
         aoqiYnJ7p1MMTXJ2q/L1m8Sg9nhGXrt3hXgmC9w7Aaadmed1GZEhwceqG4Ub+LqmPhI1
         PhLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/Ums5TV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020a05622a1a1800b003bfbfdb9660si17667478qtb.11.2023.05.02.03.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 May 2023 03:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/Ums5TV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ptnLd-0001UR-5i; Tue, 02 May 2023 06:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnLb-0001UJ-83
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:35:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptnLN-0000YB-Kr
 for qemu-arm@nongnu.org; Tue, 02 May 2023 06:35:02 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so3702800a12.0
 for <qemu-arm@nongnu.org>; Tue, 02 May 2023 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683023688; x=1685615688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aiyYJ0ImMCySqbDkjLm3Tw3sPZflI84Ir4EXdvP9qvE=;
 b=q/Ums5TVJxromK2CxRJRydvJTjFL7pkXy0ftucLBE9uG7X7L5v07r0INM0wjsz3hmG
 +00V5I6hPTyJx5lkzyOu4/3ZiiCF6zpE7z26jT6UkoeZEYNYJB0BU624celIyNtse5yD
 kWG7kkWr5qAnxz4ZsYt0d+DYFYiHnRGGbRtqKEEpi79xwNW+hWPjI+xwgMxJ7+zaITPm
 4u+J1mELyz4ZCe1b1xAytgnLwb0OJLjQzCgbfee5tq3Gf5daqRahzYd5TCjnInClkmP5
 xpWatkPthvS2ijakAahA2VH4xcWewsAiyYoARBQG8PY9e46ghyhT+eQ1KAeIedixEWCM
 B0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023688; x=1685615688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aiyYJ0ImMCySqbDkjLm3Tw3sPZflI84Ir4EXdvP9qvE=;
 b=c/HDF7OZq7Eyd6fQ7iT1ADMQdneXs9JDpN4QCzc0bmmykPfABwMt0+92lGfKgwgI/H
 ja29wUGY1spG7HdHh/TAMZJWjYIf8X3GIA2I8qFDeAjXz7/bRZuMIAo8GDsqvOeIlKG4
 VQekFFMiIyHX5SHJBMiVLex96NAQu0LMycZAXZN6G0A3xDugOhACNYSF3kvX4f5HucVf
 BEB/8A6JCYeG3Aih5uXuETVEDBjzo/B8NAKfFRqc17hPXZCB3x2ai5s9it3mlz7RQN4b
 vFFL4cWMuK+AbTbjuygNFbXW9m+F25qV6gt3GqUoK57+KiktjGnPA8uhg3LdywO23eF7
 A+IA==
X-Gm-Message-State: AC+VfDxcqocEBm0cpMD96TlV9a7k+yS6HZlF69vA9adv85GsHDQxVKZY
 ned5fO7WzTCJ/GabUOYuB9Y1os0MyGfXObk5JUn689Kf+zn8OigZ
X-Received: by 2002:a05:6402:2709:b0:50b:c350:f9ca with SMTP id
 y9-20020a056402270900b0050bc350f9camr7151387edd.10.1683023687926; Tue, 02 May
 2023 03:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
In-Reply-To: <20230424165053.1428857-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:34:36 +0100
Message-ID: <CAFEAcA88OoaDLP8i1opv8twb-a42QaMAbNQCh6g0FtHLfXp7Ow@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm: allwinner: fix endianness bugs in sdhost and
 sun8i-emac
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: q231G736rxvD

On Mon, 24 Apr 2023 at 17:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes bugs in the sd controller and ethernet controller
> devices used in the orangepi-pc board model. The bug is the same in
> both cases: we read and write a descriptor struct from guest memory
> without byte-swapping it, so the code only does the right thing on
> a little-endian host.
>
> These fixes (together with some of the others I've sent out earlier
> today) are enough to get the BootLinuxConsole.test_arm_orangepi_sd
> avocado test passing on an s390x host.
>



Applied to target-arm.next, thanks.

-- PMM
