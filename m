Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ECBD29C24
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 13:02:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhot8-0002Ik-72; Mon, 19 Jan 2026 08:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vhosV-0001sB-99
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 08:01:07 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vhosQ-0001ij-6I
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 08:01:07 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-78fc3572431so44533167b3.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 05:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768827660; cv=none;
 d=google.com; s=arc-20240605;
 b=J0i29dQ7tkgyZxLWNgeAw4pG6CKYVpToW5F6I+0U64X3AY3sn6kql7PJFIBgSGHfrL
 1I/BLMa3QI6gImTWPLw4eDM4iWPJxoKl7MjbYOEkkKRurjJlbhDS86qj3z2SUryAcSJt
 +Fqj7Tno8nJAGPtms1NLOBH8FgJREdNDVJCsRulwENOXz6VJnYUjI9AaRyNpgbRReHXS
 kPu4ZfrIo/VdAfCm+qnSbRbMOrwxk+hN0hPJVWZZdwR+7D3t+g4wi+KpCJxWyLwHi1bs
 u5nk3MhwQLKtLCxJAdhXJ8qvvS+SV/pphea0UQ8sHFmps9u+c3FtPiE83pPzR+NCrNX1
 IBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TPQi86pLnYRCGvJvueNn+Jvwj1U84ceP69XmscXfzew=;
 fh=J9RAhOUttRZ4KFCONspCf84TsCvMpep4rgaSLCRKMnk=;
 b=UpmpzoJ6cxaCKkFBjO+Sb5mCF1monKUqD/iNL7cN3C0tjoqP9MzNFgyB5Cr6cC0tJQ
 f+VxPy1ehizVf45XrTwCVmqUbT28GJ1Zl/29PmAdo0dU9pYzuWBbLx+zfa4ApQAok6hw
 XCtiJCkBdMtCC2BEnYZEx7vj45ygM40YpXXEmb+5E+JtQKJTgUPZs0OMnXHrKdokTou9
 OQkW6QBgP1Az6lZKsC6PY4l8kQMJ/pYGYNeotOWDUmBI5qpVv30n4yevVP17NEA9bqVc
 w6ug0gVoRkV9s4ISR+FMKXMAaTIb9TAkI29yiTGkK7BUMaQWfxnUEm5QTwg7mFVqIrI4
 jtug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768827660; x=1769432460; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPQi86pLnYRCGvJvueNn+Jvwj1U84ceP69XmscXfzew=;
 b=FZsVofjHz1YMa4GTgYidR6L4l7HpywpTxG1PzH3DjGwsDTycastp2R5WmiQQbqQUfp
 YTtlXFdjh8y68AhdGNaWv1V0Xrqq2Po5T41v/BKVdNrJrrDT0Qkyzk1MNQi+cIh++B3I
 6wD4FiuxFsrup80kadrGiGYI5MwQpzyfiz0JEZiKiedBx9grqh31lYjtkIqNRDTFI80g
 GtX69vzDDoCFH3QqukjB6mC9UkBQ+1VVO/hsmV6ZXatrznGPuSJIONJ1kBWOfreLY0m0
 cyL5mGiYnYY+ROybhv6UP4cS9C/0qPuHHL/QGHqMvr1lc3X5qKPUg68NDLAgq9V4lmys
 NTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768827660; x=1769432460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TPQi86pLnYRCGvJvueNn+Jvwj1U84ceP69XmscXfzew=;
 b=LXrpoHnzGKvDFUYcHVbaFRTMWImp6SDFtaj62VtfnHuAQQosijbg9Fq/B3KnjYHShk
 YBbg7T4Vm9PiJPfrDVJ3gjaUJMDh1JXRJPh3Hyw7dPq6wx76ISB31VJoIFj3sQlOXs21
 K0nJOri8fLdz/oUJ0bFoeDGg47dGMvQZXelJV/Kg60rwTtpv7v2u0yzVMfmHZN/1TtVZ
 nSWHbcaHKW6BFPg57TmYUnA0FjWJtw9yv97Y9kDvR4AocaR3/zVpT04fypeEBsBjNN+h
 Xwz1GQj8JG4bv68LgZ1UkAxWG0AM3dR/0kIagqHj7w1mWwu0HqPBzJWmdX0Q5mXq6JHp
 IM6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGbEWIWYit1hbb7yUBabeF0G35nAhqlDbf0ymmqmS0ujeVBDtBV9+4wslQdKqFzEXBTF/WU5Zg2A==@nongnu.org
