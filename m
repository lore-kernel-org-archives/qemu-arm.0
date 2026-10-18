Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C0ACCF2CA
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 10:34:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIODT-0004dB-81; Sun, 18 Oct 2026 06:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIODL-0004Wf-1J
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:34:03 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIODJ-0000t5-Cy
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:34:02 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso8731207b3.2
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 03:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792319640; cv=none;
 d=google.com; s=arc-20260327;
 b=gf0dgyqAp4gd3dr9udANvEbqwLL6egwxdtl3QFMyC7DbLHGmKRD1otPXuHU7RldC68
 n8JUN4ysN/yjh0QPLWdDOOz9BNTOxHxr5srv5FLAAfaEoJ1oEWhgOg0SDc2mHQ5Jww32
 IZjxws23mH9tBmjJctKTBX7cDJmbaqGN98LRuVcCltOGbvSlYxzXtUjv5r53LmW0W9h/
 7FjcIakhn7eAJwz+UgznhMmX06WYzddyuYLQFrOriawzikFjBY7WscmT3akPUUqkoNNr
 3GYYEYMFVMFMtOnZhaUMxJlZ1ToJbHdfrEe1vpb9jFWgRBjZWOyW+UPvr6K2pMR1dujc
 Ac5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5FKN4+VuBNEcl17qj6PlVEN3fAx5SUv8PqL1xJXKu+0=;
 fh=8uvKZIbexqbLYAPae1h02gkTrKSrrXBYUfET3hJJSKc=;
 b=muQRWH9ktXZYq43NS0i/rWHgGEO+LTmH5jyxcGgE0kISRVtWeGq5EFRkbsIWYtQyCT
 n5RPOAr5K+Xsl+6u95ZCddvA3RyMuil0XWRwZg8+i6xOm2FMNc/gntx5+xai/6AbmwVi
 CJ+fmHDSevp1SrjkKnh7TI8OQWgx3H6guHYL8whvmqwCEz0AK3t9s/ONPLEf1OBIAcne
 nYE+sTBBkF7hKa0Be4Memqo83EQbNX/NJ1F7vUhK1Rv83ot023YBL5/f4W+xhlEMC7gN
 87pVxeA+dAxS+yu70J1ty3V2qp+xrE4zhjXRjWHjfP+A6x2m1s/xj8xiA0bMwzTmZAUy
 J6xA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792319640; x=1792924440; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5FKN4+VuBNEcl17qj6PlVEN3fAx5SUv8PqL1xJXKu+0=;
 b=qVQTm3KE4mb+NwcLnmfohyMfIalSkZFaumn2HzW7WBKdVQMLXXshRKD6jWa3P/VSUY
 I56zsm+9zsUQXE+YxhWRM6HoWLiLrwt319XasYqPpJIO4HYH223sGErrxghkuudJZFfr
 1D1xVqVJgsYUmfwVoCc34noo3HlQNCDSvyrZst83WzTFApyYs2VphfzOqUtjY9s8nz4b
 lypeWCFR4lzqUumZV3M3TqntsJ/RFm+A6hSWWZVLSpGsXoQN2TKhoKcLunIcxxM04ThX
 ZgA9ZHd+9YWr2f2LDd3ocnmhc6T6epL5JWeMySsXd4bPeZKdH+yxYkG5iAfK9Zf3E9K5
 TVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792319640; x=1792924440;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5FKN4+VuBNEcl17qj6PlVEN3fAx5SUv8PqL1xJXKu+0=;
 b=dTNZyDwGmuj+R9k3hYHLBn9v12jjNC3GbI64ALfe3pP9RnlKx0v4xG6wFgfv7fLbzq
 uGhJEXGNmLMl2CrcxY7pPzpE2iScd17zzpl3kuN1f6+d6/LC+EOZPvIBF7cZwilWWMgG
 EncAsQEzHbR9oOVrgAvUXZzh6HMKbrnYM+eQi8QIkc7A1r9yNkM3QvPLJyOAnvhhGr9z
 WI988Llw86pAtMyaIUI9lvDr/FqIV+j6FX6PnIT4QPZJckIWVQTQvWEDwVdr3YfJ1J8V
 NUXQnHSIXbMlwxkfoED+7teV1XEZxnlBlzN8X3Guq6+meF0ZlYuiNiDq6wKs7WJKzc7n
 PyOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwLcgON/TGwBd3Dz8hCVit0f10MxdkU5ob327cENWwP4wi2hU8eEvXIKPPZHXLwj22LNPdvrvVyJw==@nongnu.org
X-Gm-Message-State: AFq9FYKNuwHWBKdCTd5U2bduVmMM0fXqMxQMDPmjUaeRsGB97LaAfHrk
 iRoIW/LfIwqpn50yze+c1DBfvxIlAfRvbE6DxolC7ldEiwmUUneA09zMR85uAxDghk+2uWJmalP
 6tqSDsE2BVkRm4b4DviJvdpCasiQKmc93TCUGk7P+ug==
X-Gm-Gg: AYBFou10EmC/wR4TU+YMzxbAe73CXW1n02iIqH6mMEYqYtPyUePpbSrgfqMaHMFCucI
 Oj+nmjEt/+Ehdvb1/Ag6fEBX3auYnJ4Q/TkYVLph/AMW8oZghVJHsIHXGW6hXHZbw2PDwX2Ubl7
 FTWzQzP8HoG9ywswEsksdWyyYA+e3D75X2IaGnpv/wgrYYb3QEroWcj94V2I1GHJUnagIo6hHAK
 Q49d6mp+MoYAyVjWOcm07xjZqCIKds3ALbdI4QuHiJ03OTiCcS7ENiRaeiphKSzlSLDI/YTvOM4
 L+/8+lAIgG7LHufnrSAZ/2+m2pFAlS0c9PZQ+bQsDnslOwPa6mYfNNXCVFOCUYNfpjYHOCm2GwF
 MuPa1jQy33dXFEc7WnYalZQeSkh3XqIJexqlet1W1vzrTcdKyhgg=
X-Received: by 2002:a05:690c:e3ce:b0:8ae:b617:7138 with SMTP id
 00721157ae682-8b0f21f88ecmr19203117b3.49.1792319640068; Sun, 18 Oct 2026
 03:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101158.42101-1-corvin.koehne@gmail.com>
 <20260918101158.42101-3-corvin.koehne@gmail.com>
In-Reply-To: <20260918101158.42101-3-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2026 11:33:48 +0100
X-Gm-Features: AclHuK9hJ_ao3VOyGrHDj2MMBcqi02oRYLLhXxD_5XZH5SzuAjWDBz6W0ccvnqA
Message-ID: <CAFEAcA-V0YHsjOfc5sq7AgPVB7ve5+gqY=imZ815yOqKQcOT_g@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] hw/arm/xilinx_zynq: Add flash type as machine
 class property
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, Corvin Koehne <C.Koehne@beckhoff.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Fri, 18 Sept 2026 at 11:12, Corvin K=C3=B6hne <corvin.koehne@gmail.com> =
wrote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Introduce ZynqMachineClass with qspi_flash_type field to allow
> different Zynq-based machines to specify their flash device
> type. The base Zynq machine defaults to n25q128.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

The commit message subject needs updating, because this isn't
a machine class property. Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

