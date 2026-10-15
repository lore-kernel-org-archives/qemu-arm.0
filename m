Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3450CC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 09:41:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHHxn-0005eq-1D; Thu, 15 Oct 2026 05:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHHxl-0005dl-Dh
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 05:41:25 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHHxj-0006wV-Em
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 05:41:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6ac76a02368so4784847a12.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 02:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057282; cv=none;
 d=google.com; s=arc-20260327;
 b=lx2+4akefEopxBdDlgyEaq9oZytnqxpkgYkxz9hQU8AH7cco6neweE6xyfrIYrqoGU
 9ABIv8Eh9em//v0ysG1nDZfkyhv3RZl0bCIh3NhMZdE+W5mtVUoO3WASdh7qpfbdnMqj
 bCA7Dny9VEPCWZoGDZPYMidKTCBVqtlCvpH0fvePEeXJ5BcOjkM961yz5urKCzngw9or
 zQKI1iIms7ZsisQzOvJXV2NU14CZsk9J1WnIu8EIO4p0PX/FN62MzxBxROq/WOWbmF1N
 i7aZWMwYeNl287ZX5vABObHm9XAj8iyc0CanaA5B/M+s+6ALz8f08z+4zqXOaYrH6UQI
 fsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=T0uNFZETbrUrkESV3u2WXEkKMGRLrPXNrI21GDl35/I=;
 fh=ClFT+a1mIPNy4sszW4u1Ip0MfUqPi/V0okFHKd2eeRM=;
 b=UJymkFMd0hC2lEbOOYDkGjn45Rybw7ok+1D58SLFXqZH0YiDzGTovLFnqQgVe6cCNE
 wFnpZHDwPKYfE5ZG0VrI5/s45M2CtqYnGsfCvIszKHnRq11sgKnNkOC7+fOdVwdEc7mW
 /dXpE9I3cF1pTrr0zFm3fvSI/sdpv4X3n+lWyfbCfaNhENCmp23T3/e+slnNFbsHrD5P
 xTDWW5WffIkHz8olouyg3Hag74TfwF2+Bs7XzECXfn6aRgvjIsuKrWoYbzNq1IKyJ6Wa
 9Q5xikoj5JDrrkev9ec7AiL0A5yEBDso8c31Guft6bkax5A2PafynUkxQp7PPXc5lVRy
 5yCw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792057282; x=1792662082; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=T0uNFZETbrUrkESV3u2WXEkKMGRLrPXNrI21GDl35/I=;
 b=oQgrtxsbc5GBLlm1Ykh5ado6R13Tvwv2EeEo5C10ht+Uhrvz92KvGugqvnbv8HZ5gc
 iliXokoTYPpMJuJRStk+PCbZ0n8t5+Ka7FenF04n6c6w+pYVu3GLQmoTJasMCQRYcTxk
 o1CCGGHj9QQUoPR8y2uWXwz7FgIKziCvupGeiBs0hMNOM61eQYOvT225Rxlxs0OQNfGt
 PA43TrvqBVpuLcCCU00L+ib0U7oXt1YMnM5GBtaSPL1HV0HAfZvRwTmrKWol3wUIscDz
 IpZ71duLs5Nbr3gqrr/VBPU0oPsKuK25gXpPn0sbbbVaJnhyxyr/l+nbp5ARbTNuyA5T
 FSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792057282; x=1792662082;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=T0uNFZETbrUrkESV3u2WXEkKMGRLrPXNrI21GDl35/I=;
 b=p54We0F7TF+T/ZkEd8ExTaVJHnOJyxRexi5DE7q1e5EcbV5DBe4ou91OaMghlMa6h5
 JwpnhAIf+Ln50ivP7Z1XXnDAje/Og+LJkzG/TTePvc12TW92GiLtz3bDifVJPFJUuSNT
 +xzixf27sbu/SeDKd/HqOpioE3aqQCTjAiz180qh9hsX22w4iDiPNI2x2TyLOzchPvXl
 lT4td7K+pZ1D13JbBzyySKFP4E/A4ZLTKRFyNVzYEKZthaxQ14cp/SrKGPoxnJx1bSA2
 GfItESqYFOv3iiOXEl0XUia17c8VvIPEnkPUd6Z/cN2sLQXSBFRZydw6ncH0YG7CpgYx
 z9Pw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0ol1NHDFhcON63btMwAeo4vxcf4K4rUihb1AM/dC6hqQxVuPYO4Z3e5NQZjX/xHAR+q3NoQe24g==@nongnu.org
