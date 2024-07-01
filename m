Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1366758njm;
        Mon, 1 Jul 2024 06:38:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8isbyij4kf4M3HQpF4f/nc1SFKk58FtL+piYrJzv17IV7T3wmE/fdCBmYxjQaRmn4o9wkbxVYy6RuH/fui4QknEXHAEO9
X-Google-Smtp-Source: AGHT+IE4ZbJo8n/hYt2JGJxpBnTtrOjhjoHKROnX4BXpDzfY0/cQOJUgpXTliAf+SZ6ONlrHeZSn
X-Received: by 2002:a25:2b46:0:b0:de4:738b:c2e4 with SMTP id 3f1490d57ef6-e036eb767f3mr6164872276.28.1719841116051;
        Mon, 01 Jul 2024 06:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719841116; cv=none;
        d=google.com; s=arc-20160816;
        b=S0aFJA7yxes0YwStxA+Ig0Pc7J8q9mWRewDVEZYEivrBmx+8BuaZHyVUShYigNibPa
         WZfuCGPhadnitNPchny5J846XmJBwgrMc3u75CqR5i4i0M/2rz5SnG0JzOv5ccmGTcTO
         ED2UZP+MdAKkvy0x9ID6fsqzv5UNnCx7PoxmawB1Rzh3on/3zzsZ1PQRHATnSZXFzMDC
         1mPmMT9b21SoZBidvIntkOO+zRPQZ10QCS+kRzQ1Jj1uHXuZnHbI54JszPQgNP+ghokX
         hZm6XN+jZ4xzhtz+ETpnlDAwlzpmxU90x7zfF8PkBtoLx4Yq6Db5/7RgO0WMKxRTJuJx
         Yuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UE2UxyR+yRXYNpn7/KSUVBXO9jswGFwuc9NKyNHt5jA=;
        fh=Na8dzv6KT/YzUr0WbVhJDtjsZyXZo84hVp8w6AJ9VYc=;
        b=XPtIunqNJChEAQnoCw8/C0PfkeDV++ThihziO0+BztBUfboGSF7t5zh+DHcfhC+aJN
         MxkluOk5F2NQtSxKeH5XBJjWtnUtfc8MASgDg/14LyJ6Y5U903PZ3PpwdWcyWu0TgMYq
         pZ6gKWY6OnJP8IMC1EKlXwkKhUYD90v2kuqGoAE4S6RZ3iTPpFgXU4hsO12OtcENRAjA
         Z4EGcpLMhzo3el+CGpj3RA4uTPSe0UMP3jZ5cY6RsRGMayV9HupK2/w/t/U6hwPWqgm6
         4qHl/eU0Ziu7j42ka1IKKbmIaA7AIhgFz2VayPcUxYtoXJNCDKHLXk1TSN56syiPd6uT
         JR3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgSZvElF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446512cc515si81134311cf.72.2024.07.01.06.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 06:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgSZvElF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOHEB-0004CQ-GN; Mon, 01 Jul 2024 09:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOHE9-0004Bq-PK
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 09:37:53 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOHE7-00044G-U0
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 09:37:53 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso332462566b.1
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719841069; x=1720445869; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UE2UxyR+yRXYNpn7/KSUVBXO9jswGFwuc9NKyNHt5jA=;
 b=YgSZvElFftgH5J872Zlad38pqVhgXMwqUYhgM74Th29XWuC6XUBXiddPKmW0uH9q+c
 dOXpX4q6imYOq57noID+A17kvqhwxgJuznBsjsYpdn8L3AWeX5NnpJHoFs/AnO7mitR2
 DNIFYseplPmQkhnRzEXHKDSkQFS7YOA3Bw6HpuZy1eMGVCf3sqlEyyCHCLlkKc6knjE2
 zTpyruiPOAr1o6LwEFJ0yyjZS6LvBZg7CExqUsgCVoF2+c6KnJlavPzuXsQLQcXMebrr
 sTCq9BCUC0NpwnUqRCliXldegnVWTNJ2XjozaBT3v4bQxd+PBXKd4kAp76oUTbQ8AUYy
 NH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719841069; x=1720445869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UE2UxyR+yRXYNpn7/KSUVBXO9jswGFwuc9NKyNHt5jA=;
 b=kR67Liezxea7KjkMN2N8vz/r3kNZQoHrWYHqbHa7GcZAdVZJoVe5JHqsLbUPB7DHWa
 RYrpDNmqvJlOQYlSeF/m8OSDoKS/wnDoc583du465Q55ceg8MuQrwukz9lYbcATTSByR
 TscY+r3QiFblOT4j666+9AenkR0hl3D1n4bp7k2oLfqXlp8fCMNuTeZJraPaLsRBgXze
 bMVleLOP3FHcedyfQqGDI8ne3PTYO2a4IyeTM7YFpN0OE2EphKYwFuAQ9vb1qQmeEkd3
 92vFueDMEMLs9xxFdVKmZNG1+mEdyGuq8LYZoPyNClhe0JAWCOrIZyxEQ482qS6UgXQ5
 PCZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0FnlcN1w/UD6qsKpT8eIsJ+G2h3rftkSGve8MISG8pVdOnj+y0hXCuPdTlIz4NFgwbOMhKGGLv8ZH8tbSw24UJwZQ
