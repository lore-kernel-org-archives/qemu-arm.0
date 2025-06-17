Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2597358njc;
        Tue, 17 Jun 2025 08:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbWBmuT1husGhImn9zpxoRpSV3Fiycja+Tdp+5J+qLKXiNbf605iAiloqsVZRdSytLjXaay3zcdQm3Gw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDvua1d91ndavbAtEeMNQ/0JaYH//Ro9FoI3RtBzI6BlD68iGVuZNUU3KAZy/k/r/gZQcb
X-Received: by 2002:a05:6214:f0a:b0:6fb:17a:c428 with SMTP id 6a1803df08f44-6fb47791754mr224125056d6.16.1750174380784;
        Tue, 17 Jun 2025 08:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750174380; cv=none;
        d=google.com; s=arc-20240605;
        b=hEhXG8bXlQS1FYOoHWvsbuVg1/wNB7U4xaf9KNXa/u1BK4ILde50DJPnlQrV6FnzhU
         wGYSlSsrfbbH7NgoolS2KjxmxQ2eTKdgKPnJ+ZgqYePaUzJ0aWfyz5Tr47V9BIrwXTeF
         vdvoFKj/P0Fr8DaKWoYDFqeGdSENJNQy7cho53XwnNrq+4x8SQANchnUA8dtXfnKxJ6x
         SZ4RyqICSWt4DSv4VtXQdQlYLVxJwmZ+6bodtDDBbtftd3dtQkOnVp8mzjz65ZWRxGp4
         xYBedYkrcfpfkdVauh3rAe5TKq0BBOLbiZ/M7GbXEDKprk0rAlkl+GIuPh/1p5uJzGKA
         O2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ssC0ToNZSsFUgX/YNPCV7KnTvzwfgw9hctupgvZqXoM=;
        fh=5QoqfpWykYMBNN49kUFe+IXy3tOOtv/k3DJ0Fe6TugI=;
        b=ajnENryLGJhJ/FookQBNCEUojzyCcVdgHsTI2obyjePix0ZWc+Drb7FnumiEY6oO+R
         TyC3WRj/IEpAK+i6wH2fJtinFFoKe/8Q5+aeLcHQcutcSmEMyifwAA8njQp4mflY+jOa
         WZa4tIosDwifmfGHBKnxtT0rr0b6UQG8OHglanI4dfGwgK+OlA/+UK+r0JVcHDbJrgKL
         Gk/4Hp0MwdsCurK1iY81FNCZUHpPADZ0SfWBS/rwEW5//+Pw5ju1niCD/INlC9O9lj1K
         0AKfvH8NqPwATTevALCytDvk7HKPtSQ6ARK5lR1GIyNIQOFBauN+yQPbMcMsaJx+lsaE
         f11g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LKDMo+XK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35c2f62bsi129604276d6.425.2025.06.17.08.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 08:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LKDMo+XK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRYIv-0002GQ-VK; Tue, 17 Jun 2025 11:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRYI6-00015x-N4
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 11:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRXxS-0008JH-Sk
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 11:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750173041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssC0ToNZSsFUgX/YNPCV7KnTvzwfgw9hctupgvZqXoM=;
 b=LKDMo+XKVLcMzUydU/xMCQZ4dwQIzI89YvYpQIBVSXW1ghVnZdh8d0R0s9mzoY7QhC0z1U
 An1UCdTVzd9vBmFEaizlg7tlOa9idJ8Mku534lTI8I8rY3Uas4BctqEpkJt/5Vt68639/K
 w0atb6WofJ38sNEqc+1nqrZET0lxuhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-heFs-RDnNoq8j3BbL1SaSQ-1; Tue, 17 Jun 2025 11:10:39 -0400
X-MC-Unique: heFs-RDnNoq8j3BbL1SaSQ-1
X-Mimecast-MFC-AGG-ID: heFs-RDnNoq8j3BbL1SaSQ_1750173038
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a578958000so1161157f8f.3
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 08:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750173038; x=1750777838;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ssC0ToNZSsFUgX/YNPCV7KnTvzwfgw9hctupgvZqXoM=;
 b=areSKF9MgZULXaoeZjru9S04TdMMD452438m1N3RDjrM0yt1GdNluoU1TjKE+GgBR6
 r1/oHQFUMTYeP9b7B/RtfMpzMnOis69WBmT/I689mVc1Ach71QwMkj1cefdy+7lk7931
 y/ki7ZItMlWvjEY7S/4Ok8c9rQiuf3aoYS+POsBJgKEtQHvbyO1aYO2PhPGy5KAnsuU1
 VNIUr75hG7Ncu3LC3PTBOsQXnZd7j557MXgu5gBeos36xKSQJMGV2nnVViAhouY7miXY
 scZzlu3b8xSHUwlmfD+kva+X/6t71hdZzxGidLPLozoYShl3NzvtcGaa65RzCoXGqoIt
 09pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUVgVvE8K4Xr55SFrP022lcOG3W306I/h06EiQvYkGdMxclMi4se1Nsa7VOGcb9j5RwgRjV+BzBQ==@nongnu.org
