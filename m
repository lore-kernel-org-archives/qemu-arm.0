Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE3E8B36B
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 22:07:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnOXm-0003eq-TB; Tue, 03 Feb 2026 17:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yodel.eldar@gmail.com>)
 id 1vnOXl-0003eJ-Lm
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 17:06:45 -0500
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yodel.eldar@gmail.com>)
 id 1vnOXj-0008Cz-56
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 17:06:45 -0500
Received: by mail-yw1-x1141.google.com with SMTP id
 00721157ae682-79456d5ebf9so62020587b3.2
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 14:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770156402; cv=none;
 d=google.com; s=arc-20240605;
 b=ECa4+5sMsmahKdpVU1bKJHl6pziPKiXrZZsjMR4EZNKZr+MRrfuVmBIJA0OHaEDZIl
 n64uGGwWOqp/2GElTE6FR04wtAxtwx2dGsgJERpo00ynV5NS5B7O6MVtPZGkQd3r+Upw
 74EMgnuLY7K+kYvxnK0+xnbuHNJoBnf6m3TZh3I7meecFEsebjxzswi2QKXOWLSqnG2N
 XStfm/461BSzo9ZSseSulJ6C2je1SX5ZWoHAnbdJ7a09WGKgC8GpowghyRo825V3LcqA
 OlK5Rp1DgYYa8P8+II9gyyS9Vp/bxBi/MDfXtCHvYkdovvfaCvqarPY0sWZBSXDwZGa0
 iXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=09qv1dQ3mV4EjW1PnTKZU4Ka0kSqROpxX43mwtQSHDA=;
 fh=2GGQOQTriJWPkVrPH/o2Jss0yLMKRpzml2YZvQ6jF3E=;
 b=IZqvHQI3lvLNu7+2rAL0SprycceLG91dKu0J3sIp/yZhYKneamp7+uVuf+4i4YQuei
 bMadR2CAkIdIca5kWN1RMe74Vf7Vxw6VXI3oyl2W1Oc2T6GSK7Bi4ZaUPWsO1C2lE9Jo
 DPvIJMnbDpGrLLngcdTUja5c+U1o+U/60BDYIVaBalfPXcAiuNPtaRyLgb6DqHOa8qDX
 qhR4FOJ4KDusc1fuXDamIpuyvmp2hYC+Lhm6U4E9QT5442Qa9KyoB4P6gvXrtAj++zXh
 oTRZnwqExQsUomJkQ1rG4/GeoF1qklw7mMArSz5cNnUG5u9HWDpXdzqUNQtppnJmU/U1
 2GQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770156402; x=1770761202; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09qv1dQ3mV4EjW1PnTKZU4Ka0kSqROpxX43mwtQSHDA=;
 b=GQ3KPHSgxuQglhaR6bSXnKQMuwAnWABIEY1jkkyOJDFVZQ01mSl1wt8+GdeTqnhOCg
 zQyOn+mNIzmDuY01BP2w1w8zjj+kfztZPpQiRCFjOSNT9PfhHxKwhNWvOGQb6zEgoNGf
 qb/mN4GCRapes/PtI3YLkmc8Te95eKa3W14HNIfqxP2o+jrTB/tA0XQZ/3kIqG1oZF9u
 76y+bgawtucMksDPMn0O6ASHxnVop1vHEiimMdyescYT1jAOmGK0liyk36eqzWNaSsBf
 kI2y7ba7+uZqzHWmnpRKl00yQVutmZdVWr23/aABM9JvVFStqLI136k20SX/1Luhtd5r
 9Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770156402; x=1770761202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=09qv1dQ3mV4EjW1PnTKZU4Ka0kSqROpxX43mwtQSHDA=;
 b=npYuEwAREYqn4L2V7cro06Qn+S2GlHpafYeZYs53twfCC8zR/uwmKMkeQFghAFzXDw
 cLpzx5cI6ppb1BxCdvVkCICs947ofoIAfTEpSFlYpUmVnCyzUEk/6blPAUnbz7GlvtD9
 dXEPeubqzcqopPjCUoGbxnhQJ2MwttHC7tOkFy/SevmvaUfIwU25WcEz/U0eg03rTOKr
 7B6kJCOSffwDoDVmffwOqiLjfVdB/1aSXjdNSRUNRH1ESoh1llgf0yWa+Yqy0Uqvp+qr
 GB7Ig6G5tzgHiE94aQAU/3J9MhKw3uxIF2vhFxJZMqg+hxFVljGbwFMLKhp/rSRXbjeS
 xJSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCtxxn6PQckt+jbYSiBdFHHK8ChVWnj5AlLvlHHvA/zNyF1Wds/T89/T/aHaxRo3Aye8g4MAK73Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx+Vh6ANyT3/1Tlx1zCi6OxucgVebR1S5Gp2KHONnASPv/wZV/e
 0dFgOrgGwAMVABgDZ0J7tYmhiNxoNAWwJkG0Q5ZCcA47GdFPO3uq9RxLm9ki48tDg+rzyiUOb2W
 nHl4QumRdmXUq49ub7eKPv6nbHmTArtQ=
