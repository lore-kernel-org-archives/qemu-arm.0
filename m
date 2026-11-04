Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D41606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A7U7l6XE
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOZRs-0007im-2h; Wed, 04 Nov 2026 06:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOZRq-0007iO-Ci
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:46:34 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOZRn-00060T-Vj
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:46:34 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso8249257b3.2
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 03:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793792790; cv=none;
 d=google.com; s=arc-20260327;
 b=CpLBNBEwdDfTVqzKRKKP6gDTJ6yRcjie3oj/mcwytK1OhcPAv8OV0+40ijn9jy+8xe
 TzHvli7Tw0nQnHsj9UUMUFbUslFVmEa5pL26vKA18UGbz/7PvCyLrpJDmYW++gSXn8IB
 LIx0ymQisrrhPSBziTP+Uil1+pFP7KFKHMsVqU9HRZSmgzm81BCqIWBun8G2rSkfXJN8
 jmhfBo9YuKqFXx51CNbSrAmCKOoXjuVmA98waC3U1IvuTpI7AE2Nx7MFk5gIQNW9DMcR
 462d+RyJY5FouWubKz8kNAcyGvGApaefjDe3aLcUbMrw2PsilzJMb8ah/zGcK40LjAMB
 L1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=P4eIlVuBHovOSrLBo7rT9t0h4KV+Iz9yeUZVpQ1InEk=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=d4wIE4JRt0kQGZWHoB5AM009e3mwUqex7Tu923+AyefhUQg6yeNVIdfBSgCOXkXFb2
 t98tEWdBFXi7xLhrhSLS0jE4oifZD4JZJoOjob6KTzYdi2dLp6Nk+mfKgQmx2ZaT1VP/
 t0lVyCzTwo9H6s+izdfs5uNsJxDL29mSehFgbjnxzBXiekFoDHs899LtB9tI79gAEWzy
 i2FyJDRPXbl9JQlApQ+0hb+Lk1GCIMoS7btis48dWkliLG3dq3iHP/6FjCwKTjDI20wq
 L6WA1Gck+2yOxoJplso0qJRdjwX0sxAzMkJoduRA11eKqXaZ5Knt3bpmtZayuQ8r2UKh
 MMDQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793792790; x=1794397590; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=P4eIlVuBHovOSrLBo7rT9t0h4KV+Iz9yeUZVpQ1InEk=;
 b=A7U7l6XEr/s5QBTs76XaVPpGjEkj5+KfGAwZ/2WvsVKMV/hP5sGSoC4Fchebm6kPps
 TiRpGk49o9xa+0OWkUYJWLJMPO1CzqM6YKSgxSYTnmnLVbfM4BIUDscdZTdmB0imlvYZ
 S3vMx6Jjx6JdHG+T1km1xnO9Lr5X9vQWHTKcFQEAeUdkz7h+hzPNVPXawiL0p+HaRkde
 rs4Df5Dw/rGqMwaLTUI7AExkR6Rtqu8yalIq0LQsOiVKzHnErsRe0TVMzevWS5h0x98W
 sCNS2TsVVmkmDoVapU00oPLCQrIATg+UEVc9Q2ZXtnh2kT9hsTjWF0MX0XnOKELWPOb1
 iBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793792790; x=1794397590;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=P4eIlVuBHovOSrLBo7rT9t0h4KV+Iz9yeUZVpQ1InEk=;
 b=fNFyBT1iclXmtbpWd3ELhqDjkruyLjczs7IyQpo9MLm0+K726sB9xhJXdJXUqvdw9L
 pRKGNmLTa2kLkFUieE8lP93Abilpl/LlGdREEwRwd+m/7p7Jowp1fKqIQRqLKn/nKO8s
 YLP4gZFSVR9bUGsvTBiuTK23Qq9fAicSmHc9NXY7m6QxBFWNjY6WVMjPnCcrVxQIZhCS
 WBSxyjcZWJWIxyJq4ohm8iv+M1UVeJpgeuohqkDecxFDCbbp3IoM1ZXdo6BBQfcw1pXU
 R3sl2iH9RXK5Dk5t2AJBHH5sGyZUXraJONgoF+TfVjE6A9hpYlfDDnOkG6E9peueUred
 7Sqw==
X-Gm-Message-State: APuU4Z8J/kEcByPKWWeVErkNa7swCzw+uW6wXLm8/XdmeUD7yD9xW2Kx
 VuOc4FsVZOf1qzU6DnlD8PPBuV8zPeb9/yod0K9qZe5NBOWmKskZDYZNRnpYUDncEYBdOvZuU1Q
 CacbaImDqi1bkWeoIqzB9Oy2kfiE+R48w2JgBliS5jA==
X-Gm-Gg: AYBFou090PYP333gq/UwNJJtLmmEweHajbSFGjw42PlvUTkkT3pHugjSf793E8fve3T
 8LG6/aIvLLzZPr6LQ0HrBFlIjBJktkM1lj2ssLbQWMoKWOz/m4zVfaX3YnIoA9ao8xpCfSV1sQu
 MuW1hrynp3+IoVUyO//ncKYhI79BnMenbi52Xz8L0Kwggs9LchbPoakkdZGiV+J3uxtEDmMRtWB
 pAdva6RjVDCNHvb9UrnAbWrcrnF0mMYsosd5B/nkkSVm/lsMQwm3vWaxSjDBj/NgufPacYIoyhz
 5BvPxEJ70DwC8edtSZSoLKGRmX/4ANoZzsKb1SK2dSyfnatv3KxggRiMmq6sdy7PVWRi8MwRwur
 KYpVroKU0PoMOiXQJZwcxzb0dGYIAwTCS/Y6MJAMBwcRfF7iLDb7Ms/LZvyKCP0Oerpnc+5pbAm
 tbbZ3XUg2bDWeUZfwj2aHJ
