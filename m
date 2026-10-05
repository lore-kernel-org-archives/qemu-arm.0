Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE03CCA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 15:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDkIX-0000Ux-Md; Mon, 05 Oct 2026 11:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkIV-0000UC-J0
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:08:12 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDkIM-00063t-ON
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 11:08:04 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8a08bb1eda2so16824317b3.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 08:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791212881; cv=none;
 d=google.com; s=arc-20260327;
 b=MKaAv2fzqlcjmV8ITMhKJj+ZlN1R0tmLAA8f3+ZZg1zdac6mtRwwSQIZtbB7I1ibZ3
 8KYDamV32ZSdRf+rmj1nJ//4MRC55ZjgtMdtT0aRKnFA/sQQ2TOWJLJo4XXzvzpGqhz9
 GPYxDQueOGxI4ntM8tIO8zr4bmMvO3n0BtsgNBeSKcDMVI1bMPivkUja0KlU+hjdvXRs
 TttwYG5oFY8GeUeDibe3zlO4G5Z8nh1ZvqYvrcb+mJIOdR77Dy64olum/BlcXFVyGD91
 cmvYUfAKUI/cVmd+9hShHV/cqpfzQcWus81miIbxHN/WQMpOaHzhOAla4HQVpRNM2cuP
 Mfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kPIA/Y6YnQ8BkTvSAb35KC+BDCx2WLPuot48lTO+AWE=;
 fh=i4U41MP6iasYNO1EZBD0uazIsXmp0oUhd0MrL/Ae9Ic=;
 b=duCz9qtOp/ceaWIQmtjAIEoEyBtdXDrAcdQ0PRqpC3jsw1ArJdbNg0IOuIZ2DwKN++
 pJB8PIWd/wxz22PcV6mKINX+yDVHJ46Y43qE9PGFQC58WNEYNFZmpTShuAgXVlHKbun1
 A4ntoiYIW2VwzHnnmmRZwqV+ZKYkqwm+8jefFWRp93id4sjPq7XMM+HXYn4MfBrvNYe/
 sSzB5rGMVDqBpssTqVOmwgx7R/xQrJx/3KkPM4Gi4RHaFo/Tmyk1owKOyv5E7tJQuJt8
 oD53GO3uPY5zXRJhOYmA5V2fQrn7nWf4cc3VpDxxSfQ+unOMB8dzcQFrkT/lwQXkEnLj
 pCRw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791212881; x=1791817681; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kPIA/Y6YnQ8BkTvSAb35KC+BDCx2WLPuot48lTO+AWE=;
 b=Fb+U4q+lAoRo2rafPucz15Jrv5aLZmSo+qlRbk5xome8QAh9ffsq0XKNeGvLIHrttN
 Hn7EZtfEtkWNDi66BVbcuLcttnXIT176C04Bz6WQ2LwDUtvZMtGdPaqMxzzBED5k3hAK
 iF1CaZ77AH0cNrQ36DKGW8RuONxLxjoBAFKE0kiKXTospImaCLUy7b8sAf2g3mqcvB5f
 BKd2+99WvwDwNh7nAE2PGq/vJq3sWb17GpyvkQdlT+R9wGzEiQ+JR+ZBlBmPk1LCsHkM
 KebO2Ils1awgWXec66jzh1wce1GadPYGClFYkEeA2IhINrMa/h08i0t4kfQYu/06nka0
 wX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791212881; x=1791817681;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kPIA/Y6YnQ8BkTvSAb35KC+BDCx2WLPuot48lTO+AWE=;
 b=06bG36MmDd+2U8943B+tS2ObI9OYCC572ocsh03RhWDkvA0XK8BhcoC7CkMbfXiAnm
 tWSvmQF7QLsGjJW+tO4QfUdq/ypS/Yc1WLdW3BjR3MZ4dM2YenLDsedDZJ0xquSsFrj7
 99HcL1BD1pvUflYOler99l0ixIL++ezJ66bsZ9hgOaAwd48Abrc2g9SxjhNFdLoIOUnn
 DtjAkuX30VBjEtIyPsHRD9HPKC1xkIVKRihDWwXu0vUsYf2+M04auIG5xN+6SxzfR520
 xQLLzux/OjgcqnCbwW0mJUpLgNPVHhHbl7VuGdmQ/akMzEtrPKevMEKP9l104Cmiej1q
 KxOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPqqXFkdqQkF6qycEdhhnSSZo2RrKxMcsz23vMwVOpPj+yfSebjPKGJXrk1yn+6tPjAazZUgoIvg==@nongnu.org
X-Gm-Message-State: AFq9FYKhrU4pqpsKl8bovCnebSe9LgMc0J0QBRhwAh3HuoWsDLw3gyzi
 Azhgr5A9mw8/YxQQscjUUUxYOlxlSOQ5J7zFJrBUgGKMZ9g5wnmLRbp3pVLqtdSxqCWV4SR2a2W
 Qx+5e9uiO/pYG/k+SMA4rl/qwykehjKc=
X-Gm-Gg: AYBFou1mY1IifFIeSrQdrHSCtVK9fEu8AB4g/7JUPL331VY/zW+OXWrWgUbwgD8lyoj
 sA4TeNFQMf5KoiV3Qj67iwzbXYJGec/8niutXBIuw6E1c42+CQlDb+XKub3lO7/ynyNiGJZ61Eh
 wJ43eEzKlWgWqzklcS1tn6RlDmrovjWhr+cHi8PRb2AyVGVNmQZVQjEjcKnGlh7Z+IRG4imCmh9
 bpXAGmnU5s/ioFIZHJVJBoKDb/jrdgiyjpCm+IH/GSPpk3rr8+lSaKIMohGttCZBQKVkpwXvAZZ
 PmFgY0d4OH8/CScT6/rE2Y73qzlQ83/ZMRDZ9cJp3tziJ/2iVqV6GoVfmtO8pbpZBRg5UmJj5VZ
 Cg94woGPgsax4zIhQ9BCi9q2fUw==
X-Received: by 2002:a05:690c:e3eb:b0:8a9:977a:4149 with SMTP id
 00721157ae682-8ae95af34bcmr29299547b3.72.1791212881434; Mon, 05 Oct 2026
 08:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-13-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-13-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Oct 2026 23:07:49 +0800
X-Gm-Features: AclHuK-X1jJ9gj8trYB-27aVTIcLsV4TeEVO-uw44W-_q6RXFeLphOyDV4uG6jA
Message-ID: <CAEUhbmWY7ryV6C2=+tkrpDr8GPSavucZAVMGfYZmhUz3AB_26w@mail.gmail.com>
Subject: Re: [PATCH v3 12/31] hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Oct 5, 2026 at 6:23=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/arm/fsl-imx25.h | 5 ++---
>  hw/arm/fsl-imx25.c         | 7 +------
>  hw/arm/imx25_pdk.c         | 2 +-
>  3 files changed, 4 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@processmission.com>

