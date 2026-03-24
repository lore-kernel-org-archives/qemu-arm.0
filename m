Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32586F54AB0
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 13:28:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w51nY-0004iU-F7; Tue, 24 Mar 2026 09:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w51nA-0004WI-Qs
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:27:36 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w51n9-0001n2-8k
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:27:32 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7986e0553bdso13416617b3.2
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 06:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774358850; cv=none;
 d=google.com; s=arc-20240605;
 b=M1OnCcxXZi0MLmBSKlYs3yEPjx5p3mANl74AborRPalLCTgCLn7SE33O3zP7Hfuz7v
 NcbRHvmo4YZZO1Uiz0RAAOCKtqUHP79v2PchquMZQpIILD+J7kQquN/OBU0F7mWk7rTm
 JIyNuLom9TpDWnbdigQ+kqKjydxn2xnLwO1vYv3zx4ctE0xMdnkQAVUUc4RDeOrgmTYZ
 Bzzl/HwFJW7H+bJKX4gHwuI9079uUuwICJM2Av26i9UMgQyQ9ArjCHtliFtyCsbWAeJv
 nRymAyPIHDBopN3ocQP7y3hChjTBpM/hGbSuWrPg/NnWN85UeKer0FNbHMpzzvcboIsb
 0rWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pShKPloXeI1j6Yuqjx5wCMt8kQeJ6OpbT0kvU5q04MA=;
 fh=GbThR7VXInqOumx+ss3+o6pouLxgcp+YWUsiBqL39hs=;
 b=hIlIyKkMKwfSiVDh4Zc5XvlZIj3IbenXUsIhqvL1FA6Ldbgt6aEShGvc8KG/tMk8SY
 L3bZje0Tgh1FyObONU6SlkFtHJHZG/cN+b3ZEX70D4fisAPhdja2oebDXsbOgLGHoU9o
 mE9A0eurp5+yCMi/w+YjRYdcabEalxRe4vRfx4rg9ZfvdcDBQOABHXnY3lQ8lIhAWXwZ
 F11qs+B0mo1QmR8IQUGvyZO52rhvqJvy3Uclp8k3G4fg8mCh3OrRaGg1DUkY/BPFWYU0
 XVjHzO2McNplQ8SmvwojlSbBphRLmofFuRzqgst14n3GFUguS1VAJRPlMdeKKfCxdKnk
 ZqbQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774358850; x=1774963650; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pShKPloXeI1j6Yuqjx5wCMt8kQeJ6OpbT0kvU5q04MA=;
 b=EJxqxeCbP1Wx0/wfSyXKNKhI7dZx5x4WigllItzvAgaLN6HA3Gaz3nEO7K8UsehiyP
 PoHG+pn6S1vhZ+So7uMrCiMJtkYkkAr+RtAupD2UEDFyR6ooBAP78eE4pdNw97iVWk53
 vnfKb64bVG/expsxFIonlbi4lcYyJ8BwZl/YkKaGkuIgpBdKaIKlEnJRpl5n4hxRJfk7
 DNHMeVGlfR4cMPaEQfAL43TFntrTxE3JRn+yMANCmnJxGU6bhrMMIp3hkUJT7TXs7wD/
 BuQU4EByz0nLKie+a9VB4f0qBJPwtLlOCXj0yUbPcjAqcenM/LBzl2qi6khGoONkjGQY
 HKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774358850; x=1774963650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pShKPloXeI1j6Yuqjx5wCMt8kQeJ6OpbT0kvU5q04MA=;
 b=ron70UOjRwXetGcwojxBWVx6n2w3zo6QSTHHIP2d3kJTavVi/fGKWbuO6xho6/yXIC
 NWA+AGnio8psV4obS6Gjw8Zd/4DReURJSfdd6lKvjIo9DbLEDTO0FggQf99XcM63ugnS
 orU+QTZ4UhiZD7z7LBHId9I94663tlkdJ4SX8m280EgtlAI4vhOBpGwN2bwhqExc7f5t
 5HiB1WAyUdvhFk7bBzYbFrBOCuQFmViVCavrG2How+qzRePP0Xnv2iX0es3SM4lvbci9
 /2NM9pcG6pAfMIzmVph38hCEaEq/K06xOh1ac0UAoRtO+V/FCc552eVHpMsH3qlgv7Zi
 myCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4ht2qCIfm55U/0yMNhsFeUlWbRcIGNMUyJipAR6HsDrLeeFPuawXC4Uc0VhlKzK5pD0v7ZOJ2JA==@nongnu.org
