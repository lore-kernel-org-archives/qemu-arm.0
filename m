Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1283756njc;
        Mon, 25 Nov 2024 05:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIwm+3uSZPacD4LwS2rNPoHDB/8yO1ecGsbTDatnzzEXfDLBkGgzO6yXm7jbnkh5d3m5iZUxbPb3jabg==@linaro.org
X-Google-Smtp-Source: AGHT+IES6X9kGr38IuTI9KiY2njNbSFBRzn09PpgvSOwCQChU8XelOdwCkYUnTWLz0L27WT9ygmv
X-Received: by 2002:a05:620a:1a9a:b0:7a9:bdd4:b4ea with SMTP id af79cd13be357-7b5144df6cfmr1714989885a.9.1732541151179;
        Mon, 25 Nov 2024 05:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732541151; cv=none;
        d=google.com; s=arc-20240605;
        b=G4Pkly/YaQgYKhfgxuJ0TwM9mfELoA/vuOHk8IMts21Ps3ZAoDf2FfoMMjn/1OPeXh
         IhqT51ujcfpRro/1iNvxPpciOXEbKSJyjj3eR1cG2Vqgv1MwrOBBfkGStOM9VVg04zVK
         YPaC644JEHZOXkX/lvB8SX+bDZHYtr57Sc9C/55nNOkH3zrZ3d41Ja/8OqE3MUQ0kOIG
         ETx5YtR5qeJFa0+PT/UDDjKPqcinbOTjvX90y3pAPRmnQOcqbQ4id7M1ZOzJg613LiYf
         rHY8NfNj1jnBdD7cmWTSx2yj0VZ29JsFwMWuEm0StacoeKZ7EolTSltdDSKdNjJlE//j
         QLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ADdGhoysVegLCwQoW48kN0DpEGNfwFq46x7SMBDb2Ws=;
        fh=9ZISm95nl7+DiO598UQgMizxXIbhSA84I+j3s3yuC1U=;
        b=OBYiJIMSkrCKW3Y5zEK2E878vSc5triK99u6gY+SZ9OKyJlWX3dr3S7wkz6gIYBkYk
         Q+3OIEyKMVyax2OYZH+Ey5jxU/iEdPBY/cb4FnbhdkphxUrEPW6z0Ec1W/36R+4t7kAC
         17Xqqj8PW3K8HMeIg5+Qlymd7gVJWOeEzvCHOlya7V31hmgpsr23b5sgTgF/VqQLQilv
         Fru+lMqM9TeLP8Uaj97LAjvGGpF8jZVK5hJJrTmnfkx7xKv+wjisqsBIpwlzhyZho+xf
         E6jVlOq1PJ0FUcN8z/G53K9Kl3fonrHlqvtjZwxGIj4UhMPxb5QVZR21fWjNEzjN85Z9
         VlEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VyZ+t1FF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6683bb346si317601185a.169.2024.11.25.05.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 05:25:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VyZ+t1FF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFZ5v-0005z7-Gt; Mon, 25 Nov 2024 08:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFZ5q-0005yB-W3
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 08:25:35 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tFZ5o-0006eR-55
 for qemu-arm@nongnu.org; Mon, 25 Nov 2024 08:25:34 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cfd3a7e377so5994450a12.2
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 05:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732541130; x=1733145930; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ADdGhoysVegLCwQoW48kN0DpEGNfwFq46x7SMBDb2Ws=;
 b=VyZ+t1FF9vEVSpkMLMZ+UrQShtfTYL6ASsiOfHJHkTM5mhVmtXVyRlk7ytIi3qk7S5
 W654t+tBT3avnciDLtj4fmtPFdU55Fc5na+la74L0yPXJNCIGlHyjdFEKGxEcZyUuH3E
 FQWqZ+XD/xDU262zkUGogRCtUQMvfsAoR/CneNcOEBxY12zdETnYCHQR8DuMHvq7muSs
 mAfLhCQ/GHvnidcrwVxXsTHdh1GG+on02FSbhGzcwoYBnUHoi+YZDWhvNQT6DQmVfpkC
 WhQi0skABQvD7UKpsFpeFOZm8+6FL+BOoXch+8aHC01IJ8Hgl3Znqxb4qeAHv2Dhr/52
 v+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732541130; x=1733145930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADdGhoysVegLCwQoW48kN0DpEGNfwFq46x7SMBDb2Ws=;
 b=t0e6g+inxUxrwnS5GxF1OdYMCczFeocloZU/1pWGx12H1T07xYOBV/WTVXHHkX+OjB
 lkhvbE75nxiDGZevV3xsfKlDHXlRwDTYHCVSgb7UJPdOgsEETxfW12XO86zeJkVLMg5k
 rV8TLegxycc3HT0p91s7Taz9CxnAPPu9mtGqNBXsTduhyDqQXn9mVyqIY9641/lLar8Y
 51ilphsKY+FlIiGjTTWyCqybq5PKGqsy/6xyBBJUV3M9ZZDAmWN2mvE1eiadTB0fbsjX
 OfBbyroLDU9Pctk0wldPGB1PzgN1uq6dw3sM9jloLn0uqQMLs5ZA1yRmmQP6eNqE+1oy
 LRJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbTxuYyh6cHdHX9MEGtyBfqtpVj/HKsjidUybw1YfEBbR4k+5z61mPnvwFpTAsKoNNCw6s+UMPCA==@nongnu.org
X-Gm-Message-State: AOJu0YzVQn/OHplLjgn18h5DMWGEQxr98VyuDeZhlLK6nGnP1FF2bpiV
 YH1uKRRnNIJY9zda1popkRItyiLgvzmqSfUkKnOldK54mOB/43uHvQMINEUeUxK4tz5TQPTp0bK
 GpQGcnP5Ke/XkQLJOCwTG8nvc2FvHj6C5pAMj6QgiQ2XOTomT
X-Gm-Gg: ASbGncsFakbzo3jsiym/eXMewe9wDkzsypG1cL9oNm+N8rprMisfaGkNDlQ13mUVFJR
 UxF//J5bPt0s1+OPCmESyzjxryjyxBzEz
X-Received: by 2002:a05:6402:370e:b0:5cf:c97c:8218 with SMTP id
 4fb4d7f45d1cf-5d02069b662mr11039766a12.22.1732541129813; Mon, 25 Nov 2024
 05:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20241125125448.185504-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20241125125448.185504-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Nov 2024 13:25:19 +0000
Message-ID: <CAFEAcA-V3PGF7vst8QFjh+bWVx5EGDt_B9ZCe1OryNV8e39N4w@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/avocado: update sbsa-ref firmware
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: emWOf9mHI3BV

On Mon, 25 Nov 2024 at 12:54, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
>
> Used versions:
>
> - Trusted Firmware v2.12.0
> - Tianocore EDK2 stable202411
> - Tianocore EDK2 Platforms code commit 4b3530d
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Hi; what's the benefit to taking this update? Would it be better
postponed until the 9.2 release is complete?

thanks
-- PMM
