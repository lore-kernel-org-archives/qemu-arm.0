Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp432643njb;
        Tue, 4 Feb 2025 11:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVq6lhWY9OzlY5Euk2XVZ92TfxifK2dzHYKhFHCPqltqgxaaOi0+3xvicIYpK2XAea+9fLDR60zKQ438g==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ+4Q+axAJ07Vz1Grp8CjNNqcYBT4JoONTac/vBzNKStS3ZcieuVX99nfxMWJ1wjt30C2F
X-Received: by 2002:a05:620a:4148:b0:7b6:f03e:6c0e with SMTP id af79cd13be357-7bffcd070ffmr4111916785a.31.1738696365579;
        Tue, 04 Feb 2025 11:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738696365; cv=none;
        d=google.com; s=arc-20240605;
        b=g4Y/sJ5Jaqp79xKTYh52fN0V0cPpMnHlCO5e8jEt0aEFsVeLk5jLmqvTDPWRDTIlAT
         ptst6xzRyipUjYb+sSjArCj34MMyGvxxbUKONOYXIkmTRIEcXBXvAMNpYrsqkvE37faQ
         jm8tXB6rTB3Tzh3iK6RoxQlEetFE6WJ479EDeW3k3cOotSFFIw/JI+3lgCb2ceD9FpRY
         AragEfOLOU4e+obwSIwgOGBkM7q29ArIAciw92nHoF5cfXx2+AsR0TfpLNI71dFGKhb3
         8gsGk+szGRv2hjmf2X6CjIYfydYLADCWB9A5Kgq95AtLe0ypUZVCpfjxdbKtovMjT87K
         OlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1uhHhvRU/BGikXKHNsjTq2q46NE2D8U8FefZtc09pRc=;
        fh=tMDdplrpGbO3EN63KCD9n1fxtgyz6OOdcr2L4Mo8VNM=;
        b=gIXT7D6soD2W4wg2H2iGB8pgxXeGvRO6goBROMEfRyWcvFtznOkU9IWQjd9lbRhHo8
         lh8U6VB5AMzLlsP9UjISdy3HPoRfMHHMIW4IdOHsCxJkaFzfUcEyX9OyUJwbGlrmkVlb
         SXLK2C9ACN/G5SN/y0dpwW2ZnyI3NByC1abo/eeJylwZ6s7j0gb+OWT6lM4rb7M5/deD
         zDMN/1jOI/ottKoK9tcgckF33v5sdiHaCmHgFWfJyuvCO8bivqNUHfEGp6QlbNefg+zd
         8dV6n8czpCCnSdrQF/T/iXeofvFJyEDYzs7s3DWp1Ui1dH9BGvXmMnEbojf6J3Sa4oOs
         OToA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7LT57lS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4de10si326398585a.61.2025.02.04.11.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 11:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7LT57lS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfOLc-0003Z5-KB; Tue, 04 Feb 2025 14:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfOLY-0003SV-M4
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 14:12:32 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfOLW-0007yW-43
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 14:12:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4368a293339so68888785e9.3
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 11:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738696348; x=1739301148; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1uhHhvRU/BGikXKHNsjTq2q46NE2D8U8FefZtc09pRc=;
 b=U7LT57lSksdBrCNlZFKXvk/oImbV90v4kwQR9KBGLMqn5L02aUbBSQzbUhr+v4L5qD
 gWjO3M8WYjMJjOdC45D5S80DlWAuTIwgJc1O3gj+VChOznAxcvn9NXXukTPsIFVzXvbF
 K0Fz2PTE+MQQUWHRciNKH16To25grZaineCUqsXl3NPnpeaYcz+XxdUV6lH4vnxm6xTt
 dE61Omf4txeIU48K82fePe4Yq/baRWu8lSz+KMPXdoCoesQsp+QOe5fLQo+X+v6tx3Ga
 nKyYjfTHPCUUVc5btKBNyGVKZxkCHlwYk12xihhbwSwt8phzbdK254/zmWAeLyPjVr5Z
 6+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738696348; x=1739301148;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1uhHhvRU/BGikXKHNsjTq2q46NE2D8U8FefZtc09pRc=;
 b=pU+sN9TzuvNWCPIkVAgBruaOSZb5gn6eOjupq7x07lWXRluogBYyr2B8DcASgBRDXm
 x+NiGgPn2y4NjPfH96a4wtNJbo0u4FMBmgaH1aRCuM+dEvpooZrwIVxTR3dh/0Sbwlvx
 Sobnqwml+j8nIYRYZZyHWb9VxGqAPzsMqnLcNn9PA/NnNBg7PtKbMgjUKpC9R63eOBfu
 t5xGgfdfi+7roD0W4Mjh9aSHYhGZ5MKnE5+Rz1XhoCba0LP3Ve1CDJNzKVZx+J67swvx
 MkF5JomN1YMudCuyRM29JkUJUXK5i7MTUmcTfmWG8Bpu5IN5Nnf7AL3YLzTbOLqUha/T
 5asw==
