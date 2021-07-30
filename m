Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp500429lff;
        Fri, 30 Jul 2021 12:16:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3oiZRpbWXI8MbXZ9P9KBkfW7+yRAapXUZqw9iQi0tTI+MG0Rlg8BewYX804Js2KvSKvkn
X-Received: by 2002:a25:31c5:: with SMTP id x188mr5304642ybx.291.1627672577963;
        Fri, 30 Jul 2021 12:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627672577; cv=none;
        d=google.com; s=arc-20160816;
        b=eDSyLGNZY9HM4BHu/vmOVdIg+0GFJ2R9YgdbdyS1uIHRgAYH/4L50OVqnWzVuNeWBP
         D0Dk4A9WtneV9FL7MafH1PBg+DTgqXnJ9sUj8ncVHafwgs0f7xpF5OvmwbqFUuxeJ8b4
         QoDZlerUulEt6fHC7CQv374kFfpZu8R9pFeR/UsFDvTvR1L/qhjfBUHz7dHzXBMj3R2B
         UnmM3KxYUoFqRFL8UpYZEhMrUucbfv+hEQqk0rJIOsZR2DM+TLBkOPNweNVEZZUlnmcc
         OuGyiWVc1nfPYx8keQwOyJvihC5Aaqj0F0A2Txhtr2Z3Dk3CB+MrBMymNoGzwKHRNk5J
         lZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JV8yz0eqDwaW8rrQiT3s5iXTmjrE6YlqX5p/ZNQap8s=;
        b=t7zAh8/8LZWeJWFFcnOXMauiwuFygs+HTNkgFYhD1Kt6h9l4zUwhgHqLlz2zvPnufZ
         SVXmtBt8uj0cVoiY74/M1Y2NW/MTyj9yt2jK7iUWvTNMHdFwElaXYI/+UMhJy/EVEHFA
         YxVz6qGQaBoh4KB6bDl4/+Ni20rSOfCeEYZwaXWO/l22pVIbMW8+JIUBIyjMBZ7Dajz/
         xN4E/BvSUHt5Q2NfUJ7s8oCSc0jumpbgmgLf6llYJCXZ+wWYa1vBBiLCDg3g2RWfVWTq
         Y9tUmU+b2jzIFx1MCjskijsFCse5WUbWm/+a1RZlF7kZvRd+mg4UjzqFRiXzQbtAnsyl
         LdPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fO+6tt2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si2851888ybd.117.2021.07.30.12.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fO+6tt2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9XzV-0003Cm-8Y
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XzA-00039w-RV
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:16:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xz8-0000Z0-Rk
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:15:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so22178678pjm.4
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JV8yz0eqDwaW8rrQiT3s5iXTmjrE6YlqX5p/ZNQap8s=;
 b=fO+6tt2DjCz4WAuPnG1ZyLwQIqsH/55NTr2U/Z5HzQA5xtpVmDUlNC76uiFKyqg0tX
 f10N5R4hApL1PqYchULteJdi+cO0EgEMXTzwlzIUWi6DL/3S+94MDrWNUGJMVJKaTpLq
 Mk4zc3Y1Ie5iWfQxJMHYQvj23BwUqpuH3AmgN6BYnMdvGFraWT/Z05ED/B8M7XOFcf9M
 1Xp7PXsORDeXEiF7GQcCVlGi1gTahSFU1YZPSWGVzejBHvq8YhJC3oXVaikG9OsECFYA
 AqGybZCLupft92J4ViyDpjuXtbcap9pj/gBXvWNUeOV+yuNAk+g5v7RyhvofnbRVpIxn
 hBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JV8yz0eqDwaW8rrQiT3s5iXTmjrE6YlqX5p/ZNQap8s=;
 b=ChWHHLebjkLW02ONW+iN3MQgT8WOuu5ISAyLri+eaD7H0Rlyvo7v4rgUip9dOsiBMe
 pm+PybgZzd++msQccNPyZ3p/Tt93l6Rd1Uzdtw70UMrTuXPIafdFvS1juzvhZmjLmSDm
 jJbdgWv0Zdq3V+nebXQbZ0qRa5edvdC2tNgdArdXw+eMo45piUYbpsb9RbQj3ik+ENDU
 rb1HbLDQQdc1DZIxOa7Ip2NSJAftUfSE6kzAhUrrc+lZBVVBMSNcm+DkQObvTg0RcD+K
 y9vW8LSvRusvPy6jZ9FSmJenY7IYhwtZXJqxoVGT5vkhwJiBNMYK8SXfn/sLC+4XoLul
 A5rg==
X-Gm-Message-State: AOAM532gwN3ScuhrLs3nVN1lBPhRy56aHOHRyv6SkZcZPyzNZEXCa152
 h4DeX3pHl0nC8r9IMgBgppuM0g==
X-Received: by 2002:aa7:88d4:0:b029:329:be20:a5c with SMTP id
 k20-20020aa788d40000b0290329be200a5cmr4104492pff.61.1627672553423; 
 Fri, 30 Jul 2021 12:15:53 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id b128sm3370288pfb.144.2021.07.30.12.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:15:53 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/53] target/arm: Implement MVE integer min/max
 across vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5705e9ea-249e-1949-fd93-77fe4e5cf95f@linaro.org>
Date: Fri, 30 Jul 2021 09:15:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QR8eNVaDdQFL

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE integer min/max across vector insns
> VMAXV, VMINV, VMAXAV and VMINAV, which find the maximum
> from the vector elements and a general purpose register,
> and store the maximum back into the general purpose
> register.
> 
> These insns overlap with VRMLALDAVH (they use what would
> be RdaHi=0b110).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Changes v1->v2: Drop the harmless but unnecessary
> "take abs value of 'n'" part of do_maxa() and do_mina()
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
