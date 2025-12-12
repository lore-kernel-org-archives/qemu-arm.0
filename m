Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD9D59D84
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 18:54:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU8Hn-0001Lj-QL; Fri, 12 Dec 2025 13:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vU8Hg-0001KU-Q2
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 13:54:33 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vU8He-0004TU-Ub
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 13:54:32 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64467071f9fso1351326d50.0
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 10:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765565669; x=1766170469; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O+CePemNE3jWGGMIsI9Y95V3O90yblLERP+b2Y53g6E=;
 b=LmQ+3uB4h/bjqiXav5hT7IvPW8GPcjYdfTEjWENRTO8+8LO9sPcDTZEBAJtdY5kiRb
 75QcsDxwa1foC2FHS9CL1uF/MFAatFYCqsQB3e1Vone9e65W5CMT3GYYizHnswj3BjwI
 +VBA64wUhN4b+UaA098Z5NAnMmld/CEnIVmWVXwrcHDlCMo7mlFdVQQy/VyiLK3y32+G
 vd+nxUhvz5sNH9b910F1eaCs4E2vw0+QrdN9OcKuuLEvm5szXCIyf3YGNCXDsEXvnU1r
 L7Wp93TOGlol64oNMJ0GA81/5NU5hFNF7Fj8bpKttTWCX9lnGtiZl60XUWBS/0c79SkK
 AXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765565669; x=1766170469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+CePemNE3jWGGMIsI9Y95V3O90yblLERP+b2Y53g6E=;
 b=KcFIG3s8d+FSmIyiirtUlC6peUhsbSEAn8wdXkD3aTbn9YEKrsx0we1zhdDRrofcx7
 FCHgb7G2wtZyV81kkn+G0Dv6XFZivPRA5dquwab8TPmkvKa9HoLlHt2ZUsbZAyf+YF6Q
 tFGrIErONyGsLFqKPmq894xEdXrea1yFt33ovOn33R1DoboQwXFQ/tVf0iLTRP7ii5zH
 S4w2JcdPwyMoyg/yoWg85KsS7C0dt6Vi7lN5wCXGnzWb2mj7WptEM+YivtgnS/JX/gqS
 OxElL/mCeVrwn422rQ1lUbc4I2+yR1YJWXPzKIjirgSuLQenLIgImYEPXgVrcY2lmQCf
 ypKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfW7cnPTLfSFFD3GCgy/gj5nMuvEa0IXrlFu3VE/1hmNNIbnA6ewYYFqUukaJ+rrRf56g8+TiE7A==@nongnu.org
X-Gm-Message-State: AOJu0Yzd0G+KJhMA8RPJLSLlyYvWUhbbpPWdFNPvaNwGftZX4uixjs/a
 6nIlAT1rpMVqpoWoZzTRWTNMT2Vu2km00V29CbXRxT0hCSdY3nZ/varE1BCqTWLaq8mEyR25cSR
 KeAev10kQqjL54+O23N4N1AIIYiPu42EoLFo+UXx7kw==
X-Gm-Gg: AY/fxX7d+qNGpETW2cis8pIXUJSRB81n7cUr2Arj53tBhnUxyYWQLpslMUIJVvI75Ov
 YI/QzJmZvCWlpUDeQkD4uhtxnaA5oISmbrUWb7+A67PkH7DtfKWRWP+6EOyXqSAR5+Km0JNXoPU
 4WGaF36KrvaUD14cGt1gI5W8ft06JBOUlBQicWxLxeKGn1g31kFd1dyzcnWFB9wFajdP43I89Wy
 FojZb8y/guJJylmdqvyjjSV2VnRC+CK9PlxiLAbkBkbCDVSC6xqcXFH6pupFFX7tZh7vI5WtBWf
 Fjop
