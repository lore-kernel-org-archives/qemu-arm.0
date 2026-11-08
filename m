Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447DC606A31C
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Nov 2026 19:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OvDtOZtH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQ88w-0000Up-SZ; Sun, 08 Nov 2026 14:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xQ88p-0000UJ-UH
 for qemu-arm@nongnu.org; Sun, 08 Nov 2026 14:01:24 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xQ88o-0001VW-1x
 for qemu-arm@nongnu.org; Sun, 08 Nov 2026 14:01:23 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so2589545e9.0
 for <qemu-arm@nongnu.org>; Sun, 08 Nov 2026 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794164476; x=1794769276; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zrxaZraQLRUz0ggX6nKwdiuIeJTrW+yHSc6JYz+mXq8=;
 b=OvDtOZtHlfZiV0Z3P9Bb0k+BPI631e/IfqYv85kqHPbnGibBD8cTogdEby2yxRrj2e
 R+zzjiMLRnv0dNB1lXP5Kr5OpE2mD9cVkAfSm7Ic+0uoXkexsobszNWmArEcFEcZlHVD
 zWmrOvCUDNdlFToOY/0R7H4lv2HcOcaRq3rEbDwpQ2uIM8pyN7nNOaWTS+dNaDH0/YBf
 /GubsxXjKKTH3zgo7R+C4iu7x4DtXhojxyzRtIw7sW/VQP92MArnGOtBHS4HCfeY72Fj
 TiCHt4sUqCI6gqQ/PNvDLnl3ek0BOuRZ7H2SGOZ9yNzjiQ48gWhPxcpRU2SHszYNnEdh
 d3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794164476; x=1794769276;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zrxaZraQLRUz0ggX6nKwdiuIeJTrW+yHSc6JYz+mXq8=;
 b=y4oJe/pxa7itb8J/jXtMRUM6mo3q0NbxVDKtXioJMBAjjQBA/8aLXJs9VlkoI+QEcQ
 HVHEXQXfaSqQadj91iYvF0lxuYIO/0CvaHooTAlc5FwbTpBgohhk2Q9HqqJJn91snGpp
 EHjHtmR/2jekANM/lPkXMBB10fPYI/6KglePfRNkrjGXXDbP7ThQC60U6ML5HVSDi0TC
 PttpcGOu7eQVtwXKMLJTkxga0YIQ6LE56y4qwIu8IoHQJzNNe7hVu96dq1H3KIqYppMS
 oOVsEZrh9JR6Pp3E9vsPr4Pcofp3+YRTkclj7gXUq37tmaWloW0x8676pe2ei5vGRfuB
 WP0Q==
X-Forwarded-Encrypted: i=1;
 AL+hErGjrR7xSKH5jGnqWXNtR0FtDFpRFzkm0+DZBtC7lt3f/rVciE+dnAZUQMg99vluLt3g1lN3leJiOQ==@nongnu.org
X-Gm-Message-State: APuU4Z+T8uLdP3kCcaThsOFvslyeieeL7Br2ce5IgPYDk0SKSl4EP7sU
 qSuTxmF1amHE7kb48v33ktWPTCsu6Wai9Ws/mSnn6zXINzFCTqChfzdx52kBmLD6lQ8=
X-Gm-Gg: AYBFou2dvHsIaB24UEfVBvmCw5/tYEvc38geb+1ltIfSSW8P3oZ1Q8+/+FMsMNbhmkJ
 QiYK6JuERDY0yRuPm0PBdwbdGedpEkDwPvkcwt5Ivww5fwbKa/0GlBag0FkUGm1Ut/gNKDNufDT
 QFNviByUn14pyPKHQTc9SmZKitML05Gmu6u/9RlLNOHXkHIXGJmEznd+NvFqYIaMkzLv4HS2hwb
 wWIir8/ViV2OlTuljhADTPD18G+yHS18Nc2Vcl9YYWJKmufUEqFmcB43I1Ys3xr5C2t2BhWEe7E
 tTEoQAzzhOx798XbCRDZVH0nmIN85XFb+8NT3E7r9UE/3KTeSlTD4vCOs7K/+ul+xiIAZc7UmhJ
 gy711XPKRthEjcakDFzxJqcuwFTLa4MZbwZ6MxMjuN6PoHYs4FmRVMimECAi2eNPACQ/Rwiv0Ar
 mhToXo0PqPPoaCqjdK/+ndzvAaoIvUT0+lFM7WDaVlpyPOS17GmqBuHpNta/P25GNp7ZzgAaRxW
 A2YnYPC8sqMbvWedDJA4uLX7N0plP93AGub4ECQFRzQv0GzK2cZ/8dVVFdm+/D/Aq6//UwxiTDP
 XCR4ERosIysXDCd4Ma/7pIzOboyWmP90azSd3NEqeDY3CVE/Nw==
