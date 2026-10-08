Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AE0CA6011
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 17:05:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xErXn-0006jx-3k; Thu, 08 Oct 2026 13:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xErXd-0006eZ-1f
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 13:04:28 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xErXb-00027Y-Aw
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 13:04:24 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6acb9c018ffso1630836a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 10:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791479061; cv=none;
 d=google.com; s=arc-20260327;
 b=CetuV2LoAX+BdC6M8XVmrZgF1iz0BFwIuwxJDRb1l3HdmAaoG1qSVh/JdFxK2mxqLT
 66yI2woHKvJ1xnKwfVSmYtcOVL9UKNIG1SRv0HZylNXfQ06sSRtFXsljP2omgax5e5pp
 kVqCk6usiMGRnQHtB211UxMllx6yrGZlTkwXAfsYPgz4vkwOc7Si/OEsBvoJEOKWnWxv
 MjWtBRUUPiUvwX5poqO9yl+7bWYqSMhllie3Vr+qppzL4xxVZ0Mi1eqj3vhMgUKmjIl/
 W1NyW4c/zUKiMQDD+/Jxxh2FiwbGbpr02n6pDBjQcu+xMtNCKyk1cryXwiiJA3b8DnfW
 nQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=q/bYKfAD33Pc7+//Tf4tEpE4XctjvZAfka6zrYLc9uc=;
 fh=CuC5HXwxv9Gpr8M3vT3YHRhP2R2dhMQuN9HfTFXOd7A=;
 b=LaAe1/P8G7qOuFm5fuRmn42wy3UnOVZ+B05yVWLMd+3SjojoePorGPsEA7BPtfsq/+
 37wbjUQQHSiHTA+YHtVc7hBlNucjcJeqSR7NXWWjTTWr8T4lt93g0DpLm8iptxxM+m/2
 qW3DNMUh/UdQxO6PEpqFIoX8aSZRzNX0ejuDK9sZDuVHru733U08x9TR92QjetxEs/FR
 7iSByx+SOojcokgzspucZzxDkYth96ZJz3i9Afu2stj46uYKrqO7YEioGKcegWRZrr8O
 KKlegzQkNVtA1D4EieTkUTAQCU71kL/mrW2S/FlhPyAzaXWNmeiZCiHYRRIbZWn5jN9C
 e7wQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791479061; x=1792083861; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=q/bYKfAD33Pc7+//Tf4tEpE4XctjvZAfka6zrYLc9uc=;
 b=q35JHIUEF2MmMKHdEyNNizxQyV9+vCboGPkgQD0qFp9f3hFnXfWxrrCSh0EguLDKia
 xTKKxASJFXsPZZmF0e69EQUEtBTxPvnNDHEy8wW76wj3Hlfv13BlYyGS5J5N5quY8/Un
 4oPdmgwRv6JPbZWxLlNcfRF0Lq+6HAxbUcP6iZjKuYi744rsHEPeWNC1Vdd5PYrtLdVe
 05U6FfwIjda4oUgArz3bYcncqOc10xv312jJNY4CZdgncVRFsP5NWN/+WVAbr461xAY7
 0yJ7qe7VD96RJtAYqSM+CXkmd5L7/M8wnDJQepUeC3sRN1bDVxw/9ap8agSas2MkTuw2
 2O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791479061; x=1792083861;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=q/bYKfAD33Pc7+//Tf4tEpE4XctjvZAfka6zrYLc9uc=;
 b=ZxUsTNFqamnGUob3c5y8fa7fLbVHRF501P4VfEJy+8dluki22jqk/1tVTj6saoSHCr
 5nSdxCaxXFRTfwJkUx4m3aPR7VKv0gwYg+M1LW8s4bpIzcgUtT+GK1aGIxRKnvxejfkS
 8B82wO7Aq2azaToYgi9eZGBiDfR7/juXU1Jxbx/7jGBOTtFXOoL4iFfstRCHCKc01Vy3
 vi0FBnAA4J5mtiVO1/2smtDmXKg1SbKWJxb3hsKgFfg0sfiI+S+tkXRQPWbR/i35GDQ1
 XtAy466eADBFYZrJAt1bOIGn4OEVGk/R2mdgxCugfcLrNjd53WjldVARmQhzJzte6W7l
 NJ0w==
X-Forwarded-Encrypted: i=1;
 AKwUvByedIYQMC/wTvSXBZn5r/ioHRZYLHRx59Qcl0D0VlLTmmZUe8ePEw6uGbI2xtzVotbm5F2yY8crug==@nongnu.org
X-Gm-Message-State: AFq9FYJhRhQNa+dWpUmgZSHjhXbhbIv5nPN+1bY2whiExq6bU5IFihT6
 qFpLwKa5dEvSmu7K1cwxu3HVq7i0Biv67C316EVc7dAnrGM6U+6aC3fBXnW4tgECi9Di5OYbklp
 qgi95Vue8vNZhCJ4zbxuHHdOzs0ANjGA=
