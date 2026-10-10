Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556D7CA6017
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 09:35:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFTU1-0002fQ-6l; Sat, 10 Oct 2026 05:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFTTy-0002dH-3V
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 05:35:10 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFTTw-0005nr-6x
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 05:35:09 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6aa9164072cso753611a12.2
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 02:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791624906; cv=none;
 d=google.com; s=arc-20260327;
 b=pZozjtLs658GSvHbylcNwAkth2BR9CRbM0EjZ85EpMKwVqyN6MTD4c2Cah5htoKcbR
 Fr3lGc4QvKPfioi98Tbehjhfm1HHGsZf0SQFMtxJE9gDfGxYJervELKwN2QEXafc1SzI
 XAQDYBsC28eOCZXFN3MnymTF17oXG7yFiT1jVpJp38SU/P52PmTDk0UBPXzozSKjlcBI
 3Yfckr0W8+PJzRBxG6tP+2esulM0P3N64FUDAJUcP+2YexjLEz65Qn8pq8SjGf52Wgl5
 bGGBl9rUcbs5VpBwgjG2XhpVkUSYqaz69Lkzgypp6AnlLbM5E/u6KCsH0WDivdkDPA5/
 9/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=vxD9FfkU6Xbu8Lutb6s8Zo3WMa+ylUcN6yQWbd4+aLk=;
 fh=nkc5J0Mz/I4hUM97KW3ghHrPuq5rOvjTlIrrZdCPMwg=;
 b=AVHQandq2l1Vuhhzesw9tdOyzGWezd3lk7SqPfN38fJPll3yGqBetCKhqBW8SgKDS+
 Cy60nEqXHU+41RDIE5KBj7xAqkojQIQ7ttnhYkWZGfhZaZwQu/3mZBQqvgxwoZOTXbzM
 NER1cYSzeVSXUv9laESusSUgAXxR6dJkFZjeOIYaiaQcxXNHYYbYGAbo55stugpjW28F
 NrhY0k4r8MfFnqKqXlCqC0GHel31+EHkS3NSoWduLxgSEq6/+tioRuUjfLkMiPBKMS/3
 NYMTDKL3Os1x7vbJVE57D14VdU4k5V8KbJSkNPfYGSGH7NQ99a+2H0/VUUbGfdClwOIA
 b9FA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791624906; x=1792229706; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vxD9FfkU6Xbu8Lutb6s8Zo3WMa+ylUcN6yQWbd4+aLk=;
 b=UciSj4PJBa4Y2PqJmRbOORTcHVvHf2ARHfLMQ7pCkyN3JCcMWoegOZXc71OKWAico8
 r+pvU5nAEGsFRcK98jb+NOSZ/pM4EtdZRag+NNPQ4+z7FnZpGnikcQIY6sin0sXZVQ3B
 l9+/zTVfYLpXgi4/k1YJh7ievyniyRkdV4ByeLP7KTZLlsiXu5SSPRf5YzCxJvjTGAf7
 2IUq2cPWBKZXK0xZs+HnaForufMUcxXIStfYe98VOIHF2wtRZTL9msLCf41ktM19zMj2
 7uNCW9GUvPNHZ1/xCGTKyEdlJympjzREeVE0Wi7Gt5qQxjG4jrg3TVLbVShEoYaQf1P7
 9lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624906; x=1792229706;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vxD9FfkU6Xbu8Lutb6s8Zo3WMa+ylUcN6yQWbd4+aLk=;
 b=It4GO5mFS4ugfwkXUuWhD1PRCYaGzoPX2jzZBFESYZp7YsSdBvKRk712HjVYwovbes
 4GBUSrDDFq+0HOLkk0bw57apdy1X9OrdxI6lrFtndrGdrt1QYUGPfdCr8ffgQY/AvEu8
 Hhuj+guBJ11yM2dR+Lh5Y59bHKoHW2NNV3tkOoRLOqZW5YUeqITsR+YMRZOud+oZmIMg
 z3tKPexy0K4clLzzQaz15XPv3h9hfRO5H63gzSxE9Sb0orKk1B2C39yQjENhvtM4tqb2
 J1ROXbH0pODLLMUPOENev1nK2qGx+8RvC/VhA+sta30jErcL/QoK3fNq7ccP4QfzIJR0
 EYHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+nWrkdLMHK1kPQM/6Kw1J31NfJt6sxqSuVeV+eDL1F2OM2mmLhSnZjAvYp0WJoAOqO4iNbc8D9w==@nongnu.org