X-Gm-Message-State: AFq9FYJkbzaeX9YGT4xd/17VyuemRwAl97Q1wXXkkN7UAdgHqI9JaFlZ
 gpQhlN0F/bUsqh3NuZfxZMH3Lz+zOqLsy1PoukUbbOGmX4rJ2YotLnTS945I0/ZZjSdKkZBKMWn
 aXFsC7xT6Ht4VhcTYAsIFcPWwCkNqANc=
X-Gm-Gg: AYBFou1j0vuSMXmb4KVmMpRh7x+jLrs/cxjNY9WUv4UPvkC7zUmE5OND3vr4f+5Z+Qd
 2lMMBHncPc3z45cmxzWRNetMiPiqvhspL6zF2cXNymaZotS4SQtebFxtjdV2zVdZjfTGd3cPl3j
 mHmAGPdCQDZyy4TXacdVL33w6N0sI4VcWqsiDX4LFIs/91OOj7N6V1m2XReMNbwiphMHNdgdM0g
 mdHDk5rupRwHtFnmz6+msi+I/A+777jxMR5JHCBQjOPtH6opUVZVXemrCJ8cMs4VRchMCqQmEEp
 QbyayEzsR40lZjTTBpY+07FsY/w4IXIpuaAXDxTG6akAAaD+6UJMqGA=
X-Received: by 2002:a05:6402:44cf:b0:6b1:c7d9:b622 with SMTP id
 4fb4d7f45d1cf-6b1c7d9b9c0mr7663893a12.26.1792057281361; Thu, 15 Oct 2026
 02:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <atCc0GPHiZo2WlNM@redhat.com>
In-Reply-To: <atCc0GPHiZo2WlNM@redhat.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 15 Oct 2026 17:41:09 +0800
X-Gm-Features: AclHuK8GYGbA3cAAtuTRoMtEpjaxjCZh2tLZUcHwEvNTtJEr9Kx9Nv2nZyoQY1Q
Message-ID: <CAE2XoE8ONwY388OqaOBh65RvLr3Gsksk3QS3Cw2HFqH=bHE4-A@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <17746591750@163.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Xianglai Li <lixianglai@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>, qemu-s390x@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Oct 15, 2026 at 5:29=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Oct 15, 2026 at 12:41:02PM +0800, Yonggang Luo wrote:
> > Put query-cpu-definitions, dump notes, monitor, and Angel semihosting o=
n
> > TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> > Keep the table in target-ops.c and with a stub
> >
> > - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
> >   can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> > - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> > - Drop stubs/qmp-cpu.c
> >        stubs/hmp-cmd-info_tlb.c
> >        stubs/hmp-cmd-info_mem.c
> >        stubs/dump.c
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > +typedef struct TargetOps {
> > +    void (*info_tlb)(MonitorHMP *hmp, const QDict *qdict);
> > +    void (*info_mem)(MonitorHMP *hmp, const QDict *qdict);
> > +    CpuDefinitionInfoList *(*query_cpu_definitions)(Error **errp);
> > +    CpuModelExpansionInfo *(*query_cpu_model_expansion)(
> > +        CpuModelExpansionType type, CpuModelInfo *model, Error **errp)=
;
> > +    int (*get_dump_info)(ArchDumpInfo *info,
> > +                         const struct GuestPhysBlockList *guest_phys_b=
locks);
> > +    ssize_t (*get_note_size)(int class, int machine, int nr_cpus);
> > +    const CPUSemihostingOps *semihosting;
> > +} TargetOps;
>
> IMHO, TargetOps shouldn't exist and this kind of thing should
> be done as virtual methods aginst the CPUClass, or failing
> that, against the MachineClass.

Good point, so > +    void (*info_tlb)(MonitorHMP *hmp, const QDict *qdict)=
;
> +    void (*info_mem)(MonitorHMP *hmp, const QDict *qdict); should on Mac=
hineClass?
make sense. just for x86 we need a base abstract machine for it.

anyway this is intent to be dropped. just for discussion to receive
some feedback.

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

