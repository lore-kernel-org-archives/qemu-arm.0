Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BCFC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvyxk-0005rw-Iu; Mon, 17 Aug 2026 11:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyxV-0005o7-Jh
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:09:08 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvyxR-0007nW-K3
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:09:05 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-836c5b01e82so46502447b3.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786979339; cv=none;
 d=google.com; s=arc-20260327;
 b=WiH34/e+6NyXUBd2pSbjFPB2ntvbMjwMGqBBXPnSq/Wb6FlCQavvg9NjvzxuKMKyNY
 83pthd4/OM99t+UUk1KsxLetBlI+KH9V86e1tFBLBkLX8k1qELxKyQfqh8jRsEHCByWf
 GWYheGtiu4iJ0uA/hv/udCAYtYB69jVe4HUh7UQBIzVbgjZmcpqZmzWj60rQC1CULwbA
 +LmIG9jFE/+MP8ydmFoIFCi0JfyZzfTE5Pzf4n8N8HGX3Bn4j9rgjkHERKkFzGctE0OQ
 GPp/UL0IMPMBAwzn0rLZINikGTDg29PPCAziTARMSzJPayfTs7rb5pu6DKYJdvSojY1B
 8lfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CCG+xxSAoUzfQJn3qwYkPMMhQLP6vX0/ozyibhEsBus=;
 fh=U9mR7JUhewVEq9RZgu4ge//xxLwVD/PIaUZs61GM8ss=;
 b=PA14ZQV2odMPrTV0P0PFb/+pHASWTw+UKXOc+QSCAEKz1RIIk42x0A9/wswaJwjlVX
 GqHTGqGii6Ba/jfbjfYvDSW2q7Gpr3IPKlc5qg7kRlTJDtgzV74jcxCihYtwVx4X+DUO
 XXqRVlb/1O9zs90Nmti6jbaz3+kNqiqliLFP21CijOLowVeKiviSwhgUuR9+6EMocP7c
 tpxy4fQKUcxpfVIVlU0MgQWEEYmoocAU26vlDraF7teVONLCpWhPst+vykkSB2KA/tZN
 NzIozi5FLt0DoeYPGwmuS5ALHMaTJgoFOAWzK2VwNWx6Frwy+iCQMSNH2W6tKPwkNc1G
 uAfw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786979339; x=1787584139; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=CCG+xxSAoUzfQJn3qwYkPMMhQLP6vX0/ozyibhEsBus=;
 b=VsY1P8USP8V4I0TVWMgliyH2oe5TNAsyukENiCAUMEmSb7YPilkIWOxMknz+aTkHLC
 Wk9NdwhbgYf82VWZ9YreEkjQYRM93pwpV2XVZdeFTLRM2GRLmHhBAUzKtz3pxzkEjLbR
 LnN0ScLWARrpOT19U+L6maeuXByJQbpmd+K0llku2pvyxDTwnjdin0Io46n2Lbwrhuqj
 /dEBBnbBNFWkACVhdTG/XakgkqAUVgF0DKQ6sFg0o2MbGIRjNXPadIHaAG207AZMdcvz
 f6sfqpsZaPbzDe5A5FimDEcxNo+HfqkVRXnDAthWb38KzoQiL+YMaMW+D+Sy4udaaeh+
 njWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786979339; x=1787584139;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CCG+xxSAoUzfQJn3qwYkPMMhQLP6vX0/ozyibhEsBus=;
 b=cez/cPIa1yIyzU6SJPuj9NREUaFPumc6PfLzy4IDFtbfPu+Cum0LIS0i+yMKOnLnnD
 6njqJAIwTqf7lQrEo0SoHFvUVh0IhCQkAD+taXYYcWnv60ciWCxV9t3J6DRonQbcLHon
 thCjLDxgUKm3g3ZMJK89YkZY/AjLPu3YGasPkY6zi8m/l4g8CWUHaaf94csWPjq3O1v2
 3v1NZIHuLIBzAtpnAGNlMjyjEV0387fi7N8k5E3cVpPc+I5zr5BtyJ/foocROlRNxLu4
 8VyXg6PWgBg+9T6+0/5BnqEcB5lDCs9bv0rKD2QP95IywCRZQG5QCHhsLBnpl4VywHTG
 qpPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpXSfsQS9bukjP2wr3bZCVDMsl4hIXHLaSZF0zuXlCFUq8WEjT3NqCj1rEkb8RPgFnglaDb9HOOLA==@nongnu.org
X-Gm-Message-State: AOJu0Yx+zW6dc0FFkmqaaodnpkCMyAete3btprTTsXyhCeaYMlwzQbt+
 dkP5UM3Q+r4DhT5LdaIL9zcZQ17QVhlLzEUa9e/zzWnivkEy5bLcRXU6Xgdpaylub5c+0L/svUp
 pGvLGTE/OecDuwPkPT6lQWuMVAP7sB4GjawoqD5lGcw==
X-Gm-Gg: AR+sD11juVuN1DfTY6CU/v2w5lPOk+hb3OEu9wqmH4s4avSfGdSmnBpcVEjpNa7EewG
 LIsySuUK4GauKhFiIkev0II7XMXCToLKRkinbxH/qBr+beX9iW37g8nAPT1VtKj2HPe2STlfph0
 f8tf7PB8oLZHyjje7y/lX+hKHd1fQ6nRPIU/P7wwfxr8Oy0dSuzc1vfCjf8fvYCb/oeQZFYYC+W
 a8dBNAGltbW7CkQ99I2Q98L7jxW56tSwqqjGa92Lm/8D9r1Kw3l3SoHx20oED4TOGZz7f+gbR5y
 oWUIsQyQB0McwFazi0h2t4j1s+4EL4NiucOkXvvuk5qOayh2c56iHuL1e5Kw6pPycS5ffFSfhZn
 NvhAOp559MBgV1L8SqGrLJWbNGvID
X-Received: by 2002:a05:690c:e188:20b0:81e:98d3:cac7 with SMTP id
 00721157ae682-8412d32316fmr5135417b3.12.1786979338841; Mon, 17 Aug 2026
 08:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260812220816.94034-1-philmd@oss.qualcomm.com>
In-Reply-To: <20260812220816.94034-1-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:08:46 +0100
X-Gm-Features: AcwNN1UkxGNOMoIOLMU5Rtn4GFE9U2QtuFe-EMEvaOrhMtLjrwYRAGx0ieHFuVQ
Message-ID: <CAFEAcA-hNpNCRow8u=WzXsstNKY8LyUq+XVG8yZMsfajSkyq3A@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Have GIC kconfig select GICv3 for HVF
 and WHPX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 12 Aug 2026 at 23:08, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> While trying to fix the GICv3 dependency on KVM and WHPX in
> commit 39a8c3941eb, we missed the Kconfig ARM_GIC symbol only
> selects GICv3 for TCG, not HVF and WHPX. Fix that.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 39a8c3941eb ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM =
/ WHPX")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

