Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9219C88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 18:40:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6Baw-0005uG-Gi; Mon, 14 Sep 2026 14:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6Baq-0005sX-Uh
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 14:39:53 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6Bap-0004EK-46
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 14:39:52 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-39b9184fa80so2589323a91.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 11:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789411189; x=1790015989; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IVzusJ89u+5300SYV7tOzlauq0FtY5j3SFhXmPaj7W0=;
 b=hzcEKvQaJMdMDK3T4fjmhVvrG8F1IplQE7q8KWwBV3Ek8EclNEw1EdgrsH75I6YHee
 O+IvfcdRlUXFGZL+NcaNXLFs8vYCgxkrYjwGPGxFlWloItQTGZx0lmTvxptmz6EGNKUp
 IOaQTBVoUat3XoGb3o8cA4OTeLT53WyUm/1sJi4JSDEmlR4aSSSbSsrMEgpPDaO5PB09
 5j8PaKud+aDJAS1+fQnaPARtsIYyzfLvydK4RBEFN3/jsUNxHDuIY/Aq2FHBS7sRC0eN
 f6WnoHFQgSWFVrY+EExJEw7JBqg/6L5zAMOoM0CjLZVHWopCDahbmWt6StVWozag+iSr
 Kemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789411189; x=1790015989;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IVzusJ89u+5300SYV7tOzlauq0FtY5j3SFhXmPaj7W0=;
 b=QGXPUL/823wwk739VALy+mNQmyu6/YUbFH93YIJWqDlwDtkCYXkhja3gRP+wcuSj4S
 tq7c91a2OayPodihruP6G4PBmk/xch+fUiONOnIBjhCKb2cYyMVbFXOsXECKsL/x4du2
 43hdXW6m0BZzvjMDF8RAtDBhZVvA7z0UKhnfvWqfizE8gvkci+HrRqOLK/WrxbradjjO
 uf5+0dsIYKDkhMYjoCn5GBE7nO7sKnO3PioHR27YkPoI863syu7p5hfyAgzId3Rd04FI
 tltZ8ROES+P1D/NCLm86x3LQ8FBbHOWa6aYBfs7vxkig636wTJjcKAL/VlgZEybePajx
 4Q3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfillDt4gJbKYxeIBUHbAB7O8sbr1J7fmlOZ2Rz2fTiOvC4X3q6rIgulB0Hg+JN6qr3W6SZZbHyQ==@nongnu.org
X-Gm-Message-State: AFuF++mRLkNeNgqrtdq+1PnvSLVtBk6Ajy66opiAob+loNtGYZ0tvHYP
 tMEKS2m+NpyHDQMQAJFHP6WuTOee67ARxmlHtxcgXZJdPbvSOlsSUKiBcKodGyxJKiI=
X-Gm-Gg: AYBFou3/NyQxSZSFw9BJWf7hLSALaZh/ksnd/Ngc8+KWUjXBl2Fj7Mu/d/a/66QnQ2l
 hcxmtehceY4I3LSzUt2qWNV49DwieU0JCQ1MAf4YmS7mqIcGtL6dnSkdSF7STdyFFJoeNuetBNY
 yETL9KPhyX+4R4uggWSBEoaSh3bZK61YGXnARrTvaQ/Tc3WC/KTWGGSiPHL5m+1BW/DVSFVXNRd
 EkgWyWqWj4qITMWSNcCzBNxjs6P1GlMP9e7hU9NsALH+afvThLB/1XAlKFbLLsk4mbOA1vkC4qG
 zjno5rtpYlSdFZ0NZQxTrfSQ82HCVBIVmz+8OokIroL/ySUx6Fo3vkawq7VBC6MfqsgUpvIb652
 sP6JT7EA+g9WBPIpgoZzIUKfF57YZZnzQCsvvsytL3Z6TalASHZgJ0vCnpiBRuP4D7H4eZcQmIQ
 EKfRT3H1BlRD5TnYYAD2l0wYfUbQY/KV3ShjTG30wgKtYlBqLDuA15E205jhlgGoq2HfKjaUTYh
 nTdWXxqdqpNzf9AHycp/8zW6GQJagLQiHUEeTPBmafbOi2f9Ex/XusaazcukA==
X-Received: by 2002:a17:90b:3e4f:b0:398:9be6:f997 with SMTP id
 98e67ed59e1d1-39dec0f7abamr8807665a91.22.1789411189184; 
 Mon, 14 Sep 2026 11:39:49 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:7164:7976:4c53:31bc?
 ([2603:800c:7900:ed00:7164:7976:4c53:31bc])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1438d1381c2sm522369c88.10.2026.09.14.11.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 11:39:48 -0700 (PDT)
Message-ID: <15c1d593-588a-4ab3-b438-a499cb719e7c@linaro.org>
Date: Mon, 14 Sep 2026 08:39:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
 <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
 <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
 <CAFEAcA_-UwXB9svLsFwJRfe37+CkwkRHnNVoWDScTEL=L4uOpw@mail.gmail.com>
 <72dd2ada-3b4d-4563-860a-86bf6c6a8a90@linaro.org>
 <CAFEAcA_7eYjtgXVidEMsG9ztZf1Zy8A4Qip_baSGxdNRQQKj6g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_7eYjtgXVidEMsG9ztZf1Zy8A4Qip_baSGxdNRQQKj6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/14/26 08:21, Peter Maydell wrote:
> On Mon, 14 Sept 2026 at 19:12, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/14/26 07:51, Peter Maydell wrote:
>>> On Mon, 14 Sept 2026 at 18:21, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> On 9/13/26 23:16, Peter Maydell wrote:
>>>>> On Thu, 6 Aug 2026 at 18:32, Richard Henderson
>>>>> <richard.henderson@linaro.org> wrote:
>>>>>>
>>>>>> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
>>>>>> within the range which are not explicitly listed.  Previously we chose
>>>>>> not to honor the TID3 bit.
>>>>>>
>>>>>> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
>>>>>> on these registers, so we might as well honor HCR_EL2.TID3 too.
>>>>>
>>>>> I thought we agreed not to change the behaviour here? Is this
>>>>> just a "forgot to update commit message" thing?
>>>> Oh, yes.  Because I did update the code to test for v8 in translate.c.
>>>
>>> So what does this patch do? Is it just a no-behaviour-change
>>> refactor so we have a place to add the SCR_EL3.TID3 check
>>> in the following patch ?
>> It does what it says on the tin -- it honors HCR_EL2.TID3 for undefined
>> registers.  We currently only do this via access_tid3 for defined registers.
> 
> But there aren't any genuinely UNDEFINED encodings in the TID3
> space, are there? The ID register space has to RES0, not UNDEF,
> for reserved encodings, and so we have cpreg structs for
> all the reserved encodings in the ID space.
Since we don't do this for all arm_cpreg_encoding_in_idspace(), I 
assumed that we didn't do it for all arm_cpreg_encoding_in_tid3() either.

Either that, or we have existing dead code testing 
arm_cpreg_encoding_in_idspace()?

I wonder if I should prove that either way with a test at startup...


r~

