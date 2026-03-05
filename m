Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F53F30931
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 10:31:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy5zJ-0003rw-OX; Thu, 05 Mar 2026 05:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy5z6-0003gZ-5w
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 05:31:18 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy5z2-0002IC-Fd
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 05:31:11 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64c9cabfe5dso9672737d50.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 02:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772706664; cv=none;
 d=google.com; s=arc-20240605;
 b=FY5AiAV9MHuGQAIt08bcwkP/q0wkm6R++T0ULisz+ZCPnHIbJNhp5yYnjyRphAHgCt
 0vI0MebO+20jKS+c2zNCYoDnyHcYkhgEQpF7XCBB33TzD/gZ3AHUELxH2dzmw6824hz0
 pozHCBlzbP0NiDbkXl0x97DZSLUSiMp10BU7h+ZeTdQ+dhh63j5mjd9qk3kARmeU7iQp
 FOltuWoiCgVmjI+8s197gmshQh9784MzWM8wrmh88D3BhFFvB3syG7xCRLg0vB+vpFzg
 cyU04iVtO1MHMVVKy/fy4d0cYMpOryQXO8tkb/sd1hlRxnqOXLuNrk5s5hNAezqv0Cdh
 /svg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=L/sgNTI14UkJFbod7mAAG/+RB46nPcq7eEnsyv/EAco=;
 fh=TUPZoxLULwcxYZPTEEQ2pRkTe8Yt/u1d8QcEX5bBABE=;
 b=UkZjSA/6hMWJLrUBPk1fsTrnBcID4Z0KPBRjQ9VdfxJ5ZsjgQBLaWhUs7KmE8z1zF8
 BvXcyIw5+L8EmOSDS970jTGwAKreNQL4LvHbrxsWeDnFsJM8GBl6+6o03ivEO/fAJjs2
 NpFxTEw6F8qNKTqEXpZAGFdcPyTjjfP/t3pXdgR8x3zvj8886iXSa/8WfSOnQX82iSmt
 jIhc5LRXDqDQfH37LRRvFEDYtraTsXHtndvmQ3NtAG2wv9KVWzmKMUsrkyVScyizpH4N
 tPRmiJvpO/SYFBaLYuTltgsX8KtA1VMDbmp/Ir+mCnZbd3q08NCuaGZtgKcMjUd/T+nQ
 IGsA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772706664; x=1773311464; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L/sgNTI14UkJFbod7mAAG/+RB46nPcq7eEnsyv/EAco=;
 b=xYxARWreBXMJRsSFyc5apsEByiwQt5VRgKa/1zGdhs5gHkx9iXKusN4yMig4VAgKJw
 MU2ud2p5Mz40Xx0gV0UvnmAWe1XNCSlWpU5M4Sd8NWUGRC6aEHfZeCTy7GhaJbQAvabc
 ID5w/AxVGF0sHPBsI29CydkY4gbIMbX9fd+AYRpz3kGZFYwnIPAFlEHOwJgbXpNtfybB
 iNUYhlvCT1sU1l7HpzgBSurk0Z6+p0P3PTeLBsnzrNl7oJkwP/su6C1Tux+Sk4AH905Q
 7v7u1D7cJZI+uzd8S4KB16pgKJw9+VTkha7EsJhWKJcsJhIcHnaPWin4iYDaCAkbrsBV
 3DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772706664; x=1773311464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/sgNTI14UkJFbod7mAAG/+RB46nPcq7eEnsyv/EAco=;
 b=dYbwO1YPvvvSUPycqIGW4adVZcyqDTezGPSuAY/0nvZNc9gllrgqkqU6hrHvXaiAKU
 0jZtucUB01w/Anvazydz6yOrG60j6X3e8F5m20b059ivuK6OLThdN9Ole9zxcHFh00ty
 EFnfjqrQ+AGYO7dDEHcQbP5oEjBlfoV47CYAfpUR80yUxBWduG7F6NSUM6CogI0xImQt
 bVjkELHo9IWuqBtQU0snmr8FAq5gpzbxafiAn7MXmUQ1hEZIbwIc0f8N5FycHMegnoX8
 aGy7zyzkI/VaXc1y5CcdglNIg9LvibPZdYgQ4zo9e8aJdV0vXTedPXuWMlLDi7OU8eT8
 qb2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKf6Wz0j4x0/CBr3jvdHM2u88VeQyd9icefnP9oScheLmlFwhu1wFT4d/djDV5027SzPeFssXtqQ==@nongnu.org
X-Gm-Message-State: AOJu0YxW6vz5qGKyxFXPFJI7xi8bZJb7lGohK0s6y2GIxEP+xBG08YUv
 XdcbJ3swuluyu3DvqYcM1rFBVxTO031yTupR7OsnQIHp0AWIeIInIXbZ0k9dvcB1l9GxmDbLSS9
 h6B1RH13ITM5chR7R1yYtsVFUHFgrKLxa5nuTKcb9dg==
X-Gm-Gg: ATEYQzzP3zB0fCFNX101M6S6W1gCD1EIzOdPzvBv+f1M8tcqH/i4NYAf/hGpk++p1vL
 XUxrUBqFA+raLEMqVg+3cMmy7INsKiPTMWjHxt6ARjlxnCSCM8ylcZcbZdFE4ur780M+3bYSHKt
 mCJisRLK1lL6x2ouSCweZ3niRqqD9AA+Wfr4I2M3Tj18z1ZR2FN8GysmFCtvp+cV4l/YlAbeZb8
 8E7Lg+ekicVKMPaPxy9Mk4bT6QISZUWNGZPn6aKNFYDTTmLID67wFmbSZXRg2GZkTtmJXbEjQb7
 1WV6NLCG+tGSeY7EMHzLwXgClyY8TPn6XVJz7nVO607/5qskpWenMIBPey1CpzUnspw=
X-Received: by 2002:a05:690e:1a93:b0:64a:d742:6773 with SMTP id
 956f58d0204a3-64d0715016bmr954301d50.43.1772706664231; Thu, 05 Mar 2026
 02:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20260304101625.1962633-1-eric.auger@redhat.com>
In-Reply-To: <20260304101625.1962633-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2026 10:30:52 +0000
X-Gm-Features: AaiRm50oQDw4faDAAZk82aIjfonUknKw8uyjOLVgt-Ze0i2T0GrLJ9i02aAxafQ
Message-ID: <CAFEAcA_2PDthqLRNgdrJo+qdoWXa0pNgJmB2TAzFr6C0=HXRiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Improve traces on migration failure due to cpreg
 number mismatch
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Wed, 4 Mar 2026 at 10:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series comes as a follow-up of discussions held in
> [PATCH v6 00/11] Mitigation of "failed to load
> cpu:cpreg_vmstate_array_len" migration failures
> (https://lore.kernel.org/all/20260126165445.3033335-1-eric.auger@redhat.com/)
>
> It only covers the improvement of the traces. Actual mitigations
> are handled in a follow-up series:
> Mitigation of "failed to load cpu:cpreg_vmstate_array_len" (v8)
>
> When the number of CPU registers received in an incoming migration
> stream is bigger than the number of CPU registers seen by the
> destination we currently get the following error:
>
> "failed to load cpu:cpreg_vmstate_array_len"
>
> This series removes this cryptic message and explicitly outputs
> which spurious registers cause the failures.
>
> ---



Applied to target-arm.next, thanks.

-- PMM