X-Gm-Message-State: AOJu0YwkLzNN9nTfbWv8DZh3FKzfOHnkhEwoZwbbgHej7BcuEt8xXUZe
 ddcG6tcAroQs/8lwHe7r0ckYiYkhADuVx34lGZqYtkgMGglPPBBs9alyBMUyE+oXbNnyHtdkpQz
 iKE1q4paTyrfPjTeRBWl12NjsHFwOzG1Y/UcUgnanMYiIzZEEMRQHJw==
X-Gm-Gg: ASbGnctmj5CVbZNMSRgj0yrLu4Qd43GsDEt03RN6+Ja6N3Zv15DRlrrLLZxe5m7M8lp
 uO512/z8hH9fsOzr9XGjindtUndcHiHdW49+mgqBoKv0tnIL2djRdcdXL5l89jVxyESoT2fFH+5
 fxRB22/Ot4H9jzHHPwbhjj3/9vJNC55GtBBjDmmGqOxxpSZwR2pugA28hZUpA5ge0QfRRBwDFq1
 pOS5BRLCuaH3GK9YgtvJ32aU+sA/gdOfORRbvqk2tKqceNptS1i1f5LgOAccxGveUxsB03TLcX3
 g7xwVePy5768FqQn7Rv4xf6RCMv4hWd2zAYvA2cgorqAayhg1jjEmAjFROg24f2isDvTdw==
X-Received: by 2002:a5d:64ce:0:b0:3a3:6b07:20a1 with SMTP id
 ffacd0b85a97d-3a572e8c1dfmr9690424f8f.40.1750173038341; 
 Tue, 17 Jun 2025 08:10:38 -0700 (PDT)
X-Received: by 2002:a5d:64ce:0:b0:3a3:6b07:20a1 with SMTP id
 ffacd0b85a97d-3a572e8c1dfmr9690384f8f.40.1750173037881; 
 Tue, 17 Jun 2025 08:10:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54af6sm14125442f8f.6.2025.06.17.08.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 08:10:37 -0700 (PDT)
Message-ID: <8c4a62d2-6590-4177-8ccd-7e3520611fe7@redhat.com>
Date: Tue, 17 Jun 2025 17:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] hw/arm/virt: Allow virt extensions with KVM
To: Alyssa Ross <hi@alyssa.is>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <20250527062534.1186004-6-eric.auger@redhat.com> <875xgutpuh.fsf@alyssa.is>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <875xgutpuh.fsf@alyssa.is>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aBg81aAvsNu1Tcdqj6Y7UMQ_n0Vl0ds53ctcxuxEZHg_1750173038
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.89,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: oRqs/+Gl1Siv

Hi Alyssa,

On 6/17/25 4:17 PM, Alyssa Ross wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> From: Haibo Xu <haibo.xu@linaro.org>
>>
>> Up to now virt support on guest has been only supported with TCG.
>> Now it becomes feasible to use it with KVM acceleration.
>>
>> Also check only in-kernel GICv3 is used along with KVM EL2.
>>
>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Hi!  From what I can tell, this will produce an error on hosts that
> don't support nested virtualization when QEMU is invoked with -accel
> kvm:tcg -machine virtualization=on, but I don't think that's the ideal
> behaviour.  It would make more sense for it to fall back to the first
> permitted accel option that does support running the machine as
> configured, so if hardware nested virtualization is not supported, it
> should fall back to TCG.

Hum I think I misundertood your point.
I guess you meant you get "qemu-system-aarch64: mach-virt: KVM does not
support providing Virtualization extensions to the guest CPU" which
sounds the usual behavior of qemu in case we attempt to run a feature on
a host that does not support it.


>
> I maintain an OS development environment that includes scripts for
> running images in QEMU, where running KVM on those images is a
> requirement.  Currently, those scripts simply force TCG on aarch64.
> With this change, to take advantage of KVM NV support, I'd have to try
> to identify in the script whether NV would be supported.  QEMU would be
> in a much better position to determine this and fall back to TCG if it's
> unsupported, like how the -accel option with multiple values usually
> works.
Switching to another accel mode is a policy that is not implemented by
qemu. There is no such situation where qemu would switch from kvm accel
mode to TCG. You need to implement this policy in your test env I think

Thanks

Eric

