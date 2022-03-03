Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1056881lfo;
        Thu, 3 Mar 2022 13:45:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVjTfr5ZDECjN9OcQ2tcmlRKuQXPMZzZYB4OJU06vAsdC9cwRuBg0n5uBHA/ui4vvS3tUv
X-Received: by 2002:a0d:ec50:0:b0:2dc:1984:5eec with SMTP id r16-20020a0dec50000000b002dc19845eecmr8843303ywn.511.1646343907219;
        Thu, 03 Mar 2022 13:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646343907; cv=none;
        d=google.com; s=arc-20160816;
        b=Lc2mVEF7YPmjwzPGFQhLqQTlZDxLTeDkQZvAp0lyzd4HqBoXFsd9aOOEA4AhyWS07r
         /bx36bw21YZQchDn1eIgj4rfSZIimIKb3p5X3VP/OXMYU0SLVCG4jf6Z94fFxtPMEoTH
         XhFUPb+MONN3q/KfYq9W5g2qz+KWMemg0YzPlUOEecpgwY/yV5YpVOLhZABpMfoGhZxl
         nCqZh5P236YM5CrmXe7ontoZbiflatg59bOmdon8uiu1mmcZlEnDz6Vs2trHnue9c3d/
         AWW+NjdR86ExU2kS/75FeIwHuiL6qeGeQxa+ZvTpOMGUw0xupMENiLKoPy3mEPH7xg8m
         MEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=plTQPe/r5g7+hlio+uDC7OmDMm62E8MLK0Py9bFYnwA=;
        b=tPSfq/YiMVnezuFU2LJEdTsvoPHAhqQmZZ6ZeeBo+ycx70TmHQlmnkTOlQjiBctre9
         wEg+Ws4TUjuO1xF4zST9/at98mnsmX4urwWRFT4WX7Z/gdPrWb5IZ30hS5ofp4AvJX/2
         6szb+KNPpPXaREJwkjbG3PPEe6LSd5q5rDt8I493fY1QyG3YOhZuYWm9loJ10qADJHhr
         h3ZCqWhPmC67CP8XGwyk57RvCRkKxmaKd46KZc3/zKWcDJNSf8XmhfEdFYgng7vlnqoD
         UNO3EcSXbAJL2X2Splo1GS4WAKyeMein/e14SQbASpRirBuDnnr7xu3QJ2KxmVuqeEXY
         n8zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UtO2A7/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a056902054900b00628d480e05dsi1596917ybs.498.2022.03.03.13.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 13:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UtO2A7/1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPtFy-0003IP-Km
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 16:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtEq-0002RV-Fp
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:43:57 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38570
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtEp-0004g9-1i
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:43:56 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so8967735pjb.3
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 13:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=plTQPe/r5g7+hlio+uDC7OmDMm62E8MLK0Py9bFYnwA=;
 b=UtO2A7/1dbe1yn49+sVUYwHcEre2zZ5sKA6BRd8yy4LssQIgy9TYkchNW3iiyKOloV
 J4syd7GgQF8yBjsw2PGKO9lKIDXJ+XgJIYOCUtL5JoOjmAmO9pND9mOJ33AX66ZLo462
 Um2imo3RfOr7IInsgZiTCB40NLftWAu5Q5jSw2ybUh0DnALwln5iNlKjJmYfUBsAyEOZ
 RpWaPrhLlAGkK5P3KUey8rwxjhl23DyzefJR+xSBvSmRfFPASaFHC9IYDZccL7QkmUk6
 Gh1kCu2Kn/1mdNtfsAnHdR/wvQwXKJ/d3BZuP+A5dvfNkWoi3Zt2cYmrEJ5URVF5A868
 Z8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=plTQPe/r5g7+hlio+uDC7OmDMm62E8MLK0Py9bFYnwA=;
 b=NESLNBRJtFv7uUCf8m9h1HV+/3twuy63j9tTXc2HA+pf6DcAtaM6DD4Y9vRLfkPVPj
 fJ4CMGq+h4SOVtDw87UuiH0iUrUMdGWwUFrD7DzcFOl2O5JNvUjEFkMd7bhD4Ai2+kfy
 zkUy4UKeTIh6HhGvqphAn6s953eR7hypTFg8aqGBZ8cgzq+nxl+k/VmSOxTtc/OgDs2/
 ChP1weCe6di+CYPsb7oc4Nsn+0A+PjuOWhj7hx29FwLOH256YLsMTXCJYIqxLuG+1QCm
 0wOnXbqycAk45R/QKScYbaCPSPaMr+d5F2fEmkj6lSKmvrnG8BlWtNCR1hhtAslR4c2x
 T3NA==
X-Gm-Message-State: AOAM531CcavgKWgD7B+P+dVweVav3+XugqhHND8GuXHxu0Q8W2ky2yqK
 M2zW9GDqINMp+tfCBBGJR5zxqA==
X-Received: by 2002:a17:903:11d1:b0:151:9fb2:9858 with SMTP id
 q17-20020a17090311d100b001519fb29858mr8258769plh.136.1646343833740; 
 Thu, 03 Mar 2022 13:43:53 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm3611280pfh.143.2022.03.03.13.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:43:52 -0800 (PST)
Message-ID: <c6921e8c-6e92-8fe1-56c0-3af872983364@linaro.org>
Date: Thu, 3 Mar 2022 11:43:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] hw/intc/arm_gicv3: Fix missing spaces in error log
 messages
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 90S50kjexXC7

On 3/3/22 10:23, Peter Maydell wrote:
> We forgot a space in some log messages, so the output ended
> up looking like
> gicv3_dist_write: invalid guest write at offset 0000000000008000size 8
> 
> with a missing space before "size". Add the missing spaces.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_dist.c | 4 ++--
>   hw/intc/arm_gicv3_its.c  | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
