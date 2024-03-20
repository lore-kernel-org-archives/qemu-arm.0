Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1726196ejb;
        Tue, 19 Mar 2024 22:07:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWWUcU9K+z3y0QMDUYWexchrIuf74tCbD3CvBkgHqpG5sboLHVOMKKpm+nWpp41iOgnS4L1um30QdmmCxNXfzJ4zkzCf1r
X-Received: by 2002:a05:6870:458c:b0:220:8d36:46f0 with SMTP id y12-20020a056870458c00b002208d3646f0mr1122461oao.11.1710911260022;
        Tue, 19 Mar 2024 22:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710911259; cv=none;
        d=google.com; s=arc-20160816;
        b=r2hfoXBU53md17j0bvRI3yrtvdTV75+CJZM23yyRKFdAMrUNlXZT4tEMHta9gDSL6k
         Neyx9SJh0GPeynQFXAeVfTOGAI+8BkeDuBbw3GWSipavh88a5X+20FAyK0xWw10wUYPY
         E7SS6ENY6YoQoOzp4/BjEfNu18bJGFXx6O/N/IfWUg+FMM8nAQWqmnr+WyzC2cuG8m4U
         lO3HD57ls2ZyZeiZ3WTLtXtwPSLgYuByHr6m4Vix1deygE01Db2l51qVvYleryxM6zUM
         yDwxzn8cjM/LLXbogHnMpx36hiXkLdeQbChhPOZIeHK2CNLi7nbnZC4Sd2XeQN9ATxxh
         Hlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=KJVHJSj6BukakDsadDHAJXnzFQAWZ78/dgRNkDGUMn0=;
        fh=g5i/vJowNDNKNzGuFKd/fetUpdHMjt+enbAU6YjDpXI=;
        b=B2bQiF7OSbntNmCpkBznCrgClX09I3EDRmUqtXJ6Kr6uFWgY+9jDMIq2kQfKbJeZ4X
         vv+8J/bWURFy4B+oCr7DKfMz6SswvMDWzCCxdp5djEcX2twGXZ3DzDrZyZkeks18in0H
         wX202BIR+FH41LaXWO76Hul7kMW5tozCUlap3aGQNQrDuyzLDNcM0VNvK17HjsWDyyQE
         /J6VMoY8o+WHG5scDd37imU163w4caZWRBU2peY9WWoP/uBIES26GucT19ISmlIsksK2
         rdu4TIO/i4PCArQjH8p+kfmQ/aCDjWCw65K105NEvza7CA7rpJf0K5vWf4ofFIYEmuXr
         mF8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZCe+Myl;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lp19-20020a056a003d5300b006e746055f0bsor2330167pfb.0.2024.03.19.22.07.39
        (Google Transport Security);
        Tue, 19 Mar 2024 22:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZCe+Myl;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710911259; x=1711516059; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJVHJSj6BukakDsadDHAJXnzFQAWZ78/dgRNkDGUMn0=;
        b=XZCe+Mylr8FFKHESmWphjXywKQ1/djIWRlXis+2NN4fCkZ5C957NCD3lBWEwtoTqo7
         ZhNm0WkVoy9nfku98vD3zRIYaq7ZFW9NHIDMblmCW+f4XjQ94bErKVuJjkAybEPZmtvk
         XdxRMp5lifZQPH2PFsYq4uvA7/5HyyZaGMTP7wCwLET0tuTW7xx3q5tQCzNwXP/bn8qK
         wJJqkcwapPbf7Z3VGk7eqQB3W5EtG7L+KSZ07qL//wwkvcpF0bBof9yRteGIrndMe46v
         KF+uf9B6DSx0S1rPT5Cdi4gjLhQ9YX4Bnk6UG+V77u82P6lxzXXBCnnQwZW6YZIrQ16n
         6RSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710911259; x=1711516059;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJVHJSj6BukakDsadDHAJXnzFQAWZ78/dgRNkDGUMn0=;
        b=EVm1KLqusvmmNjIGM5SQy624hmRYT79WRE5ytmyZAc21dJcjiOwX5P5SWk6+Jhy/Mb
         PMi04fx7RYlqHfIURYssBoCiVRXSL75yYGoeJSucZZw2AzpaYp1gpJKqsAm4sK70ftUi
         u/BscT05ZgtQPIZLVvhomSFLKZZl6vVsTOD2eBg9sBe1kuzMU8CZjuVOPxij5mrt9w8M
         8bQ7oBOGrdW9OxSvn3Krf2m3V/1Vg4e90NDsQ1WTRnPwFORyopAluzSeKif6xJIhMQ/K
         uP610qdUc3zPq+GXB8UHAoqfX/WBU1oXeqjDQdQsUCODBrKiWiji1JrpxqCBbwrfNTch
         eGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPIQQMDMr86xje3lFwVyZ1ytsv9JMCjd6PCt7F5pBeU6CXSB1GsLF6lZMTxexCIilXxXDacaWMh3fTyrRTHUX9o0JbJhshN8pogrmXAKXhlxR6MvbIhLmq45tm6ak7HwE/M3eXD3NNhNIHutImxr6airVjEeeW+o/kfIPRsSU244UIxj7ZcnwCJurI7zf2VXJmRfsAqpRT7fWAwKDtBA==
