Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C75606A319
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Oct 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DpDtft/t
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJq2K-00010g-Ln; Thu, 22 Oct 2026 06:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJq2G-0000zb-Px
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:28:37 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xJq2D-0006sf-MO
 for qemu-arm@nongnu.org; Thu, 22 Oct 2026 06:28:35 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8ab38a051aaso16666567b3.3
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2026 03:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792664909; cv=none;
 d=google.com; s=arc-20260327;
 b=BzTFY7UzRux9wTJw7j0u9kJoK+ymJMPKzj1ZnJZRTdt/Sog2ImA8UTR+PXhc0z3gts
 Ksp5jjlgtC+kYDSszgILdyQiHP5oVs4ijEtVnEf36x6i4pY3TAGJn2LiXMLjyU4WkUdY
 YpmSaro3Mpou3ADoMjC3Agb0jtGVh2hfQq7QgPO8dXH1IqVYAvX0rgiExUTxnmO2b2rC
 u/y91hXCITXHN2C7hjbfF5jCh0tjPWzZn7ORWsA0u5qSiyzSuyZOoDoz1smBXZHkDqlV
 q8AU4/+qcHXuR6ZxjzPgSUKt5dySQHgBnJXXPW8M8qdnshHijq32e/QCZYDr4uq8D/nV
 GFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bi9/Yrj5aHhJwRPqGy69fpoodMHfZzxTRJdveUrp60k=;
 fh=doMNQ4SGqaKhg3Is9Q5a1ooKhfEJfhqsrRzubOmhiJc=;
 b=fnMQbPV3Ld/uhD45IwSAGXLhl0n5eocjXxYnLJRNGRwbS2q0WqHzy9gCtDKI/MzLaJ
 f+twX9uDQCg8zDepfFkDKtqhENGEbfZgoVaQSR3jVNP6w+vOYl89xvrMqKFidGEApr9Q
 F1sVv9UmOfs3Fj0zEMb/TQ5u2dTfdV58a1ptTTF9jcoT684trKYobFc7nsWm8mPi5dUi
 noTxwdb+d+CzvlcfxinpT8HPLGpo7kFB9swune+NX1XZ8zLIwVYm4by4D9G5aK5H0zFI
 cDk8AY7zsSioJ5+nwjAhdUlAMWfuLE2p9+ozdUpMkMW2RPMYJ/Vbota10EUaV1IECs4Y
 wQkw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792664909; x=1793269709; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bi9/Yrj5aHhJwRPqGy69fpoodMHfZzxTRJdveUrp60k=;
 b=DpDtft/tiTR1SE6VDlJP8EqIbQ3iab46SZjkrFRUsGtC9HaWjCXw+TELTeSWXKlTde
 eRWuVlla56vHxqV1WM+ZGZ3C8oaM01G6g6zZ+t5jV9F3plSO2jSA+3diYbLYO6qp9Fb7
 +i5cNkvezCOB3hQxjW+lmZoW8j94TWsd3z8ECB1pooJcTx8UjFAniY5RR+Hwbza9wkPb
 GAnwUgYjJh9+iLnat8BNeWmk5T6jPJQTpNHoRhMkYuy2q8EK4+YEQWnhj+dQmpJni8IO
 jwRFVH64lVAiZ8/MqUeB8euOU4GKAEbo/qbBl/Box48gM6Kr2t/dpYZUAli4QELLYQQi
 9muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792664909; x=1793269709;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bi9/Yrj5aHhJwRPqGy69fpoodMHfZzxTRJdveUrp60k=;
 b=XdgdTpBbwEL+opIJB2tJg3vwRDWFB04Y2NMUG2F3YSW0xxaeCHsLKPcO4fu/ud4aZ+
 lY+6NW38P2rjD/K7IAUaePPpF29IHB3Cgr/hEqkD7V1L/jaq7MTrmvdOXLjREDMp3K9n
 DWP4hl1M00sh0XtSFgIThgqaa+EM9usRDtKdNspHOrFIO+NUx68/jZWGU5O0SxXnH24V
 bvEQ6Kyx0j9VBMWAfIgpRsG7EWZDVGeiDGyXoJMJy1A+e8NjvNR5ZWkQXrOI94g4ekEO
 DV9L1LT7jw/McR8Ugpg5Ts3CBljEhPAGK9VctO6UUJRgkvxriKcBHNT0T8k2Fr56nxOx
 Lz8A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDfCcUNrAS/3udzykrrIFJqmhMDW7xqu7JlbDvYAPRlPDv1RPmlrWHLRcjrwETdgYBN/Ghe5z7+Q==@nongnu.org
X-Gm-Message-State: AFq9FYIskCXPVeh+UWNXmU+d/g05NUf3vvpoAEkLfjHt52NUZaUWUD3/
 HMoDOdyBIS0Oj4mOCY46vmKACD+Ct7fx2tyQmQBRZle2zJDXtqvdzSNgvutRQuHstQHaPB+DEvo
 ivoGM+3+6ilDKxnYbgogFZepAqJUPXpEb6jqjPcn0dQ==
X-Gm-Gg: AYBFou0rYv1VEfKKVh1hkkUiUHX21cGWO/cV+5KgbSjrWW6MQzNJ/rbm7CfSux27zpH
 /L2e0v5EPwe1tRxLIrUwvYnjCuzksQ51P36uU5ViSDSI+JKU3DRulxu3uh10YZ0ZLW/UPRASTcJ
 6hPUpcwRgCzsHD4ezhqDr1vb7fbIWfJrtRVoBsleCFOttnzstUcUffHoEd6d0VNkp6/lh+4X12Q
 gNm6P1wEmOAe+HlRGUbfyKbNMl2ungIaGBN0eUobn6nKx+6LdZIDvgz+ztnfVJJY+kbnVVTmzJj
 0q8NlhwrmVohLJ0AHb/saG00X9GBoeMCfUFmVBIE4rcGNRMZZeGBouAOhV/udobUqwXA8MJt/fb
 g8thORaMwEJ0Bl5R9k3XP25/71zQymSWMUFFnwk+6er82hM/lBO0YHlzh3oNNm/1qpx5gAj9Hzl
 lHG90AMspFAYInB5nRM9hEgpqNqI5kJJa7Cl2eQUA/2ds=
X-Received: by 2002:a05:690c:e20c:10b0:8b0:6866:c55f with SMTP id
 00721157ae682-8b133f40fb6mr18913637b3.46.1792664909250; Thu, 22 Oct 2026
 03:28:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261010133725.642498-1-eric.auger@redhat.com>
 <20261010133725.642498-2-eric.auger@redhat.com>
In-Reply-To: <20261010133725.642498-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Oct 2026 11:28:17 +0100
X-Gm-Features: AclHuK_1uR0exODAeKMpAGKzedhGf6mf8KFDecCGvUHfOXUQRy65hEGCVhlibfM
Message-ID: <CAFEAcA-Ab8wkv0vedznXdzx2u2RopoRfr7SHnqt3Fr71yj=vBQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/26] target/arm: Move REVIDR into isar.idregs[]
 storage
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 kvmarm@lists.linux.dev, shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 yangjinqian1@huawei.com, cohuck@redhat.com, richard.henderson@linaro.org, 
 sebott@redhat.com, skolothumtho@nvidia.com, philmd@oss.qualcomm.com, 
 maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
 jdenemar@redhat.com
Content-Type: text/plain; charset="UTF-8"
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 10 Oct 2026 at 14:37, Eric Auger <eric.auger@redhat.com> wrote:
>
> Move REVIDR into the isar.idregs[] array as other ID registers.
> This will allow to overwrite it as others.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

