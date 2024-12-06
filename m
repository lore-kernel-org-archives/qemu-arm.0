Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp880450njb;
        Fri, 6 Dec 2024 06:22:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZet3UzC41KHugzSDiFrlqf2oxHvjeAf2HX3uSc28xtG0l4KJI44aNoMlyScj4nYLsVlJec5e0jykqPg==@linaro.org
X-Google-Smtp-Source: AGHT+IGc57cCr5gG6unhsWFD+Yc4MahkrOzQ1RNAno9uUd7wMoRVW2ZUFdCOG3baaWnkWQGQAAga
X-Received: by 2002:a05:620a:6011:b0:7b1:477f:8515 with SMTP id af79cd13be357-7b6bcb740c4mr436721685a.39.1733494947946;
        Fri, 06 Dec 2024 06:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733494947; cv=none;
        d=google.com; s=arc-20240605;
        b=HnQqbuI0rkunnyMBkoRuuugpWj0H4PCB6nlCxbT//ONwvkri3LuJTJjeA9//O4qCG1
         jeutDRUxJzAbBz8tCn99Dfu1mt5ns/JZ0tth2MphGs9EGsBYZNTN6jdaxgRroj5PydVI
         v8kBQFq+K3v5cqdRUpJX3cTlkKoX0bPYyZYUM20qh5sR1jOUPb1M6YdvbrksL/I5P17n
         OflEtiOJY/gCfPHyQhzs/k2ywylawIWjVsTq3ZFmfaIKn+p+OsXx4M1B0dco87DjCbg1
         FEkMgHpV0tVrRwi4rBBFusAb7FNv172neinpL3VH10G15gOvx7qYFFNLzQSf1TVPCY7g
         fv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Kk6qFwtYBFqP2JDvSSyWJ3JORz4xEP1E6VmQfqiCiBE=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=co7QomoO3MIvxyREr05AqrDyLivZOW+kiPhRO8/gjbMpkYSI7B0jdmExuOtugGUVOz
         nfZGQP4HTAcqMvgLgLpcTSr/ARUT1jtchm4/MArN2Z6Sinck5LMndbZs7EhU3febj/fC
         /MnCA76bFzg5lfgWWx59SBlGqZvR9Md+xzUXyCKtusgelskDUnoTLeXZOxQIRus+Wmpv
         Mqg3IGBiLqSPvfqQQhzZLQ3IFbIZORXf8MrbFd+zHzUyQc/AmjkdZgH2WNutGDhmCaIY
         cKiC6ZHy5NGN0P+4FPy3UgsZ+m2HkZLkh27EW0y40RFTm0Rz8bmkMk98OE9H8S7zuNsu
         76lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLLxbi90;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a5c369si481137185a.147.2024.12.06.06.22.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLLxbi90;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJZDb-00016p-0C; Fri, 06 Dec 2024 09:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZDO-00012w-I2
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 09:21:56 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZDH-00082P-SZ
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 09:21:54 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so2555403a12.1
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733494904; x=1734099704; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kk6qFwtYBFqP2JDvSSyWJ3JORz4xEP1E6VmQfqiCiBE=;
 b=vLLxbi90pmxvgvpj+NUZ8//RcXDOxwMceXrm0z1QWKRd9SgfNswIwMhaOH0iO9WD9v
 vjG1zHwjfhLohkKh4+02+nkCLYXAy0dR8HmVXQAXfHrrNtU6qhLfMlF0dFcW/xIpjexB
 09lIhTM07xNvshd6tUe7GGzcQI5hLYtEEEBb0nf25vRAP3kKc4zXHDDGw9iOYdR77Amh
 PQYnGoF4LygwVk6yt4fpDb2My2/HvvuOuCmmXDfgmwM79Qvh3Ce5ouwnceQFH0BtrElS
 /eNTRlYqiitTt3P9n+xLW6qhn9hcKlRU4C6cwnSwNgVji/1bSoQvcrkzzcD+RX+2B+KZ
 Ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733494904; x=1734099704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kk6qFwtYBFqP2JDvSSyWJ3JORz4xEP1E6VmQfqiCiBE=;
 b=cusxFQb4cT95UZW0srvGrhpMlw7leKPb8G4tdhYKoQr0v+QsnhwjCvYPc0RD6lq3G4
 rE1lEunaEWYUfZ8fwVVzbB1SQmqGnjWUoey3u8dn7v1rc8AxdYo5rKeZaAt4PK1U7LC+
 71w6S4GhuyZIN7cEg42d5sfLSBAbdSoIPFM9tXEloKmVGaiMhJADejC7RwppHwqxDLab
 BioPJF/KgGDRWUqvvXW2pN4Uw8Zejp1lPafsmDt7ppleVgjOzkisuvzgLTBES7zO/oQk
 NVRbAmvL4Hu1yw7o72nMCXQNzNlBraIO3GDSVS+Gol9TeQp+R6vgkKigOuXMbeUoe3Mr
 KqOg==
X-Gm-Message-State: AOJu0YxNGKDShQrvjLjStlpLPkik6RfBdwdpfPug4wfK0i4tU3H3e6q5
 dIz+k6rkOAE+tekLGLDDc7jKgw+vBeLzGHVfuL+jD1RDB9FQfdJsUgRIdDwStIib2b73iXQmxv/
 3peg62Lg4n2PhGlxgrIBhd+/wpmjcoewGg9t7wA==
X-Gm-Gg: ASbGncsqRxuCmvwB/d8ziA8jrnxbNPlgfe+5k6aysIehrBJNKwuYg7wtn9wcINYCB32
 GO1y9E2uNakkpbMnXgW8EPsTbm59migyE
X-Received: by 2002:a05:6402:5309:b0:5d0:214b:96b0 with SMTP id
 4fb4d7f45d1cf-5d3be661e1cmr3137179a12.1.1733494904253; Fri, 06 Dec 2024
 06:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-34-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 14:21:33 +0000
Message-ID: <CAFEAcA9xAWhRx0R1QUvd9gRgznAkUvmh4uZyorQ5ErCNVEZB0g@mail.gmail.com>
Subject: Re: [PATCH 33/67] target/arm: Convert handle_fmov to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: NY7t5A1HN6oc

On Sun, 1 Dec 2024 at 15:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove disas_fp_int_conv and disas_data_proc_fp as these
> were the last insns decoded by those functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
