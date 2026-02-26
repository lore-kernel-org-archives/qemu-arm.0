Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28543FC5926
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 10:49:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvYvH-00027M-AP; Thu, 26 Feb 2026 05:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYvF-00026U-79
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:48:46 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYvD-00007l-MU
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:48:44 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-798374d0f44so26690587b3.0
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 02:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772102922; cv=none;
 d=google.com; s=arc-20240605;
 b=PcdlpDyETCEboOdSil6McjU8QKSyjd8vd6uIcLPhGriWGaQrGsNl82ObPxVumM3R+G
 sPclEfbNv6sXPCROFTAYHGh5awKKX/AlYcX2m5pAw/08iQHrroeB2MFWsJ+ejgp1sdEL
 ONnBB/nN8sv8mS64mvdzU9I2pdObcr7iPRxro6wRKvQQhTjLl+2UwBbJFJLvTHuswEgh
 66uRwmUl/+zcF37DFS5nmxsDEKEM/dlzEniErYg+wXfGWLJ3pjO4LTDwRxnTz9ecUVdi
 Itk78HhdJDxVDepif7ge819bY5fmGjcig0R5SDMD8RkdCPKonu9V5XKuHIJZafmlwyRI
 JmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=g2ltcvxTAmF77I1gesFS7URxAh0g7MseFZN4w+qgzbg=;
 fh=u8Pi+ifT2NhAwUJwN4yx1qvt6h2u2DnHie4U1yu7tcM=;
 b=lv3Iy5o4qI6Nyp54RNmgY3KAsRAafprkepMgo6tvJdaUJmEVAxyH84bnO3RfhpnUru
 c6Y/a5UEw6D2nv6Y7mEmSReEoVrfI6KSWh5hhQhHxqAqjI69Hs7IuEVvgEJIN+HzZ3C1
 sjAUI+eF3FOj3nKoMwDyu+YzM5RvFKu9BpjvSProelrjev+M+C1GtFgKFKNSjIzIHQye
 B66XqH0mvR80tx/gmerHseACpA5qDmp/im8p4T9CgvB0di/gSYLOxdHLq4SpZxjY0VE1
 chht/l29MY6Q07Zy6OWCKYK4xJeDCz8Ti3n4HlgPlJFa+jkZnbGYHHgTmRGDC++bh0V0
 3PIQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772102922; x=1772707722; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2ltcvxTAmF77I1gesFS7URxAh0g7MseFZN4w+qgzbg=;
 b=Njzgj7zb+WfDkNngT4dLf0uEoiA24Va0aDSfLMLplFD83b2omSgGzg6iGAVucxH2Ot
 FWXYyJrbkkY7ioc74zJ5QcYrv2KkfoiHpOvqVNMo6LVv2GEw4v/diw4TtQQDLi8FMhzJ
 ZXTNZg2TO9kv+b1JOjIZbQUiAnzJ0UqFhTMe/wgGNgIG5/KdpHWRIDkbiJCS2YppAoT7
 7RmNF5xvKuiVpKQwq3/tZoNN/Oo01erYemFa57GB5Jxs4i3FdwK6J8EFqIfqP15a2t6C
 z6MEGUJaYikN/KsaJ41clOT4v/pir0EYq5YLHcHvSnoNGvkTmqozhLldZOm04yH3cTe2
 WkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772102922; x=1772707722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g2ltcvxTAmF77I1gesFS7URxAh0g7MseFZN4w+qgzbg=;
 b=sYk1ur8fiVSekFqXN1Z3GcQLypEh1CMsCVQ5UwSs6JB3WOBhl6znDQq67AuoidG1m1
 q+dQ3zTFhRd4THGDoKsZdxCY51TkuXnaT5wfawy+UolceMRIg9o3LQQAejL3eM3xQ/Ar
 iCxxIzlXN2+k6uYekuijV1xAIeEzmfIwlMn/lEHQ1Y8UVGs3aj/HmLRblHMxjgeQPDin
 8w84GI005oQm0gDiiQQJ73J6oYaysAe/JEpxzyvpgeJCPR//VdJA5E3aCtd8d8DUqOVX
 K57CXN2STnwhvn8XlpDrfyM+OJ6Ev2yDSkZMUpBQfCDXYpbWcp3ZcDi0o0DwVZ4cYGrG
 QapQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ZhZmLBuxbvQ0DFMlFt2YgC4MuU+T3BTGmS2iNIBXyeJrTenIjraRgawb3k5aHF07BIq/OUIYiw==@nongnu.org
