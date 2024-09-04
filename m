Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp57701njb;
        Wed, 4 Sep 2024 02:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWKXaHgStXylsS4MKkmENyIdG+rLlnyGoLBmkbnOClpqTNl43q7D0Soj9pZcTn7b718l4w+9/oRPn3MA==@linaro.org
X-Google-Smtp-Source: AGHT+IHCPjWyDR1Bq0dT0xcGJfFGGMwlNn3VvxbrkJEGFzPoM20iwlo2bnw1Cd8AJTxIKqFlkVZZ
X-Received: by 2002:a05:6102:36c6:b0:49b:aad2:2fe1 with SMTP id ada2fe7eead31-49baad23370mr4007017137.0.1725443729347;
        Wed, 04 Sep 2024 02:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725443729; cv=none;
        d=google.com; s=arc-20160816;
        b=rw7quuxu4XZlw4vzdhdRNUnriSgzlAnnPzmT8mS8Cv2YBEe3uUU182mLKY1ayTto+Y
         4G71HJmk/dzh7Yh1Ol8H1gKGMn/u+IJr+rMn4SVAeog7Cuo3a9AWFKLRfNtmBlycT7XC
         34DMYKFFVAaVH7qJ75crE3rX0w61gdrRA9fpvKki8UbxirRwg2qQFgTS7MlHPHGvyxZO
         u0FYqyXiofwnw3ODsk6D95mIQ0aEuGHJCLzTqG4RvqTWs80iI0x51RoDJkbNC80GvQDW
         3H9z0Ys5mW512UX4GDeclX/iCCoivFuaN/zZp+Kkl8QonPIng/IfrXwBaUvkwO1BlKOx
         JWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ykY0xzQAb78e2zXQn5RvianXoSLrkrdNhWIk3Ma0YFg=;
        fh=aJ0v5aAbaXu3fIwyU6qyGv3ZkHtOF8Tft0f4KD+z4T4=;
        b=vdXuI52GQxXbjAQGuVjVL7njLh/UVwpR9t9UTWg64tfHr+JaQgr3WB5zF53deWvbfe
         I0mYYrc8RhFCgufxruYVBZZ+JjEnJYLzmCX+4RaC4r4KyrTaLHnBNsZa4r2RG9uJxljY
         SRTvY6R0Egnon0lDiZ+YBKngEqq60mpj8o0IsNCwYv13r5w+G8XratGFvETNMrp1SSk9
         k33p/JrXmqlfZkeoHnMvEk+po4Rx2pcuEehpVsodDxVB+m7W+/Wj5Iy/baVr9tKgx0mE
         yZ0cyvFNCY0EqqALDFqlQpP227AB4xjoYwSiCeg+xSORhgOAWS4bfdTjGgdI9FopWEMw
         MRgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7LaIUCa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c166ebsi1016013185a.121.2024.09.04.02.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 02:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7LaIUCa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmix-0004T1-67; Wed, 04 Sep 2024 05:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slmiv-0004RN-6W
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:54:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slmit-0008Om-Jh
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 05:54:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-371ba7e46easo4230108f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725443686; x=1726048486; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ykY0xzQAb78e2zXQn5RvianXoSLrkrdNhWIk3Ma0YFg=;
 b=X7LaIUCa5ywAhhG9YmoCbAUz86VCGSXGskxqspmJ1O2SXgxLBACiKeVoB8se25rR0Y
 9qDrSbub8H40b7GTsKXddKsSghbycFQ0LvDua71i07TwDREJZJjMp2dI1dQTha5eAsrI
 6WaPmy2bpk/eR7IC72oN/3Ufl8On5rEgsRFYHeQGS8oi1Jj2UO5jtE7WhlrqFQUz7Hab
 8eF4kVMbLvahz+wxgpOtv7ujeF2PUxi2htCw5bXEXeP8zT1o9Hk8D/ogAZp/zoae8o6v
 ooEqJwwq9Ddta7+xNMPnBb6Zb2dYtLQ8pWJzCxGJl1sqBwPrR9SRSckp3uSOPuyLIdYl
 BqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725443686; x=1726048486;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ykY0xzQAb78e2zXQn5RvianXoSLrkrdNhWIk3Ma0YFg=;
 b=q9ypfRTcfYQGrf9fiNtEr/X44nbeN+tMamPv38IDybzuBEIuk7gjjm0kjlTZLJW0z8
 eLH2Mt/xJ3UedK39DNdiK7ycle8vzZG3hUpI1tA1DVxYFmqcbt5k6dLgw54yJ8azBKpq
 DRW4rEu/5XFJrRZgvnvF078TEuLoLxTR/n5srfwMT7AnOgvicoda10GwCy/m7a1/4cu6
 9NpDm6w1NHdygh8zrOPfLRABiyZsc1udGosQoftdKqoZbWyk+A7SwCHDA8Boi70saAih
 +/l4pWzrfD4M7imXi7d2IuX5JwkYbvhvXQSDKVhsA1UbsjO2v019v2T+HLfc2joXJvZ+
 pRIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv8O3NtrZMRZnCtJI6o2OLtz/IxptduGSNs6yHHZW4n8sebw6OAxQh0UTQ/6HvVAv6xrG5rl1Ygg==@nongnu.org
X-Gm-Message-State: AOJu0Yzm1zAMkHeK9KVDQBnDBMgLzU3hy8WfpNl6BgLt2d+Z0ppyIJnZ
 BtxpqFx93cgaCEoeGlfq9I28fLaKSj7IIunVvgrNHZKM87hlq8MiqhexxHLinPg=
X-Received: by 2002:adf:e3d0:0:b0:374:babf:ac4c with SMTP id
 ffacd0b85a97d-374bcff3b31mr8665485f8f.51.1725443685649; 
 Wed, 04 Sep 2024 02:54:45 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c17fed40csm152184605e9.0.2024.09.04.02.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 02:54:45 -0700 (PDT)
Message-ID: <2eeb9049-3444-49e0-892e-7022ab045647@linaro.org>
Date: Wed, 4 Sep 2024 11:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-discuss@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <70b240aa-98de-4998-8c1b-34349fc831ba@linaro.org>
 <CA+1FSiiyb2v7oy43exRuY7kQpLgUcEifAE2zrEtpYPkgAY+TRw@mail.gmail.com>
 <6eac1f19-59a2-440a-a5b3-f4d9654ba539@linaro.org>
 <CA+1FSigjog5DO4UJ4bjo+rvtRc2ih+yJF0q9HM7y6N=aSg6w=A@mail.gmail.com>
 <CA+1FSijxZ5Ocic-aGTikNxr_faS54fP=P+2uuCxfypMJKEE2aQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CA+1FSijxZ5Ocic-aGTikNxr_faS54fP=P+2uuCxfypMJKEE2aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7W0dEoR1XHM4

On 3/9/24 22:52, Mario Marietto wrote:
> Unfortunately the usage of qemu patched to boot Android 10 on the Jetson 
> nano didn't change anything. I get the same exact errors as before. :(

What do you mean by "qemu patched"?

