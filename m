Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5455BCD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 14:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZl3-0007jJ-2u; Fri, 19 Jun 2026 09:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZl1-0007j2-RP
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:59:43 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZkz-0007iG-DS
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:59:43 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-662bcc30fafso2373562d50.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781877580; cv=none;
 d=google.com; s=arc-20240605;
 b=LfJLZG1BozwDGEAuE2nVU5R/cngq0t+EiSrFTasG11MLA6LJWfqpXf6BVEcf0uJfg9
 Wt8GGzfPddKVDR4qCTHdhFn295pv4A5cwkPvZUPnNMc/4tEdEO55VHi8c0T1wTy2WuXb
 HQSY71UZ1imjSYsO4pRf0Bih/plhAdo9qZlB01BPOAyVFG86IawZ7lXnyfEEE9LQH/Lg
 OVx849Ggoiat5gNULpy0kjCSGMtRMxcgvorovoz/WhErly0HKg+vIVfTcbahRtYIeJ0p
 TZ3FQlZr1D5QKm2TNGqB684Q2cU2S8wEJ3awgJ76DeLrJStwcscToCkn2yL9UEEO96FT
 FPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ShBdqytcLSe2HRNr4jnUDwhsOQrfs6ccbcrDZnIBUP8=;
 fh=mh6V7rwsp8eZ1lH7cDeaykXdFj4vYReU0AptpAApO9s=;
 b=FfU9lzmdCWRYkrSrdpt1aBna52IgAIH0wzCrtfK5gmgXUp3EQkedsroK/MLELkdIT2
 PtWgwl+5jeFfY5kRJ8Up75Cd6SEU4A0FuCP5r8+HrQRxGBSOVaSfZWrKhTQD2LD7dv9R
 Y33XlC+BSinKPfZFqKDG4CEmmYDZ68B/bjhpN9GlcnGwAj20xb8umaGav9wuAs5By1VI
 gB+P6obKM/nqZHZJgoqnH/oAsB1y6LHwhFq4QeNvzBoF2hRHO80KApQRGpfyck9S6AUA
 9ozIZGcB6ZUv2fEyWBFHUHmpHOBB3BBzG4SbdWHllMOmvWyS4FqfdjkuRNr59rVd9TOM
 sKrw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781877580; x=1782482380; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ShBdqytcLSe2HRNr4jnUDwhsOQrfs6ccbcrDZnIBUP8=;
 b=d2b1mp+qqF30GOksiBiSWgJqs2eGWkV6VJHiTyniQWTU1DhPvu6nNkmJUVVdHwrreT
 +0Ku8k0Ni5PFdmzMMzqnAWmcH0RElVIPcpLG5415h4zDj+afFHKRDdXislHEd130uXRp
 ghNklnYd+eOBZ3D2KnzF46pqgP5DPFAeL153seb8/wT4KLYsqe05yFwo+OXhuQXLAIuv
 aaMp+mQRv7rQ9i06VbUfPpH7jy8nVmaxn8b0lQLdVbI2Asqf7ecRsP7j0hB7oRzilVYH
 Y/FKBNq+fDrEKXN3I01qyVLQ1dhnCLXYn5h7qd566E1KAAtJaWlU+k3ms6kpG8VfLgLc
 2dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781877580; x=1782482380;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShBdqytcLSe2HRNr4jnUDwhsOQrfs6ccbcrDZnIBUP8=;
 b=bbJqBmLj9zITg7LvVRnmGthG/DALmr6tsTspZByY4mzw10h866r9WFGBRwG+wBXpic
 yWc95CFg8XKKLE/du8LEKaCWD68VifugjsJOn+WofpR2zIwuzNmpPq7B3HkjiyBMazTp
 Yyy9D87VxcI5g6BMG3yreG/aGRAHX21hs4rPcdmPmpMvZpODjhiWQkT3CRVmFS/1+T+b
 lMKhhSBvYXpdk0NWvOPP7TzKMNabIvTsiHWb/EvfXipGghrQ2Ma/+kIpyCuSsDgZQH5W
 m3oOx8uWR+7MGr3ditjXEKkJtJ5d8f7Vj3TuNUynEVzQ5e7nHGfo7uFqDGlGp/67qkMz
 YG1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2cXOBALvvtG8K61MZpQ1vXTOZjOFBXGNZ68S1RtmSbJ/ViAvbgUEGxrRUGJYpCt3hoRWILEx+gA==@nongnu.org
X-Gm-Message-State: AOJu0YygQvsHSpzsdCLnZpuudt7ZxvZuuoZj8p6AuFR2TXRdXOd2a6vV
 jyrRCyBuQoF8B8O0rHXxBGhvcc9KSxf8ZuU9a0TNXfY9BYRcRmNRv6cgSzX2Hh7jerjH/TWqxEH
 gyQIBYwFKewEQnIiVx0TTTnyY+ol7xoffTw3yh3Fb+Q==
X-Gm-Gg: AfdE7cnEVqtP0gE+nMfGYuFK8OgOzo0rPajtG08yyzFv1CFf++mybnD7vKqELwEfs+w
 sLM2C7SSQvWtLqBZxfnnqbhSC5HO1jtZ35ku4jdyu42COIZrrg5GR4aCa3flwhBWRu2Dx24OAET
 PGBB1A/ZnEJAoOmqL92saML9IF3nCNIKJYX3BvVx706VHo2aMY+eFe+FLLX4uzoHpNTsiovS31L
 RrW86h9nI5x7jTb+oCXvNAN9XwOzs0flyG2dsN0srWcnViwULlds3A5p5b4VAqkussfPb32e7fI
 tb80mBBLvmvyKPQrD9mVcc93OSDHB+qjPVdfrPmhSoHFldalgY9L4jil
X-Received: by 2002:a05:690e:d0e:b0:65c:c744:36d4 with SMTP id
 956f58d0204a3-662fffc2126mr2957866d50.59.1781877579619; Fri, 19 Jun 2026
 06:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260618040718.572950-1-richard.henderson@linaro.org>
In-Reply-To: <20260618040718.572950-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:59:28 +0100
X-Gm-Features: AVVi8CfpkOUxP_ydqGvm5VJr8kr87gqEy9M30_cQ0lVRo8UW2ovAgpS7yB34Vow
Message-ID: <CAFEAcA8puxCrNjZgUC0qM=McpOPYvk1AaX4ckO+ir6RK32C7+A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] target/arm: Implement FEAT_SVE2p2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Thu, 18 Jun 2026 at 05:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   - 18 patches merged
>   - Enablement of the feature for -cpu max is deferred until
>     FEAT_SME2p2 is complete as well.
>   - Dropped sve2p2 helper prefixes.
>   - Renamed sve2_aes to sve_aes; there are more isar functions
>     that want renaming, but this one touches the same lines as
>     FEAT_SSVE_AES.
>   - Other minor tweaks to helpers per review.
>   - Unrelated bug fix for FEAT_FPMR.



Applied to target-arm.next, thanks.

-- PMM

