Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF2CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 09:48:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64J4-0006EG-DT; Tue, 07 Oct 2025 05:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64J2-0006A2-3p
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:48:28 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64J0-0002zh-HB
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:48:27 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7501c24a731so66326347b3.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759830505; x=1760435305; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jtdlCfNK0BXMpjaqSJ1lzhULTh9YXQ4rUodV2iUELMc=;
 b=nDuz6Ay0sKOoAmMTeUrwoyJNw6bvuuDbc8csc1RZOa5cqaJdoNoJ95SeMfegZpPrCA
 +24Pi+6AQ/1qgdvCzQaOy2vtJhFHTWJZ/w3wuNz/oGSIJ/ir74ZcLdGpd5edwDUfgsEP
 HOHdQ6Y2bmRODGazHHSSVpodaPuE5mBlrGOLJLIyyQJH/RglW76MLQzJ7SA5Wu0mETNv
 GG5ZmOm4Dv6zd4nE722XNMNsC0Jvk5INfUrtfW8wf24HcMiU5sEaCXYb6J8gANi95NKs
 DNcWFJxrzVJefAnv4fA+KhTaG89tLUw57FdzO8en8Z5hxnnyYcF1QmQOjSjPxcGgbkEX
 KL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759830505; x=1760435305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtdlCfNK0BXMpjaqSJ1lzhULTh9YXQ4rUodV2iUELMc=;
 b=Sa19MATxHqkfkVWoOtHHviWcmLEerUxQq63VZRTkfYAd8csFLw4FO3MKKfmoxjuDyP
 Y2RfA/lCeP3p9vQrwa/YGwmbQzwty70sxcfIzHkKz9uvfeynSyafHyIvSk73eQae8yQi
 h8Xtyr0Z8e/gw9gRlqnCU6e4RlxLr++aWkyFMTJfeE1VbAL+ihHobcB24NsVlDU4vCwT
 aw+CxVK1uyr5V3eQC3kWLh3CLC4Hr69eq92l6LU8y8MZWTWaNrfmIb4SWoHJo1HOMcY5
 8ebnFLp76O67/KrTB061DxL+C1IU0GHlmvGTzG1rXuTnyrmjUqT3UN/DWyN4wsxnn/Fv
 fNww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Wj1PacjHb+ewkGg0xnjb1zEvzEWrIq5GZeJ9PCW3mhtN4b9QbijSHXFNucY68H/bc5EfjRE1Jg==@nongnu.org
X-Gm-Message-State: AOJu0YyCz9ukZYRNg+/sPCNAzqmLYlxMujcdxxQy64IEVnFPuOYQfBwf
 xABnOQx36JIF5ENm4wDmQml9AXw/Ch2oWh5dnLCkN8q+NHK1AYi+QmWvt7KQ53JJ+f2CpGiZFSm
 IcZ2geSxZ/HCXEbi1qNa9j4OVALT41q+Xyh0Xs6j9Xw==
X-Gm-Gg: ASbGncvQyTImZWKJkoD1ynG4GyZ3DhxDtphAz06n6cLLkiunYBKThuZSadS3TQqCP6H
 /jZWNpTP9DLvYqjgDDim7u0P5s7vMxTVh0CFJZBCc1HD6fy4ld8eqlxp9gQ0fv3kwVlql/jzylJ
 ILbYI2Sg/t7d+kpngnTok1y2Aq8AGb0KeSVDTkIyLplnc4aSqnYdVk0avRKR3uscugxBgLtNWVJ
 233JjR47U/1AQ3UqtyykVOGeXM+QmSkmGpUWCcf6uPqdNc=
X-Google-Smtp-Source: AGHT+IFv8wOh9rpER2pUo0PPG+cks4EcxcJbuOqUqnJZod59XJVcFjve/LKT2o2uzKKbkBn2eJ2ISAxYJ1wJfs7wxC4=
X-Received: by 2002:a05:690e:159a:20b0:604:3849:9bd1 with SMTP id
 956f58d0204a3-63b9a085f9fmr14201933d50.17.1759830504655; Tue, 07 Oct 2025
 02:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250926070806.292065-1-luc.michel@amd.com>
In-Reply-To: <20250926070806.292065-1-luc.michel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 10:48:13 +0100
X-Gm-Features: AS18NWC-PXH1zuRfPUrWanIwVSwRIedgTNIQUEG3Z6peTTmOBy13hLOpSCZWlFM
Message-ID: <CAFEAcA9xBwNyi3diiNbcFxiic02=ppYxVWchG1nMqSpvcyuV8A@mail.gmail.com>
Subject: Re: [PATCH v6 00/47] AMD Versal Gen 2 support
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 26 Sept 2025 at 08:08, Luc Michel <luc.michel@amd.com> wrote:
>
> v6:
>   - assert that the SoC user provides an FDT instead of creating a
>     dummy one. [Edgar]
>
> v5:
>   - Patch 36 (xlnx-versal-crl versal2 version): replaced `return NULL'
>     with a `g_assert_not_reached()' in the versal2_decode_periph_rst
>     function. [Phil]
>   - Fixed remaining memory leaks in the Versal SoC by adding a finalize
>     function. [Peter]
>   - Patch 39 (cortex-a78ae addition):
>      - Switched to the last r0p3 revision.
>      - Removed the CBAR_RO and BACKCOMPAT_CNTFRQ features.
>      - Fixed the comments referring to TRM sections. [Peter]
>
> v4:
>   - Fixed compilation issues and runtime crashes in 3 intermediate
>     patches. [Edgar]
>   - Introduced a small hack to keep the GEM FDT node order as it was
>     before. This is to avoid kernel iface name swapping (eth0 <-> eth1)
>     in Versal. [Edgar]
>
> v3:
>   - Dropped qemu_get_cpu() usage in the machine code. Added an getter on
>     the SoC interface to retrieve the boot CPU instead. [Phil]
>   - Cleaned the mp_affinity logic. Drop the mask attribute and assume
>     it's always 0xff (the Affx fields in MPIDR are 8 bits long). Use the
>     ARM_AFFx_SHIFT constant instead of hardcoded values in .mp_affinity
>     description. [Phil]
>   - Avocado test renaming in patch 41 instead of 47. [Phil]
>   - Documentation tweak. [Phil]
>
> v2:
>   - Addressed formatting/typo issues [Francisco]
>   - Patch 23: GICv3 first-cpu-idx: addressed the KVM case by bailing
>     out if not 0 at realize. I chose this path as I don't have a clear
>     view of what it means to implement that for KVM. It seems to make
>     sense anyway as this property is meant to be used for modeling of
>     non-SMP systems. [Peter]
>   - Patch 39: added a comment to clarify cortex-a78ae != cortex-a78 [Peter]
>
> Hello,
>
> This series brings support for the AMD Versal Gen 2 (versal2) SoC in
> QEMU. This SoC is the next iteration of the existing Versal SoC.



Applied to target-arm.next, thanks.

-- PMM

