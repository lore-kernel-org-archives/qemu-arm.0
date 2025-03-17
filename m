Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2338101njb;
        Mon, 17 Mar 2025 08:46:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVezG/drrrWEZBpp5qlM9rFrWi3S4QU+qcFXIPvV1fmU1oGSbCrl48cRI68oU6LC9AJw2xS5RgaShrnNg==@linaro.org
X-Google-Smtp-Source: AGHT+IE1cQsWcwNdS4oXBJ3YUyZRFfMGQFbVd1Ls8+qW1BcMSJQH17TiMPIQJPyikqDviiZJqAco
X-Received: by 2002:a05:6122:8c07:b0:520:43e0:8ea0 with SMTP id 71dfb90a1353d-52449a509fdmr7112820e0c.11.1742226381069;
        Mon, 17 Mar 2025 08:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742226381; cv=none;
        d=google.com; s=arc-20240605;
        b=hyZVikWkhU06EBchPv01A7eGb7ozHxGkRzcC8JHgWRKO8UzLcY+LI5o7EvjWkjtbhl
         kDrkQqKuJOgqM7ECjOUBDySM6iVjRtUJfXpsgsVCbpAJbodNiChd9Smg55EiBNMsRN+E
         rjzushVtUA7oiFR1mLJiDB4pZoyuOBuLxJ4eRvWsi0wUjMdljBWpGUzBxqh7ORTO4qZy
         9ZSxAe3BdyWGvHDqP3gdjMnkl02O/kt2IfQ5zh3dDLbOMnBZ0MKr1ZsR34h0LLwqTVP4
         L141TALzen3xQXzXzXN2XK1M5Nrjn46ZOhS+6LtRtLZMCjkECCSTmgganN+HXDvsSCNj
         FTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=0eRG5gcCqa7m7F3Krq5y+swCXkYKUlszqAvhvUF9uy8=;
        fh=NrgbTAAk5LgdSI0LPRKsklRkPeDQvN6E/vDR7vaR/4s=;
        b=KYg/PqHdJXMaBS/jcPkg3BT2ZagCFruINJsi3um7PZbvFkTRCOTtwz/v6s+BhrI+HH
         GQGPD2HNsD4SES9iC0imLXdT/fSaOnI9U1wTFeTyfBE8gyOvVANvird4jb6Q/FWN1fqf
         ld0kt+IC7iW90MKq7fQo7cOmNUiNu1jzdDdx17X9vBM9EC2UVHP3HQt3GhXTCwPCOo4Y
         eibnKyclh1Ec//jbTwzTFXKwaEfXYxs3diPz2X+YMPzs8rJniWxh/5qnQQ/rRn2BW1Wd
         n24izHwrq4SAn6ZsjHSG++8OlAYJ/hTe5UftczJ7nruTUBSbGdPO8Ugg/rk1DZaq0X77
         1gww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OnHUnNtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5243a6c8789si2836924e0c.118.2025.03.17.08.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OnHUnNtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCfF-0005kz-6g; Mon, 17 Mar 2025 11:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCfD-0005jf-Ba
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:46:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCfB-0007IZ-Kg
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:46:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso3563581f8f.1
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742226360; x=1742831160; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0eRG5gcCqa7m7F3Krq5y+swCXkYKUlszqAvhvUF9uy8=;
 b=OnHUnNtNXWnZFM6xOBUeFq0pn9A1hRPMhUmQRjN5i7s/ZVRo5pqnRnXpeo8Z3rFXbT
 +/hJxNv0QoKGp75uJKROsxJbzgDt6JWFsu6R98LmcdNPwmOv4+QUSWpPRxwDkiLk8nV9
 DBPhRreRKa9hONxHF7T95Qc36TCunMssXPlvHGZ/g4XBq7PivHmi541UuN2ksDpEFM3T
 2q1/Jgbz8o0aqL0CYwD+w/RGL30YpNl9U2dHXwyhGWvwmFN6VC1LFj1OwwsdPRDBZbhg
 Nk0Fwz1aPp9tPFU8HmImMbTsLA/lYLN1gltKRRD2J4yAAGb9T73p6g+3gjVDXGc3SSFc
 UNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226360; x=1742831160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0eRG5gcCqa7m7F3Krq5y+swCXkYKUlszqAvhvUF9uy8=;
 b=ijLbbU72UsiasXjedixcjHGyoiuidy/n1wvIUuoQQpTnX24Uoch2C3DcAft8sOEq8H
 We6IqG0i0z76PekCG4DdbLQdOCHhkGzC21rVIib0jQ0ie4uEWrpKIRBQPColpRpZE50g
 HvUB2Ex6NzyQFWFQUeQ1FzI9Cu5Lw0c67sP3522RR6EgELIvld5V7BqzYy/lFvJgvDdQ
 eWa6N8S/bj8+sF8kzcBrMNpBqpmK7Dx0ygmotg2ZU0ShaLoWeaFtW5CZvN5MAcNqPVBh
 cAtT4LC9LwZ1LwnlaN82bMO4oED1NIhpdgAHwKY54q90sl5Hl+MlmCxRsAwXN52kxRti
 uJMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTmMS9RsLYI6zaWUH058my2hghz5/IO+BojkPu80UPC96kwkldy52BcilOcYMT0B0ggWr+tS3Nqg==@nongnu.org
