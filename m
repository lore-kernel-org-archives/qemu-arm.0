Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB377CAC5B9
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 08:29:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Vhh-0008Be-PZ; Tue, 30 Sep 2025 04:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v3Vhf-00089c-Ms
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 04:27:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1v3VhS-0002cU-4C
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 04:27:18 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-33067909400so4279936a91.2
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759220815; x=1759825615; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0LNTdP/W0tNETzznAtplZaQ+bhPZSQ4LzCoij245COE=;
 b=lr9t9MmlHg1pycPVbT0VbEn7lCgXfZ9+JPULaqCuRGYG3pK2rLGqq+jyzk8JvEC6W2
 Mhj6iErVswyqylGDkA3o/dYZ5pe9JAJ4bgrmWsHuJW2rz1NL0zE25k/nZOXH8rXmnQLk
 ciwsyRVyNjVGWYZT+eNd3jD474JbJqKAs92otUlDCWCtV8eF2yox2lr/epmfPlObFDhA
 nBP9UEcgUjamNuYefBz6Gb6UQWp7nhE550ikTabBhcFCWmy1l0UnV1xnCJaAXZM8NvbV
 FN2giqX9reiRwALfO1Ty+dNTc0yVzMc99qtHuPCUWlqWO730DIDfrSsep04P9Ke58dFb
 u9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759220815; x=1759825615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LNTdP/W0tNETzznAtplZaQ+bhPZSQ4LzCoij245COE=;
 b=HHutOcZopUtpmPnHgCst86TqW+367iGd64PKYqFOE96p/9WZryU7J+yhMln3jsAazc
 DbbEG6YtOHxav2+IOv+4lzm1A2EygLkhH2ue6/xB+pJUZ3B55gZeqEPEhF6XZCXUvFEt
 CEzGz0RX962rDdXsguqkdR4GVYWujxY1rvr2g95gpRUiMhdT9VQkFZJIxQKq6VR7j/85
 ucWH7EVxV1SjlIV7G0B+afojKOZuVKxx8MaZov7Y/XYgA5lyxcv1nLs14nfv16lM9o/5
 srLpxs3TuKZousmR/jO6StadwUtkeGsuzcMbl7oEIQqAJeTGIPLQ0b0Gkp3vkzUbwJY3
 DNDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW83ZDpWO5/JbJMF81f/3QSgW2CIYRsxc20bmlOixsSTE7klbtV7XyjrCbpuWAm8kS6gs9k/SChA==@nongnu.org
X-Gm-Message-State: AOJu0YzjEUNcWj+oUSWZGGCgQOX5EHoYGL/sp+ZLkbHvjS8lBBZPJUfy
 y9Pka4oOUKnYvFt/1MRU+QNbzl61QqTZXX1Xz3pHM2GEnp3hWGwHB0c0RjFtJfiXhAGU989w1cF
 zf8bPG9XLJd87oMFfwuJQKBySHqPRcig=
X-Gm-Gg: ASbGncu6DyfA08bOQhJBukT9/LK6M78lzObdYX1gFEy5hMU78+49J+jyMbMbpzwbBf8
 xxQBJYsxuHoo1DBjlP1SJssgRy37EoVfT0uvjevHUTLRgXc48xUHSEpriOXliwc+X4SuGJi4WLZ
 9q3dGGfyDqkVaSNgfo967empsBYiVNLyxzX2q6zs03IDOMtAs2/C5d1c+iF7xtMpcM4cYMUu31Y
 J0g6gyElNHO6/CFD9sseNs5fdM1Aztb18Spg2G3SBU3zgaBq0/mkhsgrUvH
X-Google-Smtp-Source: AGHT+IEMt0iYeVZJIWJjd7IGAp2dKKy4AHmDDeWo2l/e1R0qhw9u1GtnblAWPVBswIzwPmB87ng/d0auMno6CWc6/Js=
X-Received: by 2002:a17:90b:3ccd:b0:30a:4874:5397 with SMTP id
 98e67ed59e1d1-3342a24d0camr19521105a91.9.1759220814783; Tue, 30 Sep 2025
 01:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756724464.git.ktokunaga.mail@gmail.com>
 <ba60c570-fff0-4ab8-b3bc-d191663d2912@linaro.org>
In-Reply-To: <ba60c570-fff0-4ab8-b3bc-d191663d2912@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Tue, 30 Sep 2025 17:26:42 +0900
X-Gm-Features: AS18NWCjjxIHQvMmmukI1NEOUr46E_NLwrncNl350eI0CPjg-mhAw1-oVcOVRBI
Message-ID: <CAEDrbUYAAbF5g4-HEvqDWZyycPzZQCJvqasJ355RkLOnfm0R3A@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] wasm: Add Wasm TCG backend based on wasm64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bf28cc0640008314"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--000000000000bf28cc0640008314
Content-Type: text/plain; charset="UTF-8"

Hi Pierrick,

Thank you for testing this patch.

> * /builddeps/target/include/ffi.h:430:6: error: 'FFI_NATIVE_RAW_API' is
> not defined, evaluates to 0 [-Werror,-Wundef]
> * various "format specifies type 'long long' but the argument has type
> 'long' [-Werror,-Wformat]"

On my side and also on the GitLab CI, these appear only as warnings and the
build completes without errors[1]. I'm curious why -Werror is being
triggered in your build. Have you applied additional configurations that
enabled -Werror?

[1] https://gitlab.com/ktock/qemu/-/jobs/11544442966#L7016

Regards,
Kohei

--000000000000bf28cc0640008314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Pierrick,<br><br>Thank you for testing=
 this patch.<br><br>&gt; * /builddeps/target/include/ffi.h:430:6: error: &#=
39;FFI_NATIVE_RAW_API&#39; is<br>&gt; not defined, evaluates to 0 [-Werror,=
-Wundef]<br>&gt; * various &quot;format specifies type &#39;long long&#39; =
but the argument has type<br>&gt; &#39;long&#39; [-Werror,-Wformat]&quot;<b=
r><br>On my side and also on the GitLab CI, these appear only as warnings a=
nd the<br>build completes without errors[1]. I&#39;m curious why -Werror is=
 being<br>triggered in your build. Have you applied additional configuratio=
ns that<br>enabled -Werror?<br><br>[1] <a href=3D"https://gitlab.com/ktock/=
qemu/-/jobs/11544442966#L7016">https://gitlab.com/ktock/qemu/-/jobs/1154444=
2966#L7016</a></div><div dir=3D"ltr"><br></div><div>Regards,</div><div>Kohe=
i</div></div>

--000000000000bf28cc0640008314--

