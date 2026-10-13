Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D0CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:10:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGbK3-0006L4-Tz; Tue, 13 Oct 2026 08:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWU6-0001K5-5p
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 02:59:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWU4-0005x0-6d
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 02:59:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c263415982eso301790066b.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 23:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791874774; cv=none;
 d=google.com; s=arc-20260327;
 b=bwneh2IUxu72iGwCQS6tv7IpkUlRpvqNR4id96Y/FSsu2oXL9kZWQR8GnQIQNMk368
 s8j0DcNhJdXQdkjyDr1E90tHF1Q8BaoKkjIvoDT13bfnqT7nkwjj98uM8FVWeqN3wHtv
 gN2rYEuEzqt3wUwHXzT2son72gsdy+GG2WvgJbS8PEDS4FqJdz6GUNhiiaSpiHkMEBB6
 fdHg3QDNLaTcXPwvB5olm9btDPhoeegh1CdzxX6Uv5+Z9ewiaw7uzwFJyOFyz0sOw8Ap
 3IY/huoFz+UemkuWTSnZnP+Zsi8HQZlHh8aQkFSL7ulo6laLm7RyXMQfLtpBbFNxQXeJ
 btRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FsavGuJI7lEm09dh/9TGEx9R8ziC15kKprEg0eqdWvU=;
 fh=u5zTXDJch4F9Qvu9e0IPWfgMXOPd8j3TC1nae+voySk=;
 b=biqret2bi8PghAqpo2ML/pHNkDA9zWo4dhYXy5zo80jZ90RCUOS9eiQvfv18tL/OCr
 qTj8OEQMCcz1AG7R+BRzloO3tvsFAolczHHg8XnGIczsnAmH8SlMhWFDkx91JEKeoJzm
 Js3pS6Qfqga+UROo5CIvA1kUhcC2dvGdNh4lMQNDpyQCiBhzTD9wXL2ebRrubq/aMTKC
 SLmZpNi2SnAmv8Zy53x3ahCSZ1+CZHgkz5D2d8ihn9uTqFp2JIJmPIfvyjcRnS4lXQtZ
 D/YPwvUMqQq9dPFEuNbVO4cOm5UXAc9mcJyME2shckXTuAp0TQTeiF5c3EjYgolj3r8i
 TDcA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791874774; x=1792479574; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FsavGuJI7lEm09dh/9TGEx9R8ziC15kKprEg0eqdWvU=;
 b=I1HEwjMlLR86XGkPd3gKD38S36h86gJ3rwrqZWoJpt2BsH8DHKcxkiidOr6lvVWUdf
 EEVp1fra0sf+xtvqVshdwT++YcK96NGHanNbFtjsyUArrWYcoCOPYWeof8ZQucf4KxFo
 OxCsUGchzZOVornCOXi8Aakoej3mXKvLHmSBNP/bAuvKy2Nx+5AqsenCMUqKfmCjusPt
 Q1Ggrl2aEZqmH11rHWx24plnF8r7RHvk68uGi6bqYf7bzq02BAUviiof6w5Dz0gbAoOJ
 HZu4nFmh4WYL2+L11IJL6Tp2JwlAPgiVRdqQMXvbHlC1/d4V68hBn/ytGUPrftCzG7FC
 gzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874774; x=1792479574;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FsavGuJI7lEm09dh/9TGEx9R8ziC15kKprEg0eqdWvU=;
 b=IBm4nvKA87obM/O1pDSzalKCmjfxoelikY7FlbhoYLi/fxwIuHh+zVQSO+31wPC84I
 ATIrEjttLTa9iFM/TEqCBCdeZJa6/4B7QfW+5zYzfmjGNzUC8AVBz0SaWhqxONB0wW/C
 FaSUeEQlmGFVS/ID4nsMOnBic++kJe3DXm228abN/+mRuORjZQhbNsXYH3oNWBZ75UXh
 i1wH+Qa4lDDDo4qqQFEtgJ3VQ8TgRgsVMSntWjEB9xvserlovgQ3l2T0Ww8Hd4m3F/np
 R8NWi6psTdODYQkNHQEot717Co4USIvuRHLTW7iqbufBSOZOg+9K+OgtqAgpLpQiaxNp
 EKzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy4Fh57z/WCNpmYrO9iR5XD4iKtT6DAYrDUQqEU65cdVpAVxNIQGBiPgHtl8kzLlf+K3vySiVTZIg==@nongnu.org
X-Gm-Message-State: AFq9FYLyEP/ofOFxhHuf8ugf+7LQd+v7APcJZgziFLb2AVSXqLfDnpyx
 doRmKPLe4iWuU3PIGwo81qH+VJJGBQ6pKs2H4yYCXWP9xx0Z0CtKOUrA224THzXEUxPjNusaSqa
 1cNLLjiZ+drDbqr/MgciMovCOSk3HS0Q=
X-Gm-Gg: AYBFou1U+QX53KNWA+mJ9sOtxKpJw+w07eZmq2mS6SBia9fkHktZRvAIBDbkLMzZ9pp
 LX4MwwrF2QQShN4Rk7SL1/VlYHey5XWZFAO/RxlMw160DEyjVUUlCYvT8QX7pv8w5dm68vzLz7J
 7gKkWlvjgS8VXy84ZL/gp64jwhNycrD+vv9QD3NEmoqhDaIYhvnqN11RfQEhlXUGXANNjPIibxv
 S1XFur6cJiDBEbgINIdRc47grHU3opFHgv4EG1pBDyEVehyCgEXcZv/9XhwTTCIoShTlYWHpVFt
 eW6GdaUuqjzSnq0IRsCsHvY4V4jhijxhq0w6Yt2KYUHmmYZIJjzJg3Xv
X-Received: by 2002:a17:907:6e8d:b0:c2d:c247:5400 with SMTP id
 a640c23a62f3a-c31aa036554mr1179168266b.27.1791874774515; Mon, 12 Oct 2026
 23:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
 <20261012-bmc-minerva-v2-2-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-2-4c3dff084ec9@free.fr>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Tue, 13 Oct 2026 14:59:23 +0800
X-Gm-Features: AclHuK-Juu4jyCWFSBvsTqcpvyHmJJV5uRXR2I5GXQDuFjYa8LFy17LiuHfWeQk
Message-ID: <CA+8rw5xDogAem_bbfoYrS2JFLPc90DTngJ_vgvWgn1L0gtvJTg@mail.gmail.com>
Subject: Re: [PATCH v2 02/50] docs/system/arm/aspeed: add the sanmiguel-bmc
 machine
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jaminlin1207@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Oct 2026 08:09:33 -0400
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

Emmanuel Blot via qemu development <qemu-devel@nongnu.org>=EF=BC=9A
>
> The Facebook SanMiguel BMC machine is supported by hw/arm but has never
> been listed in the Aspeed documentation. Add it to the AST2600 machine
> table.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>  docs/system/arm/aspeed.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 933df41f96..f38f33cbe1 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -34,6 +34,7 @@ AST2600 SoC based machines :
>  - ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
>  - ``catalina-bmc``         Facebook Catalina BMC
> +- ``sanmiguel-bmc``        Facebook SanMiguel BMC
>  - ``anacapa-bmc``          Facebook Anacapa BMC
>  - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
>
>
> --
> 2.50.1
>
>

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>

