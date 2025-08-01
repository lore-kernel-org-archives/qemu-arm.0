Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941C3C87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 13:31:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhprE-0008Sh-1T; Fri, 01 Aug 2025 09:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhppV-00018H-Hz
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 09:29:49 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uhppT-0007rO-L5
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 09:29:49 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-71b5381f21aso15871647b3.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754054986; x=1754659786; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zM+4rocb0JLv14hOXdt5Pjwn/4EGFS6aEvPspBwLM8Q=;
 b=TSJU3nwQL0sQTGHwilWO8vwwkfEQJCzUzx5mB+OmAaKIIs68+3PtlStYPF1b3vmXB9
 tfumg10wt/F/fhKe3IbU4vzPYKyn/dyHujKD0TkLZ4KqCyX0QnNJLM9Z2ZeC8l/ei7Bu
 QGNJ2al7bLL68amRpB8ebrYsI9gJty9dOAt0km9pR/AphNAVvkmofQkDK5B4ozRLX+yE
 mEvIWxD2aEOSXl07410CwoBwPMK9ZhZTq3wXZOI5Fyf6pPvIOtVf+rinWbbviMtNMCAD
 emfXAA3hITLpNumNjp0xk29TTnFD05KaXcLcrik+SEDs6qSx5YjsTJH1XguT7kkC1O2e
 aLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754054986; x=1754659786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zM+4rocb0JLv14hOXdt5Pjwn/4EGFS6aEvPspBwLM8Q=;
 b=ACU+Qi35lqejDOSuhCLpBrFk77hM4YQ7D59WDmCmBWnPCpVx4MGpv+eUVGAEBzwOkI
 QNPGIS1yTRpo5luSru34IDEm1s395rwnJr5IOfu4x3uXatZuInSBqiEIOfiH/b695hqW
 Idax/ANkfAidvNJZYBR6kQdFCEv7G03dREyHm+zDS4GVd0DeiI4QfIJb7wkMeEU/QvOh
 dNJa45/zgASZMEQ3P7sunipMy2H//fXmRO5nF2wT2XonqP/t4t6oX3s5vbTywmU+iGVn
 o713xyQApmhcrSvNWFCDJ0Xz/FR3YN21qK1Bk4XLhSHuj2t1fqrsFAadM8PKzp1rDTsG
 VQng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjmC634sOH7omv0DXFg5DNfueZInbMUsnto6sneYa3WLK0CkdWYpExBjaTQr9a47cfMuQ5kwPO/w==@nongnu.org
X-Gm-Message-State: AOJu0YykdliqXF07dU1GvWbTlqtU+WoitrANeOkGVwulyXGBUPzCi4Wx
 qX9+7oy03Bg7nHv3cTUct/uS4brTHL2Ri2XaO3MSpBBnMCMSmm0sclE7BOcqBuR32z2wp4KXWTS
 A9YfiiLCCVYgKDkd8ryYWgJ1pABYgvSN5JnR5AXXAOQ==
X-Gm-Gg: ASbGnctJfHkopLmuzFDK7wUtu1cFFyPOJ9YWMb2DQ48fxsEAixKCDIyvD82SdADG7RA
 y1INTfwfqZJuLlVl4QH6ZMH9u3tRGhHkjyGMSHlB9+gQuIobT92WnvutuJ/4gfNVMXna/zfwQbV
 2qufeHTliB8A2ikgj88eHy3UtmxkqGxKBGswtt9jRJrJFURqDw1UPUOWwk8QXvwn4q6inyFgq/1
 Zcj4opW
X-Google-Smtp-Source: AGHT+IHh0KFDihUeja+forBXW0gWsijwli54BLB+KUP58fCQImehs57Qquv30nTlsY7prWP3k8S3urlOVL/ZLbAUgqw=
X-Received: by 2002:a05:690c:d8c:b0:718:17b1:40d with SMTP id
 00721157ae682-71b6d49b617mr36811917b3.7.1754054986114; Fri, 01 Aug 2025
 06:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250801001305.2352554-1-gustavo.romero@linaro.org>
In-Reply-To: <20250801001305.2352554-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Aug 2025 14:29:33 +0100
X-Gm-Features: Ac12FXya5BjbgjqdDxkPbF0aOAsI_7Gl0aCf3t3NFKbAZKF2e-WjJ6uHqjwjfBg
Message-ID: <CAFEAcA-6wr+frdc4idVs45POcPVG54FFTbtqPu3x9Jzfa-gwow@mail.gmail.com>
Subject: Re: [PATCH v2] tests/tcg: Fix run for tests with specific plugin
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, pierrick.bouvier@linaro.org,
 manos.pitsidianakis@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Fri, 1 Aug 2025 at 01:18, Gustavo Romero <gustavo.romero@linaro.org> wro=
te:
>
> Commit 25aaf0cb7f (=E2=80=9Ctests/tcg: reduce the number of plugin test
> combinations=E2=80=9D) added support for running tests with specific plug=
ins
> passed via the EXTRA_RUNS variable.
>
> However, due to the optimization, the rules generated as a shuffled
> combination of tests and plugins might not cover the rules required to
> run the tests with a specific plugin passed via EXTRA_RUNS.
>
> This commit fixes it by correctly generating the rules for the tests
> that require a specific plugin to run, which are now passed via the
> EXTRA_RUNS_WITH_PLUGIN instead of via the EXTRA_RUNS variable.
>
> The fix essentially excludes the tests passed via EXTRA_RUNS_WITH_PLUGIN
> from the rules created by the shuffled combination of tests and plugins,
> to avoid running the tests twice, and generates the rules for the
> test/plugin combinations listed in the EXTRA_RUNS_WITH_PLUGIN variable.
>

Since Alex is away and I'm doing a target-arm pullreq for rc2
anyway, I'll take this via target-arm.next.

thanks
-- PMM

