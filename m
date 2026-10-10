Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65EECA6017
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 08:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFSpV-0004v3-KT; Sat, 10 Oct 2026 04:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFSpU-0004um-4d
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 04:53:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xFSpS-0002GT-GN
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 04:53:19 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c31745ad205so409260266b.0
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 01:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791622397; cv=none;
 d=google.com; s=arc-20260327;
 b=f/1Hxff5bAETuBEQicwGG9OlPBMRmA+xZmguvG0Xx+1FMA/DgL/Vzw4kEeNEUhFW0g
 tFAs8boAmAKnINpQ0crIDpQ5aaH9vHgUBJce7nbmOp8cOa+TwlaSzmYlXDkbZZkW8pND
 /epTUx/kaPVGiioXzI4oZ0lPPvwPIdF0xvz5afet6tGOzQZs33WtbnPQWdLi53QY3Mj7
 Pw4xUpe1I2f71xFEtzHcZjY5ZNWzxCQTN79f9KtpbE+27mf5E6BUNEiCeJLgPVyZ4hoh
 MKSNQG3lJCuRSBi7HxQLczoFafIZL73WdSAt4pAKCpXTnlMTaLENigNLevtCLgxF0MzN
 Krpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=WK1Rps2yQvRTxn53KhTV+hWiBoMWSl797Qgk/KbZt+A=;
 fh=KMDTWaVwbLYe/MEE3uZ6Pk/u2+dSBgrqV3u5a7SE7a4=;
 b=NducxuI4CVes4hCyG1vrxxbUasVf1q/kBn31YLH45KzkgwOJ0DMa3V8Ln8VWu1zBKi
 J6S0qQi1TZCaYOpigfW+MGi99cT8e1T5Y7m0cm3uoLjPm7LoVI5OJIDe5iB6zooMI4kO
 52s80uqyJdpHHa8e8zNt33Y3zZZvcTvmmOGr7EMlB0NLm2tJ6+j5l6/vSmir7QISM9z4
 ODA02ncBR0y1YUk+Ce1RXHhOMdkFyAgzHulXnlh9VD8q7N43N5yuNG3ISpKaS7dw4M+P
 veJNELvbjhQJKKoQEV+r0J0KeXwZ0V+OeSA/zNji2VuuAYLqKkSdP/7SGMGHacDcdzpu
 72YQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791622397; x=1792227197; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WK1Rps2yQvRTxn53KhTV+hWiBoMWSl797Qgk/KbZt+A=;
 b=UOmGmVjBGeJgrfppulbogZjjkCeL1qeOxflZbsHozNbznzfgOf87kJ3NmrEjHEPb4B
 nbzC447V2HtQlYWfLoRbd1Ykd8k0zwAEqYj38+19ZG2KtBQ8jWIvMlJBDz3rQITCLjuq
 EmtZ3MvHpXf7lUZnwx1igNOa6lYsCZyKmhUmeZ0QLZrm89cg4LyIS0I9WE9GnTdFiyKA
 nIcFUXG+bxp8se19f+GxeNmlkQcNYXF7+6oaxOulKgvm037ssCqhj9Mdb706SHCLBQXr
 bphQEWBYpWPcPetxy+rAXB0Xyua77c4gt7Aru5xxIl+n6UkjMXIzjmyhp5IKa94WP9iI
 LpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791622397; x=1792227197;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WK1Rps2yQvRTxn53KhTV+hWiBoMWSl797Qgk/KbZt+A=;
 b=GLNLwILmB32Stxrtk345otx4xmyaAYwMdRx1uO2LiMx73A9dYeyywRyWovdAWDsR76
 syGu/MevupQ5nClupLPEj+DPM7H12IMG4lHeg9ZjG4iS/lHL6bmy+L9RHP8CKpnVI45+
 eLxz6XDohtm6AVbs1O5vyOxcHjo2FqM71GaNwSX5XYgjGi/J6j8+GwWyjCl/Blh6oqQG
 xB7fsZcXP07mqH9YSL2H+JyM4KMi3091eu1XYDAs4E1kOlW5mWOeunoNAQld2tEeDwvA
 mDCv9cXJB3YwV95WhQJDlCvCOimtMHYL4WUoAo4kUn+al5Vu8YNjVetYSHphJYe7yLla
 EiRA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzS7k+UVoIFBRFoeSEzXmlTbtA8tg0VpiXeuYw4O/u1TzIWJAXyIjdYbgg5qESXK0Rzp3wsnC8KZg==@nongnu.org
