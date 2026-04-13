Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F22AF34C4E
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 12:32:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCGSn-0006Le-UO; Mon, 13 Apr 2026 08:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wCGSm-0006LP-Op
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 08:32:24 -0400
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wCGSk-0003re-W3
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 08:32:24 -0400
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-2c156c4a9efso5888563eec.1
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 05:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776083540; cv=none;
 d=google.com; s=arc-20240605;
 b=Ms6Yb3yHo0w0h2flbh3SO+woeb1KdTgJcjtUjpCxBp0/7biFlM34uMoyufbjeVs5dq
 lxVZD/4AzUYEWWQMxGKDDwJ/jlEOl9TANWHBsTsLRgiS9A3W5ZSCmLUTuikIIEeH2/Nc
 9aWxQoblwftG6L9Vy2SZAZsbe+fSJYYAe0XD6yc8ilD/na8VZ+IPk6TzKHNTFN6Evyqy
 deHzb8lGX23RvFJye2aD11geDUYP/yMqZpU2H3wl5oKI7ffDeLxW4tAnBcokUi07WeyP
 ioxykrhAevIUeS1q95tFOckaRFR/RzJdwrh2G+fyE17jEDzabYOgE2JZItxdIUlZTv7h
 Nb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vEcNks+HUKxrZHII5FVyxP3C+7pCmo62G+orLCXpwXs=;
 fh=BZo+x2Q195RCfPbXhcCiDt0oo1w51j24Ztg/mwMyXKI=;
 b=B44/Hf1SOWohNxR8sCHfQ0yTmCLrEbrKep//NSpcm9Q7N9K6HuARjxnQwaFTVhIRDP
 73WoD2TE+NHBs2J/GKTGwMJwj+68o4pwSuXtRJ1G9bneBx+8dm4NgfE8Ow+9OOuk9/YW
 7qUFbvG7dHSDXKb+wyHqJzxBLU8lYwBXWwS3CuGMwG8AY+H1Z2J2ZkkJEW0fqwZu6Upx
 jBi+6S75Ubkl+dpXqzFjp8h/Fb6XMy+vkXv3xTO9oCKuLBfZR6/JzdX7vmUCTSkxXBZ2
 fLSeHdhOrcygcBjS/35gEF9CWs7BCim4d/fOAWeV+tR/w2pvb1a3lPmQV/X2LNJE2mqt
 /zVQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776083540; x=1776688340; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEcNks+HUKxrZHII5FVyxP3C+7pCmo62G+orLCXpwXs=;
 b=FcCB+2+FNbr2ZZTO82LM7CkgdM4x3wfUpKR4AAcePBO5t9keKt60B3SNxmAIG8/SA8
 wLbuPHUhCIZc3AHABLPJN1HoCEY3FUfYv/gUD3zllykWG8qpbogOoxlfnk1o74Pnb1Au
 NMHVSl0YwsA1U3pt4nAOwpms/tu6WtIykwnu9wZjeVOF7c2KqEYfQpxf662zeQS0gwYI
 3LQiZSgwvYXGZFwPy+V9OiBStt/n/Z4aXabsXMYVAotjFPgtO0Z4OWMOEwoQkcWA3bSc
 l8QvLK99B4ucR3Q0nh6Eo0n4vjFpNqKZcmmACzDp1qq/uvi+PT9MZFjVTu3QJVPqZDgE
 HLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776083540; x=1776688340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vEcNks+HUKxrZHII5FVyxP3C+7pCmo62G+orLCXpwXs=;
 b=jLR+Qw5Ovumh7ULwp4whKqCiO0zaCPfAB7HI+hTEuVnKnpvu/4xbpo3jbLfZyY+vvy
 wexXyUuYv+sfsG5BIJwV/Dkg5Eo6bXDypKnGBfDgU781aUwbZ3ZVEAWIjyCyrvOq7Gp8
 Nwn84tRO75SxSb/VJYOH76I+x2e0SGBOknMfp9hE/FIj8BibKrYtt+dU9HMjWIco217D
 2+LgdtQGvGHQ4VHhxE8m+JovmllVXbnfoCXuB4bd682A0ivBmFUg8pQpc5KrbQvHLkol
 BebFO3tEAD7TcBwRGuiOyM+j3/GZV4RZJFA8y8+ncgz1ZfwTNsHFCt8TWGHaIeyQRQ7i
 lD8Q==
X-Gm-Message-State: AOJu0Yyc3K+iNzeepLfmOT3apOu2xJtCfNFExzvulA2GoLJblmWaRSdl
 Sgn/Z4eeVOmuJYz/VFHeEUIXSoyJ9bd9EOpUhpsfilrEzVznxDZDzQ90cyUuU8c893s0ty4SoES
 VH46o5gW5oyD4GlLZ5gcuc7cInxyIdr8=
