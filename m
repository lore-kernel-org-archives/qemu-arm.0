Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp995974ejc;
        Sun, 5 May 2024 06:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ4L5fgNP2IV2Wf+QJybuANkUBMrzDNlmVfbHN4kGV4qk995W+wuN0KkeWkAHiaalLEBoirZhJnSLS4Hqy1Z1Frc2Fj6Bq
X-Google-Smtp-Source: AGHT+IGldulO+xV/LMz9yGvc63LBimnq6UlUwh+s6wLBEj1RZQV7DuxsRVzthOj3XJ85vJGc3Q0A
X-Received: by 2002:a05:620a:b0f:b0:790:7fe3:9fe1 with SMTP id t15-20020a05620a0b0f00b007907fe39fe1mr7584750qkg.68.1714915133251;
        Sun, 05 May 2024 06:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714915133; cv=none;
        d=google.com; s=arc-20160816;
        b=sHobeyvWMP/9kytNiryQW7hn6G1VigMp/L4Pjfeac1YUHU33ItvAQ7+OORcVepGBgv
         dSp13lGP241YC0ZCo0fNtSlCgn3RRvyFoDxnAiqFjA2gMrDVP0mLLLbqDI20fMCmiuFH
         kF8ZwQNJDiTZd3VSfCs6fhc5FTvRgwmT/3Gl/cPH/qXwlU50xSGtN/vcEs2gTvYnd0qV
         KVeiXsIWGHv5FjQhJ0x/qXsgEa4lgiGOzAMufoVy4Ttw9jyaHO99FF6+Wi7RP1VbN8yA
         PKqeJPDIsb/R1yCMpkAE9EQw1lYu91kmIWpSG8s5frpRG0PUdaP0eQz7/VaU+43fXP1V
         bvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=AcdjdGGZy7HDxEKvmS7fllnKZ3DC1KY+slPtpJ0Y3p4=;
        fh=W3RlGzdwgxK+lkEho0yo3aX48x0xirLbAzHIbhLrmXk=;
        b=CPLXSbK0RSjyTorQaI40S2zSQUxKnU6AwJu9gHH0DI+l8yL6gDeXqlD1OAeCIWyCyP
         jC6tjK86A9X7I430Ki63dOpHGT0knzQ5fLpMZ5ueHZcWqyqePFlZZBw3fqj2dkDmH41g
         3Fyv2z5mOs1q0tpMjtw0jooD311GAmTCp0+5yye18K/abjjRvbQkem8rU1sZ+/0u6F8Z
         YADYeIuCXmppk3ViAjK/CE54uXCsNWAcKKir8y4PL7rIoeeKmKQjPCJ+VXeVesVK6MtQ
         dOLzPlQYoIiYcDZHwJWh267bhcpfzTUsiYtfZL1wL0KCLSlzNwtEMylGj8vq1dVNygTt
         9I/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a05620a294700b0078ee989a2e8si7958845qkp.35.2024.05.05.06.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 06:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3bl9-0007r4-Km; Sun, 05 May 2024 09:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1s3bl7-0007qh-H9; Sun, 05 May 2024 09:18:29 -0400
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1s3bl5-0004Wf-5i; Sun, 05 May 2024 09:18:29 -0400
Received: from [192.168.106.118]
 (dynamic-095-118-089-140.95.118.pool.telefonica.de [95.118.89.140])
 by csgraf.de (Postfix) with ESMTPSA id 4193660805E3;
 Sun,  5 May 2024 15:18:20 +0200 (CEST)
Message-ID: <f0c19830-d4e0-4585-b960-7dd3fa1a3c76@csgraf.de>
Date: Sun, 5 May 2024 15:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvf: arm: Fix encodings for ID_AA64PFR1_EL1 and debug
 System registers
To: Zenghui Yu <zenghui.yu@linux.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, wanghaibin.wang@huawei.com
References: <20240503153453.54389-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20240503153453.54389-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qUIvXY1TWTv3


On 03.05.24 19:34, Zenghui Yu wrote:
> We wrongly encoded ID_AA64PFR1_EL1 using {3,0,0,4,2} in hvf_sreg_match[] so
> we fail to get the expected ARMCPRegInfo from cp_regs hash table with the
> wrong key.
>
> Fix it with the correct encoding {3,0,0,4,1}. With that fixed, the Linux
> guest can properly detect FEAT_SSBS2 on my M1 HW.
>
> All DBG{B,W}{V,C}R_EL1 registers are also wrongly encoded with op0 == 14.
> It happens to work because HVF_SYSREG(CRn, CRm, 14, op1, op2) equals to
> HVF_SYSREG(CRn, CRm, 2, op1, op2), by definition. But we shouldn't rely on
> it.
>
> Fixes: a1477da3ddeb ("hvf: Add Apple Silicon support")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>


Nice catch! Did you find them only because of functional issues or have 
you taken an automated pass somehow to validate the sysreg definitions 
are correct?

Reviewed-by: Alexander Graf <agraf@csgraf.de>


Alex


