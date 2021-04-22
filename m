Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp940569lfb;
        Wed, 21 Apr 2021 18:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfGEv0yYQJN2K7NWkra0pFC2HeugFhCrlX4ou9X29TZAFpCiH6sznhfYR1Mq2EcGl6B36F
X-Received: by 2002:a92:cf50:: with SMTP id c16mr762812ilr.2.1619055698567;
        Wed, 21 Apr 2021 18:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619055698; cv=none;
        d=google.com; s=arc-20160816;
        b=hnepyWiWkHuj0UE/Lfxs4yuKcjrdTSolQA5b10rk8q6Hvt8iWks4yPjlP5fkdi6yNt
         rHo6KUCGxoujsZn64LAnG40h92gf/LmsZEXAbjp6gGi4s5ntS3E4YPRJSlxTvkuY4vBp
         i18fgD6FKiz6PjGymvxfg4KXdBjaYZsA78ENzOoKGcal9NtTuUFMZ6mWY4/cv5+/Wgqf
         e653B+HRuBybt5njhJPDiOGiSedtQSQkrrHsxgkiH68hP+Kim/lQUACVj/Lx4QpuK2iM
         CQ5rFBtEyvsLZ2C5UlmgARux6tf69C26uevccERBO2XN/H/sOcaLi0521jo+QZDjo1Sp
         mP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9QsFvqQTRAdULmCZfiXhkW8re5GC5pYqh7guL/J7+8Y=;
        b=ZnP3G1jDwzRWRgiEtBnjo3FTWP3MFPg1F0vf3ULjluuQz5LKpbgW+P5vZLv11datup
         NyKRwE8PzhiKa1nbS5URqORc9iAIPDAYGuFoZWjUzn02M1pXSw5m3+44kjhm0Y+cj8+p
         D2hVpH035oxCndSppQj5eL5paA6Xm+FicRRQwGYatfIOOeQKZIfUMnC+xilBu4FqPqaq
         XQ8qDIBBLvbUnRtnLsjApMztIBsKXffl3YgTtBSNmPEL5A1S3jSGvCsKLfBkX6ZrT4V2
         fVGTj2JpyEyrx+EizX4XHTVb8eFHDfbPhQHQ+3vxwmlkCC4sPeMFlBX3VuJFVGRUXrMa
         Z4ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xxaZPUKw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si1309290ilt.42.2021.04.21.18.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 18:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xxaZPUKw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZOLZ-0008Cx-Tw
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 21:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOL8-0008Aw-EP
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:41:10 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOL6-0004Ds-J0
 for qemu-arm@nongnu.org; Wed, 21 Apr 2021 21:41:10 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a12so30582423pfc.7
 for <qemu-arm@nongnu.org>; Wed, 21 Apr 2021 18:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9QsFvqQTRAdULmCZfiXhkW8re5GC5pYqh7guL/J7+8Y=;
 b=xxaZPUKwxh+BwdLTSgOgESPmpfr5YQXQmglP8icTfD1fX0SpR5/tJYCgFTs2ORZ0Jo
 eBjssDKuZpaNLLLLrxWce/op4OAPlnHgrdHIKWjC8dftgPhUPV+eMxhptlwaZ51gZBRs
 hMVl/mSjbv+8FGz+K6w6MicZnTgUXpao0HbvcA/sct8OQwFOXg7BQuNEAnknDvQ/a6OZ
 Ag1Ijkv5UQgvFvdTXfZsnp1NrRPvOyu6OkE6WwEhVqxCYgoncNd9n2WM7ZQpicCIQx12
 fRdJXFaM+vt4o642MTlAQMcRlkRLGcBps/NxSlEKaPCkMyW0+504+gY6LYnoKxkicbk5
 A7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QsFvqQTRAdULmCZfiXhkW8re5GC5pYqh7guL/J7+8Y=;
 b=p190vwmf/9uBH0GQpYHfpOF89yigc1v10fSs9pMJ6ZjNADdFSVnsLuFXzRFM5UrS9t
 4Udp9l2kkhSdO14hRgUhQQrrNnyt2PFRBv+T+wzzCEN5cZvjTRqWbKpIFCXhBpZUM28+
 KrcowFFWCJFGSNqnwKbZKxCR0Xzoea0IUvTuWQ6TSmi+cY/dHZyWbVOyXLklIhTwtl8U
 t4fugW5IM3y6+4+GZs1XSvOmM/mYCDpsm48ju7cx8b6My95UM3WdUB+nYrOYI8D9nISf
 uyyqzTZ5Lpl/vxL77pjLwS0/nZZkE2vvLELRthhXlt4zoSc2b4qIu1duXYtUZ/zoCYCA
 dN7w==
X-Gm-Message-State: AOAM530qzTVO/MCxSAYwUNoZcRTVsukS4NuLtgCtkGr6TD93fRyBpPUc
 ARA5mqn62bG7tTNhkvPX5Pq/lw==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr1017616pgp.338.1619055666964; 
 Wed, 21 Apr 2021 18:41:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a11sm412676pfg.124.2021.04.21.18.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:41:06 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] hw/arm/musicpal: Map flash using
 memory_region_add_subregion_aliased()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <28776805-7086-c2a1-6794-9d2cfc7dc684@linaro.org>
Date: Wed, 21 Apr 2021 18:41:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsxOu1+TQlq2

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> Instead of using a device specific feature for mapping the
> flash memory multiple times over a wider region, use the
> generic memory_region_add_subregion_aliased() helper.
> 
> There is no change in the memory layout:
> 
> - before:
> 
>    (qemu) info mtree
>    00000000fe000000-00000000ffffffff (prio 0, i/o): pflash
>      00000000fe000000-00000000fe7fffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
>      00000000fe800000-00000000feffffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff000000-00000000ff7fffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff800000-00000000ffffffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
> 
> - after:
> 
>    00000000fe000000-00000000ffffffff (prio 0, i/o): masked musicpal.flash [span of 8 MiB]
>      00000000fe000000-00000000fe7fffff (prio 0, romd): alias musicpal.flash [#0/4] @musicpal.flash 0000000000000000-00000000007fffff
>      00000000fe800000-00000000feffffff (prio 0, romd): alias musicpal.flash [#1/4] @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff000000-00000000ff7fffff (prio 0, romd): alias musicpal.flash [#2/4] @musicpal.flash 0000000000000000-00000000007fffff
>      00000000ff800000-00000000ffffffff (prio 0, romd): alias musicpal.flash [#3/4] @musicpal.flash 0000000000000000-00000000007fffff
> 
> Flatview is the same:
> 
>    (qemu) info mtree -f
>    FlatView #0
>     AS "memory", root: system
>     AS "cpu-memory-0", root: system
>     AS "emac-dma", root: system
>     Root memory region: system
>      00000000fe000000-00000000fe7fffff (prio 0, romd): musicpal.flash
>      00000000fe800000-00000000feffffff (prio 0, romd): musicpal.flash
>      00000000ff000000-00000000ff7fffff (prio 0, romd): musicpal.flash
>      00000000ff800000-00000000ffffffff (prio 0, romd): musicpal.flash
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
