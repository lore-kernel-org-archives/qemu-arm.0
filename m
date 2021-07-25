Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2246158lfc;
        Sun, 25 Jul 2021 11:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVVaaIhN29M3xvcL8Fv7EyM0IkY6SkY5QwYZmUDF7ZP/dCzyP7vAjC6Z8UWI6CAh0x1oWZ
X-Received: by 2002:a05:6e02:1d0f:: with SMTP id i15mr9685743ila.199.1627237057393;
        Sun, 25 Jul 2021 11:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627237057; cv=none;
        d=google.com; s=arc-20160816;
        b=uRARCkyWICEupZvVr77rBtVlv3XYFHzOwzEG3OpavIk26qDFrhq/sXZuttlwelaqh+
         dujR3qUid5/SaEliwSV7r7aFa4/KpZ1MhwuYlaFGmM5ZN15HF1o7puyP7lhVcUN0XGLp
         CtTzNvUa46fHeuKNKhS80l7rW5C7xX8dRPcPV17uvq6S63LizbaxtdftgizXBPfQgkfg
         5JH2cuJr7jIW3StolUeYYQWkLuABwxTiOTLaio8ktl0ZG3PkKwyJ7iBaq4/1Wk0+jeqa
         mu6W7XqUKxcDfE5T6+NjfiggC2QcJ8I3jCOJraRTMTMKXwwFiOsAKjXUnsH3Bp4f+bKx
         YOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=T0rXdxYYGfrICfq2Vs2XvjqztMZXQxCus06EsOgZ6x8=;
        b=O+ptUBCg9dC+mfz0mW8k2g45fF0qfR9ld4KxiEs8uX9De8MpFGCu4q5xxt1wDCHGe7
         pLpgwHCbb/L/jwMApKwKusYrOCprbSIntGyLoet6GPQhjwxY0syl4eHe709cJkSHdqbJ
         a2I0x3ETrXmpmNu2oQFeEgb2RkOVRC4t10csJUe2Yh3pZ/gqy9rRC7AQUIoeZ6R3sZ46
         3O6qxThJGnOqZ+tYrgSengkRhofxaH9ehChtV8ehFFcZs6dye9IJWWv9klyc2+veHoOa
         i2IkJUlynDCGx5iQPSOJRC2IGyh6/yBkIAnkbvUpy12dc2/Nb7wnzItv3jO7HtLDxVpG
         LDUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QpwX/jF5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si42337889ile.109.2021.07.25.11.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Jul 2021 11:17:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QpwX/jF5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7igy-0005fK-NL
	for alex.bennee@linaro.org; Sun, 25 Jul 2021 14:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ifm-00046f-J1
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:16:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7ifj-0002Xr-Mk
 for qemu-arm@nongnu.org; Sun, 25 Jul 2021 14:16:22 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p5-20020a17090a8685b029015d1a9a6f1aso11021697pjn.1
 for <qemu-arm@nongnu.org>; Sun, 25 Jul 2021 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=T0rXdxYYGfrICfq2Vs2XvjqztMZXQxCus06EsOgZ6x8=;
 b=QpwX/jF5Dohfk8jht0UmVIuUTZR7hyIQrfXDmDG/JSwI7KHvld0dFFH/x+aDoN/o7M
 kbQEF0M2Mv7Mlmm3PrueaKMJjF4ZhusBS/6RGHLtvNrdSLXdkWdWBTa/3gaGPdaH9cbn
 c4H5oPjIlKqcOvBf9gAXnIjxepmtI4flGDIU/quhnnlfEZTmMcwyg4CZasl+tcBbxI+S
 b7+Ara+yJW/KoUJ1zgC1YhA1XTjbGl7w3KPROuHUaZd+WUy0NXQOERHqkmgl5uXyFQYk
 WdY87VGAjIkKx5x4w4RZff6w0r9a203yoYTVWMwTlzJ+AtUqty1q869/+IPqz6N3fb55
 +vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T0rXdxYYGfrICfq2Vs2XvjqztMZXQxCus06EsOgZ6x8=;
 b=iRz+Dw7lVYY1kJA1u+9qCJvMr2hT2+ah0bnwHx6f6uZjX62f+AKMx3CUzyXKat5wX0
 3MMZ6dmfYSGLDFZaFU/2q89teOE/Fep5uulf68xfmsiCB3jNuUu4XlVCXlJHn5R2jWcl
 Nuwy0x5176PLfHEVMydZm01zlyfRsn/YvDdAU9QfHDWCev+tfV6Z08uWzVrhPH/78gOx
 Du/nrv0XTFdwjxBm88TIh1zijEa/IuY6krZSW6pPx5XC6Jhyqod6GFXq+dXdTgB6xWlr
 vHD4qimU571W+oh/jOlSm76SFnapODii2wfG4bvGt9cVhYDa+sQomK2uaSajMSQinOTp
 PfZQ==
X-Gm-Message-State: AOAM532JgGCTYL51eeKk2U9+cmK2/v4/58W9qoQNNVZ+PfuSccng9DXf
 NZ9ib3xRlpNLtNmlnvt8CyzUyA==
X-Received: by 2002:aa7:8284:0:b029:312:1c62:cc0f with SMTP id
 s4-20020aa782840000b02903121c62cc0fmr14584730pfm.75.1627236978397; 
 Sun, 25 Jul 2021 11:16:18 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id h20sm41200296pfn.173.2021.07.25.11.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:16:18 -0700 (PDT)
Subject: Re: [PATCH for-6.1 3/6] target/arm: Report M-profile alignment faults
 correctly to the guest
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8fa3d4f-1521-6090-3052-62760ea12047@linaro.org>
Date: Sun, 25 Jul 2021 08:16:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBc60wt527L9

On 7/23/21 6:21 AM, Peter Maydell wrote:
> For M-profile, we weren't reporting alignment faults triggered by the
> generic TCG code correctly to the guest.  These get passed into
> arm_v7m_cpu_do_interrupt() as an EXCP_DATA_ABORT with an A-profile
> style exception.fsr value of 1.  We didn't check for this, and so
> they fell through into the default of "assume this is an MPU fault"
> and were reported to the guest as a data access violation MPU fault.
> 
> Report these alignment faults as UsageFaults which set the UNALIGNED
> bit in the UFSR.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The other approach would be to have arm_cpu_do_unaligned_access()
> raise the EXCP_UNALIGNED which we already use for Unaligned
> UsageFaults which are raised by m-profile specific helper code,
> but I think this way is in line with the current design that
> generally prefers to report exception information in an A-profile
> format and then re-arrange that into the M-profile information
> in arm_v7m_cpu_do_interrupt().
> ---
>   target/arm/m_helper.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
