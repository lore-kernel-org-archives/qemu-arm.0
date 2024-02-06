Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1843386ejb;
        Tue, 6 Feb 2024 06:49:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjIyONivGMej2O5DqKmLuBWUgbFtzra18G+rzjbNfkFdoi0uby+VlkSI9gS9z6P4rEYyju
X-Received: by 2002:a0c:f54a:0:b0:68c:8233:d488 with SMTP id p10-20020a0cf54a000000b0068c8233d488mr2533034qvm.56.1707230986435;
        Tue, 06 Feb 2024 06:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707230986; cv=none;
        d=google.com; s=arc-20160816;
        b=EPb1nO0GzpJsyu+vqILrCPpljCJl6kzVeZIaZrUDb2ZCMIRqFaWeU8mrsN4tcTy6+j
         /TvluBOJFS1OrbawrBAbyfpFE2FI363fpuIKbHwxCN+hLmrvizR2EFtaUVfKNxbd0c+7
         o12JEynN4e/5HvSkaUTmb5EhKPnESj6Hx+7w6BWfWb8O3nB4+66v1qGEc5AXBQaHWAms
         J3+Y/agzPS3z5yIGK+xKQGUAQJDfgcITZbHr/U/yP82IjulCd+klcUP5q/1V+PVUe5o2
         GRBs9o4IYK5usqKrdNeDWMx0sa4dEYpTh/2KvkVQ7vito8oCwLRqip0VfyDEXDPoIztm
         KEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=q9Liy2R8I32VsTn1eUkrfQvUcm1VEHSppLi9OYWTfvs=;
        fh=msA9GFJpK3kih3Enlb9yDhq4EW3sAXVNK7bCuSNfpFQ=;
        b=ODjdvreqadAamACFENNEkt03eCb3lpbDpUUm7oqy1ZYCM6ElSI0OKFOLnC3R7gxqvR
         DwM66X/yUdQkz6AvF4cvT7WHZ1MJB0n+UPvV/Sb9Ao0LkMEdSbP6zGn3cGVKJU3KUQFA
         W+Zh8CisyPV4qMq2VKlSXxP0xE52+okwh0igAGP+M0ic6ZhygW2frUWbaqsf1lCQ9zy4
         YZaLN5cNXym1zE1kRTLPhB6guKrtV3Njxn83BQrQZwe2n+EwxDWwPgpXhce99iyUtx2I
         KwUFeBc7TMIkBaSOOfK4+VyIjeyU4pOWGiIPnYNuCXmAEwWahZG2X9SaupZ9TXgaerpR
         jDAg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HurClxB8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXXqQ41nS51kgonKK9ZlN0pNPOGpTXc4a/h9ZslLQNZ9XCgSMCX4KDEoqRo7+vMlnT8hyi7BEqrsoUPDo93bPkJEXW4O458
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020ad441c9000000b0068c6ea9786bsi2504315qvq.261.2024.02.06.06.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:49:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HurClxB8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rXMlM-0002Di-81; Tue, 06 Feb 2024 09:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMlI-0002D9-Ck
 for qemu-devel@nongnu.org; Tue, 06 Feb 2024 09:49:24 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMlE-0000A0-Qb
 for qemu-devel@nongnu.org; Tue, 06 Feb 2024 09:49:23 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d0a0873404so37318771fa.2
 for <qemu-devel@nongnu.org>; Tue, 06 Feb 2024 06:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707230959; x=1707835759; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q9Liy2R8I32VsTn1eUkrfQvUcm1VEHSppLi9OYWTfvs=;
 b=HurClxB89i3xlDfysNVL766W/wAYlMDyVmMZqtd8Scc1sx7+GTKmn9X4T8r7sUSifN
 DBvQgT3nhhdf1Nnl1jEYMPKaOSDeGhdpmaAm90VJ83Dgp2yg+xfZmRywqSkS+ZYLnR0b
 xmoNG37+9Al4C6kiph0FaXGmqulxPm9CLNqhFovlf3TL7xibPhj7Kn3YZX2K+O66Dhkp
 m0jknOCgrOcqG94Wzi7YBf26hzGQEdjZkCfmhHNTLu3Pw+YIA5IFjsR36rdLL3342rzN
 YTqfIIpMCOBJmTKVJ6nXWwbd9f/ENCXOW2s6Kn2w96arbrdvZ/TITm2bOjSoeVhr3nC9
 Ip/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707230959; x=1707835759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q9Liy2R8I32VsTn1eUkrfQvUcm1VEHSppLi9OYWTfvs=;
 b=bB8M/2AvlnFLVL4ZDNCaBT6TEUTFfgC41oGMyOWsIXQNyR3v1xS//kucZe8JSOeoFs
 UgxC1MFMj4FDUjjqyIlyXXyw8EXjZNq11yihjdMD1RYAEdfR1OkKPFAakFUeZaMMLGlx
 4lMUJv9gnmeswVWRSKoh4Lde4QPPWb8IRggXfpPEr6R6yqAMcGvg3yQy2KLEexXW37v5
 guJDZaj5Gp+HMIvIvgSJCHttc6TepuOU4/xQjqzNVTQF3/+2u81z5+qvM7qczrQI9NrF
 zMXOvA5tHMEPbMuTu5RMMoEwfA0UUHU0TIubQEfPjJIoPcBP1UHW0OXUx5RvLTxsOLGE
 IiuA==
X-Gm-Message-State: AOJu0YxU2GF84jBy+t3LWiBNFsSxt829vq9Jbxn5reO+E/p1192MsL/3
 y6u95Qq8cLgXbj2PPUuqJgkHfjwtStrj/LRQmZ6iyPEAj+dzEfl8Yx1BstnaL8trUbOFlzYvtf7
 5RC2FU+AnLFoHU5cXf596OMQs/7ZrUYS9jhcW+Q==
X-Received: by 2002:a2e:9c8b:0:b0:2d0:b547:f42b with SMTP id
 x11-20020a2e9c8b000000b002d0b547f42bmr2216121lji.1.1707230958894; Tue, 06 Feb
 2024 06:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-4-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:49:08 +0000
Message-ID: <CAFEAcA9yRD0oV7+9LBkYSMuc7XsXiTL4TJ-XAVmnCJckKOb_BA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/arm: Adjust and validate mtedesc sizem1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xxfr0Jg8Vd/g

On Tue, 6 Feb 2024 at 03:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When we added SVE_MTEDESC_SHIFT, we effectively limited the
> maximum size of MTEDESC.  Adjust SIZEM1 to consume the remaining
> bits (32 - 10 - 5 - 12 == 5).  Assert that the data to be stored
> fits within the field (expecting 8 * 4 - 1 == 31, exact fit).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
