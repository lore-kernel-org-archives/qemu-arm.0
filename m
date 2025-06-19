Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp262359njc;
        Thu, 19 Jun 2025 06:30:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5InYneE6pMMXYuuHAA56DoRuJU4krnFHfEmJwl6UpEmmjMpaalAglv5dOv4NmXviP1QBFC9MmX8sfcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGEwxCuMaNn4tVXycoWc208BgangDEzhhoAgSiV9+azm3BMF+81ORPUDXtCkMbT5XdM4aDK
X-Received: by 2002:a05:620a:1a92:b0:7c7:739d:5cea with SMTP id af79cd13be357-7d3c6cda0dcmr3260071485a.35.1750339808532;
        Thu, 19 Jun 2025 06:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750339808; cv=none;
        d=google.com; s=arc-20240605;
        b=Iampca+uBXuTvK2qPLDrl14kTS87eQjmZ/rvB8LKG+Ikx5dfmZZ0eNpQzrvj+ZuOj0
         +GLXODjZGRph7dDx2AUSQ7s7SgeowkAIT22E/uXCnBpHTE3dzvJZk20cud/1rTc1kgWM
         j2fGXhQbSIi8b8K1CTZNsPh8h6enRbmHou2XMfKXk2JG5VfIGY/NU0TH5Gnu1dyqIFQ+
         g25e0OAkWMW952ZeABe2xaqeWY8XkCM7eI83I/xbkfNwvjFb39QWg94Cmt8Ji4e5wbbf
         TBr8wYtfEWfbr43yGtXjykQ0FJsiwxLZga2MbObJWTyIQ2Psg3fKn7N7jzOE2nmxHdut
         g0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e369BF/P5W53C1UtTP1YWy+iGdArJRFsp4iZMuaoBdw=;
        fh=RJS1intwaYF8aKst8kgrY+YQxZJ0O+4o+ejml6ZjqJo=;
        b=akA+ZonuzQBjRYPg1Uf7DHAoTPoA90oHAgoleVvApndGZCJRurmJ8UEvKU/MGzvRCY
         BVnlHw0i4SfG9wIsDAmlMMl0G/i6EDy0dWH8D5JpaXtD9qY3FJE+siZBb+DFcj3/8P6k
         evcbCEk7vyIIVxP7BDsClktrdiw/MJNZdSTyfak3FKqCSE/V7SYCkHSlkvTSy64hxdvF
         +kbhKRfpe2VBxfxQz8tZRdxRgE5SAJ+GQaVZAohmFDFttdsCObltjTN1vJH3SE2e/7fU
         F9LKCbGpNxyTCt/lUCDS6PZ8UEoA//+VQOX6yULG3eBKNoyTS8Bq3JE+ovdqVbjymQpB
         JDVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2NFKipd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8eaa5desi1692662785a.262.2025.06.19.06.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 06:30:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2NFKipd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSFKt-0002kK-Ey; Thu, 19 Jun 2025 09:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSFKq-0002j4-Bw
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 09:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSFKn-0007Es-95
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 09:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750339779;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e369BF/P5W53C1UtTP1YWy+iGdArJRFsp4iZMuaoBdw=;
 b=f2NFKipdKeVgWHa5pOacpxIgNGebRe1G8oQ+s0IP45v6nt1jDAdPCWbrWcXF/GQDPRbcO8
 9xzoOldbSA5yWq0MUSdwlXGCz7lZM0Sq4NaQdIkaWcmQ/TPrlEGv3v7oYBE2ZgzcPsB5g8
 aKVV4GyClEMDGnZKhJEDOgaqL48R2bg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-2Zjsp0QPMpWK0yig30u7bA-1; Thu, 19 Jun 2025 09:29:38 -0400
