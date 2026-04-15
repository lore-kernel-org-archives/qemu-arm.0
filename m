Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852ADF419A5
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Apr 2026 13:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wD0Sy-0005D8-FO; Wed, 15 Apr 2026 09:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wD0Sx-0005Cz-Oe
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 09:39:39 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wD0Sv-0007NN-Vy
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 09:39:39 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6501c4857b2so4567217d50.3
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 06:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776260377; cv=none;
 d=google.com; s=arc-20240605;
 b=Bh4GEKGaFg3L9kNDfYxE00wI4WciL0yHCHGEw2RkNpUEMlXDROTMjbcbjhTd9ccmKt
 M/nZKcJpIbbP9beInxVSd17cmfpsbhhQAWzEkH43Fq/vT0Sv9OwoyDTtEFPSUAODTnYo
 cDteHhA0sDKat1vFMq3owsGRGmNmxxWVNQ4HUwaZKrlYgNRUmvAuM3U9b1javBnl4gVj
 LdbW4tQ6YQqVgKkVVj9HNHnhIvYKTvPtI1WW9M+UgVu0z3hCIPDazdkEjgkvK9/sZN59
 jGiHqHYqwExYYw5FZ32iztdyPR2V16mJMbQMEB/HOrf0Z8Mq7bHNFQLVzqAd1Cx1SPle
 JUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rpP+7Fu4pzw+MKsOG8lqQFGEgCtoctLLSSvR6dXTRyw=;
 fh=CvWCHdt58uE1eY74D+Z2uZwHnLV6r8exY6GgPm2Wh64=;
 b=OGq/K2mlX5sIjPW+LAkLPsbbSULANC+XzhJd+5EQj2fVwSm+FxVja8mdiRhISqq31l
 EdSrtdiEI8JihzqK86BCKL0GEu/Yt5DwSSgBBOJ2etJobZFO3MMqbmz9cWclyv3nYdh5
 y25rrmEmmOEzwacT39AQ5qousHbtoPxsmE3besbZBaatHIWkSLxNXHpGg6aeYPyVMZKH
 vAkJJIKFmeiC6QghYWTY0AboSXc2qvZDedlGqU8X1uiOSgdACgKc4eajtWS0fyBOQlkC
 1Jcq8U36jNPWlMGX2LWn+zM/y64QXBfVi8cVLLu77zFizrwTPiDn3cwPDpjY82tNudPs
 qB1w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776260377; x=1776865177; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpP+7Fu4pzw+MKsOG8lqQFGEgCtoctLLSSvR6dXTRyw=;
 b=lNC5YdN1JJ5MARqdFO1wvO62qu4kkBItzrhB5Ui2Z9u1psJUHPAACkmXQOc8M9p1Ye
 ZhLGWTAAfDQphLtZM3RWEtWirbrwi63PeLjU/iCkWnrRRmVpa42hSTTjtMMOLAC2Y20T
 aIV/DecZwHAN8R/15XslJu9Mfm/vreoODnQDcV2tyBa5VpuFED/8XpI/ZDEMOwcytpiK
 YqPpQrtpL8u23Aa8QNX02MNm9TFIIAYUauC/5fNN7nKtuX63V3eOx27oQ/5GSM+82B1w
 g8X84o5a+J51jKh19d2XdPEkNnfTflUdh+Lpdu0Sg5fxHdObKMI8h6PgSIRAS/69WYfi
 w3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776260377; x=1776865177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rpP+7Fu4pzw+MKsOG8lqQFGEgCtoctLLSSvR6dXTRyw=;
 b=XNCP7v5S02fnfur3OT0WTuOiGSk4gM50qERto5KaY2eKDYXhjT2cVDMjzv+AZa7r7R
 8f76r+b5J9PqsJcU4F47SwwBnxdf9TN0LPl36fLLxc/TdoD4YtjHfthbUFYlEIAFRuWT
 so5qB4VzgzzATPRxGJce8b5LDAvNYOW0kNQ5gUmDr6sRnLZYu+9NJ8fP01XyhjZcYSS4
 0wfaJzkUDAk4vBTOdrub/0iIRm/e7y/ZJiMYao4kRpVWIZ2SNS8xE7xRoU087UaDYcYg
 iLXRSE1Fq/sZg3YWiXRrYBYk25m2CbVKtw/kQEuHL1O4vbVh+mdMx9Q7lYLXXVXX++ws
 icIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+PvzYyK2OuZ3iBCtb9FxyWXzsTj18vjMT3d0ZZcn+2MpI35Lj+L2pMOIXXL2QA5hOU8v3OI6WvgA==@nongnu.org
X-Gm-Message-State: AOJu0YxGBFkBjI7XDW6izx21W0JAQM98SXkGfHP1IT2+4pzI3BkyFzJy
 TwSzlJOsDFUJvzYy6pwrUhI9xYHmo+HlKx/e0w7J8Uja9C/femkrIl6A+oIk0U9OD/J+WVPLBMF
 L5XTTyMDmoVDWWC4llVLAolggS7q5nQXFXOGg+hk/0g==
X-Gm-Gg: AeBDieubjkPNHRwPFPE+UakNik0qCJ2DBMZV5AGdV5BvXP+nOvuwdxUblc37c7C0UE1
 lJj01t39SM5BeoMEIwFzSs48X30PYGQZZxewLMP087zDHRjR4+0nSp9NhUa17Z8625fQigjyKxr
 wKHaNFRehnhbWIZew8tXmiTUDOic/fRXQ9irbuZgVvL1czx7kDbHgQYbSyPJM8GEGpkd67nKiDO
 lHsr9R8y398ze+4NTSsNTeC8xdlwCmh0i9twX0MfDreeMpMr3nn2GmPTAM0ugfzg7JuhDawAPhP
 8Pvrxx3X2MD+0qR7gj8Kcw7CuGbtDvD1dtgeEpFxU6IkOywBoHxtom/62YXhlahcJCjJgrUom3a
 YVA==
X-Received: by 2002:a53:d007:0:b0:651:c047:f094 with SMTP id
 956f58d0204a3-651c047f43amr11519226d50.31.1776260376710; Wed, 15 Apr 2026
 06:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260410194227.16357-1-philmd@linaro.org>
In-Reply-To: <20260410194227.16357-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Apr 2026 14:39:25 +0100
X-Gm-Features: AQROBzDWyyWZlWUcLBju42JqJHFmLU1ZA4SfWFt0RryHZdkDjzW5TpAZKwFWyuk
Message-ID: <CAFEAcA97Tx2OYu=6fW_TbsR44hJ96Q7uhsq0wndSr-NA3yuT-g@mail.gmail.com>
Subject: Re: [PATCH-for-11.1 v5] target/arm: Remove target_ulong use in
 hvf_handle_psci_call()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Fri, 10 Apr 2026 at 20:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Similarly to commit 3580aa03547 ("target/arm/tcg/psci.c: make
> compilation unit common") which replaced the target_ulong use in
> arm_handle_psci_call(), replace the one in hvf_handle_psci_call.
>
> This could be vaddr, because entry is the start pc for the on-lining
> cpu, but we prefer uint64_t because this is what we get in param[]
> and pass to arm_set_cpu_on().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>




Applied to target-arm.next for 11.1, thanks.

-- PMM

