Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp500816dyc;
        Thu, 3 Jul 2025 05:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDOa3kVu86YiRNtLEy5J82u1zPpZI7BVE0WG4Z29nfEug3aSHHRP+SgNAr7w7w8ly3Y5ECNw5yQfwtww==@linaro.org
X-Google-Smtp-Source: AGHT+IFbfn1nDeJbsIw9Ib9PV3xDdKOa2oHXWGGoe5N8/wpoDNphII18WstFN8bleh22KJIgj9bm
X-Received: by 2002:a05:620a:40d2:b0:7d4:6506:cb63 with SMTP id af79cd13be357-7d5c478ef7bmr825565785a.28.1751545815735;
        Thu, 03 Jul 2025 05:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545815; cv=none;
        d=google.com; s=arc-20240605;
        b=UV+9l1jKd961e0LGzRECQPa9KUVEafQC3IFifl+oMnzNLqWPBqlt8+RoqSQyWrlaTg
         lASKrjwGULSJd2GaBbpQccWUToOVA0WRZLO0m0r1h3mUEE46c+XMIXuTefKVzOHuPWe2
         g3HrH75y6iR1XBUO9ieLhwc+qguvvAMD6G4EvTF5waKEVRtVqgHBJsK9o2O/XDnTf2PE
         n4nA9s5Yx/JM/2E0h3o6aqqBdmOTVcjKjLR3mxW6t0IR1Tq7sHj5HPH+2rm2cBp/PYZh
         wOMs169TC0nVtYpYZ/G0sdKmBF8caU0vmF9c21j154MGhkdbR9Au2PoqICGGjYh3K4mD
         Z5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qqeYmTZOQ1J4jUBfsP801wja9Cm6P1BqauDBfzgFlh4=;
        fh=Pbck7cowQldOfDfbP+bNI7oeO8HeijnmHwDR/LDMADk=;
        b=ExD4vNdViqy+G8gM1fJO7aaQLGLjBOoRGB2QGe6pu29MFjVhkM+R6ValBBc2RerCiF
         nbOQj4CEP8dfNsRdVBaDgGQ4ZLhHpZ8mzWODx79UaNrgR0QsBzNwpBIuWZGeHbg3Hh66
         ZV3z4frgHgaq76N50BQO02mPTUYmmCmbL6aqMl1qorS9ucFi3LWPFD9nSvV7cHjEOdBR
         2WlZCmAhI35eY8pl8W5dijUmuHublYR7cU+ScD6KrxCL4VneilgLbUHupBhDASlvsM5o
         9SFfdmYtmf4Q17TSA9yadLVDfuFQ9WnXedua1BgPquLmRbJ/zxbRIeNfvqVJXmmbz934
         cDVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oFNWFZ7K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443266725si1517685585a.410.2025.07.03.05.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oFNWFZ7K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ4M-0002Lp-Mz; Thu, 03 Jul 2025 08:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ4L-0002LK-II
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:29:37 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ4F-0005bC-2I
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:29:37 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7111d02c777so52836357b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545769; x=1752150569; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qqeYmTZOQ1J4jUBfsP801wja9Cm6P1BqauDBfzgFlh4=;
 b=oFNWFZ7Kz8z41Cy2KcO8dyMMTh5lE30lmgKakZbP2mvyY4ZZH+z1e2jDWDBto/ACPO
 DIq4jsKJ8aR6FqGXJpnJtjtVWDHpDtRm9YaGwflI+En1SkXKqMLC93O0YjKxGGaLsD+i
 h4IWOHnNkjQm6bxF21tfcXeyPKwCBDLHz5VhvUG/O7i2N3Tf2zXQ6t8MetiXmeHCAh1h
 7UyMSj/1Y3+1Sm+0BhuMdI8Emu0m3IWXiW8TwgxHhztwHepG42qo6XOZhOQpkM2ty5Ge
 /5IvQ/TGL12VX3EHdj4o2qPU8nYXG/FCRAvOmT5HO8vA8x7MouYZ/RcV1AOWNhnF0ziE
 dfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545769; x=1752150569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qqeYmTZOQ1J4jUBfsP801wja9Cm6P1BqauDBfzgFlh4=;
 b=F+fJbiMJEVL1pO+RpHI0vGFJO0ZVsk5/FaYprL2p6l+S8HipAzQiZVBwLj9WNGxbbx
 4b5MwMOhaKi96YlPXs/G05eMrZoYgFyqsLP2QshezUEMSU6F3adEM5QmGUNfnjKsGYgK
 vuE3nI/iEZFjmKoospBPBxVjOByvW5S1mzfv4UxYcqs/Xy4kqLpNpTjdp/Lmn+b25+CX
 qeABdVfOxRDijYuLyo5++ZWHPN6kAeh5Oz4fF1iAutt2reMk2ftQEKtayKfeR+V6T4Gd
 P+CZ0lvrmvVei5CqgbhdhwEpzM6UUf7mhRJkUXY4DMjuwRSVRS9QwNbpDGi5ClqbeaNS
 TszQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVcxE9xmsuROGkL/5WBz5OEVLPvL8VK9qzuODjpXUO5R7Eavt+eEyUNboCfOjxe6b006iGFFo2ZA==@nongnu.org
X-Gm-Message-State: AOJu0YzJAfW+qdLogSJFARyJ9Rsy26d8pC4yqfJ1jQiU8VmtquqsIfAD
 bG2+vJKF0SPmiOTbNdvTA6HBsDycuqeTw6UM0ULYrZbaGfnNIo7/UMApFYlznqf6csaOI1++ypS
 rUeBiV5auKq13Mpeq4CiaklwAtSJcfpfVBwAJ1U8SA1LcxWY2tzVy
X-Gm-Gg: ASbGncvUZGycWxC1cEeon+bt0xG0DBva54pglmW8/IPU+/PIaNwHa5dhnoCcJD47Kdz
 hD8rtoBWgroC74mn7wSBruuOOc97RjuzK6GJ4YUBVDx9ATvn9ujZ0i+mYFLnEwSEIw/bfmThSdv
 eBAM4zA19nrXEPqvh4uncem8fFL+W3Cff5f3yH6Bw6ueav
X-Received: by 2002:a05:690c:9b03:b0:712:e333:d3a6 with SMTP id
 00721157ae682-7164d3f1544mr97006657b3.19.1751545769158; Thu, 03 Jul 2025
 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-82-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-82-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:29:15 +0100
X-Gm-Features: Ac12FXyyAznOVbocJGYEvZUx_VjP0HWeyYWJuw1uHp9MzpwS7mg-YRgM--TdW14
Message-ID: <CAFEAcA_GrTBoPbHXS7Co3Do_MKiggOrg6g7HE3ywmptsWMgf2Q@mail.gmail.com>
Subject: Re: [PATCH v3 81/97] target/arm: Implement TBLQ,
 TBXQ for SME2p1/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: yxKeLQ9dkCn4

On Wed, 2 Jul 2025 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    | 10 ++++++++++
>  target/arm/tcg/sve_helper.c    | 10 ++++++++++
>  target/arm/tcg/translate-sve.c | 14 ++++++++++++++
>  target/arm/tcg/sve.decode      |  3 +++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
