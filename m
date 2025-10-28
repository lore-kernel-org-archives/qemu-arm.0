Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8ADCCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 10:19:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDgnJ-0005M8-Aa; Tue, 28 Oct 2025 06:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDgnC-0005Kw-MH
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:19:08 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDgn9-0001tT-Qm
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:19:06 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-78487b0960bso61696697b3.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761646736; x=1762251536; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPXBGY/nsuMNTA/zdfPQs7Znj2i1KdprWmwqufvWZ0U=;
 b=mFd0UXKn8G4dzbRVS+RDIiifzR/hkzDnO/VsbxHaq7kFJPgQHUvqbnJ7gunKKEGa2r
 OkO4HAxAyH1PlL9/2tCmqq02ZMdiKFbgIOyrQHcVBS/6R92B8nRg7MHBw5uUTvClD/n/
 tlWgsXbAK9asV6k+3Ejl6tAf/C1M/3E7ypSfYw121hpOsswxFuqSmJuA3TK6oZN0SIeM
 ZVUPOFueHdzDIJU6DU2hc7O5k2I8LNq20+LAjx7Ycy40/CIfHBJ+Sj3PN1n+e9o34siQ
 QB++KBfo4VLFmgQ5/iqZg4duTxYOIPhW32VbfUjz1E7wGHBwYB7YxpY6/T9S3LsNIlhq
 RJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761646736; x=1762251536;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPXBGY/nsuMNTA/zdfPQs7Znj2i1KdprWmwqufvWZ0U=;
 b=Gv7vF/8hIQaCW5F4rj/KWDrCcseLACOWP+upYtOSLFezmdG4o9SF5VBsw/NW26rgI7
 2oq/YJHlEugJ1jr6W+reMEtLTU7xgq/8LwYgIBuIChspR5XRcyzJLJBZfP7xQ+SKXO1H
 S/PfgEs5bvUQ0SA6mdhunUcPSnA2v+rO89rkvlhBFoA/QgerC1C/5KYr3A7Nkw1pFLHl
 tT2ALTZQN3ZqcA8yPpwwjdD/IeE3tifymP1oxYwIaQX6/euxtabaaDZpTHhBGLvZSiMx
 w9dIkd0ATgN72LryeLlYQiRqQIpeWEEkYmk2wM53CSl5xxqwRr6p+348OiWY91T4r9cE
 cPTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgZPLA+ug9oHsjSdeX6Ek4H1xtz/SR9Dct7fTzEFRVhivH85/o6D+iru462PaTWT8dxQcC/BbPnw==@nongnu.org
X-Gm-Message-State: AOJu0Ywiy2h11ss7R93HjOV4Xep5ZuFY6lEEabqlL1tkXGZp3UVqJEZo
 a0fvMqyXmpItUz0vtm18kCPFUrC3kUQsHJFZW9XIKN2BxdGZ5MNFQsTLxoFk0s2XXwyU+1vUjOl
 d9gSyLy1HD9i4RpXd6iMX1yGcuUXifIDsbwn8MpjIiQ==
X-Gm-Gg: ASbGncslDV8uOhLwItUqZe8zE+QLvIq4N8p+bZh0PsgZb6qkVR/htqniYOU+SFruHV8
 kV/v0j3/IP/7U5nOmPhWglaqwmEe35G3/jb/RvTVgpTsNOHhHTpCGLgCpJBhtRevqTwg2JS1gUN
 sDQvBeIZK5N+SPw2rEpwW02ObpPg+kgXyERhqg+m4M9lO2Ic75CUrXgU+V8WzOMf0g3csw/Dt6e
 BtDvpNOMGGJGhd4QZCt94p0yoVUepfFL9X/37uBiHe5XOhvmKHrTrkSILT/5A==
X-Google-Smtp-Source: AGHT+IGo/aQ02TccOTY7s0s+Kc0g9mNurT8J1bD513Z9K4sUsAxjjkcstRCIyM0K4Tv7EKX/1714cEiH7BrRpKz3S+Q=
X-Received: by 2002:a05:690c:61c3:b0:785:5e62:f6d1 with SMTP id
 00721157ae682-7861816fc47mr26694217b3.61.1761646736080; Tue, 28 Oct 2025
 03:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251020094022.68768-1-philmd@linaro.org>
In-Reply-To: <20251020094022.68768-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 10:18:44 +0000
X-Gm-Features: AWmQ_bm_TZHD6yVKf24hHJJ6Th8wAQymbucWgGTS_VkwsTu4tdOBH5ndPc2vlz8
Message-ID: <CAFEAcA8koM_7QdJHjoJG2x+7LamY8rTV0tYkUVBRyphKNALUzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Remove virt-4.1 and virt-4.2 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 20 Oct 2025 at 10:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since v1:
> - Do not remove virt-6.0 -> virt-7.2 (danpb)
>
> Remove the deprecated virt-4.1 and virt-4.2 machines,
> which are older than 6 years. Remove resulting dead code.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/virt: Remove deprecated virt-4.1 machine
>   hw/arm/virt: Remove VirtMachineClass::no_ged field
>   hw/arm/virt: Remove deprecated virt-4.2 machine
>   hw/arm/virt: Remove VirtMachineClass::kvm_no_adjvtime field
>



Applied to target-arm.next, thanks.

-- PMM

