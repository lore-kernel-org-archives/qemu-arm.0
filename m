Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1087689ejb;
        Thu, 23 May 2024 07:09:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbZuXs3DbOzjJsGWXYDrdAqffF3KZpuMq7ZD9I93cZt5S8hX0zso1GiDhRlqgRFUscpQMaGfMLUN8rFKWKDXCljU9fqyxn
X-Google-Smtp-Source: AGHT+IGMv8xxM/QQIGOMKUCgQlzEQ+iM2PQ+Cui/H0RO2Z1bfduW+BJCmBj/UoLQEMvA4sq/fOHe
X-Received: by 2002:a05:6102:3750:b0:47f:209d:1d3b with SMTP id ada2fe7eead31-489007c6040mr5819118137.0.1716473375823;
        Thu, 23 May 2024 07:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716473375; cv=none;
        d=google.com; s=arc-20160816;
        b=w4pcsgGrAk5T7vBnzWZ0wiMTUHpCz2sxDTYb561yCfrceP/45Jzu76zEQVK+BWrKkh
         UexknN7rWsHeBwO/+3cW6/VjyqkI8I6j++8FHkQ4Avmc4NhJohUmEXJR4VG10H7XqZ3Y
         XEZaxOOqY3EusdXG4QfBKVkR4F8FUnBdZSY2yCswGQ88LwP4HrrperJm8k/kQ/jFkG3K
         d3oHyIN9CUeL6xzOgRc/SnbMyZo8oy3nzpFpD9jMmOK/pClWheaa+cccOnkW8t41R8ez
         Xt3ye6v7Ohzf6t17Bms61v3hYRvHoyNxe23XAbqpZWupqYAVJ7Vk+XPFUwW/SaNu/Bxq
         Acrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zS0Mj1CB83bbYePTvsZqGHQkBJsrCu6+g/Koe38WKdM=;
        fh=JH7WK24qrdgart8uzZNhhtxjcsbNDHhAxnGCSZ+V+KM=;
        b=uuZceZyOsPcP+301wvMoWsbI70KuqLpE02138IW3iCXhortrLPrYxhXmcb3HYR+xXT
         TGnEa+ks38eynxfl+xc6kifm/2l7ipbhIHT52pl4BuR5gCqKo6gTryiHpN/Vct9I4qB1
         891CYpZaI6Lnl+Qkb6sm0NrNiW3J7jUGJS4PY850iYDzU6XGh+DQbkpYYJGW0aJnBilg
         mH2tMDJHie4ZW8gxJPtmIdSKFWyT19ZwJtn7k7XMlg8F0bUD8/yz4LLq6QWE5uyrgPbo
         iWiDS+lSeFIxrX47PbXIsO0RiSD1tmY0oJkKGFP2Vxypn23DJcTur29SI+10qupvC5d6
         gRXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tn5Iofpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806ccbe58fsi4817650137.771.2024.05.23.07.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 07:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tn5Iofpn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA983-0002jo-Qx; Thu, 23 May 2024 10:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA981-0002in-6A
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:09:09 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA97z-0002KJ-DK
 for qemu-arm@nongnu.org; Thu, 23 May 2024 10:09:08 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57843234ca4so1681642a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716473346; x=1717078146; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zS0Mj1CB83bbYePTvsZqGHQkBJsrCu6+g/Koe38WKdM=;
 b=tn5Iofpn48pmER8Yl/PuO+enGvEKRi9d4b3nWVImahhMtTi2pbEdt/tQ1H4n6ggVCY
 mgF/hiVDCGKPAoHSbbLQVkE/lJ8ONbg9RhPXYJHeO7GQElj+1EjZTXDvq2WXdwyy9V7o
 HEkCD3fnyhFf6cd1DxKYzeDKi9bRE2vtvSqkUchhfl68eIpTmd1zjaakJ/tbE3qN8Ei+
 eHxyIYfDp6QJXfoF0tzuopQ3JWe//VEJxTC4qbotz7wYYyA+bxA/yM/Ih3TPnF5GUJdv
 vCxxqUkR7qZyYo+7OMO5tqbW4kXqEPMFUwsrq6o6aEfr90YugdzwqK2gRyftzUkvKkGD
 wQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716473346; x=1717078146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zS0Mj1CB83bbYePTvsZqGHQkBJsrCu6+g/Koe38WKdM=;
 b=wfF3bGpzH5Hc0Sg0VrD5L5Z8jxQwloDKSNxzybK3UxMd6EhGJzlxBuZqeHNPatclTj
 8KMTKGcVQ12ltIrsH1Wygu9NYNBh1fmFPFzCwHaWVOss/yNVDouTv2Cl61ZA4V2nVVT3
 bkVMEmDWWT1KQxfB7+dFGL/vEH6njwm8e2bV5TG+Y7Xfslu+bOmgHt9DLFnOh0zB4pte
 X0rt2ZIhb2ixnNYUZT7u6xn7vCGJ/XAP2QVsUeSRGO/fzw93P8J1nQLKQpJW44mcy2I9
 Fo+fFAEtl4ZhVf5oxa6VmhGzHjaGAtEi49T1NEsxrP7epWWw/d8jBRf+reSLtE8KQGi4
 HMCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR4Quqg+J7D/rW/F+TjCJmKe1XOBOPqDOrRRPdQhnyLFv/YIZkLPwL8I4mFB6RzF7Ad66rcnJjsGapWEHpWsLWN/gN
X-Gm-Message-State: AOJu0YwLxRTOfJF9+OIjWywTxH2whCYnk8MXVqEd+gF4ulJ4/1+nJ8xn
 x3VE1IC7SP6KxMhsARBh+/wKqQnMC25rvBklDsUeD1jaoiyvQlAqXoXSSmu9wI8O57Y/8JSE8mw
 CFTVnM5QHz1Ap+rtYfwU81vHN5IXWJNzZ1T9H+A==
X-Received: by 2002:a50:9ecd:0:b0:574:ecf3:f7d1 with SMTP id
 4fb4d7f45d1cf-57843b17d60mr2032550a12.0.1716473345872; Thu, 23 May 2024
 07:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-30-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 15:08:55 +0100
Message-ID: <CAFEAcA-SVrg1jRb=sEdaDO0+jbKMPQfYe4+LXzYjWAzhEMckQA@mail.gmail.com>
Subject: Re: [PATCH 29/57] target/arm: Convert disas_simd_3same_logic to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: PXARjDTMng8s

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes AND, ORR, EOR, BIC, ORN, BSF, BIT, BIF.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
