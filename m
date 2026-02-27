Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FDEFD530A
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 19:01:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw35h-00011u-FC; Fri, 27 Feb 2026 14:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vw35g-0000zO-Hk
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 14:01:32 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vw35e-0005MO-QE
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 14:01:32 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64ca2b32f46so1817316d50.3
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 11:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772218889; cv=none;
 d=google.com; s=arc-20240605;
 b=dgfh/FHk2BsZ+td5+qW5CmeN3nDZyTApH+uxi6rH1fsOiaEFz5agqiZhHvT5ekgtIP
 sI4UlIdXunlW6mPoFsCS+lz0GeXjFAiIl2hDO0W8S2cOpYxCJigrVaYBd6kKYamGBhBm
 ugjmEwVreLgN+8uxK3VTSb1ocRI7VdQiV/g8XoMuw+KnqykynS6R30adoZ/OZ8pat+2L
 SkemI0iwyvX6L/aqLxcysE3NpxMWErUf0q4GDu62ueAG0Mn++E+8U5g3Tji7Fj2z08n5
 DVgzNebTCPXyN0YCm+2QiDI45KFu8+dZnIxiKcOkb4mY2KJeeHB68knFKsBGe4JQteX/
 +hQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SULAEUuAj73q2fCD7zwSktbXm56L8xKX3BLqNOyYMeI=;
 fh=U+7tNHDaFPWyYcN6vfXMYAsPt/D348kAsUUpYANrNSo=;
 b=G0DucjpH7n8SLgJw5clwfXt4IFCMSeUTKc7Spf8YsW/8c5XOUwRtMtz1x693KMxmnh
 6Z6LFIxhGOYMdZtNtTFSbvUR635OEn86aRq7XbmpqVndcUZhLzRPXZJ1dlwmPv51Li3x
 h4vYpQgFnK/v2qV2iuw5rX5f3bYpScIw8tYzIfkh8exnUTjE7dDMdcvGFDlJ5k5O7brG
 TqLZTzNn36kGd4J9eyE9oOrwr+QJowYKkTEUVnFfetyLkzlVW4wqboFoAaHPdUkH44Xc
 BKwQxOer+o+Bz0BX5HehZOFRX1bvehLXE/GpZvLGvZHY7fRaCyNpKnS49ZaXr4iBi4UN
 KQ3w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772218889; x=1772823689; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SULAEUuAj73q2fCD7zwSktbXm56L8xKX3BLqNOyYMeI=;
 b=yEJtBV1YJ/eb+p+wBMtlRRQ8qzVBBinzERCi51qYoBaEViW0zku3ub4gQgCp7t6iKc
 3aP3E++fi55f3F7F1uDpB2oYeMHfeewmvMNTPifhRwIwsusra1UdR2hca7ZQNZ8pqCzT
 9e+lrPJv/mqpO86nupJk8o5EsNzGMriCSvsTx/yMiYNum8wgDGq4MRbMTEZg0ztSdN/T
 V9SqGg6XOXyF3Ai4tI0EkaD0JUzeFPom/LWx2KJbNJMtTSzQsF2G1uzmNANHCs7TrMpM
 QYe9PFBsCd3+2KKcge3+IOYAnARD7zi2NqTd8hxEk3CuhrRR4jvoBju6WN8hkkhSJJgP
 41tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772218889; x=1772823689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SULAEUuAj73q2fCD7zwSktbXm56L8xKX3BLqNOyYMeI=;
 b=uy1rafH1kmiC2zAR/Mp7S8NN1xXPC38/TOkUSmbHkngptXIQcgwkxc4Qlomrjytqfu
 Pj9+vqk+gvc83vs37EOqvgfPzo/NqRszs+IxklrwaPWTphHuWAxHOoTAwEWe7zxdPi/w
 JWKtkiG1Tdo6BoPHbsUFoGohqr87sQcazX+pMFxiYPnoqK6DekwRumsxhwfgZ0O56+ju
 7zIGAoDcESJUuT3IZYghJJeTvNEe78t5XosPkR6DBlTskkkJMeMJWZl6LlB1uZOt2w4T
 BUwWvOHW4jhcuQdLNiHjH2odVN3mNv6iZCm2ka/IcJ0qN3zP7FKYfntumFxhQfGePAbk
 G8GA==
