Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp324418njf;
        Fri, 30 Aug 2024 09:30:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJSfSmgvtmZtb7Xzn2K18iPY6zUKt//zbYFfiDLxoRP5ToGxw+/1xRWO5Ez4aZByn7V+E1tLMHP6h1lQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNb6CZFZcQs75atGwkonHtlYJIFLsLQdvMQfVgVkxbsCbSCM4MznytFfGuD6zixDPj6/UT
X-Received: by 2002:a05:6214:d83:b0:6bf:a3a6:e7ce with SMTP id 6a1803df08f44-6c33f3c9006mr94321726d6.26.1725035421363;
        Fri, 30 Aug 2024 09:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725035421; cv=none;
        d=google.com; s=arc-20160816;
        b=UD4nhc8rEP0Q7GvETfuvpaXPhfihVAAwvihCdRyuIUHCXs7AAAMMm4tSNcoEmkLs8e
         Osr0FTa7xbZv5J2h1VCIF3OexJJA1y2VQocrm0aYYtldR8xvLYRJZNysT06PkUnO0cbT
         OOW7wz2t/ehPIqHUbV4I424A4QQWD9kwNC+BfLIfyYEVGKVf2PAdXVmee5/lA+P4RGsA
         ZA0zAm6NwinVxCdsdLmsMOokp+mTLDoRkjVtXph5ckvGo69g1a346G3xmCgyP+bcH3+O
         Pj7iERX1ao62wfO3buqn4kLMcSEDLTR8FBGC949Bn2vmAia3+fBnzEfNkrniV0cLfBAf
         FU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=u+V31Mqg1iTS0y7T36ICG6IoXhl7dnQFm+0Bmu56rww=;
        fh=F253wKpH61ugzN7JgXlNEIQs31mR8MtSoUWT1NIfXgU=;
        b=STl8s/vopB3Kc2fJjunh7ORy/QfEfzi6mGqh1INMebJMgkYgpAwVKN+lnh1CHv71m2
         fGYpCp1RG1wrUIjrw+TDddRwfeP6NbqH4Y7QAVlYybaZSaScy8XKbu8w1Wa8/Pz1A6r4
         cjFiFJMLDCOR7D5QeCwXi5sI1bZFwD5zsUeq8SV6iJjlggKdTPzMh2tTE6rsQbyCaCRL
         MWzV9lat/Kgs+lNLIcsDvXwQaWrQWCHEboPJcWwW9ZEnLSF859cVXleTe446L7bnRqpm
         NibJegRo3ULmizsS+OsDcTqSDFy5XbN43Rdbq+Jny4ud9e0IO8hJwAAqiPVaIyglv//5
         K3Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSACRumx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340c89fb0si42944846d6.293.2024.08.30.09.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 09:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oSACRumx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sk4Vr-0004ID-2X; Fri, 30 Aug 2024 12:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk4Vp-0004HF-TR
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 12:30:13 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sk4Vo-0005T4-0W
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 12:30:13 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso3366109a12.1
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725035410; x=1725640210; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u+V31Mqg1iTS0y7T36ICG6IoXhl7dnQFm+0Bmu56rww=;
 b=oSACRumxKKp3jiQVhqG6DJxX6ZbXlPL6glXy842A/e7Ps494lTGriJ2IpXZCjMlDXq
 ITj5zzFHW2emOwpDeCM0du6TKAkeckeI+qZUTtMJACxbVB+IXwQVIuOByTv3PQ90JStU
 O1QYxJddoVgjh+635HWXY6NxqQUlDTkl2OXv9N8Q1cWG1P8WaDIH+cQggo8Earf7Z0/j
 FO0lPCxqt7rPTObuDFjjIrtrwE7z77r1r7pAN8vbxCLwvtn3WMYUxraYWnvhsCELVyfi
 8cy3+ZFazM1AE3B+ZzPVKq/NgYX+x2lMDWZGcmj+Pncy+Fjb2JXOUaTbE8bMMGZKCgNL
 2kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725035410; x=1725640210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+V31Mqg1iTS0y7T36ICG6IoXhl7dnQFm+0Bmu56rww=;
 b=HKJvaf3z5DbUg85RsrMsAho+urCfKWqNm5Q3KytuIty/GviqvFfnA83uDuMVahkMav
 S8T4/QrtUWfi/35rn8jccl636v7AG30LAecggF9Iu8BS3J/Im/w6WJT53/HkvZbi97Zg
 PvMTaJakYJ8Yq2oQ6VMGWa+nehbOPw+NJi0VqsjStulkSNGM2Socwc6R1z1ot8bEpT4N
 xuMVpm/23uVwt1YszeVK0d5flt+BnjyKfYOxpup/P0Uvwhlkx/jUoFvd2BpTueZMQukt
 tvfn5ug1+bDgbJ5g8cEw4WwrvzPY2qweQT4kaGWT0MrN3s139ljtfXj2mDYi+EyTwfmx
 hqmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmCqNPz7WWJXNhH4YXutdRYmMA3aPsn5peURbmTZTGQN7Gf/Rm/PGI8Ue3kxhTw2mzxTHBzb6Xaw==@nongnu.org
X-Gm-Message-State: AOJu0YwqbmH8d/z0dnqTycpw75XviMJo95nFvSfFeolZ5E4frmr49jj3
 zzXPgtJXm6EZQ6zXVvq76wG9GdA8RQ//5OaZq5SDdnkHMDv5KmtwR0Viuv/WG89Bnfo+GaH6/Z/
 A7vaC+F202N85bbamrX2DIKt+swflPf8T7JiIXw==
X-Received: by 2002:a05:6402:1d54:b0:5be:b4eb:e1de with SMTP id
 4fb4d7f45d1cf-5c2200de8a6mr7328273a12.1.1725035410151; Fri, 30 Aug 2024
 09:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240830161932.44-1-alireza.sanaee@huawei.com>
In-Reply-To: <20240830161932.44-1-alireza.sanaee@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Aug 2024 17:29:59 +0100
Message-ID: <CAFEAcA8d9SfCTSk02fg3C+t0mAQkanMPeYTahn0vWOOMnoCsAA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/tcg: refine cache descriptions with a wrapper
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, linuxarm@huawei.com, 
 richard.henderson@linaro.org, shameerali.kolothum.thodi@huawei.com, 
 Jonathan.Cameron@huawei.com, jiangkunkun@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: zGy6OL3r4UA1

On Fri, 30 Aug 2024 at 17:19, Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
>
> Add wrapper for different types of CPUs available in tcg to decribe
> caches. Two functions `make_ccsidr32` and `make_ccsidr64`
> describing descriptions. The 32 bit version receives extra parameters
> that became unknown later in 64 bit.
>
> For CCSIDR register, 32 bit version follows specification [1].
> Conversely, 64 bit version follows specification [2].
>
> [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> edition, https://developer.arm.com/documentation/ddi0406
> [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architecture,
> https://developer.arm.com/documentation/ddi0487/latest/

Could you explain in the commit message the reason for
making this change, please?

thanks
-- PMM
