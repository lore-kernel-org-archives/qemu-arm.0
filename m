Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFCDCD3441
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 20:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKMH9-00050n-PG; Tue, 05 May 2026 16:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wKMGx-0004nG-6w
 for qemu-arm@nongnu.org; Tue, 05 May 2026 16:21:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wKMGu-0001BS-A8
 for qemu-arm@nongnu.org; Tue, 05 May 2026 16:21:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso46153395e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 13:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778012494; x=1778617294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZFpayBCF23pbHHomjkeBRNYj0p8hYI8pLcOn17qbvs=;
 b=HGmo5MYmRoI5n3SpTWSiD6nr6FNtqiaWq4SAaFyUfAKHnzJeOS41GgL7R0m9hJkxbd
 vB9+xP8XreH+UO6DOqLZrR/xeiL0nhkn8ZyCW3yGciKR7IeO66Hw+astGznbFhuo5ysS
 lMkCTPwEcWdruyDnX69wbFDg3qn53CeEJMzoZDApjoFhmKy7uTGxvtDLrwkxujkKGDuH
 zjMYn4AP8HxG5aH33x80H+WvORItuyQHSyf4vzHkEhiTKvcX4Uq8SQjdi0ApJPSLdQbC
 J1087+Ohs4p8tjyBgJIdCf8iTDwQ6hUnsmiOQLaSbjV8TI/7B9bR3zdVdqjXx752KREF
 gi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778012494; x=1778617294;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZZFpayBCF23pbHHomjkeBRNYj0p8hYI8pLcOn17qbvs=;
 b=s4kdqoFC6YukL3ixf6SJTkkkF5Djfr0jNqaQ9JFdvRTZwVCPTzZoIRKjYRZdqtUg80
 NdqsAbM/2u0rmu880goS+wlS7T98yua2n7052LjG5AAvChoFJRYaAZwxKJ4ObXQ57Ua8
 7WJavxiKv0bqracLFk9Zmpt6Z5DVk8hxZBW5D8iokhdiaNxqYfqACvWX4HVn2ON92XvQ
 6aB3KQFXWjw5/gQFXrLVmgGei2kcKM+sETHboeo30+3hFXrYIXeJ0XfaS5pExZ2E7ZOl
 kpxSdDMHJwFDurExW1v3TAsvd15nCJ75pWOp+tgCgNp9ZoSxSJ1YCDVZCie7Rg3UbGFR
 4Khw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AvfVHnkgP+Q2Lazoze/ktF9MC8oUdNmPEH+n4JKjDEmP9DUuDqmdJTnjMxEpO8S3+ucjyHLgI2g==@nongnu.org
X-Gm-Message-State: AOJu0YyRDehxdPEgkoFqjRnZJUyazhVwzJPwUD+4HIjebjHIwGbvDcX/
 2j5s56p/gQnXNKvZKbHda/vAHtjHcvHApu3KR8l646LlFiNXdfjlCqpD
X-Gm-Gg: AeBDieuRPdOI8NBZWCIUx5UhjFNokoVjgtl5+Kif8ZWKdllFP+fstD5jrgNIfdQtqc3
 Tt9LUmo1O3WIYpJf46YFQnzIR4HjgcAnFc+b6ryC0KMi8+4CE8ZOWSo6vl1Q22ab7Vfn4xKIHDr
 S9PI8Nfldhh9854R7vO2NR1W2OWLVuBwApalbc4vQE7IQVYCAKjBGScogzp3nYha0d33TZso1Mf
 QmIZQ/DI+6hxU7jxtipIMnJi3n54ftmcBW///+PkjASsZqGFu3yNeqm3l1AqlrWJeCscEXISsTM
 DfFodHzxrfRZ6JLcQOhA6RtUXEfJudvj8aXlnPtIQiVf8HCOzsJtY3JMCR2Qf3B8NNdSdLwMkzJ
 kXDAqSimdoPTJI7k6g5TUoiTn4lgeNfcJvIfrpVSTWrf+wU5HycVSXMorvmxahotDsSWi/w+K0Z
 2ZANGYEzcmvH0aBsPHnQEGu91HBQvCQuClnfmZIrvzP1bDXH9Vb7nMjtIiCNyMNMVEs70pb7Ao8
 05UvoQAJ+yjxYNW6qy1ArwIH53+2QDAtSXwK2tbTFQRXcLlvgsxjtUVtK+EkJu2NYk=
