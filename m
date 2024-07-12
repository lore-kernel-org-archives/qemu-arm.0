Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp828429nji;
        Fri, 12 Jul 2024 07:19:09 -0700 (PDT)
X-Received: by 2002:a05:6402:40c6:b0:584:8feb:c3a1 with SMTP id 4fb4d7f45d1cf-594ba997626mr10368386a12.1.1720793949226;
        Fri, 12 Jul 2024 07:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720793949; cv=none;
        d=google.com; s=arc-20160816;
        b=aGYbgqzNf0w0yeC4UPh8cF7nHVGP5pTXNbNeJ1H/Gzas2+U+lQvIHIrZM+yje/C/g5
         SyxknkamnUa6887cVfgJl45TXmT5k9n6YFFXQdBgndkpG+6pwe5ZEUYmYdmVWqEuTGY4
         +uQ6edSEY1Pr++aQmauqgFAEinaJhiMstqxfBIxbiUVOF0tIqSqoj0EsUe2Yo5xfsiDD
         5qdNqxQV4HJcdQxBp8o+ab+FqrxXBeQGB8Hme4IoJTV/Wm+qnSvkAaMDz7Tjl0n6Z5l8
         9hwQy6DusSJKTzAgQZf2UqK47zxq92gy24Pu4liPhf/sm6l9ic3rGPI4iJikGQubD7xw
         2swA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t37aUeW9ye6rJBOVxrPwek6tZu/fTtWILNdTicrDpNI=;
        fh=5aEE39Fi+bkj1OrrqBWVR1bOL3D+VKS2hzeCTnqwSyY=;
        b=nHANnI2G3aPLeRqAXl3zNfR2lh0MQ/YCDFz7vEM4YVKZc3vfx7D0kKaxf7gsqnEgIm
         RHt8wB83OEe02ap/pO3PioCl50S3XFcG5Aqd55zD58goRUFv4eKU9Mma2aJorKCXBY8P
         Nnf27dHmhIDKKE9DeOBClXEEq8C+ysu1JzPX1gyRe3TuOgwtS1HuuZQxTCBCLam6B5/i
         vgkqfmOB9PwuVzHzCVfqEdRBTCni317JShq3hZJYwnoVKeHBZwJI01cgxRe8t8xlWdQY
         8LywNl2yTPVsYqL2zLLwVivgHebqOx5e1kjNxQMGI0Sh6ZAyT4VACUTk34g4oGLrico0
         5xKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHRWhkou;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-59974a938d8sor561918a12.8.2024.07.12.07.19.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 12 Jul 2024 07:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHRWhkou;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793948; x=1721398748; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t37aUeW9ye6rJBOVxrPwek6tZu/fTtWILNdTicrDpNI=;
        b=qHRWhkouwOFqAp32Uw94oxiSjnfaiZGG0+r1DCha/dVdD1ZpfBzcFcZdOW6PVaSdfU
         kyjcfsdZf+fPrnH0qrihdu9J0tEkRTC3vR78woIE49NdOd9C2ajY5WCypDA+gZoo+sae
         DFNOhNNLM68+y84kKJkGz0JXEAzAN+/tJZaltKNeoLQ9q6Zjc/GXjoPcpWqav66F049x
         QXnyDZa9sIdyYlQNPoSSAM00V91vG8nBfBUVVTsbN+3TPAuc3vTaLeyvcDzeFjOUzDPX
         fxGt7TobVk6AfZmghd3T9vc04XXkQLUAG33hIjvJ+fbfJrPW9UmDjTmDrbUqKU+CN6fK
         LTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793948; x=1721398748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t37aUeW9ye6rJBOVxrPwek6tZu/fTtWILNdTicrDpNI=;
        b=f8bLLzvF0+A6vzuwY6fTZijhiXabtnw4olCJ8kx+DJctXiTZ12iDxCUeIN7fjWkCZy
         /7zXtRZIjILoqGU/KWxiW/OCwsQgvnDaoZyK/w5Uj34aK7YXJyPyXGxgGTzM+JIL5vlz
         BgIc7A8fK3Kf2FHkSlLvmya4Ll0IVhrDBojmSI0RRAyvUB75ZJB0ej4xJBXeOXfaRviW
         /2Rf51gFvwaJ3BM8XBVii506q8KD3t33BJqjoCLEDQBwN12QmMVFEdweQZP+k1bGg2jx
         JH7V97rym8lnH4Yj9pnOuB+xj/iOFYxQ8rPKH54eHD+t+kDu0qVBaGKfF2pHgiVzWsLT
         8SRA==
