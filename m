Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1121597njb;
        Fri, 5 Jul 2024 03:15:43 -0700 (PDT)
X-Received: by 2002:a17:906:2b15:b0:a77:cdae:6a59 with SMTP id a640c23a62f3a-a77cdae6ab2mr101323166b.21.1720174543150;
        Fri, 05 Jul 2024 03:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720174543; cv=none;
        d=google.com; s=arc-20160816;
        b=oaBDvTKs59cZH5bIIFcZglpYNPk9XNqAYOuAZ5l16l5GPVBWekZab2mAkC2VkzgcdT
         4WV16aRscqaD3rlDaPdHkMJ50wgy9YoYaV4FxfFD9VJ8ZMWJGSgtWv7584i8eq7irzrw
         IWmsHVNZlauVjS4WL9l/fqyTU3rTcPldIPGdY8X7u2z6S4t9Ly8M9lBDKwVR5EdrHosg
         uVFMx92EL6zFN+rL4fAeflo1zxMgD45eIEDUEHbDRrJWaddSaJ+ipEY/a66KU+ipd5wY
         hdM4YDSxm85WvNQNt/51peDOxJqCPqJo7We83UNAQArq5lguxQVZJmonbVEPkvi/DKxN
         T8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VDmg6aUjig8YvI3EdlfPb9hk1JZLmu8bya0+kCdKXM4=;
        fh=D8uyZejLYHQtwUNKtY39iIwPBhb1j2MMTF98+RktrMk=;
        b=Jcc2EC+CATg7EZUyERULHQcPUo1SLwPmFkAGC8OIXFe84cnZfIZztGMWpGsRU7JZXE
         g4HhkI6ggpSEcegLkDMylWT1elJEZHMqs+FM/AoFWQhlCYaUVPBfpVYA93Tr5eidgdng
         aGgRuLtk68Fgr2zaB91yAb1ab5/xF6/QuX9K8DusHCsoD0E0boALKnWOEaWb+1LC47u/
         Y4E8CYoMUOqbJYZi0HizIXYNgnr+6FZOCPmf0HzdBjcSFMg0Qz11YiWwGc9puxODprdM
         zg5yo8pRdVwDhkVzu7rLO6Gha1rh3D3fy/zhUpcZms38zJY8OBvQZm3kbUPiJ5gVb1ji
         BiLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqJYvdFU;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a77b7a7d82bsor121393266b.7.2024.07.05.03.15.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 03:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jqJYvdFU;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720174542; x=1720779342; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDmg6aUjig8YvI3EdlfPb9hk1JZLmu8bya0+kCdKXM4=;
        b=jqJYvdFUe+3fcCQ0Y0JXR9T4pJHdlPq7Y3Bze44KWI2IDddTh9Oqxjau2vYUQI+1Ja
         R6zpPsQTKC2hzLgrC8lVfwQ0dc9/qsBIz3aKm2aZkJsIDgi9hY6v4EQTmTr0aR12axD7
         BEIFMrNWjdDFZPnsBNBJzsjfOq+gobnTT4uIomE0wtCx6LepdLfiWCQ2TkZmvHiWaZTA
         +wZPIdh61AqvExgfyMrWt7fR6S2MflACr7qRHEcBuhNAvdCekjYRP2B5Zl4pwKLHOpQ6
         7ZdcyKnO87blJsoTsCYs9XToTU9jqh/oCAGxQj0bK0PA+LjFNoqDE0Pkju/jqdldp1Jq
         0NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720174542; x=1720779342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDmg6aUjig8YvI3EdlfPb9hk1JZLmu8bya0+kCdKXM4=;
        b=OXfQ1BwKbFqPkofq+5b0/cv5ClbMigJ+Q/4pKMPXfJUtgnuwk/q/7AVN5t0mP0IYNg
         xK9a1Xz7CbMHCrn36ERbTRsmYPAMPC248w0UenevqFxEoXSGmFLHF+Yo6PkGZKCWwTvg
         l7045UngReprwurqYuoVC0bzx7f7QTPWS6N93lBnYxZR4Rjir6e9xyQSiLnNEaieyYVX
         3qHYLRsRBkmDWvVmwZhakUegH6oZnNaGT8bDgFVZXNyo5GokgtyldKa4gzk123AOphVV
         TmTn7ZO99XPnoMRccGIyuIwAVisLoDoyI0wOygYNAy/pptcPZqxyhTUlKZKgcwsBFX+g
         DO9Q==
X-Gm-Message-State: AOJu0Yz/Cxc8PihPBBbc899siU3n4EkCXVhqZYI4Tu+Fgl2eZ6AmaLba
	MpVaG3IYrZZUKrjO+lIbavR6ZluovnatAesM4jAxBdORxqRw6LUxdpTSSuKivwQW0npy2LGdH+w
	2IU1F7C8MOG0pt02/jKyOtgNVAQWT9toCTi7q/PDjd+GBWWIDVJukxt70
X-Google-Smtp-Source: AGHT+IF7FRfYU5D1rr3eOPrR1qPHE7sDdXF2O9+QMOtDRgGcHb1j1BRArrXHMvYy0QzP3FY8HlfHEFctjtHAL/KXDNU=
X-Received: by 2002:a17:907:3f08:b0:a75:35e2:2b2b with SMTP id
 a640c23a62f3a-a77bdd8691bmr309454266b.35.1720174542186; Fri, 05 Jul 2024
 03:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-23-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-23-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 13:15:26 +0300