X-Gm-Message-State: AOJu0YxTYxGouUgIwY4MReTyCNqy6LkEWlQpszvSgNvrKMIUYDWXcGCC
 eB5ux13cbpJNUd0/Bx+2zOdrOZ+y8HsHCmqly5HgKKNqdBTI5sWLiQ7ijkF6VY5UoHXpXs6rdl2
 D8Xqktkdv9zWWV7oWHN7lfYYr4qOOclA8CC5aEM+AIg==
X-Gm-Gg: AZuq6aIykwAEqMleMrGMOOu7DXiwYzS6WJyv/MXtb5uREqRoles5JfdSCDH7TV3xpmv
 0XfJBEHIKs0/I4Sb7C9oDaQ/+Z1fDJHcRGBVQr5Trtzce4wIExaKPaA93WOgZsqfYElwFm/S5sE
 7Iz+9/zeY4rRtSIJ8cVUMEgZsyuEIlM/k97xwhC8wGw+Ah11q2RHguoSrS3Zp2hOrid+YgSfFmD
 QwpReYh97Vawf/j9gY5TNrDYnWGCHOJVvWwnuE0EWmiPuoBgDMsnbw0dHt78Bi4ILTl+fFd1fmU
 Lzhz
X-Received: by 2002:a05:690c:12:b0:785:fe77:ccce with SMTP id
 00721157ae682-793c544d54cmr89607217b3.44.1768827659942; Mon, 19 Jan 2026
 05:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-52-philmd@linaro.org>
 <cd27bf13-a8ef-4b7a-bfea-0e4220091ec1@linaro.org>
 <8af2b03c-6fc3-48c6-a307-7d49d38532b4@linaro.org>
 <6b934c5a-bfbc-4877-8e53-b7e89db1531b@linaro.org>
In-Reply-To: <6b934c5a-bfbc-4877-8e53-b7e89db1531b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jan 2026 13:00:47 +0000
X-Gm-Features: AZwV_QguP00tnkyjRD6H94znLrQCE0jUQ2AOx2kWebFzmEBuRaJEAGHFMdeGyfU
Message-ID: <CAFEAcA9RnVqWfgm_jhevoFE0Z9E825=7JFZVNNnfnJeCKd0LJg@mail.gmail.com>
Subject: Re: [PATCH v3 51/59] hw/arm/virt: Warn when HVF doesn't report IPA
 bit length
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 19 Jan 2026 at 12:13, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 18/1/26 23:03, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 28/10/25 13:07, Richard Henderson wrote:
> >> On 10/28/25 06:42, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Emit a warning when HVF doesn't return the IPA bit length
> >>> and return -1 as "this accelerator is not usable", allowing
> >>> QEMU to try with the next one (when using '-accel hvf:tcg').
> >>>
> >>> Reported-by: Ivan Krasilnikov
> >>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2981
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>> ---
> >>>   hw/arm/virt.c | 8 ++++++--
> >>>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>> index 175023897a7..1d65fa471dc 100644
> >>> --- a/hw/arm/virt.c
> >>> +++ b/hw/arm/virt.c
> >>> @@ -3225,8 +3225,12 @@ static int
> >>> virt_hvf_get_physical_address_range(MachineState *ms)
> >>>   {
> >>>       VirtMachineState *vms =3D VIRT_MACHINE(ms);
> >>> -    int default_ipa_size =3D hvf_arm_get_default_ipa_bit_size();
> >>> -    int max_ipa_size =3D hvf_arm_get_max_ipa_bit_size();
> >>> +    uint32_t default_ipa_size =3D hvf_arm_get_default_ipa_bit_size()=
;
> >>> +    uint32_t max_ipa_size =3D hvf_arm_get_max_ipa_bit_size();
> >>> +    if (!default_ipa_size || !max_ipa_size) {
> >>> +        warn_report("HVF didn't report IPA bit length");
> >>> +        return -1;
> >>> +    }
> >>
> >> I suppose this goes back to the previous patch.
> >> It might have been slightly less confusing to merge them, but the
> >> underlying questions about when and how this can fail remain.
> >
> > Right. I'm dropping this patch.
>
> BTW I was looking at the extra-commits in GetUTM and noticed one
> related to this:

IIRC, the failure in the associated gitlab issue is because
in hvf_accel_init() the very first thing we try to do with HVF
is "find out the IPA range", so we can create the VM.
So any kind of "HVF doesn't exist/is not usable" problem manifests
as "this call to try to get the IPA bit size returned an error".
So we either need to have hvf_accel_init() determine "HVF
is basically working" as the first thing it does so that we
can know that failures in this function really are specific
to the IPA range check, or else have the error be propagated
back from getting the IPA range so we can do something sensible
in hvf_accel_init().

(I haven't looked at the rest of this series, so maybe it
already does something like that.)

thanks
-- PMM

