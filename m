Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp20325ejv;
        Tue, 26 Mar 2024 12:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPmEGKTo2GYc74fnV7134UpWIFtNx+bkJjghv+JeLtyUIj6HDTNiFGa4WgHucX6VB+3rcJYPugZbG8UX7N8nRxOopUl8bV
X-Google-Smtp-Source: AGHT+IG9rZoOv8SRWHu4bq6G4Yj8F60L5GL2TvtyygFL7Sye3xE5W5GNWg2ysfIaEYFO90avxvQw
X-Received: by 2002:ad4:41cc:0:b0:696:783b:9aed with SMTP id a12-20020ad441cc000000b00696783b9aedmr9428193qvq.41.1711480159283;
        Tue, 26 Mar 2024 12:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711480159; cv=none;
        d=google.com; s=arc-20160816;
        b=MSk0EsS2GKJZlqPHCqf7g/m6hbkmIyJWKc8ZTpNcRkxdxKRZhxW2/LOQFcvd+g2HuY
         DMx7jP9q6ePD5hjfFT8fFzLo4YlKC8qeYk91GFctgzMZLkqAuYQA83v0OGP5PghlpVUy
         mrHkH+N/mSYQ0KFAt/vCn70j5am1Jzll/JHeCyfcpbcUyrawmeTwkR2S26+PXc4Ir0UF
         qDMXwQ1wBThfiG2KaIcAvmZzIGyIDYvJQXo8sbpaY/MBdW0bh9xOzYs96VqJxqa1SamC
         K2eJpm44MwUxIPfZYz7Z3GX13xO4NUPlFePTsUPA3FUgnkZSBgkyOXFrC+3EB9rdQyHO
         qy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=09DDMTCL89WNkhlv0C/7aoyscbDE7d0uzxBjD1ddd/k=;
        fh=EacSDEgH1hDtCMCLqCKgtwh3UgGCXVv34AYBIAaAgQg=;
        b=WzQdDNnXDHcBbstC1hVAi5dKlcs8BXxLR+NY60mED1HbyGyTlVCXktmjFUpCL2JCBL
         PmZEBu3+hFuvVMpY7wtXID7E5DfXKlV3EuzfJ/4Vip2/8wRyxXpV4gg95JRKjF9QlZKs
         MrH8y6SAGCZrLIqMVqpGt1ea6v0WpEvsPm5zmpYf/3werreLbaT2/ly5IjJrhNBTMqbN
         VF1ZQILZn1Jfx5Nmawj/fCgXoB8F/ZlQAIQGMYZsyDvSRQS74UmyTzeb42NxAhgQvFGJ
         r+b7/t4/FlFyxOEAW9kkHNXJB5+8Ave4ebfEHk08HJEW4L9+qnn9HXmvhIHIPfGUeeS2
         3lLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6kWYs6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a056214202300b00690c80b5da4si1039937qvf.140.2024.03.26.12.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 12:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6kWYs6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpCAW-0007Ep-C8; Tue, 26 Mar 2024 15:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rpCAV-0007Ea-4B
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 15:09:07 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rpCAS-0000jg-Pl
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 15:09:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1e0f0398553so9585385ad.3
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711480143; x=1712084943; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=09DDMTCL89WNkhlv0C/7aoyscbDE7d0uzxBjD1ddd/k=;
 b=w6kWYs6BaWY9E62pLN9tBjiCr4fv1kn1xG/hEdGJFxt00H4N7umrDFCqhAmtPyFz9D
 mnipeF9TKARvUI9/izEw9WJEJPzPw7uSSSxtx2C66ZnJELcQz4txZGkWsBOaCvKgX0+J
 qbnfOGIeVlazOBvqdBFTFDugFCKTpWewsBlxg04V6sGyFFdJDRevkZkmrdq0o28OtDdZ
 a4OIP4faNkEfPn80Z92RfjUac91viDJ/wXj79dOiEZTSiL3Iejc0gyCNFilyAaZujfKx
 kLoU+LOogzrY2Szl+khHdp0eyqQtALMfx+/tLyDY8m75Glo6XNNsiPsi6VFvWY0/M4ne
 CwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711480143; x=1712084943;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=09DDMTCL89WNkhlv0C/7aoyscbDE7d0uzxBjD1ddd/k=;
 b=ZOkL3oXJaLEkXjkUx7Fe1jJo+LEifNgdhTtu9/Slco1KEYjVr2lChPBiUDgOPjs491
 haI1ybAL47DV4U5loImdDwulnTRVg2hTZXa2C/94fg3HF2ksH6wltdZaX3d1LGC4kIfy
 OeUT4ei+pWWNzm7XNnoQKDPwSAE8QL9b4gcv1Z4sOGsmYIb/F86cgCEYDTUhk7rW33qL
 q3EoPDm5EPxzeiopyQS29EbjV0VJPYJHHekmnU0qPsXhIV727WVNbNqDsmJSE4iAMjlg
 Dp8pzHV+gB01/vikG6d9o/D0WGwqafUc5NYX+FiJSPwBPCh5zda1EmWSxedGGLAkTkL3
 9lSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzbJkhwCJTVuBZS9KEb+hiCGEJ9+ld85iPFxvLM9vMBbIN4AGKu8E3c+1JpU6Gq2FgzYXKZjcxLnesdUxqp+l52AIT
X-Gm-Message-State: AOJu0YzXWqyZNE8p24DxX/il/ogeHk5aOjeRGehZ3VFuV0qorPd9IIiK
 ckKgiRLJUDMq2+rdELCev4jNrpWL8BS20zJxEoBmpv5zP0WBc1fu2CZ0gnsDJPWQei1vQb+MsWQ
 n
X-Received: by 2002:a17:902:c94d:b0:1e0:c91d:4487 with SMTP id
 i13-20020a170902c94d00b001e0c91d4487mr6291838pla.43.1711480143180; 
 Tue, 26 Mar 2024 12:09:03 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b001deeac592absm7329747pll.180.2024.03.26.12.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 12:09:02 -0700 (PDT)
Message-ID: <8145a914-c820-4f89-950e-9086efbcad08@linaro.org>
Date: Tue, 26 Mar 2024 09:09:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 5/5] hw/arm/virt: Allow virt extensions with KVM
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 peter.maydell@linaro.org, maz@kernel.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
References: <20240326182345.326758-1-eric.auger@redhat.com>
 <20240326182345.326758-6-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240326182345.326758-6-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: RwESf17z8hv4

On 3/26/24 08:22, Eric Auger wrote:
> From: Haibo Xu<haibo.xu@linaro.org>
> 
> Up to now virt support on guest has been only supported with TCG.
> Now it becomes feasible to use it with KVM acceleration.
> 
> Also check only in-kernel GICv3 is used along with KVM EL2.
> 
> Signed-off-by: Haibo Xu<haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis<miguel.luis@oracle.com>
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - check gic version/in-kernel implementation when kvm el2 is set (Peter)
> 
> v1 -> v2:
> - fixed test ordering: virt && ((kvm && !kvm_el2) || hvf) [Richard]
> - tweeked the commit title & message
> ---
>   hw/arm/virt.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
