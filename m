Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8E606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wlfwA27P
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSoS-00010X-RE; Thu, 29 Oct 2026 12:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMSoK-0000u6-Us
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:17:06 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMSoH-00013F-MQ
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:17:04 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-4a76f0cce5fso1080215fac.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290620; x=1793895420; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=h8mDuiS0d0rGPBJWHfJNxPhXCB6ASRYdU0JZKRE3iAg=;
 b=wlfwA27PR1HW5bSFs4KhXd9Nix10KnKRKTUhepMIJbxKz2slUlzVycyDcBE26rbZeE
 kn6jFReMyamFCb+LwnLaIPwiGKU8Ejfh7+o9zGOF4USUu+tRUHqSdUjatOJ/LgaOaGq1
 R7LxYLJQU+EisIX2Fe4aangSGfQMQ7Cuema6NmUZ+A+5vdUv5cvVBVd81VVqr3RFBHjK
 A5I0mx5FaVqk7H7I6rhavsneHBq+QNKWMSpXNotxns8GMcjrex+0jq/JyL71PZialcjt
 QLfPm7fRZBPLDyITbyiJnIJ3G65Wg+dbQjYb9xPD6ZQO6Xc+owkYTcxPqYnU9h39t8Zl
 bawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290620; x=1793895420;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=h8mDuiS0d0rGPBJWHfJNxPhXCB6ASRYdU0JZKRE3iAg=;
 b=MAYkCbHc29+I2pETnyiRQpyZWGqSPWRDQPUHzzkn9m36sTX16eXyrgO3FdjZP8O+PB
 GdvrAnowk/izPrJB8hhohqO46+pbVIpqIaeOl3xph574Osj0iB5O3p4/gQieEYRVahTD
 eebXvq7gYBcz+fPxJs5ilqvcrrknWP+ZHiJO6TvMxGcg3fbomDjnSmKC/rFMFbhJ0/Ct
 JQSwNw8XqqASLK1nJiae0z26UVUJ8Mj0iwi416rFNgB4Ez/nu6XcZojD1F6ElaFGplD4
 aPUjEOhXR5RD6O56YnqGdKl4N+ppmyULccDPAi67BaKv0464u0DtZtY30F9VZCpCALX0
 Pqkw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxpjr8QJbXCac8QBvawWQ0yAzsx2BgHW2aRZ96xUcTeubp8M59CyilfCO4RGEZelZSCzZpp9RNFYQ==@nongnu.org
X-Gm-Message-State: AFq9FYIuCFKKgD+cIR5kIY1NiyTkRj9cWlvTMNvqHjFyzwUmZa8muINr
 MgmhpHJ6q7o7/CA9ypSmueOUuS4sFuwefgQ2y8bCDfAczGozx9jpLVayjSnegt6Qzi8=
X-Gm-Gg: AYBFou0t91Hh+RSJcZPyH+TqgMmwHzYtMhptHRbjYiIZq1P47gq0++1R4Zd4ykgBqaG
 rAyrHFwU9sFjWfs0ICRlhPj4/Bi2bPSPijMWJjOh6MGLwcGDB2fqqApS220t4ynyBaguFPhw0qk
 jqtz7hhCRKIYHmlogPxk59ETDLr2Y0nkY7L9b6IbFKYQZ7tJ99BPc3XCCOJ5Nn0Kk8MPeKGoTQs
 BgIJ0uND+tpzZlpMehnTgu5Kxp8XcMVohod1VsTMjKV4w/rTCKhywRMFGKIlLWrcVe/PuIFFUdC
 voJRYq89TXCXCbcqw9uzRzA+0vtBWCmoNVJ6PsytBFYrdtVayKg4hdiDDhS7z6y2UWY6S3Bsozq
 H7cWAs/sBgdWb3u0GNSqPHI6rWon/xgstlL9gH4OBPdQQ+7CO9cg/KxxlY0Boq7wh4NFbtWLIkP
 sLEyxKULkUX1VVFIl4/WFI2PeCRjd4I29DWzS3Z11TYtMUrWSPNxkWHLI6HNnTy/GmANQVHgVv1
 UpmXpyi7BEWi2t5fmeDOaXkrpqKj2P9GaF4NUjWm73NI9ZBDUPXCdxIj2DfPVK847WPJBCnF3uw
 PI63Qsk+Uvt/2HpVPPt8odwQqbmGC0e8xoarihrq0f+P
X-Received: by 2002:a05:6870:8116:b0:498:f70a:b54e with SMTP id
 586e51a60fabf-4a8bb57e87bmr4486698fac.43.1793290620004; 
 Thu, 29 Oct 2026 09:17:00 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9022461bbsm236396fac.14.2026.10.29.09.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 09:16:59 -0700 (PDT)
Message-ID: <41e8449f-755f-4308-9b8f-256eed37db9d@linaro.org>
Date: Thu, 29 Oct 2026 11:16:56 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: hold bql when SEV sets the event_register
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261029161310.2065290-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 11:13, Alex Bennée wrote:
> There is a race in qemu_process_cpu_events and sleeping on halt_cond
> where we can miss the setting of the event_register which would cause
> arm_cpu_has_work to report we shouldn't sleep. As by definition the
> bql has to be held when we go to sleep against halt_cond guard the
> kicking of the cpus by the SEV helper with the BQL to ensure things
> are properly serialised.
> 
> The other places that set event_register are fine as they are either
> in the same vCPU context or are already serialised by the BQL.
> 
> Also use qemu_cond_wait_bql like the other halt_cond users.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4660
> Resolves:https://gitlab.com/qemu-project/qemu/-/work_items/4670
> Cc:qemu-stable@nongnu.org
> Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND for Cortex-M")
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - drop pointless cs assignment.
> ---
>   system/cpus.c              | 2 +-
>   target/arm/tcg/op_helper.c | 5 ++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

