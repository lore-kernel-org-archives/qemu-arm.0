Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA6ACD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:50:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZW3K-0000Q2-8j; Tue, 16 Jun 2026 11:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZW3G-0000OQ-5H
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:50:10 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZW3D-0001BM-0Y
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:50:08 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66043ecf6b3so4476657d50.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781625005; cv=none;
 d=google.com; s=arc-20240605;
 b=hcRejoY5qre8vmRiyVPElYCt6kstlkFC95kOwrdZcRcrJ+hgFleHpehVzim/iy/OIx
 m5LkoqYaVnc0G5A0MDJcKB7NDgsO3B4S2U4mCo/N7bVG2UNUdAaWTQbQgHdB7mtuT1dN
 oaOUelNbTZqw3R+toteQ4nstTeADSOLbHercjdZ0bKFSCsGoXv6wcQSesQ28wlmt/Dbi
 ldBu2wux8cUVDgCmEeDdnRhtdViJya0cGh/dG05R2cRoz6QvgCiT9e5RKtpEoCYTsR/I
 rG6VsvdBdTrTl1xomfkGsDH9V+5wt84+akmcea9FUjhmmQXaZIZv/eooWeUjUpqpH2us
 3N/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=U7MzkeiFKXRvqU0JU0E4LhUXbdoql2dcd8OKOUYWI4w=;
 fh=sDoGspZhWv+SdsrbhsO1XRLV7ZYN5TXxOa0HvRZNTDU=;
 b=LEng7TMLMT5SLeqbJXky5+cqRLQT2/yYQz25byyI98IxEd43Kg4C9+kegs5szApmJv
 TqMO9eDXuYm911syWNt0zyNKJnd/q+EMqNfv1LqKbB15FgMEmkK+IAl30lYL9raU3KtT
 L1uM4B1UkzaZQiNKd0+Ao0S0efVhkcoYCVGU6i+6P9WEs8FB9asNcV6u1E2Fe1MPRTTJ
 m7+8NCgnzEEXwkchjjhNU+VvL2FMimzF4n4Y6TNjD1LYoEXPZ+ivNSG+gcXvj+4XtjBk
 d/TRRBYhspV+N3sNJc68+Q0Y/BzbNzoO0O1mqoz6xlbNAnG3LmWsCFdHCnHacgh/vPLm
 dHKA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781625005; x=1782229805; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7MzkeiFKXRvqU0JU0E4LhUXbdoql2dcd8OKOUYWI4w=;
 b=fYjIlmfjIvADduGyDi6nWlSVQhOp1E4bsTJJrqVDoOmmbGsHMsshpy7uoIlNQhm1zv
 KkDYAdH7oBgn2TkOQFAf0MssPKafaUXUruFuYsx03zetPcjLvbBS0RUXk21JE9ITHJvb
 uLLDhp7KxZdmbe0sc2GVM6ZFLS8xlO1t3ZFQHQIVtBw7zEhBxBmbLoL6AgWySc6/f+ZE
 nUj61vHftnKQFm0d7FaYPsDAmNC8yfDll3ggRTLgWeoQ4WBxs/TP7OtFWNd2SWr4Fw5v
 AknxiOQsJ6PwXvEMf1yMoiUNRQjmaogIFl6ti+PE8qYjiK0qxFAb2o8jPhsbPqPDS1d1
 iXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781625005; x=1782229805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7MzkeiFKXRvqU0JU0E4LhUXbdoql2dcd8OKOUYWI4w=;
 b=itONgiLmphA39nNx1SaUWq4F6tExBUvqbQM5HxaUgP5QWUElLlqaEzAHaRe37lnLaK
 Ze85Uy0NYUh0XOxNjGJwMS664+FcAmo9XhqcPl4BdAjbn9ssnPhV41j8cRjT4pyInMld
 toU3Q9FbI88kl9NMbeLtG11XAQXAuL80QnIof89n6tkGULs5B9p/5M+jOBNvJCU/L4/R
 ijKkIYzz//XtbK9bfIPvMfkCLpBG60TqFr/GxYSOaRx0YJS5IzYjQz4Vm5izGesG2MFi
 KXSmxYLktYF7HPvOBYB4FVmEJV1qcvuyACJCkr5MVkoNsvZ/WTVL2rrRU3geyV/JeJ5A
 OvVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ//R1uUXBjsIu2xfqythjP+hUvp6mW/0j5sFwV1dAfIksHWVp+UCk2fDHvvRF2YD8UR1sdNNUoFEw==@nongnu.org
X-Gm-Message-State: AOJu0YyOOPBt9i3iAHmihNEHj489BRD6omO6C7r4+nso0Ct4XOjhzJFI
 1SQsp0mvXeWJ/YF24HCkceb84tecukq2M00tfyLTA613SD4mBtizptrlhkA8+fBWY8zFqyiXdK/
 HZAfYHIoyWTQlfkiLvhujC4lzy10t+T1cX7UCgbIT4A==
X-Gm-Gg: AfdE7clQfdJ+sR4N7Z8cW98YVskgtHLd1JiizXoEgIVDlOdN3x52SxsDFF2PXaxB+AA
 xG4O3YYUpFHmBtUih8VE/lPCZvnfNzzy2P3gXC/qT2ZpMxsYna72RAid01nDPIn0rOx6rY4Tz7T
 HYs25xAxwmla3ly641GwITV87Ku+NVn6ppBrlGyCmvaWLmByL4IH6+HZohyHZhWS7CfFpYDcCRZ
 9miUHosbKgJJH7I7t4/95ADDMIUrvVdgRoFTjE5iIk9t3VvG9zNGGWPdruKXb236OHJfoZwfqqa
 Uhw/DI0HBne0YuaGthwkIEQYMbfo2Lkbc53ZSYFDk1D8KDQRoTcpEhCplg62cRDAzCY=
X-Received: by 2002:a05:690e:12c3:b0:662:c587:4351 with SMTP id
 956f58d0204a3-662c5874aabmr1287622d50.55.1781625004685; Tue, 16 Jun 2026
 08:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260616153432.92939-1-philmd@oss.qualcomm.com>
 <20260616153432.92939-3-philmd@oss.qualcomm.com>
In-Reply-To: <20260616153432.92939-3-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 16:49:53 +0100
X-Gm-Features: AVVi8Cc76eWRUyvbsblTdZ6xTO3AlqMCN8hgJZlnjROWTfhXVIRo7I7Lu06dkQI
Message-ID: <CAFEAcA8BAm4dSPZYH6VroS2GmrBT-oPBaUdrtWJ=2_38y78PAg@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm/ptw: Restrict PMSAv8 code to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 16 Jun 2026 at 16:34, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Armv8-M Protected Memory System Architecture can only be emulated,
> therefore restrict it to TCG to avoid compiling it on hardware
> accelerators.

True, but this is also true for pmsav5 and pmsav7. Could we move the
ifdef up to cover those as well, or does it get too awkward ?

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