X-Gm-Gg: AZuq6aJzSxOVPtJAIvPOtc/JWlITGCPC/F7rCLt4EjfQI2r+RXrfvtqXlPr2t3v/KsS
 uXKyJ5SZgUrwKWKMG04M1FMF1up7gklZBIyzWqTgy9F4H0SgTWzifv29+yTZ6QshNz7/YKVBQQc
 nSllsz8weFAtQ05BxZMA2fzcKRxfYY55f52WDvPQIIC8LAu+9Oc2B2uAMU13K5EBEzSTLALgN8z
 QVAmpaF3oEuCd8ibDvJOLuUxmVMgL6GcxTvyiwWy9TN4uavHZw2Dn9qkS2RWLjCqXLxOz8=
X-Received: by 2002:a05:690c:c50d:b0:794:c373:7230 with SMTP id
 00721157ae682-794fe6925c6mr9978927b3.23.1770156401662; Tue, 03 Feb 2026
 14:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
 <20260203115201.2387721-4-alex.bennee@linaro.org>
In-Reply-To: <20260203115201.2387721-4-alex.bennee@linaro.org>
From: Yodel Eldar <yodel.eldar@gmail.com>
Date: Tue, 3 Feb 2026 16:06:31 -0600
X-Gm-Features: AZwV_QigCPUmuFKMGMAk28tEGsoVdPmrj_v9SrwktMypBQ9wWmj8AwU3tn6yVSo
Message-ID: <CAHhgW4W4YZjWytqFpbEmhfh6cuZJdtCgqi945q5g42SWZDvEUg@mail.gmail.com>
Subject: Re: [PATCH 03/11] gdbstub: remove the need for goto cleanup
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-s390x@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1141;
 envelope-from=yodel.eldar@gmail.com; helo=mail-yw1-x1141.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi, Alex

On Tue, Feb 3, 2026 at 5:51=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> We already set a default error reply which we can only overwrite if we
> successfully follow the chain of checks. Initialise the variables as
> NULL and use that to gate the construction of the filled out
> stop/reply packet.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks for the patch: glad to see a goto gone.

> ---
>  gdbstub/gdbstub.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 1f8cd118924..d4db7ba30cc 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1413,36 +1413,32 @@ static void handle_v_cont(GArray *params, void *u=
ser_ctx)
>
>  static void handle_v_attach(GArray *params, void *user_ctx)
>  {
> -    GDBProcess *process;
> -    CPUState *cpu;
> +    GDBProcess *process =3D NULL;
> +    CPUState *cpu =3D NULL;
>
> +    /* Default error reply */
>      g_string_assign(gdbserver_state.str_buf, "E22");
> -    if (!params->len) {
> -        goto cleanup;
> -    }
> -
> -    process =3D gdb_get_process(gdb_get_cmd_param(params, 0)->val_ul);
> -    if (!process) {
> -        goto cleanup;
> +    if (params->len) {
> +        process =3D gdb_get_process(gdb_get_cmd_param(params, 0)->val_ul=
);
>      }
>
> -    cpu =3D gdb_get_first_cpu_in_process(process);
> -    if (!cpu) {
> -        goto cleanup;
> +    if (process) {
> +        cpu =3D gdb_get_first_cpu_in_process(process);
>      }
>
> -    process->attached =3D true;
> -    gdbserver_state.g_cpu =3D cpu;
> -    gdbserver_state.c_cpu =3D cpu;
> +    if (cpu) {
> +        process->attached =3D true;
> +        gdbserver_state.g_cpu =3D cpu;
> +        gdbserver_state.c_cpu =3D cpu;
>
>      if (gdbserver_state.allow_stop_reply) {
>          g_string_printf(gdbserver_state.str_buf, "T%02xthread:", GDB_SIG=
NAL_TRAP);
>          gdb_append_thread_id(cpu, gdbserver_state.str_buf);
>          g_string_append_c(gdbserver_state.str_buf, ';');
>          gdbserver_state.allow_stop_reply =3D false;
> -cleanup:
> -        gdb_put_strbuf();
>      }
> +
> +    gdb_put_strbuf();
>  }
>

The `cpu` gated block doesn't have a closing brace here thereby breaking
build, but it does in the next patch. Maybe a `git add -p` gone awry?

Also, would it make sense to move the `cpu` and the to-be nested block
below it into the `process` gated block to avoid the `cpu` check
whenever `process` is NULL?

Yodel

>  static void handle_v_kill(GArray *params, void *user_ctx)
> --
> 2.47.3
>
>

