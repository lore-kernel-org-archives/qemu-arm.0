Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1798218njc;
        Mon, 25 Nov 2024 21:25:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW52qhiyqaQc4Psk/2cShB0r0Cf9/gvKC0ZfynKodNZ/Z6FFolg7RUc81CHYth4d/6/k2f8XIAe15OvIg==@linaro.org
X-Google-Smtp-Source: AGHT+IFLDnt2818mrH+NB8yR4ZIa1LKIjPB8Exl4KnZi9UdUBPhX7E44N7QzPR4R9XLUI9owktk4
X-Received: by 2002:a05:6102:5091:b0:4af:db5:8d11 with SMTP id ada2fe7eead31-4af0db58d84mr9313861137.2.1732598746356;
        Mon, 25 Nov 2024 21:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732598746; cv=none;
        d=google.com; s=arc-20240605;
        b=QfLUihbGm/8j2+qE3Wamom7cMHZyVpuDpORo2aWCVgftSD5Z3FgvT7BxbN3azNfT2G
         9+ZYRS5lHo5R6GsQOJKuwQwHwEq/oa0E8GLcYuu8fVxc2nO8hdO3LwYJAohySH1eD4gg
         U/RDMmcpE2LZSLkAbB2FLOsZpjRbGnclxMzt9gy0tSsljUX2m5mqpf6qdFQdqVpEIqd+
         muOsD3XUlhVZeDzzd6JCtgKOqZ+beCcKJIK/DeaRpS2jCiAwMuToWGbchrmjN/PDdqOm
         dOXcgLiZRlNtMnYdTHpxHdaraHxtDkHcssWWtiQZDhh8I45K1KEte2szk5ptJymVEVwF
         UXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=btxhf/iHeq07QYd1FQs3cogb15E7zMtIyEa6dYcM9dE=;
        fh=HWCxXuOThiDJhI+fy97f35hBGPAGC85o7xDhFYaFOi8=;
        b=MPpl96S7Tubx7GuEFWKpNDKxgK/I4tufD7Sv4bTMaQwMLawiBpf/S4VLZ6P7lyQ1Jn
         i0W2hmKUA/wzSQkD/T7ut8o1s0gGuRdKAAlGxmpYv+8AilpEdpCbTp87l6Aa6ZbB0R+T
         rpWNdRJT7bG0WdneBg1TPdf1H6lRmRA+e2rvhyFPn2ahmX+iihkZc8Nt81b8hVob56n7
         vWf5gawzBjzkxdafTObeBYRBgzn/K32W/dD/D/eRIJRWZdM9rlktpq9A1q4yfmYNmJmw
         WABKdWeCFtAKi3DyO3G2wIiszyGgxsn9gjoI14kNgqb2I7JVm3rhT5vHdUXhvo8BZQPp
         ms+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fG+A1pO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b6ecf7si112494616d6.447.2024.11.25.21.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Nov 2024 21:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fG+A1pO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFo4Q-0007Rj-Cc; Tue, 26 Nov 2024 00:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFo4O-0007Qp-Rr
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 00:25:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFo4N-0004ec-4I
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 00:25:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso48172585e9.0
 for <qemu-arm@nongnu.org>; Mon, 25 Nov 2024 21:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732598701; x=1733203501; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=btxhf/iHeq07QYd1FQs3cogb15E7zMtIyEa6dYcM9dE=;
 b=fG+A1pO0u+4Fo2usxKOCG8E7eY7cK01f8jTyj9U5tRuHNKnPoNoZjSBKXK5+ZMVfOJ
 RrRrDYoUj6+a+/r74gr0Md/cUtYSVyWQcmZ30kMQEbTBriY1B+9yI6Y4LO9U/BYBEUSs
 R/+xelEN4CQPUesoyvpNIjAFvTqODYKGYpSsxIrWKEMxnFlVn2Slx9oHsxUdyS/GamC9
 07xYijODz78MeWlzOqm7J05oStgHDM760oyfv1kWbbJACzro6cGWfqNBuVLgQONJklcs
 aYoJC82TSkZ09HBOFwXSkdy/qGjmQ7DpTiGb6POhRCK9odBL9ycrhH9HsAUw9LLvvOsI
 5dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732598701; x=1733203501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=btxhf/iHeq07QYd1FQs3cogb15E7zMtIyEa6dYcM9dE=;
 b=cBKHEN1hSHNrzpTIq1khoUprzVY9dlehbTBn3AVc8b0vIGrDHcHnzIHUBOwt4dGiJT
 FaBsZoGg4tVkps08l+yD+R9C7cG+uazMRkWhhpVkUUACR/KxM8BIqIXM0Wh27QdfJN2H
 jv9rj/v6WJmQSRlFn9YUxs1vGSzuyS93HAG91KgTEbuxbd05eDr6uVPQ6ZPwKcipm7c1
 t3CD5/UYU7Mg44g0jquKS8NPrhNnuHy85Btf9g3zxFmApaFKkEYuiV2/N5ZmqqVMobHG
 HKTSK0pkhCw4/r1qeuLbTHnS+pdgPpwQF5129qXY9vnIjpgvFZGH23xQ+xBigLtJvO/w
 5GaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+2vqT2GIpbjM60drpGX1IXt6Bv2H1CwNiN8jFtAHdq/qvHHuMdhanxq3Cr6aAQmjAYte9/As0Vg==@nongnu.org