X-Gm-Message-State: AOJu0Yyywl5v8WOZciWMDZKTSkQr10LIGql8CrYoxkHfD1JeLHuvbGlc
 zNI/MJJfPNw5QdGqBQ3fWQ9wKg3VxC4VFZcsajlBpItz/fmtI09zfIJiw95s/BTyNZMD5XxomcG
 cM3Xac94nzK3mG4o0jLn5Mmq/VtnxcMXhiOGFdjMDB3nAkqKMMMZHB6PTtQ==
X-Gm-Gg: ATEYQzy76qVYzzpuEdXDQ7dlFyRJ/C/LhgIQuccvcJIC2ADt2V18OV/dhmD0ejKg4Wz
 wwI5xMOd5DmZ0IFg8+z6J2WntoyfbfSLZqBI29CnHudmo9/tWtnTYmprk7HpV/v90iAytMET/NZ
 n74D6C5FNHUBJwuA/7jR1vs+NROL4TMQ7+AFMfRQGNDHqIuWb9ApY7w4S+b9GBqMGxfcWlNmKPh
 bd3Y8Pcp/63MBhwMzfsZyJJT8ghzRtN5xFNlcJfyRN/IroxgmiHr+QWRWT+gYHYMh96Q94on3fv
 o8O73brm35BvXFM0UP6kmizEnJBUgKqB1po/4SIBg60dF9PqY/GnFt6z6FcQstJzGYA=
X-Received: by 2002:a05:690c:6d81:b0:794:6fa2:a037 with SMTP id
 00721157ae682-79a90a92a96mr154756537b3.8.1774358850037; Tue, 24 Mar 2026
 06:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260320155107.2143191-1-alex.bennee@linaro.org>
 <20260320155107.2143191-3-alex.bennee@linaro.org>
 <f2f9f07a-4c92-4856-bcf6-7d2e0a5d43f1@tls.msk.ru>
In-Reply-To: <f2f9f07a-4c92-4856-bcf6-7d2e0a5d43f1@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2026 13:27:18 +0000
X-Gm-Features: AaiRm52qkSfz_yGX0h-JnxaoVcChCgyRd0c-gfZ4Fll-MYuDUSyigqZywfzhuRQ
Message-ID: <CAFEAcA--8-mRVdvgOzX+WEg3gXOH8Om3L8cebDRSP31G8-T=yQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] tests/tcg/multiarch/linux-test: use portable
 alternative for dirent64
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, 
 Thomas Huth <th.huth+qemu@posteo.eu>, Peter Xu <peterx@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Tue, 24 Mar 2026 at 13:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 20.03.2026 18:51, Alex Benn=C3=A9e wrote:
> > From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
> >
> > dirent64 and readdir64 are glibc-specific and not portable to other
> > C libraries such as musl. Define _FILE_OFFSET_BITS=3D64 instead, which
> > portably instructs all libc implementations to use 64-bit file offsets,
> > making readdir() and struct dirent equivalent to their 64-bit variants.
>
>
> > --- a/tests/tcg/multiarch/linux/linux-test.c
> > +++ b/tests/tcg/multiarch/linux/linux-test.c
> > @@ -16,6 +16,7 @@
> >    *  You should have received a copy of the GNU General Public License
> >    *  along with this program; if not, see <http://www.gnu.org/licenses=
/>.
> >    */
> > +#define _FILE_OFFSET_BITS 64
>
> Afiacs, qemu has always been built with file_offset_bits=3D64, one way
> or another:
>
> meson.build:
>    '-D_GNU_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_LARGEFILE_SOURCE',

Those control the compiler flags for QEMU itself. This is
a standalone test program built for the guest, and it isn't
built directly by meson.

> Now, with only 64bit host support, defining _FILE_OFFSET_BITS to 64
> makes no difference, since it is already 64 by default.

We still support 32-bit guests, though, and this is being built
for the guest architecture.

thanks
-- PMM

