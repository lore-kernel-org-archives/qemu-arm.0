Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2339367lfm;
        Thu, 30 Apr 2020 13:33:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypLHBh9WgvrI+530/XwNGn+dYAsQyEVVIelwVyg58SSBW9LHD2UX96+/6ttaX36ApikEtQOq
X-Received: by 2002:aed:3e27:: with SMTP id l36mr355582qtf.192.1588278805087;
        Thu, 30 Apr 2020 13:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588278805; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff/G1oxsjPW1r815zfY3vW4fLrKn6ZpBE1Hhnkk4rnmaDSuh7JcGLWFuRqXm53VbEp
         87NhR9TfsT0z6/ZxlXnEhriXFHt/6XUX++IL2HXzc55KMYtyvYG2fGzhEpTNGh9lAVx1
         L3p3kAyetZiX8URar9S3Km7zH8Pfl3pB4vYo3H8+MloTw9hfyxkPUhHK4Ad8dGPFv9UX
         1Z9JHVs0y8pufLHgaZahehevxV5SiiY2CQoMDS9efAvM1VqT2+MjzwF9Fy6fdUeJ4mvp
         pqqpXAdKH96lnjzFwADD5Rsp3yj9i5wDKWptALsP80DqSVxyO2nAYV9o3lKwrm493VFQ
         mhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j2fS6QADm15/ZKJNAPQHdkffjFrG03za1uyeIWbDmqM=;
        b=QLkUTo7ZoOqY+o/RUazExCTv5ODEYG6dNndqu5Pk4K818MlazX0VkQjqjRect0EI4+
         QiHhxDV11hcyttgxWOfW6+86OuH9R6/vQJ/mdORonsKSLQwNnAjLYKYSTof3iHcEf/mV
         YLZtT6RHcJln3YVQT7yHkC1ngUshwSuiY3o4NFUsBnHVIPAQZSGwOSarib4NiFYDl+6I
         g86qA6mXhF1TtEelvOdTjDpZFt8Zy6M5iEfnX9C57KJ4CqZHFa5JM2+N+3p/NEwqyxsY
         pjuopX5g4UICeNY3YPE1yQ5Ljz4x74Ti9AgwdoPPgl6l20ilZ4a57FZd+TjZpNPSBIlO
         ducA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y51hAl7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id s11si495048qte.159.2020.04.30.13.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 13:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y51hAl7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFs4-0001EN-Dy
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 16:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFrS-00015d-UR
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFr7-0005NO-U3
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:32:46 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFr6-0005J5-Uw
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:32:25 -0400
Received: by mail-pg1-x544.google.com with SMTP id o185so3438888pgo.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 13:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j2fS6QADm15/ZKJNAPQHdkffjFrG03za1uyeIWbDmqM=;
 b=y51hAl7F2ErJMYIlBQM4Ov2laCvVN5XpyzBBEhUbbqj/axTkHYpkB8VaRQPyE2P89S
 XlhjKyyw0qTDuInGEJ26ySQzC/Ggr4Qtyx0TgOg5aUX9nhe0BXGxhER1S3rY7pB02bS7
 lBO1FdGilM/fUFzyvirDR6tgT7aq02W7aspa+7U0f5vwWZU2s1feeLGKhXwsMapKuIhs
 HEkOPti64h8CnX/tqW7rllzhSqJxrADiV8MqFGdKTNMmqUM4YzTzbn8GhgpkgqFU8b98
 zA5kzaY9vTbCPiJz1LSODLsRv83mZaoZIj3EJHr/OOkO68xwzxMAwWDacb++qUVjyR6b
 7Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j2fS6QADm15/ZKJNAPQHdkffjFrG03za1uyeIWbDmqM=;
 b=UWi2rMV30eqa8fti44Andr+xFsKN7X7qkXYEaqC5wfGKYA+uSuSKT7e2sycS4YAhoi
 lGCWbDeJ22cfLKPXed90iHmLlZsla3CwSTVyu5AzTb4zMpIjL0XHTPFGFLKbQdNZFeEP
 nq+peRTRBiT1EmeTlSPYlOZHVe/x/Tjbg6U3ikujtEIxXMHmWdC1u72YcCTix4k+kd1R
 2etWlur7NZUDol7NMuTPpXZ3egbuMiRDs+LWAtTqE/bavson5qPnLfrif0xFMzm8ajp9
 6qOc8hid2LvErPWWJFdgH1rrvu9jVaJgqCK/f9WZVvwVoHNtb0fT3R4rFU1sI1zRQxiz
 8tNg==
X-Gm-Message-State: AGi0PuZANYzcRK1Gri16kg3Ze0Yj/GMEBa1DKQzi5FGdno5jA4mMHubb
 Q7EHkAi/e2/bvAkDIn/Gl8LG9UrGxCQ=
X-Received: by 2002:a62:6dc3:: with SMTP id i186mr476475pfc.273.1588278742987; 
 Thu, 30 Apr 2020 13:32:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id h31sm551911pjb.33.2020.04.30.13.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:32:22 -0700 (PDT)
Subject: Re: [PATCH 22/36] target/arm: Move gen_ function typedefs to
 translate.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <899e8b62-1f2f-4e8f-d297-c83204058a11@linaro.org>
Date: Thu, 30 Apr 2020 13:32:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::544
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
X-TUID: aAYcsYohXagK

On 4/30/20 11:09 AM, Peter Maydell wrote:
> We're going to want at least some of the NeonGen* typedefs
> for the refactored 32-bit Neon decoder, so move them all
> to translate.h since it makes more sense to keep them in
> one group.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h     | 17 +++++++++++++++++
>  target/arm/translate-a64.c | 17 -----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
