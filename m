Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76572606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HbRe3J/7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMRGJ-0006Cf-9T; Thu, 29 Oct 2026 10:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMRGI-0006CK-Ia
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:37:50 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMRGG-0007Md-SZ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:37:50 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b0d126f631so23159437b3.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284667; cv=none;
 d=google.com; s=arc-20260327;
 b=Go5qLAsNy5UYcfDBwXzvfpzGa3BQ9V31dqm50pT3u6lrN8Byrcp94uXMciVxzRW5c5
 /L14CyUwGnVQ5PVRegEByzTV5NuXyOibpWcghd0eLg0Pbf93olGUevX/7G6vkK94fSSs
 8UaBhuWudNYipLqkxJ9GTxvv7rkAvwPDPb4Uc85VOwCnu2aakodEH4PzKI/kfoYMZqQw
 EJSeiTmoxPz6TBiMVYAhR1AfEt3xl63vJKoZcdLL5U84JnHFw7nTD2byzyQ9XD4rkF3R
 ms7U2TcpJutHVYMXWlD83dT7+gf7vToL16dCKOUWyyb7KCWUMMvfaYDp0+e2bBmvazOF
 AGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EJu8JaOtMVyjxhYmH6az1U+IMB+/mqpM4Q2vtHCT9mc=;
 fh=mTMA5rsMYcHXM72uXD92PEYZoNGf1nAlue8kHgOOyDU=;
 b=A+0xg0Y1G+0xXVNboK8cgtTRtb+4T9fKTLP4Zw0L41UMmLj5BihC68EEAgW/r/XMIj
 N48/LF1B7XU8aGjoxJLN5H4zBFiAYzQaVsKGJI1TadEs472Nn24wqUTrMrgZ6owApIG8
 y6DdMbz2XQaEljM2oRwEmfxifXvbwd82YqVY+Ow8WkajpXKpfBUzPIYsi6Vjt81Cxom4
 4t6Hjw9eRWE67clwvwrqOG+Pijbn5ZijEkYRFRWaJ2jrl1bqPWFZP8fPqZ43rC3lzEqM
 mI66QVoEudbrmIBpd/f2E3luOE8rhiTNZ1aptglllzxUHrxOsyc0IsmXjmzlahx+phFX
 IP5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793284667; x=1793889467; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EJu8JaOtMVyjxhYmH6az1U+IMB+/mqpM4Q2vtHCT9mc=;
 b=HbRe3J/7Yrki0e2/C6KQm+WyKzFpB3vhHtuGYKmHpRZLiNh2mMZ1EIYgVU/o6I8nG/
 yJrKrSprIXHnoEllV4FAhbL+wwGA02K/gqnXKLCx8IKZDIih4y2tGQcdVS2AIuDrZ1ve
 zmS6vsfrACc907jq1BhqdseLQojPesmjL/ErJ2A7jtzN4/IdZJV1PxPKHAch3RF1zSpp
 8v+TA2fu1GFGxrJr+rjfgchztK2gZNiawS390wmc23vMi4fTO913JRMA25LEI1GwrXwO
 Fd43QHYlNZcjCzqIVEr6q97245Czxb3SfI32Uy56PSQAIQQwPNZXd77tYe6Rpuz/pQo4
 cuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793284667; x=1793889467;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EJu8JaOtMVyjxhYmH6az1U+IMB+/mqpM4Q2vtHCT9mc=;
 b=0nn2oqMad8W9oUcTRH1lQ7kCrqLoJkbRRl4adJPhHaH74G7gaOjDG6EtxhvLHQXZZr
 N1SF5LWsOMJv5zLhwpZ73hzHF64KezWchi7f/0MTIgt9gaGTS+b7Uoh+pn7Rq/PnOdRv
 6XI5dgM+pRQprNKsl6qWCwzbgjlSkePLt3PiMoUgQzEkQ9hHeAiRCTBeAziUxB42QMr1
 APg9E5EpUXCMg7t+5DED9Js0pQ+VNol0oVJwsW7nPBWD/Ri4BsU2N5iMvLqr10KNvE+j
 iQZWvUqYUfQ6QUPIvVtimkpju/8ohZIz2tshzew244XmSs4iZQN1lR093G9gqwXNfuF4
 JkmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1wxlWcgB+ur/y2CYIZy5RwYs2ljuZXuf7kLImiy/j3ZB0R6w2oI5OHI/RL5s5/5whGEwZglf8OA==@nongnu.org
