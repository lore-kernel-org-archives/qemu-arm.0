Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD91EE20AA
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 14:32:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voMsb-0004fm-GX; Fri, 06 Feb 2026 09:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMsT-0004eY-Gf
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:32:09 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMsR-0003Wf-O4
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:32:09 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79628fb5c05so1267397b3.2
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 06:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770388326; cv=none;
 d=google.com; s=arc-20240605;
 b=kyGB9WyudgwxOj0NwfzwsU4h2zjCk0hr9F5ULBUrvqgfZRmv7LF0vsWuCkTHcpqw9Z
 5N1iOep4gSQyhTipLmrkaIc8Hepm/rD2btTOkzPzM+lnTFdc1gdfN1IzdhDHhnWjFRhc
 uv0l6kUy1tmuGD+tbjA1tp4CygTIIAoEtEbG5s2ewyMXRF2SQIcIw0bI74Yq51Ik6uBb
 Pp60kC01ihaDxLat+A51M4BK/hFBjlcub/Z29IRUWSwzj4EaRC3vZQO/g1v2scfbmTAF
 bM/I7gtZhfXjloU4Yr/vGd3NuJgemzxNmvzhXhndqwGHScHLbfoW6Kcs5Wy8bc//dBdV
 kvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3c4cqJf+Jqq89aF7aXU+qGYsMH4oDK0uvPrEZwt7xhQ=;
 fh=P0p6wC+i/AxSEO1tztdpQ5T1I7nDpmqeS5kHViD6H4o=;
 b=hefDhZ5UYubJ06PPZrAGraCNx6ZqjEdfIGf3R+h4d/qTvTQpZGjq2tT2fcO/Kkb4/K
 5TMk7a3/tarljvMlAht7LtafG3VzDDBVS8ZLpkwby+Z/ld+3q4NvLb5loK877vlLEkcC
 t7qsBaTbP2ThS40mGg6XlPycBPAuXjifJh1xog32KzRQX8yzlPwbJlVFdk6WLOJXyFlI
 4D7Jt4OKxx271+gwCRomoVeXmozG8kbihWYnjJRSjtEkVp+eKcw5uv/4oJFGVExvavtU
 kdxj/sPNO9S98FoVDGzGjXesyTpSv9ThpSrC5IpT6cWTbBgOwMUDiQJJLlNZ81+T/PEu
 xrKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770388326; x=1770993126; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3c4cqJf+Jqq89aF7aXU+qGYsMH4oDK0uvPrEZwt7xhQ=;
 b=pjDVInh9977wuF+zuuKoNOe1XgH33ZiND53dPjycAK2HEbNDhJDhGFwBHxO8Qj1/6G
 soF96Zp/F9IGzAEhQGJIVG1SJCfX9h9a7FnUzVhiYLisTQEQDT1M9ZcfUzBrjcE9aRX+
 6OXOfP2FFUd8tDcXJaFBreukH4gZk4wmcNEdZ8jpwpk1NEg2nCowN09ynnggCLdmgKNL
 +YXwnF8BytCJuGVddO7Miw0CAf3Y26AxxZUROIuFXr7iXulX3Nxrx4Je3VYcXEtZBA9D
 gGtc4mb9JorHQjdQjgQcGc6krde7bdd7X251umMgTdIQu9e+N3FxY1mfTAsMdghY40Aw
 ThEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770388326; x=1770993126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3c4cqJf+Jqq89aF7aXU+qGYsMH4oDK0uvPrEZwt7xhQ=;
 b=twAGIpCi7TzVI0TURy4jhhINqgAiL5yxZkAYIG0k4L8coT7Gs4mLyG28laI4uXzmhW
 nfdl8lyK5u/WU/WiL/d0EdsC4Gq7SOr2//SwGTBVd9ZIymKZhAT7WVp2mLnJZOFVwxGm
 PsH8OSO4u2F2bRz+8LzIK9fPqi9ktFF4zy6IuEJQLKh27u8r1AyJENPGd10pym/jIbWg
 3gpdRNd27aBD0BWVfbHc5ylgM+OcQrZuDkAss6V+w6wfFQEPP+wn0bXEZKQEHWR0IWi5
 gmYoc+yxcmz5dp30HjlwnMcjWvrSkprGUsVSiZZfFH0upA/PVGq0RswHI0Ec7ZQo5vFE
 IZPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX3/LRWwQvNP+amgCEFfaEofMKFHtaYMYQJe4o+PE1E8ZsnreiXkmOPTj5j1b0ciEZSUL6/MXbmg==@nongnu.org
X-Gm-Message-State: AOJu0YzsooSTcvE6mHj4w1XEXwW6Vmnymkt1pyGEqvI3b4sPzBu4Dugn
 Vv985Avw2RxspjjiQA0ZBv1nP95Use7M7rG4rydecyfe5t+rIog5oUzQFsdat4HDGriWyLjQV97
 PsjtT6wkQXk7oGG4Yczi9qL+svmlA06KVFYVLI/vOfw==
