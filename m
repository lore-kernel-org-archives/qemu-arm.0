Received: by 2002:a05:7022:658b:b0:a0:2f73:dc0d with SMTP id bd11csp2492327dlb;
        Tue, 10 Jun 2025 17:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+bos5Mxhr0+OkAs194nRH/1WkHM8ahKclSeDh0NJ8vEnxCkywdWdxz41glKeyO7Xb0Yksx+l+4iiLlg==@linaro.org
X-Google-Smtp-Source: AGHT+IGuo1qia9xCl35rvFPPd2FjTg9njQ/KaHRV6ZpE3AEXSHOq/r1PT50d7ZXNUsCRPdJ49QPH
X-Received: by 2002:a05:620a:4150:b0:7d3:8626:c18e with SMTP id af79cd13be357-7d3a88088d5mr242666085a.11.1749602264412;
        Tue, 10 Jun 2025 17:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749602264; cv=none;
        d=google.com; s=arc-20240605;
        b=M7dzRuYfmJwl2PKHTQWjSA6AOynksMjvFEyEXiKvbG6NGEjWilXdSV8kF6/1243Mow
         W40eD0hZlVG2apbHiKhpq7AS/TiS55Zajd/4q8PkBY2utMqhTArCwsAqHhPDd0Vs/m65
         3K/tKaB8azZWY32koY1L6sSB8ulj8tPLgp9uk0p92JUrmldsvefvoZqAmFkLP9r9ujsB
         hW6/yzZxbMcJ/HRqjQ+BBxdvsq8VEq5K/a//k259yMczZ3sL6B72NhK+sEeAqNoXILtp
         EzCa+LCUybAF29HqeKe2D4bL6kYSN3ArOCYk11SsevT7WgKbEKNI2RKDk2XN/hRUiGGK
         1XIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=ggKK9KDm0Fjiaw3YWMiODg60SjIF+rq6A2dfjW4x85Q=;
        fh=nZigL1vnINBk1wk2sRJPJZYcIriOWv9eQrAXFoeWWQI=;
        b=Jl1HPPzSADEYaX+W2HPDbB08uUbzyV94Zf8nJQA26ViHXoO5j3b8bY72djtpqQvcT4
         FjHanDeTsgkOUBBnhlKvTtey+5c1eBtceKuRMCTbZueDZSBXctsExHtv8vlljm4v/t7+
         RjQDJ7CgCQiSqYtVLoCCJpYjsvJxUXW2FA842ZzI4zti49dASFsuunMLM15c/wDJfWiM
         ZRW8QKSyxjlDLH6Rz6g6Ey8Mnp5ws478czG+Bg/R0DOpYkywFuWUhTkrE6G/na899Du1
         ilVpaNTPsXUdYy+N1Zwk6tglRxsD61Jz1GVTqPyBM88cmKn3q3uJewmzhX431glksaQN
         72vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a626372si1179792985a.440.2025.06.10.17.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 17:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uP9TD-0002pw-UI; Tue, 10 Jun 2025 20:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uP9T9-0002ph-Bh; Tue, 10 Jun 2025 20:37:31 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1uP9T7-0007sT-Vx; Tue, 10 Jun 2025 20:37:31 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 31B1A55C1B9;
 Wed, 11 Jun 2025 02:37:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id q54VDriHUkH2; Wed, 11 Jun 2025 02:37:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4016D55C171; Wed, 11 Jun 2025 02:37:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3E1B4745683;
 Wed, 11 Jun 2025 02:37:26 +0200 (CEST)
Date: Wed, 11 Jun 2025 02:37:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/5] scripts/meson-buildoptions: Sort coroutine_backend
 choices lexicographically
In-Reply-To: <20250610204131.2862-4-shentey@gmail.com>
Message-ID: <9c873c0c-67ba-7f47-b7eb-316a62b09f0f@eik.bme.hu>
References: <20250610204131.2862-1-shentey@gmail.com>
 <20250610204131.2862-4-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tKJcS4/c3prX

On Tue, 10 Jun 2025, Bernhard Beschow wrote:
> When changing meson_options.txt, this script gets updated automatically by QEMU
> tooling which sorts the choices lexicographically. Fix this in preparation of
> the ext patch.

Typo: next patch

> Fixes: ccc403ed5844 ("meson: Add wasm build in build scripts")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> scripts/meson-buildoptions.sh | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index f09ef9604f..73e0770f42 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -80,7 +80,7 @@ meson_options_help() {
>   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
>   printf "%s\n" '                           [NORMAL]'
>   printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
> -  printf "%s\n" '                           auto/sigaltstack/ucontext/windows/wasm)'
> +  printf "%s\n" '                           auto/sigaltstack/ucontext/wasm/windows)'
>   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
>   printf "%s\n" '                           package'
>   printf "%s\n" '  --with-suffix=VALUE      Suffix for QEMU data/modules/config directories'
>
