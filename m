Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A92C83F17
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:07:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uebzV-0006ct-KT; Wed, 23 Jul 2025 12:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebzR-0006Wc-JA
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:06:47 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebzQ-0003uo-9l
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:06:45 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-710e344bbf9so670397b3.2
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753286803; x=1753891603; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLto7SK0XO/J5wVypbxBAVxI5YgIp6doAk9cyhcunOA=;
 b=d1J3rIhXJtottDG6ZmwkZqTYUwsAqdW9jYnpVqLLa2uw+BcNyMBz1pyD4Mn94+/yG9
 ue/XHH/YSarIrFVSVDC3U3ERHYkFlaMzna9SdbKfH+oUOTNGaQHWrr112ZTF0lRc28mj
 V+tqT/FVOqLOsp5PeFoJB9LimyUvOElehZZAgkDJgSPQGQrjHoyWElvGucJG/k1CN3Xd
 Gipjh4Y6Eucw9qXRwfZL0zcBvDPBsBuDD+knnPoMm5o49y5LdSU5qDNO+LJZVUClfJXe
 hB1N1sjrxKD6lb52sY2b+yPqiq0Ge6n1tYodtkikazpejqLauOYAQMqFujUCrJWBrQAT
 IiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753286803; x=1753891603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLto7SK0XO/J5wVypbxBAVxI5YgIp6doAk9cyhcunOA=;
 b=ZflhWmuyyl5Nz55IE7me049qH4z+QKfLRW553gn1MfnpffoimwZeBksIXD+sMXxJq8
 fiCIupsDx27yWcWLZVXxo3XDA57kStR1XZUm7cfx4J0xhH3ymOhUhMNlzWzeN+oYw4C9
 NNzvqt7BXN/F9+6AocDXMVP4AmKUsINruA8QwUquTyPnyfVNQWTq/aMWhYa8O54/BAF3
 HbQ+lzI9is4BsYGOooVxPikqyd3zNlxdQDTu4aCBElIftNy97FI7WsrZXuWdWABP94zk
 qZ5xW5OPm0cZyqo6qN6Pvj/dweDZu9a08CW8keIrCQ7rQceKlF/Qsak3xrgpZUzAE/Sv
 lW/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBOfIHr4NtEHbxojCrMM/usFo3yzkfln4QCsZHClPE7Sa8PPwwt8stbXogrmPedeTTDoBvYHoL8A==@nongnu.org
X-Gm-Message-State: AOJu0Yy0tDnQ4v/XS64WGGazU31KrfPRe3vNdpTGAmfTEuDN7gagW2n5
 1bkBfL8jD2mUS6XF6kEQk/F87/A9T/0fSblE3gPEcCuleEofpmS2GLBCSYGCQ9sYbHIRfzDSr/u
 EX4hXhJ3LRXPNyau2foZ2tNpWuXxkq9fwhTzom8jHQw==
X-Gm-Gg: ASbGnctbMs+UijCx6AeIormvBLLWxrsTJDE0FeoBph+Dj/6KnYhb19H+Y+7toG7Wd3b
 ccqUqWfIMZ4Ou/HLHV4yg5fDetjv0JcWnvptytjV0ha3Io21Il6zBtzaNeDvNX4ICsFSEibvcNT
 nYQ474xwlKfzgpk5h4AYPwKqkEYNvtQLxqRIpddj/Sm/PAjUC8Nlt+slkbhDQZ+9YIoqqfuHtRO
 OKQK8Jy
X-Google-Smtp-Source: AGHT+IEOuhc1BE6gQ9s6bwKFw6KQXpy1bceg7SKjXt/XvBUW28PlKk6P9yKtfX/PU+Jko7b89UPOVcYxHXwrncfnQyU=
X-Received: by 2002:a05:690c:3347:b0:717:9ea1:ab2b with SMTP id
 00721157ae682-719b414701emr49872597b3.9.1753286803089; Wed, 23 Jul 2025
 09:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250723135156.85426-1-philmd@linaro.org>
 <20250723135156.85426-3-philmd@linaro.org>
In-Reply-To: <20250723135156.85426-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jul 2025 17:06:31 +0100
X-Gm-Features: Ac12FXzFREjEPCxJDBzuh-02hE9eM3aUW8QcbKTHUSherHz15tYMpQoubqGFnnc
Message-ID: <CAFEAcA8_tBXwV1KVVLUkh9RU=KbusQhi8MKcxUmH1F4wM=HJ4Q@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v4 2/4] accel/hvf: Add hvf_arch_cpu_realize()
 stubs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, 
 Richard Henderson <richard.henderson@linaro.org>
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

On Wed, 23 Jul 2025 at 14:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Implement HVF AccelOpsClass::cpu_target_realize() hook as
> empty stubs. Target implementations will come separately.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

