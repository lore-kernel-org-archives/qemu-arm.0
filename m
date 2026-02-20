Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA62C55AB9
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 12:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtPLI-0000Pf-7g; Fri, 20 Feb 2026 07:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vtPLG-0000Ox-G7
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 07:10:42 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vtPLE-0006V4-OB
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 07:10:42 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-65be78011c8so2734778a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 04:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771589439; x=1772194239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6fzJ+l4Ly9yeRBWhlbynBxkf7jzhP5u2dREaJRBSuk=;
 b=YHXXl4Ahr6zpethaRAT2+Y+kLGq4npbzPN8ae54gNrqCSITSg7qXo3ob1qLacYmGQH
 B2TcPaOxqDwwkv2M/R91yTMEhQvVbeSNgUhqXc6mNhXYYFdOtEA9f6xkTceXqGrflQwN
 p2kyh9n73xCnEhBWntQOeHZ6roTQYmgS5jwRZKsDnBlcbfD85jjzC1xGRW5zu7z4hlHl
 PDylsoBEYDFokHC7V/2QRq4tkcZc1usbclxTMXkHsbfl90+rg67YZ4gDl+41r6hLYbgS
 mYznNllhR6IeRXerMDY7ysUi1lKBiEzXvRX3uN9WXP1Xj674lde2mT7qDuT3j4Q8U8gg
 XJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771589439; x=1772194239;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V6fzJ+l4Ly9yeRBWhlbynBxkf7jzhP5u2dREaJRBSuk=;
 b=RS+HenWURn6LISxi5zzysX+HUPMuyjsNu74+s/mBQoaRuPi52BlaIjHMJ4spbeyE29
 q0XIkveSctHo1qI0SYEQjgV18c+xarCtJHJ9knCmVPjhcjMRl0NTtwskt+LY6XxQJVCm
 eJQAvaVqKyz3Vh8ubMy01Zf2crLoSCWGyhis23nOqr0MPj3kgxE3p3BEGEoXeu2X3HOw
 gLPKXV2kFbJE9QYG7a9Ff398N6g70o3lm2+OsdNvSCzpbGalIX9BiSDnF5/b7o7iZk4q
 DdWePHfM8Sg+hObKxFlekvtguBt250/imxCeAwJJj11fVFNkW9DFtewNFhjIsAsS4bYg
 k2Xg==
X-Gm-Message-State: AOJu0YwT5ByvbjvJgdTXxwNhchgOe36Tk84mp3tsxX40g4Dk8fE6ZkC5
 amiz1rhPvvyphmAj/mk6pB5Jws7wjPGno5RvBpzD4OvjhZm1yImCrdx0gaKppBar9yWVwi+R2tY
 8WKI9
X-Gm-Gg: AZuq6aL9po4mHcpRl8iJ2fuIW4Ix4x4ZI8OMVTv0IXlEs6xEo48VrKJKjc479AZfwRb
 QKJJln4usGy+Wdt2NEEPhx/yMZ0aAbbcdfKf74VhACtlRGbP5oNe3ujH4w9IgnT+n9Bv1jqfhDq
 cxywl1VVqMrC9bCy2VjIZLJDz1uIM4/fYYV6uV+TjCxKDiI82vI1EhZPXMlDdf44vBa3e4WzAYM
 AhpOvjVL+v6+NaIWh9ciIlk7XLKdlazz8eyB1WNy4wgFD9IwCi6H3SlzBz/tEiKv0vZM361O8dp
 v2GC9K8mJ6Y8NLqgAlS2eHclZNimh/1dkbLI+Yw9jlXWXtrR4a60wphFkSRx9svpiw9HrinWlhd
 BrIZDZBur3Nf8fhU75AWCW0oDw5qW9QkaWkFnvay5OIq48k/HhXjYb31VjdWSKAPovD/jDCR123
 hANsXJwRyuSthz5TWUffAn3aYaCoxJxADhRQ==
X-Received: by 2002:a17:906:c116:b0:b8f:9d12:2386 with SMTP id
 a640c23a62f3a-b907321eaefmr101233466b.51.1771589438938; 
 Fri, 20 Feb 2026 04:10:38 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7665345sm670206466b.53.2026.02.20.04.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 04:10:38 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8CABB5F838;
 Fri, 20 Feb 2026 12:10:37 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: Update error message for bad gic-version
 option
In-Reply-To: <20260219110228.3804482-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 19 Feb 2026 11:02:28 +0000")
References: <20260219110228.3804482-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Fri, 20 Feb 2026 12:10:37 +0000
Message-ID: <87seav62f6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> As we added different valid gic-version option settings,
> we forgot to update the hint in the error message produced
> when the user specifies an invalid value:
>
> $ qemu-system-aarch64 -M virt,help | grep gic-version
>   gic-version=3D<string>   - Set GIC version. Valid values are 2, 3, 4, h=
ost and max
> $ qemu-system-aarch64 -M virt,gic-version=3Dbang
> qemu-system-aarch64: Invalid gic-version value
> Valid values are 3, 2, host, max.
>
> Update the error string to match the one we use in the help text
> for the option.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

