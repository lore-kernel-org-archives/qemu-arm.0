Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA65C83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 09:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbWd-0002bM-Iq; Tue, 15 Jul 2025 05:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbWE-0002Sq-Mz
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:00:14 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbWB-0001mz-DI
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:00:10 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-711a3dda147so55618337b3.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752570006; x=1753174806; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gj2VzXqF+4UwQGer06oEEQSg0TtBpF1Y/J03OFgrvKw=;
 b=vxaykONXlNaHDVg06L8yJBvDVHXVELgKKCHq419vYVHzNSv7N18D8WL8KXhFOVU4SC
 790nGwqCwCmjIptpttUS8IVbAOTygKtRrGvZtO4TjhLZPIk/m8KdKpItSAduFoTl4OP0
 433UDJFfZgdCf8Ckr572w0utxG9bdp5BZ+iyfmLSlDz9phkWFE7IfOSPOe3oPAo6Bi7r
 avW5rMy6sDKuOb2yfzn0tSh8suFdPAv1LOCcPzOtys+MUEAguoYpQYt2qXVaj62QF31g
 Yy7muFcaOPcbCNNBxQka3nfkmRyFqfPHE3KwAbT9MnASnuy2XDCoCI9PHKISiqbY9QOy
 PK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752570006; x=1753174806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gj2VzXqF+4UwQGer06oEEQSg0TtBpF1Y/J03OFgrvKw=;
 b=ZQhHwJDYMMO1jmRQAgPepzdMg3nOmqm1w281DvBoJQzB1NwIzizvFGfgrnBX6UCO+t
 CwZ1RLCr74iF9IKC34hiuP4c+W8+9jWzSVVcHYm2H1NETOVJTwWteMoRAGUoRDsklKIR
 QUt8FK8oiYV9xqgsvFqfoPScCX0NxuGfods1QRkVfRp9o0XnfbOqrV03ItHovzbIFDLX
 +vBg2SuTJPeDE88ZiKxrIwtdxuHGHVHbFbIz8EeiIgB32+1hbQ0Olg02emFstouxU/AV
 SEq09N9PcF4+WQMLawFlFp6DlaRzGSj38+0AZtdH6nzJ7Qy91cg78c/lo8ONaFtKJcy7
 dVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG5FrzvydkttuO7GhpYKP3z7iHExjKDY4or2qsiYgxnVU6HrB6bRWAILpCGYvg7E2CcWMVNGnLoQ==@nongnu.org
X-Gm-Message-State: AOJu0YzIUdMO6iJ0yOlP0uRQdpG9lBsJ6jNSw3YMjEHjr51WSulev+pq
 RvIQiPobGae+7TmUGuT6rQUkbfqnD5Iks+kPXvOyiUu7EnReOZ1/kq6LGrdI00O1826AQKj4/eL
 lFp7OPgbye+AuFO+q8fKpJjwgjMztWOIEycDjMNI18w==
X-Gm-Gg: ASbGncsqSaofVQcweVzETAiG5xPbddgVcGrjYgErp/yKKlpNwXZsM7agk4bauob8Tl/
 JmsD079wvnU6mGK9zYrSW6tsyPwocQWfDv+uyop1jgqDE+B9L4IXCg4Jxt4/wqlzOQf7paGLKOm
 dKroCYDQLPUzaYdtX9xp7yWxfbi0fOJIf+CLjrkKhkKFoHBajXH+ULiXL8dIqLiDY+pa03Wfv3O
 9l0y4Ga
X-Google-Smtp-Source: AGHT+IECFQ7s6n642xlP47pVD0GPQcP5s9JEjKcAL8CkUqYn0dWjRnv4bwmh93agEmKS4x2KlZ1bgIcRu74XJkgMjzc=
X-Received: by 2002:a05:690c:b91:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-717d5f06565mr260322867b3.32.1752570005670; Tue, 15 Jul 2025
 02:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
 <20250715104425.7a6835a6@fedora>
In-Reply-To: <20250715104425.7a6835a6@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jul 2025 09:59:53 +0100
X-Gm-Features: Ac12FXwIOLkL0mWxvl2sMm6uu_ImNxkg03wU2OwA4wKQqIn_juO7K47nNpT-VP0
Message-ID: <CAFEAcA-ry+zydpTnAi40+drtL8b-eMrVWjh=0jv3Uk2NJGuuEQ@mail.gmail.com>
Subject: Re: [PATCH v10 (RESEND) 00/20] Change ghes to use HEST-based offsets
 and add support for error inject
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 15 Jul 2025 at 09:45, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 12 Jun 2025 17:17:24 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
> > Hi Michael,
> >
> > This is v10 of the patch series, rebased to apply after release
> > 10.0. The only difference against v9 is a minor confict resolution.
>
> Michael,
>
> it's been on the list for a while and there are another GHES
> related patches in queue which depend on this series.
>
> Can you pick it up?
>

This series was only sent to qemu-arm, not qemu-devel, which
is probably part of why nobody looked at it. You should
probably resend it to qemu-arm + qemu-devel.

PS: at this point it is too late for new feature work
to get in for 10.1, in my opinion. This needed to already
be in somebody's pull request today.

thanks
-- PMM

