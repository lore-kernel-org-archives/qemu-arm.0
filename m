Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D3CA5FC4
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 01:56:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xC61Q-0000PC-SA; Wed, 30 Sep 2026 21:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xC61P-0000Ou-HE
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 21:55:43 -0400
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xC61N-00087K-Od
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 21:55:43 -0400
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6ab01dda422so6414910a12.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 18:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790819740; cv=none;
 d=google.com; s=arc-20260327;
 b=r+CZ9V+ovRr1pilwN4DXnIyyNp4k3TMZWzsdxKOsqUrdYHre1NSf6dPgQNEgbm2AiG
 R404LLlJIIFQU2qoC71ih3/MSt39du94LMn1+5G0enccWQMKfcTf80TvwmD9iNLc/bEh
 R8AL+QQIgkd0pSfV4psWHCsrlAHX8JxQ8E1wkUMk5QxFbw0rAEau7i47lDvPZQ3H1MAy
 7PhMRAUxmqJAjZxVOsmysWu9CnUgxko0oIIlhNaLynIHYJuE7cMeekOTQBAbjed1bsMj
 H0qtB4Knc3IDYXWXiIqQ8hx7rvWt1lVTMyrk+rxhnXdjIRNEhanxgrsDD2FE6NLi0+lU
 Ktsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=eslYiYXFQvDxr8kUaYGFBywuo88FVeT2naogZDh9VQg=;
 fh=AXWKMgoFKy7J9mb5YzDHneN1M+9hgvrv6KD5PFILzWU=;
 b=HRMs69RJhwymgIFvIU5GIaGV1b2xJ7fjPSmKPipunEkE1GLdD/7LZXynfkc+wfAEXW
 5s5A5jGXK33MsqjsAvXP2qR4AQGwu9FxJ6j/rHfE+v6SUvCuWRKvKq7NjwuuAldaO4Nd
 gYP1zcOuU7kaF9zUQ4X0ZvNAvrxaNT7LaTYfmoatGOYkKcntcu6c70JAYrQSEpB396Q/
 IocLWyfiSUMIUYKyH2+kMIPoA66SobCzHFLL+y6MEQmL3r1IVWbCmEmupA8QPOoQX5wZ
 xuKCGwBfd2BVFXTg9/YfI2ZiBtUBag+FyXGRsPraVtg+3Qos5qvoI5nT9BF/Fb2I8Tj+
 CnVg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790819740; x=1791424540; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=eslYiYXFQvDxr8kUaYGFBywuo88FVeT2naogZDh9VQg=;
 b=Dl6nfn73G7rZeb6hw+dgXs2YhoJvKtRj3RkDIvLAthbWcAINlsTDsqYfahtt+8WUz6
 FHQp1UhxK+VghcufHjpzy7Vftb1VKKyxXuZZIuFVbLdJMOl7tT+IsjHFg6KZaf+AnnOa
 vWNjn29jEAgB6Nhk6M+e82vUjYutZuLucsq5o4Z0zvvAuPzrovoMpzCQqEPmX4ajpkEl
 xe8ns7TFoFIPlxmTCWpCJLjWMHZOQ0VwlRWKcBthPHMYm4BFPMT0d/sX0hp4t0pEErtd
 dj/GmCWwI07QNJoY/6T1jh8wBAXmA3PTDGgEQxngQx2KWQuSYracWUFfONU006OhFLuN
 rJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790819740; x=1791424540;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eslYiYXFQvDxr8kUaYGFBywuo88FVeT2naogZDh9VQg=;
 b=FFX6+wGRLGskLwiREdQDYMddxDREug4XijTB9TNzWdSxq5Pd5ur7Xp3PBdguo6e9EV
 H+vZrZmZcXsyTIp8UAkM6/Qe2mqGWYMH+VAzYMYa106DB12D7N7HhZRY7fAQyCvzIMvh
 EqDbthOXljjOdS5Fixo7uYeO9BbtxXQWZsR1bAE6j1e9M9x7sIrQcR/YOvyUbwywdXZm
 jzD4foSEw8ZbUFPLwyoS0ToOlKwL6TkBv1ssqJ13ZBTvNgz3qjMaxjkOC0yJj4+um1gc
 M/i1o1IK3N4cc9WfGre+h6yEp1gxzDzKb3jCUQBZ0u5E4xtEKd1q7r43kZMwB4zoXO72
 SU4g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtpKLPrLjKqQZ5iFF94s3wBNqOTYdzZdRL0b+7TkiFVYB/ozMJldvRVo1i7iIip21bjmtnUz09Hg==@nongnu.org
