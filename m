Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD5606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=d6iSV0fs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVVYE-0000ST-Hf; Mon, 23 Nov 2026 10:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVVYA-0000Q9-JY
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:01:47 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVVY2-0001Hz-Hz
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 10:01:45 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-67db35e7953so3440690d50.0
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 07:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446094; cv=none;
 d=google.com; s=arc-20260327;
 b=E46MFcMnvd/od4vRqKaLl+5oalDRE1CG26GysZkbYBzVCRO6hVnybOYS5+cleSRSlH
 J+0jBBFakyFbop5TRYexiHtH6EDtp4MaWBdltzoLvQKFqfQdwoqcuVmNCrUsYzLl5vZR
 mE3Um33NvRRo8oHCBzRGp04fbBOk7e2Dqbyt4Jr6TbAu6f7eQVPG4+VzP8iZdpMRWY0D
 nBhQAfmiYeTuKAiaklYFh5agEMAcPyg56Skb/G13cHGZnVO0c3bMELdK7Iy7v6E/PZwf
 fBLkSJRH32tSLNrvuVKkmSHrrpJXCQ5hayMQrjJK1ax9MDfnE9pvusKK2LwLE3GSXR/9
 utYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=skuf2GYorXAzjSk8yFnNlIs/kze5ZuA+D8lM8hSq64g=;
 fh=JMNdZC7R96eG/36b0lF2LS9rg2lH7PlaLsXfHvZxYQA=;
 b=jIkE2ReBk+n6B9R8yPdjdSXzZBOCR9wZJVYJVQMHBnec9WriWETtZi5xXiJkec56LF
 UYZ/MMMsEGdN9ru3K9cl2QRXlPu6D5eDLrGi5V5N2zC3IfgB62sTlCs6nrugcQaWAyW/
 sImmOziznyqXKiKmSLF6Amy2MHyUSa3fwIv5F3P0l3CbLPZTr1hAW2hrR1ans25/Kht7
 3aXzGiZGpihY+qPMjE0QVoZ8npdlYt1rwzTe9SF0hGT99m6wHZH6t+UvlpCkQ2RKonJw
 NqOxBAOFkL7mJ5elSLOjsh2/RxDKAXOT6zecZBbKEQkKfREpUBP3yKi05TdQb1OgJJun
 crmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795446094; x=1796050894; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=skuf2GYorXAzjSk8yFnNlIs/kze5ZuA+D8lM8hSq64g=;
 b=d6iSV0fsKOzhKhuRlkPWextBJBvL5KyaMWVr0xb3JyHElymuINs5tRmNzEglaw701H
 7tDA5PzhnWpmJbDWdMskTnegV57i4F1fdI6EqNaV7COt2J+QNrp4ReNY8v/f47QwsGqh
 r731Hg6i7GtSpoZPEPKL99UDNFfYNQRl2uQoibmIpj10TKL2Rge0euNTs1WmV4NJlyDV
 3oDjZiQVApsVvWes/df0YmYYAfwEs89JGZ5qe158yapbHjJlxGGRv42RP+jBKZbju0iW
 4SZ1nqymCmfWmd5R5UtRFYDoZO6/yVfzecy0kke8RKnHTvCFuhAaHeMFuvGtZDS+GL4i
 8aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795446094; x=1796050894;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=skuf2GYorXAzjSk8yFnNlIs/kze5ZuA+D8lM8hSq64g=;
 b=ZMJLwHZGGXYQai0uU+syVvOXAQuRK1HuHyZ7yWB8SYjAZuFHj5Q0dckFBZ4F08mdvA
 SmTxYLG3h7hiY+bCYv5lHHQxBBb64uJOZn5WdLqvi6lO+pzcdrNZkccjp4XqCzEZAQBu
 AyNR80O00IB9DP7Y/scI9Nl8hT7SUd8kMvuqYkBqohlll7t4lATQjtOs9vtAaU9FVacN
 PKrmtm2sofY/wASxqIn9QPzJf4vezJeVvyC+hkhPkfSuvd7/0DWSFs1CrAKq+SPGKo7i
 Yf5xPDZ/UWq4err3Sy8slfkzoi89mJvqIYJkxDE2hfitGN+1ekXqPXyohQK51ANduZ3f
 Yprg==
X-Forwarded-Encrypted: i=1;
 AL+hErHJEuW3idRFuk62CfAZCr7xaCtmcpa1TlN72YTLu6mIiPmZ1TopNU39S4QuMgRoXKGRDrKJ/xO2wA==@nongnu.org
