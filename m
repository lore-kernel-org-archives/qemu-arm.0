Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp292838ejc;
        Wed, 10 Apr 2024 05:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/hWX1KZ7bMBHme7kv39Vy66w6IrcFns9eNIKMcR2DWt9uKkDV5mAY9hKA+vdWUv1VV4dfKEgj1IsdYdergFzlc+7dOU/y
X-Google-Smtp-Source: AGHT+IGOB+Hjay4D2daG0/JQpeb6HVTzzDA63OpLOdRbjPIh+kKxI0DXoQclgshxQce1gs0F89+o
X-Received: by 2002:aca:1211:0:b0:3c6:500:a14f with SMTP id 17-20020aca1211000000b003c60500a14fmr2533374ois.5.1712753942560;
        Wed, 10 Apr 2024 05:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712753942; cv=none;
        d=google.com; s=arc-20160816;
        b=GVUmS7gRA/YQ6zDP7GnpntowbfWsEmncZs3VKFd3D9ILzoKTH8zZI/lDxQ/VRpTqq7
         8wxSyfuqe54GKKfF0lkzspGQw6dy2JsE385TsJ8I2MYSXpcvPZWJBt9LGKRMcX4yBZEr
         nT/LIbL51w9cg7cXrzLxVt4CnBkns7pMNevufmBAVjGNf7fYKp44BPun9SaDH5xV9l9T
         cAlY08+Za/TYMJYMn/X8aEtWCeNEJJh9hcVvS/5ts2arZJQFJoXNWPOyAjMGy8K+FND3
         EERFfangqmA9hueIdbbLecUhnXW4mPtCaYfJXLvSqLMLfjZcndHjoeFWeKJXWJms1+L5
         acIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NKvCrGvZ1LWDGk0Quz6PXclIVO3Vu5uBo+WMkiNlaMw=;
        fh=OYzelNbVSEVNgLVp2H1urMqo0j46FxO/PzK1SYs98XE=;
        b=FNmrY69sVNW3lGEznGw443F9us4lnWm2VU2DUqZAPhJiV52P8Cpu9e5YjPymgSXSNG
         kMWgBG4i+4pJCOKWXZkHSnbL5/vE9g4MneIArdokjTcX31ccW+BcoEj0iMgTNe0J+yAK
         3+BTEJdTRWx/1K4HoSfrh1zi31v8wkvPo0g4umL2SghHwj7YNS2xAZq6fYHuRlkF1Cc0
         cEkLdoZUOGZWTHYG7HEHvtRqlRGGv+aUBVajmNa+6XPxqtXwwWYV5roBlFueYTN1pd83
         3Q3F4UxVOGAj5BO/siWzJNRyZy0ZBZiGuK5b5sURPA5ij4nGtAA3JKB3kk7stvu7WslM
         bt3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y51zMkGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05620a120c00b0078d6100f3c1si8198687qkj.651.2024.04.10.05.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 05:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y51zMkGL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruXXL-0004KI-4c; Wed, 10 Apr 2024 08:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruXXJ-0004Jl-Dk
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 08:58:45 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ruXXH-00037T-LU
 for qemu-arm@nongnu.org; Wed, 10 Apr 2024 08:58:45 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516dd07d373so3183402e87.3
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712753921; x=1713358721; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NKvCrGvZ1LWDGk0Quz6PXclIVO3Vu5uBo+WMkiNlaMw=;
 b=Y51zMkGLxkqGLriO2PR0A0NHQk5YJdncWINKVt4hgAEoNRm8lWy5bjvAC0Q/g/Off2
 Rzw3Nlc4AV3QXn3RqPKAKbgj7fNr8NtK65i53W00t9pnmx01/UdNT6n0A1wzLfT8mn4x
 2a28sptEOgpbVtaKWhcHIfCrseIxP8aGzHGKwRCh6L08crAHK1IIrE12++n2XldmW3/c
 fp6gP9EHGVRPhGblyB63P9UBcLctSC42rkMMnsuVn4js0tw0YAgz+CVFcvDl4hrxiRPd
 cA60tJZVUIihaxa6udKH9sxk4OCo7PxwSvlDOczdk5xaivl+7l6/QfNk3TokTdyFNNyB
 FNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712753921; x=1713358721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKvCrGvZ1LWDGk0Quz6PXclIVO3Vu5uBo+WMkiNlaMw=;
 b=YGJNSgJlaIhzG5D0q0oSzHBiu7371hxm6nGr8b8MNJrVXHLZdo4oxYWS+F2fxthMdz
 wIsMkF5Jm4Jy360jviZkXBW3/DDwd8W+4bMxVNRW1uBXjLowXbNZTBW6IP9rNZGL+3cQ
 ljK7JKOLqLxJmQqmvtm4igzYYNWN6FiPW9m+wwygahSkhkEdYN50lzccw4cHjaeGHwmH
 qtZHR0JJIKE6G+D3Eon157Nu7a9iyS9e80uxuRqkIHfIdkvWI9RK3dNqx4ZkgLJ2i5nv
 AhhdeMcKP4poadGCtCmbnYFUmHwaBuaGnSrsWUDyc/Wp1TRjYtABhxoBThnl+h3OqsGY
 9xYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1VERsWGeQLKPAzX4XMLoUNM7lnDM6Em1ExtTk3SUd5wZ+zyE+h6A38fM14ux4Yh6PRFGCqCiO2hbMf0wNoywTmt4/
X-Gm-Message-State: AOJu0YzvSIvl+jRf4SooIqRGTeRDYlhvNNQpGdq3TdM9vYvEzMMY+xe3
 ruHmRicqrD4z8Ejd1Upp1++ukiHlhhDvkFwEBkcW0LvKVYNV2L5O25LkMa2cImbn3Qhav+pIPrR
 EP6kk0bpdy0f3zwbAlxTPvooxewSLstOdgj1Aeg==
X-Received: by 2002:a19:6445:0:b0:516:a04f:d545 with SMTP id
 b5-20020a196445000000b00516a04fd545mr1527255lfj.27.1712753920972; Wed, 10 Apr
 2024 05:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
 <5afa6458-808a-df3d-a734-53dedb0f5aff@huawei.com>
In-Reply-To: <5afa6458-808a-df3d-a734-53dedb0f5aff@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Apr 2024 13:58:29 +0100
Message-ID: <CAFEAcA-TQxXR08YkijF-WW8mP1LcTfyRy64Rhdh971OnVrAmJw@mail.gmail.com>
Subject: Re: [PATCH v13 00/24] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: 0kF4Pwh/hmeh

On Wed, 10 Apr 2024 at 07:19, Jinjie Ruan via <qemu-arm@nongnu.org> wrote:
>
> Ping.

As I said in my reply on the previous version, we're in
freeze at the moment, so this patchset is not going anywhere
until 9.0 releases. I think it's in shape to apply after that.

thanks
-- PMM
