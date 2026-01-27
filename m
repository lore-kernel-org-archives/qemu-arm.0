Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B621D2D8E3
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 10:03:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkfup-0003YM-Ic; Tue, 27 Jan 2026 05:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkfue-0003Q4-6v
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 05:03:11 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkfuZ-00059u-Vn
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 05:03:06 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64959e30705so4120945d50.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 02:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769508182; cv=none;
 d=google.com; s=arc-20240605;
 b=bKmQED0fx7iaPb+uuvnAbwoPJE8yz15hU7H/ihUuiKWFqtN2HVft75xW2gbwcUk5OB
 moVpirqlcsJYXySnFE2q9iqqwH4dHBruBSFB8dt4I+i47DeY5vv2NOAPh3MEKW764eCv
 FEz74yAS4yVxSIqCW6COftmJgpObTysdKO5GY0A8UH6260Zo9eqThRAGZfKZCSqxdd04
 ocKL5vu1BdUSry0xDCBp/ibGajrd+ltBxbeVRpGbRa5qDizmgVKmzTn+9lct1XUmvDf3
 WPebVK8sUC1zvK76OnMGz0VUY1WyCPaRoun8D//Jw2JZLvDyTA74WcQz8L+12KtzER0p
 lw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mMYC73AAK0xe0frY0GBjv0H4WaVO0aWaGbYrnPxRlKk=;
 fh=vFkDrxA+H8D9cyv0dczD87I5GCr+WdRgAPXj1i5GBCw=;
 b=F+Csx0Jc0Jtd/8os29GcjK3OmvwT5/VxXeP0ePWYKjVfefpnHEVvKaJh44+iuw07HG
 K5kPd7mhsVNE4dW4XwdzR6o2jGdJOY0lLPg9GU81dfaWsdNC3OCVkfus+D/BBYQzgc6r
 AsgNfDK0X3cxggrI6lnCzf1kCIt/niVcjNG8qvbwmoQ0Lp3vfmOo+uhQJTZ/J0GIwbWx
 LAloIxno/qkgPweP/DRxY8arXJ5i7NbyBmVUt/xtXelSoSyXm7ot6MlNbm3quo5JyymU
 W2JceSVj1t2AsGtAo9h7jg1QHgDFx49ONnJ5JYwLpjKkBQfkjWKdSejQsT8gWLtJX+JR
 p2CA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769508182; x=1770112982; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mMYC73AAK0xe0frY0GBjv0H4WaVO0aWaGbYrnPxRlKk=;
 b=Y+N7HbfeoonDdf6xFMFvG4z1lMxv7o0nlS87BHuJu6fn0LHpCUQqU/gdpkyTTDxDAb
 Hmizp2/qo1OX0tsYHE/U78y1IiRYIZgPLnb9EWVGk1vBjpuSq9NgeeIYe4f1p0qr95wi
 ePoxKRkhqft+GlPpaAbkPyP7GnD6+/6YL1F1I/NODzUPUwOkjKI0s0793rI3YA2x0SVe
 gGrzHJm1EChitWq9TWpZNS+xUts+CI2ql05mRoeKzrhD4wC8PlBu20K/xI9V45VLJR6D
 P64cVVqbLvcMrNH/e2e6fMVDeQLoKInYIu8Q5aiv/2yTe8f9A8ZGzGTTkbCaIrsmlSTR
 Ar2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769508182; x=1770112982;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mMYC73AAK0xe0frY0GBjv0H4WaVO0aWaGbYrnPxRlKk=;
 b=ZXArm+FZPf/6IHHumQaT7C8uLryHeXDj2vTXN2+9YC/KFxmcft9t/X17jbBShZCQPb
 zBbf9xtdKjcFejDbpMr8eu8TQwgKL88/xZv8mCfIgjjvBuk9Ai4Hb5k5+Qv0HhL/oiTa
 2KTMWyaFqXAOToC3xSGGOXGqA+a5dIXtLdPBlebta1GcOmnZ1RyVm0pUzjrqIAhO1Z75
 2Ny1ojn7/vDYdvFaNi0MjO6i/9u1RAwixG/FdDjwwgJWuFykLNknI10fIq8eKYETc/+p
 h/wfyeHZYlxDIX9I561c9nLEf7M7dAa61ppaEZ46DKCBCE2/gmTzbWwNTcMIHtCWVF7L
 DpXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjBVpM98UYth8W/Pkx+DpExlJMIVGAowQ2NGhLw586UShP1UTnGNkYWskouvYg1nfgus85Sfjo2A==@nongnu.org
X-Gm-Message-State: AOJu0Yx6rmafc2BafTj8WSls1rmWtf9t++pcC4JswWDOAVMhAfrvltjV
 T0TCOvnEvY9IdU5SrynUlh8LTPVuOJp3yG1aU++4nwDk0NoIloRYv6YaPG7i6JnP9a6xSMM6eDv
 MdAfMB3jHxQ6Hg3mfu1jBuMMvXau/oo5RzmX3eBhOtw==
X-Gm-Gg: AZuq6aJK6YLJ9IYG/SY7gV2bl7t9b56qD+eKfeOLYWfXrYHhhUKZwpasEiuV46v/vlj
 MPqqEOahDPSKT+zf8vLsGyvcv6arXIjilgSEgQepyNMulf2BqBUDuRZtas8CDwz8uUjbPyomVmV
 wny/hlDf8zRYu5EB+1q2fVk5hqEP27nM3BJZrNrmjxunux++Kl4DX71YlIp4x739Jx7NVtlij6m
 boAqgccXcO2k57+kafLSzsY9KWVtLzXFr6nQt2s1h7rwpPIHvzDIOv5ipDBznhatYQl5A==
X-Received: by 2002:a05:690c:992:b0:78f:984b:4bb5 with SMTP id
 00721157ae682-7947ac92fa6mr11035667b3.64.1769508182060; Tue, 27 Jan 2026
 02:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 10:02:50 +0000
X-Gm-Features: AZwV_QjlrwRmcic-KhmDi_rLxdXSusFcfty7IMXfVAMCunt8qseqf5y0IzNHBL8
Message-ID: <CAFEAcA9NEjaUBX19sdw9TRCKcKn8CQfvoVNZ+VaXOcNZ8kf24g@mail.gmail.com>
Subject: Re: [PATCH 00/27] hw/arm: Add generic FDT-based machine and
 infrastructure
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Ruslan_Ruslichenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Mon, 26 Jan 2026 at 17:43, Ruslan Ruslichenko
<ruslichenko.r@gmail.com> wrote:
>
> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
>
> This patch series introduces new ARM machine model, arm-generic-fdt, and the underlying infrastructure required to instantiate a QEMU machine from a Device Tree.

I'm afraid this has been a feature that has been suggested from
time to time, but which I don't think is workable in general.

Device tree files are designed to provide enough information to
the guest kernel to allow it to find non-probeable hardware. They
are not designed to provide enough information to QEMU to allow
it to create and wire up all the hardware present on the system.

There are specific niches where it can be made to work -- I think
Xilinx have or had a setup where they were generating an FPGA
model and a device tree and a guest kernel all from the same
single data source, so they could put everything necessary into
the dtb, for example -- but I don't think it works in the
general case. As one simple example, the DTB doesn't generally
have any information about how the Secure world works in an Arm
system, because Linux doesn't care about the Secure world. It
also doesn't usually have information that the guest OS can
probe for itself at runtime.

There has been periodic discussion of more flexible user-driven
board creation, but that has generally been with the idea of using
the QMP monitor to orchestrate creation and connection of device
models.

thanks
-- PMM