X-Gm-Message-State: APuU4Z+pI2K++Wm+APOjHQ+JY8NkT+r7LknXnCVeZGgj+zuTyTIMkpNC
 QdHCy+o0anxtWdqL0GkKEqBrAsi9lLwDvWV/YWpVrVg4er2SNJJ1z+TSABiz9bwtuotn5OfqOAl
 azfqJ3YMtRsxS4Bq5zvIn5oQCDn/cHSDjT7sRx3v9tA==
X-Gm-Gg: AZFdTZfc76k7o6i//YWMIZRyFfzK6S9m0Dg7CH+RvIvWRXYMBAhPuo2c9LOs4xJxgcn
 HimodpP01ELWxXh1OYjNGB0WmLjbZZltxyFz9++FissT0bp5XLJrbtk77ijHiTeeq1PbXNB3l/b
 aR+wl9K69IN5H92Ul6lWYwy4x1prUI2EqnwbQ4W6YgX59/Sz5Y0zhTTAs6kFRUvJv0bHNNUJu0d
 k8T3GlxKpH3k39Yo4F7lbWCcVo9xoh7ZEf7wnfWw9sAmpmxkJ252cQboEx9x9yHBFCMpUlnKIHX
 nkUJriczuK5ICmDSY3hu14ildUKILk3PPvwRjg/SVJeKJkweUn2tUGtBKJ78Ey7pIFHQizESYy6
 sCj38ee02K1+oCjLtS3DJK6EgyWB/JH6kWZMskYZdf2w+PRuwV5V+vG2Xmgx1RS/LWeDSwDFIpC
 28/6D7xtQ2HoF8qmsHNuADyyxjn2maNK5qwNKTfZUYXRTRWC8=
X-Received: by 2002:a05:690e:43cf:b0:67d:c878:7df7 with SMTP id
 956f58d0204a3-67df449a793mr1955028d50.66.1795446094270; Mon, 23 Nov 2026
 07:01:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-m25p80_write_enable_fix-v1-0-3a2abc0072b0@oss.tenstorrent.com>
 <20261110-m25p80_write_enable_fix-v1-2-3a2abc0072b0@oss.tenstorrent.com>
 <39176a72-7756-477a-842b-e277ec07d321@kaod.org>
In-Reply-To: <39176a72-7756-477a-842b-e277ec07d321@kaod.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 23 Nov 2026 09:01:23 -0600
X-Gm-Features: Aa3M54pMIxVpsgHdhxN42mW8bRN1Czi4_5qOo11zwg6oAPx-qis8W0_UjRTfeSU
Message-ID: <CAEev2e_SbbLENO3YhkJPtBXyd2JKZktmnxzD6UbbDyfyih6C2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] m25p80: Clear write_enable after page program and
 flash erase operation
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alistair Francis <alistair@alistair23.me>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
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

Hello C=C3=A9dric, Alistair,

On Mon, Nov 23, 2026 at 1:13=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 11/10/26 19:11, Anirudh Srinivasan wrote:
> > NOR flash drivers in EDK2[1] and its forks[2] poll for write enable
> > (WEL) to be deasserted at the end of a SPI operation to indicate that
> > the operation has been completed. The m25p80 spec[3] indicates that rea=
l
> > hardware would desassert WEL at the end of page program and erase
> > operations.
> >
> > The m25p80 model does not deassert WEL at the end of these operations.
> > Update the model to do so to match hardware behaviour.
> >
> > [1] https://github.com/tianocore/edk2/blob/3c890c11dfdb5908dcbc84f977dd=
dc6c6d43789f/MdeModulePkg/Bus/Spi/SpiNorFlashJedecSfdp/SpiNorFlash.c#L987
> > [2] https://github.com/spacemit-com/edk2-platforms/blob/0b8b7182d8a20a7=
71b97a487d0e6f4ab89fb3492/Silicon/Spacemit/Drivers/Spi/SpiNorFlashDxe/SpiNo=
rFlashDxe.c#L532
> > [3] https://www.alldatasheet.com/datasheet-pdf/download/22807/STMICROEL=
ECTRONICS/M25P80.html
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
>
>
> If this change is to be merged in QEMU 11.2, could you please provide
> a Fixes: tag ?

Looks like Alistair has picked up these to his branch already.

These would be the fixes tags. Not sure if i should send another
version or if Alistair could apply these tags.

Patch 1/2 (aspeed smc test)
Fixes: 3e62a32ddb ("test/qtest: Introduce a new aspeed-smc-utils.c to
place common testcases")
This bug was introduced in 7a2334f720 ("tests: add a m25p80 test")
back in 2016. The commit in the previous line refactored these tests,
so I think the fixes tag should mention that one.

Patch 2/2 (m25p80)
Fixes: m25p80 ("Initial implementation of SPI flash device")

Regards
Anirudh Srinivasan