X-Gm-Gg: AZuq6aJNULQZeiNgoCdw5vKDwriWA7KVyNfYTLDVunLpygxByextWsf25pXKYbgBOcL
 U+Z0tEVdPFoFCQlVPK0KyYF2BprUy3WHE/UFELqRScRiSIvmJfp7edbKJ4OjX/JaKmtbwF8I/4S
 Z1lAyqrsOg92afDv0MoHNO3l7nCyvW/euVt0CXCbZ/5EVoOMndSWOhcXDvA3fYi+2u8KaEolj1I
 9X3/QLo+EesQM0+vfo+Wpbz/0MSSTYORlP8ym80Jq47WfQfCne02o7KUHCaPkWXP5ia5gjJ3LKv
 IC8cWEqmNmkgxrNw67g8vLKJn1UJggDtHKxzyxCiqlypmz4/rNBd1Qk=
X-Received: by 2002:a05:690c:e3cd:b0:794:d0b5:eb1d with SMTP id
 00721157ae682-7952ab28c1bmr30396717b3.38.1770388325795; Fri, 06 Feb 2026
 06:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <20260126165445.3033335-3-eric.auger@redhat.com>
In-Reply-To: <20260126165445.3033335-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 14:31:43 +0000
X-Gm-Features: AZwV_Qid22u4ndtGlycMMLE5Xbum__hbxHsBRjfco78PYHHyOhqBVkyr1ArhgK0
Message-ID: <CAFEAcA8dVLEa9gJ6y=hP94ZZtcNQemRawpfyWo1kLusBdy25kw@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] target/arm/machine: Improve traces on register
 mismatch during migration
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
 gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Mon, 26 Jan 2026 at 16:55, Eric Auger <eric.auger@redhat.com> wrote:
>
> Currently when the number of KVM registers exposed by the source is
> larger than the one exposed on the destination, the migration fails
> with: "failed to load cpu:cpreg_vmstate_array_len"
>
> This gives no information about which registers are causing the trouble.
>
> This patch reworks the target/arm/machine code so that it becomes
> able to handle an input stream with a larger set of registers than
> the destination and print useful information about which registers
> are causing the trouble. The migration outcome is unchanged:
> - unexpected registers still will fail the migration
> - missing ones are printed but will not fail the migration, as done today.

Improving the diagnostics here is a great idea.

> The input stream can contain MAX_CPREG_VMSTATE_ANOMALIES(10) extra
> registers compared to what exists on the target.
>
> If there are more registers we will still hit the previous
> "load cpu:cpreg_vmstate_array_len" error.
>
> At most, MAX_CPREG_VMSTATE_ANOMALIES missing registers
> and MAX_CPREG_VMSTATE_ANOMALIES unexpected registers are printed.
>
> Example:
>
> qemu-system-aarch64: kvm_arm_cpu_post_load Missing register in input stream: 0 0x6030000000160003 fw feat reg 3
> qemu-system-aarch64: kvm_arm_cpu_post_load Unexpected register in input stream: 0 0x603000000013c103 op0:3 op1:0 crn:2 crm:0 op2:3
> qemu-system-aarch64: kvm_arm_cpu_post_load Unexpected register in input stream: 1 0x603000000013c512 op0:3 op1:0 crn:10 crm:2 op2:2
> qemu-system-aarch64: kvm_arm_cpu_post_load Unexpected register in input stream: 2 0x603000000013c513 op0:3 op1:0 crn:10 crm:2 op2:3
> qemu-system-aarch64: error while loading state for instance 0x0 of device 'cpu'
> qemu-system-aarch64: load of migration failed: Operation not permitted
>
> With TCG there is no user friendly formatting of the faulting
> register indexes as with KVM. However the 2 added trace points
> help to identify the culprit indexes.

Could we move kvm_print_register_name() out of kvm.c and into
somewhere that the TCG code can use it? (I did think when I
was reviewing the patch that added that that we might want it
for TCG too eventually.)

> @@ -990,7 +991,13 @@ static int cpu_pre_load(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
>      CPUARMState *env = &cpu->env;
> +    int arraylen = cpu->cpreg_vmstate_array_len + MAX_CPREG_VMSTATE_ANOMALIES;
>
> +    cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
> +                                         arraylen);
> +    cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
> +                                        arraylen);
> +    cpu->cpreg_vmstate_array_len = arraylen;

It seems a bit odd to extend these on cpu_pre_load, especially
since it means we'll do so on every cpu_pre_load call, which I
think can happen if you try an inbound migration, it fails, and
then you retry it.

I think it ought to be possible to both avoid this reallocation
and the problem noted in the commit message where more than 10
extra registers results in an unhelpful message, if we can
convert the vmstate fields from VMSTATE_VARRAY_INT32 to
VMSTATE_VARRAY_INT32_ALLOC. (That latter doesn't exist yet but
will be the INT32 equivalent of VMSTATE_VARRAY_UINT32_ALLOC.)

If I have read the code correctly, these should work by
having the inbound migration code allocate the buffer for the
array data instead of expecting it to be pre-allocated -- that
means our post_load function can look at all the data it got
without imposing a length limitation.

I think (but we should check :-)) that the data in the migration
stream is the same in both cases, so this will not be a compat break.

(Some existing code will need adjustment to avoid a memory leak,
e.g. g_free any existing array in pre_load.)

thanks
-- PMM

