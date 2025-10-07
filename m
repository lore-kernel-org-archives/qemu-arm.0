Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB4FCCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v696M-0003bN-BL; Tue, 07 Oct 2025 10:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v696J-0003aU-8P
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:55:41 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v696F-0007pI-3E
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:55:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-77f9fb2d9c5so51922137b3.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759848931; x=1760453731; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LY2nbnHJE6bl70lDJ+Fb3n5xMaDjXClO3aHqDyQdols=;
 b=ktBhyrwIETacIfr3VdEtMp8gZf0SVLpCIZBHfa/yREgIC7Q+j/9fLhcvEmHUFxcekU
 HnXxV0wYGAoZx4Jq+6yhSFKFz/yet7ZL3t/ZuE0lZXKHoDFShQjncuyMENGj8RmpDMin
 KEYY8YwbzQtsJWHfrEU1iQo6Sr5yiYgIPI8sTS8hLgpJtb8yj8BzBFrD2APDCZonBuX8
 LWfCB/nVrrqaiPWbv2UrtDecxjJE34lP+PYNL5mFIFYvozmrmIhLBBDuJXYgvvFbqHXL
 yYq/8MaH/IyPepuSePbML8EV8W1Hj/1PLSNsyu4f7Ef6rvKBltBw2q1M3k8Z8feWx+Eu
 DIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759848931; x=1760453731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LY2nbnHJE6bl70lDJ+Fb3n5xMaDjXClO3aHqDyQdols=;
 b=U6tTD3ygSi9jUwgXQkAUXJc74QF+YCBZ+rklha3tmez3zxMb1rBJHt3jFTyvubxkQ2
 HCpTYORKbr6wx1978sBoGKpxUu0jBOWjj9F7pm8ORuz04lL+p4Dj1K0VeVbj41cJcGy/
 rpf/MGgVEzhNstVdebMb/vYZkvfqoi2R7AasbePa1rmEnQszbIjdtmFaJ8ABSaYGUy1e
 KuzyfuxYcjaupiqFl0KQCsFTGbzUGPCmGytW7CEUOKv4STCJcTcLM8aMgNzAyvECcaN1
 htr6b2nURqDFqSzrvK8KQXb9TNDwYfiNiq2z5tfZwEHSX5qqIDo7Gm8qSOBRheX5ai1Y
 CmTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHL/6hsItILFf2BwMdQg3CoeFzYBbJNK22z/+N4nZ6mev35u/MwK+hMHz38Aabf7fPKV+uosabHg==@nongnu.org
X-Gm-Message-State: AOJu0Yz6nYSmKKV5J1Alv6buayWq0N5TnPp+qoi1q8Pqw0rMROg6cYVE
 WlKpGTeCKbeoplm7rL5/uziKdeJ+BW2wuGhWgVqqy645ag0PIqCDqYaXLYFzfdY3zvGlD1TJn63
 HhTlw5J1s+Cg4M1X8roy3haSBCI95+usqgdzJC2ufKQ==
X-Gm-Gg: ASbGnct6GYSa9LICZ8f0nb0mV5mOSROvr7FF4RmCkbkMNDYBpswVZkytwf3dn+A/FlW
 Y599zwuOU3zff8yDDB8XPMoOSwZP9rzLbbGxn5zyau7Q3h48K3+OtCrT3K5JZDt5DeukFdQgXHN
 VAVGspOpgjc8kR6wPE5MsiRv4Kt0scZySM1CUPUKZtYSK4wftA2eClK1tB3nTvjQzSR/42jZsro
 HzwDoFGFCXJJQH6v5JaLdoiapSkDHgyl0sd
X-Google-Smtp-Source: AGHT+IG/3oGa0JxS06IX9cKcaG8WG+sawfFu8rnOm6YtNrWDiW9Tnnn8FfftNo2kiN7/edZRd8nvXIA0BwcYKngu/+U=
X-Received: by 2002:a05:690e:d1:b0:636:d3c3:67de with SMTP id
 956f58d0204a3-63b9a0e21d3mr13854927d50.34.1759848930651; Tue, 07 Oct 2025
 07:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251007024006.43166-1-philmd@linaro.org>
 <CAFEAcA_ytH+AwTr9LAZBP2nbSTod0FkfuexbewW=T7Pbb3nkmw@mail.gmail.com>
 <66dbc389-4c83-4552-b447-87c0e1ada48a@linaro.org>
 <a7e21714-e19f-4465-96f1-dc27bd484cdf@linaro.org>
In-Reply-To: <a7e21714-e19f-4465-96f1-dc27bd484cdf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 15:55:18 +0100
X-Gm-Features: AS18NWAPGJPiMkEnxgtVXXbESzSvaeNPmvwtz-paduSD8-kjo_WpUSFbxn8GODg
Message-ID: <CAFEAcA_TWXGCSE4y6wgQJosDBGGvWF6wGr=8Br3ivdQx+MxOig@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/max78000_gcr: Do not ignore address_space_write()
 errors
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Jackson Donaldson <jcksn@duck.com>, Jackson Donaldson <jackson88044@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Tue, 7 Oct 2025 at 15:47, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 7/10/25 15:48, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/10/25 10:27, Peter Maydell wrote:
> >> On Tue, 7 Oct 2025 at 03:40, Philippe Mathieu-Daud=C3=A9
> >> <philmd@linaro.org> wrote:
> >>>
> >>> Convert max78000_gcr_ops[] to take MemTxAttrs and return MemTxResult,
> >>> allowing the write() path to return error on failure.
> >>
> >> *Should* it return a MEMTX error on this failure, though?
> >> This is a question of what the hardware behaviour is,
> >> and there's no reference to the datasheet in this
> >> commit message...
> >
> > Right. Thanks!
>
> Looking at "MAX78000 User Guide (UG7456; Rev 1; 3/2024)",
> chapter "4.7.2 RAM Zeroization" and table "4-67: Memory
> Zeroize Control Register", IIUC failure can not happen.
>
> Would that change be OK?
>
> -      address_space_write(&s->sram_as, SYSRAM0_START,
> -                          MEMTXATTRS_UNSPECIFIED, zero, 0x8000);
> +      /* RAM Zeroization can not fail */
> +      (void)address_space_write(&s->sram_as, SYSRAM0_START,
> +                                MEMTXATTRS_UNSPECIFIED, zero, 0x8000);

We don't generally use the void cast like that. Just
don't do anything with the return value.

-- PMM

