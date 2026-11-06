Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAD606A31B
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 02:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1hWlfSi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP9eO-0003nk-Rr; Thu, 05 Nov 2026 21:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1xP9eF-0003lv-Ni
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 21:25:49 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1xP9eB-0004xS-ID
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 21:25:45 -0500
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-93e7ad9f78dso22489385a.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 18:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931937; cv=none;
 d=google.com; s=arc-20260327;
 b=mVbsj0UjREA+qPaehfTOq4zJcR4n2c2dQ8K9XJthJhMD13nBbdNzapbpTrQczp003i
 wh0p1o/PJnY07gvoPPJACaDSb3hkt0gD/lD0e1lpDuRAM0hqxY4eoU0GTokHdo98YUGW
 b4ANnAUybrhsSrExZn7AHrg/iK+7ihnM35SmlIlJSgNu31vUxcgxyLiUggRQZpbBAHhi
 faC0P6wSEVpePsCpJVODMjdtxzVHYKvwyxrCxHX2jwK+ze0ZDzNGTFuEMkPxbaP0dCA0
 AqlV5QekJ5hSAjuTSvhlbVmi99RIFCuk/0PSGwoJMh1v414OgL9Mk5pr5fXvmEaCqf7O
 +lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pgG1/WFURbop1Inpu5WXlNwvEEqh4m1m8ew99capOjc=;
 fh=qkZN8kGlKav9Gx7Dn/1nzO+80XHltvatQacBzzDMbSY=;
 b=MhY//3zE2lZW9V6vT4vyALU/7xb3ug/C8I4N5aV2clZ5mQL869BBwnIuSXF9st4cRf
 5ow5PiDee5XR986dSoBFBro8rnkinLVXyKn5M805SNBct8CNKtw9oIHQ3wTZNRM3wis/
 hUJD55Lo5cvdvOxeWtiwdv8PiHVYSlcdZbsBoFThUrjj9+Q0jjjGATFsvl1/m2uzthEA
 6duc5jvQJUoZj9BM0KgV860M+9E//AQoeYeMdqQHliNZFJwPU8rjzRTW/vKJ6STf0CBY
 US1bCrGc/4fc/YmhpNuHR5SMk8XK4yChcJPnID3ya5DvoamLxtMb0XY2t7aDHDpJJoK/
 npqQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793931937; x=1794536737; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pgG1/WFURbop1Inpu5WXlNwvEEqh4m1m8ew99capOjc=;
 b=d1hWlfSidRLJ6MKCXPbu8BhPXDG3N/ufjWYiQ7yseNpYlqn8R4mOvk9WoZr3wEEsSv
 ujEkpIRmwFGccpNQrFFQ9jz3xVkKINoqIGE9PDEZNV/yENAmIkdp86FsnWHGJH/+eTRf
 7aAnotdWGCpjboB0gQv2EcK7VaZBugvp4hxqRtwUU66V9PK/1VB0FiiQY7MWMdyVXUVk
 GhUxXRdLzJD6Ge6VxCqv2sdytMs36YVTBjTzTM7x4yE3Dw4w6YgGKiawsMjSPMEOHaoo
 Y1CfprQsPtb7WvvRSITZ7DnZQ68qTmXsKRwqnkixIdS40Ceuvh/1OAothDco9xN8IVMn
 W5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793931937; x=1794536737;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pgG1/WFURbop1Inpu5WXlNwvEEqh4m1m8ew99capOjc=;
 b=KAmVkH5qUkY23f+P3zrpcBkpznLn3ynn/twIni6ru4P4FSahgcnGUNG1QLkUzyjRHg
 pNa5Z8Dk/BqMx1y/xWfTQwp8kS7LRu0SOGCI3UcqLkloiyI3yP0MAdUj6WsaODOv2h+M
 QRSa5VhkLT/17Ljy0gPk0WprHi0WB87UunPERUfAG8JEqfMFKMmRRSrFNyr9DWZgLr2U
 YJZEyNPHy6RHuI8DzoZlBgqsdMwVGTXQz+c+k4AAH4YCwZbujR1w5qbymnLOYczE4waW
 TCyISo1JTwdnK7rkjGG02IbrLtJGhsxFvenMqYFocFzfjq1IfZptONPYIMbXRGtGbmZC
 bR/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBz0Xzf9H7Qyo+8vcCZkeDbh6DhcJy4gZOwIXyi3UudhG+b46WDHKU32DiGc1GwRxXNJPfRAJNNelQ==@nongnu.org
X-Gm-Message-State: APuU4Z8YtEQ1j7mYRRgqQwsAqekT3z4Wtevq4rzv9KDhnIGpxk9gVFKV
 l/NpZscQC1FTFKXNIpbE0Tou2qq36AITMjUsqmXtnC5KpGAUMLCJdwzU5xUg02hB1NLlgtIxBYC
 ScHESnRZmJArDEWIi1zgWs9nAmqnk42g=
X-Gm-Gg: AYBFou1oHKROrsmCd10RT96UOitEQQB6xbJ7INZRDsjIXtFtJsWrIwgcOCysx7c0Nax
 nFTtslINvMe6a5+V7lOTXo+PcuyEYLSCWzzFalI3Z9zd3lX9bkljys55hEjFZ/RI5t4npyA9b2d
 PbV3JS7mf7Ja0M22NqoVfeYgTiNhRV4OPOAoJtkjNIXR/o2bxDHEARJH27tygrqfRrdfJkwgZ3G
 PsIw/rwISFeLe1l30CgbRfxyVw3WbgZTveEKjpx33rJSfAHpcxptUomr5zc0Yt8XgJt5oyQ40yq
 OJiJftAWcKH5JzZcvY3iBvvuiFJ/OQ5CkOWBQ/BPoO7di3bzzjR6adCVazuJTD1oypXT/8iG3iM
 fMqADKucBSBU6tWk+c4aPesb5p5B+T2zNZZbrTZ2KgL3nXGt9ff7Yu6jKdFTzVO1qGQ4542cBtc
 w28bJUxeypjyQof4wiNnkt7ilUMWV32tRdIqclO4YTdsjRr26vF7P/y80=
X-Received: by 2002:a05:620a:84c9:b0:93e:c12c:f142 with SMTP id
 af79cd13be357-945f356285fmr159770085a.76.1793931937256; Thu, 05 Nov 2026
 18:25:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-14-philmd@oss.qualcomm.com>
In-Reply-To: <20261105125203.40320-14-philmd@oss.qualcomm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Nov 2026 18:25:26 -0800
X-Gm-Features: AclHuK_IrN3GhLnbigIJYmu1h8-wxESrCor66rb-AwgS7YcweErE8fkX0fydS1I
Message-ID: <CAMo8BfLMaWO=7t9uL_eS=L-KvUpOtj3S7J_htZ8jYVKps-bjPQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/17] target/xtensa: Replace deprecated sprintf() with
 snprintf()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.993, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Replace sprintf() by safer snprintf() to format ISA error
> message, silencing -Wdeprecated-declarations produced by
> Apple clang 17.0.0.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/xtensa/xtensa-isa.c | 50 +++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 19 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

