Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19722606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=ATNtDYL8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVVjR-0006vL-BS; Mon, 23 Nov 2026 10:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVVin-0006Ya-76
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:12:50 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVVik-0006Ok-9c
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:12:44 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-67dc7eb1442so3599167d50.0
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 07:12:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446761; cv=none;
 d=google.com; s=arc-20260327;
 b=H4e0F2GyD02/wNG9mHszUj/X0m6JUNKtMQugnzgFvhMv/yTgTyQJvMlOGoSfJQLZKy
 5qhMKZKNGZCa1xA1APXnCZ8GgFPjChocEiWiHS78flLTVfvQVxq23+IIBMNpVc1siSGA
 UU3U9UbVjbM6vTCw2y+EeRkQ8lPtl6o2tKDDZA9J5Ot6YScWTUZKFC6kOy+bs8IRsI3L
 coPbC1r+J78157Xniq9toO+zUPaGB3SSHNkre+SzAfLFJ2941FusFVIH9iGxr0EqlNNX
 ZKdPs638Tg2QIeWqstJKGgwduFAZac/hiITx54MrNHDAD8mRfB+ZPzpHoZC1w8w5nKRF
 T6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CtGjttGjiRbvno6EBHpB5Jtwc+KOTQQoZUgh/y0R2D0=;
 fh=kGi7IfDQzOzWmATfZ8vvS5IUW91FZrRDyu1M8g3lORw=;
 b=ZomVWigaH+or2hYPBoyqK8xL9/VL2KIVncEc8xwKoC8CSTTyE0AnJi+MIqnSB2VYGk
 nPz0nxalu2tCjZqz1Kl67fcXxao523uvOKzbsyvpv+tLTcFaQmVwDRkVZfgHawWLg9Jo
 87qeHhzAswaIeiGauQwu97qUn5KN2FkgTIQpBsH40MggGTR2keMjoUaGy8KftIx/qc7j
 ggt5XEbN2wGJOLU5hBIi0jZzZ4oLlekOzbBwp63KqBaq1BerLyv5aJ+eYpG3b5lih508
 1G369STNcYXf5DPiOC8R+IyIlaF8YDovfEQClwmLTxusQH7j2nHyfFf01wwiiFu5Yh8m
 fPRw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795446761; x=1796051561; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=CtGjttGjiRbvno6EBHpB5Jtwc+KOTQQoZUgh/y0R2D0=;
 b=ATNtDYL8GS9NENENeEBsz69ALVU6K/wBdL2EGcp6rw9KfFP2IWunD83UE7+Gw7tQQl
 iIdO4G4upedcSmphGZkgXk25VRJOH8w8HfWL+PkoLIYn3LDQKgKlR01PLO8LWM4Jcw9M
 7aAhC//0IRleoJVJvHGryOdXsDxOyFluyFLbCkwKirJ8S2QVHyRHewx/N94co6hrVk8X
 WWyIW0hItDBFNBPuBZ+txjJ/2k/G61qwUovNMpwdk681p0pAajvCONHgVSBK7wZXNzVD
 VkzCOMiX9iBDs90WbSSTDReGtFMsuj0Pl0qsZyclA3+X8tfildcgaJRjY13g6JadHCyg
 bkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795446761; x=1796051561;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=CtGjttGjiRbvno6EBHpB5Jtwc+KOTQQoZUgh/y0R2D0=;
 b=SXfjgtp3AiBM7tzSj4SCxlhPUlYBYwwcps53PsXEMhFvRlfouqBUlMFXEHuOOftR8E
 iCDrAnw9wT9jcrWOYtq412N2ivkSu/8w78COg/quL2dQaYfwgUIU8txRNERE9p2rcPTR
 PHoJEyVFrvA3BE8et2dbFUMlzElvdgRWGNRIaJjIbAkD9EqNSfR2otZ1Oh0khT0agmBO
 qxkW/y/dOP1JTX12gXJdR5kmECGktio5tRo/61RsJKCra0Vxx5h2zii5uXtdPgzOUZf6
 ur0OprVqJ3bhpBbFNK8czcB7gTlkLaWw2BIIoe4anWiQR/keHW90jAr+YZ7G4gRH+/ag
 0FUQ==
X-Forwarded-Encrypted: i=1;
 AL+hErE8WQ0byx2OKygg/xBbyo4asQFVHNpjlStoUvIbDxQQFAyUAhftR/kLFz7jvagxPjToGO2y4ccUSQ==@nongnu.org
X-Gm-Message-State: APuU4Z+YCkoNhrj3v2pW4N36GIYDoB8rcQQhD27Fz0niioyC03KeO/0y
 UH7L81IkB55+3NM7+XU3jqWgfu3F7opIyrM5qQATQClUms6y7+k5VL5gCyiT5dF865AYD4F///9
 YQ8syM8if1EbQXy+4TLjGx5//lKT0P+QukO5HfThdfw==
