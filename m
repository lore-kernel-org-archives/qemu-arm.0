Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC52BC61DC6
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 11:18:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzY7A-0003qV-Qz; Thu, 27 Aug 2026 07:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzY79-0003qB-Md
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 07:17:47 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzY77-0006x5-PP
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 07:17:47 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-81ecf499af9so35775357b3.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 04:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787829464; cv=none;
 d=google.com; s=arc-20260327;
 b=O2BDn/Er8Fj2TmFxnDotZ+HCvlj1f/Zte5wgtBkXY1FXopRwGerj7A5NbrGU8A+FmS
 OgFJo4ihEPNl6b4kvxdbJk1SzlHfCR7SBSPLs5UWtPIgI7w2XmkvtTKMJlLV7kVOG1mN
 sQKDqS5ALBp4kM2Cxk4v04rxrWByaRiq9E9kPM/xxPhusNs4o3xCC33ZdxIef0yDBY7w
 DUrRvMR3j/KTX/4Wvcn5rTqzZi6RecvA0i/yeqTG/ohoHrGzC8UCdVNTBVhoi3YW4BlL
 Td9MnOP4zEQP4SCzhoXWE6z5+YpPowHMsUY1XP9lAJQ8I71utCY5ySQePvFiov/eUAbY
 Ge1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IAupx9RnMDjq1cK/7Ka5dp50NQm4KtdcDaWyz2bg2Ko=;
 fh=YLhwGJhoQ2Q9WB0IwdtdY1Wta5T62GeB4DYFv7JAgTw=;
 b=ASBVhL5JBctay0ZP8Wa5lSGodSCKkFXYY9D6nfW+CFqt3rL4WYylXAwZ2tLEaSCNr0
 99j0t5Q2kitdz6FEsHXocHNh1OVVSpLJ3GfRNkTOK0mCx+uTJEXHIIg/fV+LyeTJby33
 l5A0+fdJWoMIqpMdiJ31T8de1rxqtRfeeun23Qr1vohhVOfmQMjX9VGdpc3+IG/6/n1u
 VJSSoCWPljTreaLkwIR1tvFkbW28f3Gs8flojABKe97NXawacOVq0KNeQ/LuWDCo2pmE
 NDrHuJLJVlZ6a9DoIMecEG0c5119r/Txx9VkqeW9neME/+QSSdn22iTGiO388+Z7e2cM
 EdFg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787829464; x=1788434264; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IAupx9RnMDjq1cK/7Ka5dp50NQm4KtdcDaWyz2bg2Ko=;
 b=NTXkFgx3ZCNpcV9z4ZOTvlgirvJPsptVGhNauNzF4uv9Wv0tuVUTaKRBuZPcCKPdH7
 H4U03WBsbQLPa2vupa3weFANMpqpHmdbYuXP1znFFKaunKOWeA552dhIbXwr+zTz8Wh4
 022Z9zlKciV0u6WxnzCGjXwvn5ZZPUpmONSV/lywIE+HncGk+9AWNJND/qhuom2Inqx6
 IXR1r4GOAdZk57ztxsmLeZfci5H7jcCy5HPSr0+Rddvrgtl0MGrWmz2ORl4LWloc6fXF
 B5b0m4Zda3RvNPIkvV2LffyOowmAqlgpvPTHVc2Z2ft2YiwQquUx2t1N5IHWvpEEFQJw
 E8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787829464; x=1788434264;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IAupx9RnMDjq1cK/7Ka5dp50NQm4KtdcDaWyz2bg2Ko=;
 b=iE1DOVHfKjFgNj5K3duyE08c5DeiRMxDA2dkclA1YMSAF8HBT/hyqLwykvMhFxbRqa
 +Qj1Vz4Q/7RVHr+YUxpprDPTQ9dDrQyuOsQFpa7fXYSXbRevHMGI32O6dQoeEkYa5pDm
 RQgRyByF7Fo6MtsVnbou4cxIdS2ogOVqYt4V3D9YQf3PV+ClLCfUCaPsKvPY83kndSJY
 APlFge5Z9K6p/Dy+vVqax1nMA5ohT+v0J+67P1720L2NHN5dcl/dVr5DogA5Bsux6iR3
 23G0WprxQGOes1x8aitU5rmlXEnxxBeY5FdS8US8tH72qld5E2fS8Ae8XzPQ88DAO0ul
 Zajw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRPCag5P9s3OiFfOtjy3hAI01FYurhuXLG1Y2ALrEYN1mqOeBLW0SJCA2q6zkBiCHLVbJ4h7Rhng==@nongnu.org
