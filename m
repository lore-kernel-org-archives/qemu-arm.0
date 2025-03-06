Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1494875njm;
        Thu, 6 Mar 2025 06:01:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVqlpmAk6yoprXJasWOtPy2bM83kG/zAivtmVpCrgbfUXc5F5b5wK+vuvds3tBpjkOx5Vizwt0dqiwvkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG3dxUgBcBqns+HKy6Y5N5mKw9+Eu5r5uandWwlqqt9fYOi44L9HvXQOgaRUPbq7yBNtKIS
X-Received: by 2002:a17:907:3faa:b0:ac2:55e:c3bb with SMTP id a640c23a62f3a-ac20da495edmr721722466b.2.1741269701478;
        Thu, 06 Mar 2025 06:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741269701; cv=none;
        d=google.com; s=arc-20240605;
        b=D8IgSKTbdQBSwM+VIROH8VRW5JIpvgsh1HkT6qGev9my7SbTq4m/TWV7ju+XMRseJp
         rI5CNh6njY3nfd1iwz4QR8dcy5OAC263SHFcWFw7m/2/UD7bfmLGoEmgM9XjkzsPauEm
         9r2KOqFccSz5vNvVKpgIYVqzw9ppk6+ZiS/LTYLDpKrQ/6ux2t27Nwb9iqakvoT47zcK
         0yl0LdR3OyPHAoCyuBPBGnTVQ5nTOHH8cOb73iemuMLiFYdfBLWHSlQGRSRE4KE6O+/W
         6pX4hnlbAD/e4+UMRRH/XHsa5rWZGHqW5ItEroioRcaxlUnH78GFzynAyHqdoCg4luhK
         QxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p8e+aTIsA5BuWm4hBuAs+wicLt1TmHRSHO0rAL2bOs8=;
        fh=EjfirrQgFBlBzVd2t9XAz92aRAjD6VZhHCw5XnN7hSw=;
        b=YxEEwTkhADaSO+ZqZYiaBzZWaYkbc/24MlkGqHZREBDNJzlODWC1D94oY7auoXBsSe
         iaHj23/ffsVAjwbCWhPeT0cCML3ys8VX7FYPQikhslgjCvoElsAeLwCLxJp6NVeqYBHQ
         g66WP9rsC2WJIJ1aD49pc+55Trs06PFjYRZT9GIYtOSkkaJtKMFtkOnlYm7C+EVGVCMc
         IKy87hQEdCtr2/atGDQnhMG2cks4/NfmguNqfFJyTJvucy5IzEpwL6mhC0sxFIq35kwg
         Lutz1IjVHWwc1yi8uR/Hv+IGk3VjM+DAcT0LubU3yX7xBiBcU9h+Izkd2oNhKd5Bo/uL
         WddA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZVRO5kz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a640c23a62f3a-ac23984ce5csi102843266b.559.2025.03.06.06.01.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 06:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZVRO5kz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqBmT-0000C0-PZ; Thu, 06 Mar 2025 09:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBmO-00009U-00
 for qemu-devel@nongnu.org; Thu, 06 Mar 2025 09:00:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBmK-0008Hy-Vh
 for qemu-devel@nongnu.org; Thu, 06 Mar 2025 09:00:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bc4b1603fso4461765e9.0
 for <qemu-devel@nongnu.org>; Thu, 06 Mar 2025 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741269647; x=1741874447; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p8e+aTIsA5BuWm4hBuAs+wicLt1TmHRSHO0rAL2bOs8=;
 b=KZVRO5kzWnia/KIVW7eA4bt+HYcUzgVK6sXxzqbwDsqM2uw/MGYGvoRfX8E+FURJEV
 2A3IBq0IzlMaL67zPeU+ezV5r81Y5F2kd3EC9i7n5f7RXMfFQjjknerD+Pv1XanmryIL
 wD+Bk34D2nn1bqZbelqp80DABUWhfytlX6aedLATeHZcGV/GLdFSIAIzSct3OZaYEdqF
 UnLCRLmETO+wmbhTUm1s+HM+KJ2D/d/tgoaFmiaLZYDDBy0CyB/Kq5yh43R6WOQ6eiy2
 4alBvekatkA4OpfJ8nM3+dd5o/qSVzDFc0DmougSug2/Z29nKGYJ7A24ZexaHIvjtsKv
 seVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269647; x=1741874447;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8e+aTIsA5BuWm4hBuAs+wicLt1TmHRSHO0rAL2bOs8=;
 b=keWT94qsjVv5JeMEaVw7ov49U2YfOaEnTH+ZrQKsWryF2ynTv+kDaD69ipkMqhoucO
 qYqyUPxq7TsI3RQ1NEHlTwT3AqjJ8qPld1ybUejVxE5hWvMCmMGEpy8hCtFBHdlxy/Nv
 L4K8bXy4lu/V+H+fYLmwpFEiCYHZ1wsXsbAYGmYfZuusy0JxcyCf3ddqUUQNeXZU36N3
 Xjn+mqP6yHcC2XCMrAq9zVJKq94+Jvb+LjEpXaDwoFra4KCGH4hiuKINTU5LyI5L9ShF
 a8whFpXa8Ju3Yl/9Ziqv02VBUG+RNwoqwl93cVHg9m6De1otxQV2PATo1WjpvDatWYuS
 eE6g==
