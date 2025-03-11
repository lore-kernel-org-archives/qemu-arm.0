Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2022621njc;
        Tue, 11 Mar 2025 10:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVt07wvEx3J4RCMpVrTftZUyJd1SL/b/V+oF6Ya6NfirNrqrNT7KHAS1/zEdtDTbnqEkG+GowrwsFNm3g==@linaro.org
X-Google-Smtp-Source: AGHT+IHUGElaiDj9HJBPjQ0y6D4zQSCfcpATgAZTpIvkQ7da5uopYoMdSgihj/4XWHchn6hKo0+R
X-Received: by 2002:a05:620a:2788:b0:7c5:4788:a160 with SMTP id af79cd13be357-7c54788a2ebmr2044007985a.44.1741714927405;
        Tue, 11 Mar 2025 10:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741714927; cv=none;
        d=google.com; s=arc-20240605;
        b=Pe2D4zR4Tq+AoYXi4TsmK63vTWZZZ4o7F3PQCVbRlj8ksxuQIWyS30gO9vSifZRHNB
         5FoD+Zaif9gui1+HTs0R+qQOMiEuLjt75HrCoTL+zPy5WauaNDuCVza9L0xuWEIMf6PY
         bWHQoCCI93ow1ozEMAbdRvL46+CvX8k2kMVcsvmh7ChRm6t1SIYmyVKw7wNsUmeMA8hN
         L3jQkKxllba6494sAzgVSu8oFeJFgCHmQmtS/PW7Ci48NH1MF1u72AjM0BYZt93kyWio
         rFxHOcOG1iKin9Eh5xF1pQXIkkVAZKeSLcNBStN3Q5smftFNwgPMChtDEAXxbz61Vi6v
         jlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zKFfFJ2OhjE17PCC4T+chtXa6+M6mRhSrk5T/UA5sAQ=;
        fh=CWKqfTLvBStOXt/lYBCZn6gw5yZE+kJY+xYZvhj5KUQ=;
        b=LTY0K7Z6NB/9Q0sxOt+FLwDkMZA4nLHYnfcTQTVMW6AuYanKsKyWWtQhzJs2RyBq75
         jMBEF9UcNuWNqDNh3nnVJKY/N4+wcaaE5/wcTr7erhKaobh1d+yNanU9XOcvp6sQ38N+
         SIP7kgJr05e1N+dQEwybJx260b+o0g3kNVX6FoDYEKJJAtunyLF6q8xaAyhouQwKCul2
         ExPa0RRt962m9lg0mRZQhkrisV3sd1GWWBMv7x1p4+c48Tc/VbW7CiufqjIpNmffx7ut
         i/T/GTojOjEbvTBi/ddVf5UQ/EtBfBnDME53vSCiKPXIZHRkkMSflvB5r9b6NicpcQno
         Lnsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EZgp2/5K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c54e725e99si497343285a.108.2025.03.11.10.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 10:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EZgp2/5K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts3bo-0003ws-4j; Tue, 11 Mar 2025 13:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3bf-0003lI-VA
 for qemu-devel@nongnu.org; Tue, 11 Mar 2025 13:41:33 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3bc-0007z9-UZ
 for qemu-devel@nongnu.org; Tue, 11 Mar 2025 13:41:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-224019ad9edso131364675ad.1
 for <qemu-devel@nongnu.org>; Tue, 11 Mar 2025 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741714887; x=1742319687; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zKFfFJ2OhjE17PCC4T+chtXa6+M6mRhSrk5T/UA5sAQ=;
 b=EZgp2/5Kr804LsjZTRrVfEoMSeCsbIPoGpK6mHWYGUZ+BOixAcopLrnQLOcjTn7AEH
 LuFBxhlZ/Gbg9cFz2Y13j0I0uhNvX3rziqUBP4L+ygG8utGuFsY/6F8QobA3AJENEpgP
 /6b7gpTogOot0m4Xr0xy1mzvg50oxopvc6eyQiIX3C2zSMuC52aGr6uIoXN/YFXYwp6K
 jc2JieFIZ5Z7zNOTJFdMiJcHNDYKVfiVg7WUZ2lM2JtazbbZcacDZSm95383mBbVfvFq
 uQpDgnkSbG9xuUNHH+vewXu79ZJ398A2q2KQ/Pn68hgAyGYgO+hW6PppMZ4pDKFFGK2j
 JgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741714887; x=1742319687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKFfFJ2OhjE17PCC4T+chtXa6+M6mRhSrk5T/UA5sAQ=;
 b=CDb4IKF1Mu89VJP/KH0H6Cd1TZO3g9gdl+8I+QFF2YYmq9wqFxq94H/e0wUd77ft5z
 OCVVfbGf0eQsqJe+H1N/MRGnmqHZit2rhipdTypFBAU678RMq+TUKw1kqjBBO8EyX1b5
 6OBpaKlwdzCJO9tcELdAXNix4M3KCZrdlpd/uYj3CdaULUz9viXlXahZQDbqfsgn3x/o
 PL1IlYr0bAQGmSThbuk5TXqI9y0und2kwOZQXVKFLHQH0euZvuqxIaBXXVitWOsXjM+4
 sCmyqJOJBijFse7pc60545ZZTB6FFeDrHT3rUUdPrdeA1fK85PudOhFXcJ7X7L26QRwn
 +5aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwMjHJ6I3g7V2jDOgEO6N+6Qz+VzSQxpy0/uVUu77YqH88p15IHlRYpdLViErR35zOh55Q9WcDiQ+b@nongnu.org