X-Gm-Message-State: AOJu0Yweac6O0BMKI2i0KUnBFUX3SMf+yc9pyAHSAmZh5CoBDWlWkS/O
 38tSZ6Oe4izofGPL/DSHgRYOhFBqkkyaSzwo27Nj8NvFOkiOO3DzEPoLQ4NjnpdAFKKIpt/88HQ
 24U2fz55U7l9bpbT62+RDFL89GyMOrMfwNq2bwUM6+w==
X-Gm-Gg: ATEYQzweHCS/hytVA6D0SR0QQ+TY85koWN4nFgJXx7z6Qtumql2pMFwwLCM0+ybAJoD
 bRboL8szFJL/o+P0ayow3mo2/Kw7rAy4RNth1wlNxmesyPxm8v5gk49fZaY7X7bIS3dx1I1OCMC
 IS7ICUpIEUx4/dIxQ1jR4YWJTsiV2xqQfWvXJNLyfiB/2Dm/oDSgmXTwzG+Qwb1l1BKm1M/s0Zi
 /WzReda8lswWmJ6VBdP3VuZnLEPyvHXyd5gfxKuml92faMohTfVRt3khFcGGyAemwe7a18BtHSG
 zphrBi1+AI5r7qkDADG73yZ9TMMYjQ/PGswL3sdJsyKGTIQf86QUqYkkzyDkRhZb3A8=
X-Received: by 2002:a05:690e:16dc:b0:644:60d9:7514 with SMTP id
 956f58d0204a3-64cc233f94cmr2441738d50.88.1772218889291; Fri, 27 Feb 2026
 11:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20260227135736.2280161-1-peter.maydell@linaro.org>
 <87ldge5899.fsf@suse.de>
In-Reply-To: <87ldge5899.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Feb 2026 19:01:17 +0000
X-Gm-Features: AaiRm53LJYTqOvy_kESUmBEk5XK9GeB5E8Kq-3_IM14Xi_92bEfRkcVdfs__3lw
Message-ID: <CAFEAcA-xvHDyE+gJ6KKv=rkEbiTbdtmAreLNKsGTuvvZyZyYDA@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm: Fix some memory leaks
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Fri, 27 Feb 2026 at 18:52, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > This patchset fixes a couple of minor memory leaks I found by running
> > "make check" for the arm targets with the clang leak sanitizer enabled.
> >
> > The first two patches are necessary because there are a few leaks
> > that are either not interesting to fix or which are not in our code,
> > and which otherwise clutter up the logs with failure messages.
> > We have a suppressions-file already, but it's in the scripts/oss-fuzz
> > subdirectory, so I move it out as it's more widely useful than that,
> > and add some more suppression lines to it.
> >
> > Patches 3 and 4 are the actual leak fixes, which are straightforward.
> >
> > This gets me what would be a clean run, except that there's something
> > wrong with the refcounting of qio channel objects in the chardev code,
> > which results in variously use-after-free, leak, or assertion failures
> > when running the vhost-user tests in qos-test. I'm still looking at
> > those, but in the meantime posting this series gives me something to
> > point at as part of the repro instructions for those errors.
> >
>
> Looks like something I worked on in the past. It seems this fell through
> the cracks:
>
> https://lore.kernel.org/r/20250515222014.4161-1-farosas@suse.de

Yeah, that looks very familiar. The way it only reproduces in
a loaded system is fantastically annoying -- it relatively
reliably falls over in a full "make -j20 check" run for me
but I had massive trouble trying to get anything to reliably
repro in a useful way...

The vhost-user-test also seems to be doing some odd things itself:
for instance the wait_for_fds() function assumes there is RAM at
0x0, but we run the test on the arm virt board where RAM doesn't
start at that address. Presumably we should either make the test
handle that or else restrict it to not run on boards where it
will never work.

I'll have a go with your patches and see if I still see issues.

-- PMM

