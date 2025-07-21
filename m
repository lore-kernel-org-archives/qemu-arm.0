Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3F8C83F25
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 10:20:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udnct-0005pb-Nc; Mon, 21 Jul 2025 06:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udnci-0005gL-M6
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 06:20:01 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1udncf-0006fL-5B
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 06:19:56 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-71841a48502so32192487b3.2
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753093190; x=1753697990; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqL3criYFaR+yc8K24H2T6pBlM4FO4IFc7lSC9rixWo=;
 b=Vq2qRTXZQ9EG9b8r2FTTe3gLxvn5UA8pAZq0eYSzkyOqJG+C8NnqdQJv/eg9sQsYKD
 tkeaBx+l8ZCg3UwjTL3CnRKS6ZoJmoNiK2iKS+O0Mlw9C11cX68zAjYK+ry1KaujRuWN
 vo95ZJgNAslzQtTu6NG6Qw83jLRMFJJ48Z2MeIvWQnJWJaeqLtTmpNzrM8U+Q/1d84bH
 znoiaqCSY9cfhRVKOS674sEyhDMHXnvJ0sb5S7MEEuNZIMJJq8vQA1Qb8Phox91Fw7QL
 urp/XZDkE5wqX+afF3dYnjhcPT1zmloim34E5suETv2cCn+siA5UytAN9KdzqUz37MWE
 QG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753093190; x=1753697990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqL3criYFaR+yc8K24H2T6pBlM4FO4IFc7lSC9rixWo=;
 b=FoBktktinmbGcBE3BROEXMfrunD94zNLeivt1ToiRg3A/8D7ts7ZlgE8MP48hIXPeS
 Bx8pXwqRjnZUHjaYZq8oTY39TvkWGsB9fIlrPZgw2MB6vSegeYuck5CgZ1m7Wla/djSm
 DiUPCDtxiqH04qU0PRwP0PPijxGKnIgqNnyMx+mmhT0ep1lqHAKaJibw7yGyYlAnKyPw
 xtl6gkIHRv4iC/hDOmcmoP0QW2Ic+eahOJBoWozYVN311eXdjhwOlvGIzyXBEhY1RH/N
 XufK3ftUPTTiTLOkmVaWwYbpK354icxqFYVVSRbjCSMUPtiZZZ5ONNW10dnq74xsDKbK
 06lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOT+hrq28CpYkSl5G9h4+Ni2WXnPocOGfFRBqB1Md/IknCCZeGAs0h+7TfuqcDu/Zx1pGNd2FvIw==@nongnu.org
X-Gm-Message-State: AOJu0YwxAo3e2A8xNbx71eMm+g+Erxj9gA+MSrYfX1qVVT8G0suHWnJQ
 Kb7Fb0B0OEmpqVWsobcVCibdb8XU/UtEmxNMBKwUnEh84TmZXAOFVj48xrd3xhXYmGPcfHPGiR/
 8qNTbenQxS51A/lXxQNBnmEuhpTnKsQkiZnxCuhkwNA==
X-Gm-Gg: ASbGncuBCSKslFgvWQISwt0r2UDDHOlCpDmff0HZvSAmVkTWhAh2KeGZgOgaF8wA6Jz
 N4qvoQ2AdGvPSDtyaScw+l07Ead9KXaJw4gTOxcZ/5q7SmFmOXJDrKuJBTlRtcuRQZIPMrGpi0I
 vb3Tw+8UwYrqXnHfhuABJdcQBIBWs03PbHGuX9gygrjBVDlkCzGcNNSSWV2QGtoJb6Xi+mAtkkw
 cNbEXwS
X-Google-Smtp-Source: AGHT+IEZ/9Ez8j3nlHzfDP/iMM05lwvpiT5KlCipUtk4VzyerpQzBowc0BJsui/jOhlDDloP57bGtP2dBolCK8tyaCs=
X-Received: by 2002:a05:690c:f07:b0:718:3992:9144 with SMTP id
 00721157ae682-71839929448mr248995597b3.40.1753093190245; Mon, 21 Jul 2025
 03:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250714160139.10404-1-zenghui.yu@linux.dev>
 <20250714160139.10404-2-zenghui.yu@linux.dev>
 <7a34c735-3306-4028-bec9-f34b4271a543@linaro.org>
In-Reply-To: <7a34c735-3306-4028-bec9-f34b4271a543@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jul 2025 11:19:38 +0100
X-Gm-Features: Ac12FXwAmGHvgigb0kKzZQ4XciIzOCQQ3zpOvg60DE2DgGyKjkxcyzWOi4c2sMU
Message-ID: <CAFEAcA-7bUavf41RS5Ppd4XAibcLVxHnybDyJH0Yc-U8WHSpHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hvf: arm: Add permission check in GIC sysreg
 handlers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Zenghui Yu <zenghui.yu@linux.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, agraf@csgraf.de, mads@ynddal.dk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 14 Jul 2025 at 21:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 14/7/25 18:01, Zenghui Yu wrote:
> > Quoting Peter Maydell:
> >
> > " hvf_sysreg_read_cp() and hvf_sysreg_write_cp() do not check the .acce=
ss
> >    field of the ARMCPRegInfo to ensure that they forbid writes to regis=
ters
> >    that are marked with a .access field that says they're read-only (an=
d
> >    ditto reads to write-only registers). "
> >
> > Before we add more registers in GIC sysreg handlers, let's get it corre=
ct
> > by adding the .access checks to hvf_sysreg_read_cp() and
> > hvf_sysreg_write_cp(). With that, a sysreg access with invalid permissi=
on
> > will result in an UNDEFINED exception.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> > ---
> >
> > I hard-code the @current_el parameter of cp_access_ok() to 1 because
> >
> > * we only support EL0 and EL1 in HVF, and
>
> This might change with this work:
> https://lore.kernel.org/qemu-devel/20250620172751.94231-1-philmd@linaro.o=
rg/
> and plan to leverage M3/M4 for EL2 support:
> https://developer.apple.com/documentation/hypervisor/hv_vm_config_set_el2=
_enabled(_:_:)

True, but for 10.1 I'm going to take these patches as-is, because
they do fix a bug, and handling EL2 in hvf with an emulated GIC is
going to need a more general look at the GIC code anyway.
(My preference would be to use the GICv3 which hvf provides in
macos 15 and up when we can in any case.)

Syncing the whole VM state for any call through to the GIC
emulation would be quite heavyweight. I'm not sure if we exactly
thought through that the state would not be synced here, though:
the GIC emulation was never written to assume that some CPU
registers might not be in sync...

thanks
-- PMM

