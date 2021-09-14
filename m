Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp985169lfp;
        Tue, 14 Sep 2021 12:29:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHO24GysuubNqwgk/1Xx+ohf7a6TzvGucWrf5lv7x13i98GjVZWhYPXffpGfwrHR/n3LxT
X-Received: by 2002:a6b:5c0c:: with SMTP id z12mr15384483ioh.171.1631647769213;
        Tue, 14 Sep 2021 12:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631647769; cv=none;
        d=google.com; s=arc-20160816;
        b=KX0PMYOHF99LPYgMGh4RmRdsPEv3dIaOTYzsppCzFyNntCdpfqQpWSGDG4wECgLg45
         k9IWyMmxvRn84wjMLaUWEtlc1EbtE87lKybDGqBOLmWk+yKzp0PAcZfrgF2U43Vb/Zst
         /CdOl5WXnnp8RQjCQq3V9nKrwSvxYERGBVR7Q/x1HiYqeT6px/VwMxAmynmozr4jF2wZ
         3pkQvaaTfXGM2vKBHjPLizPQrjn3ylvJpqIUsCSR+dopsMtOyFb8OFs4S4g+eNXKAEGn
         50vDLNFqPOfR4xGYldQa98poYaW/9E+q3Qpxa+mw1rk/HGdAs00NAoJkPr2Rbc8M9tOQ
         AKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=hN4vORAL6pk4eOKDGREiQWEOzehMrMx6aFigbm5FxxU=;
        b=x8xGmpyzZN0puVWM50mfMzE71FmKiLVnapM5VaSNbGiyTvwSRazIojwdVK0MWlF8k2
         jTDi9jOY8miG6PpcW5n/DS97/Rfycwg2JvZwU/tSf62rHT+gyItunIPYb4TBWJ8LujPe
         WW0hXCvc2GLUWqqN9/UT2/JzZdk+mNUSckJnm5j27u4W86rW0P59tEvyxBw0nKbQj/7z
         a1K+fOW0XQawQgjZhZxvVr80up0tVCG+DT3YRJUowlwuJqlD8UzooeXjIzTwkKVUBU+D
         +SUP/BdszBo97g4UdCd7tAz8Bcv2VG2UVebsLLP9fjaLDguf1XNFn6Mqplep2F7VkWtD
         gV8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si10369828jac.89.2021.09.14.12.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 12:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQE7U-0002Am-E6
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 15:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQE72-0001Sn-CT
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 15:29:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:27743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQE6z-0008TU-BT
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 15:28:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-1I6aUjcDNc6A8MGHErAHNA-1; Tue, 14 Sep 2021 15:28:53 -0400
X-MC-Unique: 1I6aUjcDNc6A8MGHErAHNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BFF18A072C;
 Tue, 14 Sep 2021 19:28:49 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67B11001281;
 Tue, 14 Sep 2021 19:28:28 +0000 (UTC)
Date: Tue, 14 Sep 2021 21:28:27 +0200
From: Greg Kurz <groug@kaod.org>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v2 06/53] hw/core: introduce 'format_state' callback to
 replace 'dump_state'
Message-ID: <20210914212827.65559b21@bahia.huguette>
In-Reply-To: <20210914142042.1655100-7-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-7-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tKtY4FxWErW

On Tue, 14 Sep 2021 15:19:55 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The 'dump_state' callback assumes it will be outputting to a FILE
> object. This is fine for HMP, but not so useful for QMP. Introduce
> a new 'format_state' callback that returns a formatted GString
> instead.
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/core/cpu-common.c  | 15 +++++++++++++++
>  include/hw/core/cpu.h | 13 ++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index e2f5a64604..c2cd33a817 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -106,6 +106,21 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flag=
s)
>      if (cc->dump_state) {
>          cpu_synchronize_state(cpu);
>          cc->dump_state(cpu, f, flags);
> +    } else if (cc->format_state) {
> +        g_autoptr(GString) buf =3D g_string_new("");
> +        cpu_synchronize_state(cpu);
> +        cc->format_state(cpu, buf, flags);
> +        qemu_fprintf(f, "%s", buf->str);
> +    }
> +}
> +
> +void cpu_format_state(CPUState *cpu, GString *buf, int flags)
> +{
> +    CPUClass *cc =3D CPU_GET_CLASS(cpu);
> +
> +    if (cc->format_state) {
> +        cpu_synchronize_state(cpu);
> +        cc->format_state(cpu, buf, flags);
>      }
>  }
> =20
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index bc864564ce..1599ef9df3 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -91,7 +91,8 @@ struct SysemuCPUOps;
>   * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
>   * @has_work: Callback for checking if there is work to do.
>   * @memory_rw_debug: Callback for GDB memory access.
> - * @dump_state: Callback for dumping state.
> + * @dump_state: Callback for dumping state. Deprecated, use @format_stat=
e.
> + * @format_state: Callback for formatting state.
>   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
>   * @set_pc: Callback for setting the Program Counter register. This
>   *       should have the semantics used by the target architecture when
> @@ -136,6 +137,7 @@ struct CPUClass {
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
>      void (*dump_state)(CPUState *cpu, FILE *, int flags);
> +    void (*format_state)(CPUState *cpu, GString *buf, int flags);
>      int64_t (*get_arch_id)(CPUState *cpu);
>      void (*set_pc)(CPUState *cpu, vaddr value);
>      int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
> @@ -537,6 +539,15 @@ enum CPUDumpFlags {
>   */
>  void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> =20
> +/**
> + * cpu_format_state:
> + * @cpu: The CPU whose state is to be formatted.
> + * @buf: buffer to format state into
> + *
> + * Formats the CPU state.
> + */
> +void cpu_format_state(CPUState *cpu, GString *buf, int flags);
> +
>  #ifndef CONFIG_USER_ONLY
>  /**
>   * cpu_get_phys_page_attrs_debug:

