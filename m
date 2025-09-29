Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F7CAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 05:53:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v36od-0007Wh-9Z; Mon, 29 Sep 2025 01:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v36oZ-0007WI-BR
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 01:52:49 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v36oP-0002FX-RO
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 01:52:46 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso7831257a12.0
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 22:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759125148; x=1759729948; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VCq/p/lbn3Kl+U3I6tXHtQ0bYzRnf9Ug2LmxEWr4K4=;
 b=ZRrbDXp25a8RRLMird1amQ7/B9A34aXBhWPfSXUmYrq/D/cyB0OAfP201wOGMmfbNy
 2jgJ0XaaAboipWOGjMckSKBOsyNWK31HEDHBV/WT7BXJpKQk6GbDqz6NeDKUBVfQCnwd
 3d74iVotBxTgBknYz91qlR+mKlPwGPH3C5vDrMuoFjoYbL1bsFji/xgXGHUKQh6xdjYS
 xc8dCuTRQU/2m7nh4Je3ZYRkPMV7GOSMICFSsPL6usuOhMnTeptIwaknZzLF9MNOF8eT
 wWamrOpynCUBWxMxy620wTWyc67Ux0vvrOasmHBxgDjHS/afNAYcr876RfpO5/DvwnHd
 FLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759125148; x=1759729948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+VCq/p/lbn3Kl+U3I6tXHtQ0bYzRnf9Ug2LmxEWr4K4=;
 b=G+CCcD7lZUwmn/eAZKV7IFnMSbesaAkcHiapB61Nlx7RllOaQjgaALxvcJUOisWEXT
 4L1w394A3IT2a0v0hsGNDWIZaBe7pTn/VnPJO5j5oHQhcKE6yCGiuDb5TqT4PSr3u5nA
 Spg5DCCd87Sqxmo5SY22nCKH3XXQAZnk0UArSok/OoJujQdU3JbodfdZaxBkT9YXGbvP
 s6eVN1V0Uhpup0L0gUTz67Y9vm1yA/Hw99Mr0H4yvvZqJ1UtIIMtFe6ZTw0Y+/Ev1IFY
 YZFRtmAKQt9pFaN6Qhi3xBFd2ccOEPbeXJs+I4uBn4jzWCNYZpj9soFFuEHE8GNfXeNS
 0NkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNS/W8nx3nJG0ZVjh2NdA3g25VGesMlJqcKNPabiJy/+GVjD5neAP2iWSZUpLlx6B4HVZhsx3TAw==@nongnu.org
X-Gm-Message-State: AOJu0YzEPNR/+BZbkujHey5+H41FdnkhKHTw36uSgPe+1HZk+BfDfQVO
 5XwbzAybSdtyky7UdDJ3dzycSF/6Fm+JlLLyPtKpq9fqVGJMN63oZtaxHwQxSxU1B9zqdOYJcsp
 nLBaL1pexXC+WpfHYEYHrDLmo/ju0VbQAjFXJ5GQnuw==
X-Gm-Gg: ASbGncvDJQ8dMB4Za9mGVIt2gmfm4cbMGCG85Z21PUc2hedwd+TK3sUV2hOeI9mhZE4
 DxAK/yiAjlHizVAjwXF58WQu5zqc2lO4/B4D9dcsuEqEVVaiL2ZTVrjSpYOJkKCHOet0tYjVlyw
 ATJjbmL1PRaEEeXwE9/WcqflDxy3s2Tu7noQwLx5/1aTAkn6tql95Ft6uHGoCXZ4iS9Du9j+/sj
 q8Q
X-Google-Smtp-Source: AGHT+IHmR0pXlkXEaqYJAssv72wOWNWbEpP7cKo7XWRMxbPtxerSu5ZwGFrCXz8PUQpfUTuMB4DcO2s5jaBgQlgA0uM=
X-Received: by 2002:a17:906:16d9:b0:b3b:b839:577b with SMTP id
 a640c23a62f3a-b3bb8395f8cmr507944166b.12.1759125147852; Sun, 28 Sep 2025
 22:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250925025520.71805-1-philmd@linaro.org>
 <20250925025520.71805-3-philmd@linaro.org>
In-Reply-To: <20250925025520.71805-3-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 29 Sep 2025 08:52:01 +0300
X-Gm-Features: AS18NWB3aHu3e0FbaOMrIuIjUMcGC42FdIPVgPmXuiLfo0G3DvYKo2-l5KGdA-I
Message-ID: <CAAjaMXa9qGfE=tjOsLg_pZ_Zjzpwen1agdfxjJe6VNi2MnOYgQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] cpus: Access CPUState::thread_kicked atomically
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Mads Ynddal <mads@ynddal.dk>, 
 Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x532.google.com
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

On Thu, Sep 25, 2025 at 5:55=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> cpus_kick_thread() is called via cpu_exit() -> qemu_cpu_kick(),
> and also via gdb_syscall_handling(). Access the CPUState field
> using atomic accesses. See commit 8ac2ca02744 ("accel: use atomic
> accesses for exit_request") for rationale.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  system/cpus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/system/cpus.c b/system/cpus.c
> index 6062226d4ac..818a8047198 100644
> --- a/system/cpus.c
> +++ b/system/cpus.c
> @@ -480,10 +480,10 @@ void qemu_process_cpu_events(CPUState *cpu)
>
>  void cpus_kick_thread(CPUState *cpu)
>  {
> -    if (cpu->thread_kicked) {
> +    if (qatomic_read(&cpu->thread_kicked)) {
>          return;
>      }
> -    cpu->thread_kicked =3D true;
> +    qatomic_set(&cpu->thread_kicked, true);
>
>  #ifndef _WIN32
>      int err =3D pthread_kill(cpu->thread->thread, SIG_IPI);
> --
> 2.51.0
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