X-Received: by 2002:a05:690c:c504:b0:8b3:416:b198 with SMTP id
 00721157ae682-8b30416bbd2mr23959677b3.21.1793792790310; Wed, 04 Nov 2026
 03:46:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
 <20261103172616.2400758-5-peter.maydell@linaro.org>
 <CAFEAcA8X1ARhpncsz=kE2JxFjALGej4ycw3hus=m5kfcVSJXYw@mail.gmail.com>
 <50dcaa06-1f02-4662-8c4f-9ce2ab5e923a@oss.qualcomm.com>
In-Reply-To: <50dcaa06-1f02-4662-8c4f-9ce2ab5e923a@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Nov 2026 11:46:18 +0000
X-Gm-Features: AclHuK8qJ9UJJ0mrVCsU77qe1QRotl2CAl-ovmdTmEhHs0EbTGEYZUBgem4bwEs
Message-ID: <CAFEAcA823iF+bJGd64VJ8oJYsWf1tTthrifWea3ECRS4tx9cGg@mail.gmail.com>
Subject: Re: [PATCH for-11.2 4/4] hw/intc/arm_gicv5: Use correct type for
 value in lpi_cache_get_hppi()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 11:24, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 3/11/26 18:49, Peter Maydell wrote:
> > On Tue, 3 Nov 2026 at 17:26, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >>
> >> lpi_cache_get_hppi() is a function we pass to g_hash_table_foreach()
> >> to iterate over the LPI cache hashtable.  This hash table has keys
> >> which are GINT_TO_POINTER(intid) and values which hold the L2 ISTE
> >> value, allocated as "hashvalue =3D g_new(uint32_t, 1)".
> >>
> >> The function is passed the key and value as type 'gpointer' and has
> >> to cast them to the real types itself, but it incorrectly casts the
> >> value pointer to a uint64_t*.  This works on little-endian hosts
> >> (since we only read specific fields of the L2 ISTE using bitmasking),
> >> but won't work on big-endian, and trips the clang sanitizer.
> >>
> >> Fix the pointer type.
> >>
> >> Cc: qemu-stable@nongnu.org
> >> Fixes: a0562ada75e ("hw/intc/arm_gicv5: Calculate HPPI in the IRS")
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>   hw/intc/arm_gicv5.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> >> index fd6456cd8aa..a362349e5ed 100644
> >> --- a/hw/intc/arm_gicv5.c
> >> +++ b/hw/intc/arm_gicv5.c
> >> @@ -390,7 +390,7 @@ typedef struct GetHPPIUserData {
> >>   static void lpi_cache_get_hppi(gpointer key, gpointer value, gpointe=
r user_data)
> >>   {
> >>       uint64_t id =3D GPOINTER_TO_INT(key);
> >> -    uint64_t l2_iste =3D *(uint64_t *)value;
> >> +    uint64_t l2_iste =3D *(uint32_t *)value;
> >>       uint32_t prio, iaffid;
> >>       GetHPPIUserData *ud =3D user_data;
> >
> > Looking at this again we could also make the local variable
> > be uint32_t; but getting the type wrong on that doesn't matter.
>
> Should we use GUINT_TO_POINTER() when inserting in put_l2_iste()
> and recover here with GPOINTER_TO_UINT()?

You mean change the type of the hashtable value from "it's a pointer
to a uint32_t that was allocated" to "it's actually the value" ?
We could do that; we'd need to update L2_ISTE_Handle to always have
the actual l2_iste word and not the "maybe we have a pointer to it",
and put_l2_iste() would need to update the hashtable entry always
rather than only when the pending bit changes and we add/remove
an entry. But it would save us that allocate and free of a uint32_t.

The potential downside is that if we ever decided we wanted to use
the architectural IMPDEF option to put implementation-specific
metadata into the L2 ISTE we'd have to reverse that. (See spec
section 4.7.4 -- the ISTE is 4 bytes with no impdef metadata, but
if we wanted metadata then it would get bigger and no longer fit
as a GUINT_TO_POINTER().) But I don't really think it likely we'll
want to go down that route -- in the virtualization parts of the
spec there's scope and intention that the implementation puts metadata
into various in-guest-memory data structures, but for QEMU it's much
easier to put those in host memory instead,  and that's what I did.

I have a feeling that when I wrote this code I was partly under the
incorrect impression that L2_ISTE words were 64 bits (e.g. there's a
comment in get_l2_iste that mentions "the uint64_t pointed to"), and
while I fixed most of that confusion before eventually posting the
original GICv5 patchset, I left the "we have to allocate memory for
the value" part in, not noticing it wasn't really necessary any more.

For 11.2 I think we should stick with the simple fixup of the
type mixup here, though.

thanks
-- PMM

