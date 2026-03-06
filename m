Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013BDF01814
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:11:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyRDN-0003sx-Hu; Fri, 06 Mar 2026 04:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRDM-0003qL-CK
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:11:20 -0500
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRDK-0007zL-Rd
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:11:20 -0500
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64acd19e1dfso7684455d50.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772788278; cv=none;
 d=google.com; s=arc-20240605;
 b=c1bokTnMV4iEZVHUCIO9iRQide1673rAxxbJpcH/mP35k22q2KOE/Zm88r6kkUpulC
 ZhPAtrUjCiIVkNtZ4WK9C+9J1qPI1vFkc4dp298mmnuTiel0adn3ZwJSd1bZv32TDmbS
 /jYdeGHcyDe8I3TrSHLVcuXfmxUXUGH9OiA5D5xIhIu28t9IpOYRdfnfukz2cj6Rs+cK
 fVIFIli6JQwZE6LoxZwcFAWoa/AlHcbnNfbnv9sKgqGI97bcecYEvySWLLeKWqkpQQqm
 EeYhCTGtljzMtB+zo0Su38a/rfWggQAfsMnmMD8oqultmnbIyWw/zCafd0IKDTfMPnjj
 9Ryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qrLM5YbYYylYDyTkW1GefE7NXpG5k76cTHGUKpgdjTs=;
 fh=dssO1UcF19i8zvi+Qf8aoFDA+gyYvQHtxzse+5w83T8=;
 b=BKXHgMXFpkGj6tzzFb1iNYcIBn7TVc+is8KQqcEMNCEDonb7bfsiWZ8yCv0CxmOZ0W
 3meWT0UwQqzQQ30UN5xndzwGf5mePI0gILiMWpNlECK4+cbo8gNRqg6MZnEYe/C0+4Cb
 417gyGae9v27C3UsrOr0Yml0HtV0Xikudkii23qkvKVKLLFwwrdiGh3wS7tSwqninWtr
 BKVMtX53AdTMseViqFB5itdSQwmDORcI7BbON7qg8Ca3Q07H756b1RxnFKtoe1RwjqwR
 EkPsG0BIccOxXeJIwOWPSDUpwPouup3qkBsZDnKf69ZCnDMPCvJk56pyH9M3wUjI+jik
 9v3w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772788277; x=1773393077; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrLM5YbYYylYDyTkW1GefE7NXpG5k76cTHGUKpgdjTs=;
 b=OSH5PDABrmvYiCk2w+z1yqki5VOzTmfP4A7+HqKAM0Xj7WhfJbJZHQKI7gHmtb5efE
 sJr0xeJNv+k0K/V5k658skaZ3zip0naSId1TCpsnVYSFkaAz3QSvmtv6W9+bDXFTinQv
 +CNXisqmBXu/UKV0IfCRCCuKVgHsrGyBc9nU/1o9NzJk12nynGYca35jjydprIom36Re
 AVsGlW50926xA6znpfbNLt49wRQg53EfPE0/ugNOBMd6KwowTAwRuOX+npWrdGDs71Lp
 f3FsS04FsYhSBvAgjQEkH4dWTt1UkMyKY0q+DowZqj7eEa47ZUu0L1v+rMTIZat1We7M
 G+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772788277; x=1773393077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qrLM5YbYYylYDyTkW1GefE7NXpG5k76cTHGUKpgdjTs=;
 b=XYEBumODkNt10R/FRAY05pJRDAGmFyS8IcNNyi+A2338CPO8pwFYg8MTP/AyNyrkTc
 fc0jTMlCqp50jgKHr5pKEzgldtLb85biFLsWjtJc8Z8Az7h0JRMS254SwiO6cvFVeozK
 TShWOF+p5oSS83xbKPeJiJNeZkjjFLIhZN/+ziA62mk8UIt/wydT5XOpkBYOIwkUSF97
 TtV9xCliniDPmvklAr8xBU0FVlzY5ku0uvP2ep1Jg1N0onSEGmk+ptDaNFMmrpmjRZ+f
 YFKRo2vQ3/uh/JcNzhrkpwl026E5o+6m2lK9EzQE3B7IqLTfw83FtIYodijlOA2Dk0tE
 xGHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGlpHbg2jGbzssWzA8cyY114NmFqikQqxbXvlhlGhxD2zcygs8xec4D4Rboa61tb4mxKH7Ua0R3g==@nongnu.org
