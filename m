Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp144987lfb;
        Tue, 1 Dec 2020 05:17:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUfqQ8dqxhUYlGOkF2Y4Pm2odmR6GCkKiq04Ux9AXTSEgFxsQUqmP3ZmLriwu0IujBYtrR
X-Received: by 2002:a05:6102:9c2:: with SMTP id g2mr2015919vsi.35.1606828657431;
        Tue, 01 Dec 2020 05:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606828657; cv=none;
        d=google.com; s=arc-20160816;
        b=uzV007RpIkr3mWW/6KQRI+gGBwV/NE/QY6R+qY0G9w7WZfEfCEeuYziub1EY4OLA32
         9fygFrBmumxdGvURrxlVeUn55jrXkR4t1upRgC8YEOpq9ZD/OvhBJIlV//0LX9VgJ5vv
         zMvByNNQnnVwPcaTaFRnogL6zkifDRbZRIuYWlFmJbH9D84rfFQExQ7ucsirsPkuGhZ+
         dSpkN9sgzF6+QHe++iqOI5u+ptqdmLgEAoJMPOAuXrw3vqoQ8EL7/8qsvsVtQOzjDJmZ
         juBXiBfs0OqejdDt1u8CZg9ZXh+v4Wt3a9WKzxFOHL/EGbwWHI5Q+dtQ4jxGrOCKcnXP
         AJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZiiuBPgcjlod4RwMqICcQL/4qDdWbaMDBe5y+v2z9xo=;
        b=oKqbXh21xakCP+tyWjOy+12aEkcEP9t+jL4k+HF1S+I/KXcwRDaXREpg/gws3dAkd7
         gPWYdepxwzZXlwEKGkLrLEVbjKFqe98k3cVfYfMPzWwHKcAr0O6M72+OH0y6t1CvaqYI
         lBNG/jky5zUlebLzFtp8qw7RuSc83gYFTFe3wuPy39YUJRpVIoEAkzsObQHAyPiPQw/1
         9j9+rrFJ2VXMVCXJkyx0DXDB6iDRRKX4kL170QLqOIsdHxzn4MulASbt5UtAhnKQNcp3
         xrz5A+D1502vB3evtnzKsIUAlz1NvVLYgk8eVJiGVQzCBUdGHyXeDdX5/EcRw4CxEWc4
         goIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R4tBJnup;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 140si274396vkx.6.2020.12.01.05.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 05:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R4tBJnup;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk5XE-0005FG-Ok
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 08:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5WV-0005Ek-Mj
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:16:53 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:33874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5WS-0002UG-23
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:16:51 -0500
Received: by mail-oo1-xc44.google.com with SMTP id l10so388296ooh.1
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 05:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZiiuBPgcjlod4RwMqICcQL/4qDdWbaMDBe5y+v2z9xo=;
 b=R4tBJnup7YgFV8lN8kEnQ2FIH91zcrH5JKFuII8u4QK9ykxUEAdqCET+hX0W19cnUb
 yY0HoRABJRD8zy4OrgPKWE1aIrqHzlWXcHSQv8Fmn5O7gTKKYF5vdgZn7fYig11wIRha
 A5b1jDUi9ujMRmUrXPh7DYchk+OBYtDTJ0OIAgTbVkP1Ry7jKc/qFPrJ7vREbk+OH9uj
 lMmB+EvgDj823C1DedBduM6yr7vTJadDAG0f18lZHIv3cQ4cawfe8U0V199ztQCiEzdk
 5dKfj06x7ezGxrAHnuaDxsacZYmZVtRvISPQhwU1OSGpRlFBwKKJ9EA1PrMFOvUc9rvw
 /gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZiiuBPgcjlod4RwMqICcQL/4qDdWbaMDBe5y+v2z9xo=;
 b=W38hWmAP2C3asF3Ik5QLWZxXejjQRufXT4lLdYuTGExLQ2tDz3aovZ9Yzm6HsPGUG4
 q5XbzbqlxlSf5FYXMTFz8DjIF+UkXUzoz7mE69XTz2l6kDJU/yAF5ILjX9qe4my+A7t3
 yD9goeq4lwHiJTWt6TdtgOfN+74gjmNKg+vzZuUg+HLqQHy4J1QyXO1PXLMmeyz0hdGI
 GX29Yc3PzWllwWxKCy4H89EMawnP9hsLZhfwIcLe+ZM0A90IdGTmhXgWNa5hpen56bnB
 DZt3rQ6ZPQHHMnTXdkgAi9nUgEHOJylufjh4tumFL4upxXGRSbJeNoYfjXzH84bTQERj
 WnBg==
X-Gm-Message-State: AOAM533VgnTPkdGeXNt1nweSf+6Nlj7LEWNGRiMWfpb4gVML1MwrjDtG
 4VxXzpXLsmKTb15gMGq8L8iW4A==
X-Received: by 2002:a4a:be81:: with SMTP id o1mr1781228oop.25.1606828605897;
 Tue, 01 Dec 2020 05:16:45 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z77sm357524ooa.37.2020.12.01.05.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:16:45 -0800 (PST)
Subject: Re: [PATCH v2 10/28] target/arm: Implement M-profile FPSCR_nzcvqc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcc11945-91a7-af1c-a6f4-a6d2c0444b29@linaro.org>
Date: Tue, 1 Dec 2020 07:16:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: mJoevtzrbqM0

On 11/19/20 3:55 PM, Peter Maydell wrote:
> v8.1M defines a new FP system register FPSCR_nzcvqc; this behaves
> like the existing FPSCR, except that it reads and writes only bits
> [31:27] of the FPSCR (the N, Z, C, V and QC flag bits).  (Unlike the
> FPSCR, the special case for Rt=15 of writing the CPSR.NZCV is not
> permitted.)
> 
> Implement the register.  Since we don't yet implement MVE, we handle
> the QC bit as RES0, with todo comments for where we will need to add
> support later.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h               | 13 +++++++++++++
>  target/arm/translate-vfp.c.inc | 27 +++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
