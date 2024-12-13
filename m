Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp447485njb;
        Fri, 13 Dec 2024 05:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbe3+O6VDmCtRZZHfYZO3FyW/iIyOQKO/vsBheA/kgMJB31QnmaqrL+PP4y65FIU7u4sEgLFqpKTj5iA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7uB7eVAXo/SHPB3GxmiaKkMAOdHGVuXsxtHZGAG4uImTeFZrlGZXW74q4oQ+5EwBX9iL8
X-Received: by 2002:ac8:7d15:0:b0:467:5cd2:4001 with SMTP id d75a77b69052e-467a14790a1mr66989751cf.3.1734097406659;
        Fri, 13 Dec 2024 05:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734097406; cv=none;
        d=google.com; s=arc-20240605;
        b=de7Gs4t0ihVvgNdSpZue1hDchVNWD6cLt7b7kT2qY9ppDDZQTTfKvH+jNixzXDKOAg
         hPfnOtflL+d4jscso7IsMCvgwoJ3fMWWpPmqFGIDmxgArirMeN+pseRsK/pHuMkdH1Vz
         ckfO+0tMVvnzzsqZbOmsO7OazdZAGv8cSnLqxCV8mTsQ9+ZpyhaqNwA7B8IFs15hbaGg
         y0RcqgNFxEesmZ8uV2G5Iu6bak683hK2vRgs65u34Fq1IsRc8IXkyDIF5PUA+/cevp3w
         V/zlI7/aSFf4b8lmPRbfid4X0usx7PQLFj5jp4Xqu1+uLs42FQPTWJP8p1Trkg0n0i+0
         xkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=E1jBTIw2Sl//NPOzTInPBD9Stv0+pQd5hXrYIhxDQr8=;
        fh=SSrET7wbiAIR0DB5LOhbXsGWZh0ucRoGnEbo86Wu2RU=;
        b=e9JFwhxfyU4+/7sWm0iD+fKt6HsdYYOfG/Sc9Z7/3i0Fz/PZncns6DOdZ8Sl0rfnv3
         X6ZsBpd3OhE/LYPPclPpR44A9L4X/pwnI3OTZG27XpAyVq4UZJ8grHNjmhjRNCXFifH5
         98p4SF+tVyAul/dmAjw2ZBoCHHb+NfrTxFfSIfp7fvL+OD2b8aeGbyXRX4CrTVU9nEME
         LrQfbn5q3aqeosxLhCYBUhD05ZVf42oTEteYP+NhFgNCB1IAIn6SEkM3K1UFtNNcSGJh
         B9WvFvxWJA09ll3dFhv4BNbNhI/6X1s8ZSAB7JWTZ8ECrd3tNPd+9nKwkQOvn20yt7xy
         ssng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wK3YLoy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46783b008cfsi88736161cf.84.2024.12.13.05.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wK3YLoy5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM5wo-0004C5-H0; Fri, 13 Dec 2024 08:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tM5wQ-00047K-MP
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:42:54 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tM5wI-0002xU-Fm
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:42:48 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6ef66a7ac14so28280967b3.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 05:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734097360; x=1734702160; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E1jBTIw2Sl//NPOzTInPBD9Stv0+pQd5hXrYIhxDQr8=;
 b=wK3YLoy5tckclS2OI4ApkO7KhyIRUx3It2EzI8vrekhl35SiHdoTuFNL2HQMHGgGFe
 UrZIqNqRlFzjnasjAXjYlV5XLHQ82NddT9KQaYwD6rAOAMHFyUaBl2yg+JKHtFSjws04
 x3W+n2ghdt5kVhdPLYCevGqwRFOsGj6EjayomvOlPiJ2Ev9SsBa5VI0UoF4+eRG9msgb
 TZGzwSinI83XjI4H68PL0MBSeAgwC8PTM2fK1FIvVlvlSJAGy/UXb1SuqHRABvWluScF
 QHUwOv1Dk94Mn6PEfjrTZ+6hdXD6ROIVraCD15aL+5HsvDIflAnyJa64EZ/TeRSDk7aj
 X9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734097360; x=1734702160;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E1jBTIw2Sl//NPOzTInPBD9Stv0+pQd5hXrYIhxDQr8=;
 b=T50K2xvXq9rhqPQ0MLxC58TSekT9svmY1lMEeKDOXnKzSMePDoxJeFHL6pb/LEZxBj
 NNvuYh6KiiRb/c1wVtMqNISrCJSgyWy4Dg6w+fPmX+hB1+7Prc/2nIz2iJ+xiDzAHL4t
 tsPWWLq/qwedHz5pZ+FsG14BoH680zJOTSFIDzWFNDzZBKIANaWXfRoSRzSCggru9BQn
 FQUiTuD0YWkNbw+oToWv8OHUfKq3dkZ6ggjn3NSJ0XBVpiODI5rK31FxNDevIEBeN4pp
 Df9qgdt0pdxijAI2YwMsXnJIoIT73/cvFCu+dmmiUbuJZb7ibWhylLGYTUg2NZ1k/DSv
 57Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEEyB8w79dgA9D2Lmfxe7r0a5v8s31AMjvP7Qc/iLZtKUX2zbYRqaZpMLzWJSyWfY82FQqV4OveQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywif6CAnYUZ9wJhpu0EQWU4On6+k/kmozI/MHkA6lvUDnpG7CGR
 O18IOjWuksd6uytj7Toc7a79h9psqZdyuBRZO640OqBZZHH8i9cX1GIz7WnSJUKmacLTzGFjsAC
 SZAdm5JZUeJ6PjzNLQcZIFCZ7RY/OX09nycl41g==
X-Gm-Gg: ASbGncv1nVlgb9xH/XN9xCLzjxV53e5Uk+wskRTvoLnw4Qs607xB6i4/yEgWi0K/mpb
 Z8pOLISPlhwsFXFEogbjXwCc7p4cPLJMNYZXeIKM=
X-Received: by 2002:a05:690c:6ac3:b0:6ee:4855:45de with SMTP id
 00721157ae682-6f275c4ed77mr38076327b3.9.1734097360723; Fri, 13 Dec 2024
 05:42:40 -0800 (PST)
MIME-Version: 1.0
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Dec 2024 13:42:29 +0000
Message-ID: <CAFEAcA_B50u-57tv4DAEG7wdE7FRSay0VzrCwC2S1Vv4iKLwJw@mail.gmail.com>
Subject: Re: [PATCH v3 00/69] target/arm: AArch64 decodetree conversion,
 final part
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4TCOLdbom+zI

On Wed, 11 Dec 2024 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Finish the conversion of all aarch64 instructions to decodetree.
>
> Changes for v3:
>   - Fix decode for f16 fsqrt (vector) in patch 23, prior to conversion.
>     This is the only patch without R-B.
>
>
> r~



Applied to target-arm.next, thanks.

-- PMM
