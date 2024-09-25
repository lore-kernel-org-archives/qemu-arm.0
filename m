Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp242810njb;
        Wed, 25 Sep 2024 04:05:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJIhNLNPSXwJdIWAsuVTdoKQ+kRKwmwTPykA/U2AuleKOpIdqfAKYhUAnrL2PsFUS3C1+79E0WH33f5A==@linaro.org
X-Google-Smtp-Source: AGHT+IGEaSDMA+8zDTyTzLm3anOyXihz5BjdEDkRS6GLH3oouGEALY3Zf28yFuWXjvt8F7jsQeEi
X-Received: by 2002:a05:620a:4496:b0:7a9:a219:17a2 with SMTP id af79cd13be357-7ace744d4d2mr345524185a.50.1727262340234;
        Wed, 25 Sep 2024 04:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727262340; cv=none;
        d=google.com; s=arc-20240605;
        b=HFNFP2+zO86uisfZK5zFtgN3KVQa+/8FSL8NIKU1SRPe3ofzkQVooNePUcHAWu019u
         LXsPipde/xpfXs9Nbnnawl1+tvggzn8QWuZvu7J4hRuZOnEmXIbDDPs9F5TVZa7eXjMo
         iBYoumoKVNWprTilrhSWXYYNpQaWxRD7OzB99SYijkmYcSXr7ndlo/kWSpWd0EBbNlZY
         0b7+v2DuP2fFdvzONf2y9GxqFiuDjlGnnGoYEQFLXbd5r5rJKU1ks9TcWyd02FW4hCqE
         tfeWa5CPg++w0ttMPf/eUg7VptjR22q36L6VB+8Mo2M1tFiQu485WDSoSkhKWBcGZSn3
         m3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XD7RRfHaxQ6/w3m7YDB0Ut+qX/tB8DtOzSqGUUCudAU=;
        fh=mOrQWbwvSWgojlWdBH8Q2fVEvb9CwuJ1hUmnp96v7EQ=;
        b=cjvKoTAUWus7+pae0vEqfhhhz80m72SAVerUvEef4WO4/bWLQFOVghS20S0aSbKelA
         StPcTtmoQLWMusB6bpDIuR7L3G3ywofIyWYkJ53IPEL/Rubc/+1pLxIfxfps4OXWSmjk
         Mp/eIGcFmP7V2P23ROJQKWLZRa4DWFjzGk0iF7cQ4RWx+DDrF764lJdFbfzcBVq37QsS
         MGkGi1y3yl3B+B2EN7qfSi+9Q7V2ARIsNQeX8lfq12Jxt+3K1fx8FnbOHfBKgvnnKHyH
         HWZhTaYVNyoDbVL2JaUTmvzEhWIyudstV4EYjxAJ0nB5PB4NUOyN9pC3zbuFJ2/DFFNS
         uZow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rouTciOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acde548fc6si369800085a.205.2024.09.25.04.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 04:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rouTciOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stPpW-0003AG-Mr; Wed, 25 Sep 2024 07:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1stPpS-00038W-Rx
 for qemu-arm@nongnu.org; Wed, 25 Sep 2024 07:05:07 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1stPpR-00024H-5H
 for qemu-arm@nongnu.org; Wed, 25 Sep 2024 07:05:06 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5365b6bd901so7826167e87.2
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2024 04:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727262302; x=1727867102; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XD7RRfHaxQ6/w3m7YDB0Ut+qX/tB8DtOzSqGUUCudAU=;
 b=rouTciOmxEg7pZpm8W4ShGZcdLfifK03ZsGjK/iNLaVAEyvMbaUayBtSvi9tP5qgjF
 XrEOxtCH9zFBwzxyH9UpLLAzpLH3/+t0sAct349aEfXzclAfwQctXzVAimxXp9ethKoW
 0d5/OBVwmCJWW2O7s9AGB6K/Ssc3IrK8wZDHKGoZlnt5cblrcY0RQAxJz6sT+/gzE838
 gfGX3o/kuIegrhdVtrWjVAIia9ONcYxjx7FKkb0mAU6v1GTXiv5WBy818BnFvSDTueTT
 EOKL4uzzvyDxbkf9KHMNDTvtYfvEvDXhXRTzhr+7UzXoDCdyRFgq02ukBZyvvEIrt4Ue
 Dqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727262302; x=1727867102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XD7RRfHaxQ6/w3m7YDB0Ut+qX/tB8DtOzSqGUUCudAU=;
 b=rz6wkosXwFVpvnICeeXqFEYzo7lAJrqt5XuxhlsFL9JvAdlfjrP0FeHJBBiAIo98SC
 0vz/ARU7tSt3G5t4k0t7fV7QgjSMtvvAWHUdA1wswHuVXWL/Bkw7k+i+FnSdwm6DE+oc
 jClOaoF9zmPDFU9xru3o743xNrEF44DBhk4S6WEO+18PotNZrHIA0h8jTrugzdnT5lFA
 gcVwOYowFJ0AQWkbzJs69nfr6U1k+IlX3qKZ76IQ5K8N0YhG9qrN+oxL9eQDWyH2ImT5
 oa3rg9qc4ExkKTG5PRDBmrt+Odf4NJPHQPYMcegqu5p6MTBb6DMyQbSz9lDHBfXHf5RM
 BM7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt3LkLiWPY27ci2/RrL1P9J+rTwaTPnUYKdJImIvUbSL9XxqHhygw4AZIadlbp5T59VqR2jHjhpw==@nongnu.org
X-Gm-Message-State: AOJu0Yw+qn4KBwZqRqaKCgh0uHTQ7dR1lbZVs7f9ykz8/w51R8tjGBZ2
 JD8DFyuE54YppRI2KSCaAiHJJHUIiRFiYZ1SV6Llx7Fj8Zlg91iu6LC8PYlH58ZeAl21Jg0/XEE
 T9ujJzuNMQvAosVFGkEca4Sd12G79zhT8n3msQA==
X-Received: by 2002:a05:6512:3e1b:b0:536:52c4:d7d3 with SMTP id
 2adb3069b0e04-5387048abcemr1110828e87.9.1727262301950; Wed, 25 Sep 2024
 04:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240924191932.49386-1-philmd@linaro.org>
In-Reply-To: <20240924191932.49386-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Sep 2024 12:04:50 +0100
Message-ID: <CAFEAcA-X+BUGcq0EGOC05DWqjNd+WSs_Ufqv8=gpRfF0uAmUYg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/armv7m: Expose and access System Control Space
 as little endian
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Tony Nguyen <tony.nguyen@bt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: SKBImRr44zfY

On Tue, 24 Sept 2024 at 20:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Per the Armv7-M Architecture Reference Manual (ARM DDI 0403E):
>
>   The System Control Space (SCS, address range 0xE000E000 to
>   0xE000EFFF) is a memory-mapped 4KB address space that provides
>   32-bit registers for configuration, status reporting and control.
>   All accesses to the SCS are little endian.
>
> Expose the region as a little-endian one and force dispatched
> accesses to also be in little endianness.
>
> Fixes: d5d680cacc ("memory: Access MemoryRegion with endianness")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

What's the rationale for this change? All Arm system emulator
builds are TARGET_LITTLE_ENDIAN, so MO_TE and MO_LE have
identical behaviour, as do DEVICE_LITTLE_ENDIAN and
DEVICE_TARGET_ENDIAN.

thanks
-- PMM
