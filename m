Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B02FCCF2DA
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 09:30:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIjgj-00068N-DM; Mon, 19 Oct 2026 05:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjgh-00067f-Bn
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 05:29:47 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIjgf-0003LE-Pk
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 05:29:47 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8ac525c1f05so12611477b3.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 02:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792402184; cv=none;
 d=google.com; s=arc-20260327;
 b=NuPQDzAVkTFnV4X1r1vnCV8m6bjdbnqlsGlogV0FjrDkKLwXFAIBr+MqsF2iNZMMTf
 CkRLs3qmaat7eBcfLjaIydcv9JBwCMr1wllty6+18jXZimYN+0ipkAg2fsiJo7NwjmAI
 CtVslMX3bZGwsxD5YCNpictTygRRoem2/MEIcYSBwV8Q/xybOvXnQpyfzWIVR+9RxO1/
 i1imoffZaxXh8azSMWLnMUWWadSqEsY4DzAA9eP8EI3MQYo/MBxG9PefBv1SA5HVo/OQ
 So2jWhllvudRgIDuqR50ecrwcFUg73x6iA+NBndlcbhjr4FXxBiz6XUbukoz9c5fvj0X
 JfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Wu/aJVrJjYsU7n16Y8vhi1YVFKpn9Ard0xiCuPPmtaE=;
 fh=R3R353c33aU2sQisylhxeEFfrH2i76q0LRF5YYD0n80=;
 b=FvC1Wvd8Dhp7MLsQbhiVfzxOMMHirO6GddaHJtU4/xMyIvrGV9shDjKPWYyT9eA6Lm
 rTraohmTMst0RG8k1IJpaogKHUaw2ssmLr3d23cZE5Jsou502yvAvY2M0d9bYYzTMD/H
 1Iluh90S2UWy6PPkCjvH5H5bds7/WM20KGvuRd2DU+ZsBQgoSblvyDVocow+EgIUCsWZ
 NSzs6HrNAFAhgXTyxU9FFPF5hDQeDMN17OvDdJEH0usw/SsyquyKq6sJWW4O4crVYa9J
 NMFITfsgvHkA5B3jCqmDRHo7z0f1lKjrJfERck/W0z74v0lM02ULMenXHMl9ofG9QMyy
 G+Lg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792402184; x=1793006984; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Wu/aJVrJjYsU7n16Y8vhi1YVFKpn9Ard0xiCuPPmtaE=;
 b=AHrCL7twMCDT2lj3OjlhI39eKhTXbUwFQXk6naXjFbBDUiYc8hkt1Bl4lukjd1HJr4
 0cbcPxd6LVBb2tDbiNYGPa3V+7290C5r4tv8emFHxkRNOG74phPZxpRl9wBnYLMGRV8M
 XpJ224LlIGjlPytPUTVFDbZ+WfvLNgD0Rc+gVMmV0Gb2XXHW0P3PopYwYNpDYNnOZN9l
 Y3De9k1YFNicYqaQkOPH3Wkn/E84mcE0eWSxp2zGcu65cKawh3Zwm+aqWTf86SH7angW
 q6Mosc1Pph7vUuflKzpwFFjhS93jbpdYSMAE8C7AlVUPEUqOe5ynwDe2MhNMS8U4Om+C
 mOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792402184; x=1793006984;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Wu/aJVrJjYsU7n16Y8vhi1YVFKpn9Ard0xiCuPPmtaE=;
 b=fByUAivfUccNguKNWux9S/d8+rAkjPWplGb6nGZH9jt05EQiO/vjJQoCirZFe0Jry/
 FO7RrUbp7F4lQltVVgqZGk08OmMxeojvEmvXV8SSnYLOjhjAvt5jU0aU3bubY/yxReiR
 IKlxdpy2lN+udoDo0o9t0h4sw6AskSmcDVpLbKRMI/DPmugtYwJtUUODWvwH6ItI1NfR
 WRbulqRh3jx3G5WMD6HTmIRVnRnbegU0RrVHF7Ov3k1Q5KofVkWXFBIB5vEPH016zqb9
 PsW1oIM1tSxNpm1IQEDQ4cSe7kQlc3xmUcmfS0y2A5TefAZo4vLpmyJ+3EQ1L/R4MbSd
 Chwg==
X-Forwarded-Encrypted: i=1;
 AKwUvByGiqJ8nMwOXcsKNDAVra9mxx8CF2uOE5SQhDvJ1816qtWS/hDrVMiSbGlOXUij4vmbQFjrAUP+jA==@nongnu.org