X-Gm-Message-State: AOJu0YwbctvZQfbq0to2rZNrnDyclcJN0PvX1Rn969SmCS06Koxag5+h
 agon+3ozI4dkfEpedjJpla8bepIwBN3nTRTsvxoh6dTZAhvDJgQOL2HGjCu6ZnQ=
X-Gm-Gg: ASbGncuND2BVfKzNuIXlqqzbFXUa5BTnOMhQWry1iEb9qGe9f1ezXsTQSuQWqICqKYv
 ZQGYr04/PpBeeAsp/l1Kvq6cyGrZXLcZS9SnfzQ4jWO1obOhRr7NT0qdG39xdsXSoQT/9wPYJlP
 H4Ru/NPp5eyqc6375OT5kqoi7puFHnKa4lmH0PLCuwBMBVaA4gmXH/I64jHPWCxXDZflWZ431r2
 mdzleQJ0TdOoRK6MCFS444rphrBXxW3aYFedhPonUZtRuOBLCTJJgqt8kmxV8M5GA==
X-Received: by 2002:a7b:c04f:0:b0:434:882c:f746 with SMTP id
 5b1f17b1804b1-434882cf8a2mr133453215e9.17.1732598701431; 
 Mon, 25 Nov 2024 21:25:01 -0800 (PST)
Received: from [192.168.69.146] ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434a0c889c5sm45564475e9.2.2024.11.25.21.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 21:25:00 -0800 (PST)
Message-ID: <219be312-4acc-46c9-8a56-16e5cb483ae4@linaro.org>
Date: Tue, 26 Nov 2024 06:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 0/3] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125181420.24424-1-philmd@linaro.org>
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
X-TUID: Z4vfvZXJbRzy

On 25/11/24 19:14, Philippe Mathieu-Daudé wrote:
> Invert MachineClass 'no_sdcard' flag logic and rename it
> to 'create_default_sdcard_drive' to make sense of this
> default value applied to all machines. No logical change
> intended.
> 
> Philippe Mathieu-Daudé (3):
>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>    hw/boards: Rename no_sdcard -> create_default_sdcard_drive

I expect next steps to be:

  - Remove nonsense create_default_sdcard_drive (where
    machines don't have SDHCI devices)
  - When drive uses IF_SD, assert machine expose a SDBus
  - Explicitly create default drives for SDCards in
    each machine_init?
  - Remove MachineClass::create_default_sdcard_drive field
    and code handling default in system/vl.c
