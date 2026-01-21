Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED74DC4451C
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:36:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viWVq-0007dq-O5; Wed, 21 Jan 2026 06:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWVn-0007XI-10
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:36:35 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viWVk-0001pz-EJ
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 06:36:34 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7941578064bso7880037b3.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 03:36:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768995391; cv=none;
 d=google.com; s=arc-20240605;
 b=haNytgbs+5udEf+RYP8i/CA/K7dZK4TRvcO7UEJj88i1nwjeZUzhanpz4ONf5NOGQb
 4NZlViUlP/FcAVrLTfcbjxwA1bCJ1BfBFnHzgmUbQJ+p57t0JXXK3zUcfJs8RcVH+ypB
 mzFWM8A2PYGJ6VRHCA9kOKOWdIpQI+4Uv3u/qLA39o/BFKs4/xI/UVH6NPoRUIyMytB/
 S67+4G6x6s69yFoee/C+T2JoBkdKQhmWyiPVCbu/ptCwvDtXBLatEPeOTC4KPpnyPDf4
 ghV1j7g5JPL2ZdEjuaZDpeA+H7cyyomF6hci1bmxkHb9E0iMEzH6wzw3+RLL8QrTGely
 KleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=F7jneCj+QYd1mBy4/r1F9DmQVgBwkANu6BpQHpfadcc=;
 fh=NpwbjC0aylwy+Oj8ZAW6AwABN9wFefi9rgjCoe2yZhY=;
 b=g2uyDiwlIJIDZzAMQgpJvt3MaB1tdCWK3B2KxVS2cxap8/EcGftZ+je/7LWkQ6CvJB
 KnZ4B38z/aINIOXB3SAKd5Fzdh2NRBeSGR8a/VaPpP77zyyq95klypondlpFJodh77S2
 Of4C+JYnfoSRVhUPMjx2+EB6LbXfhOm5Zp66z0zBvKgAs5nRhrp9zPc2loFF02R0gq+2
 v/una96Tq5mnZN/QplLkSmAK9CLj5folFloKN15v3ioGXB8rdjqnpPSuwLAj6iCRxJOz
 xbuPACInCZW3LdbzVmNKtIB6Lxm2F8/rhotGpStTv6MBoudvPmVBj/VJ1tqZvx3BQEKO
 O8ww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768995391; x=1769600191; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7jneCj+QYd1mBy4/r1F9DmQVgBwkANu6BpQHpfadcc=;
 b=g9BszXDUS7B1ZNsTRVXUZgWWRl3ElYvzKQ3NwapHL5YrtzHSNUae1nctqN+Qvy6CwG
 saEimV2FnFzzma1LKm2ijnJkRhdlo/MIAFTpolUvt8NKONc9Ug17WyojafhU8Z6u3b1P
 8sqvQv6TJONIcdT+zKgTcN5Y1g4DLVOtKzxUDePdBBwHcDquKX4eTxSb2HJ7qEUp1g8x
 Z9x5q27n92HjjXAWW2zDovBQPRL5+noam01Chb+713u4RqI3WjvzRTtOPs04+v14RnG+
 Fq1z5Ef+kRyBKZFoVdBBuJxjwzSNkOufJ16IolVQ1MSw7kF6ojgetJIGVO+slxokN1n9
 Nf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768995391; x=1769600191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F7jneCj+QYd1mBy4/r1F9DmQVgBwkANu6BpQHpfadcc=;
 b=G3cv5/t6us8fRBuq79SdcWV+4FLtRqsfeyAy65opa/tq2o8ntkKX5BopqJugkGT27y
 xrKg06zmGVJJxVJk/2zCNRriH0jz17m/BBsAwItj6h5Ky9WymAgvcdWTk3MFKwNaVcfZ
 rB3wBCVzQl/sXdUq5HYUN2p0Y2fulX9qsU7JUKCxwa5/Xwrd7+CLgmNeDyWNIfNBJr1q
 Xo+JfU3xP8fBPX0tjImB+mn2hkVxTjwqcQhnAsRtnK4oCXV8XxGHUk984A2DVd5m9Dez
 ZdQ6hj1qpIoBw79qdchiuDFk475qw3PQh8TbS+YNAzBzw/LbL/nMidwi5elIhIZVPy9J
 6Bqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Xgv/i5C8birXr5olauKiba+F75e8yJ0bqFyzFl7D9ISfv4qDassZBupYb9qoPAIaLaff3TKIWg==@nongnu.org
X-Gm-Message-State: AOJu0Ywu2AJNMie2qEIlackJe7tbM+JoFUMhSdsGVgUYilNVBj4Wtjm2
 8tPbjGpcsvI1R+XqEw9COQshhcFoT/ac5kSGwkUizQrGrd3XMdjol2z39sGph08uul+F3NhBq9c
 yPxIfgZPsDUMsN5GGuW2gnEJM6hrFPJTHJUVRPK/O4Q==
X-Gm-Gg: AZuq6aL9NmK2D6BZZ/OdBqeJioWgeerhNkCyGMPBAP7Ra7IyEW8h5E1J0qVLbNSzLh3
 fWLLKPzyW+AJ0LP2D0lmmlfqXvnYMfucYkJzMV+tHXVDP4Co3IpAtjxHRHPwYXcO/PwE3Yxcbl7
 eaVWkrGxPtcqkQ+IDxSWIMj6tRH/8xOrlt7XGfhGmAIZY14SUHO3AxrFohqhSlaftR5bgvy5BmB
 7eqEKBJHKA+LhCr0/EfXoXBgitSPFXWz/ADHZWtmbFn2nJddavyvK2sABnccvjuih+hVg==
X-Received: by 2002:a05:690c:e3cb:b0:78c:2c4d:3dfd with SMTP id
 00721157ae682-793c525d183mr155486087b3.4.1768995391220; Wed, 21 Jan 2026
 03:36:31 -0800 (PST)
MIME-Version: 1.0
References: <20260121105932.135676-1-alex.bennee@linaro.org>
 <20260121105932.135676-5-alex.bennee@linaro.org>
In-Reply-To: <20260121105932.135676-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 11:36:19 +0000
X-Gm-Features: AZwV_QgenkRK-I15l3G7kL2_V-dQC0mqSjTfnTGD6T24oqCOVx6rGK47hyTfY6k
Message-ID: <CAFEAcA9L+e-C7+SQKJ_UDptbyporc3uoqGxeZi2McO3XVXj3Lw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/intc: avoid byte swap fiddling in gicv3 its path
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Wed, 21 Jan 2026 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This allows us to keep the MSI data in plain host order all the way
> from the MemoryRegionOps write method to the final KVM_SIGNAL_MSI
> ioctl. This fixes a theoretical bug on big-endian hosts because we
> were using different size byte swaps which would have truncated the data.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

