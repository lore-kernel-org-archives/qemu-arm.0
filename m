Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp996693ejb;
        Thu, 23 May 2024 04:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVflfPJqorxPrpHsNG4kBYoAwPTddx+lQ3Ftl2MhikyZJmnh9+7pFdzz9pnlnG2qDysfA38n3xC2JgtOss/OTRd2488TgIW
X-Google-Smtp-Source: AGHT+IHqrsbPGEdQFgXkUp8lbeDj0zeWihNz++BYuYJftoXkldgMrje/5l9wgFMTyXvRqgYZMPfu
X-Received: by 2002:a05:620a:3944:b0:790:c67c:f53b with SMTP id af79cd13be357-794a0969515mr406872785a.18.1716464269002;
        Thu, 23 May 2024 04:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716464268; cv=none;
        d=google.com; s=arc-20160816;
        b=dwt++A6C2SyR0Z+kDQXsqKA60sMuoTz+ezAK1yt+UvmnmLzACx+jj+5IccIzvdwi6m
         VrJMwsCBHeieAS8vSL1HSaQFAVpEtC2t/vgJmX/baH6UdYpQiR3IEOM08GDWpxgi7+yJ
         m9FcvmdjxG7EGkev9hoBRu8Ep0sh7OqpLurNJxICZOyERTEqH4ORz7DcywNJQB0tp16w
         JTfIvQ9s81Y3Re+3vyPd8khMbWAsNevMV5D8qOU1x/v26Gkv2YbL+1wBeOCV9ryZODp3
         zwSce+CiY0+gNq1P2CMM+krcIF9RE7mNwQHLFJGx6jlNRxJQEsOz1xyBeprTkXR8Vrcu
         4sYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AjPzKmdwd4hPWL6XPZftU1PYBYkQeoM1bSkpN9r0UEs=;
        fh=yxdLxqFBqu01DViWN+Vz9+k/sDDMaDtlMHaB7dnSysM=;
        b=cIEH/sNvJLB0+anegs7i6AR7JMSNvvzaok9URQ+6jLMBSmztDDNGgsMUxXWPqrec/K
         TNJNItPTt7cZyRJL0ChjaQ0+6eA6LUsq/SXljll6fvrahQl60KAJgCueF1UGJS2+JrKg
         oO7EE6Uf6dHjBQuXyD38BU1/0/Q28bYNmUaABTbZdFHByEz8ZPYiLT01B+aU8eflhQrV
         LLTDC06VMggIfBysBziQTRSYS6GbVSrqWDTmDP56Mz2PZkPfjsYSPx/JW8+X8+dpyr+z
         7MaeatmYrxBEixtD520NwHbwXPYYAApP402EQkeWROPkYCIiUBKAiNPA/XcMNwlw198p
         EixA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmhJyvbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7930ce8f21dsi274131685a.342.2024.05.23.04.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 04:37:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OmhJyvbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA6lR-0002sn-E6; Thu, 23 May 2024 07:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6lQ-0002rq-4r
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:37:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6lN-00063i-Kq
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:37:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57847c08e0cso805869a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716464256; x=1717069056; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AjPzKmdwd4hPWL6XPZftU1PYBYkQeoM1bSkpN9r0UEs=;
 b=OmhJyvbEbAeDr4iH6JKBHwlVKtheDgp7hJGGRtLZG57Bua9ku5LHiB3sLIbnalPrEL
 G8coJLkS88bNsvO6bXvb6lByAiBrJ0RxoWO2uCUdAokHv7Hln43dHdyWYjh0limWfHDz
 4H+iydn8EoeCdnaYW2tHgvO/vOa15PI2GgfsuAUlkEvyrrjI/valkNJ/bBA4vSAjutTX
 qj0kohosu6m1G2jJ9o/aT2CY/TRBoKXSdqLJGA8LeYuOzZo1X1TX/o/nN4Bwr2a8ADM8
 vJEYbwcQOVQkICO0PQ2VnHCY5LPziZZIe1Tpjq+2y/WAOyI/Vxat4Bj2biC3b0RKWJgO
 Ztcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716464256; x=1717069056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AjPzKmdwd4hPWL6XPZftU1PYBYkQeoM1bSkpN9r0UEs=;
 b=lZ9g/TREHpI22VBa5voVHKJXZzjdR0VICwQm5CauQHUXJ0ngdnTMKpLIehCgGRgbLT
 L7/UgdGzkw/HaBSM4kO4yOb5qH8s31UwIyYjkeW0FttZQC/8UbnacCg57ZNcShX0mgcf
 nhsWDUdfhNnZb8yK3YdI4GeLnwMpsouyaGd3pB/ltrRa2bGKycXxamqieKCC0/9a2f4c
 KYAWyNuraKLDRYwRNCXqdkybwM3LOvfyQZPX+fzlO5M4tWSEKwpE9uuUNjz2cmObbkEs
 6H0J2M7HbtpfE0gQ1lNifOMvk3D3BfjbcMmyeIGBPjdHKDnzylorYOkEDLCAJoEKYbDP
 rsoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZAj/U9uMpG7IoFjKV0bDk/MZ8hNkQH0pzzi11K5kvkBEf6b4z+DXoaTFAYxuYsOdCYaEfjE2Y77+CHY92YUf4WJW5
X-Gm-Message-State: AOJu0Yx+hjFQyey7gQi5XGubXyTPfp1fF/dvmaj8SWzQ/lWv4rRYF2nm
 Xrg+xZIr/f39hOFKUisSM1sj5UA83hE4vIl5n00CPBhAwtbIm3wluEm8n1rkSBeEKYJQZP3s0nN
 AnH6DsFfvRXVd8DPFZIF651W9xUzfPvqC+cVh/S+tSyKzg31J
X-Received: by 2002:a50:a69e:0:b0:572:a172:be71 with SMTP id
 4fb4d7f45d1cf-57843ec07cfmr1600934a12.14.1716464256156; Thu, 23 May 2024
 04:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-14-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 12:37:25 +0100
Message-ID: <CAFEAcA_+wf4Xjz+z304kd4tKoWKLaiogFOhfW2Yw+3S9QRDmaQ@mail.gmail.com>
Subject: Re: [PATCH 13/57] target/arm: Convert FADD, FSUB, FDIV,
 FMUL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: WoFtk2ZAsQCS

On Mon, 6 May 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64.h    |   4 +
>  target/arm/tcg/translate.h     |   5 +
>  target/arm/tcg/a64.decode      |  27 +++++
>  target/arm/tcg/translate-a64.c | 205 +++++++++++++++++----------------
>  target/arm/tcg/vec_helper.c    |   4 +
>  5 files changed, 143 insertions(+), 102 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
