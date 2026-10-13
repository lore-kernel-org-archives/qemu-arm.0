Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B59CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 13:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGcXT-0006Vx-TA; Tue, 13 Oct 2026 09:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGcWV-0003vw-Qh
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 09:26:38 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGcWU-00054z-4f
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 09:26:31 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8aca68653e3so6443907b3.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 06:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791897989; cv=none;
 d=google.com; s=arc-20260327;
 b=FLpDLchCgofdOM56W59Yup99gYe8RRRJbKtQINTWu7Q/6Jtxa6oQ2s72kBV03dg5pd
 NDAsGBhXVk40+dzdEmZBs1jFLV9KZD4NF7Vcn1vw/PiFJf/URzY6jBZ6k/pq+K8Mgddl
 aaXIQhcxRmWGFgjr2R6Hs/E4aoY/1SonE30DnHLrdAhH3wJDpaTCkZ2uhkd0p/mHzB6G
 i80OipmWf8MAq6HUdicJMEEvpUHsw03byTRJ/ew8iI3EuKUFE4bwtmT118SW8WQ3GtFv
 iL4qYZlQWfRQxWIUgusFWKoCpQruO6sMilldb7BU9XbtAa0O2YlEurMI3oyVuOqdOQWU
 lX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BxjKlSnFW7VCYLeeGqCDT1nwAnPJiESgUTFF/yby+lk=;
 fh=f9Sp/XR7QoEeeZZPZULFYV+F0ntZsidHpdutYRHJ4ok=;
 b=Mdiib9zkjtMm8WQGVNXNFStqH15oihWSPkW3HXlsCQOo0lD5jerNhc5VZT6PBIhfy8
 zcsMZ7irrpoxXOJz4gq9R2jxEVvBHk1gciZ1xXFtGtdEVhqKSI0eX8ZACoNSxiZh8Tdq
 URYBB3Q43EY8fQhdDm2/1HAyTB0LTN/gNODhKyjwoz1MmbmrVHXW+w1qs2A9mZFbS5Hv
 azDh6Zqk+99VH7zkZzSpNc1oWIllmN1H6KwB3R1YDk9T++mO1Fo2ZHAYlxEffhIqxfbl
 xujOE4r0neIN0W2ZNZCJltwcL5K1/Pcn4OaJ/crip3lwxex9/XVXyVVaX3EsP04sjp0q
 YSQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791897989; x=1792502789; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BxjKlSnFW7VCYLeeGqCDT1nwAnPJiESgUTFF/yby+lk=;
 b=cmqnZ0Twj3kWq9IHV4tzxfc+YO5KlyAbhBK50sVqEcxoN0rkOw98s7BC5au6iDSPqV
 pOQ8CY2lyitKPus/xtyfrqvwJuSyJnOZhU2BrlIVubDlLxHlHvpM/7DaZ3MCHwWbT1Aa
 VBtX93xcDJINt8jmj1cx4786aPmOwA3bDKuvd4+s/+zQHy/dhgZHqiCyOMPOqYIGBJBt
 3LYbefBBxM9vq2DA4BuuoSjW82O/dTst7YecJV6nejTDDy3AI3ORnllbMzcrKd8lrD7J
 iQYF2ZbiglUdsgmgW36RdBmewJIPiDVp1wlD7HTlyALFA5xi6NN0Z3ul9w8M4KLZnm/8
 rUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791897989; x=1792502789;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BxjKlSnFW7VCYLeeGqCDT1nwAnPJiESgUTFF/yby+lk=;
 b=lOQHCsoQpO/cNAGMlSiLR/cyyNFzwt8da6ImKfZGVOo74cWuR73WGRaMiLdw/oG+h4
 BlJRqb6DrBbfxSwyPMk9X14J/SBzE6+ds8o3IyZMexaB9Wkby+ejh030F6Vs/LJDnd+H
 UmIrq3QempDAqnZ3rjophrb85a/104hZ7TicNnUtlJtJ3/cMpFwTTckXE+2KxfWkwvfA
 TMcNYZIcMw9mYCxaJz+f2TAaUr7AQ5rmUdyElppb8elFSU3RWQAusBgXb3ps9QJ4YefN
 lR41gD0rfO+tLEshuWi3diIgpKM0U9OcwpILYeMtpKrH8E6g5174H9KkymQ1MAfsQEhA
 nBhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQ1GkoiwuScyiw9lB9ZaVQTwcAUjfNxSq1IoNnod63eXKcXG4c7tgSelJDg55GYpQO+j702RsSHQ==@nongnu.org
