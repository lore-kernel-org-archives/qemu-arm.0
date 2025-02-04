Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp251950njb;
        Tue, 4 Feb 2025 06:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIcLdytkzktofBWeZsgVvRoJBGcxiMT1KybWIBJk9D4zWLrQ+Fgsk89TRugfGhN+aXVJaEy//sXuqZ3A==@linaro.org
X-Google-Smtp-Source: AGHT+IFnrzquWXQ3HoojRkPRsSnQkXduwdELh5n+Y8wCV8kiBdR1nUFJeAxf6qMyrqH3AVCEAHJ4
X-Received: by 2002:a05:622a:19a8:b0:467:50d0:8869 with SMTP id d75a77b69052e-46fd0a204b2mr402397551cf.18.1738679866176;
        Tue, 04 Feb 2025 06:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738679866; cv=none;
        d=google.com; s=arc-20240605;
        b=iT17eK0jgVTqJlvOUc0YuvHL5xvXXsXqJb2MZ2JuonKYNIWWnM9rfgXCiHHt1H0SIW
         i9i28Vg7TukRxFCEPVJ2brPCFMOEy6Sn9dR1IIBHTQnCsIFgcCyRjZvN5CDdtRDsJfsM
         qLgiOb4sTgvDIkk4DXAjv9Pfi5wHj85VensnRjaHFjQva9qyolaGbwELkvZJgzTPvEK5
         58qUhcj37xSBBS3F7i5/I8fMfgECTW8z95hxNCueAhainZjjnvejk+RzhkP0ib5mmUEo
         siNwnhOIqJRXCyiKHeSVjqI0KCVSAgo1GPBRmKeXDZVCFeIkT6Y+GMAvpSGAOfu+I7QP
         vylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xStaCCUZvvadRvtt4KgqZgtZxDLVmqWt85RHs9AVyn0=;
        fh=AoYPdBjdZ/94IHwlZImTPyu2nJGh8nRstmzJEx4Lahw=;
        b=N52u63wBtcteRuYoqniIs/LV3yXW7Mm3kGzn5h2v7DOaXImRrSahylPpAe2BQnXdic
         ipXDE6+9iPIQT8CJByBwLdqqYmhhMXys5EeTnszXZYxBLn8w+/PHLGVFm3p6LsgREdJb
         K/KZBj4XChzEAOigrPW33xzmcyKehMds9idKqocwcpJPFANqRG+6e0VQDPG/hRlpPbZ+
         ps+MRv0m1ZsnZskitc1KTDRzIQna9QYkEMJqF8KmdT+exxdShx+HSrqTwggRDsFccFem
         ocJtL1qW4D2YcPoA11Y/j7euRtLBBodg2ZF3+N2nDXnIo2n/OWgf8X87Z2IgTu0hSYu5
         8hPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z01XCcQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bc5a4csi28270211cf.466.2025.02.04.06.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 06:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z01XCcQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfK3M-0002Z1-AS; Tue, 04 Feb 2025 09:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfK3J-0002Y3-MF
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:37:25 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfK3H-0001p1-TN
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 09:37:25 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6f6ca9a3425so38598347b3.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 06:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738679843; x=1739284643; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xStaCCUZvvadRvtt4KgqZgtZxDLVmqWt85RHs9AVyn0=;
 b=z01XCcQ11xhNfWLpefunV0JD2Z2B+Tunil1ag8XEOOd0n1yYbuYh10nCflT8E3xacm
 aMtCwbGAYEmD/jX5T6QQN1J9/0Zcl76gQ4xC6Xfj45RmD3OhdnIgxM70wO6knQQbh4TA
 cnKcDflKje/4RTilTn1WGSiRKqsOeTbQH7MX/UNxqQjFXgNCLGT3UIwEVtY5O8ndSYoo
 4VRpGmo1GAZ+k+9SC2WM30YqmHT+KE1wb7ZfJMDZYLBl+GLIypq6ec07Dmfgl3zkQI+C
 7OJRVnsRqZ9jgozrrUv5Ikq69eqT6/r1WUgi/VgxU82K2SpwReXppZsg2qkxbC0EvRqV
 qk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738679843; x=1739284643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xStaCCUZvvadRvtt4KgqZgtZxDLVmqWt85RHs9AVyn0=;
 b=ZAh6VffPP6HkrG2inpp86mVsx7dqeG3zYDaejYYblY+zieQP7NfHszhvwAF29Fz+kk
 iYIpYtUo5G6Q5JKwjUp3m+l8beMBSessWL4t8euiIu7WfY5LhxgYtAZzJIwuAUsJhfOx
 unQ01qkfJL+cLop0egy5qJBSU2to2Ph4Bt/nKQCQbn0B/2aajqmp4PW+P13mEIbUgs25
 RIYOi8MoWNfVNkFNxhUt1fPoZ+aMwIqoPTJpUZs8TE+I0CO2WRhFMdO0qQs39SrTF7HR
 LN9j/oKARt4gSJZ5M/cVGu/1FQzm/g3A8l9bI2M3FHpPyf0AcUDgVuEoP+OaSl4liqD+
 X1mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPa1mJOJfjlqV2W37w0Fc4JTN144B8MSrIJxr3r2PeLeF7/2zF4ez6o3YbPCeT8mWvELP3HnAcoA==@nongnu.org