X-Gm-Message-State: AFq9FYKxwJwiaVlPoD/BPoH38DD7QlypWT0RpGyuu+KYtCP6fP3gSZK8
 EIKdSMBg+/pUCmYTbcPztBSYccqY2f/FkmTo1JARtVTHlZ+G2GLNoEPKPiM2EEbaHOfKH2OBy6c
 AXPVguGwxCPHt7xZUHgAVnQd0+g2S8f0=
X-Gm-Gg: AYBFou2ojkew86icPfPsWyXqamkCgS9DoTah3I/dggAkddIs9+nY9LD0s1hyVBvrNiD
 XBN2c1pBDLxMqH/Nj+0qM2UAuymf2PgJu9Y0eSfUgQc5OJpYbiqIxtBxbRzXhTv5zfudZ9uwl1e
 kaqA1K1GpVoaLnbbsjo2ECmz/UIqxBs4sIy4zkQv81/HC1O1syz3n7fd8HRU2QWL7F6LEsr+obE
 CK54nDdVTAjPnjNOikkoIyYToVYXbKL7pJzlvmuBBHu7eGr/kkFCEhIDv9vFuMm71Q7UIodNyWH
 L5Np5G4ROk1XF0jLjfeBBRqhg2GycycflXhU0oZyUseeGOSYkMLRNUlk
X-Received: by 2002:a05:6402:4486:b0:6ac:73f8:2e4f with SMTP id
 4fb4d7f45d1cf-6b17c268e61mr3870711a12.29.1791624905806; Sat, 10 Oct 2026
 02:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260930073935.712-1-luoyonggang@gmail.com>
 <20260930073935.712-5-luoyonggang@gmail.com>
 <374ba010-b530-4310-b20f-65ada56cda6b@oss.qualcomm.com>
 <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
 <CAE2XoE97kuRkF4i2+t=tH0d0dXWjCaNmUjUaVZDPekWimSN3gw@mail.gmail.com>
 <e87d9000-6f45-40ec-80e1-f6d0954538f0@linaro.org>
In-Reply-To: <e87d9000-6f45-40ec-80e1-f6d0954538f0@linaro.org>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 10 Oct 2026 17:34:53 +0800
X-Gm-Features: AclHuK9N5U1RFhjLm-C6KKBTbS1R7F2B0-Q6q98mriL4P9vm64FvddRiEl34D_E
Message-ID: <CAE2XoE-aV8asmUQ+FOZjHBEzf5O4uB2h=iWO-AARqpZemY3-3Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] tcg: namespace target helper symbols for combined
 builds
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 Song Gao <17746591750@163.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 Sunil V L <sunilvl@ventanamicro.com>, Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x530.google.com
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

On Sat, Oct 10, 2026 at 5:07=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/10/26 10:53, Yonggang Luo wrote:
> > On Sat, Oct 10, 2026 at 3:45=E2=80=AFPM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 10/1/26 18:51, Pierrick Bouvier wrote:
> >>> On 9/30/2026 12:39 AM, Yonggang Luo wrote:
> >>>> Use target-specific assembler names and helper metadata for TCG help=
ers
> >>>> when multiple targets share a binary. The generated prototype maps t=
he
> >>>> generic C helper name to a target-specific linker symbol, for exampl=
e:
> >>>>
> >>>>       helper_raise_exception
> >>>>           __asm__("helper_i386_raise_exception")
> >>>>
> >>>> This lets target helper definitions keep generic C names while avoid=
ing
> >>>> linker symbol collisions between targets.
> >>>>
> >>> Hi Richard, do you have an opinion on this patch?
> >>>
> >>> We are trying to see if we do renaming per helper, or if we introduce=
 a
> >>> "generic" way to deal with it. I don't have a strong opinion, renamin=
g
> >>> things or adding more macros and build system soup are both ok on my
> >>> side, so direction would depend on your culinary taste.
> >> I think the general direction is good.  Perhaps the specifics need
> >> adjustment.  In particular, using __asm__ to rename symbols is suspect
> >> and likely non-portable to non-ELF hosts like Darwin and Windows.
> >
> > I have already tested on windows, only not sure about Darwin, let's me
> > create a test on Darwin,
> > because I do not have a CI for Darwin to test it.
> In particular, I saw no use of __USER_LABEL_PREFIX__, which is required
> for portability.

What does this mean?
I am using TCG_HELPER_PREFIX to identify different base_arch
+            '-DTCG_HELPER_PREFIX=3D' + target_base_arch.to_lower()

>
>
> r~



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