X-Gm-Message-State: AOJu0Yyebom5S/iVW5MBAqhFNaLqQqRI/n1cJXQ+UKjPwipxjhO27II4
 tm/2g6I+6Pw9wf2zYer2+X7gHu0Xo8X1mSUTTBlHjMtmfvRRICoeAd0jrekEac09Rfvk2uT6ZCY
 Mt1yaqXyznRaVr4rA0RrkG63QHuA+JqTsJz45hg==
X-Received: by 2002:a17:906:d204:b0:a72:ae79:8357 with SMTP id
 a640c23a62f3a-a751443bac5mr339387266b.30.1719841068882; Mon, 01 Jul 2024
 06:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240624-b4-move-to-freebsd-v3-0-71496bf119d4@linaro.org>
 <20240624-b4-move-to-freebsd-v3-1-71496bf119d4@linaro.org>
In-Reply-To: <20240624-b4-move-to-freebsd-v3-1-71496bf119d4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2024 14:37:38 +0100
Message-ID: <CAFEAcA-suKn9LAB8qrNaRu9NeG8DyT_ae0va7uSHuiL3VSk+BQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests/avocado: sbsa-ref: add FreeBSD tests
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vFQxVStPKVzT

On Mon, 24 Jun 2024 at 17:20, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
> than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
> so we can stay on 14.x for longer. Tests done on OpenBSD will now be
> done using FreeBSD.
>
> OpenBSD 7.3 stays with Cortex-A57 test for local runs only.
>
> Moved from Neoverse-N1 to Neoverse-N2 as sbsa-ref defaults were changed.
>
> Timeout messages expanded to mention being affected by PAuth emulation.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 75 ++++++++++++++++++++++++--=
------
>  1 file changed, 56 insertions(+), 19 deletions(-)
>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/mac=
hine_aarch64_sbsaref.py
> index 6bb82f2a03..bb2c098aac 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -1,4 +1,4 @@
> -# Functional test that boots a Linux kernel and checks the console
> +# Functional test that boots a kernel and checks the console
>  #
>  # SPDX-FileCopyrightText: 2023-2024 Linaro Ltd.
>  # SPDX-FileContributor: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> @@ -8,7 +8,7 @@
>
>  import os
>
> -from avocado import skipUnless
> +from avocado import skipIf, skipUnless
>  from avocado.utils import archive
>
>  from avocado_qemu import QemuSystemTest
> @@ -165,7 +165,8 @@ def test_sbsaref_alpine_linux_max_pauth_impdef(self):
>          """
>          self.boot_alpine_linux("max,pauth-impdef=3Don")
>
> -    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeo=
ut')
> +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'),
> +                'Test might timeout due to PAuth emulation')
>      def test_sbsaref_alpine_linux_max(self):
>          """
>          :avocado: tags=3Dcpu:max
> @@ -173,7 +174,6 @@ def test_sbsaref_alpine_linux_max(self):
>          """
>          self.boot_alpine_linux("max")
>
> -
>      # This tests the whole boot chain from EFI to Userspace
>      # We only boot a whole OS for the current top level CPU and GIC
>      # Other test profiles should use more minimal boots
> @@ -200,6 +200,9 @@ def boot_openbsd73(self, cpu):
>                                   "Welcome to the OpenBSD/arm64"
>                                   " 7.3 installation program.")
>
> +
> +    # we keep OpenBSD 7.3 on Cortex-A57 by request
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')

Don't skip stuff if GITLAB_CI, please. If we don't want to
run it on the CI then we shouldn't be running it by default
when a local user runs check-avocado either.

Any skip should have a clear description of the reason why
we're skipping it.

thanks
-- PMM
