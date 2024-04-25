Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1619590ejb;
        Thu, 25 Apr 2024 12:12:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdWIfii5AbfLYnFKwWr7ZTbglsWisGpgPs/4WnQ+27Xauxp7DMLQnGZWVJ95fJUOGrUKcQUIHMjXbK0CbX+S97DoeC3lI/
X-Google-Smtp-Source: AGHT+IH2WKQ4/3u8nNOh1wviWAHQkCFlGk6AJv4fUOXD0CXSMQRA1K0rBXWiW1KQfSf5yA7gEYet
X-Received: by 2002:a05:620a:4483:b0:78f:d77:ff03 with SMTP id x3-20020a05620a448300b0078f0d77ff03mr6094675qkp.37.1714072345294;
        Thu, 25 Apr 2024 12:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714072345; cv=none;
        d=google.com; s=arc-20160816;
        b=NoYbJ7oWezfptx1dbbFX4jX1Dyu1bdsh/+uCc8MH5niypDoVC8qLCXC7/6g+Sk0jXU
         MbFsGCzZy9Jl9w0/xL1fu6vDGiO+498e/l82i2ZDFcmKyrEp3SSS/Yasm2LACwFxYk7i
         nze/v+YZVVpakBKJ5qKiHbUPKcG6dklVEV9ckyeOIk5xa0Py9JUSXqtZc2S1t2jt8o4a
         6kxdnbak1R0l4RRTT+uip11/5BSXyAQtGeeuP9jfFVMSzGuf7ucK0fXorZfQUlyxcNqm
         w21XZmSJaeS8H8bG42mkXy2I/cumI57UnEox9HmoZfM31QDUgGwQ6ps1Myt9fKp0vlK7
         XH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yoQyYTnOJnBUKrJHgoUZoANUhMpyJxSfXj5RF6dki+0=;
        fh=s7IIaKgTGV9QUnnAHqYlpL4N01K7tihVSXR4LII+37s=;
        b=kC4+asDuZd6spsyDfrr/hE12kRCN64A4ftUUxOXewTwrtczmnkNE5Xm8ccftUHEFkr
         6RySK4NkU7FEkU35f4Q978thhO4rvm2Evh7T/zVN4GoHCt1qllJqMSpoNPQq1k+iGB71
         KbZ5O+SdbcffojYptqej4XSC3E8UgIeF8MCiY+O2dp8FaebyUD9q7pUv94d4BkrokWNg
         ml7oz7+evTlsXBe5hGhRb3moidqTLuDGgkAtgSw/N0tbupPVHlTImRftqEg6gRAGKunK
         W9nO5VZEL8KW1Gx0skQFkR6IOJAeSn2j1St0bN/5Or1VQJBDuNlG6n5dvOkKv7JTWAfe
         dkvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yuqu49OC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020ae9f40d000000b0078a517d4a64si17394796qkl.633.2024.04.25.12.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 12:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yuqu49OC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s04Vs-00041K-OZ; Thu, 25 Apr 2024 15:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s04Vp-0003vF-Ux
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 15:12:05 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s04Va-00087K-ES
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 15:12:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-571bddddbc2so1653959a12.1
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 12:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714072308; x=1714677108; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yoQyYTnOJnBUKrJHgoUZoANUhMpyJxSfXj5RF6dki+0=;
 b=yuqu49OCL1O4IQ5Nnk1r/YbaDDTevMAhYou8Z1eeoP/2hVuvDUs7b5w+EZXXqaIW5G
 JeHpy0nM7ZHLw0WZr0HmipgFd3lDtwx3RWICDjoueOOFmk9z3Z8GT8WXPlEaC6G1TK7C
 xg8JdYayEe68DcsSaE5N4NJ+jYyXKZs0Rm6Eqcx7hXZLsbS3LS+V0Hi4tWjo/65ywDO9
 ia22sMpTkQYdJNfAnDa4GfXilVXPcdlR2nPUSaXL5fFqcCbwdoHut/jUnRNhZ2KEAsbQ
 DJVf1KXs7NaDhLxiBCLOmgAzgtE6jQRdR5wOb/3PgBVUMpOmJRmmq5AFsD7cXXZDkcWs
 TSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714072308; x=1714677108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yoQyYTnOJnBUKrJHgoUZoANUhMpyJxSfXj5RF6dki+0=;
 b=vLyNRHLZPo4T9bgXk2yaX3eL8SJmgDZ56IX5Hy80i2D6uOvn6NDtYod3inhfwpQMWA
 33N4YssJtgA9JBNRfBSkxF24ri4nCL4/0ZRgnP47CGTnOjk9pbAXJXnyXswKYxTCQ7ke
 2+8ZqcHoN0lzLrbz1vvA5VY78fUE7md/NiZF5NXvENCmBi/OJQNs1rRMGQG7fZeuadHM
 9ij4ja/yC9cU93IWIzNZa6wEAthCiNRUZbpP/jlpOCeiSqRC8gxBI7a728UfSc6pQRP9
 OThZZEH7AvW9/I9T4BEPPzrp+oX3FUBrtK9FNpgGRI58ul4FufdjLVysytpgLB8h1JKc
 jybg==
X-Gm-Message-State: AOJu0Yxo3467pYeFY5G7jIZvdnWcgHkVnXahNkC4wuvdUU839gHxATU1
 VuiPDT15la5AeU8Cv0JY5QTpsB3E7yZKRnxf1icbCtDVtY9KmGR5SnR91P+nUQu6zAJBnmlVJSC
 Ra96arC43gSeTwhfnooAwqkJTy1dBUqzg5Dqh/A==
X-Received: by 2002:a50:9f43:0:b0:572:3fe4:18b5 with SMTP id
 b61-20020a509f43000000b005723fe418b5mr286293edf.32.1714072308482; Thu, 25 Apr
 2024 12:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240422092715.71973-1-zenghui.yu@linux.dev>
In-Reply-To: <20240422092715.71973-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Apr 2024 20:11:37 +0100
Message-ID: <CAFEAcA-=tgsMbvtZw1F1Fxo9YQmBKvx2oXtD3rDFfZwMoGitRg@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Remove PL1_WRITE_MASK
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, agraf@csgraf.de, 
 wanghaibin.wang@huawei.com
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
X-TUID: fxrm1/RKfOfr

On Mon, 22 Apr 2024 at 10:27, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> As it had never been used since the first commit a1477da3ddeb ("hvf: Add
> Apple Silicon support").
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>  target/arm/hvf/hvf.c | 1 -



Applied to target-arm.next, thanks.

-- PMM