X-Gm-Message-State: AFq9FYLmuzwh1nPY5JJZSlFEjIJ6QJ6wT2SlSRevwHPXoFWAclGT98xY
 ahUOoLPMP4XoJ25pMGKDk63b3kLpZPrmwOPdZZMLgDqJRpcL1E0jHiVISvNat2l1WpczGWEeBlD
 n4tKrgqEjuAQlZN2IV9RSenbNDLIackM=
X-Gm-Gg: AYBFou3S/Y/LCkbVfVMdHVGNijJzBobcBEbXCW0E/nwxm1u4jSbXFtIp7VWs7dxRGn7
 xBL9IJI6RpUI1MUEntxwzwPzOimkgwJ/A1nHvTA7ePD0z0N2rdOnig7qoLcEGDjBogk/l12vLSK
 Xe+bWcYlFhKU2bX6BoXKCsNun4I1j0nlMq1io492MMw++JCApQpdXQ63aqtCKE/ugxgA5ISrG9o
 pQx5a7bFbIJZt21he83XlguUVRheEGyMtV4ErU56xss86HuQORbfuedWZ0cgI/sG1mPljxkiuyx
 /1NHe+hbepOT902TNlNLttf2JRv9YTdzBzz7wj+pjhEriJR7KIlooF0=
X-Received: by 2002:a05:6402:324e:b0:6aa:e3f3:c9df with SMTP id
 4fb4d7f45d1cf-6ae1990a414mr1888551a12.20.1790819739766; Wed, 30 Sep 2026
 18:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260926081551.29-1-luoyonggang@gmail.com>
 <20260926081551.29-2-luoyonggang@gmail.com>
 <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
In-Reply-To: <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 1 Oct 2026 09:55:27 +0800
X-Gm-Features: AclHuK8iKySxkV-kuCqxi1orzJ0ulN1pyKyKoz4DyA3W8FBmB8_29BliGBNMTeM
Message-ID: <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0e.google.com
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

On Thu, Oct 1, 2026 at 2:19=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 9/26/26 1:15 AM, Yonggang Luo wrote:
> > - Add machine_class_set_name() so boards can keep a stable -M name
> >    when the QOM type is uniquified. machine_class_base_init still
> >    defaults the name to the QOM type without -machine.
> > - Document that MachineClass::name is the -M name, not the QOM type.
> > - Sort -M help by MachineClass::name so order matches the printed names
> >    when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >   hw/core/machine.c        |  6 ++++++
> >   include/hw/core/boards.h | 12 +++++++++++-
> >   system/vl.c              |  8 +++-----
> >   3 files changed, 20 insertions(+), 6 deletions(-)
> >
>
> First, I'm not opposed to this series, and if anyone wants to pull this,
> I'm ok with that decision. It's just unclear for me what will be
> direction after this step.
>
> If I understand correctly, the goal here is to allow to register
> multiple "virt" machines, while still having distinct QOM types behind
> the hood, which does no affect behavior of current binaries who have
> only a single "virt" type at most.
>
> That said, if we project in the future where we have a binary with
> multiple of those "virt" machines, how will the current series help? The
> situation we'll have is distinct QOM types, that all answer to the name
> "virt", so we have no way to select them individually.
>
> Slightly worse, find_machine() will just pick the first machine name
> virt, which is a non-deterministic order at the moment.
> https://gitlab.com/qemu-project/qemu/-/blob/master/system/vl.c?ref_type=
=3Dheads#L846

That will handle it properly. For single-target binary qemu-system-$arch.ex=
e,
this won't be an issue, as there is no conflict as they won't be compiled i=
n.
For multi-target binary qemu-system.exe, we will choose the target through
-M $arch:$machine, and when no $arch is specified, the default to arch
to be "none",
so still won't be non-deterministic.


>

> A possible alternative could be to use ".is_available =3D target_X" on
> those virt types, which will ensure only one is effectively registered
> at runtime, thus, there is no ambiguity on name or who is the "virt"
> machine.

That's the issue I want to fix, ensure it is registered at runtime. So
we can list them
all when a "none" target is selected.


>
> Again, I'm ok if anyone wants to pull this.
>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