X-Gm-Message-State: AOJu0YyVeovw+nDWpoqD4FMuAesqAsNzu0DI6IqhAroyl5B5d+gePTrD
 pqxTa1mZKgv/qQtRIpxbGh6VBgGafxaOaIp88eUyErrDl+Cp/zXEUh/erSrMqp99UhwoGDixmCa
 w+wiquAqJB4iNr7bCU/kFN1R5fkeOvuDk0PDKmQ==
X-Gm-Gg: ASbGncuxwQWqgpDYUIFXVQGAnCTqWEVk5lHTFeW4sZ07UxZUda32RQZsAx3l+btHiq7
 pCQy3yDykdS+KR4Rn++6VosRYfx4neDpgBfVKfDPv/XOck9M2OnVDaSRb8dPv+WBloIqiU0YETg
 ==
X-Received: by 2002:a05:690c:6d07:b0:6ef:7d1e:bffd with SMTP id
 00721157ae682-6f7a8424acbmr220356367b3.37.1738679842769; Tue, 04 Feb 2025
 06:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20241219061658.805-1-andrew.yuan@jaguarmicro.com>
 <CAFEAcA96ZLjOhBT9rhNhuk32ve0Qv4hUVuTTtgE=DBApbN98Pg@mail.gmail.com>
 <CAJy5ezovedShKH=HFbK9uRY44no2ijQocs29CHLt2jKoNL+Vpw@mail.gmail.com>
In-Reply-To: <CAJy5ezovedShKH=HFbK9uRY44no2ijQocs29CHLt2jKoNL+Vpw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 14:37:11 +0000
X-Gm-Features: AWEUYZmAzwjxcadMUURkTX997SIG-NIF8iCLXYs9UFr5Zjq8L2ymYEyJvDXIWxM
Message-ID: <CAFEAcA8oaRVs8USMDGHvDW82AtRZGAhRCg189hhWtmRm2Y-YaQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/net: cadence_gem: feat: add logic for the
 DISABLE_MASK bit in type2_compare_x_word_1
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: "Andrew.Yuan" <andrew.yuan@jaguarmicro.com>, philmd@linaro.org,
 alistair@alistair23.me, 
 jasowang@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9Z3bvuHopFdx

On Thu, 30 Jan 2025 at 22:31, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Mon, Jan 27, 2025 at 8:40=E2=80=AFAM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
>> On Thu, 19 Dec 2024 at 06:17, Andrew.Yuan <andrew.yuan@jaguarmicro.com> =
wrote:
>> > -            rx_cmp =3D rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
>> > -            mask =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, MASK_VAL=
UE);
>> > -            compare =3D FIELD_EX32(cr0, TYPE2_COMPARE_0_WORD_0, COMPA=
RE_VALUE);
>> > +            disable_mask =3D
>> > +                FIELD_EX32(cr1, TYPE2_COMPARE_0_WORD_1, DISABLE_MASK)=
;
>> > +            if (disable_mask) {
>> > +                /*
>> > +                 * If disable_mask is set,
>> > +                 * mask_value is used as an additional 2 byte Compare=
 Value.
>> > +                 * To simple, set mask =3D 0xFFFFFFFF, if disable_mas=
k is set.
>> > +                 */
>> > +                rx_cmp =3D ldl_le_p(rxbuf_ptr + offset);
>> > +                mask =3D 0xFFFFFFFF;
>> > +                compare =3D cr0;
>> > +            } else {
>> > +                rx_cmp =3D lduw_le_p(rxbuf_ptr + offset);
>>
>> Is the change in behaviour in the !disable_mask codepath here
>> intentional? Previously we use one byte from rxbuf_ptr[offset],
>> duplicated into both halves of rx_cmp; now we will load two
>> different bytes from rxbuf_ptr[offset] and rxbuf_ptr[offset + 1].
>>
>> If this is intended, we should say so in the commit message.
>>
>
> I agree that it should be mentioned (looks like a correct bugfix).

Thanks. I've expanded the commit message:

    hw/net/cadence_gem:  Fix the mask/compare/disable-mask logic

    Our current handling of the mask/compare logic in the Cadence
    GEM ethernet device is wrong:
     (1) we load the same byte twice from rx_buf when
         creating the compare value
     (2) we ignore the DISABLE_MASK flag

    The "Cadence IP for Gigabit Ethernet MAC Part Number: IP7014 IP Rev:
    R1p12 - Doc Rev: 1.3 User Guide" states that if the DISABLE_MASK bit
    in type2_compare_x_word_1 is set, the mask_value field in
    type2_compare_x_word_0 is used as an additional 2 byte Compare Value.

    Correct these bugs:
     * in the !disable_mask codepath, use lduw_le_p() so we
       correctly load a 16-bit value for comparison
     * in the disable_mask codepath, we load a full 4-byte value
       from rx_buf for the comparison, set the compare value to
       the whole of the cr0 register (i.e. the concatenation of
       the mask and compare fields), and set mask to 0xffffffff
       to force a 32-bit comparison

and also tweaked the comment a bit:

+                /*
+                 * If disable_mask is set, mask_value is used as an
+                 * additional 2 byte Compare Value; that is equivalent
+                 * to using the whole cr0 register as the comparison value=
.
+                 * Load 32 bits of data from rx_buf, and set mask to
+                 * all-ones so we compare all 32 bits.
+                 */

and applied this to target-arm.next.

> Other than that this patch looks good to me!

Can I call that a Reviewed-by (with the above changes)?

thanks
-- PMM
