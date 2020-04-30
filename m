Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2290571lfm;
        Thu, 30 Apr 2020 12:43:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypKdpm6MEeQ6dG/yqRKyxI/AREO7NFErmDwFOCfFaEnfg4klrlALE9AMXGHlq0c9T6A/lPXC
X-Received: by 2002:ac8:27cb:: with SMTP id x11mr124084qtx.272.1588275804546;
        Thu, 30 Apr 2020 12:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588275804; cv=none;
        d=google.com; s=arc-20160816;
        b=GzIlHy8uXcb2hYIGhnMIb3q7BPzUq0lgxP1BfPlFK8HGFxZytHl66GEArhRTgH4v7b
         xvCZd3bqPjg/M9UzozSJG8rD/WH+eqVhi42bnfdnYiQKpF9pFZBtsGjRQVB+Mpuk8w+b
         jr91ff5KYRbQecaG2xSE+xIRIhT0OsSi/2pky9rUf56QA3SV8fQkwFCz/xhb0oZW/hJK
         AbJpVlAKN3pKeXr7mrFDBTJyNyOzcb4t+ZjaSE+J60APolqTkpGF+oj72cEChFiNIEC5
         Jx8agRYjOsGMw4vtkaGmleicCNB7gqWVDW6id5N91mR6A/vRzNf8VLMUfDqehUanoT76
         s8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oWrO9ljQZLDUAdkjQzfBtUjgd0I08wqyuqLOQI1dRC8=;
        b=ermxNRW+a5XRuBOVJKHHQGzepJ4WG60ah3CrBebRCSIRYvIFxR1FcSOU93yOlF5hGx
         bzLtd6YCp3atRx756Nmf+bNAJTOTnlIlK5ASiAtTZtVEsLWSLX3oT9UJAwkjsRh9zBnG
         7VUn+GfyO2CVFvQdQ+GedVSYJJ/1djdI5r4/nn5gNWvDgAm9bhhJcbRdz2HMCGvTRKKG
         GbwGpIT34c9KUT8sM4+3HiAWnrDG8iBVTOAeFfJkgO6WfPww0OGVb6cVrrRSlLgICfN3
         4zvg84QkAJ77hzG4Y2nac1ROZPRH0jWBKwWbH+OoKK8ti6tYssVOjcXSwvTI9vWT/XX6
         TjXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JjiEHbPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 4si386279qta.218.2020.04.30.12.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JjiEHbPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUF5f-0005z8-0R
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUF4D-000521-OG
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:43:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUF2F-0000FL-Bl
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:41:53 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:36481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUF2E-0000F7-TL
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:39:50 -0400
Received: by mail-pj1-x1042.google.com with SMTP id a31so1305685pje.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oWrO9ljQZLDUAdkjQzfBtUjgd0I08wqyuqLOQI1dRC8=;
 b=JjiEHbPng+P3c8OEDnFJnmAkPEcWsT2E3TnmOHaKVNyFbCLgqhBKpChQOEjGkYCu6A
 VlrwUAoHVWXcOEvcKfsnEkvruaAsckzwXKBt9OYZAHN+itLGQunA5yV3EST4mozf9Pnf
 MYJAuu2TmwE3v4FuLImDN95xR/oyujZkq3N/ttYqSkZ98VqaGltEmsVXhhZPbHs7W1vU
 UOP9gQZ4sFA4H4g8pLns1T5gBJSgFopZh9mhXxcrjCQZxLuGQIpEwYyACD8+aYDbH0OS
 c5M3QFKX7BvktxhXfm1yD3yWJvMwvWFoWqWRc6D3HmAhXS8JU5YfihFfJdrHH14bOP9O
 GW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oWrO9ljQZLDUAdkjQzfBtUjgd0I08wqyuqLOQI1dRC8=;
 b=YJ3xo2EX5687Uk3L8mzDzhNWAdDpwN3pjBl27Q38WaYxZcNIS5Qp8sxkel2Q5tTSN5
 vvhvWOqn95Zspe+G6k3wJ5MYfmCm11ppuWHv7ytVTTbtgS/lgFOACX2jKKkjGHKJv0PO
 j0Zzwv9bRLwkb+LIDKcPnpDsG0u+EPIv9JHmpAaofLrCtiULTMaO8SR09XjsTkSQCEoG
 JUWTNH1aStJy2kRw8jf/bTSa5yoloChfSQgoZHwq8mBxhLB1xg7Ks4s5CW+f+1B/WlJs
 zVzJ39jmKh/xaJ8bEv8htwN7XjGLXkMqEdAey7MCsh0CzbpzzONegunya9zBzCG8kQcL
 6M0A==
X-Gm-Message-State: AGi0PubucVG7wmfdzKP6bYiaFsoxse9V2dK+in607GipL8IsmfOZsPbd
 0mvmfmTm1i1GcaV/3F3x+oexng==
X-Received: by 2002:a17:902:c3c3:: with SMTP id
 j3mr580190plj.284.1588275589398; 
 Thu, 30 Apr 2020 12:39:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b1sm482172pfi.140.2020.04.30.12.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:39:48 -0700 (PDT)
Subject: Re: [PATCH 15/36] target/arm: Convert Neon 3-reg-same logic ops to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <529b6455-be2f-5baf-82a4-bcf8998c7801@linaro.org>
Date: Thu, 30 Apr 2020 12:39:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: k+VwDD0XstNZ

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon logic ops in the 3-reg-same grouping to decodetree.
> Note that for the logic ops the 'size' field forms part of their
> decode and the actual operations are always bitwise.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 19 +++++++++++++++++
>  target/arm/translate.c          | 38 +--------------------------------
>  target/arm/neon-dp.decode       | 12 +++++++++++
>  3 files changed, 32 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