X-Received: by 2002:a05:600c:8714:b0:4b4:262b:88a2 with SMTP id
 5b1f17b1804b1-4b94d762f82mr40480255e9.1.1794164476533; 
 Sun, 08 Nov 2026 11:01:16 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7c4716170sm72201375e9.1.2026.11.08.11.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 11:01:08 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 00C175F819;
 Sun, 08 Nov 2026 19:01:06 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Pedro Barbuda
 <pbarbuda@microsoft.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PULL 00/13] Whpx fix 0 patches
In-Reply-To: <20261108095403.70813-1-mohamed@unpredictable.fr> (Mohamed
 Mediouni's message of "Sun, 8 Nov 2026 02:53:50 -0700")
References: <20261108095403.70813-1-mohamed@unpredictable.fr>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Sun, 08 Nov 2026 19:01:06 +0000
Message-ID: <87ik27i1vx.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mohamed Mediouni <mohamed@unpredictable.fr> writes:

> The following changes since commit d73149283205645625bfa9fe029cfb68e4c4a9=
ae:
>
>   Merge tag 'samuel-thibault' of https://people.debian.org/~sthibault/qem=
u into staging (2026-10-24 16:09:37 +0200)
>
> are available in the Git repository at:
>
>   https://github.com/mediouni-m/qemu tags/whpx-fix-0-pull-request
>
> for you to fetch changes up to 2bf35950b54c1db9a6de6eb47b42cf843c6bd282:
>
>   whpx: i386: also save debug registers (2026-11-08 02:48:18 -0700)
>
> ----------------------------------------------------------------
> whpx: QEMU 11.2 pull request
>
> This is a cut-down version of the "whpx: i386: updates for QEMU 11.2" pat=
chset
> with fixes for QEMU 11.2.
>
> These include:
>
> - fixing reset
> - CPUID fixes (leaf 0xd)
> - handle systems where nested virt is advertised but not working
> - xsave fixes

You need to apply your s-o-b to patches you submitting in a PR:

  https://www.qemu.org/docs/master/devel/code-provenance.html#subsystem-mai=
ntainer-requirements


>
> ----------------------------------------------------------------
>
> Akshey Taneja (2):
>   whpx: i386: do not require ProcessorFeaturesBanks on legacy Windows
>   whpx: i386: fall back to xAPIC when the MSR exit bitmap is unavailable
>
> Boden Randin (1):
>   whpx: i386: avoid updating hflags for vmexits
>
> Doug Cook (1):
>   target/i386/whpx: fix VMX capability MSR values
>
> Doug Cook (WINDOWS) (2):
>   target/i386/whpx: whpx_get_xsave_state error handling
>   target/i386/whpx: handle processor reset
>
> Kostas Chatzikokolakis (1):
>   whpx: i386: forward the dynamic EBX of CPUID[0xD] sub-leaves 0 and 1,
>     not 1 and 2
>
> Mohamed Mediouni (6):
>   whpx: i386: get APIC state before VM save
>   whpx: i386: fix TPR encodings for local APIC
>   whpx: i386: save/restore xss
>   whpx: i386: make nested virtualisation init failure non-fatal
>   target/arm/whpx: handle processor reset
>   whpx: i386: also save debug registers
>
>  include/system/whpx-internal.h |   5 +-
>  target/arm/whpx/whpx-all.c     |  10 +-
>  target/i386/whpx/whpx-all.c    | 307 ++++++++++++++++++++++++++-------
>  target/i386/whpx/whpx-apic.c   |  10 +-
>  4 files changed, 266 insertions(+), 66 deletions(-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