X-Gm-Message-State: AFuF++kJFgi/CZQn/uBWjwKlFF0x6mBXIVVT8NSTeISBNCZZzLLjK1O6
 82rgjA2cxC7amhk1lvGSHgbttoqqXqWjMww4+jTmNWs2LSvPA29AW+PKqQicWUFP6+8wz5NrfUy
 3RhnZauNl081Sg9S+6YNsMw8pW9qtWwk9pgjrQOaK1Q==
X-Gm-Gg: AR+sD11CHCBmzFn0FtsJwCme+FRIW/MrHJxWO2mCcOgQRyoxQ0BZqyJjDf3CW/HeUg7
 puaZxK3Z7u8Alyr+xl3joZTH37lgACzTXEJu9GH9aQaBdMFr0xdk/O292tXM2e9d16B0K2NVb8a
 CzmLootmnvPrjvZL7xAmIxiBBw9T1m169TMx45umgxIBRfRO53xIT2oK1zicdj2dv5859+dVzlH
 JNeJkzb+6ieG+OTGR1U3MZXoecJBb1oTK/lwcCM6SO6plu37xiQheV0jCdvDeczV0gTEL+3zohZ
 J2fg22UGbbN4YN3eonxN4vCmVC8/cXYiYWqrZF7bZs6pmVDh7oY1Mew5Axo5OAs+vu004y5YDdx
 tQh1NSQppkwd07wLqFMAfQEHWoWip
X-Received: by 2002:a05:690c:c3a5:b0:845:69ad:b9b1 with SMTP id
 00721157ae682-8573be1b343mr53332187b3.3.1787829464363; Thu, 27 Aug 2026
 04:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
 <CACYNXwKU_UuhrBWHNFtYYmSfzRsUd5jRFjSc1++xvQHxPk6rew@mail.gmail.com>
 <CAFEAcA-Ncv9_jMMg1i+Ox_xa9oM4D_MMLGnPpqbyGJV_5B9iMg@mail.gmail.com>
 <ac30bd54b6f1f4e4753638c9e95dbb85d8b81eca.camel@alistair23.me>
In-Reply-To: <ac30bd54b6f1f4e4753638c9e95dbb85d8b81eca.camel@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 12:17:33 +0100
X-Gm-Features: AcwNN1VUVmzqWF2W5hkS0W2o-_zqfDDH0ebmLyctS6dkcWYA5KVyPN2vudg4X80
Message-ID: <CAFEAcA9zz60hTDMEMePnc1osis7dPjn5KmSksrWKATpSMc8SHw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: Alistair <alistair@alistair23.me>
Cc: Portia Stephens <stephensportia@gmail.com>, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 27 Aug 2026 at 12:03, Alistair <alistair@alistair23.me> wrote:
>
> On Thu, 2026-08-27 at 11:53 +0100, Peter Maydell wrote:
> > But isn't this just the way the SSI specification is? If we're
> > modelling a "you just have to get this right in software" bit
> > of hardware then we don't need to somehow try to add extra
> > checks in QEMU for whether the software hasn't actually done
> > things right.
>
> From my reading of things this is a bug in QEMU, not a guest issue.
>
> The fact that aspeed_smc_flash_setup() for example iterates over a
> larger value to send a single byte at a time shows that currently
> everyone *thinks* think function should send a single byte.

Doesn't that just show that the aspeed flash controller knows
it is always talking to an 8-bit SSI device ? It wouldn't
surprise me if the SPI-NOR standard in particular insisted on
8-bit transfers, though I can't find anything claiming to be
that standard.

> So it does seem broken today. Making the current function clear seems
> like a good step. Supporting different or larger transfers in the
> future is then possible.

I think the current interface already supports different or
larger transfers. We just happen to not be using that.

-- PMM

