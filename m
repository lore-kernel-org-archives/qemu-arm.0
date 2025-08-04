Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1708C87FDA
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 09:50:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uirp9-0001CN-RI; Mon, 04 Aug 2025 05:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uiroL-0000sc-TD
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 05:48:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uiroJ-0008MY-IU
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 05:48:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so2668200f8f.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 02:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754300928; x=1754905728; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwnSZBavO1r0NUe6ExmwfzIRMJxhOCPBdY11cAgGSQo=;
 b=WHLPeQn81/J0AaStnHOPQ2hkFqY4yPNLL5orhtt2hUEUwrRTR4WTKsZ9vHLT7pxpM7
 UoZ1KbMBnDBywBCE5qsnG8pA0tCWKER1pnsJCffYYhQaW8K/FZQapLRbdrR9wVhEfvB6
 yzsl4UnD7UU+tCfGJsRpQsMKON+IA/FxHWT1lLgwHFjn5ULwkLnmW4Bj7G1MjvfT1GuJ
 tvK+F/5rFFk0itQNmuIkcDTu0SP1rDECVmyUVHG/oiO0KJmO+0I2CPCbe9bZepURRtzg
 wWGMoYplpAIQu0Op6f4mBw/4Z+rsnyLe8DTlQaHDmvvpPpEcwEauAbfFukB743NyYwSV
 p2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754300928; x=1754905728;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vwnSZBavO1r0NUe6ExmwfzIRMJxhOCPBdY11cAgGSQo=;
 b=jFdgJLvzgfm0f9WuNGLOohzSBwxAxP/W13WIKSKf0LClNM2W+1K1K8UhuZyeHbIhia
 iU6kmPIYBWe+wq/b5LdpeAnvQLEb52/r1/rUAfz7YeaSY7SYdmNwO2VqWDr4wG4gRKat
 qUutpVLlViWZPc0PS6Le+4HXS/EfIXFLt3XpSXtqNUmN5TkHYOfAngMxyPzOKeX3G4Lx
 8x0wKxgkD5h2Xu9gKAtBy6toOYTZfb3rCSDuSVLbyVQY5cZd0RWPWNXO4xit+ghd3SHv
 fUxamAw2Fx4kKsxnUE+6dMhHGiaPhkDW5QhS0HsgIaMsJQ4oFBtu3KYI7dC7CDfgCaWE
 lqXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6qx60bQz/Ojf+KsMlx4FlQoekQyWl/iBbq0eBi6nYnpVTfYAKC9zqu7RXnFplHKGkWD+2/qxt9g==@nongnu.org
X-Gm-Message-State: AOJu0YwJjPa414C9tNxRlzZGepwM9QBg3iX4G0b2AjILSQnP+P8EUY56
 o/2MIUedCIZmdrMxYwgRCKbg66B4qQ/eHAkuml4anQAK1+XxxWprjoFUyONrm4V0TcQ=
X-Gm-Gg: ASbGnctnucNdcohWJPSysWDIS8q/fjInXmo1vjP7K89DRz0INfTAJ+yp4/i8ApxTwxX
 QZQPoFQrpfOfqO0eOXvnZsPPbYQrIXu60u8FPXP8+7xZ+y//xFmTCZUSaKlsBRsHkxD4+LUYw9N
 hdZ2pHQ8u+Tv410YOP3Mu3kZ6ONPNjNzsVsw1VTJCF3KL5z+/xb1ZXHmZAV9H+dupM7HMFx10nG
 QdrHh3HryG5zRn52SJ1azVtLH45u9YOSSQySZIO8DYzM0xT/rW5nEG3WoV5I3QFhN72TJSn3dyB
 XmfoA+KODYCBJ9TNkEKEv+xMzuXhHDCFR2iaOh8JrSHkaz0Nxp7/bTvNSJP/rMKKfLmH0gKxMXl
 QWHA7+QcMcoavBO9A0Q1Z95yz40jyc+/0Ow==
X-Google-Smtp-Source: AGHT+IEmTlMWXDtMIYS++pJJ+l8caoWzOoV0D+GsQcmjsSVkKUNiyOZJTCgJqc16v4t//qibu0XxWA==
X-Received: by 2002:a5d:5d10:0:b0:3b7:97c8:daae with SMTP id
 ffacd0b85a97d-3b8d94ce6e5mr5588922f8f.58.1754300928326; 
 Mon, 04 Aug 2025 02:48:48 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0846777sm5010750f8f.48.2025.08.04.02.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 02:48:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9C1F95F88A;
 Mon, 04 Aug 2025 10:48:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
 pierrick.bouvier@linaro.org,  manos.pitsidianakis@linaro.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2] tests/tcg: Fix run for tests with specific plugin
In-Reply-To: <CAFEAcA-6wr+frdc4idVs45POcPVG54FFTbtqPu3x9Jzfa-gwow@mail.gmail.com>
 (Peter Maydell's message of "Fri, 1 Aug 2025 14:29:33 +0100")
References: <20250801001305.2352554-1-gustavo.romero@linaro.org>
 <CAFEAcA-6wr+frdc4idVs45POcPVG54FFTbtqPu3x9Jzfa-gwow@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 04 Aug 2025 10:48:46 +0100
Message-ID: <87ms8f76yp.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 1 Aug 2025 at 01:18, Gustavo Romero <gustavo.romero@linaro.org> w=
rote:
>>
>> Commit 25aaf0cb7f (=E2=80=9Ctests/tcg: reduce the number of plugin test
>> combinations=E2=80=9D) added support for running tests with specific plu=
gins
>> passed via the EXTRA_RUNS variable.
>>
>> However, due to the optimization, the rules generated as a shuffled
>> combination of tests and plugins might not cover the rules required to
>> run the tests with a specific plugin passed via EXTRA_RUNS.
>>
>> This commit fixes it by correctly generating the rules for the tests
>> that require a specific plugin to run, which are now passed via the
>> EXTRA_RUNS_WITH_PLUGIN instead of via the EXTRA_RUNS variable.
>>
>> The fix essentially excludes the tests passed via EXTRA_RUNS_WITH_PLUGIN
>> from the rules created by the shuffled combination of tests and plugins,
>> to avoid running the tests twice, and generates the rules for the
>> test/plugin combinations listed in the EXTRA_RUNS_WITH_PLUGIN variable.
>>
>
> Since Alex is away and I'm doing a target-arm pullreq for rc2
> anyway, I'll take this via target-arm.next.

Are you sending that today? Otherwise I'm happy to pull it now I'm back.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

