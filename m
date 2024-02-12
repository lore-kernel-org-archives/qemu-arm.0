Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp41999ejb;
        Mon, 12 Feb 2024 09:15:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP5Tm/2Gp7Pr2CVKojChWKZCSbwh7wlGWda/FAazVfopA7m1QqSoxuRLZ2hu1VJTmo8tTP
X-Received: by 2002:a05:6870:970a:b0:214:a070:cba6 with SMTP id n10-20020a056870970a00b00214a070cba6mr6477539oaq.49.1707758131490;
        Mon, 12 Feb 2024 09:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707758131; cv=none;
        d=google.com; s=arc-20160816;
        b=I5vq8JNkXPuhjWPk61B7LDAho9iISp2/ZimBUsAmpYpAOfsi95U5o0sJLOypDC1/M3
         N3kdxhT/WQXKyS5N0ebYh39b12gusYXwljXKWS0zsJojh4h+4NKvfgmKnnDuATYv11Rk
         NcteCLAx3R+nNN45vEASSuVAmevPOeIsZn6Bd3xxChspL7Xp0+60pK4YLvVbauwyQmyW
         FEDuJ5MFBohVj0DeucYP4YMQER5WIrrMR8FYNj8laNzpSQxChP6WtbA/i8csfxkJPQZ9
         nW1dbORo5a3BBFm7Tx+n03rEZlhbD4WS+C5uhxiBPZK9fK6tL/SywhTE3tBR+0j2nrjh
         9NUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1aKF/HMrRXJ6nv8MtrkX73O6B4O3fdyhzmK/h1hu+24=;
        fh=2kJY6PjP+Sh3f3IULpQ53CXLkgE73Bmqk/duwTrOFMM=;
        b=pwc7k46OxpfxRvfd4lMwbhg/OpMewq6DVhFvAprwTzty81cMe734SWlRrjbAN73p4V
         I2lqtE6FRe2nda20ZD6L58ErnJU8v0l1rnB7e8DOMeb5tW0Yz3lPZoDMx5zVlzXen/LJ
         4hUfSW2ckpDU3AAmXSRCsDQkhfiXDpEtjPIc/933IySLSQRznq6GteH5HJOnUSAzNoWt
         3QWYyw1UH0cZwc3Zmy0s0cAXEGXMFHIIb05W9LZbrU8E/0mt1PRM17pBwYbKkjy1Rkpe
         GGRinNNZmcQiUygzCP14u0YB2wrOBUCWuwTmX9nioA4WBr8F4ynSUKW8Jp5Gtu8ZTuvx
         2kxA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDKrQ7PP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXLwICHWFClY/ky1dp5MbFRPSvQRMkkpNw7jvYzwlghuHN7dIwRRgz0guyt559hKTdcuR6Nc9+bA78neM5CD4+XH5dzLPRb
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020ac86609000000b0042c4cfa2936si714951qtp.678.2024.02.12.09.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Feb 2024 09:15:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bDKrQ7PP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZZts-0000MG-SB; Mon, 12 Feb 2024 12:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZZtq-0000LO-Ua
 for qemu-arm@nongnu.org; Mon, 12 Feb 2024 12:15:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZZtp-00053N-CW
 for qemu-arm@nongnu.org; Mon, 12 Feb 2024 12:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707758117;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aKF/HMrRXJ6nv8MtrkX73O6B4O3fdyhzmK/h1hu+24=;
 b=bDKrQ7PPjtQcZnU1d5UxA30FIFjc+ZX/GnRnBcMeVo5n1XNMB8pxaTro9WPq4KqH4G5dGa
 tpbuqlKHdQF52crVwgM/a/YGBbHv/yG/1kdlE1rMdCrcpQwkMM8KGnaaHSOpCh+6bnZkEo
 rh6WZNM1dvZ8sclIftomF++s6zhiLc8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-fIhEnYUsOzmZgYBiJT4OQw-1; Mon, 12 Feb 2024 12:15:14 -0500
