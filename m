Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3808047ejc;
        Tue, 29 Aug 2023 10:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4JRWBurTabjHRKBP8yAoSbmCgIRgndYB/hNamxhZpsVwLk9k4avitFFMIIEO6HOVtqlOL
X-Received: by 2002:a67:f7c9:0:b0:44d:4a41:8948 with SMTP id a9-20020a67f7c9000000b0044d4a418948mr23677107vsp.2.1693328912466;
        Tue, 29 Aug 2023 10:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693328912; cv=none;
        d=google.com; s=arc-20160816;
        b=lzsJ/5mEuJ6bjk73mPPsLtu4Dh6g4k5XCzVpcrxlSn73oIwi2whysHulqg8Gpprxh1
         qd5dxm7/5OjcP1Nta0UOgS+pmXGAQm9HuWSLFHe9VTX2f8gkf+5mpGZY0wqeGu06AbT/
         UHPs7VfpJ1w9+ep2aHg77Jf++XfFSKrt8LipBzcIpA3XyXKukAesIUddEd3kdvSwApeH
         3KFsigDwofyaIR6uuYjQUO6s5fn7dFu8gBCndQQF6CI2L/uFC+XgD+kdpBHoZBFD8oPX
         BwMLYtwtlzgVFdu0zlePtyqy6l/LRZVvvKb1S+h8Iy8Y3UeWiyfpsobyza8Ed5ATgevb
         juaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HmKCeqvz50rZ/lp++bD9aEMD8tLeJlZdf7uYJMpTlc0=;
        fh=m6ro60Caf406s+3x8XRYfXkytlG/CXnsTlMqP0udiBw=;
        b=uureQ5ucnBJpaDT+uS65O7MnorMFKzZOARTFrxSl6pu9f3uZvRznYY56uTPeEqIjaK
         7BQ/A0y5YejDBBmEgB/N5cGDbcFN2jp9nBMseeN4C6shcNCun624tmM/kiaT3p+WBJu5
         A8QJIZ0FIoo6aGc/1jjesEMgd24sMMxhsX0PEa1jh3gzGUuXrq0UH3UsopKmuxvow806
         hmrlL2BKkJZcHADIfcV6+UO/bJ6Qc4e5d9nuJ+EJx8YJYUyYWuSVVKDXg1MjyIrLzce4
         6BnnP/OtYvqhUO716XufpMg3vb596HvUNJYHpdmf7w5/V1U1ModUAL0YvTsTtqBGMSZY
         mEIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkWASnZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a67b207000000b0044d46b289b5si932078vsf.345.2023.08.29.10.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 10:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkWASnZ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb2CI-0002GH-Cz; Tue, 29 Aug 2023 13:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2Bc-0001jy-AD
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:07:30 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2BX-0006TT-0K
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:07:27 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bf7a6509deso24143305ad.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328834; x=1693933634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HmKCeqvz50rZ/lp++bD9aEMD8tLeJlZdf7uYJMpTlc0=;
 b=gkWASnZ4939tsEN6L7fgC9n2XjcAkgSgLh1k+Pj/zVxQgqaV9IR5AUEOqyOv7ZQUT8
 DYD8U5qPsTmGsphS/ZiYpLGHXxA6RlpFEvb9RbhwwsPpuXxyihEn9yuMEbIIaR7X4XWW
 qtSQ4Afui3Tjz3g4Lo1Hq6v1+tXRCoOVzDgBHuAoIE4BXW7UHMRltL0erOptmPls8mnG
 Z90Ftk/H/4dc96pouc5iTXgio7WBoK9dUHCIOApJ+Qbsi6287HB4JVCS/7eVRdRVcxCr
 nue5NmgniU+eHAIJ+AqJb7yysmUDcg7sicpEPBYCM1xbRaeJTrpdMBUVKYdalcMFaTQi
 nbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328834; x=1693933634;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HmKCeqvz50rZ/lp++bD9aEMD8tLeJlZdf7uYJMpTlc0=;
 b=KsfBimEESgz0NyqW4XbC0OR3Iq7r8EQBkVizjxrhGudYxKj+1qZFpNCI1NZ82Css1t
 1LE3ATvHRV2roO8qyO32ubEjOWr9G1m1MommSRjyqsO7PwXFeKXPV008ATgdy083Ax4C
 Q0BhzZkcRWQoMmIE5O4uiiayzRLGAfW7es9WYvPLN8kdKv7oGQ/oFVmcXI4gX4EnTeDr
 2SpUwq4k3Y+9d0969UyrNSeTrYZ41DwVY7PIi9fxyajYrtcPuxyw4iXR+HK4kM4T8Ews
 qA+JJpWWdCX0fkbEoRnF9K8x6Kcbfy3ALfsH27nCALyof+g2CjuARaGRrxfiGY77c2cC
 3AFQ==
X-Gm-Message-State: AOJu0YyVmhRqGoIuDPaKs1YL8VmKPyTlECpeZLp8Bq9a9F7dPW36RTMD
 lmJ2UMYvUKZV3xqnWEpNvKLhRA==
X-Received: by 2002:a17:902:e546:b0:1bf:20dd:786b with SMTP id
 n6-20020a170902e54600b001bf20dd786bmr27985925plf.31.1693328833828; 
 Tue, 29 Aug 2023 10:07:13 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a170902ee9400b001bc676df6a9sm9600999pld.132.2023.08.29.10.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:07:13 -0700 (PDT)
Message-ID: <67e9f678-a27a-45ec-c660-2eacf1a29fd8@linaro.org>
Date: Tue, 29 Aug 2023 10:07:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 10/11] qemu/processor: Remove unused 'qemu/atomic.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: wzCM+Y0woygF

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/processor.h | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
