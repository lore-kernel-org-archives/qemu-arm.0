Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7959ACD98E6
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:16:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSiF-0003fJ-Rx; Tue, 16 Jun 2026 08:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSiD-0003du-D2
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:16:13 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSiB-0008RS-V0
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:16:13 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6607048fa62so4224516d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612170; cv=none;
 d=google.com; s=arc-20240605;
 b=JD0pDojlxe+8cp3AwCCDPau61xH2W6/YkxoBcF5gP300IKUmHFpzHltVV9P/IqWVfd
 fjp55ewfEV3PPbgZZYNjme8IoKWa/6D9dG5cLN/KECdMAeBgu5Caeg3xUSsVCiy20uOv
 Z3Erax2XfqfibHZI+irbo3p4HcaloVqJuxS9tv8I3Qjy2feeUQ2HksqVUF9Ytjy7KKHD
 UNk35i7HeK9cZHAdEBEMYgxDQJP3gdaxDT9/+jKFqZGLH8kl7xguOZRQoJYc7n3S4oMw
 WSJs8Nn1ZDOc9jkkIHZOYqfS08mxEFs7aG8XtRnW7Lkdh9JzJygxAAqnwYXe6JRrWWFF
 nskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1LGtA8GqsFNVJsCOCEhJUqllq+0Rhz/5RxwwAC+enBo=;
 fh=lsPtdeja8A9+LYIvq7Sv4/W5pVdNda1xohT+3zkA7OA=;
 b=cwKkEiD67Fbp8gzNJ9aswf0+Z78dFlZnIWA4dpaEKrP7wD0ze4FzzqHY58vBkMZQ5W
 WD5sBLgvUA+b1lKq3mQF7eIGR0nZCc6nnQjxd+Xr1lfeJ/JB8hSYMiPyYrpveCVpwWHg
 8Sj6zag3MxkI6v6ldRnETOKvp1IP4eLzPuuGEc2cNnu8UaLGj4WHz/3oQ2ZgySMAA+St
 Wd8oGzn+uwd+tWd+fFXCRWme15yUNdIU80l4a+ZxHkH1WKdFdeaCJAuu4Gz1wDeNFO4S
 7SkTiGAUmyMQ3evB0ub4ODtKgZgw5eiqMvsbjp7Hx752IEOVVXpLnwkD909T57wkykE3
 XPeA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612170; x=1782216970; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1LGtA8GqsFNVJsCOCEhJUqllq+0Rhz/5RxwwAC+enBo=;
 b=KcS/YH7CAcKZBfaflyQpBX8wXrThyTHjE0J8vvkhdQ+xBqK1qbcFObCXOBsUHE3KvU
 +ukfAkHbvfip2XsTAVuuKkrgD6e/gXPAB3ZgQvP8cMn5xUle8jnk/pVbjVdRExCKy8Wi
 DE5f3WU6zrut3s1kY+quBMFg/MUXoUQlcQqyDd2lZZXacguU2Cx+esgB/LBqbjBbsoO4
 6WuifD6cPKZSkkOPKvVowrFfN2mOCi1VfQVc8FCW2ngaIsOk6YScVlVugvWKaSXGr539
 aSFd2A/UdzJE8KWuNbcIkDPmSskTa5UD1E1pl1n1HPoaI4nwjNC7tcT8s7UVACaFxLsm
 MTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612170; x=1782216970;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LGtA8GqsFNVJsCOCEhJUqllq+0Rhz/5RxwwAC+enBo=;
 b=P2IVMUpIj0kdgPXPZaJXu1XIaBw+hopTwDYOpAjdhMOsUZNzfqdeKgl7SaKsoy7k86
 pCSbHwImCT+el5orRpigtYqC59E5h8vOQBMYo9BgF5s5xB/XNM4Wpqe+Kzh4IfNu/JY0
 GHIZLrvHUA+ALoIOOOfpuLF55mq6+eBj3M8diZpZDEWPobk+sU15oxFXoSAw7DbJRNZ9
 /y3lcIpbiyC8rym5I179J4Pw7C9CzHD/oHce78qyt2KFZMIpgU6/x+ERe2N1+HFoZ0NU
 jbw9yM4QgOxgZrex5SG6/aBo52Mq9shBVpvHKiKsciOhgsu6OJOn/Oc5XKsLFGmMTKCg
 8XNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hOJTJ9B5Ue2Uzolbru7lxCPr+KU8MzPqx83PUf4SfHGvaHQk/scRn2ZYH6SMqoGB9uhIHb2b+wQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz+r6/y/lLHyNwa4wqHiqNFo+oBO4VDZjPyZWqTbMfS1K6Mg+IT
 P9BiwLtnL0vOTsb70aCHqW8c8/1znvew76mdRra8QKiCtAtVl7P5sgXFfIWoyPN/Qe+uYr95AC0
 FCs6fcjAnTo40XYahNofXsIGNpADsryKNevYjIPMfigpPwUWXl9Su
X-Gm-Gg: AfdE7cm5QOWya7HiOOjnG3SbpZ3S39DocKMtd1NrjMXt0Ts9y/gE6NG3+qKq9o3bdNW
 qS/X87ucFY9lVIQNurGuh+U/XOHycaYwfbqlSxdoD1PLHtbA/RniArEEOclPTeRWPr+CZA/UOfW
 nIHFS80UIRQsWfzh5FqLB6cHrNOUwiBitUBE2qBXmGPVZBhxaGS+5P+Xq45IE8CmS/t+LoSecXU
 GT+drORirvug6//5cTkeUIDfaYt2U2vBPYyWyZXSxe/wIutXqpRMb2elnu2ivA9kmzdxj9Kxr5w
 rAEW4PpMSHf95HBHqvY4XQSoYV99KrrXmOco8Yk6gYKGs81kci60BY6SfTsvK0ssgyn7LZWmzaJ
 UhA==
X-Received: by 2002:a05:690e:4402:b0:65c:2a49:8843 with SMTP id
 956f58d0204a3-662b60db2dfmr1650085d50.19.1781612170441; Tue, 16 Jun 2026
 05:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-4-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:15:58 +0100
X-Gm-Features: AVVi8Cfe_lespnGxiO1KiLppVEK4Q8Htetx6Le7RK6n949oPjN7EtQOiwlvfUYc
Message-ID: <CAFEAcA-TNb_YT3dM4CHM0+AOziYApt1yz4n_dVnuK524kfbjbw@mail.gmail.com>
Subject: Re: [PATCH 03/25] target/arm: Enable zeroing in DO_ZPZ macros in
 sve_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 5 Jun 2026 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the low bit of simd_data to hold a 'zeroing' bit.
> The simd_data field is currently unused and always 0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

