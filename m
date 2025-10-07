Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70487CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 09:50:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64LG-0007Iz-Te; Tue, 07 Oct 2025 05:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64LD-0007FU-R0
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:50:44 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64LB-0003Is-Sw
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:50:43 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-72ce9790acdso65735017b3.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759830640; x=1760435440; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QQRlGq5iEz0PqBDGwqnp4uIgDuZXe6UJ5EjGAWxfQU=;
 b=OMXN4nS2j7KKGw11nqCYTvVQgQ0xsEFgj7mHaLvRGwk/iPNGgpScbfHahvrI2+quBZ
 X69G0oP6+TWj2E+CW97eM+kdFxfKQ/6cnAxo6YjxYw2pj0eebIkLJ3wTXPXg2y/uYCTl
 P5eBIY4GjUeGQ/5luKN3n8+4fvItb51gNGo+YDb00HbysfdBOZmZwrH0KiIMB6Y+m8VM
 an4/rvuVd2b9rKFngHnk4LUpaWB2hFlh/fVCiOmcwqyX/zN3w8s7piqcC/YDN3Z8SIOX
 kp1qm1D61VzsR9My0IC0rr5MM29C9A9i17QvdjGsEU3E3JOamkgLXK0p5DUHQcgCUe4P
 LqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759830640; x=1760435440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6QQRlGq5iEz0PqBDGwqnp4uIgDuZXe6UJ5EjGAWxfQU=;
 b=ZHRNlX79h1E7D++LkRN7Un7y/O9mfcbWeZpUstoCWApUx3cRuPW6JZ5A37pAX/UqF4
 7UrG3qMNro0xJyBG6eUAi83dqmUYeFReylYayUNRgJwCSmlGpsu2omEBbqb5avVjEs88
 9Or8JuZ0v2gLo04AvwR7NdOgIj2ch1dj3xlE+SyBRM3k6GEaPtUtUzYk9jAWOLNDOJ8p
 we2aqIwU79sFvCUC8XS8t0bu7dChTNPCoNZLssXcocLUEJ0X41kL3R9qra2iZovUgHus
 61XPPv545QeQCbGq0pJzKTdVOEStt5iM99DKQCJh6RMou8NpCqMfcC+ohZlAhrjMUlnb
 ZMIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbyIOjmeUsL5HBWhcnS9NjNFSdvvJmGiHupbQpRU5GsHOOm+UGcpaH+koTz3/ELLGBh3UMT+0u1Q==@nongnu.org
X-Gm-Message-State: AOJu0YwziRPQpUydWzy+G/ZQSsr37WyQtsnUreGD5ftIqoqeBXtPLN+j
 45Q/HYVmfvXierdYCdcoLSzzthPEnU8mqYn940Gtb2bfMhawXc3uwsSt65CC/rjJlNvjk5vOHiF
 uqr/HvhjvqOso3t0Q9uEC/V6QlwQPff5LGfkDxhaQcA==
X-Gm-Gg: ASbGncsz5cQVrsbIVDTLRvQoE+7o5QYW6pwkh197nlIdOUIsH9WY1xhBNk4rORCqlnP
 AAKmmvIwlijL94fKGpCEiCc6dY46rmCCVBKj1E8PLdnvxIcyRSLBFDjIxKTSNhYOdHjj0OClp4d
 AOolS1Zy26xD2WOD6if56MN8eCejX48FdXu9RYUrzHR2eE8RDKzRmIU9JRlaqgEz5eoNNoOocLk
 4vVMxe3N/s+PS/mhL2g0MbpfPxwyJRB/Wzd
X-Google-Smtp-Source: AGHT+IFieBnq/e7LlyNcrWqS4M6wCuEHmQlZlq5ZwlEVYFlZE9046+gKtjdrutxjZglysm+94ZH/DoRgxoO8C9evV/8=
X-Received: by 2002:a53:a0ca:0:b0:633:ab16:f82c with SMTP id
 956f58d0204a3-63b9a0701b0mr11536282d50.18.1759830640358; Tue, 07 Oct 2025
 02:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250930115718.437100-1-chigot@adacore.com>
In-Reply-To: <20250930115718.437100-1-chigot@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 10:50:29 +0100
X-Gm-Features: AS18NWA6Tdg31JfY1JRui4UZtahTggsj4Atu5Tr_AyBkahDNg0zXo04QKve2UM0
Message-ID: <CAFEAcA8+F0jwWaqexO2bbtUp3kuLvg+9v42KAnt7rjj_Vh-_Qg@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/xlnx-zynqmp: wire a second GIC for the
 Cortex-R5
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 30 Sept 2025 at 12:57, Cl=C3=A9ment Chigot <chigot@adacore.com> wro=
te:
>
> The first two patches are minor improvements before the core third
> patch.
>
> This was initially a single patch split as per review comments (see [1])
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2025-09/msg05899.html
>
> Cl=C3=A9ment Chigot (2):
>   hw/arm/xlnx-zynqmp: move GIC_NUM_SPI_INTR define in header
>   hw/arm/xlnx-zynqmp: introduce helper to compute RPU number
>
> Frederic Konrad (1):
>   hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5



Applied to target-arm.next, thanks.

-- PMM

