Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1399095ejf;
        Wed, 17 Jan 2024 00:22:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHehYag6XtOJjq44f2OSTmj4Cjg1Bmkg7F4guziI5WXMk4hyJQIvxavH0x/gLa3M1x000YP
X-Received: by 2002:a05:6214:d84:b0:681:80b8:afec with SMTP id e4-20020a0562140d8400b0068180b8afecmr194813qve.25.1705479742436;
        Wed, 17 Jan 2024 00:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705479742; cv=none;
        d=google.com; s=arc-20160816;
        b=fXt8AfqUDws3Z4ezRKljp8n17OGhoAGHuOci8BD3pQgdKuNu4Zjz00onNObovKAXXl
         86458rkjbghSjOg2OYH7GwSxQlky8HwGLll0JldqN6eRIxw1pnrM8FjUmjMsE8pSzdsa
         Lh//m3i1FkzcXmuqn1VlMPaWTjjzU2Pjet3qXdmRZXipKk2PaQ1u5udEzzXyu7yYEQ8e
         bEiAz6aA+Cx1TE9JH11ATNjQeGRpLwX9tOEuiwfo0lo6Ckdf7Cy9X0Rzsnz/kNQfbckH
         0/EmA1pALCkosTMaSSp3wC5gjEeaLbFXdowX89T2/YDd7Iz5/NE9t67QzxcaSQ9JzZdY
         kgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EmEum774Ua+C6UqJ8Bit+z7AWBLq2AIE2JojPLeEIcc=;
        fh=QCq67MjJ9ZNv+r/6aHCftgXUNUhuidysX9YlaIvB7hU=;
        b=tlezX9giYC6geZLnGkidW2GnYSEtz/DH5GA/Gp9ETgKABu/OhK+Doa6tY4+DoIm7Bc
         hviqvyslgz7DEfm+tfylZBt8TtClCdAYB67LyPumHqx6LQ020BizNzD8USwVtKQAGCnR
         f44qRJx6U3IJ1nWymTK3kw+TSzscg7omXvdHZzAgzh5PDV/LgPjMDJayFnreLzUgLj5t
         /2KaUlKgZYLYG+ac/6TmrYHF6NuH8p2Qd4/Pe+lkT/d1On5v1sctpnJh0f3WxJlPh5dJ
         6FGOw9WPIidnvaHtOhdqvTjrg0vZlnknmtWjlr/weFX66ZXaUxFUNAKC3sfHO20iP2nm
         1uxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fJ9/HQ6t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020a0ce24d000000b006817a3fe953si974574qvl.144.2024.01.17.00.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fJ9/HQ6t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ1BY-0007jb-0R; Wed, 17 Jan 2024 03:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQ1BW-0007il-TC
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:22:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQ1BU-00062z-Es
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:22:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso8388653f8f.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jan 2024 00:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705479714; x=1706084514; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EmEum774Ua+C6UqJ8Bit+z7AWBLq2AIE2JojPLeEIcc=;
 b=fJ9/HQ6tD+ff37q1bFRwvsvPtA6vrhgUxNkTntjk3PA7kJFr+Drj0G0K8MDcZIcV1i
 yBqI6K3/yRSCglUrhk2l9WMJeYkOmtUjg79aqNuVujlackP6Zx79VpB538YyVjxS38vx
 wYa1kLxX6zKlGGfsuL9vv5THOWskIfz7jMS0zhImDRJFhBxxLR0FgZ2TKHQbwOZGmHB8
 y+HQr33qiR0YkFUbFWRd3r46lKHt+nZYnWNEqPhteTiWXevwLi3bar29kSrH6Oy4BheR
 iPcH0IttYMEnbHiSU0fgLJy/YkqvtAhxkXUIr/5GKu+UsjFMEhFix0dmWr092ovUAyxM
 dKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705479714; x=1706084514;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EmEum774Ua+C6UqJ8Bit+z7AWBLq2AIE2JojPLeEIcc=;
 b=byxpXFBOhc5sP3WtyNv70g50cdGm2qUVZiQl9339Gz6gi8kWZtFq65PMSnSwrdmBHX
 S7xZr0G0Y20b0OjuG+Myvjxz0RFqA4p13m291FAyCr9PNx2EOM51EyLoQcakEuhhHv6g
 oZJs9dGWRqWj7NpfZIYgBMKTXkSA+Alfb7JHQYtQvIjqzamMeG9CcyQeb7nUcA++EkNe
 Gnnjc9IX9iTocSrqG9x0nRJ35BYaMr1lUOwkZcZVOxo5Koubbmyt+X3dnEbI/xEvpCO1
 qIetZVALhx4cNZBJJhPAjcRmwoF7a9vtPj6xCIKgJwG+rZR2LT+Maxfdy9IbKPNm+RGA
 9Fkg==
X-Gm-Message-State: AOJu0Yy4pinQPlssMqy8YH0FdRTesab2WSkcEE7iwjNyfsxABiJWIuC5
 0jA7YBa6s/rWUJRU1S+JbsaHzG9kqEYUNw==
X-Received: by 2002:a05:600c:3551:b0:40e:4806:f42a with SMTP id
 i17-20020a05600c355100b0040e4806f42amr4707119wmq.15.1705479713781; 
 Wed, 17 Jan 2024 00:21:53 -0800 (PST)
Received: from [192.168.69.100] ([176.176.156.199])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d51cd000000b0033673ddd81csm1033645wrv.112.2024.01.17.00.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 00:21:53 -0800 (PST)
Message-ID: <a6146842-4202-4cca-a193-901bee53f1d3@linaro.org>
Date: Wed, 17 Jan 2024 09:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] sysemu/replay: Restrict icount to TCG system
 emulation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231208113529.74067-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231208113529.74067-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: i2Zk+QBFMipB

On 8/12/23 12:35, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>    sysemu/cpu-timers: Have icount_configure() return a boolean
>    system/vl: Evaluate icount after accelerator options are parsed
>    sysemu/cpu-timers: Introduce ICountMode enumerator
>    target/arm: Ensure icount is enabled when emulating INST_RETIRED
>    util/async: Only call icount_notify_exit() if icount is enabled
>    sysemu/replay: Restrict icount to system emulation

Thanks, series queued.

