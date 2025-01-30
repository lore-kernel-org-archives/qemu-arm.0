Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp68664njb;
        Thu, 30 Jan 2025 14:30:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6zxewMeRNwZrcRgKXY8seLdx1s6pIHbI/MV/SiwsArPXu3+SICkjFg4WG5uA+V93EHx7MEoI5KcNeYA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/1sN80SR0xb7zqHuhip9NGPKPB84DmL97y/3TCkOKEgzo9iaZsOJDOIpmSr5bazO11GXI
X-Received: by 2002:ad4:4ee3:0:b0:6e1:85d5:9748 with SMTP id 6a1803df08f44-6e243c1883fmr151233676d6.18.1738276227142;
        Thu, 30 Jan 2025 14:30:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738276227; cv=none;
        d=google.com; s=arc-20240605;
        b=C8mXV1GrNI2M/qrMYFaKRXLBS1KASJ0cxlLh4DpQiCUhWuql4ALcG020OWUHfiOC1m
         7LlkQ2qT1lVFV8myao4SY/OVg1NO4X37vCbIdOrrJg9ZOWkT8hwEG/QFs1P2G5E5T/qq
         2hGENuhRlCR37uluDNjfBjOpksVPGUV7nWRBqfTuBVnE9YgQ4IN/uLbPtUpcCNQriQKv
         SrdHMlS3KE4o44VVJPuOTD1YjhC2xcFtzXhG0livEf82YgBLhJBikDONgDaTGDqiE1ik
         yjeGiGi0P2yvqIjZiUiOt6w4CCIdEX7we3xdkzlV5Um83ZZW+ienR9B3zc7rfflSJgnV
         u4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CKEuFidLzY2Y9YChEbBVYYZfHQNghpZNjDmL3Z0hS3w=;
        fh=T4Ft8elbqHpGv3sBHf+IMDTXT72FV8S50ELYbpn7lkI=;
        b=HOq6VJFrCYopRDjMhIiBHTURTPu1EyvYXefPXGsURSNhdd3JfCKsezCyLG9zJln8ip
         ItvyejQy2W4+jJgL51l8F45lzfxB+hlOSw4NagbQ0b62C3qqJSuRY4lQMC5h2aR/BE/a
         APqJNOL9esSIpU6YfFFbIHP99CpRtlm3syS5xD/z2CzT2ipu5mqULKvXN/rY8B7KZETP
         HVRMa4yk5I3Z7MAM52WS4qXevReFNOO6NhSc9a3og1H6D1hMWfDG2+65ckCsLnYFi0nZ
         Zpssi0id++Fvi/azKDdGZAi8cr7gziPVhIFdj60n/llFa2S3iopJLZ8VOOdoP+auasaA
         7RBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z0YEMsDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e25481129fsi21831196d6.63.2025.01.30.14.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:30:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z0YEMsDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdd3E-0000ud-Sc; Thu, 30 Jan 2025 17:30:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdd38-0000qz-38
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:30:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdd35-0002pK-Cn
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:30:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3863494591bso759178f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738276209; x=1738881009; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CKEuFidLzY2Y9YChEbBVYYZfHQNghpZNjDmL3Z0hS3w=;
 b=z0YEMsDf81VJBlLGuxqcY7g1Mp0OdkgGlYAn9F8P+Hq4u3gFYTUfE51oKW9Mk6B5+o
 KRLFj+H7jY+XtKhGmt7tPviEnmnEwzncKP5bMSBDX7ZhLdOc50eAc9CElFk7elFy8nNY
 eqeoYpVZwtJTTe2Xz937Ad6y0QahlVOpguEPEADIBcqMkCMyI2v8bcXlI8tfO6twSJVt
 EL6lH9S8OVSivZ3djtY/JWmYqmaE8cEDrx3R7cED5tpw06onPYlAfTlP3MIQz3EJpFdW
 jeIgxZN7lG2m0YXlMoF5jJspXQsqo6EqQMZ+pjDZHIfcRtLIw+PYkxswROmLkXGslST7
 gKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738276209; x=1738881009;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CKEuFidLzY2Y9YChEbBVYYZfHQNghpZNjDmL3Z0hS3w=;
 b=Gnrik3f8RkBoNTskvHKkerRTsUpaDJAKTk4r+eOiNxyo2GZotiyVNVvo/DxRVIu5Na
 fVKTRP+95hXtNFb663qHW6/oYEZ9AKrzRfUVi1R8nrqXAyw2ywUa40px0nvdyY3hCPJl
 8xmkWKIsUT1K+c/Bh+FV0wM5RBBoET+hkNio8BfZhKcqkTGXB1AdY4bTUSbBM8dSHC6M
 u78rLiMQ1ZYaF/64E2wBZpyJkd59JiWav0VxJffaDBafrIev1S85BN/2SLhGzoEszlze
 29Z73P1zkmL+WeNxQLdCJi2fo5N8eWjisISxRfOR6jC7E2+L94M1b95LusjO8PTcmP09
 o7ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTxVzzn7CXU28RVbmiFtloAYk1iR+bys+KQM+Of/J296TxHgEOLRBc4UGlhfI4KGTA9VX6GLKf+w==@nongnu.org