X-Gm-Message-State: AOJu0YyFD5mhT2txqGcp/gPHnpVvDX0BwM352K3Tzar9mOZ/CwepEqCy
	46vZgEUePg2tXTXb1IcSF9eya0iyCwMecSF5n51GxVFWYAk1qvVT8edoRw8C7BA9V8Lijtkwjlp
	TwNIjsYRRukRAN0KQhGTFo7jihvN6moQ3S6c5LgfeQ+PURdoGAXg=
X-Google-Smtp-Source: AGHT+IH69WrN2p+J8+7S0k91o0wclcuFL3lq9JqExLi/w2oAItOrMlgwmjFuZJ+3bD5qS02Qh0V5Vv21RRBEKMyVQmg=
X-Received: by 2002:aa7:c548:0:b0:57a:33a5:9b71 with SMTP id
 4fb4d7f45d1cf-594bc7c9d69mr7336462a12.33.1720793948468; Fri, 12 Jul 2024
 07:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240705153052.1219696-1-alex.bennee@linaro.org> <20240705153052.1219696-40-alex.bennee@linaro.org>
In-Reply-To: <20240705153052.1219696-40-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 15:18:57 +0100
Message-ID: <CAFEAcA8YJwWtQxdOe2wmH7i0jvjU=UV92oeB6vUzT1GrQhRsTQ@mail.gmail.com>
Subject: Re: [PULL 39/40] gdbstub: Add support for MTE in user mode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: bgLsYic+5KAD

On Fri, 5 Jul 2024 at 16:37, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From: Gustavo Romero <gustavo.romero@linaro.org>
>
> This commit implements the stubs to handle the qIsAddressTagged,
> qMemTag, and QMemTag GDB packets, allowing all GDB 'memory-tag'
> subcommands to work with QEMU gdbstub on aarch64 user mode. It also
> implements the get/set functions for the special GDB MTE register
> 'tag_ctl', used to control the MTE fault type at runtime.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Message-Id: <20240628050850.536447-11-gustavo.romero@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20240705084047.857176-40-alex.bennee@linaro.org>

Hi; Coverity thinks there's a memory leak in this function
(CID 1549757):

> +void arm_cpu_register_gdb_commands(ARMCPU *cpu)
> +{
> +    GArray *query_table =3D
> +        g_array_new(FALSE, FALSE, sizeof(GdbCmdParseEntry));
> +    GArray *set_table =3D
> +        g_array_new(FALSE, FALSE, sizeof(GdbCmdParseEntry));
> +    GString *qsupported_features =3D g_string_new(NULL);

We allocate memory for the qsupported_features GString here, but
it looks like nowhere in the function either passes it to
some other function that takes ownership of it, and we don't
free it either.

> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +    #ifdef TARGET_AARCH64
> +        aarch64_cpu_register_gdb_commands(cpu, qsupported_features, quer=
y_table,
> +                                          set_table);
> +    #endif

(PS: this ifdef/endif ought to be on the left margin, not indented.)

> +    }
> +
> +    /* Set arch-specific handlers for 'q' commands. */
> +    if (query_table->len) {
> +        gdb_extend_query_table(&g_array_index(query_table,
> +                                              GdbCmdParseEntry, 0),
> +                                              query_table->len);
> +    }
> +
> +    /* Set arch-specific handlers for 'Q' commands. */
> +    if (set_table->len) {
> +        gdb_extend_set_table(&g_array_index(set_table,
> +                             GdbCmdParseEntry, 0),
> +                             set_table->len);
> +    }
> +
> +    /* Set arch-specific qSupported feature. */
> +    if (qsupported_features->len) {
> +        gdb_extend_qsupported_features(qsupported_features->str);
> +    }
> +}

Something odd also seems to be happening with the query_table
and set_table -- we allocate them in this function, and we
rely on the memory not going away because we pass pointers
into the actual array data into gdb_extend_query_table()
and gdb_extend_set_table() which those functions retain copies
of, but we don't keep hold of the pointer to the struct GArray
itself.

The functions gdb_extend_set_table() and gdb_extend_query_table()
both seem to not quite do what their documentation says they
do. The docs say they extend the set table and the query table,
but the implementation appears to be setting an extended set
table/query table (e.g. you can't extend the table twice).

Perhaps a more natural API would be for these functions to
either:
 * be passed in the entire GArray, and take ownership of
   it and be responsible for disposing of it
 * take a copy of the entries they're passed in, so that
   the calling function can free the GArray and its
   contents after the call
?

thanks
-- PMM