X-Gm-Message-State: AOJu0YyyLfGUNE0e8o1EcdZ+sDEHNAJg01wEnsXzIJa4Zxl2yEv3cMMX
 GfLKU7PqRqzl0SJA/Ld4Ucv8ly35zjRATYEoLCHtEB5zI+cd0i7H72Nj9wzmT4HEUvsZckmp+Ee
 K+5f6VTjXnQjQCPdUQwqezAWIkRVEh3RI/RB49kxeqznKIEJ8xJ30
X-Gm-Gg: ATEYQzyu26TQjwsG+G+1qUaM2hDruie1O7Mi1ciVdg4cJsuF4kMXedXban61Ir1iAqo
 fIr194PIciFEWvwJHm01EEfDxBaBVnMM7wH4OSf7+We9prECMAEmA5FwUreVGxVFAl5m5lsN3Rt
 hfmIS2o5Ju+EZ/i/Hry7Nn3ZVoqdajlcdkmeqf2wU1Fj9QrU0yjb2FW+sQPDnUUj0issImJEhrA
 DDe/M4nD7ed/LvUdL9QZ3Gcl9AqgKE1L0jX4l9O74Vx2//6wTfJbeGvtDA4Vo362xYQlUTDpQel
 MTklzYFVV2WmWys6343HcVhdSWdPBWoic9Ap7ThYovxAeEecq221CtLVOLoxrXrGAXDx/gQznK2
 M+w==
X-Received: by 2002:a53:d014:0:b0:646:9ddf:5f2 with SMTP id
 956f58d0204a3-64cb6f25486mr1391056d50.31.1772102922092; Thu, 26 Feb 2026
 02:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20260224154347.344219-1-alex.bennee@linaro.org>
 <20260224154347.344219-4-alex.bennee@linaro.org>
 <CAFEAcA8km4H10ZseUd=D6KWTpHQptUaL0D3dSrg3-LGWY1bcgg@mail.gmail.com>
 <87qzq7ztdv.fsf@draig.linaro.org>
In-Reply-To: <87qzq7ztdv.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 10:48:29 +0000
X-Gm-Features: AaiRm50idvpZ8JjyLmNCnolOP9F6qZU4igGPOX7Vi8CUtmePIRyXh9jCxhjWjIs
Message-ID: <CAFEAcA_zJEM7VH3U_2-FAvu=vjnwcY+qjnjzfY9UsCwwd=zqfg@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: pass rd directly to wfit helper
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Thu, 26 Feb 2026 at 10:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 24 Feb 2026 at 15:43, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> If we generate an exception for WFIT we could also fill out the rv/rn
> >> fields of the ISS. To facilitate this pass the register number
> >> directly and read the timeout value in the helper itself.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  target/arm/tcg/helper-defs.h   | 2 +-
> >>  target/arm/tcg/op_helper.c     | 4 +++-
> >>  target/arm/tcg/translate-a64.c | 2 +-
> >>  3 files changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs=
.h
> >> index 5a10a9fba3b..a9a062cf777 100644
> >> --- a/target/arm/tcg/helper-defs.h
> >> +++ b/target/arm/tcg/helper-defs.h
> >> @@ -55,7 +55,7 @@ DEF_HELPER_2(exception_pc_alignment, noreturn, env, =
vaddr)
> >>  DEF_HELPER_1(setend, void, env)
> >>  DEF_HELPER_2(wfi, void, env, i32)
> >>  DEF_HELPER_1(wfe, void, env)
> >> -DEF_HELPER_2(wfit, void, env, i64)
> >> +DEF_HELPER_FLAGS_2(wfit, TCG_CALL_NO_WG, void, env, i32)
> >
> > Why the change to NO_WG ? The code change doesn't remove any
> > writes to globals...
>
> I thought that was the right way round - it doesn't write to any
> globals, but it does read so the helper needs to ensure globals are
> synced before the callback.

The default if you use a DEF_HELPER macro that doesn't specify
flags is "reading and writing to globals is OK" (it's a zero
flags argument). So this change goes from "flags 0" to "flags NO_WG"
and doesn't make any difference to how TCG thinks of its behaviour
w.r.t. reading globals.

I think you're right that the helper doesn't need to be able to write
globals, but making a stricter promise about what the helper does is
something that's a distinct change from adding the rn info to the syndrome.

-- PMM