X-MC-Unique: 2Zjsp0QPMpWK0yig30u7bA-1
X-Mimecast-MFC-AGG-ID: 2Zjsp0QPMpWK0yig30u7bA_1750339777
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43eed325461so5067245e9.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jun 2025 06:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750339777; x=1750944577;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e369BF/P5W53C1UtTP1YWy+iGdArJRFsp4iZMuaoBdw=;
 b=RHEq9PCjH8AnNOuM06n67V9DowymCV5zRbTDwiBK8iVg/0TFxR/D5ifsFDlcjfRw/N
 wRC36wyhseAfrflrXalftZIQ8xenebJ+8gVi82yXS4332q254lcJzxYKEv+h9Vq5std0
 m12vSgGB5K+lmYoJetdFXnf5iYlyQ4hGP2eERS3xmuZpRHqVZphF2O+U799ONOTnDU8Q
 t+zeIRwlF98aq0QDTeJvUprN6y/FDQfNmahIj0hvVH8vxGRVLP3gEuW8LiDrmOgysXJo
 SGRbJCYVsxM39n8pJRxGS/rND3HV8cWpTlcc09NLyTOQ2Qu5kg9sL8gCwYVbVKCTCsFV
 1+bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGFs5PVgQ5/++KfVJAazkLwieTsHyPQ8dwXSBYPVSREismeF9CkkBjcWlP5Vn4HUhG8HpRjZlMRw==@nongnu.org
X-Gm-Message-State: AOJu0YxmANSw3F9FAozUMjWfnVfRCzOAUw9U2nPVzoaO/IeKLvLJSrfL
 Ann7ZmWeE3UKR2CWXLdAdJ9XGL4Qino9LL0tPzY2SFjKcAA88dHJYGJwwbpL2GhMwCvS05U43o8
 wQ2hgoNAdeLH4yECo0Gh9uc6umKtzAkBfttZanbjq2EESKXw4BgT4bQ==
X-Gm-Gg: ASbGncugxKNgEQd1riSoGKaBfiqmeOsWAIuXv5u1C8LjaxWFrKXvfVYMkt/W0IfK3k5
 K/3UxcdnbFIb9eE1xIZIvxJ20+1++Pps8PI+1iXKdJaAtyeqBhkm57ggtd+YPISqqGPAZdf4T26
 mjFO2x2m2w47v3hCdNaAR/c77mmVXKjKZm+rrHreAd4fXCoosUA43ya+rTuSGbJCDQJKQOmkd78
 mL6EoPcf1S7ehA7sv2JQKZdtMO4Nu+1ZzYsvvByj/iCY/Dh2AvF/YmLeNLR1sTxessr5sG0gDL0
 KarsenF4qymOD4/11gLSyM6h0IXOZpSLe59QvIjQ9RX1D6KnvH54p76Iy4Krd/S4X6IFyg==
X-Received: by 2002:a05:600c:5396:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-4533cad1d17mr203936525e9.5.1750339776928; 
 Thu, 19 Jun 2025 06:29:36 -0700 (PDT)
X-Received: by 2002:a05:600c:5396:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-4533cad1d17mr203936245e9.5.1750339776423; 
 Thu, 19 Jun 2025 06:29:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45362b34f7esm6404805e9.25.2025.06.19.06.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 06:29:35 -0700 (PDT)
Message-ID: <01ab0b6e-ccd5-4465-98c0-70b8ec2ac87a@redhat.com>
Date: Thu, 19 Jun 2025 15:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] hw/arm/virt: Allow virt extensions with KVM
To: Miguel Luis <miguel.luis@oracle.com>
Cc: Alyssa Ross <hi@alyssa.is>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "gkulkarni@amperecomputing.com" <gkulkarni@amperecomputing.com>,
 "gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <20250527062534.1186004-6-eric.auger@redhat.com> <875xgutpuh.fsf@alyssa.is>
 <D3582F3A-B07A-4F05-827C-B030617B77EA@oracle.com>
 <efd4cb44-3d63-43b5-9568-1263ccf7566a@redhat.com>
 <0EA149E9-D637-4BC0-A10F-7B896581A914@oracle.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0EA149E9-D637-4BC0-A10F-7B896581A914@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGil4kncQehkKcSmrPTVyhOZGCUVB-E50A_Pap5Z2Nw_1750339777
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: aonCsbLjYA81

Hi,

On 6/17/25 5:50 PM, Miguel Luis wrote:
> Hi Eric,
>
>> On 17 Jun 2025, at 15:41, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>
>>
>> On 6/17/25 5:23 PM, Miguel Luis wrote:
>>> Hi Alyssa,
>>>
>>>> On 17 Jun 2025, at 14:17, Alyssa Ross <hi@alyssa.is> wrote:
>>>>
>>>> Eric Auger <eric.auger@redhat.com> writes:
>>>>
>>>>> From: Haibo Xu <haibo.xu@linaro.org>
>>>>>
>>>>> Up to now virt support on guest has been only supported with TCG.
>>>>> Now it becomes feasible to use it with KVM acceleration.
>>>>>
>>>>> Also check only in-kernel GICv3 is used along with KVM EL2.
>>>>>
>>>>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>>>>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Hi!  From what I can tell, this will produce an error on hosts that
>>>> don't support nested virtualization when QEMU is invoked with -accel
>>>> kvm:tcg
>>> I didn’t know '-acell kvm:tcg’ could be used as a fallback mechanism between
>>> acceleration modes. May I ask whether do you manage the ‘-cpu’ type for ‘-accel
>>> kvm:tcg’ with cpu ‘max’ ?
>> Does it exist?
>> qemu-system-aarch64: -accel kvm:tcg: invalid accelerator kvm:tcg
> Maybe Alyssa is referring to ‘-M virt,accel=kvm:tcg,virtualization=on,gic-version=3’ ?
>
> The above didn’t triggered any error. Anyhow if the above does what Alyssa’s saying 
> we would just be missing the check for || !tcg_enabled() in this patch, I believe.

After discussion with Paolo, the lack of the CAP should be detected
earlier in kvm_init/kvm_arch_init to allow the fallback to TCG.
in target/arm/kvm.c kvm_arch_init() some generic caps are checked but
none of them are related to machine settings and this code is virt arm
machine agnostic.

I checked and adding

    if (object_dynamic_cast(OBJECT(ms), TYPE_VIRT_MACHINE)) {
        VirtMachineState *vms = VIRT_MACHINE(ms);

        if (vms->virt && !kvm_arm_el2_supported()) {
            error_report("KVM does not support nested virtualization");
            ret = -EINVAL;
        }
    }

at the end of the function would do the job. But as I said previously
this is not done for other virt arm machine options that are accel
specific or require special KVM caps (secure, mte for instance) so it
would be a change in the approach.

As pointed out before fallback spirit was rather: "KVM isn't enabled"
than for "KVM doesn't support a specific feature".

Thanks

Eric




it's purely the first accelerator that says it can work
1:03
<https://redhat-internal.slack.com/archives/C04KFKV2SE9/p1750331005242709>
pbonzini
Where "can work" is only based on the host.


>
> Miguel
>
>> Alyssa, didn't you mean -accel kvm or --accel tcg
>>> But more importantly, is this what you’re referring to?
>>>
>>> Although,
>>>
>>>> -machine virtualization=on,
>>> should work for both '-accel kvm’ and ‘-accel tcg’.
>>>
>>>> but I don't think that's the ideal
>>>> behaviour.  It would make more sense for it to fall back to the first
>>>> permitted accel option that does support running the machine as
>>>> configured, so if hardware nested virtualization is not supported, it
>>>> should fall back to TCG.
>>>>
>>>> I maintain an OS development environment that includes scripts for
>>>> running images in QEMU, where running KVM on those images is a
>>>> requirement.  Currently, those scripts simply force TCG on aarch64.
>>>> With this change, to take advantage of KVM NV support, I'd have to try
>>>> to identify in the script whether NV would be supported.  QEMU would be
>>>> in a much better position to determine this and fall back to TCG if it's
>>>> unsupported, like how the -accel option with multiple values usually
>>>> works.
>>> Thanks,
>>> Miguel
>

