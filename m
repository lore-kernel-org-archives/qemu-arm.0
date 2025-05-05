Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2177862njj;
        Sun, 4 May 2025 18:48:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0SWtn/HyArn3tJzaZ8wyt3ImJ1bEkkMV9H7l3YUKHpw1WxutIpHVQmdQdV6uKhflEQsc8wJExltgcuA==@linaro.org
X-Google-Smtp-Source: AGHT+IGg04of78ZYaJkGYOVaMudsHM21VaHg8CF/C9uaPxtmDyXtNqtakZiQh0W/B15Q7MMYI34h
X-Received: by 2002:a05:6000:400a:b0:3a0:8295:9e0f with SMTP id ffacd0b85a97d-3a09cf3dc16mr5108327f8f.54.1746409720637;
        Sun, 04 May 2025 18:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409720; cv=none;
        d=google.com; s=arc-20240605;
        b=hBicF3TmB/RmSIYdtmYxyKZdlgC1Z7dc2XGxM7KedPx0q6P7Vq/TNcdX43SqYUjGY8
         poAKwy+uo/QaVxqkt7G5ltEPlejh21G+n32opCa6U9cR0G98ugRN/lZy5tsvrs+fmX4F
         wiv+Qbnjycy0iVeV6WT72m3O5Jg6MipLWOQxVZHBNnGLS/EQUEN6SM9mQgwRV7fUm3pI
         L0i6//c6QXhKKEmvY5wo7b5dDZf48Lkm39gg6VuRmpvzz2RRV19P1ggH4JJvaTGTFS/U
         xNt1NeJcNpO3zP0LB7kZIFZLBc75zE3grQjiQi8gRS/lxFQhcd4uEZbqOQ6gI1R+ELag
         +5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Rt1RVdUv+SXhF6NFAs0h8VmaaP4dkV5k07Nk0TOpO8E=;
        fh=aVBwCkqdVZ12xKDzVwyIgl2cAL0IT9RRO8v0NUQPss8=;
        b=jgPmPJYfxGogghvDWjuHLD2CeQHGNH8yoRlcDff7pcMz6+RI950e1BNmYcTcSgAT23
         kqNlBhq82OQILzMCQE6co+1zEdYsYUD+/2rven7eSAN23JqWs5PmthyuXzztR0zuSb23
         LoSjNtGjRnWqy6wLEy1+wsdYiY6t4xCC1a4rJBy6pOAUbxJt/4Q4n+j8XqLdWdyBVPgL
         eIr4tYyXxASwuv3HJrHwZzqntMbFNN+hxLuMktLGgZMAa58ZRxp1/V1AP9YupndDwvAf
         Lq5IA5L2keGFWQbXcuDkuJQHx9hOwLGE85hl7e9+Qq7aXCDB4k4CfUaEKfHIFqutG1CV
         1eQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=anyGCdp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b12067si4564962f8f.789.2025.05.04.18.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 May 2025 18:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=anyGCdp6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBkwR-0001o3-FR; Sun, 04 May 2025 21:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1uBkwP-0001nb-OT; Sun, 04 May 2025 21:48:22 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1uBkwO-00020T-F9; Sun, 04 May 2025 21:48:21 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-72c0b4a038fso2589301a34.0; 
 Sun, 04 May 2025 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746409698; x=1747014498; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rt1RVdUv+SXhF6NFAs0h8VmaaP4dkV5k07Nk0TOpO8E=;
 b=anyGCdp6NwtWVwBBjNcJUMmY5LUmHBtqacWLFCLm1Vj1z966GGwvext4hFf1TalOS/
 1QeV6LARpd+3L41sqTulg/SYDdMWSNRbsLVkgphCKEOk/DsX0EpQY9pqeE1dY943yBW9
 wG4Tr9ncYCMHU+N1Fz6d2oGru6CqujMOtG8o8L4g4pfzjveq2jSELGJlLo0OILH95goj
 oxSQKRmi7RGH4XTl8iUJVy56UJ7jvXYbsJp4Kwhim74hibBCTzxUhJAsqdY8szYMsjFZ
 Mi7ENcfSkX2+s2gyc2aJwK5++msHmBakCJ2t8RXTwKT0dTJzB7rPtZjxW0sCW1gU9caa
 A/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746409698; x=1747014498;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rt1RVdUv+SXhF6NFAs0h8VmaaP4dkV5k07Nk0TOpO8E=;
 b=JBqb5DdYWYGVYGJ3nb5FU4o520MVylxkSt4piqVcDsZ+KJ0CG+91J8QRsXr/utygw+
 /DzEMjp4iJ52FUmVOXb+BcEqfGe0ii7eBgNbuYL2npjjrN7PKRpb4vIPnIBcLTWSQblj
 16YI+QiSMWCoBQPAbAWfgcwGMoa+hSA8K3otxLLKCRVIkNIZ+kCJ1DC2UTi0KBCpfxQX
 IfajvWDCfN6CmELe38tCwRkZt8noWm+MocqrK5PIVv3AFpKufAxLcThNfmB9W91kzubo
 rgb3Bc/wZazghz5/zQ4l9ONMxF/zfp6muIJODsL7kUSIfoWNKAgOxCQ6KhDqK7Nkm0/l
 T1eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUERNlKPWte3MelvX8sd+Eox3BNqmITnDWVaGagBGiT2lRZcnpoGzInCPuf6bkANPvwTwQEN62ULg==@nongnu.org,
 AJvYcCXl1LL0VOO7Xf3aq5p4WI2jLH98tuTqzV9teDjrsBSJyp0dYdaMyWij/2E+eQ6rUxVq6CbSv2RdpoEplQ==@nongnu.org