X-Google-Smtp-Source: AGHT+IEkSvc1iEpPJMUvu6u7jqvGmCh1C5Jr5vbVmARF6g7uhOKw4gcJDuKauL3nqc5GsKpitiPydq2F4rLGw4bM6T8=
X-Received: by 2002:a05:690e:4005:b0:643:2169:d6d3 with SMTP id
 956f58d0204a3-64555667860mr1918761d50.69.1765565669505; Fri, 12 Dec 2025
 10:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20251211234426.2403792-1-pierrick.bouvier@linaro.org>
 <20251211234426.2403792-3-pierrick.bouvier@linaro.org>
 <CAFEAcA-G0QchOw_zXNwUq3KAAKJZggnpeXkt7ePBAUa1SD1P2Q@mail.gmail.com>
 <1c170d41-f291-4c1c-b87e-1dba64231991@linaro.org>
In-Reply-To: <1c170d41-f291-4c1c-b87e-1dba64231991@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Dec 2025 18:54:17 +0000
X-Gm-Features: AQt7F2rK5HybqGKjXxqNnvyPnNR3w4lY-yk9DqbBKp25RfOAzJ-p9rpcB97tp10
Message-ID: <CAFEAcA-nqaFdKBTNrEpm9r7g00iN7KNb6XYP5gSr4Z2jJEWt9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm/ptw: make granule_protection_check usable
 without a cpu
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, 
 Tao Tang <tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Fri, 12 Dec 2025 at 18:09, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 12/12/25 2:35 AM, Peter Maydell wrote:
> > On Thu, 11 Dec 2025 at 23:44, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >>
> >> By removing cpu details and use a config struct, we can use the
> >> same granule_protection_check with other devices, like SMMU.
> >>
> >> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >
> > I'm not 100% sure about this approach, mainly because for SMMU
> > so far we have taken the route of having its page table
> > walk implementation be completely separate from the one in
> > the MMU, even though it's pretty similar: the spec for
> > CPU page table walk and the one for SMMU page table walk
> > are technically in different documents and don't necessarily
> > proceed 100% in sync. Still, the function is a pretty big
> > one and our other option would probably end up being
> > copy-and-paste, which isn't very attractive.

> I'm not sure from your paragraph if you are open to it or not, so it
> would help if you could be more explicit. Maybe giving a review is a way
> to say yes, but my brain firmware does not have the "indirect
> communication style" upgrade yet :).

Yes, sorry, I was too vague here. I was trying to say "this feels
perhaps a little awkward but overall I agree it's better than our other
alternatives so I'm OK with doing it this way" but I didn't put the last
part actually down in text.

> > Also, the SMMU's SMMU_ROOT_GPT_BASE_CFG does not have the GPC field
> > (it keeps its enable bit elsewhere).
> >
>
> Yes, you can see in patch attached to cover letter this was handled by
> copying this field.
> That said, I can keep a separate bool if you think it's better and
> represent better differences between cpu and smmu.

We could alternatively do the "is GPT enabled?" check at the callsites,
which then can do it using whatever the enable bit is for them. That
also gives you a convenient local scope for the config struct:

   if (gpt enabled) {
       struct ARMGranuleProtectionConfig gpc = {
           etc;
      }
      if (!arm_granule_protection_check(..)) {
         etc
     }
   }


> >> +    entry = address_space_ldq_le(config.as_secure, tableaddr, attrs, &result);
> >
> > as_secure is an odd name for the AS here, because architecturally
> > GPT walks are done to the Root physical address space. (This is
> > why in the current code we set attrs.space to ARMSS_Root and then
> > get the QEMU AddressSpace corresponding to those attrs. It happens
> > that at the moment that's the same one we use as Secure, but in
> > theory we could have 4 completely separate ones for NS, S, Root
> > and Realm.)
> >
>
> If I followed original code correctly, the call was equivalent to:
> cpu_get_address_space(env_cpu(env), ARMASIdx_S),
> because .secure was set in attrs. See details below.

The behaviour is the same, but the old code is abstracting away
"which of the AddressSpaces we have now do we want for an
ARMSS_Root access?", where the new code is not. I would
prefer it if we can keep the "how does an ARMSS_XYZ which
indicates an architectural physical address space map to a QEMU
AddressSpace pointer" hidden behind arm_addressspace() somehow.

thanks
-- PMM