X-Gm-Gg: AZFdTZe52J0WRx2NpBy6swTxted1Y1mX4vudl0cP9UfdNe1R2Dsoc3PHVzu2V7l3EJ5
 fC2rr49r/M+3wVv6ivg1J/lNZ0EjSOiS+M7MpDI5KSsnkYBIn9L8jS8joFSf0epykmHPdy6Ciwl
 qsNAgWxlX0NMPdQw9p3BYABZnTj4j/mcDNrtRVlX35fG45oBZVeSddKSb7uENNZPAPslnWfFYNV
 QPfGyVD6GJZ/VzPMIRJ7zsia5/vwgZFquSiWsJzlUCvgGxO03Kc+P1Qq5GfQEa4o5f75xCmow7H
 d050AR56J/NlJTyhArJ/JRqQuUCfQcH0AVaDa/j6YilettlX+HQm2/Xw5bSBY0RbSnObRpsgqeL
 DHXkvYx79E4bPdoZ1eilHwN96n/oR9n0lw8rR9B8lFkbl4xzB3NJCEI/CUZ14Z85t7MXwjIVWaw
 4bhi+xkMTMWyfU3BPu7UeqEWw0cA==
X-Received: by 2002:a05:690e:810:20b0:67d:b995:a5b9 with SMTP id
 956f58d0204a3-67df442229cmr3055985d50.49.1795446760721; Mon, 23 Nov 2026
 07:12:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-m25p80_write_enable_fix-v1-0-3a2abc0072b0@oss.tenstorrent.com>
 <20261110-m25p80_write_enable_fix-v1-2-3a2abc0072b0@oss.tenstorrent.com>
 <39176a72-7756-477a-842b-e277ec07d321@kaod.org>
 <CAEev2e_SbbLENO3YhkJPtBXyd2JKZktmnxzD6UbbDyfyih6C2Q@mail.gmail.com>
 <c6bdf631-52f8-49db-b2a2-c028671a2753@kaod.org>
In-Reply-To: <c6bdf631-52f8-49db-b2a2-c028671a2753@kaod.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 23 Nov 2026 09:12:29 -0600
X-Gm-Features: Aa3M54o7RLBv5QJqjt0z2LroN4QAg3PNi3q5ZFH9xHZROZCqmdwgWQCJwhE7yfs
Message-ID: <CAEev2e8+9G_fEbGb4pxc22G-fHF6ebLOhBPJdDP47Y976pML8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] m25p80: Clear write_enable after page program and
 flash erase operation
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Kane Chen <kane_chen@aspeedtech.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi C=C3=A9dric,

On Mon, Nov 23, 2026 at 9:10=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 11/23/26 16:01, Anirudh Srinivasan wrote:
> > Hello C=C3=A9dric, Alistair,
> >
> > On Mon, Nov 23, 2026 at 1:13=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod=
.org> wrote:
> >>
> >> On 11/10/26 19:11, Anirudh Srinivasan wrote:
> >>> NOR flash drivers in EDK2[1] and its forks[2] poll for write enable
> >>> (WEL) to be deasserted at the end of a SPI operation to indicate that
> >>> the operation has been completed. The m25p80 spec[3] indicates that r=
eal
> >>> hardware would desassert WEL at the end of page program and erase
> >>> operations.
> >>>
> >>> The m25p80 model does not deassert WEL at the end of these operations=
.
> >>> Update the model to do so to match hardware behaviour.
> >>>
> >>> [1] https://github.com/tianocore/edk2/blob/3c890c11dfdb5908dcbc84f977=
dddc6c6d43789f/MdeModulePkg/Bus/Spi/SpiNorFlashJedecSfdp/SpiNorFlash.c#L987
> >>> [2] https://github.com/spacemit-com/edk2-platforms/blob/0b8b7182d8a20=
a771b97a487d0e6f4ab89fb3492/Silicon/Spacemit/Drivers/Spi/SpiNorFlashDxe/Spi=
NorFlashDxe.c#L532
> >>> [3] https://www.alldatasheet.com/datasheet-pdf/download/22807/STMICRO=
ELECTRONICS/M25P80.html
> >>>
> >>> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> >>
> >>
> >> If this change is to be merged in QEMU 11.2, could you please provide
> >> a Fixes: tag ?
> >
> > Looks like Alistair has picked up these to his branch already.
>
> b4 handles trailers updates nicely.
>
> > These would be the fixes tags. Not sure if i should send another
> > version or if Alistair could apply these tags.
> >
> > Patch 1/2 (aspeed smc test)
> > Fixes: 3e62a32ddb ("test/qtest: Introduce a new aspeed-smc-utils.c to
> > place common testcases")
>
> hmmm, this is for patch 1 and you have just replied to patch 2.
>
> > This bug was introduced in 7a2334f720 ("tests: add a m25p80 test")
> > back in 2016. The commit in the previous line refactored these tests,
> > so I think the fixes tag should mention that one.
> >
> > Patch 2/2 (m25p80)
> > Fixes: m25p80 ("Initial implementation of SPI flash device")
>
> This is not a git commit it.
>
> I think you should send a v2, the tools are now quite confused :
>
> $ b4 am 20261110-m25p80_write_enable_fix-v1-0-3a2abc0072b0@oss.tenstorren=
t.com
> Analyzing 7 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    =E2=9C=97 [PATCH 1/2] test/qtest/aspeed_smc-test: Send write enable be=
fore each page program command
>    =E2=9C=97 [PATCH 2/2] m25p80: Clear write_enable after page program an=
d flash erase operation
>      + Fixes: 3e62a32ddb ("test/qtest: Introduce a new aspeed-smc-utils.c=
 to place common testcases") (=E2=9C=93 DKIM/tenstorrent.com)
>      + Fixes: m25p80 ("Initial implementation of SPI flash device") (=E2=
=9C=93 DKIM/tenstorrent.com)
>    ---
>    =E2=9C=97 BADSIG: DKIM/tenstorrent.com

Uhh, sorry about that. I'll send a v2.

Regards
Anirudh Srinivasan

