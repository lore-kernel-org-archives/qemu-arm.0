Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2204198njb;
        Mon, 10 Feb 2025 12:37:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUShBBTvME733Xy6t1RK+S3yN8ImJZtMkVeOb9XYFF24fOt1X8KGL+plk//kAaHvElI/zwF+ytzTAiZQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH0HF1VTOlkgdh1FHdZxRoTrxkgtveQGikIYiKHkp5YzWDnQ0eEy1hnWqPp/WZ835b2q8g1
X-Received: by 2002:a05:622a:453:b0:471:9700:1538 with SMTP id d75a77b69052e-47197001706mr61445621cf.52.1739219862533;
        Mon, 10 Feb 2025 12:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739219862; cv=none;
        d=google.com; s=arc-20240605;
        b=NwMrwlUD9EZJRSqOF77HDbUaBhfo6zL5y0KrxoMpwXtNuCZ88jd/735x0yHZtHnmFP
         ExGKzCx6tsErjOJ+iJ5o5KGXFJ9gYVqpw93axGZhyFRGcpvlYid/YaWPtFfihcBeZq98
         hcg6LXSv58CD8Q6RfXk/m4oOlXglU0B0iniee6CdYKamYFi7DE9/DpSiONy/Gjr/8wzE
         ugLBgIz0s0DbrxmSi1+lkDq2T7aKWX3kdpv87rupApIcyG34DPXyNZBdFE+hamcv7jg5
         vch6YW7t1LlEY4PIAy49kPM+FBvtgJDJkR5fbf7zooWYQN+DD580kt6PUqOTi+ZpxQva
         WAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RC7sHgzHavW3ol4mYW8u376+AF+In7fWDQ+2UaL7XNw=;
        fh=AQ+1CGE9EVwP2Pg87aYWbWazK/AOUmiaZIqDkObDhLA=;
        b=UF7RnMVWP0RWFnJWKq+n1E/ClmKEO7tN7b1NabFgQyxQX1MitxKzsqW0F4Nit/6KP5
         JZMEszntCqndcWfD+uYJywhhDp9P/w0YUzWChvKiI+casVcMk6PsDoCkP0vi+BDQFNDg
         CBQ9FrT86G15Z7m2cOz+ss2AveQqw8y413XSynJ2TGvx6X4OoMnK8RjfIZLO8j4jjlAf
         hxTaPmCDVN7mwFY8Visv1UbWw/mMJZ470OAaVDaVn4mLqV/St66WGs6WKeVRbJgRGxb7
         7ZsP1dgtarkNMx8NQMEMUUgZt7yr1Yh1ZVpvclIzsPu7uHID+nmfPWPzju+WUI7vttYz
         07jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSoVgPOO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471945a49f5si25265341cf.548.2025.02.10.12.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 12:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSoVgPOO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thaXA-0003Gg-V4; Mon, 10 Feb 2025 15:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaWs-0003Bb-UQ
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:37:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaWp-0002mO-SF
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:37:17 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso32360835e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 12:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739219834; x=1739824634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RC7sHgzHavW3ol4mYW8u376+AF+In7fWDQ+2UaL7XNw=;
 b=eSoVgPOO1mnK0I5zsLVBAnGMClciaI+TvR16m7kiF6KUV3q+C4LqhC/7LbivQkA/zO
 JdTBKO+OIaYcBuXEPqizVqWnDZdgzs37gEp7NFn8BvH/e3fznPr6Tble+FsmN0bfo55C
 3D5cS91ZzZN1enfPM9f8lue6o+V9u/3zjS9B2WizGMZe3VeaxtSR22vMdyxDxvBkue6Z
 vDN4goxflGV7ApfiLoFMD4Of8NYgyXNKZQCyuaTThC69gnHWcNYvmyFt4NtuKN+/k04N
 JHQuGnIU79vgaNRNOBcvHiXhcrMvEB/sv7uGBSHmMHLDf60YGdQr4yJ1kGsXZNGeufb4
 F2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739219834; x=1739824634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RC7sHgzHavW3ol4mYW8u376+AF+In7fWDQ+2UaL7XNw=;
 b=QhyoKqCiFQcE+6C5rX5tsGg9efkeCxnTINwjEQzJ0dFEE+oe6aHLXCILMHTQ1BN9lK
 9lY9q+p+jz2onbImVhiyn05M8MhqnSUkrdMHMM3o+1MUdUpf6cxeFVhWvhx+JUo4K06S
 k9yOe8pEr2tPdOwLaDdgV75e8BH2XWidMgEl4Fup0aHjBgzq2hHHKTg7VjEiWYSdH6Hv
 xSsAm2GzpNZNNXvLmYNqUjnXxw0Q2FFIYmc2wv96wXf+WbX45LGP+0lQN4SnYSUCn6U9
 G+DzXXegPOWNR49cVjGUyqrphnWVyJEs5FrDMwmqQaDwAfxpnyURm/xu+lpyvxS0IvLZ
 qJJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwsoNmYD2v9rDN8NH1Ro61f4niKIcuAx/BuMH78+rR6+wnUdMN8h+L2HmwnLK+K2MUmus+/I49eA==@nongnu.org
X-Gm-Message-State: AOJu0Yz1eHH7el9YDAbRTGxoKyRZpXwVhCqIxakcsM2HusjO5WY7VpJx
 zm52an4yzOjyWkbEhePibKW8mXF8w9PZ81ArQaPDOfWCAEauWIC6nZWh58n27Mw=
X-Gm-Gg: ASbGncs+q24i3KNGtvnVBfr2mDvq/lpSnegfWxEJpaIHRrdjTyxjP0aphJbafGmCllZ
 BMkErhmTNhKguTADNLA4e+Lspi/3x8OBifM/sae7RL+noyWZYFiJ7vLsP8SEg0AmVVWwRjoj1GR
 RSwzhr/ZJ6BUOYiXhFgpdO7TCpwjqAes6m1f8ErRUGZuXbgwy/bGB+UQZcB6njbbFD7P+NgqUwv
 jRuBo3MU/QlVMNwhMagsTN6kJbtDYzfuRz6lOIXds9Zzlp71AgTn++KLpyURUkL3MIuibQWRqXH
 4wvDzLEriVhw7aeQxciKXMJWlsE+KctV8ska/7C50sPNFrIQaGkCSK15dDc=
X-Received: by 2002:a5d:6d8a:0:b0:38d:dfdc:52a2 with SMTP id
 ffacd0b85a97d-38ddfdc546amr4461506f8f.40.1739219833782; 
 Mon, 10 Feb 2025 12:37:13 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d685sm189934845e9.13.2025.02.10.12.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 12:37:13 -0800 (PST)
Message-ID: <76bcf481-2175-47a0-ab28-f67695e27ee8@linaro.org>
Date: Mon, 10 Feb 2025 21:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250204200934.65279-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204200934.65279-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: V+Qny9uPWlp8

On 4/2/25 21:09, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (7):
>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>    hw/boards: Rename no_sdcard -> auto_create_sdcard
>    hw/boards: Remove all invalid uses of auto_create_sdcard=true
>    hw/arm: Remove all invalid uses of auto_create_sdcard=true
>    hw/riscv: Remove all invalid uses of auto_create_sdcard=true
>    hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus

Series queued including Markus' description update from v2, thanks!