X-Gm-Gg: AYBFou3gc8N5TR9yEtKQGXAav4U04tKmqprTLk2bD1lKAiQNorx6O1NYGz+7BmYcOWd
 ipLNPafPKfus9jNGSPvGnD0zb98k9L8L9zuoDDT1Dz6MOm/kdJEl98GBHYihuGCT2mWMp6GhdJS
 tXmL/dCYQeth3wbcr0CYxUqNrVxHcNAQsiABHVCR3uzgnahNnDHRpOaCjrLCx9iZBPTY4tN3NWW
 nb1cMH6E6bMUYm4ANgJcdF5B07lD2+uVdWXbHJxJ4wirHrBYfACODSWpsVq9myVHy6K/BH0hkK6
 qFNn1Y1uzgClcXGeHI9d1oSzYyUrTDW8cvuwK7P5jnHmo8kfXwmxIE+ttrSRn9vGBQ==
X-Received: by 2002:aa7:c981:0:b0:6ac:8181:3194 with SMTP id
 4fb4d7f45d1cf-6b011cc194dmr1953023a12.15.1791479060747; Thu, 08 Oct 2026
 10:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-9-luoyonggang@gmail.com>
 <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
 <CAE2XoE8K+3e8h6H9NrPk1WWMmJfG807bN_Kh5qje-5pKWUUg5w@mail.gmail.com>
 <b2d89a92-0197-4873-b4ea-75bb21c0d0ae@oss.qualcomm.com>
 <asdkF80SJzF2W3sD@redhat.com>
 <CAE2XoE-Vc+CaE-3FerW3eXtTgspwxZJ6ZT0CZyg3ZYpoJ8xYXw@mail.gmail.com>
 <98644e74-9219-42f0-bcf7-8cd7f02353af@oss.qualcomm.com>
In-Reply-To: <98644e74-9219-42f0-bcf7-8cd7f02353af@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 9 Oct 2026 01:04:08 +0800
X-Gm-Features: AclHuK-toIfuEvTxSU46Bjv9lFt2gOkyCwbGKxlmQhAYL_o5vMGUzzoN9GJqqGw
Message-ID: <CAE2XoE8qSVczu5R1HTwOV+PhPo7_wWzB=KSqhJroqbgcP5GDRQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 qemu-arm@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Darren Kenny <darren.kenny@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Fri, Oct 9, 2026 at 12:01=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/8/2026 2:56 AM, Yonggang Luo wrote:
> >>> How about letting machines (and machines only first), have a new fiel=
d
> >>> 'targets', being a uint32_t mask with an array of EMU_TARGET?
> >>> machine->targets =3D EMU_TARGET_X | EMU_TARGET_Y;
> >
> > To be explicit state what, I give you a pseudo code to compute
> > machine->targets from TypeInfo::is_available(TargetInfo*)
> > let targets=3D0
> > foreach ti of TargetInfo list:
> >    if (machine::TypeImpl::is_avaible(ti))
> >          targets |=3D 1 << ti->target_arch
> >    fi
> > endif
> > So they basically have equivalent effect, and is_available will handle
> > other code-needed condition properly such as
> > CPU/AccelClass. not restrict to targets, we can also attach the
> > KConfig into TargetInfo, so is_available(TargetInfo*)
> > also works for Kconfig. that's why I insist this way, it's solved all
> > the issues around.
> >
> > so  machine->targets =3D EMU_TARGET_X | EMU_TARGET_Y; is a good idea,
> > and it can be implemented with TypeInfo::is_available(TargetInfo*)
> > without much burden. and targets can be saved into a (machine or
> > TypeImpl) for fast access when needed, we can compute it
> > when the program starts.
> >
>
> In what we described, there is no need to keep any kind of callback,
> targets field is sufficient to filter any type declaratively.
>
> For the KConfig related types, I would really be keen to leave that
> available for now, and add a proper error message later.

Thanks, much clearer now, I was working for full KConfig related types supp=
ort
because I am trying to keep qemu-system-$arch to be a symlink to qemu-syste=
m
which will still work without breaking anything. If we do not keep this the=
n
I machine::targets or TypeInfo::targets would be the best solution, I think
TypeInfo::targets is better, and copy it into TypeImpl::targets. and give a=
 API
to retrieve it, for example:
uint64_t *object_class_get_targets(ObjectClass *klass);

Add "targets" struct members as TypeInfo::targets and TypeImpl::targets, an=
d
copy from TypeInfo into TypeImpl for later access with
object_class_get_targets
Then we can use it for filtering machines and cpus without burden.

How to dealt with
https://lore.kernel.org/qemu-devel/20261007-rv-dedup-v2-6-8a2f0f296a7f@rev.=
ng/

It's using is_available.

Maybe all using the way like
Subject: [PATCH v2 07/18] target/riscv: Runtime register MAX and BARE CPUs
https://lore.kernel.org/qemu-devel/20261007-rv-dedup-v2-7-8a2f0f296a7f@rev.=
ng/
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

