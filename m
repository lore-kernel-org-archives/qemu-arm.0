Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp32626njb;
        Mon, 17 Feb 2025 05:29:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWABvHwWlJay3m2cPiVCCaWbCjts55oDTJyJBJzna3IarWsux23YhL2Mz4O76VHjO0LyD8/9nVtUK2TlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH9OyvMr7aqR0sAc87+RqYXAgBKJCfyBEksF9KvBWMH4G5cJgbxSiDCNMgNvHV99HhChGf3
X-Received: by 2002:a05:622a:8f15:b0:471:f23f:91bf with SMTP id d75a77b69052e-471f23f92cemr32622111cf.33.1739798954157;
        Mon, 17 Feb 2025 05:29:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739798954; cv=none;
        d=google.com; s=arc-20240605;
        b=MuA/+mI8Rnkl6fhH5mSq/s6I2BvTvVhYRqPbEcdjPTrjmo73nLW+/rbLM4riyu95Su
         4rowzP+qs2dZ+6ea8O5gDu/dDhNn0/nyjyQqfbXaUXgnIoIYB0iKZJeDkjmUR55JKGk4
         Aslzwjlfj+ukWJDsYGGCjs5uWpzFZz7w5cRauj4lXbUzdTaqCKrvXNZchvxpu4b5bb0B
         uRVZ45bVOnXbVLHKxdWkcUPmov4sKlzq77bl5K7pvrAn4CtiKPPHcdCAe7DI1tgzN6ex
         2uvuYI8go9on+SjH/xZfdbZqAqzgSL0o+pxoKovp4RtTiYdoil+ihj7XS5Tb5uvokgxm
         r64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yryzwN+0NclVxJ3n1GoDSP0hqF7jJNbPE6p7nvejvqI=;
        fh=EVzexn9Sq1tr3Xo8AdCgawzP1tW6n3J5XBJZKRWEy64=;
        b=OV4Istt6pdGnrPSudX6Itj09vNLHJ/tbgdvc+mYqpk0iy1zO9g/K+j11LxzdKEwyLf
         reYDkJANggFGx+w1fGJmBqawmURVBZmjLcKNSSGX+0TWx3KFoOgBqio4jdyrB3RAzsL7
         bLRFByKEjzVp6AlW42kr/EC6HtMj8e4J8gMSaKAlX5nHkCQpWTfVgZc9jboTINZ9tbBm
         lGD5eHxAKN+z6S4wezeA607srQDhksF/mviMfmSeaeD6XJpGprbG4kmrX7IrBRUtbFtZ
         RQHI4ycIh36YRLkuj+9NJ1t1ctmkB99LKxIhW6b96hZmL/WbHYULUICLDog25Ub75VXQ
         d5wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1QIf5F1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b484e7si89554601cf.435.2025.02.17.05.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:29:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1QIf5F1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk1BC-0004Oz-Vh; Mon, 17 Feb 2025 08:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1BB-0004Oi-7f
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:28:57 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk1B9-0000Dz-9j
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:28:56 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so3376493276.1
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739798934; x=1740403734; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yryzwN+0NclVxJ3n1GoDSP0hqF7jJNbPE6p7nvejvqI=;
 b=y1QIf5F1IcW05g+Lhoc3GecySBNvWYhMxlcbrcm/bEeRH24hlqO/Uyq8ipgeUrHY+0
 I7XGAdYpEqLsxgcHVOAY1K9U+vomxtVi29d1FRAuQ4eF22Wje8d5balTp4+4rXD0JeLk
 aG98+9UG2bKrk8E4ZBkbPdAAziwk8TvMvdkRbHYLHUAFF3JWw6djyC/BHrN+3YHg8Ssm
 4ROm7l028B8BJ2/N1c0UyCQHZH/x6bJyRwQBL9W8zNeKrc2oUDqBfmcKrjGZ6GnNxDYD
 kRdB/N45I0rSaldsBTz4TqMRHQkX6tfxisuTw6Wan/ngXAwzm89S2fVyKJ03bCYRgnBc
 kB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739798934; x=1740403734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yryzwN+0NclVxJ3n1GoDSP0hqF7jJNbPE6p7nvejvqI=;
 b=n35xUOK31CdqihxP3LsLdZ993ZgM7kkYu+RYZju5Vo5syVBCUZLtIWLkFyQA6UOgd8
 J12LdaX6Z6AMBhCMdEeN2GExvp6IPE6CSOEnkApCgZNsTgrPh5vMNknSwiGbmzmwoB2R
 milM2u4HqGjX+neIMl94MtbKW9N1sENZZsjVvxe/bLyCxHM/taTwjmc50uKJ/rCdGxiE
 2RhFs4fQcXn3ty826OSXwzKwoHpN/DyV3SZiNI0iHusDN0P9/pcLYN5m+uBbKATdpUfJ
 BbcSrz8JOA3/iPKY63llSNywE7ORclSdsp/1QRXWewIp9nyFX7wDQ7B0MwS7mDoj0SEf
 MRTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfeK3HNjIKJIQ+Gy2KegbqcDZapGC6yvGGoU41QBTOrhHrSiN6Pt8/zrI8YDigaJNc/2ientdfAg==@nongnu.org
X-Gm-Message-State: AOJu0YxX3zfLeJ2gCh/H3xLFdVQUna+rGrwII1UH3x8scH2bHuxdvFus
 3OrqB+ZzgHR68ScDDunLzgJBfZsNx7ERFa93UZh7xtnYckM6kso5fzdjp9Ki8q3KoWVVWlpo1qi
 1RqJ8tXZt+VUJqmafXtQaCsXYsVE1AySgyzHaSw==
X-Gm-Gg: ASbGncvjBdobOus8NiSjtdYDrLD84IwIvZyudEoFgKaylaQn1eXjJjQecYryshPdY5a
 /Sl2VohSUGjJZfu5m0wN68bVRmjIbUoc6th90RXuetZu30biew/igpCg4TD5gKoVtwBZk4swkiQ
 ==
X-Received: by 2002:a05:6902:1027:b0:e5d:ae04:1e42 with SMTP id
 3f1490d57ef6-e5dc906b6a3mr5551988276.22.1739798933789; Mon, 17 Feb 2025
 05:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-17-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-17-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 13:28:42 +0000
X-Gm-Features: AWEUYZkbk0rPIphVtCUbMA3GIJdZVqihIG-mSdTsPhuwvYfgptdU6T-3_Lv1fc4
Message-ID: <CAFEAcA_Kasz0jMTQO1F32bMwSh6tRoDTaS2DE0sSruLENdcu8g@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] hw/arm/fsl-imx8mp: Add boot ROM
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: N/URUhX3eY6s

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> On a real device, the boot ROM contains the very first instructions the CPU
> executes. Also, U-Boot calls into the ROM to determine the boot device. While
> we're not actually implementing this here, let's create the infrastructure and
> add a dummy ROM with all zeros. This allows for implementing a ROM later without
> touching the source code and even allows for users to provide their own ROMs.
>
> The imx8mp-boot.rom was created with
> `dd if=/dev/zero of=imx8mp-boot.rom bs=1 count=258048`.

If it's all zeroes, we don't need to commit it to git as a binary,
we can generate it at build time. (We should avoid having
binaries in git as much as we can manage.)

thanks
-- PMM