X-Gm-Message-State: AOJu0YzPC5YMOE1Gb+SK9Z5GjF/fYesKfiszX7l3jJ9J+4AEcHNKwCmI
 +syGrxxgiykHgt/8IiQj02vpcXhGdVKCiKp1TJ1GYhpHtSC2UKM04hcFjxaf2tU=
X-Gm-Gg: ASbGncsJz/8YZZg6gSqLSQjUFXtnUTCYsS+l19lQdiPNu2sp21l4sI4D4IPmDl5Er6V
 AOVhuJDkCPL6ghxzh0uQgKRSNd3t9t8QutlhcM74J2we+OxrJgU6urWSTtjS8aiNZug0kDsdaB0
 Q1/vN4ReTiZqXKveXVN05G6CuzCgj/UBbixkJ4eVAYG3busDGtOF+HkZpwdWVjumzL63/TBaT8Z
 TPvoN46YE5uR0q9sOFmULan8cD0UufVObJckm3zqVtarl8IUCw7ennb6LTNkVVbGqq0pTITWxqU
 /8Dyom/ogriXIY8yBtSR4fNlwfXNXST5K6IO1oWo7Jmv5LejjQ2d9erfKl4=
X-Received: by 2002:a05:6000:188d:b0:38a:4184:1529 with SMTP id
 ffacd0b85a97d-38c5195e5cfmr7096733f8f.12.1738276209086; 
 Thu, 30 Jan 2025 14:30:09 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244f38esm36766315e9.26.2025.01.30.14.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:30:08 -0800 (PST)
Message-ID: <e4a1974a-4966-44d6-b4fc-0d0167b46944@linaro.org>
Date: Thu, 30 Jan 2025 23:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hw/sd/omap_mmc: Do a minimal conversion to QDev
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: r4KXu2jsR8gt

On 28/1/25 11:45, Peter Maydell wrote:
> Do a minimal conversion of the omap_mmc device model to QDev.
> 
> In this commit we do the bare minimum to produce a working device:
>   * add the SysBusDevice parent_obj and the usual type boilerplate
>   * omap_mmc_init() now returns a DeviceState*
>   * reset is handled by sysbus reset, so the SoC reset function
>     doesn't need to call omap_mmc_reset() any more
>   * code that should obviously be in init/realize is moved there
>     from omap_mmc_init()
> 
> We leave various pieces of cleanup to later commits:
>   * rationalizing 'struct omap_mmc_s *' to 'OMAPMMCState *'
>   * using gpio lines rather than having omap_mmc_init() directly
>     set s->irq, s->dma
>   * switching away from the legacy SD API and instead having
>     the SD card plugged into a bus
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h | 15 ++++----
>   hw/arm/omap1.c        |  1 -
>   hw/sd/omap_mmc.c      | 83 +++++++++++++++++++++++++++++++++++--------
>   3 files changed, 76 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

