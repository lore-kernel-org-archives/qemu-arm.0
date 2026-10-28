Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7D606AB18
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PxulUTtC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM5VJ-0008Sv-OX; Wed, 28 Oct 2026 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM5VB-0008Qg-Hr
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 11:23:45 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM5VA-00010W-03
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 11:23:45 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-843b6f8e2c7so1313951a34.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793201022; x=1793805822; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3i6bxbRZova5Zt4s8yFQ50r5ZezgAwsOEKYhJpXWDuQ=;
 b=PxulUTtCYec3GQnME0WafPHkZD+ZI5292whjLruS+dCi2ppbuYW7XZfCIJHtcDmDju
 F/4+nuV5pYBYzO6xHxsymmw5rJ95Qka+98wjefIFMcBIvD9tImzqjbDisOBQ4/i5kQKG
 hLWrIX1n8khvVI8f2C/AodcxJpYXEYAgZq/eFxfG4T8u0MT7ypmFA53sGIAxGMAf9NNB
 CoyFUDSWogdZl0AdM7w2+Pl84NtBMVTFmgR4CUHS8OlifnGOE8+nIPeoI2PSynsikHVg
 J222asAK6HTKq9m+9sWG9fHCTWWHv0OproQL9DVrG8u7s79SLR4YcIvo70jiS2imvYSP
 g9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793201022; x=1793805822;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=3i6bxbRZova5Zt4s8yFQ50r5ZezgAwsOEKYhJpXWDuQ=;
 b=rf5ShgXOPaXBJkXxqZutmROiOZppcF0Sa0aJJgRleLJybojE5q7Nv0kHS9Rlj9afKV
 8aLRYKOiVJbsrVVetAB2/8V6dtFWTd/r9i+cKHp7jVxGOzfsPHeGXV18QpX9gvRyzqHg
 M3Ho4zS0QkLbtIoJPR0AOXvgQk72HP4VIVDWtzle9ccwIJttQue8EGkgPmdAlLDbrlar
 utaPeqb7r9z0PtkwfTsM8MK2bZ3MXYUSMV8v58LqUNiA4FPbNTgDEhZusSEK2MAOB28h
 gRu1QnkjYTtc48zUf931rwYVumXckq7iWfUVpETHAcFoHL+j3RXh9NfAHCrHy2yP4RUg
 egkQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxw7PDjfd7U5zYqmVMNSbB8wufSh5SGC0UgTIkRP/vyrZaOM7xznJ2NKEfOcQYHBgmUuK4pfB8NSw==@nongnu.org
X-Gm-Message-State: AFq9FYJ39mYKnGzPNonKNdA1vFfX0FzpKT2OkrbSQZdOr2+WrgUxnFkz
 eSV0M/TynEf/vtihixLR4Kh91OVGiv8WYkczwUvPBftcoalTfF9XHiGrXMMtqDhB8Rk=
X-Gm-Gg: AYBFou0EI0q6BFMvAyP8qf0rxoyQZAnbtiIg93jv0kBh4IBdcvvWzDmrCj/lkAfF7YV
 gJbAlVKce64iQicoEVk4ab2VgBt3uV5Huosn4HUew7hDIwvW/2hsqR3AocZSM2JnN20Opz470VM
 3DgY+A7bYlKlrJwOl8+Bvu0hboEPDHPtodGTQyTlgZaZld1p5MAsN3xnZgk9HcAFYHyG6ozWgvf
 hAzuHhM8c6vJOSVRWlkjwBng26pFwD9n8fTY+diJyz0e7bt6QS72Pwy07/GyQoGvsru7bIsAycM
 qOpt7aVvCdohVFAEKUUcUrGAFlLy0aKpB0pska91TKGhhy1cmyL8jtlKBYAj4YBB7KQLxSpkF52
 gJKANncyjO4bvBDx2GrYsZoeMNRdD5W0v1HZ1Y1SxIElb2526JWAGj+IP0dS4/mtzgu+ql/Rggz
 5fVpD+LTeO01CmSLgdu3RV2holN+iGsppIkoLOT0J7mrrjdIa5rwscyd5MPmj2bFy3uuFZGCFd8
 hDGRefs1ssDS/jIzPIm0yrOxsNvdl0shoPJ6aNeBybOEJD5jbmua4LZiMLuf55nMRLaqFFPETVL
 ft6na7XpDAOgTl8/rEVm8vhoLl7LVz1ZccG2e+WjS12Fh7z1QwKsS5OFol5Ql0Fejd1ZsbCfGE+
 JMndJU/ALUIQ=
X-Received: by 2002:a05:6820:82a:b0:713:e433:81e1 with SMTP id
 006d021491bc7-713ef924474mr1576186eaf.53.1793201022337; 
 Wed, 28 Oct 2026 08:23:42 -0700 (PDT)
Received: from ?IPV6:2607:fb91:2c2e:8a8c:60fa:827:925e:3bb6?
 ([2607:fb91:2c2e:8a8c:60fa:827:925e:3bb6])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85b2021857csm2007499a34.23.2026.10.28.08.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 08:23:42 -0700 (PDT)
Message-ID: <586c8c7a-9251-4d6e-aab0-c5e2accaa387@linaro.org>
Date: Wed, 28 Oct 2026 10:23:40 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/86] hw/intc/arm_gicv5: Ignore low bits in
 L1_ISTE.L2_ADDR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261013083933.1024405-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/13/26 03:38, Peter Maydell wrote:
> The GICv5 spec defines that an L2 IST is always aligned to its size,
> by stating that bits [N:0] of the address are 0 where
>      N = 11 + (2 * L2SZ)
> 
> We were missing this check, and only aligning by applying
> R_L1_ISTE_L2_ADDR_MASK, so we would only enforce 4K alignment even if
> the L2 IST was 16K or 64K.
> 
> Add the missing masking of low bits.  We already needed to calculate
> the number of bits needed to index each byte in the L2 table, so add
> it to the GICv5ISTConfig to save having to re-calculate it later.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c         | 6 ++++++
>   include/hw/intc/arm_gicv5.h | 1 +
>   2 files changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