X-Gm-Message-State: AOJu0YxAKUFkKFS3o41md2bU0Ixu/Gs5Rc/doZaUNI9HRliIlCmf0T4T
 Dd73FhctvrQcyO87pXUDRUApchcPstLmqfYdqXQlIqsg2JTT4Qy2mSJKdC2JJso=
X-Gm-Gg: ASbGncvT0eqbv6eeq7r9HqQmOkmLhEy3s7RQtJWoSL8twVv2IF3yRBN0xUrqUrzIvj7
 eIobAFnP/IkBMbTVJY39pFJnSCdjZqWwUA5JWPpz33NqnvxbT0dPPwKAlFWXu4i/nPtE++q3ThG
 dXZn4f2iI98/c8zcyeYdPScSqzPV7pt1IH90ipqmZO7m5OCWIQDGPpv6pGrFrZU/u87qM6UHtih
 Ogy7qDbzhqQPGpEa9toue336DstnBKrUnP5Ux0EJDPvhQeI+5ktCqI3zCZIfyj6ZOUCaUL+NV6P
 Ei0mQcM6rsJPN94p7/SjCFM2cmuo6AU0Y8laTPhxlgQwiYsUYLXIF1GplEZXDOYDQcmjS/SRwBx
 FUgd0tmhJExVjgo7l/as=
X-Received: by 2002:a05:6a00:3c87:b0:730:97a6:f04 with SMTP id
 d2e1a72fcca58-736aa9d3a5emr25810743b3a.7.1741714886904; 
 Tue, 11 Mar 2025 10:41:26 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736b2da32c6sm8716044b3a.149.2025.03.11.10.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:41:26 -0700 (PDT)
Message-ID: <3d8edf26-506f-4ccd-be93-eb90d9338a08@linaro.org>
Date: Tue, 11 Mar 2025 10:41:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] arm/cpu: Store aa64isar0/aa64zfr0 into the
 idregs arrays
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-4-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-4-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wk02wxeinEOa

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
>   target/arm/cpu.c          | 10 +++----
>   target/arm/cpu.h          |  2 --
>   target/arm/cpu64.c        |  8 +++---
>   target/arm/helper.c       |  6 +++--
>   target/arm/hvf/hvf.c      |  3 ++-
>   target/arm/kvm.c          |  8 +++---
>   target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
>   8 files changed, 75 insertions(+), 63 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
