Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14EED13C3C
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 15:57:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkOyF-0001zh-RT; Mon, 26 Jan 2026 10:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkOyE-0001tM-1w
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 10:57:42 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkOyA-00048w-1S
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 10:57:41 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-78fc3572431so45011397b3.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 07:57:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769443036; cv=none;
 d=google.com; s=arc-20240605;
 b=WDyIM2gXbwIV7ZUiWHtrg8q6u+oVs0NWQW5zj0kVa+b478viM7tHAt+zP3EX63oHfu
 OaxaCuha4uruxpcJOs4K12T/ImYJvXpXgXpuoIbuPIzVh1skzN1lQTC98Cg9B17llqSj
 6mq730+lH2rU67EDvg/T8kvzzJNKINp4jNsbKyxvowsfSGsEiOp+i3dPLGQfTVAtZQEh
 Cjif7/3d0tMH0lsba4jKolQ38EMPHjw68JjNfKMjF++IHhcETIWIctojYp9pB+S76WTD
 Vhkj0Tbpgs2F5MPINe6rV1vFgQF/BpT8qGDouzrFgjvO7kUcqaG1CFUJYvypFPQi8vnH
 y1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3TFTYGTUCnfBohj+5pRRLLDiJ6Trzudjzgoa1grlkIk=;
 fh=hC0bclmQAe3JYgBvRWLY/Zp12DfrarP0mW6WcIWdOa0=;
 b=Z2fHnT1BBTP90+LuxqvGhIv/H3MVlytuLpYkfGGJt/0oBGDuBP7UnB5ZTggmsqZGPR
 1ccR61jhLh62SwUonYaSmNPyA7SALj+1GnFExHy8ruGJvggDn7/soOQwXmFQBaetAX28
 3fN7HakWQv6Ilf9NJyrEi0BbKClS7wN59axpTmdf2r4lkU+DZx922ZoYu+/s98FX79JH
 NcqXdAM+iuMOtuhHKxQRsoRJv982g2AulO9lKJMv1s0ttCnIEpy58r2mt8095W1Ikwdj
 /QSlut6Ud9ZyGeJy/5Co7YtZmGmbQFZZeAnW7ezVw/HsrWeyWU+3bR91/4NmW8oFP2Wf
 dvwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769443036; x=1770047836; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TFTYGTUCnfBohj+5pRRLLDiJ6Trzudjzgoa1grlkIk=;
 b=qGLX8QVzRYiUAI8dGK2AMRKna/HKk9odGF9Jd763VZCGuCmgixOK+uRQPGwdVKVO9i
 gqtk19EjFXHUubf/Okq/qKOUVR6qx6NVx8cOobiHXt14Zx46I8qDBeKirkfYSacUYaNp
 kyBJzv4sIuZakdGWfvtB8pCgbnga2ZT/JYV7OgMkIe7ufKV1QrfdninC26C9DR2AK5KR
 7RKavk32FckFAC1m4NMfSg6YU3x4zqIOUxmq1sU8ELpeQ0KnwWwnG+qZ+/pDQKge3znB
 Zje2Ej+tLEUPV/vdAsmtIuLHZo8tf5Wp11FL6k7EVgBsvk9F/Yr/AbizJEzVby+ZqhlI
 gouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769443036; x=1770047836;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3TFTYGTUCnfBohj+5pRRLLDiJ6Trzudjzgoa1grlkIk=;
 b=vUHtFPRIuvKcela/lv9cvgK0PbOPxXsqf+ikGiGS7jrhH+9GH6UhpAsBZaeXeuWRF2
 Pj3azp1e36O4hDG3K+n1hddc+5wNmdAtBR7HQCt7nzfFu2FggkJ2I56vorbUpOP5PKRy
 2wLmjP/lG81pD3UM9Lw0oFhpSA8MTjBVRNEXx0mtLxw/uuQTXNZ1pV4Cd01d47gDKQGj
 o9LQGrNAnogzashRNMao/CDlntpwHDdbn0T4Xu2TzFtbkKaYM7XFslDMBhs3P1yh42SQ
 hTMgXc/xmICk5ARgHKy2EKWMeiIqxQvzzQ+QvIo746Oe7tzC8p3S72MXufOqbUsQYuj+
 WD1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWsq+AOSKyqHDYfnyLKbQypKwAFhdUG91/DoIIUp4PECkJ+JOHcdtvWC2c7UNx+RHAq7ch6ju+6Q==@nongnu.org
X-Gm-Message-State: AOJu0YyFNFH6NMTprR2LGMkn6nYA2Z0+cgOgrZu3Cy5/P7bM3lEq7okg
 qYp9TvPE3vXCTQeWE/Xx8fYgV9YKs/oqa7Vk0uaS9VX+UNRTaXX9rR4VfbKqg+7MyqufuyXEnb4
 DgF3x/NAm/Exbss7h3xqdzy+0xUunejpEUGH5QWJ20A==
X-Gm-Gg: AZuq6aKYujm3tC4WR3t9dgswKfX7cvsMm5QSjNDz+OLmT65qz4M4Ney4Eq8BXXG+OeN
 WMDoBNizAkC2t4vh55ejA6v+0cZkWo3LKGKI33n8eFfZ+PK126YaN5c3ZPxjwoGdlSJ5d4UqW6F
 Q1rvhiQe7K0q2RzJvM+ZEhM9PQ8vyHYw4CNSLNIxk63+zynS83tsWpdayGsxPh4ENSIjOzvWW6Z
 4h5mtUqphu/U3UFr2WxUGqzqZUxxuJ4SZ0OvyXLGHJMnN7T5CjL/rm3hggaeK21nKwP7Q==
X-Received: by 2002:a05:690c:e3ee:b0:792:7c92:4626 with SMTP id
 00721157ae682-7945a9bcfa1mr38071007b3.51.1769443036567; Mon, 26 Jan 2026
 07:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20260118215945.46693-1-philmd@linaro.org>
In-Reply-To: <20260118215945.46693-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jan 2026 15:57:03 +0000
X-Gm-Features: AZwV_QgGONqiM5hKluAzXeGmPICJqmu7lLf-3aKE73sgb4xrgzeLRgmBbR1rekw
Message-ID: <CAFEAcA_3-YuPdkgBE_PA5ik4rH7_KkKU1JEGpYf0mm5nS=Aq+g@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] accel/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Sun, 18 Jan 2026 at 21:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since v4:
> - Addressed Akihiko's comments
>  . Do not introduce hvf_arch_cpu_synchronize_[pre/post]exec() hooks
>  . Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0 in hvf_[put/get]_registers()
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   target/arm/hvf: Move hvf_sysreg_[read,write]_cp() functions around
>   target/arm/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
>
>  target/arm/hvf/hvf.c | 167 +++++++++++++++++++++++++------------------
>  1 file changed, 96 insertions(+), 71 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