X-Gm-Message-State: AOJu0YyKRXFWKhPu+4QRLJc9E/lrf9Im+ooqz3BjQ50ruTyGzeuAibKp
 Qh11x2h1f86dmm4lBhg7xFjRXGaOpic3x9Gn8ZlDfB7yJoo2VnLz5cQolCHJEG8/gqzAPruK24b
 j/c8=
X-Gm-Gg: ASbGncuLg4aBc+sYlGseYUqi0ZhZtck/vlJ00AsKl7+tkhJcFkpfF4qU+n6a5nVYICn
 sm6Q/XiEY4SFy63RRHQQGYkt4TtIUmaFqk91BD+9sC66Zykk/+rQCPDejsTbhwLrrN88C/GdjQX
 bTurusLfEDksthv3q3tD/pRV2RytRpteJTBH0BFZDaN95eW2hneUm9TeRYavP53KGQr0VPjqpqm
 uEMcKisg7jwN258SblgQ4y0PQI6Vg1G/kMnqVqqgFeFpB989Kr25DhT9g+qeP6LdEXIh6ENlIeV
 er81VRW1k06FmBoiidTk19MatjzMM7vTPFXPCUlW4Z1UbJllcetXKtGeP1k=
X-Received: by 2002:a05:600c:3488:b0:436:ed38:5c85 with SMTP id
 5b1f17b1804b1-438dc3cbc24mr258085405e9.14.1738696348146; 
 Tue, 04 Feb 2025 11:12:28 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6dfb5sm240172815e9.31.2025.02.04.11.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 11:12:27 -0800 (PST)
Message-ID: <075834df-6e81-43f8-81e0-2b2df5b9a828@linaro.org>
Date: Tue, 4 Feb 2025 20:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] hw/arm: Remove all invalid uses of
 auto_create_sdcard=true
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20250204182903.59200-1-philmd@linaro.org>
 <20250204182903.59200-6-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204182903.59200-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KO9wUs7ISkRW

On 4/2/25 19:29, Philippe Mathieu-Daudé wrote:
> MachineClass::auto_create_sdcard is only useful to automatically
> create a SD card, attach a IF_SD block drive to it and plug the
> card onto a SD bus. None of the ARM machines modified by this
> commit try to use the IF_SD interface.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c            | 21 ---------------------
>   hw/arm/b-l475e-iot01a.c    |  1 -
>   hw/arm/bananapi_m2u.c      |  1 -
>   hw/arm/collie.c            |  1 -
>   hw/arm/digic_boards.c      |  1 -
>   hw/arm/exynos4_boards.c    |  2 --
>   hw/arm/fby35.c             |  1 -
>   hw/arm/highbank.c          |  2 --
>   hw/arm/imx25_pdk.c         |  1 -
>   hw/arm/kzm.c               |  1 -
>   hw/arm/mcimx6ul-evk.c      |  1 -
>   hw/arm/mcimx7d-sabre.c     |  3 ++-
>   hw/arm/microbit.c          |  1 -
>   hw/arm/mps2-tz.c           |  4 ----
>   hw/arm/mps2.c              |  4 ----
>   hw/arm/mps3r.c             |  1 -
>   hw/arm/msf2-som.c          |  1 -
>   hw/arm/musca.c             |  2 --
>   hw/arm/musicpal.c          |  1 -
>   hw/arm/netduino2.c         |  1 -
>   hw/arm/netduinoplus2.c     |  1 -
>   hw/arm/olimex-stm32-h405.c |  1 -
>   hw/arm/raspi.c             |  5 -----
>   hw/arm/raspi4b.c           |  1 -
>   hw/arm/sabrelite.c         |  1 -
>   hw/arm/sbsa-ref.c          |  1 -
>   hw/arm/stellaris.c         |  1 -
>   hw/arm/stm32vldiscovery.c  |  1 -
>   hw/arm/versatilepb.c       |  2 --
>   hw/arm/virt.c              |  1 -
>   hw/arm/xen-pvh.c           |  1 -
>   hw/arm/xlnx-versal-virt.c  |  1 -
>   hw/arm/xlnx-zcu102.c       |  1 -
>   33 files changed, 2 insertions(+), 67 deletions(-)

As Thomas noted in v2, this patch isn't correct.
