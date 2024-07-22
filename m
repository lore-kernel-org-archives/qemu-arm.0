Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1870842njc;
        Mon, 22 Jul 2024 05:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2kEgFT+b1mqQrMLbFWC2R//BpXEWgK8Vib2BsKWNu7xcg3A8LIKENkOfec8khLdnGFtZjEePhovbXQ56E+JmmwnmIKctk
X-Google-Smtp-Source: AGHT+IFmAMSmu1B/bnmWi4PhCFL9fEA9hld3RGj4dhP6RwtuiTz79lKkL23QdAA/gWSEo26dL2/V
X-Received: by 2002:a05:6830:6209:b0:703:6d44:41a5 with SMTP id 46e09a7af769-708fdadef23mr10383178a34.6.1721650126664;
        Mon, 22 Jul 2024 05:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721650126; cv=none;
        d=google.com; s=arc-20160816;
        b=AByFqGjEFoYgdZvM3+ZqafNRokpJFV+l7D1UGAeQP28B54E49h14nAuBV6+s9hJmQB
         EUCuIwo21hu2iG3slJOWslc9hh16vzmrWDYMfN2W7qUbjVLprVZgYKD/C9zQR6fIeGQA
         BSGl3miO91zMr/lhX4V/+oNpcRAtd20sxrnZw6mpC0KHO70CoEASl2NcnU/Ah/veb7Z4
         6HbUfgag+P81YOOHGf6gWVflTLfKeUyOEINJlV4/hEynzZ7ibE8W1tjZmeiUM42G7h2v
         B7L/Hmg9756sZCgTL5aGKzYXzi0EIEz1zuqvLWoG517PwNL2P1iQdVL84KZz4QtpovSR
         8FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tNhx5XCbDz2ES+x3Bn09OzYyRx83+WywVAD5VUceAnw=;
        fh=F6cH8hrXWmLTuYs5dpktS+pHxjR9+IvRkNY9XI4aRF4=;
        b=A3qmk74I6XpRIpJsYKOS8UgQJGvJU/o9l44pl0Ltk+KJMJ1MQRUF6Aax0VOH6c823/
         hvg2V/RP5TQ0RrbQUac4k7iB9eZZ01rGhe0b0csMvhqBU3CTIeLaERJQsohsX4sdIgTL
         pqoracZ2YuUrZ21hIEWtafcvffUaCcJg1XmIQCiAG/Iam9oqLCfPDfQjKhdoz0oUWxkD
         CoijKCWnPQrGT45LNFEjZYzQiGtHrTpYeCGUiLl7dw8SxH9N553aNMdAq/PebcviXgfa
         47iznjhhM4//ENs2GtW7EXSfpQhW9Z5KWz8pVKrbAXnCC7zRuckFWKjUJmIIoW4dSMZr
         sO4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MolMc0VT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-826e0ea99a4si877230241.169.2024.07.22.05.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 05:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MolMc0VT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sVrqI-0003g1-S9; Mon, 22 Jul 2024 08:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrq0-0002AJ-Nv
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 08:08:25 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrpz-0008A6-1j
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 08:08:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7979c3ffb1so217119166b.2
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 05:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721650097; x=1722254897; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tNhx5XCbDz2ES+x3Bn09OzYyRx83+WywVAD5VUceAnw=;
 b=MolMc0VT2S7JFA2+oZPbDfLLQR0yhvNZ+jcQDuL/Gg6yWx7c1Z+Lw2m6ShvDhau5jy
 69wxWP97xr6vBBG834fImvg4BgSjQKX4VfVNXAJYgQeD9pxn/z+of0z+zVKob45JstKx
 3JYv1hemjwAWKtpU9AJJ83cba6KR0bRryolxJ3/MaqH0L8/iUHI+b5ZfwmPNZE9wSTxZ
 EzHsQopzFJLRxSAC3sK8OtVeLUwyjVIN8yxdDfKREYanTX+vo43aIluSnEby/Iotq0A4
 zyXK4fDeEVf29nynt+U7SVZCLtI2PCjCxxxAEAOt94K5FJrZPx/2CLa8qrc5WTr187Tv
 Wdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721650097; x=1722254897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tNhx5XCbDz2ES+x3Bn09OzYyRx83+WywVAD5VUceAnw=;
 b=Hi+2cc9eId/x7RaORHgEOW+r7hoEsJnYs2WhbwTuNTt71BHTkCQAnAc5dnUoywo6ID
 WXlXQcN0QhYZr1saAD2KEzHGgFpEZmgMx7tzdPvprlH9i8NTwvUs7f2XxM8IeTn1YJlR
 MnJ89nh8v/OlnOlNTXvr835xA5RVSQ6FOOI+KP88cKi0tZvWaOdtqXwaCDBx42A/oKN7
 6vv3vPhbKWassU7oTa2b6sN6uJnd5PWuwOl4svOIjyTVm6oh3Sx+e5FOO92A6NhaVJR4
 JzatTogSkVRwvZqSAw4vjqKZvyqYwqPfETHNm6ZqjYk0s5zBSdEklOzEM9jdjc/3I5bm
 qAkA==
X-Gm-Message-State: AOJu0YzrZj/b2SkWPUwYnrGm0Nye83bT50GQ38QxwbqxoQrOnTwEZWRk
 cRJQzIvnDnCyx/ArwCelrUVvuqbxAWdwK2c97xfa7V3hKl4S0iEuYBmE+fYZeh0Zn1IHPvVncvI
 lSnnUJMu6g6jvVlCAFwlUBQQ9YJx0a1KwBFOdvg==
X-Received: by 2002:a05:6402:50c8:b0:5a2:c1b1:4d3 with SMTP id
 4fb4d7f45d1cf-5a47b1dee89mr6199567a12.28.1721650097158; Mon, 22 Jul 2024
 05:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-9-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 13:08:06 +0100
Message-ID: <CAFEAcA8HxomNgX2pALS7M0BMiqxcCtBV932WDDXE-KO+00HZkg@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] target/ppc: Improve helper_dcbz for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: Drz7J6fYcGKu

On Fri, 19 Jul 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark the reserve_addr check unlikely.  Use tlb_vaddr_to_host
> instead of probe_write, relying on the memset itself to test
> for page writability.  Use set/clear_helper_retaddr so that
> we can properly unwind on segfault.
>
> With this, a trivial loop around guest memset will spend
> nearly 50% of runtime within helper_dcbz and host memset.

I find this a bit difficult to interpret -- maybe add
what it was before (presumably spending too much time
somewhere else) ?

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