X-Gm-Message-State: AFq9FYIyjyTXPh8GoTCuRw+FjycHLwaI6M72mPb5vFMbeNVucKNHrpr+
 6Aae7vKVWVPgP8pFp1i4zeCukLtj2xkcILKjPnDMQofjLvstF5cVjO8m0NN9hVcyUiNc0qdQnUx
 tJWWYKO8uMZKrKPnkukEnJ8HTShH6s2Ez93hR5V6dAQ==
X-Gm-Gg: AYBFou0/AB5cNuAB4Rb6rhY+0v7rs5I3gMNVsTAH95wHKVQ2jHWEymGnF7dpt7KgbGE
 hLTuaop7LgMvQjhaSZNIEro7Kyl569BlXCqOjzUUFHy9OHkMad5Il/Kyp55EWgmONKkM0hlc1PE
 18oTazJZpCl7OSauQRVJt+gq4fB+j9uysRnTLe+VOGzhPJfbN4b2Iqf8aTSvIx7OdVVoIDLb7rW
 JINryWtVOcw0XVKV5+ZHpLBfCDw6nNg1lFPVUn3BArWg4FFqm/oKQ/cRQ4mNfF2WRfm82KjbURU
 g+HRl7/NLCh/c5GTnZDFIAOlczDFevwpA5Gl//60su8QUv6RqaExsfFrjyCMzrhwsWzxYfQqIgD
 Qpv6nyn6olNUzZoTlGlSSCw7A3DJGX5P6yVqEYUsIHhgzaCfuWJVgZkzO4nGgDg56nfmeFr9BNJ
 d2gOr8YQueQkYSG6vfgiHVxlLDTgWcwp1xZQbY6iTxig==
X-Received: by 2002:a05:690c:4dc5:20b0:88e:edf8:e375 with SMTP id
 00721157ae682-8b1b599b9a9mr35676977b3.5.1793284667333; Thu, 29 Oct 2026
 07:37:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-6-eric.auger@redhat.com>
In-Reply-To: <20261029092307.281287-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 14:37:35 +0000
X-Gm-Features: AclHuK8kyLtiydSZILjWZ_u10MgbnyFmTUzVOtrq1CQu5UG3yEW5DFvGmmRXkcM
Message-ID: <CAFEAcA-v2s39f5n0b+9ZD4QHd5irxUwqzUfsYUb8x0GTqU_z4Q@mail.gmail.com>
Subject: Re: [PATCH for-11.2 5/9] target/arm/kvm: Pass an error handle to
 kvm_arm_create_scratch_host_vcpu
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, armbru@redhat.com, mbawa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 09:23, Eric Auger <eric.auger@redhat.com> wrote:
>
> This allows to report a precise error message if any error occurs.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>



> @@ -371,7 +377,8 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          features |= 1ULL << ARM_FEATURE_PMU;
>      }
>
> -    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init)) {
> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, &init, &local_err)) {
> +        error_report_err(local_err);
>          return;
>      }

This isn't supposed to report an error here. The caller of
this function is kvm_arm_set_cpu_features_from_host(), which
sets cpu->host_cpu_probe_failed for any failures. That is
later checked by arm_cpu_realizefn(), which reports either
that you didn't use an accelerator type you should have or else
the rather vague "Failed to retrieve host CPU features".

If you want to make that more specific, I think you need to save
that more specific error information instead of the plain
boolean host_cpu_probe_failed, so you have it in arm_cpu_realizefn
where you can report it up.

> @@ -2653,8 +2660,10 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
>  void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
>  {
>      int fdarray[3];
> +    Error *local_err = NULL;
>
> -    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
> +    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL, &local_err)) {
> +        error_report_err(local_err);
>          return;
>      }

The only caller of arm_gic_cap_kvm_probe() is qmp_query_gic_capabilities(),
which has an Error parameter. So here we should be passing the error
up to it to report, not reporting it locally.

thanks
-- PMM

