Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0833C4451B
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 09:18:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlk9B-00050s-Di; Mon, 20 Jul 2026 05:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wlk9A-000505-HL
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 05:18:48 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wlk99-0007UD-9J
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 05:18:48 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-664db84f074so13041260d50.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 02:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784539125; cv=none;
 d=google.com; s=arc-20260327;
 b=hZZqf2Pfed7fD7DnijMF8KqhEmVfoTvcM1SsccmRGn5m4m9LT9kNNU8xymaegyRsC0
 0QTp2f73sHhyqR6yZ1O6lufKB1eeLVIwdIUhnUqNAlgC+4a5r0Q5Zqzl972jANx/32sp
 b8eMllT8EA9CXLqm5Cj361uO6k0pymUOAahy++uCgSc4IPB5elJMTqMeZg/RV1LcfbmR
 h4NwIp5laBJSC2/tdSqo04X21T7aCHxdMEK4B5O5aQEV+QHY3JZ4F3o+z59UL8RIN96z
 KnyaBJz6D8rxwl/+Vq4qsXblPXPVwuGAq/iDyhaHw/Oydyg/vIzpS6tZWRlIrmIxTGhT
 EoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hFV1MBgS1ENnbxAOD1Dw8oIeg/DLN9gXGUzu8Crw3gY=;
 fh=16xZWZ4iy0msoqOr3r2U0A4OjzFp/VZ89ASYk54+Vw4=;
 b=MA5A/BZQlw8POoVv+Z541nTC/kXTouiUVn9TlSc4xgavBsiP146j2jcz164T4KiKQP
 qWnbR8094wpKwfaPOjtDz2GjcFmfixUJoAk8M44nil/xPgE21dQmJaHvW2f3Crzx9IKs
 M/jbo1Q5rxnYAwSx51h9NPUBxulie9wvIrJs6IaIFiE6okMmDrm2LxKz5w/zVBzGIUvG
 rcIZeOyXGe1BrS0cvnjGpaQ2kErxsOg7FSbZJcThgooZWhHa/jkX+yGAigWkcHzGXmLm
 LPvyP1j8bguGaygxRlHKT/oZ1Zm7seGiPyDPkntQ7tdwMLGDg0rnyRAXWXcF/eo9oRQ3
 KhTg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784539125; x=1785143925; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hFV1MBgS1ENnbxAOD1Dw8oIeg/DLN9gXGUzu8Crw3gY=;
 b=lTeL67AB5lG1zDywe6N3OKVMedQcBAGG0cYqJ7zhGn8OSBBfIzqUWKfvMI0KjpAgoM
 ZTJpDqCZpY2GaIos8GWMM+RwlIy2fart1PZxqnzucik44GLJ25tEMMhZT7GLT2bj76ws
 KpIO+wdY1jSUbWL2wRYbyJfEHU4lK20Q7v2WhjxE+CcbxMcgQ81jZoNbzgB7thF6F33M
 u+TPj/AK32/kJgi+CIUukB7wtAQ35Z71YcgtAjWV5aP4CDHFAtW9aBbdrT18BYgeyes1
 8O7f8S1LHSBVs57pPTNktbRkYN7fIgJ7TLwrh+H/+8D+wHHWEhUevj3SS7zIWFlxZXth
 98JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784539125; x=1785143925;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hFV1MBgS1ENnbxAOD1Dw8oIeg/DLN9gXGUzu8Crw3gY=;
 b=O/NWtM4vR1PUr/kX4bH9gLu0dgPOT4LrSR5bkhmMu4NtWNxsMV7xk9IGeOm5NQuOaI
 4SJJdBCxPAZgJllVfjAzbl26Uc+wqSCphwkp6/bvUylHzlI/XPtWTU1lbG7wcP8JNtAw
 t1pJ1eBGu+20NqG+m6Wm7GxRkpznW3+qKuG1wWj06WlEd3qliyiQjJWAwwztGvYmvi8E
 /r2bxFWsmW1rwoZ2PVg+0H+ITiwRPzgYWB61D5smi2uWAxjIvujxm4vZdIkUf7664qBA
 JiJq+b9GttNW87zLVf7O9N9EN7yBWDg9JeYwFlBzS3vDXdEFkgHcNdWhwGv03afCrbNr
 Lz/A==
X-Forwarded-Encrypted: i=1;
 AHgh+RolAr9iWZPd51FHfk8+PL6Xj2jYs0mzO0mB4gbgMCJDRlFxUXhSFQg3j2s97VLDK7Sd8jyH6Fflhg==@nongnu.org
X-Gm-Message-State: AOJu0YxqsVXNbQB23ISO70MhxlHfq9QMbspYefx1cBD4xZjHUGxrHHRF
 iYBEdk5PmDjYZ1OvUhObFJWz3A2x5Zu43PUOOgQpLGogXA7dMiCayoCdkzxvBcteBk5S8QHch2v
 ySdzKSqGwkfY3N5oeW8o7mZif1wkhgydEXmmVX4xeTw==
X-Gm-Gg: AR+sD13K0ylZXRANOqmsMV4QgUPUzxGxOatRMy2DyTFzKrnHjDnDUOtj1dkReU6e8kU
 cIoLt6ZUxQpKPXYy44xVffeRrWbTbA30XTjRs4wPajLJGZDUPIjJFOrN2RorziE9ZmLZIXOn9t0
 HSw2Fpr3oai1aVUOcncah8uE/D6ceidyXpDiki4E0TbQNWxN5E1OUyETnGi0mpj8vkNgXQstbxp
 RiEFX4rYUC3QVxZ0WhrMrwNKCD+DotyIcjbZ5dwJ1cIe7q3UDxmoFgUu+pg2dX1xP67eY29uK27
 R/2vNeGB3Vcn0HfDE2dj3WBxPtk5nBZWFpU3qNDjeVkQ6A0Hm50ktXeH
X-Received: by 2002:a05:690c:67c4:b0:809:6b62:2f7a with SMTP id
 00721157ae682-81ef25a527fmr37856887b3.21.1784539125623; Mon, 20 Jul 2026
 02:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260717161430.37264-1-richard.henderson@linaro.org>
In-Reply-To: <20260717161430.37264-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2026 10:18:33 +0100
X-Gm-Features: AUfX_my6J6urq9aADMyjzfzXn0My3fx1hOazYLKZlNUvDPupMrrQQSKq1cLTPmc
Message-ID: <CAFEAcA8DYgLnV8YGPDsnQWR6wyVepbR=qJfJ5b4yFKJZD5mfuA@mail.gmail.com>
Subject: Re: [PATCH for-11.1] target/arm: Fix testing of raw mtx value
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, brookmangabriel@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 17 Jul 2026 at 17:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> MTX is always a pair of bits, one for each half of the address space.
> Testing it like a boolean is incorrect.
>
> Introduce raw_mte_check, a mirror of the similar mte_check function
> that applies when MTX is passed in MTEDESC.
>
> Fixes: 8912ceced815 ("target/arm: load on canonical tag loads ext bits")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/mte_helper.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

