Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CDFC5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:26:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjgG-0007nD-F8; Tue, 11 Aug 2026 06:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjgF-0007mn-IT
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:25:59 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjgD-00059E-KI
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:25:59 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-81ed2a06b9eso32357957b3.3
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786443956; cv=none;
 d=google.com; s=arc-20260327;
 b=XNYFw59y09DaAw/XLldZIl8DxDoBekg9GnN0a5AKoZlQkVU4pIDBBTmN6PRZSwj47h
 nShVDZXLiIRNS9FDQzVagSwy1Loq3sqRR3NCGVEWHnvy1hXMcq01p9ya9xSgNfIdtElk
 9yngWZ8MbZzEcKcodV55H9/1JmW1wQOZTlCvtikKbUqk+R5cjXVt8sqAbb7lfrzhBaz0
 0FdR4fnGielTFJwKBVF4QZ7+zuApKJp0WZoFf/yfSARqHfTeCz2vEUdmcHPWb24hZUjf
 jZxQ/7E4NxxiQm/D4mVqJQ7g403QqgAOf1njihO9DBvxYsJCGxBqnlgNIFc6c6JvFAkG
 YPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8rV/GeOFwghZ/mUDsgrUlESp+c74JXJ5GiSeMNO9mnk=;
 fh=b2OFQGrfcn2xrnz1yyllZNlI/nEeZO+X5BcrPE2N4sA=;
 b=MZRZiGgSfMEOHyQInOUEWOdTjQcm8VRAclsigMXJB30sEdnGVKsAg2I5r2T6lrHjfJ
 kKnaWnjd4knn2o7ln2gqJXvs+Cdy9TOGDvyBexy8N7ZpU7r9xR1boOUjoOldMzQfsVUW
 yqY5icitZ8PfY/jy2eRLO7Ub3xHEEWhOvfTZLwLK8+wYOqbQlUnidmXF/T+cV4wJeZJB
 I5+ubL40TBZRtQ1WfMHdKOaEAj0cwTXfUUJHFv+HCjT13YqJ8JnamcsFwQiWqVhmnSqB
 /bjc5P3+GG9koqBx+Tz2BcaL/LDH/279Sxa7h+eeNor8le32eVHorJcQXqnraAQG3j3l
 f/0A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786443956; x=1787048756; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8rV/GeOFwghZ/mUDsgrUlESp+c74JXJ5GiSeMNO9mnk=;
 b=FleMbhmRmcfQyCQhg+2sh5gHMNAJwoy4dTIPQ2EjVAbl34W2Ljjb3W++6LAeK1ShH9
 HTab8ck6vs9gp6fsyXWUfR/jUrf7GpMrLeWsri21EwyZg6bXEAzLoxqeotlO/xwTTNFV
 8tOFnGPoaJIuiLtqcdR0NQ+10kb0ynk1z0UBbEOkoSOtmWXtS0SAlZR16Vo18YteoOxp
 TlYY9G1nQM7i3jO7A/Q+J76YFLBKhtiUt8HpBfUR2zw2gMIa84aXjU1Iclj8dPzJjzav
 HHqMrQYIZi3Xw00FC7bySRBQ/9MowLsf2le3BzEkCwtatPslk9HcqlqHx2JFlqwvIZRi
 WRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786443956; x=1787048756;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8rV/GeOFwghZ/mUDsgrUlESp+c74JXJ5GiSeMNO9mnk=;
 b=WB7WU02iwmdd6NXJwyZwzB92r/Ormo6k9/uLcnHPbndMLsX1F4P8wkfoVzU3SmQ630
 YxG6b3bSyPUtpL4+0C4SgGIAj6mVE/pnDcAUQrfPGh83NBLbmG9jA0jumwQ4HSHBrwj6
 t32fPCMcsO5XRab2sAe22W5F5OlXjGgqivaosNMEhQ5m0JGsAy08mmLBivFi2nu6Hqog
 3WtNLBC7+ame9l+mJnk3b9XH39ObOreDXQ3aTUSLx6E+IRvtcKm29NQi9PUKd1VmUgJO
 z7MUi0FiNvROgaSnrMQjY/37ptugx97prKl34Tlko3E97ClwUeF5jWtcUnuEcHQsR2ex
 RfUQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/gnV/937wuDu53Nbv6okpV6CNnqVgoiLQJk1XPmhD1hbFK3+idoB7j3A3JKltK6HgPyqVrbVZAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx7wej+85HHv35SMIY/tBzEqPFRdFMSdBkm3R2mT8F7QitFP+0V
 8KK04oO3dDXnV8TUWoM56RrDMzuzuqfz6EXSIHlt1jQri3A1Ov8jbVR5fnaItqHEQjtCztBnYZo
 7ImhklOeCYfh5xtYuQznDSdw0LgavsjNH1DZ62w/bvQ==
X-Gm-Gg: AR+sD12wFlSerR56xVDzT4ZKfhFbCBIyREVzZ6Xx6oKZgmGpk2vMIpbNYtd3ZU7U5wt
 3bziG7lWEYs3LWPEpLQRd9354RtXlVHWzAbTDdv3PsZQIwc3F6e6DVr4g439OojBRMZwqizy/hV
 AlJUUAohNz675Eb8XVYdT4K4wfWccCSoAC9FzUDXAXRrx19plqRxKlpqNPD3zl0Jg/awz5hX8Jm
 wDharK9YkmjHSlRlr0b9lx+Ap8jfyUhDHVgt3kkKR+VqRBDOSAQx699K2r8XCLPO0nqFH4niTPk
 z/A9THCOYI3OZt4qRekOeGfccoKyPgcWRk19pBT8IaSYOq+94MyDDYJ9jwtrunXh18rEmBrVyUP
 fhXvioqw1qXADMZ6PPPnirb5IPG6G
X-Received: by 2002:a05:690c:884:b0:81e:a471:e893 with SMTP id
 00721157ae682-82f2db9e0a9mr12285277b3.24.1786443956435; Tue, 11 Aug 2026
 03:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260805191257.11303-1-simonxhy0404@gmail.com>
 <20260805191257.11303-2-simonxhy0404@gmail.com>
In-Reply-To: <20260805191257.11303-2-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:25:45 +0100
X-Gm-Features: AUfX_myYkigxjIB_8Lvn1mcxJVf6NXjm02vswH1uexxDSD5Q-DONFEK_xOD4V4o
Message-ID: <CAFEAcA-myBo1Oa7US8FoKMNVeVdE4o0FjMkho8vTRmVu_TULOQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/arm/armsse.c: fix SSE-300 s32kwatchdog address
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Wed, 5 Aug 2026 at 20:12, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> The SSE-300 SLOWCLK Secure Watchdog Timer is only defined at address
> 0x5802e000 in the secure region.
> Page 45 of the SSE-300 TRM specifies that "the watchdog is Secure
> access only".
>
> SSE-300 TRM: https://support.arm.com/documentation/101773/latest/
>
> Fixes: 8901bb414a24 ("hw/arm/armsse: Add SSE-300 support")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
>  hw/arm/armsse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

