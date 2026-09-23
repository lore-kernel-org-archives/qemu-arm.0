Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C1C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Tno-0006Au-Cj; Wed, 23 Sep 2026 16:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Tnl-00069w-FJ
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:42:49 -0400
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Tnj-0005rM-UI
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:42:49 -0400
Received: by mail-pz2-x0d.google.com with SMTP id
 d2e1a72fcca58-85469f20513so817674b3a.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196166; x=1790800966; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MmWh0yzSusuFW16awIVZo3NtJcNpQMdUzGOiAOugz5U=;
 b=TvuoI0GRO5D4OEUt4d2eRkjq0kRDdZkRkspVFUVBPW0fH5BiN8UeiaM1P9opqHpDxl
 JpvPP9pA40pXZJfkbr22avFnUIXcdbG5x914QMPLtXI01Q+BaHaGPtfseQBfpl64c+JW
 AZ2zf0MnOaUueMJJhzFe4D6mDwvOvSOMm8x2yOC9vNugB+jE8j3NkQISShbQLoE3SLwB
 cVy3vT/g8CBNIUs8CnN3ziPolMzkGhvnvaxjSiCMsGTjED0mVuJ92qj+GUU9GLcvLRnU
 IedQPuE2k7EFDUVbm1yo8P4oK6mZyetGo5Eea5cwJMqIXpviFcUwteG7p0yZC++RjRVp
 3Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196166; x=1790800966;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MmWh0yzSusuFW16awIVZo3NtJcNpQMdUzGOiAOugz5U=;
 b=1LJknNGgVS6+Y2D9RMRyIwgpPB1905ILE8CyzEptGQu2mGU0MjDpuFdAYul8Gme62r
 XkepKVfUibMlzwML9afg6fed1Pj08LPT1rl74H6kBcyE4alThTPYXEiIQWHGdtFEuuEe
 O8pVBrGpFu1KJ7E8oeCL+k7vY/zpJKe/xuWubBPccQrucDn1jYTiQOrkiSvO74P8Vxrh
 7meOqJK8qj9G1dN2r+lqjBDpHvARbJYvE+GSA2+wIDSe6CCRbsxbFXqLMlU+Zu40zMy+
 /HQiGjnXKx44WGaNnEGBap1NbiMqJrkP5OCSlML6ocSt0Rw7cQaGHr+P4176jHuKq9ih
 96qQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLk3pUabqxaxUL3NUwUXIUD5i2lMa/YpWqNTZ6NmTXOr74l6hFHZrIcxVD8Zytw5/3IQhbyX8zuw==@nongnu.org
X-Gm-Message-State: AFuF++mmiEbBknPrfVpq+dFzchHOapZ3CcwgLTdrfshFSDQSR/IMz5yr
 XacoqdB9pFIbpQkClrpCEhXnPaGawqHHeMqBI0fDm1s3gK6m5h6ZWfD0y5P+5dYJfV4=
X-Gm-Gg: AYBFou3UJJ6h0GGER0qJu6sfRnPnFqcbYAozb9ZdubRZp8ZTqpigI6IFaL0lpuLbtId
 q2WPign1ZUyP6bMehilmG+wstFiDePztPusxLe9/bmb4r6neMzRNDdpo53piss9ixmHyxM/v+B0
 zcIZ+RAg/m49XsYavZr1CLXBz0nFkHZC7ET4MCQFPNMpmzhVEuqtPQ+rMK+r3eKeVddqnOFSpxF
 /ualegXpKUxOmHzP1ls0lZ1+8J2JqzNuAyqGK+PM/jQE8bB9+CarGaa+v4SbJzaLLBoLoA4ofIB
 M0XMSnPgHAuQhhnPPfURxsARFZT4EZfned95W3f2uxjUadHmblN5QOxOSwyNct3HMydAsLfmhEa
 32zjk+bESBypNYmB6yGJiONiuXWy1zdGPvoOsdWCITpfyoyhgiAEkgH9WO7pUzxEmd1Rd0diHTT
 xGJ3aVFVIKXD8LJ7r+gdI/L10+98LSBnFD+y+0sERvD+7m73UmfJCdlBq8ZXNDShEIckSMBepGk
 LCUW2eeh3Gwllg32iY3USvKnT3Lx1PlCdqYqWhsoDRlQM/UsHtb
X-Received: by 2002:a05:6a00:bb91:b0:872:6004:f117 with SMTP id
 d2e1a72fcca58-87e9957399bmr290925b3a.24.1790196166050; 
 Wed, 23 Sep 2026 13:42:46 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1cfbfd6esm1816578b3a.20.2026.09.23.13.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:42:45 -0700 (PDT)
Message-ID: <4ca867a6-8ea5-4ae6-8428-c4f58b36d3c9@linaro.org>
Date: Wed, 23 Sep 2026 13:42:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] target/arm: Add a debug check that all sysregs are
 migrated
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/7/26 06:02, Peter Maydell wrote:
> We mark some sysregs with ARM_CP_ALIAS (either manually or
> automatically) to indicate that they are accessing underlying guest
> CPU state whose migration and reset is handled by some other
> register.  (For example, typically we make the 32-bit view of a
> register an alias and handle migration for the 64-bit view.)
> 
> Add a debug check that we actually do handle the migration elsewhere:
> for every sysreg in the hashtable (i.e.  which might be visible to
> the guest), check that some register in the migration list has a
> field offset that matches.  This isn't perfect but it can catch some
> bugs.  In particular it did fire for the various secure banked
> registers that we were not migrating before the fixes in the previous
> patches.
> 
> Because the check is more of a debugging aid than something I'm
> confident will never produce a false-positive report for some niche
> combination of CPU and machine options, we only do it for debug
> builds, and make it a warning printed to the user rather than an
> assertion failure.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 121 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 121 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