X-Received: by 2002:a05:600c:8b08:b0:488:a977:8de with SMTP id
 5b1f17b1804b1-48e51f32757mr13011285e9.16.1778012493678; 
 Tue, 05 May 2026 13:21:33 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-2288-5100-c87f-e1c3-d3c0-0c97.310.pool.telefonica.de.
 [2a02:3100:2288:5100:c87f:e1c3:d3c0:c97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e530cf964sm94545e9.1.2026.05.05.13.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 13:21:33 -0700 (PDT)
Date: Tue, 05 May 2026 20:21:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Maty=C3=A1=C5=A1_Bobek?= <matyas.bobek@gmail.com>,
 qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, qemu-arm@nongnu.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>
Subject: Re: [PATCH v3 0/7] hw/arm/sabrelite: Add FlexCAN support
In-Reply-To: <CAFEAcA9kQNdx=gwSd_Ec=R2nwegT1R-BEiC9yXvfr23VJHDZiA@mail.gmail.com>
References: <cover.1777571962.git.matyas.bobek@gmail.com>
 <1B6ED5DC-6808-4A41-B8FA-B2C97C5C8933@gmail.com>
 <CAFEAcA9kQNdx=gwSd_Ec=R2nwegT1R-BEiC9yXvfr23VJHDZiA@mail.gmail.com>
Message-ID: <936E6AF6-32BA-4236-B8A2-0A8E8748D9C1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
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



Am 5=2E Mai 2026 18:41:52 UTC schrieb Peter Maydell <peter=2Emaydell@linar=
o=2Eorg>:
>On Tue, 5 May 2026 at 19:03, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>>
>>
>>
>> Am 30=2E April 2026 18:26:02 UTC schrieb "Maty=C3=A1=C5=A1 Bobek" <maty=
as=2Ebobek@gmail=2Ecom>:
>> >This series adds emulation of the FlexCAN CAN controller, version 2,
>> >found in NXP i=2EMX6 series SoCs=2E The controller is integrated into
>> >fsl-imx6 and the Sabrelite ARM board=2E
>> >
>> >The chip has two FlexCAN controllers, but the Linux Sabrelite
>> >device tree enables only one by default=2E Linux kernel with both
>> >controllers enabled has been tested to work properly (using a custom
>> >device tree)=2E
>> >See docs/system/devices/can=2Erst for an example of QEMU command line
>> >invocation=2E
>> >
>> >More information about the implementation can be found in my bachelor
>> >thesis [1]=2E
>> >
>> >The headers (struct FlexcanRegs and flexcan_regs=2Eh macros) were copi=
ed
>> >from the Linux kernel=2E Marc Kleine-Budde is the copyright holder=2E =
He
>> >has been kindly asked to provide consent, to confirm his approval for
>> >the inclusion of said header fragments into QEMU=2E The approval is st=
ill
>> >pending, hopefully it will be resolved soon=2E I will update the patch=
set
>> >on request if another wording/solution for the copyright statement is
>> >proposed/requested=2E
>>
>> Tested with imx8mp-evk: https://github=2Ecom/shentok/qemu/commits/imx8m=
p-flexcan/ which works excellent=2E Next step after this series is merged w=
ould be upstreaming that branch=2E
>>
>> I guess the only open issue is the licensing of struct FlexcanRegs [1] =
which originates from Linux? How do we proceed here?
>>
>> Best regards,
>> Bernhard
>>
>> [1] https://lore=2Ekernel=2Eorg/qemu-devel/202603211316=2E18181=2Episa@=
fel=2Ecvut=2Ecz/
>
>Could you say what the problem is? In general there is no problem
>with taking header structs from the Linux kernel, as they are
>GPL-2-only and that is a QEMU-compatible license=2E The relevant
>source files or pieces of source files would need to be noted
>as 2-only rather than our default of 2-or-later, but that is
>doable -- we already do that for other things we have borrowed
>from the kernel=2E

In https://lore=2Ekernel=2Eorg/qemu-devel/f3cb3166-c3f8-4ed8-8c9a-cbf48b07=
1d1e@gmail=2Ecom/ I raised this review question: "The following structure l=
ooks like being based on Linux=2E Does this affect the copyright of this fi=
le?" I was just asking for advice and I'm glad the solution is that easy=2E

Best regards,
Bernhard