X-Gm-Message-State: AOJu0YyWJQQn2aNpfyCDAJvX3khRTfqmkuseha94Zwn9YxNbn5VUfnlk
 5groTU19wgREQO88EUe1PhA8VLAmjc4SMR+BoxuBkAWJ/PTOAiQrEkUu7RiECjJrSWqZFEx3wdJ
 rWcFehCF2hYxRxPeb8EncEWmGc78=
X-Gm-Gg: ASbGncvYXRRzGZe8dBS7eyOKJK1MR0f3RN5cajslGt4nQBmr7TIPSewM7HExqRG7MHE
 JFYfAb9pObtlA+1pFaWShQrFq0Cp+gIg3PTwPiJpbqQ+9bZibViz+cwbHZ0a5RWIWxOeNkDCvjb
 K7lCjp3sgQAlVyLV/Nu1QNf9I=
X-Received: by 2002:a05:6870:a54c:b0:29e:1cd8:4a0f with SMTP id
 586e51a60fabf-2dab305b6dbmr6135386fac.17.1746409698230; Sun, 04 May 2025
 18:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250428022934.3081139-1-timlee660101@gmail.com>
 <CAFEAcA9tUdcunWBrtbxXhkjjrABM_EN8ZC+HKUNG0nWoOjPQ5w@mail.gmail.com>
In-Reply-To: <CAFEAcA9tUdcunWBrtbxXhkjjrABM_EN8ZC+HKUNG0nWoOjPQ5w@mail.gmail.com>
From: Tim Lee <timlee660101@gmail.com>
Date: Mon, 5 May 2025 09:48:06 +0800
X-Gm-Features: ATxdqUHLqRU0qLgN_wbM7lIOFpo2xrkYsY4xnppRxvv4BR42HfzObnz6oLHGjzc
Message-ID: <CAJG6D+jz94O9nQp8jLTWApRqTSzNCkXSYFAC-kLp1i6OV_kOGA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/npcm8xx_boards: Correct valid_cpu_types setting of
 NPCM8XX SoC
To: Peter Maydell <peter.maydell@linaro.org>
Cc: wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=timlee660101@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: WahJXXrROpkT

> Is this worth backporting to stable branches?
>
> Applied to target-arm.next, thanks.
>
> -- PMM

Hi Peter,
Thank you for taking the time to review this. I believe it is worth
backporting to stable branches.
The string "cortex-a9" and "cortex-a35" will point to different
ARMCPUInfo which could cause some features to not be applied correctly
in specific initial functions: "cortex_a9_initfn" and
"aarch64_a35_initfn".

Sincerely,
Tim Lee