X-Gm-Message-State: AFq9FYISlEHL49YZXkFMzEHWwYTL6MsOS7xjlC99bjd6V7wOxHWz1PaH
 czTZfZfHrMRme+DC0XCjlCRvF44YMorReDOUlECQeBZIYSZFAi08ZMq4wv7D5Hemh3O8xZ9Mr15
 KLBx1w2t9HaS+q92zPFT0dLyw7/+kzwM=
X-Gm-Gg: AYBFou19jOo+v60p7TIemjxN8kP82lS8fBhPdWNHF6341Er/WDRD+F49/7jvqIvqWs8
 1FTTRUnLlJWLhIj6IU5TTO6njejujQ9ExsQDG3MgbIf8OgFMwMGgM+7vSjocelYrQelFdsOd1kb
 5bjkkp4yJ0EYA7tXi5zk7rXQ2C4ovrjJIQX8mgRyXhEDK6lqSiaNtcGLil2iLVlBSgOFtPlk4Dz
 79/a7Q/ZnhF1dobWCwrz3HWPhkSDUOXMe8T1itRgMPLvXBN3EsFR4GZkJCTSiR/1uVU3lbMmdhR
 gAAbYOmcwBUO2cDZ3+ItwSYvJB2BEIxbD1zwstOxBLr/9gqHDbbm6U8=
X-Received: by 2002:a17:907:3f10:b0:c2e:204d:9490 with SMTP id
 a640c23a62f3a-c31a704c117mr486284466b.17.1791622396469; Sat, 10 Oct 2026
 01:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260930073935.712-1-luoyonggang@gmail.com>
 <20260930073935.712-5-luoyonggang@gmail.com>
 <374ba010-b530-4310-b20f-65ada56cda6b@oss.qualcomm.com>
 <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
In-Reply-To: <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 10 Oct 2026 16:53:03 +0800
X-Gm-Features: AclHuK-mGE5Tz1NdZxyasvNIzxWLi83QMEQdr3i_f1dXs3mg-q_5HqkgS36z4O8
Message-ID: <CAE2XoE97kuRkF4i2+t=tH0d0dXWjCaNmUjUaVZDPekWimSN3gw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x632.google.com
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

On Sat, Oct 10, 2026 at 3:45=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/1/26 18:51, Pierrick Bouvier wrote:
> > On 9/30/2026 12:39 AM, Yonggang Luo wrote:
> >> Use target-specific assembler names and helper metadata for TCG helper=
s
> >> when multiple targets share a binary. The generated prototype maps the
> >> generic C helper name to a target-specific linker symbol, for example:
> >>
> >>      helper_raise_exception
> >>          __asm__("helper_i386_raise_exception")
> >>
> >> This lets target helper definitions keep generic C names while avoidin=
g
> >> linker symbol collisions between targets.
> >>
> > Hi Richard, do you have an opinion on this patch?
> >
> > We are trying to see if we do renaming per helper, or if we introduce a
> > "generic" way to deal with it. I don't have a strong opinion, renaming
> > things or adding more macros and build system soup are both ok on my
> > side, so direction would depend on your culinary taste.
> I think the general direction is good.  Perhaps the specifics need
> adjustment.  In particular, using __asm__ to rename symbols is suspect
> and likely non-portable to non-ELF hosts like Darwin and Windows.

I have already tested on windows, only not sure about Darwin, let's me
create a test on Darwin,
because I do not have a CI for Darwin to test it.

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

