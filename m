Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1140546lfm;
        Fri, 24 Apr 2020 14:42:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypLe8pog9CYf4rm+10oNKY+XbxkBWzuoAsKM5Tt3X5JdeFqhwrBd/dVf3BexCjNJ1CYRiyfW
X-Received: by 2002:ac8:764e:: with SMTP id i14mr11564981qtr.191.1587764522110;
        Fri, 24 Apr 2020 14:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587764522; cv=none;
        d=google.com; s=arc-20160816;
        b=qGOs7ecxZRD1pO5ln4zAzGc9W4IyQMbU3COgTZ86pHPDQZhtNhPGmzBISix6elrRnL
         pa2n7XM4MSGF8t1fddBXqpx0XBFgWQxBGVTcldyZrVpfvxOgQDhFKkOTJEZpr+ZVyzpY
         MU72Um7kk/9wtyXvfueiTs0hR4yAdu22K8FJuVLCykTGZcW7sLA1P5pB1WVTYgAKGc5z
         mdbbGuag43L5TzFP/PUYJuqaKU5rpWYNPAI+Zq+qasK9lkgeturqsjw0SnrOoLTXGv+y
         q183C4n35lp5km2WXkga2A15LtF+4gtqpojnRbYEVI24Nz4u847VnMPRlYU0Qeeeba00
         FIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GDHYGyuzm9dNqhkX6g8V5LQmZj92nILH1EXV+q3Ivjo=;
        b=ZInMHoyoDpGpBYwe7ND7tzFldwtV7Mnoaw8cfo6RExCVvaNhMLLepEG9I5dSWQTl10
         OkW8S8HMiHgkBiYd/jJ7qNFMgW4EXg1EGOfm0RwwXiGsZyzFp/sBIcisPJhrqVDOqm7t
         35tfMRirOjW1KLaVKMNxlsfbd89K/hdpCqO8hQPehPztg6AgoSpHjeiZuKx+XNqBHGrd
         40XrxpxM7aGxYRqCbLdN/CqufLe4HtHntoo9XBfUz4s3z7bCu6E+qu0hTf/8MgT2dSWR
         Eto7bjmSkBliWNSQ5fCRKpnvj5FcQUA/jmzHaqQoLlrWV+qLfizvWEw9NscDSmsUyYiq
         hELw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+GS3vga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si4052153qto.184.2020.04.24.14.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 14:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+GS3vga;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jS65B-0005y9-Ha
	for alex.bennee@linaro.org; Fri, 24 Apr 2020 17:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS654-0005xC-HB
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 17:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS654-0005rC-1F
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 17:41:54 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jS653-0005q7-DU
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 17:41:53 -0400
Received: by mail-pg1-x541.google.com with SMTP id o15so5269538pgi.1
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2020 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GDHYGyuzm9dNqhkX6g8V5LQmZj92nILH1EXV+q3Ivjo=;
 b=m+GS3vgaYzy0fzhoQvNiF4GUiQDpoONtR2afQs0nVoagIAaHGtMS2LmVulZDrINrBO
 ozBMXIjiNXQDBcODPJKA/Xv4EbNlv85ELCw6WKyG3T/07/WY6nWWT5RvqyaIleGoEmCh
 ImUjDI4iFTFVqQJtMZcWNx7DpClg7It/9ilhZxVKlXuFPzDuf7KooF1l9J18srUt0nx+
 X9cBkfQ8FJY4nx73IApczkukOiUZRUYkg25yrwpPP6qPca/W8lsIF6tKmm5TSgtODnZB
 r9ikLfF6KGx4Y8+clySx+owoOcE8JssexhEFw4gjExBbR+Gen4t2ZNaQKFQIJMwDSc2G
 tEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GDHYGyuzm9dNqhkX6g8V5LQmZj92nILH1EXV+q3Ivjo=;
 b=GOKNm6Cd1B1OT8MiabcVt/uYtfxPgmxaYMd23rvnhmu9CgFJ57lW5R8SCIuNEFi+BN
 8L1WUPi/FuOoik3HJ/G6j34Z4Z+CQnAAWVnKqwKR9eVcKDlWpV8cujaqYPXFVnDy1HQC
 ZBqy/B9BZ34NB3q8sVmQw65JsZYw8mZi2a0JACZrv8Y+QWJYSqQ7nJD2Ad9QwKwWYuJZ
 ToFzI6h7rFW66fEK0Ao+mB9QX6/mjqmV66dw6fsrePIrcsjkr3ZsUBWoAdDLjo3o8SeM
 0xMUajnGCzRz+JUQhFB2eQ5gUUXptECE4BcCkWePjzguhB933ypo91yvaV+usA+/oAKP
 idoQ==
X-Gm-Message-State: AGi0PubjUpU2YbwoF6vXIc5OKhF1b3s80S/l8B4PVuW/+vnxvkrYeYwG
 +/2CjgCsU2sQiCwasZworayueNBUEbw=
X-Received: by 2002:a63:d00e:: with SMTP id z14mr11189793pgf.125.1587764512003; 
 Fri, 24 Apr 2020 14:41:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id z13sm5327502pjz.42.2020.04.24.14.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 14:41:51 -0700 (PDT)
Subject: Re: [PATCH RFC 1/3] target/arm: Implement SVE2 AESMC, AESIMC
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200423223739.31715-1-steplong@quicinc.com>
 <20200423223739.31715-2-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5681d692-6c1c-fa54-1f10-1b96742f9a7e@linaro.org>
Date: Fri, 24 Apr 2020 14:41:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423223739.31715-2-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2UqCRXLlizR

On 4/23/20 3:37 PM, Stephen Long wrote:
> +#define DO_CRYPTO_AESMC(NAME, DECRYPT)                          \
> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)            \
> +{                                                               \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                      \
> +    void *d = vd, *n = vn;                                      \
> +    for (i = 0; i < opr_sz; i += 16) {                          \
> +        HELPER(crypto_aesmc)(vd + i, vn + i, DECRYPT);          \
> +    }
> +}

Better, IMO, is to add a "desc" parameter to crypto_aesmc and move the loop
there.  Then all variants of this operation use the exact same helper.  The
separate decrypt parameter would become simd_data().

Same for the other two patches in this series.


r~