X-Gm-Message-State: AOJu0YwjwK88H2Gh9tTt9kVTu/N/tRqo8uJTgt6GVvHOWbxggXAyPzWn
 gIyD9niti/P0PXpsXXavPfFlr+J+lkrqD64tpPOz51nczElAdNg0Kb+OQViy8RI=
X-Gm-Gg: ASbGnctAAn/FVwputzf5FBLNlOLcwSlvIL6BbJyFpdsrU3rzcyuZD64LjrC1E5/Ehl3
 Mm2MVkh94XE7b7Qzbh2qYmnAUVAmXOnStcqc4krhToa1Zt0kKabAkYgmZ3Ibda+702QnIv2P0Nw
 sudRNIS2OnGPY/x+mFU1ZVRe5ra+julgzPccG/GhCfnkOiaetSr41K05ivYU/xHMaBdHlxpDhnH
 jbK7hId4kc/wCJ0dxTKlD5b5IoHmteCHP9GeZ/yXIYyDrvxzo1g8OQHSXj0koyd5s7OAm3Sq8Uu
 sPC6RqDg8v0/SS/+gqbieLqU1bqpzLObT/XHXyibhnpTC4FEcK6VYxYY9w1mQutlPtrG3a+sssc
 NGn1NeP2B3Q==
X-Received: by 2002:a05:6000:1447:b0:391:65c:1b05 with SMTP id
 ffacd0b85a97d-3971bfce005mr14122212f8f.11.1742226360019; 
 Mon, 17 Mar 2025 08:46:00 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975b34sm15472567f8f.55.2025.03.17.08.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:45:59 -0700 (PDT)
Message-ID: <d6cf2bbc-337d-48ae-b28e-cd1fb425cb40@linaro.org>
Date: Mon, 17 Mar 2025 16:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 3/9] target/arm: Handle AArch64 in TYPE_ARM_CPU
 gdb_arch_name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 14swEUfbKASB

On 17/3/25 15:28, Peter Maydell wrote:
> Instead of having the TYPE_AARCH64_CPU subclass set
> CPUClass::gdb_arch_name to a different function, make the
> TYPE_ARM_CPU implementation of the method handle AArch64.
> 
> For the moment we make the "is this AArch64?" function test "is the
> CPU of TYPE_AARCH64_CPU?", so that this produces no behavioural
> change.  When we've moved all the gdbstub related methods across to
> the base class, we will be able to change this to be "does the CPU
> have the ARM_FEATURE_AARCH64 feature?".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 6 ++++++
>   target/arm/cpu.c       | 3 +++
>   target/arm/cpu64.c     | 6 ------
>   3 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