X-Gm-Message-State: AOJu0YwgG6ws6fN5XAAIk3nrvX0r+vd6inu1gRZkG8xQfIdIyFQTfiKW
	gHXz+jqxmvGDuOAjjXA5sOH5C+GgkWT+VKJPCVzBsjUqdv3TmZGT9B8hulHQ5wg=
X-Google-Smtp-Source: AGHT+IH2rImir7dMVpxwcGcJl1oG1hMMEOKOVGjA6RjheRb67pXkXeq++fZZW/A5m6QXgXiQK4Zmxw==
X-Received: by 2002:a05:6a00:3cc5:b0:6e6:f9b6:4b1a with SMTP id ln5-20020a056a003cc500b006e6f9b64b1amr1131163pfb.11.1710911258995;
        Tue, 19 Mar 2024 22:07:38 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id k21-20020a628415000000b006e6bf165a3asm11477451pfd.91.2024.03.19.22.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 22:07:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Mar 2024 15:07:28 +1000
Message-Id: <CZYBF4Z72ZXF.3V28R4RT25I8K@wheely>
Cc: <qemu-riscv@nongnu.org>, "Anton Johansson" <anjo@rev.ng>,
 <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>,
 =?utf-8?b?RGFuaWVsIFAgLiBCZXJyYW5nw6k=?= <berrange@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>,
 "Claudio Fontana" <cfontana@suse.de>, "Richard Henderson"
 <richard.henderson@linaro.org>, "Peter Maydell" <peter.maydell@linaro.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, "Manos
 Pitsidianakis" <manos.pitsidianakis@linaro.org>, "Zhao Liu"
 <zhao1.liu@intel.com>, <qemu-arm@nongnu.org>, "Thomas Huth"
 <thuth@redhat.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>
Subject: Re: [PATCH-for-9.1 19/21] target/ppc: Factor
 ppc_add_alias_definitions() out
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>, "Markus Armbruster" <armbru@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-20-philmd@linaro.org>
In-Reply-To: <20240315130910.15750-20-philmd@linaro.org>
X-TUID: Cm5RflxnUCyl

On Fri Mar 15, 2024 at 11:09 PM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Factor ppc_add_alias_definitions() out of qmp_query_cpu_definitions()
> to clearly see the generic pattern used in all targets.

Looks equivalent.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/ppc/cpu-models.h   |  4 ++++
>  target/ppc/ppc-qmp-cmds.c | 26 +++++++++++++++-----------
>  2 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
> index 0229ef3a9a..89a5e232b7 100644
> --- a/target/ppc/cpu-models.h
> +++ b/target/ppc/cpu-models.h
> @@ -21,6 +21,8 @@
>  #ifndef TARGET_PPC_CPU_MODELS_H
>  #define TARGET_PPC_CPU_MODELS_H
> =20
> +#include "qapi/qapi-types-machine.h"
> +
>  /**
>   * PowerPCCPUAlias:
>   * @alias: The alias name.
> @@ -480,4 +482,6 @@ enum {
>      POWERPC_SVR_8641D              =3D 0x80900121,
>  };
> =20
> +void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list);
> +
>  #endif
> diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
> index a25d86a8d1..528cc3e4af 100644
> --- a/target/ppc/ppc-qmp-cmds.c
> +++ b/target/ppc/ppc-qmp-cmds.c
> @@ -189,17 +189,9 @@ static void ppc_cpu_defs_entry(gpointer data, gpoint=
er user_data)
>      QAPI_LIST_PREPEND(*first, info);
>  }
> =20
> -CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> +void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list)
>  {
> -    CpuDefinitionInfoList *cpu_list =3D NULL;
> -    GSList *list;
> -    int i;
> -
> -    list =3D object_class_get_list(TYPE_POWERPC_CPU, false);
> -    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
> -    g_slist_free(list);
> -
> -    for (i =3D 0; ppc_cpu_aliases[i].alias !=3D NULL; i++) {
> +    for (unsigned i =3D 0; ppc_cpu_aliases[i].alias !=3D NULL; i++) {
>          PowerPCCPUAlias *alias =3D &ppc_cpu_aliases[i];
>          ObjectClass *oc;
>          CpuDefinitionInfo *info;
> @@ -213,8 +205,20 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Err=
or **errp)
>          info->name =3D g_strdup(alias->alias);
>          info->q_typename =3D g_strdup(object_class_get_name(oc));
> =20
> -        QAPI_LIST_PREPEND(cpu_list, info);
> +        QAPI_LIST_PREPEND(*cpu_list, info);
>      }
> +}
> +
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> +{
> +    CpuDefinitionInfoList *cpu_list =3D NULL;
> +    GSList *list;
> +
> +    list =3D object_class_get_list(TYPE_POWERPC_CPU, false);
> +    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
> +    g_slist_free(list);
> +
> +    ppc_add_alias_definitions(&cpu_list);
> =20
>      return cpu_list;
>  }