X-Gm-Message-State: AOJu0YxLkStgccl33riew/Mit5+z+4Bwr9QXUIxAGAptsVDCjao9DeG5
 tEEURe0aF2Wj7LzjREoVLbUWx36umbkhoBAobS2kvs9esvcGUnQL+nGj/sL0p8W2iKUMth/lCey
 UJIY=
X-Gm-Gg: ASbGncscralXVpRATepbFkH2a6gEVTQC/fbmSjM1JTjQa3j79kP5Ndqo68jPKVGua4h
 P6Jcv1lr6H7CtAN1YDabcE2lf1MVif9sDKL4gtz5f1wazdbx0AGak9a7N+xXEHKlbtqP3NYcYu7
 22iJ4ljkyPidusK9b8uBVOY2qIt/46xagT+QFYghrvmWz6uTar8DjC/AqW7d8jqoKXV78tL/K0v
 D/rFtKHm7nsJ0x2weRPXLQl2GIwHJV7RuD4RQx1vaXMh+4iCjiboM4rzWEJDdp0m9ViNr6fDsmb
 idysGHtfzMCZYiRa4CgfBpzMQaWtCrjcBVtx0P85+l1lul/y9n7pUrpZ9c9qbquaR348yGb+xBL
 WGGNOHwp8WEk2
X-Received: by 2002:a05:6000:2cd:b0:390:ea34:7d83 with SMTP id
 ffacd0b85a97d-3911f76f519mr7336775f8f.31.1741269646543; 
 Thu, 06 Mar 2025 06:00:46 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcdasm2104332f8f.23.2025.03.06.06.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 06:00:46 -0800 (PST)
Message-ID: <d400e5b0-530f-43b3-8a6e-8539672af60f@linaro.org>
Date: Thu, 6 Mar 2025 15:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] disas: Have CPUClass::disas_set_info() callback
 set the endianness
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <8a185083-0459-4108-bd57-4bae75d871c6@linaro.org>
Content-Language: en-US
In-Reply-To: <8a185083-0459-4108-bd57-4bae75d871c6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: Q1snamdwHS1a

On 6/3/25 14:58, Philippe Mathieu-Daudé wrote:
> On 10/2/25 22:29, Philippe Mathieu-Daudé wrote:
> 
>> Philippe Mathieu-Daudé (10):
>>    target: Set disassemble_info::endian value for little-endian targets
>>    target: Set disassemble_info::endian value for big-endian targets
>>    target/arm: Set disassemble_info::endian value in disas_set_info()
>>    target/microblaze: Set disassemble_info::endian value in
>>      disas_set_info
>>    target/mips: Set disassemble_info::endian value in disas_set_info()
>>    target/ppc: Set disassemble_info::endian value in disas_set_info()
>>    target/riscv: Set disassemble_info::endian value in disas_set_info()
>>    target/sh4: Set disassemble_info::endian value in disas_set_info()
>>    target/xtensa: Set disassemble_info::endian value in disas_set_info()
>>    disas: Remove target_words_bigendian() call in
>>      initialize_debug_target()
> 
> Series queued with rth's comments addressed, thanks!

Oops I meant to reply this on v3:
https://lore.kernel.org/qemu-devel/20250210221830.69129-1-philmd@linaro.org/
