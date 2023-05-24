Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2767254ejb;
        Wed, 24 May 2023 12:14:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4U8Mc3ohg/AhpXKEJEUd5ZjDTEpTopQ3RFUg7Ht48yYFsE8pSk8xx8STQbQVwqO2eA06Cj
X-Received: by 2002:ad4:5d49:0:b0:625:6cb3:a70d with SMTP id jk9-20020ad45d49000000b006256cb3a70dmr19778136qvb.46.1684955648489;
        Wed, 24 May 2023 12:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955648; cv=none;
        d=google.com; s=arc-20160816;
        b=QeyMa7dJluruS4Aswtb2roWrsMYAnt+GPFJUY7dWATz0QWQYpwxkIOF+EYzHplnC9D
         HEVJPxy57VutbbIBtvbXinv1LC68A9mDiEpiB3thcxemZei6hrFaBJvNg1nxpgKdM1SK
         OpspbXbBK+3eOtUQ36jgoUpq+P+ClmO/ZlUo7u1k6gKhukqWBXYVpxfMRIWyu8jpxLKH
         PAKQm/3XBZ/ZgvsPBSQQHl+wVvDFosbGBt7WuG/Cnd6HvOdxX/sQGNAlgT5jQGEB+d45
         IKe7M7LVmJDsBxgHcKPut8fmqSuKgY22VLApht9iDh7SiRjH6ydnUSFaZeNLD9HgRgK6
         OJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qHfEp2klZmBb7PNsQG4JzgBLwI/EcNiBY2ath1Mdl9Y=;
        b=cAoyFb2ihDS29FRXtsz07RC+WPX1RvnCS413l2W13vZcn7hle+BK3HFRMDaEv6s/K0
         eYVxB82pwpu6u1C81/zcXNmRMliQv3Q9xMJoD8rLzyEBGTU6dLQIM3ytlVwOnS9nCTK9
         wTQ6bhZeyyQCRVRvvfjjZ8pisGci0WIyZfpy8tVJRBfNF8vRwTjxGjd6pfnfsxsMDcR5
         5RGE1RH3KDnWLJHZAo8hnrl+uYiv8z82t0tdBfD2ckNR6OM+Be7I/B6PpcohLwl2MhMT
         pfDyazRFP1MgY372sJ3+pT234pFpogIIAXgTLnulSDgC6dbySf6R4OWbaAO+s8HbrAnv
         aVhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bw8avlx1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05621420c200b005ef5c2d41ccsi7393678qve.141.2023.05.24.12.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bw8avlx1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1tvI-0006x4-OK; Wed, 24 May 2023 15:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tvG-0006uH-Pu
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:13:22 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tvF-0000FX-Du
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:13:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5144a9c11c7so620766a12.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955600; x=1687547600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qHfEp2klZmBb7PNsQG4JzgBLwI/EcNiBY2ath1Mdl9Y=;
 b=Bw8avlx1CVD20RKHfLNEaTxlX1YXsXIH+7m5YHZQeiM0JUR2HAYYV5+vjttozfzLqZ
 TxXtxs8MOcxQxY3+6nsGFm3FwgNe0TDOZL1xG7yD3EkNItw4zsGts77s0YWy1DiPoCIa
 y0PWU4G4gZPm3zYY3t8VHZftVeywJlwx7iM9//3LocJtLww+ltyHMWVs3homW5Q365Cu
 bIlgshzZSkxoN7poBSjrGJoRnxfXBGcNeYHi7UIMVfCS5f+PHVkPxoA2nnWAJvSP7VR9
 YmiFT8KDYptuWklnay8lfNkZVfcxcPoeNXN/louVj79DHl0xMRjuWG4ILtd1BGAE6Yuj
 hgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955600; x=1687547600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qHfEp2klZmBb7PNsQG4JzgBLwI/EcNiBY2ath1Mdl9Y=;
 b=OQXLpvh5nBW0jFwdze76SgmR8i0xuVLghP5DDlVGEH7j1XtILwig2pFwD83V32voyr
 Hx/PelE82xT12wl06L+UVB9lkruHj4TxHDl4IeSgwxvXdBOVgMGetIwbFdXMdJOdYSmd
 aBt0rvl9m8OQCvyWv0HxXaPaIi5Urfhf1VMSmtToOY5lCd9LyQMTEgyxJT9IK9z3HARJ
 OViYjt1kc9lAXbAjlLSH8FRZns+K9pGH7uODbmag8vAXN/iiNMNrP9tr1hyPink7hMrh
 5w9ckr+DLPitbAXUyptHGcetlRQQz1RwJMWLX2hR4zUnZAMcvXRtsq+fHzWPwJCBEtVb
 rdtQ==
X-Gm-Message-State: AC+VfDy9/hVxVTko7tPdPuA2XxIfld0VRN8UK3mkO8j/FH5mcCiHRnDa
 tkQLX1pt0Mb/PeJQNNB0cL1RQbi7DF+dPHp6N+Q=
X-Received: by 2002:a17:902:da8b:b0:1af:a3d4:26e2 with SMTP id
 j11-20020a170902da8b00b001afa3d426e2mr15669061plx.54.1684955599814; 
 Wed, 24 May 2023 12:13:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 jh9-20020a170903328900b001a6f7744a27sm9144101plb.87.2023.05.24.12.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:13:19 -0700 (PDT)
Message-ID: <af1257b7-336a-20ba-9456-b11c36754f59@linaro.org>
Date: Wed, 24 May 2023 12:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/10] hw/arm/realview: Set MachineClass::default_nic in
 machine_class_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hzqbBU/uXcWQ

On 5/24/23 07:59, Philippe Mathieu-Daudé wrote:
> Mark the default NIC via the new MachineClass->default_nic setting
> so that the machine-defaults code in vl.c can decide whether the
> default NIC is usable or not (for example when compiling with the
> "--without-default-devices" configure switch).
> 
> Inspired-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
