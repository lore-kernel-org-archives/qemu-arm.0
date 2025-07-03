Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp419558dyc;
        Thu, 3 Jul 2025 02:52:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrUuaz6dyC1k+o1Gk4+9u2GRXxzCs1UWoHeJLM+3UOf6JpdX3HnKkGuKrBKc/haGVupptIQTbvTnZk6g==@linaro.org
X-Google-Smtp-Source: AGHT+IFBh24oTIezmVUKhUJNNtDC8hNK/qbVhvn/7t+VzUFZnBWvg/jkyJ4HfklTpWTBM7yYgRMi
X-Received: by 2002:a05:622a:248:b0:48d:8053:d8ee with SMTP id d75a77b69052e-4a9769e4381mr86826711cf.36.1751536343332;
        Thu, 03 Jul 2025 02:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751536343; cv=none;
        d=google.com; s=arc-20240605;
        b=Zq3CFSAuHExyR9Py2UxocSooYJJjKd/3sELYBc6VQuK+G+BRQnyPQasENPuTiXTIXn
         GXtKifnEotEuJnvLIjg9fe91R460Fs0TCahigv/FyyHozAz5FcvY37xYvWWyclTwSbMC
         ARBpsoIQuwytdMQB8QPcvQDQChUcjRG9SqVLPcybS5JAsE4TcK/p8/26E/oZsDrLVk8g
         DGARTw2iwqgcCTJwIwCUVMICce6gQM1WpmzeKE3h32Qqd1OTwJyZ2Lr+v8IqIbuJoy4p
         ASUcVVY2RZ9wejpI2+Fv6Tn0WMpnN/O7UdL9PD1P60jL3H9jg2epWP5FcyAk6kj6wy7O
         mNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=440Yfx4oPuPWyVGymwciZZ5bQbhtU6PFoxDEewKnIvw=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=hjjfDFB+sKSWJMnOUorjrx7g7wlpW62h1VisEeyHvxtpXxSVMC0H/tKmK9eiG2EXGA
         BTeK/HalJpS4hBKp6zikG5/TvVpNWgWMNYzlhd0Iac7e8T6VKVBDGMjbgDdc7juV8pHp
         mERFNyyAZK9+LEhJgCfgCsWjnq2a9725WXb4A0BxQtaKPyqYOiFZURWU3k1wcqS2U+RK
         XGJs9LnLrpdn+bZmmclzKJZf626sRWD8NEQEOKcL7H05k+nBF2SUzzqPE7bwHJ3gf7rO
         APIJCl3xhT5Da9jJ2w3KO/IwR6A5fnZeu5A7tXBQ6inUGqjQxb+pM44dizcb+jq7ofSg
         3u9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9b97qRh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e6d5dsi152000451cf.227.2025.07.03.02.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9b97qRh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGaf-0008Kb-KU; Thu, 03 Jul 2025 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGaQ-0007n1-PD
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:50:35 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGaO-0000ld-Eb
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:50:33 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-711756ae8c9so78831377b3.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751536231; x=1752141031; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=440Yfx4oPuPWyVGymwciZZ5bQbhtU6PFoxDEewKnIvw=;
 b=x9b97qRhgdn3M6Ki+00dLTWMFl4A9aGuiB+J7qJWByNsHUeg70jy+lvh5TwVEaVMfj
 jgy77LIgWJ3DJKxHtGhKpT+DYaon7y+k97bpjtnYjEBhxo2T3KvzPBv+NBo6OOsV8GCL
 4P8pd40EN8vHL8kwMlyh2thxIhsSFuMdcrIn8cw/HBrBh+tcF/hahQXMqsFHEZxrPL7z
 QREbHyZnURtPMCQH5q1jVubemV42HjAF7S7b/M/Yarp2zNzzKfcGOXBJbx/uus1n5Ixs
 ZRYWXh3huk38Wk2flSiEgKtsqitzO7UVn67KJRJKlhkDkkgiW486hM2kh+P5SpCxlD8u
 PNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751536231; x=1752141031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=440Yfx4oPuPWyVGymwciZZ5bQbhtU6PFoxDEewKnIvw=;
 b=Zr/lT/JKPCGDi4nXYX+MKG34Eq5VolCh/Fa1g4zvDMdLTP8uJFCizWoHFyLa94o1E3
 LWaMTHkBhCLlCrG4m07K/epDi5PX2lUt9DeEZj99JXDSHi1r2jaSoMQebGEBxcugk+xV
 UE/zNhOmNStUQPKAtgDatISipA+2JY9cKQiUdDK/V2p5GvZLBa7dSrQeyWCB7rSmGHz7
 VlyvNDXhPsFcOKBiS8NjFWu6S4m/f+Be6C61+2QHR/oxmX0to8fQ3CTFyv+RTAUD8Cxa
 sGQ/hpvBxui7+5jxGIhsahyGquT3bX/NvEBQXp2a/WLvxE02D9P+FFhFI01qLH6ZMINa
 yCmg==
X-Gm-Message-State: AOJu0YxqHzWtjeDap+Y4YC+m+XFTPxRrQ5X0m5pV4yUqzqy7GkEJLErY
 AAusRd8kkt3N+1eLHThzWEsjp6hX9Mi5YKMPYN4+DbUxX3no/VN9gVE2E0xS3YduRibP6TTZqrS
 x6FqZRlOX00Lx5+S8RKXmdCYZ09SqccMSTk0UFHf47Q==
X-Gm-Gg: ASbGncsLJcn7oej/M2msawS0ZtGlgLcuDOjU8s+L99nRMePm6Pr4YsxOJrI9VKMNKI3
 iNWUHzZbxVkAYRvfKOmfUi1dJBOk6o/oCH9CYg5cPgHMwaEDfUY9z7+T8uzDMqwvLLjPGcW6/JB
 6P6WWFv+wwjd8N9Y15k55DWEnYV+TpfAl+uXMJ8HTYf02z
X-Received: by 2002:a05:690c:6d0c:b0:70f:9fcd:34f1 with SMTP id
 00721157ae682-7164d529e09mr82658727b3.25.1751536231006; Thu, 03 Jul 2025
 02:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-38-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:50:19 +0100
X-Gm-Features: Ac12FXzZ3ozsKkfZaA5gOKF37G_Imsweyv4LxggPbZshoaG-w5RmtwLEpYQGE9M
Message-ID: <CAFEAcA8QVMpC4aKkTSUoedzPsDdJccwortAiXDdtH2OoQSx6sA@mail.gmail.com>
Subject: Re: [PATCH v3 37/97] target/arm: Rename gvec_fml[as]_[hs] with _nf_
 infix
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mP5CHSyMeCVB

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize the non-fused nature of these multiply-add.
> Matches other helpers such as gvec_rsqrts_nf_[hs].
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