Message-ID: <CAAjaMXbwMUW0b_5Q1UG9jqg1Ad4sejoxfMJAeX_MkMQ0nPon0g@mail.gmail.com>
Subject: Re: [PATCH v2 22/40] test/plugins: preserve the instruction record
 over translations
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	Thomas Huth <thuth@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Aleksandar Rikalo <arikalo@gmail.com>, Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Burton <paulburton@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LzYTt8x6arVL

On Fri, 5 Jul 2024 at 11:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We are interested in the particular instruction so we should use a
> stable record for it. We could bring this down to physical address but
> for now vaddr + disas seems to do the trick.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/plugin/insn.c | 76 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 5 deletions(-)
>
> diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
> index 524f9ddde8..baf2d07205 100644
> --- a/tests/plugin/insn.c
> +++ b/tests/plugin/insn.c
> @@ -43,6 +43,44 @@ typedef struct {
>      char *disas;
>  } Instruction;
>
> +/* A hash table to hold matched instructions */
> +static GHashTable *match_insn_records;
> +static GMutex match_hash_lock;
> +
> +
> +static Instruction * get_insn_record(const char *disas, uint64_t vaddr, =
Match *m)
> +{
> +    g_autofree char *str_hash =3D g_strdup_printf("%"PRIx64" %s", vaddr,=
 disas);
> +    Instruction *record;
> +
> +    g_mutex_lock(&match_hash_lock);
> +
> +    if (!match_insn_records) {
> +        match_insn_records =3D g_hash_table_new(g_str_hash, g_str_equal)=
;
> +    }
> +
> +    record =3D g_hash_table_lookup(match_insn_records, str_hash);
> +
> +    if (!record) {
> +        g_autoptr(GString) ts =3D g_string_new(str_hash);
> +
> +        record =3D g_new0(Instruction, 1);
> +        record->disas =3D g_strdup(disas);
> +        record->vaddr =3D vaddr;
> +        record->match =3D m;
> +
> +        g_hash_table_insert(match_insn_records, str_hash, record);
> +
> +        g_string_prepend(ts, "Created record for: ");
> +        g_string_append(ts, "\n");
> +        qemu_plugin_outs(ts->str);
> +    }
> +
> +    g_mutex_unlock(&match_hash_lock);
> +
> +    return record;
> +}
> +
>  /*
>   * Initialise a new vcpu with reading the register list
>   */
> @@ -131,16 +169,19 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, stru=
ct qemu_plugin_tb *tb)
>           * If we are tracking certain instructions we will need more
>           * information about the instruction which we also need to
>           * save if there is a hit.
> +         *
> +         * We only want one record for each occurrence of the matched
> +         * instruction.
>           */
>          if (matches->len) {
>              char *insn_disas =3D qemu_plugin_insn_disas(insn);
>              for (int j =3D 0; j < matches->len; j++) {
>                  Match *m =3D &g_array_index(matches, Match, j);
>                  if (g_str_has_prefix(insn_disas, m->match_string)) {
> -                    Instruction *rec =3D g_new0(Instruction, 1);
> -                    rec->disas =3D g_strdup(insn_disas);
> -                    rec->vaddr =3D qemu_plugin_insn_vaddr(insn);
> -                    rec->match =3D m;
> +                    Instruction *rec =3D get_insn_record(insn_disas,
> +                                                       qemu_plugin_insn_=
vaddr(insn),
> +                                                       m);
> +
>                      qemu_plugin_register_vcpu_insn_exec_cb(
>                          insn, vcpu_insn_matched_exec_before,
>                          QEMU_PLUGIN_CB_NO_REGS, rec);
> @@ -173,13 +214,38 @@ static void plugin_exit(qemu_plugin_id_t id, void *=
p)
>                                 qemu_plugin_u64_sum(insn_count));
>      }
>      qemu_plugin_outs(out->str);
> -
>      qemu_plugin_scoreboard_free(insn_count.score);
> +
> +    g_mutex_lock(&match_hash_lock);
> +
>      for (i =3D 0; i < matches->len; ++i) {
>          Match *m =3D &g_array_index(matches, Match, i);
> +        GHashTableIter iter;
> +        Instruction *record;
> +        qemu_plugin_u64 hit_e =3D qemu_plugin_scoreboard_u64_in_struct(m=
->counts, MatchCount, hits);
> +        uint64_t hits =3D qemu_plugin_u64_sum(hit_e);
> +
> +        g_string_printf(out, "Match: %s, hits %"PRId64"\n", m->match_str=
ing, hits);
> +        qemu_plugin_outs(out->str);
> +
> +        g_hash_table_iter_init(&iter, match_insn_records);
> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&record)) {
> +            if (record->match =3D=3D m) {
> +                g_string_printf(out,
> +                                "  %"PRIx64": %s (hits %"PRId64")\n",
> +                                record->vaddr,
> +                                record->disas,
> +                                record->hits);
> +                qemu_plugin_outs(out->str);
> +            }
> +        }
> +
>          g_free(m->match_string);
>          qemu_plugin_scoreboard_free(m->counts);
>      }
> +
> +    g_mutex_unlock(&match_hash_lock);
> +
>      g_array_free(matches, TRUE);
>      g_array_free(sizes, TRUE);
>  }
> --
> 2.39.2

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
