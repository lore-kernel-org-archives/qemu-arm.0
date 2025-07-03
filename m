Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp865676dyc;
        Thu, 3 Jul 2025 16:27:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWg6Cqps6wuI9soMlsfdoVNDFtnjvQQ11WLmT0QTQ/BAa6tDfypm5kcDlCbfQnWlHCIz7STtqshRUcBUA==@linaro.org
X-Google-Smtp-Source: AGHT+IGLElS/eooNsNYS9dMWgfQ2qeZQZ93Sh8P5Q2PA4KV7BK+/kiT0u4/QxW3mvsqIygg/2BsE
X-Received: by 2002:ac8:5813:0:b0:4a7:146b:d762 with SMTP id d75a77b69052e-4a9964cc981mr10049051cf.13.1751585271191;
        Thu, 03 Jul 2025 16:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751585271; cv=none;
        d=google.com; s=arc-20240605;
        b=TTpL29bhokaQNBPohyFyzsQwn4UDG57PnPIdQXYwIi/Cg7TenMEkGOY9E2i+ECMT3Z
         nmEOUTcwbR3x8hb+aVx3ETto2BQqZK/IUkWWO4KoeflmjT1s7eWoyArHg9CFrdGq5Xjt
         FcS2ZCIERgyoYW55FSSYBWfEPvfDDpRX+nH0HdoWFjA35SMGQDwT96yO8r/MoFTnFHPK
         bFa8MXZrfwKiuHXQBXyrXAH6yzyMjXd2MD47rGip9zlELMENngojoor1ylUzNcyW7iqQ
         ocz6yYaU4oNVtC4YuOpNWHb+p0lLTtBTf1x64O29OJ7sBzUnQ0xDTAKMR4/2gQVxqOVA
         pIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZXqytMu0wdCH+SYu3GrpXsxyh0GMIXvcrYNbvw4+76I=;
        fh=WtwckuuvlsXer1eWempYRLfLyk7y+6+CwisRa/cJMaw=;
        b=UD8dv4L+32nIAu9+dW5B2cwduBuG6JYRgpYgfAflyyMVP4cdFETycc/Li3iVfbMYke
         TvoA/DjzfGrTkEUDLm+Bnilt4Dyu3seJscbejwxmY3y+1RHvR+p+9BkpcEjxYgoSVJVf
         1/IkdVYKyierxvW5xqphyrUECTBBwTuMviIsYvJ79WKbytRROQDPrKcwkW/BPCppK0VX
         yLjBSdBjEbSxAGjC+dE8evwQX6SU4PPMLuj42m7buv5t9iWYC2zJ23szZrSOtqnfH5S+
         xAxnyFxCDmjm5zqkQigfd70FIDVtMX+hc02J94dEa/5ueUVnzZH8X4cdF8dhhJwZNPbH
         5OEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kx1Jjz2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994b0ff4bsi7338231cf.576.2025.07.03.16.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 16:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kx1Jjz2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXTL4-0004Xr-1j; Thu, 03 Jul 2025 19:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXTL1-0004XG-N1
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 19:27:31 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXTL0-0006B4-4u
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 19:27:31 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-40a7322f081so163807b6e.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751585247; x=1752190047; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZXqytMu0wdCH+SYu3GrpXsxyh0GMIXvcrYNbvw4+76I=;
 b=Kx1Jjz2KrCWUyxZelz5VeG9KgXyDsbECe0xLMvXdcruJqENunnMu5sulYp6hFiVLOS
 rhsawtw3nxBK4E65dPukn8JmV97v6WI9xXi5bMSr7NB45hb791rb7+1abu0FvP8Lt5Oj
 x8MA3qtBvu1zGLUqfFEorsK97yjrTydU3fQax5ou+o6msVPKmJp/gx7xzVMelFO5zULM
 UWC5RH2NRnEzfFa1yXzXcrh502NVeBoPlYIya754vP8bt12hHkDTwIGcDihznKd7KAWk
 P6arZ+eJbHTHXmpkcGirpW6/LP7lrgu+Z8y6hxKVxaZK6UbRjPW3ciPSgtUXNnGcPkZd
 fvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751585247; x=1752190047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXqytMu0wdCH+SYu3GrpXsxyh0GMIXvcrYNbvw4+76I=;
 b=YQsI0oHAADA7TFwB9cOZX5KqY8Ye4Wt2NBX8bDyMnxei7wAQSGme2ePOmeLU+bGb8K
 z3M3BFJDGuzomZyj7dhCK8dVqkMS2H/LTeHjlGeB7OJQ7M4HtWRiWaf6hpVEAZARuGE8
 OPpUbHFce7LnnLi0v5dIlAhbB9Vos9k9nrQqchhcMtqHRWK7PQ7Vgb2Rtwfu+mEqtDJZ
 q1yKu3k4kCU9S2z9wtJBr/HFJJ3ot80HXXJJRf7BDrhlnbm3eHnZi9/5S6V1nHH734fR
 GBzk+WEz7gRCYwUqchGeLkJrNUPLa2yHo7umgrQZgGDhDNdJ2eHF1gqsrfmCrEuIsgDG
 6vCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPdjtynsVPhwQIlxCVRDsArwQkxbWvPron7HIi1OYOg8C60yi20rL7nv48fIyoHJPWIZKm+ERnsQ==@nongnu.org