X-MC-Unique: fIhEnYUsOzmZgYBiJT4OQw-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6e0ab5dbe7cso2258853b3a.1
 for <qemu-arm@nongnu.org>; Mon, 12 Feb 2024 09:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707758113; x=1708362913;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1aKF/HMrRXJ6nv8MtrkX73O6B4O3fdyhzmK/h1hu+24=;
 b=lu6zygH3ZokpVtCDTell85XvxP8PRCD9y1tsSTs6+Tm5AvHQp2emPXxreawej6AjQv
 vsBV/f11RNcR5/w5A2zAicV3xu3KtN+x3l8SGf7jM2eTDaTPyTtB5M7jZ+npXfNGf9OD
 aysC5wNvbWKfKSyBha3bASUPTCrLBeHxXI74a/DN1XR4yxY0TYkYaUggjQbTf+mCnoEP
 ZIQUiZrZTmRZwc7e6rCz8NbtFyUitC9QgJw4NT7F8+sbWTxz9UqN3xTyqagqerQVNUuK
 L7xCyHEZLupvqeABM3oJSZZ03qV+bkcK2d1k3XIgL+dw85WPSgByi2r7JEc7tsc1MKAD
 57OA==
X-Gm-Message-State: AOJu0Ywp3T4/k4PR1iBpVzoOAPaXPGwOfpLnxoePxkRKbb6yMOp679tP
 NPkTHtE/wvUGpAZ4ho4oQ7VkmeVHgSsRavUva0hNifJZCEpJ+yfHD5FX+vW24jawkpFNc+/3gv0
 DchGXCdLxpM5HxE4+/ZCpEqmgTTbQvxPbi4ZZwfLsbirYdgj5VQ==
X-Received: by 2002:a05:6a00:84b:b0:6e0:e172:6088 with SMTP id
 q11-20020a056a00084b00b006e0e1726088mr4168405pfk.1.1707758113168; 
 Mon, 12 Feb 2024 09:15:13 -0800 (PST)
X-Received: by 2002:a05:6a00:84b:b0:6e0:e172:6088 with SMTP id
 q11-20020a056a00084b00b006e0e1726088mr4168381pfk.1.1707758112855; 
 Mon, 12 Feb 2024 09:15:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX3BcyoBhFN1tk4C3oK2bL6GFFYP3kY6JzF7aOAP48SWCm/JGokwgOiXMJAQMj6chXYF7ovcKTQJrTxBKFeyfw/DN5DvnWZ9JezySY2ryDYHAfzBEPzScZx2WL71cbXDqRwL+9sZU0C11XwG6tGW3qLkPLGk1jjbk0VCEciN4kPW6wqMmutl/TQA2AGJOU0Fazvm20AnEL9ClWFUMOwKo3PineqDPJDSUNPqGGzJFZSSUIC00UZizj4GsT/Y7Jmg/rhe75efe5bxpuu93Km/ThjB6z6jQ==
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a62e412000000b006e03ab56acbsm5751329pfh.217.2024.02.12.09.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 09:15:12 -0800 (PST)
Message-ID: <9e83352e-a643-4df6-849b-ac28ab119200@redhat.com>
Date: Mon, 12 Feb 2024 18:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/5] ARM Nested Virt Support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org,
 maz@kernel.org, gkulkarni@amperecomputing.com
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <CAFEAcA_SFtmCCFBPwWjJF3uygdpdqoZuYLaQQP186fyQ+dJEHA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_SFtmCCFBPwWjJF3uygdpdqoZuYLaQQP186fyQ+dJEHA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: er+GmZLT+WUR

Hi Peter,

On 2/9/24 19:57, Peter Maydell wrote:
> On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>> This series adds ARM Nested Virtualization support in KVM mode.
>> This is a respin of previous contributions from Miguel [1] and Haibo [2].
>>
>> This was tested with Marc's v11 [3] on Ampere HW with fedora L1 guest and
>> L2 guests booted without EDK2. However it does not work yet with
>> EDK2 but it looks unrelated to this qemu integration (host hard lockups).
>>
>> The host needs to be booted with "kvm-arm.mode=nested" option and
>> qemu needs to be invoked with :
>>
>> -machine virt,virtualization=on
>>
>> There is a known issue with hosts supporting SVE. Kernel does not support both
>> SVE and NV2 and the current qemu integration has an issue with the
>> scratch_host_vcpu startup because both are enabled if exposed by the kernel.
>> This is independent on whether sve is disabled on the command line. Unfortunately
>> I lost access to the HW that expose that issue so I couldn't fix it in this
>> version.
> You can probably repro that by running the whole setup under
> QEMU's FEAT_NV emulation, which will be able to give you a CPU
> with both FEAT_NV and SVE.

indeed, this should work now we have FEAT_NV.
>
> Personally I think that this is a kernel missing-feature that
> should really be fixed as part of getting the kernel patches
> upstreamed. There's no cause to force every userspace VMM to
> develop extra complications for this.
yes maybe this will be fixed later on.

Thanks!

Eric

>
> thanks
> -- PMM
>

