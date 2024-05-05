Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1031301ejc;
        Sun, 5 May 2024 07:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2GxO4fdFwvC9bTMHLQ0IQrs8hFRSpnj6WGf1JH/XzEyZGkOQqM+Me1o6hwKNSMjpDSup7DboKiuy99SWSYrJn/CCaK9Ng
X-Google-Smtp-Source: AGHT+IHASkpey/3rl3htbpcohBR7uLj89frZzUzDiOjLhoWxgN6F7dkoBzRdOAtCihy53JixFPDJ
X-Received: by 2002:a05:6214:c84:b0:6a0:caba:7e2f with SMTP id r4-20020a0562140c8400b006a0caba7e2fmr10410850qvr.20.1714919581764;
        Sun, 05 May 2024 07:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714919581; cv=none;
        d=google.com; s=arc-20160816;
        b=RRctA7y6Cgm1W0JjrLHSlc1ZtuIMcPfVhW45OAcGC1s0ewKAZp2Q8MzRTjp4hCK1kH
         +x8/OSa/aHfUSPjYTkvX+pH05HCl7VwwnMG5TfEOscWrkCbwOBA7dkl2MgX5GyNGj2KR
         ThtXbKWUTv+Km7+SrAPNzKzUnVDqN4oWsjM+p6m7+Jt45o4OEBjSVf2gd5vY3tJwSnep
         Z/O4tqLXlha9Rq2HGDoiNCjMNzLCuEF6f48xSNKB2bkBmvivV5fntfJoRzVkHSm+6kPE
         1DN1bhZbxA5/firl5VVUxw76ajEipUd5StARUm9JFeUwMzjkZ9IJPDMES5cymiUCNJzH
         zGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :mime-version:date:dkim-signature:message-id;
        bh=VY+njysv1MdU4u1nHnnqJGdW72Ge39UFiDFeON+QGqE=;
        fh=y0vhzwoyUcuVxqWUGXwu/wXE0z0Iv9oKccE/qGoQbPI=;
        b=AR19F9pv6QkiegIv7ckS5vNvQNbNTt8gfWEH0ecgSDVqXV+stYTADSfbo9PQ5GA9CG
         lc5KXu1ou5eIOB6UARX/QmsM83gt0WcvuAD3oXFT+MzbEPwfx0ryeBd8vzG2KtXT9NDI
         w2zhfRKPz1hjCJ0aHqqowloAKqtASzpa3HpTuvGlGxfAOhkvdPs8NfgVF8HMIyd1Lj47
         P/CUsYTAKuZg5VEMKDyE7f39DEaag2y487BxumeJNr39HeGN4cKTfT40nYqnKJH8dkML
         9UyYq2nVSAf/Ynit4tb1gXGsRyihGqx3+M3ATauTlYMCctY7XbFMJ5FpydsPiY6au5sv
         SvhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=taJ5kOdk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt2-20020a05621427e200b006a0cb4e22e4si7231311qvb.153.2024.05.05.07.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 07:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=taJ5kOdk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3cuo-0003Ko-GO; Sun, 05 May 2024 10:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1s3cum-0003Jh-7i
 for qemu-arm@nongnu.org; Sun, 05 May 2024 10:32:32 -0400
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1s3cui-0002UP-K6
 for qemu-arm@nongnu.org; Sun, 05 May 2024 10:32:31 -0400
Message-ID: <960d6344-4aa5-4644-ba97-a06d21f4ead8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714919543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VY+njysv1MdU4u1nHnnqJGdW72Ge39UFiDFeON+QGqE=;
 b=taJ5kOdk2wl3oHJ8XlNRBIB/QtmTn9jYIKgmTYIaKOTNIEyB1/RBoYpuzOCNXYP7P0r7oi
 U7AnvcfyROoRjp0lA3/UKJhUggXT1et8mYL/ijzskc+wbJhGeYB/u/Lpn7ghgzTYS7pV7R
 A50jGzcXrBGpmyoBepbyUxQW/MQZNN8=
Date: Sun, 5 May 2024 22:31:54 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] hvf: arm: Fix encodings for ID_AA64PFR1_EL1 and debug
 System registers
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 wanghaibin.wang@huawei.com
References: <20240503153453.54389-1-zenghui.yu@linux.dev>
 <f0c19830-d4e0-4585-b960-7dd3fa1a3c76@csgraf.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <f0c19830-d4e0-4585-b960-7dd3fa1a3c76@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::b5;
 envelope-from=zenghui.yu@linux.dev; helo=out-181.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: WOd5uXtI0F5m

On 2024/5/5 21:18, Alexander Graf wrote:
> 
> On 03.05.24 19:34, Zenghui Yu wrote:
>> We wrongly encoded ID_AA64PFR1_EL1 using {3,0,0,4,2} in 
>> hvf_sreg_match[] so
>> we fail to get the expected ARMCPRegInfo from cp_regs hash table with the
>> wrong key.
>>
>> Fix it with the correct encoding {3,0,0,4,1}. With that fixed, the Linux
>> guest can properly detect FEAT_SSBS2 on my M1 HW.
>>
>> All DBG{B,W}{V,C}R_EL1 registers are also wrongly encoded with op0 == 14.
>> It happens to work because HVF_SYSREG(CRn, CRm, 14, op1, op2) equals to
>> HVF_SYSREG(CRn, CRm, 2, op1, op2), by definition. But we shouldn't 
>> rely on
>> it.
>>
>> Fixes: a1477da3ddeb ("hvf: Add Apple Silicon support")
>> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> 
> 
> Nice catch! Did you find them only because of functional issues or have 
> you taken an automated pass somehow to validate the sysreg definitions 
> are correct?

Neither, this was found by code inspection. I was just curious about how
VMM would interact with hypervisor to expose features to the guest. Docs
at https://developer.apple.com/documentation/hypervisor are not that
detailed (I may need to read further ;-) ).

P.S., I verified on M1 that ID_AA64PFR1_EL1 is 0x20 at
hvf_arm_get_host_cpu_features() stage and is overwritten as 0x0 later
w/o this patch, which indicates the (guest visible) feature ID registers
are "writable" to some extent.

> Reviewed-by: Alexander Graf <agraf@csgraf.de>

Thanks!

Zenghui
