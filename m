Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp1614088njb;
        Thu, 9 Jan 2025 07:31:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2TniqMpHBuxcCHSkYr868MxOQ4REn3YM52OE6zmFCRj6SNAQb/4X7SzTcchHEb662fIAlx92ukF1wJg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+F0FfxPYqUT6iS00H5LoKahAlTlGNJ8pgTKD3UiJ1WqbzeRLbqgtTVH0p+/DyfMHSgSli
X-Received: by 2002:a05:620a:244a:b0:7b6:d4a2:f11f with SMTP id af79cd13be357-7bcd961c451mr499309685a.0.1736436713347;
        Thu, 09 Jan 2025 07:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736436713; cv=none;
        d=google.com; s=arc-20240605;
        b=jxvTAijAawoaBLfLsPX/eIZuCC5Uf4VL9T1D+qhaN0c1RWkTH4Px6UMdKRw4m84kFk
         vOMsKX9/MTpfUcjA1Z6hQZ/zmEyMjlOSao65/wLCscPSFO44nVmfRCkxGzbjOaUgaKn2
         DvdbVgO0/mYM0JFo9zKSlvEDwMgpHecqeOxfN/gxXkyxLzpKELBPTK/iKJH629ynXTf5
         GPRaZYT8hPzJ5QaUIrlN4oQblfChO/VCcCuAmfXTQenEFcw7G5pJr1S+zBgyvrDkebJx
         hOMWn6k2NsnhUx7EPFkbNbG0sls6amRZEBsh6gC3Mr9UBo+VJ6B2nOzOGcnIRL0Z4RHM
         mNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nW4x61t1mONYUIA4UDDFEPjhQRH+aineX/QSDvpB/uA=;
        fh=kgIFcXxu2H9HqWoQ8F5/VCTHrTpZpDsA2jkVnbKATAw=;
        b=PVd51k+/s9c8JJazHYL5feD1kJHQSJcZLpFgtQmcDoyALQmsc31/u9At3B4cZ74W8s
         yi36mDMRlvPF7bS6tFg4osVbnzXQxR+pUgGg9RfrvpU4B37fkAGCXm60tKU77IwVEoMq
         5xq72YOB9jsJD9iWfnEbomnCHkHiztxT1KERKvDE5R9TorJTNCojifWrtZ95KEJZcmAZ
         vaXXvt7enPLCu25zpA1bcZ3OrjVHHu0PAKqFHcYvyiiVmKmmGGCw4qLl9B1am3wOg0pn
         u6ZfJEjqzeqaowdWasqQSDxykzx1nwx83/Zp79CFdmklguaEcA7AcGZryLyHAFK0410D
         ssFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzGadzS5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b608ff8dbesi509333137.202.2025.01.09.07.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 07:31:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NzGadzS5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVuVP-0001rm-K3; Thu, 09 Jan 2025 10:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVuVJ-0001qv-Np
 for qemu-devel@nongnu.org; Thu, 09 Jan 2025 10:31:25 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVuVI-0007aU-6h
 for qemu-devel@nongnu.org; Thu, 09 Jan 2025 10:31:25 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso606015f8f.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2025 07:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736436682; x=1737041482; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nW4x61t1mONYUIA4UDDFEPjhQRH+aineX/QSDvpB/uA=;
 b=NzGadzS5Ol3AJ9Qv+dM/e/cCKukme55R5Uqc2yViUIimj43T4u1rB7X3k2W5egsftk
 sOR0Bevyov1PuqFhHOO1s3lbf8/WxcvU48ZrlOuZUkagxsDxwuVWPgXZnjAX46Fq07pP
 knze5JLP3kao1zEKC33PfnQi8PV9hnSREPafHr+HtM3rqXxrw/0A1gOJ4s/iC4t+NKbr
 4Vv4luY5GUqxs77NFysLDXBAXr90IV4tL2MJvAdTpYBas0AJlK1bE29CJyloSObo5rBG
 m6SNawbzuAKg2Vb3hFgM71RMpVHX9NDBSRyVzMMby9OLyHEE/b2f6tnIvtjVTT0tnmv/
 BrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736436682; x=1737041482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nW4x61t1mONYUIA4UDDFEPjhQRH+aineX/QSDvpB/uA=;
 b=Az8cIm3+o008/U0vY4ZyCt7VX/q3zDElOl4bm8i9OjOI0dkjd7QEy56wVi+rEJw9Ut
 mIRpVwjMlmhK+wyZMOrYZynYZ5FJ2Avcdzhm+zlkVtIYu4PVgjgt2lqiNDFBorYQ0onw
 I7D64RaReO0SVgvppPnH3lxvOTd+7gqUZRlc7o47iOWAPm6HEMPtBRoaEWtZ8AlKfvay
 HCWQZvlChFMVsPRM7ruqvlNnBFR3PTU/sQdTMWCkiaZMoIu6pAXeTKCya+U+jWIUkX/1
 OthOPN8qnj4qc1ccvFRf1Z5GKix9MAiyngwv5p+QBhG5AssGfoP2/6w/wQ4IybzO2R88
 8ZfQ==
X-Gm-Message-State: AOJu0YwF9aBLsXGVTIYnD1lAEnBQYpZHbjRBtehnnMCF71XLyqcRwXF3
 +4U4BggM5S+taAHA1nn72qL2/E5se1p5rAgmVjYHZEx1aZKPIlxin06oDMHZnGVU9NkEoEXZe4j
 n/3Y=
X-Gm-Gg: ASbGncvdimstivPtoWf24OmG+zPm3gM/Y5/MOo9skjgCK4PE5CjSynJSNN0hs4fWJAU
 qat16UglfFv1S8E79WzMSjCvpsGNhzZxZrjpUXOGt8MDitqVGGHciBVIv1z5BMFLnHvorVkefJX
 JqqGR7O7krlveqIZhhxK0t7BeQtupX+gMoVcFzgjHoMsh+njLwPJ6LrrE0PQCoMo9Ewre7/R35w
 bj4iZziysrrHr3FV9qKGBz7NUKelZmg4DJ7CoHHUHOQ7Wy0gKKQqPq7bmvTvyMQ8X6p+P5wqIEz
 0EFfRpiSGGYoHBi/3HVAlEFdgzo=
X-Received: by 2002:a05:6000:712:b0:385:f3fb:46aa with SMTP id
 ffacd0b85a97d-38a87308c15mr7456912f8f.43.1736436682118; 
 Thu, 09 Jan 2025 07:31:22 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d11csm2132056f8f.16.2025.01.09.07.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:31:21 -0800 (PST)
Message-ID: <866add94-3bd1-4a52-848a-311ab3c05809@linaro.org>
Date: Thu, 9 Jan 2025 16:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] cpus: Avoid re-initializing fields cleared in
 cpu_common_reset_hold()
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Stafford Horne <shorne@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-ppc@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241230153929.87137-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241230153929.87137-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: sHPBHpLYKOd9

On 30/12/24 16:39, Philippe Mathieu-Daudé wrote:
> Having this call tree:
> 
>    cpu_reset()
>    -> device_cold_reset()
>       -> DeviceClass::reset()
>          -> target_cpu_reset()
>             -> ResettablePhases::hold()
>                -> CPUClass::phases::hold()
>                   -> cpu_common_reset_hold()
> 
> If we call cpu_reset(), common fields will be reset in
> cpu_common_reset_hold(), we don't need to manually do it.
> 
> Remove the pointless re-assignments on CPUState.
Ping for patches 2 & 3?
