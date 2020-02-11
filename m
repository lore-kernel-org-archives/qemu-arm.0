Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5409600lfp;
        Tue, 11 Feb 2020 10:35:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxfl5PipdjssB8UW32PYpBLCmKLN/Mp+WEnMK9lXxn/ZwzQnybSqdXgI2gpLZB/3bhulUKr
X-Received: by 2002:a05:620a:1415:: with SMTP id d21mr7227965qkj.17.1581446140699;
        Tue, 11 Feb 2020 10:35:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581446140; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlaxO1Ggqb7YrIgBNyXNT2xhSgBdY2tig98jLiK3sM1qnG6ijAFhYVBwMIktoD6KUU
         VYZCxZtFUeNaMWJePdDmXq2GSRKVtd9Av7xT0K3cZlUo1OajWEJzl4ImezjQ8R+S0oHm
         /3hyVAlmB7F+D5+b1b3kYWwsa1j9dQKZyabfT4cGdlg1L5gVIQp4bpzyYw8RX/pjg2Xp
         XiCkg+8QfrtINAc1kUasTGFOKMMK+T88ys/V75twjSBVQT4sm5uzUJzGm/Og2rJWD7Qx
         fM05mS2+oK5UDzX/qJv/j5EuLryBOffubAv3KcMpuqEej5909u9ErvMi4gQwFk+x9W2o
         QJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dD9Gwl0YviawrYH50yAj2nFcWE0R1gSfyvKEaJotWtg=;
        b=v4bNHHjS2MamILchWXFb3TRIFLQ1tCvtaRFrMMJcrOLgVVOarSn3SkO8Eh9m49DCNI
         PRA6LWvyw4EU1fEiJRxTihSHVJqOa9VqGpB5aVZ4kr2e4FJJpPMZvErwyKUiIwCxUuyG
         v+uffaU6zbuVsn7WNUdkdrNWxfKBqphYAxZ7ACFeVkWfPiG+ElUsPPwxetW30BAHg/4i
         OjwyO2uU/4qBxe7M3toRkFl10MQWb1SpFoQ8T0ZX1VGt0Nc7ooX0dsKnFUe/6kPKmei3
         voALIq8FVblE6uAN7ytFUGlaY2Q7Io9FnFAeYq3UpmDBiB/BkSOjxVdyGBAOEEgb5a8F
         OO0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhBwl2Nm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si2279568qtb.130.2020.02.11.10.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:35:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vhBwl2Nm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aNo-0005Yt-5o
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aMN-00047C-H2
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:34:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aMM-00072l-FQ
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:34:11 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aMM-00070I-8I
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:34:10 -0500
Received: by mail-pf1-x444.google.com with SMTP id 4so5893862pfz.9
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dD9Gwl0YviawrYH50yAj2nFcWE0R1gSfyvKEaJotWtg=;
 b=vhBwl2NmTXULuDQPL8cDwcK4DWd+mTOC8TJKpwBLb/hzFaSHrnYEzEEISmMxeA5vEN
 BleCTcc1y7SQMHAjSw3XhAl7kgdKha7vEl0RlQaNKgOvFO79D5W8uCNfxIds0KAN80W0
 UCS5PKyjmlG3XPLSu5wilDDsLDh1xw/iuQWF3FOxhBzCHpKrYRMUSDoy+WKItjAJyILt
 soFT3qZFDl6RoS5g8o3dqog/zHfZifFzllbU9R7JZXq/+ZnCfZ5wHDmFXoQb9FOs/z9N
 slBviXW3t9O4A7LVQ1ZVFTzgQ8Zk9kY2IqsZZCSFm3p3qJ65YJ0e1gCxDJ2id3fNz6XA
 +HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dD9Gwl0YviawrYH50yAj2nFcWE0R1gSfyvKEaJotWtg=;
 b=Cbu/zAJmJKaMkHu55kcPGq8DMEcc+h0tzjP7KUXDX6oIbfo6Iaifd3Co+0GSc0xpIw
 KSrsku8cPmTeh1zOV+AqaHeR10AcYDLlBRIZipzJOLJ50b+W+jG6RbMUpfbrr5DdB1IZ
 1zmiPolnr7qw1F927QtwfM/7BlYhrG/nSJa85TvhajjMAt+Z92QRPkfDxuyCAA8NJO2B
 wsGYVLuCZMcrLPrpvWZPkwLPNbnxMqpYSYFFf+LC2Z/80nfxgUHCDw6liCuPttpsV+FP
 mIN6FzXZJUwlfAJ7Q5VTtWbSbafr4QHqhedMtfZTtevpoILOk0XWIBnuVWMc5XtjRBB3
 YR5Q==
X-Gm-Message-State: APjAAAVMec9GfR2l8V4zUDzotlgAuPTnBe3ldrJY/XavM0s8VKh/u5mY
 F3/W7XecNNGgeUpQjD4f3ubdtw==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr4336216pgj.341.1581446049050; 
 Tue, 11 Feb 2020 10:34:09 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 l8sm3998719pjy.24.2020.02.11.10.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:34:08 -0800 (PST)
Subject: Re: [PATCH 05/13] target/arm: Add and use FIELD definitions for
 ID_AA64DFR0_EL1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a75d967-513d-93ef-b983-b8a35f78c2bf@linaro.org>
Date: Tue, 11 Feb 2020 10:34:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7n6SCjBoXFAy

On 2/11/20 9:37 AM, Peter Maydell wrote:
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        assert(extract32(cpu->id_aa64dfr0, 12, 4) == brps);
> -        assert(extract32(cpu->id_aa64dfr0, 20, 4) == wrps);
> -        assert(extract32(cpu->id_aa64dfr0, 28, 4) == ctx_cmps);
> +        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, BRPS) == brps);
> +        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, WRPS) == wrps);
> +        assert(FIELD_EX32(cpu->id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) == ctx_cmps);

Should really be FIELD_EX64.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