X-Gm-Message-State: AOJu0YyfbW9LBJLsk2oi+J6uxIbnJ2fNLr8Fu1lhoh4zY5jacZlMQl1R
 oKQ79rZxPlBlrVkeLtuWexiJNu51DkMAG5p7uqPUH5Nd5ayYBSzjOsffsuzJdgzwJqYyxoxvkQW
 eGH4rbmxycgicxOuW9QnToZbo1emRvRv1g3buwjfabA==
X-Gm-Gg: ATEYQzyfePVQ38ZZBLar5CaBsnBCR9NLngCFWifNhtQebijm1tN6ctMbaRowQOh14Ct
 BFZ3dUyXKztABEabI30noW+4LNuQTWuDl+F2LzchW/GSlrAodqh1PppeVHyxaFTky0mpAGSXBZf
 MNZpurEBPkp1ABfWitXtqhUCwsYVa5uZx/PnwgbSwV8pKR8Oo60viB6A+l+J3O1SPHF7T0C+HG2
 IALiPqDyWc2DAWMq0SGdcqjYijxuEYq/iV/XF05gvNwm/pmW07PeO0KWLTx34QHJC8xwNH4v8qz
 fkcoPy8n1ROB5TftnOpbKaEAZPPdbr6obRJjl6B7DeGVtThTUnWpuCjuhTaIR95KqNA=
X-Received: by 2002:a05:690e:2041:b0:64a:f1c0:65e0 with SMTP id
 956f58d0204a3-64d1438bf00mr1118067d50.76.1772788277431; Fri, 06 Mar 2026
 01:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20260306083113.74177-1-mohamed@unpredictable.fr>
 <20260306083113.74177-2-mohamed@unpredictable.fr>
 <CAFEAcA_dXMOzHuisenC+uEq5CyXBLgAjrA0SWVf8e+bmJ4Gsxw@mail.gmail.com>
In-Reply-To: <CAFEAcA_dXMOzHuisenC+uEq5CyXBLgAjrA0SWVf8e+bmJ4Gsxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:11:06 +0000
X-Gm-Features: AaiRm51DDPYdBjN5JGKsOcU5uV8wLuT-1_7XUpcnP2JKfbwX3gOYahKsAy0t_ko
Message-ID: <CAFEAcA9AQdPs0ARmyfq_8PWu5mUckFtxuj8HBU6H38CAbahKOQ@mail.gmail.com>
Subject: Re: [PATCH v14 01/19] hw/arm: virt: remove hvf_arm.h include
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Fri, 6 Mar 2026 at 09:04, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Fri, 6 Mar 2026 at 08:31, Mohamed Mediouni <mohamed@unpredictable.fr> =
wrote:
> >
> > Having that include breaks the build for Linux after inclusion of SME s=
upport.
> >
> > Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>
> Why does this break the Linux build? This is with Manos's two
> patches "hvf/arm: handle FEAT_SME2 migration" and "hvf/arm: expose FEAT_S=
ME2
> to guest if available", right? Linux builds fine for me with those.
>
> There doesn't seem to be anything in the hvf_arm.h header that would
> be a problem on systems without hvf -- there's a couple of prototype
> declarations which don't use any HVF specific types, and a block
> of code protected by "#ifdef __MAC_OS_X_VERSION_MAX_ALLOWED" which
> won't be defined on non-macos hosts.

...and 5 seconds after sending this I see the include of the
hvf_sme_stubs.h header, but that seems like it's also
self-contained. So what goes wrong?

The only thing I saw that looked like it might be a portability
issue is the "ext_vector_type(64)" attribute on the hv_sme_zt0_uchar64_t
typedef. That looks like it's a clang-specific attribute, so yes,
this is a compilation problem, but it's a "fails on gcc" issue, not
a "fails on Linux" one. I happened to have done my testing of these
patches with a Linux clang build. With GCC on Linux:

In file included from ../../target/arm/hvf_arm.h:63,
                 from ../../hw/arm/virt.c:74:
../../target/arm/hvf/hvf_sme_stubs.h:35:1: error: =E2=80=98ext_vector_type=
=E2=80=99
attribute directive ignored [-Werror=3Dattributes]
   35 | typedef __attribute__((ext_vector_type(64))) uint8_t
hv_sme_zt0_uchar64_t;
      | ^~~~~~~

Our other option for fixing this would be to either
(a) just drop the attribute -- if we're using the stubs it's because
we don't have the real type so it shouldn't matter whether we make
it match the real system typedef or not
(b) drop the attribute for not-clang, or for not-macos

thanks
-- PMM