X-Gm-Gg: AeBDieuYu0Z+v/gTx9w/gEgIhyuo9mJnMDRygx0cMbOt2Uzrj7KZO7oJiCEQFaCRG/S
 JT0LxY4NMqKmC+MorMESmntZccHf5gh6JJ8KTAtoGKVaw3JZwAeDchRmtdQtgntE39y5SDWsqnr
 VgLtoK2dVjeyYQrjzMc+0ctBumcDhcyAsMznxjOlqmJfiRLn/JXV7y0oUQ+ugxqZDEiqbox9mdY
 OxxWlmbuK77h0YGRVie/biC8sH6HzZKEY2Kfznb5jFVyk2b+F1z2J8/W7toUCPUtdxUJ8U5WGSu
 fJ3ZEkfNGXC2HBY7CObZFdPatOlpClxycrwsWce4
X-Received: by 2002:a05:693c:25c6:b0:2d2:96e8:1bf5 with SMTP id
 5a478bee46e88-2d5871b0828mr6715756eec.3.1776083540477; Mon, 13 Apr 2026
 05:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
 <20260302092225.4088227-3-peter.maydell@linaro.org>
In-Reply-To: <20260302092225.4088227-3-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 13 Apr 2026 16:32:08 +0400
X-Gm-Features: AQROBzCVlsQ24joeED6-GoqTrUmSFdUl71JHZkM3fk7Z-kkHYQg1jxOanF6_Kjo
Message-ID: <CAJ+F1CK+_e34KDeWJ4uc2Lypo32_MFPOHMk7aAvvc5jyWxxfcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] scripts/lsan_suppressions.txt: Add more leaks
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Yodel Eldar <yodel.eldar@yodel.dev>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Peter

On Mon, Mar 2, 2026 at 1:24=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> Running "make check" with the clang leak sanitizer reveals some
> leak reports which are either not our problem or else not
> a leak which is worth our time to fix. Add some suppressions
> for these.
>
> While we're touching the file, add the usual SPDX header
> and a comment explaining how to use it.
>

Why not wire it to meson.build tests? something like this:

+lsan_suppress =3D 'LSAN_OPTIONS=3Dsuppressions=3D' + \
+                meson.project_source_root() / 'scripts/lsan_suppressions.t=
xt'
 add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: =
true,
-               env: ['RUST_BACKTRACE=3D1'])
+               env: ['RUST_BACKTRACE=3D1', lsan_suppress])
 add_test_setup('slow', exclude_suites: ['thorough'],
-               env: ['G_TEST_SLOW=3D1', 'SPEED=3Dslow', 'RUST_BACKTRACE=3D=
1'])
+               env: ['G_TEST_SLOW=3D1', 'SPEED=3Dslow',
'RUST_BACKTRACE=3D1', lsan_suppress])
 add_test_setup('thorough',
-               env: ['G_TEST_SLOW=3D1', 'SPEED=3Dthorough', 'RUST_BACKTRAC=
E=3D1'])
+               env: ['G_TEST_SLOW=3D1', 'SPEED=3Dthorough',
'RUST_BACKTRACE=3D1', lsan_suppress])

> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v2: header comment moved here from patch 1;
> dropped walk_path suppression since Fabiano has a fix for it
> ---
>  scripts/lsan_suppressions.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/scripts/lsan_suppressions.txt b/scripts/lsan_suppressions.tx=
t
> index 7d90c280d0..f88bbab18b 100644
> --- a/scripts/lsan_suppressions.txt
> +++ b/scripts/lsan_suppressions.txt
> @@ -1,5 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# This is a set of suppressions for LeakSanitizer; you can use it by set=
ting
> +#   LSAN_OPTIONS=3D"suppressions=3D/path/to/scripts/lsan_suppressions.tx=
t"
> +# when running a QEMU built with the leak-sanitizer.
> +
>  # The tcmalloc on Fedora37 confuses things
>  leak:/lib64/libtcmalloc_minimal.so.4
>
>  # libxkbcommon also leaks in qemu-keymap
>  leak:/lib64/libxkbcommon.so.0
> +
> +# g_set_user_dirs() deliberately leaks the previous cached g_get_user_*
> +# values. This is documented in upstream glib's valgrind-format
> +# suppression file:
> +# https://github.com/GNOME/glib/blob/main/tools/glib.supp
> +# This avoids false positive leak reports for the qga-ssh-test.
> +leak:g_set_user_dirs
> +
> +# qemu_irq_intercept_in is only used by the qtest harness, and
> +# its API inherently involves a leak.
> +# While we could keep track of the old IRQ data structure
> +# in order to free it, it doesn't seem very important to fix
> +# since it is only used by the qtest test harness.
> +# Just ignore the leak, at least for the moment.
> +leak:qemu_irq_intercept_in
> --
> 2.43.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