X-Gm-Message-State: AFq9FYI3J/mlCYTASzOILj5klk3a//86RGCr7zRqAA955Pb3e/RkMnYI
 mV+PpbYLC23Hd/c7RroAx6f3QawRGTOIW1iTrT904FLXVJgzuo3QVByeGvEYEHI2ZjguV7iD11n
 ZbY1BVpaPjssK2oIAdGeEvFjuw/qVcyPCbz4zpx20nA==
X-Gm-Gg: AYBFou2ZVZnFot5+QvmEAirGRpJQpXX5bk5mXl4+fM2TNXVCa8siYd2n3DoF4Ed4Tqk
 SQRqz3ndeirAGFWfkSkf1Or1ArxlSrT8jr9kafeH+gTyUnQ880qzWSz76h0qRUBpoJgZcr+wJui
 qrcMy54JBwRk42/WwDnI1l4aRLCOGm+PFKomZlYGh46vsoyPbHTcjD5Loer8QUrEzi2HhU+65nC
 hycmGB2b3BADElCm8AR8CPpWMx0U5tOYIMjQY+foDsQlYFP2MiMQypiIr+AtBkJNus1NksGANxA
 p6dfJvFbxgPwDheqLVs4uTbFgqrXWlfVXcVL6sDwREol7PYxsmaqF94Oxku6o6n3kJP5f4gWB65
 fIr6lVqo2+CVzeCg8qqT9UjhKj+npkdhflsusBIs=
X-Received: by 2002:a05:690c:e68b:20b0:8a0:6e6a:1312 with SMTP id
 00721157ae682-8b07ee2783cmr37314737b3.29.1791897988509; Tue, 13 Oct 2026
 06:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-query-reg-v2-0-6f95a2e139a9@redhat.com>
 <20261013-query-reg-v2-4-6f95a2e139a9@redhat.com>
 <87ik36gfe6.fsf@draig.linaro.org>
 <CAJ+F1CK938-GciwPJj_KjtvKZ04fvKhi8UcSHHORmoboVURzeQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CK938-GciwPJj_KjtvKZ04fvKhi8UcSHHORmoboVURzeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 14:26:17 +0100
X-Gm-Features: AclHuK9NAF9EYHepxe0Cdi_y_NuX0msAEX4qMG1Ft9XjPqcq1h9pAGCcJ6CuGc4
Message-ID: <CAFEAcA-sKfp-1u_UaPbv=SCbDNYrdc69NZdVPT8RTTXgwXYSZQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] gdbstub: add gdb_register_internal_coprocessor()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 14:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Oct 13, 2026 at 12:51=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
> >
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
> >
> > > Add support for registering coprocessor features that are only visibl=
e
> > > to QEMU's internal APIs (HMP monitor $register expressions, plugins) =
but
> > > hidden from GDB's target description XML.
> > >
> > > When a feature is registered as internal:
> > > - It is excluded from the target.xml sent to GDB
> > > - Its XML is not served via qXfer:features:read
> > > - 'p'/'P' packets for internal register numbers return E14
> > >
> > > This is useful for exposing system registers to the HMP monitor witho=
ut
> > > affecting GDB's register namespace. Exposing aliases or synthetic
> > > registers through GDB's target description can cause problems: name
> > > collisions with GDB's pseudo-registers, independent register caching,
> > > and missing DWARF unwind rules.
> >
> > Hmm are they *that* useful for HMP then?
> >
> > The front-ends do limit what they export to gdb (see for example
> > ARM_CP_NO_GDB) generally because reading them causes side-effects. Thos=
e
> > restrictions are also a reason to limit them from the HMP interface.
>
> I am not a user, but I can imagine they are useful for developers.
>
> I would like to be able to implement "info registers" purely based on
> QMP for ex.

Yes, getting rid of the current hacks that "info registers" does will
be a very nice cleanup.

I think that the reason we get this internal-only interface is
that gdb itself sets up pseudo-registers for various things that
are nice for a human to have but are not directly exposed that
way in the XML. So for HMP we can either:
 (a) not expose that human-facing convenience at all
 (b) reimplement the equivalent of the pseudo-registers and
     aliases, to the extent that we care to do so, in a way
     that they don't appear in the XML we expose to gdb

Personally I'm sceptical of the utility of the "info registers"
interface -- if you want to see what the guest CPU is doing then
you're going to have a much better time connecting gdb to the debug
stub rather than using the extremely rudimentary monitor commands --
but "preserve the existing functionality" is a much easier path
towards getting this cleaned up than trying to get agreement that
we can drop some aspects of it, so I support doing that.

thanks
-- PMM