X-Gm-Message-State: AFq9FYLmyOAaVzZhF3m9tE6AhS6mPxF9rJe4XQdJkhoToaMiaA8BQOAY
 zRfW343/HdqkKlxEkDnjTD1eQu45Mn4P3lxzjUftEcC9VmnG1T3cwuGJR1cmo0gJJgdhhMG7l7f
 cPQ6S1bQ2CXYODZrGrMe0X93o+g1z/9hZ3QwCzzzmwA==
X-Gm-Gg: AYBFou3BqBX/hZ6ZS21J+Wwsz9K+rOeq4VFKhX1xmM0Wz7hh2gm48MqtsHnPnJ4xLia
 gr/BZ1Zbg2x3wEs8RCDQi9fjxDCAOj8DVADndfTJCl7SKaSjKpql+hfcsFzwd0g5jCtLQPyEgQw
 6MD2x69Q6J7sao97eeqmTY85BDNYIpmGCv1jElr8ykgE60vadBmPIvIKfgRGYDe+VjIp84TGmqg
 bruNRh78MecqgE/gBXG9vNhQNU+vgI4ZeYFaSlwD/Odwhmd8IUTF52L/p8GMWDEV69Eq33fMtWP
 b3n/U4RRfSIpFYp6ELAdDcvQsHFS6lM+I8kQp1mapMM6/s/DI+IDvLTtrYmg4NYkUbQCS1NIxwv
 vLoCpmV/GxMJxwJBRBozXPzZKacZM1FIhMUtvM6o=
X-Received: by 2002:a05:690c:582:b0:8b0:ad5b:d466 with SMTP id
 00721157ae682-8b0f2169b86mr25778217b3.25.1792402184296; Mon, 19 Oct 2026
 02:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261016094733.1898485-1-2118537295@qq.com>
 <tencent_0D8D61C20611EC56598A6F86E7B869052E05@qq.com>
 <87fqy23vag.fsf@draig.linaro.org>
 <bbdf0c72-b842-4c06-b4d8-85c6613fb64f@huawei.com>
In-Reply-To: <bbdf0c72-b842-4c06-b4d8-85c6613fb64f@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2026 10:29:32 +0100
X-Gm-Features: AclHuK_83zqwDeRCTJnjFQoF8lhhb65lU7wQASrI2Z2OJ6aeMdRsqZRi4pGZUMA
Message-ID: <CAFEAcA-vWJ2iMoGhF6kcKWH18cH=gy79X3-2PdQ_sNrz1-iJZA@mail.gmail.com>
Subject: Re: [PATCH 01/37] target/arm: Add support for MPAM CPU registers
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Jinjie Ruan <2118537295@qq.com>, anisinha@redhat.com, armbru@redhat.com, 
 eblake@redhat.com, imammedo@redhat.com, michael.roth@amd.com, mst@redhat.com, 
 pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Mon, 19 Oct 2026 at 10:21, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> =E5=9C=A8 2026/10/19 17:16, Alex Benn=C3=A9e =E5=86=99=E9=81=93:
> > Jinjie Ruan <2118537295@qq.com> writes:
> >
> >> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>
> >> Add the MPAM system registers for TCG: MPAMIDR_EL1 (RO) reporting 64
> >> PARTIDs and 4 PMGs, and MPAM0_EL1/MPAM1_EL1 (RW, of which only
> >> MPAM1_EL1.MPAMEN is architecturally reset). Advertise FEAT_MPAM via
> >> ID_AA64PFR0.MPAM for TCG CPUs.

> > Something is wrong with this thread, when I was reading the cover lette=
r
> > I couldn't find the rest of the thread. How did you post this series? I=
t
> > looks like the cover letter, first 16 and remaining patches where sent
> > in separate batches?
>
> Hi Alex,
>
> Sorry, due to SMTP rate limiting, this series has been split into
> multiple threads. The complete 37 patches are as follows:
>
> - cover letter:
> https://lore.kernel.org/all/tencent_22E95650AA60C6E59860452C0D61A21F1105@=
qq.com/
>
> - patch 1 ~ 16:
> https://lore.kernel.org/all/tencent_0D8D61C20611EC56598A6F86E7B869052E05@=
qq.com/
>
>
> - patch 17 ~ 37:
> https://lore.kernel.org/all/tencent_88B063FC15FDB4BD89164484DB67A9B61907@=
qq.com/#t

This is OK for initial first pass human review, but you'll need
to fix this for future submissions, because it breaks the automated
patch handling tooling. I do fix this up for first-time submitters
for small series, but 37 patches is way too many to fix up by hand,
so this isn't going to get applied unless it appears as a complete
series in one thread on the list.

Note that you don't need to *send* all 38 emails in one big lump,
you just need to send them so they all have the right threading
headers.

thanks
-- PMM