X-Gm-Message-State: AOJu0YzpLOVf5Oo5VBGVAMStc+pXpRcEOIXYagS0QgUO1BZz+ootkRzh
 No2UaoBBlKptxpoDg/vYINq9bhZOeuoPh7tdwJdwR2OKivxgD+YI4aEfQdDwsDwu1sJAoaS7zqu
 rbQIKcko=
X-Gm-Gg: ASbGncuUZ2JiB3xGu2nykSPOyUC/jQbagAxuebS0MVFyIr4dTrAN2Vcha9i2itfOzGa
 vvXZFjlD09lpVEKnLILmuopVBz/X45rqtQ0uZZkCPc6ur0mdK1I5kpsixs+s7oEnNP1AysF9kXU
 xIuf/Cv6KyoNAu04mvefKPv3/AfzWAaQAadXL5/ATCQAxzh1674eghNLravEXcFr4efVK8nGlLK
 U7qOFg1HoGLPaOj8GpRblkPJ7blI1CaSiUpLvX/lCHgB2VOA0UTM8soEb44BzVC38yOZ6bIutj3
 QareD9yRVyjKurgt5/qW7tIHL/NV8WNCcZ9Tg0Yp2I20ptfDpDXkfZT312P3os2Lx/4cMu1kGl5
 PvDJeyImV7c2ITax1mmgLY6eBh+rhXp4gyMRbhoEM
X-Received: by 2002:a05:6808:6f8f:b0:406:7a21:1ae9 with SMTP id
 5614622812f47-40d044815afmr585591b6e.37.1751585247029; 
 Thu, 03 Jul 2025 16:27:27 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40d02ac74e5sm118767b6e.35.2025.07.03.16.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 16:27:26 -0700 (PDT)
Message-ID: <fd02ab69-c157-4538-b180-42eab6ca8a8d@linaro.org>
Date: Thu, 3 Jul 2025 17:27:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 79/97] target/arm: Implement PMOV for SME2p1/SVE2p1
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-80-richard.henderson@linaro.org>
 <CAFEAcA837SedaYqtKaDOFSuZjZ2H=6YgZuFOVs9pSoLN5GZ8vQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA837SedaYqtKaDOFSuZjZ2H=6YgZuFOVs9pSoLN5GZ8vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
X-TUID: 3RRnjzRfk/Ld

On 7/3/25 07:24, Peter Maydell wrote:
> On Wed, 2 Jul 2025 at 13:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/helper-sve.h    |   8 +
>>   target/arm/tcg/sve_helper.c    | 317 +++++++++++++++++++++++++++++++++
>>   target/arm/tcg/translate-sve.c |  93 ++++++++++
>>   target/arm/tcg/sve.decode      |  17 ++
>>   4 files changed, 435 insertions(+)
> 
> Given how much code we end up with here for insns which are
> implemented in the pseudocode as a two-line loop, I think
> some more comments on what's going on would be helpful.

This one was hard for me to think about, and even now I'm not sure I've got it right.  I'm 
going to re-implement exactly with the two-line loop, and not think about how it might be 
"optimized".


r~
