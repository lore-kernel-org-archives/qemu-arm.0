Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18D606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xwb1lzrU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xM5UT-000835-1W; Wed, 28 Oct 2026 11:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM5UR-00082H-8G
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 11:22:59 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xM5UP-0000xX-Ki
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 11:22:59 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-4a76f63b243so1664064fac.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793200976; x=1793805776; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hPiLF9jaOk6ebsSerdata/HHRra8R+w4M1Vwl3XDxUE=;
 b=Xwb1lzrUreS1hYQOYkaYS1aV2l7xkUNrJjjfRjdLMoKoJp9sxusw+A7wTV+RFiWDqp
 1UoqMB4xB8raVztSPD1OX4dUlvnymTbYyA/premvLWVYLBdTkqQuY4n1GaA7GJlTuOO8
 SitIcA5d+LanHaUy5lLId8fMkidDeYs1xtQzayEiQ80Z/Syl1L83rNylkQvIn1oN3uXo
 kAJVH4zob1dKrgdXTXGfrugcW54QCtPUwGTQK2zITEa3V+fW46oOCPH+441aDvPRhir3
 jA16SHZY4ye7LLEYm0+qYWr8cFEupKrIxNSez6NMdp5r0/7uA5H8Cd+ssGj/183iYDPI
 hm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793200976; x=1793805776;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hPiLF9jaOk6ebsSerdata/HHRra8R+w4M1Vwl3XDxUE=;
 b=Aam0kCSfzEJfeS61SYSuyakpfkaYude0RCW6PBw9EnaDB/urf5+nKXVZ/KUXpzMgdA
 wFSUY0gpuvKFWOXulqjx8YdakVkDgqWP0X3uHt/mxLS0WnrogOs7N8hKMqwbTylxw1qK
 Jog7+RwvZRObslLU5X4vX59luScgSV8Oxn9cE3NBOSsaqxSE/8owxWMVMYEkZJCHqXol
 Hb0LyCwdf/txxBxoVXYtmdUVHRbLZ+AR+qWaem3oXIeilUY6xVUJYcSXlkdBD8q3wYWE
 rHQWjU21kwdhhWPhUr5h6uuqIwfVLTl92NzGOx+L2erJyobPdHyvqNUmXJEEt+W64DLY
 VcFw==
X-Forwarded-Encrypted: i=1;
 AKwUvBziUshEUqVSPVBTJWoMAYwJzOqU6j4adsWv0lmyYloViN/YWnPXn591TtETulCNPse1/tuFyiKdFQ==@nongnu.org
X-Gm-Message-State: AFq9FYKiLOT913Y5SnF0biOnNJFqrWE/xvZvKLvVI0loVmr/aNheQYzO
 No56rS5+tVrnr2zpKiaCXJUAqNBuVGJi52BdfgYkBj08LhNtXv8BnvGr9+PUWQhrCkI=
X-Gm-Gg: AYBFou369J1AV+UmgIgGe1AJW3AiGYOSlvns5waNBwmdVWDn2ZGv1GIJNEyMo3LR2kN
 FQsyURvIlJ/G2nz5kQqNxnuioNwZZo6K/AArR0pscaWgMboglWJOSOhrSHP+DxCzNUEcldDExBJ
 Y/02tbAmhJHMl63MXT6GeeFha6Q/szKSz/HW13fu3izXiLkUoGy73CricweBGF0IE2DOXJezmOv
 1na2HzKaBUN+9T085c1g80Ephf9sMnq6kFU1wQentt8PzuVwlNGgz2dk/8qzz0DxMDhIb5zlvgb
 KCmAsto6ecTXPpApLuSxZ3bIt4Z47BJy5zoyzcok8P0wzh9Wm4bIjgiztQYfMdUSzqSBO3fKCVI
 YhLE4Cb+oVBg9k6OujoOoq+d+wmHPY6UgWw1OzdjzpPyuam2tQUVKUFay6vMa+5qpDuSsqeVmeb
 +SMLv0CVN9pzW4Z8fjmraWt5Nd0tUpPA9uauIBPMmYEiBIVw2hslCywDw0r1ALQPNhFa4P5aiyB
 mNLH88jhSf8MFYMiOOiegDT2l4CpaCkqWimm5UTwmDGEhtAIyQ62cbfb4lf5PTS8ifvyOFl2/Dc
 3Mch3ogy4ke8BxOD373kGlbdu009G9qgxefFUg3aWTiBn4585hC3Rj9oVF7qi3X84oJecMisK+L
 Gf+L6NfEuC+yvzKrvMBUpyGD7e34WunIY
X-Received: by 2002:a05:6870:2102:b0:457:f4e1:a1e3 with SMTP id
 586e51a60fabf-4a89b77e246mr3278174fac.7.1793200976070; 
 Wed, 28 Oct 2026 08:22:56 -0700 (PDT)
Received: from ?IPV6:2607:fb91:2c2e:8a8c:60fa:827:925e:3bb6?
 ([2607:fb91:2c2e:8a8c:60fa:827:925e:3bb6])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a8b7830d1bsm2732139fac.7.2026.10.28.08.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 08:22:55 -0700 (PDT)
Message-ID: <d2097319-c942-434a-8914-2e7ca3bb9935@linaro.org>
Date: Wed, 28 Oct 2026 10:22:52 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/86] hw/intc/arm_gicv5: Ignore low bits in
 IRS_IST_BASER.ADDR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <20261013083933.1024405-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261013083933.1024405-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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
> The IRS_IST_BASER.ADDR documentation says:
> 
> For IRS_IST_CFGR.STRUCTURE = 0:
>   Bits[N:0] of the resulting address are 0 where N depends on the ISTSZ
>   and LPI_ID_BITS fields in IRS_IST_CFGR as follows:
>      N = Max(5, (ISTSZ + 1) + LPI_ID_BITS)
> For IRS_IST_CFGR.STRUCTURE = 1:
> 
>   Bits[N:0] of the resulting address are 0 where N depends on L2SZ,
>   ISTSZ, and LPI_ID_BITS in IRS_IST_CFGR as follows:
>      N = Max(5, LPI_ID_BITS - ((10 - ISTSZ) + (2 * L2SZ)) + 2)
> 
> This enforces that the IST is aligned to the size of the IST table,
> or to a 64-byte boundary if the table is smaller than 64 bytes, even
> if the guest programs the low bits in the ADDR field to specify an
> insufficiently aligned address.
> 
> We were missing this check, and instead trusted the guest-provided
> address to be sufficiently aligned already; add the alignment
> enforcement.
> 
> The GICv5 spec defines the masking to be used with the expressions
> quoted above, which work with the raw field values from the
> IRS_IST_CFGR register; these simplify down to some straightforward
> expressions based on the sanitized values we've already extracted
> form those fields.  You can get to the expressions we use here either
> by working through the simplification of the GIC spec expressions, or
> from first principles (the number of bits needed for the size of the
> table in bytes is the number of bits that index it plus the number of
> bits specifying the size of an individual table entry).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

