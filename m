Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D84606A31E
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Nov 2026 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=Qn7DxiIJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVxia-0002Us-IL; Tue, 24 Nov 2026 16:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVxiZ-0002Pt-Dd
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 16:06:23 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xVxiU-0003fH-RP
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 16:06:23 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-67db8985419so6303725d50.1
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2026 13:06:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554376; cv=none;
 d=google.com; s=arc-20260327;
 b=sJY5PCkwxbyIMVjCFQg90KuEymPZxIxVOlC1p7nzJathM2ZluBqZK97O0Amqfj93Mp
 nmwqJY93wAuRCTg2F08X0fas0BTYa3g55qqv4cCw14pkFic2PvzjGvzrh1ySxiYXJ8ND
 MQYFIFwLZPNFGyDwd/BQQ6dttJ8QUvYJnunkEX/8F6T1rALAZdXMaX8gr5UmeZinG3Jk
 rZWKqAf4bvOIfyR1WhPB42pKnqgo+fVOjWm8qeCqsucUQUFJfCiKShFwJIvqe5WO0POj
 1OwtvYR/UtJh2/tCaRR18VyUIN92eXvzL9JOFzL4beFPZGqLRXtuJUO+E6K3FCwQLZHh
 tr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=td/IQBqnnauSbmvoT5oUK4P6m4eh4rfRhcVntXiDzt4=;
 fh=Uc2EK32ouKrMTl0aGYPw43kBS9S51ip++xK6i1nUaCA=;
 b=Zf0I6pOcFl0UBQyviyi7Jq3QKLUKWTFPpz6S5KWzah9IICmWDhoNnOyRegAu4jER5x
 kNdk2tPWY5W/YwdWQScGUuxdy3HLRqnM+EjcfwjJIX0rwwMPmI+dpgfrYpkLHMgYc3Sv
 InchmQGS8Ujkxq/JtXaT1pA0c8slZgsts+qiWpTcbPV1Fi3K1DEt/wXOURFUxE+lLijU
 iO4k4znx0y76myaPV4hCCpcJaa4j7UOV3kvPv5M8mwdBuX3RSouKerH/x5VWnNBAHzrJ
 1E2ksfb9he9tN04D7ifnKNVh0B1M41EUeVBKrUvKS/Stzd5h2nCw17Yjg20ugu5KDUyQ
 MiGw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795554376; x=1796159176; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=td/IQBqnnauSbmvoT5oUK4P6m4eh4rfRhcVntXiDzt4=;
 b=Qn7DxiIJvljtjdpRvzw1yxG31ivzO41cXAWy0pOK6s2+7QWoLTUMcXcIM2o0xRYeH0
 IlYFe1BxVpeTQ7dCm7vRnqreG00p99gokmIUPLKtTj3Bl9Zby4fm5SwPBcJnmTCcyNi2
 z4n3q4yQP8eo2VAbkCd30sQxtewUzUc0+tbb44yCoQw4HVuKB7zhWcBjpjrnDen21oss
 kdg0DFAdO5QDiATEz3jhgOCEckWKBxMrc5IMRRe2exh80nZvCr80CxYp1qpw6pc7aXyt
 iRB0IUDdKrn00ixKXyLaDKc+AS0L6Qe9Z4JWlpRtyXYYErqqpLSZvWQiFfSOGx6c2ls8
 Il6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795554376; x=1796159176;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=td/IQBqnnauSbmvoT5oUK4P6m4eh4rfRhcVntXiDzt4=;
 b=r/Ism7KBO0ZPtVDjN/mmavv+AyhSQPehaW89OR2J9j5Z576nvQQmPibiDEeKoP9DS5
 5KGXRUcKi1h0vJOd4/qmMfK+h3Cj7n8Jk0QRS9NhSPB+rP9f9P7FzFwZ9R1KNnltANCa
 C5hy6THfk+h1h+OdVYJ11o/qqL7MQURfRWw5B/2s/q4VvzXLKBAS0jXHIGOh4Eszqz1x
 v3x7cMrrpIt7u+UCMTqCSpxec5Obq2969soQTk/GESUlp/UckAJ8YQpYkdYtyPrtWibQ
 Z02CnAfBdRHlOoVUBQKzmEE16unCANYiQu4AHQbvs7nmJQUpFsK/Y89aUreR3jarbpGq
 cFxg==
X-Forwarded-Encrypted: i=1;
 AL+hErFQEmXvg7s3XS3aYU1zpskuHV361pPhGvfzU3atGuA04VkXePcqVo22kK3LjrTCKJPE+Z9WdEGaFg==@nongnu.org
X-Gm-Message-State: APuU4Z+ZN871y0qA2kH1l2yiWq0IY+iFcub6tpMjldFxBYKV90m89iTE
 PX81hNm7dcjaxgqQ/W8yfjwDQ/SfQfta8MKp58ukbl3YcOSPqCGyKrnwxPecvI5SmHpKxYRco4U
 e9hmC7eKpO13rv1H3BqSqltHxR7JzHoGzP5df7FcqFw==
X-Gm-Gg: AZFdTZdueGYCjBdRVa+BfxOt/ZtWpStzg6U5RwqjpX+GiMc/o7H+cAlgmJwPj512nJ8
 8lPTpQ4Vw0zsFnQgeYpedsHrqphe93KLq2MEozshc7yghsTdJWz7UG+Mj6OwtD97gdcMPLnDAr7
 PczTQc++tx5IXBvSZP4K3GprMOU68TYs7xm0MXAheZh0B90LWWrhbQMnSLlqL52ns0FcoRjriQc
 Xpkxq36ElQroGt+085JY3yT06JBJSIx/Cwfohosdre0vdMx81fjzsppg8kM8ZjfUJAZ1BCWZqeo
 4rGgmkNJWpNodhOS6osAfhv7I1Oi4QiniorAuTNJMA8+bQJ/N97EV511X+fwROwohd+TkcpGTPr
 DbRSRdhj7TN9revz5MPJXM6bcXV/0FNkJqh1ADiWVt8LtrFad+Trb1aXh0XyQ4R/C3/CdDVX3f8
 hQd20LTsbZyDOI9hwLHr1uCoiRwg==
X-Received: by 2002:a53:b4cf:0:b0:67d:adb1:f165 with SMTP id
 956f58d0204a3-67df4456419mr5273132d50.47.1795554376524; Tue, 24 Nov 2026
 13:06:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-m25p80_write_enable_fix-v2-0-0ac94f99e91f@oss.tenstorrent.com>
 <20261123-m25p80_write_enable_fix-v2-1-0ac94f99e91f@oss.tenstorrent.com>
 <766971bd-722c-4c25-bea0-dd2040a8c862@kaod.org>
In-Reply-To: <766971bd-722c-4c25-bea0-dd2040a8c862@kaod.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 24 Nov 2026 15:06:05 -0600
X-Gm-Features: Aa3M54rC6IpE0TSvegTRIA0Pv4FdA-_Rs-8XdgYlU8WW40UR2lNJXWqjYSrCS4k
Message-ID: <CAEev2e-9knDkdFf2fee13-38VECzEwBu1R5F4=5xfdpdGd+9eA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] test/qtest/aspeed_smc-test: Send write enable
 before each page program command
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-stable@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi C=C3=A9dric,

On Tue, Nov 24, 2026 at 9:02=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 11/23/26 16:21, Anirudh Srinivasan wrote:
> > The M25P80 specification [1] dictates that a write enable (WREN) must
> > be sent before a page program (PP), and that the write enable latch
> > (WEL) is reset at some point before the PP command has finished.
> >
> > The current tests that make use of page program send WREN only once at
> > the beginning, before issuing multiple PP commands. The m25p80
> > implementation in QEMU doesn't deassert WEL at the end of each PP
> > operation (so this isn't an issue currently), but real hardware would
> > unset WEL at the end of the first PP command the second PP command woul=
d
> > fail. Update the tests to send WREN before each PP command.
> >
> > The current m25p80 model does not reset the WEL at the end of each PP
> > command. This is a bug, and a subsequent commit will fix this.
> >
> > [1] https://www.alldatasheet.com/datasheet-pdf/download/22807/STMICROEL=
ECTRONICS/M25P80.html
> >
> > Fixes: 3e62a32ddb89 ("test/qtest: Introduce a new aspeed-smc-utils.c to=
 place common testcases")
> > Cc: qemu-stable@nongnu.org
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >   tests/qtest/aspeed-smc-utils.c | 24 +++++++++++++++++++-----
> >   1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/qtest/aspeed-smc-utils.c b/tests/qtest/aspeed-smc-ut=
ils.c
> > index 146332240d..85e883d0b8 100644
> > --- a/tests/qtest/aspeed-smc-utils.c
> > +++ b/tests/qtest/aspeed-smc-utils.c
> > @@ -218,12 +218,23 @@ static void read_page_mem(const AspeedSMCTestData=
 *data, uint32_t addr,
> >   typedef void (*read_page_mem_fn)(const AspeedSMCTestData *data,
> >                                    uint32_t addr, uint32_t *page);
> >
> > +static void flash_write_enable(const AspeedSMCTestData *data)
> > +{
> > +    spi_ctrl_start_user(data);
> > +    flash_writeb(data, 0, WREN);
> > +    spi_ctrl_stop_user(data);
> > +}
> > +
> >   static void write_page_mem(const AspeedSMCTestData *data, uint32_t ad=
dr,
> >                              uint32_t write_value)
> >   {
> > -    spi_ctrl_setmode(data, CTRL_WRITEMODE, PP);
> > -
> >       for (int i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> > +        /* Send write enable before each Page Program */
> > +        flash_write_enable(data);
>
> aspeed_smc_test_write_page_mem() calls :
>
>        flash_writeb(test_data, 0, WREN);
>
>
> Should we keep it ?

Yes, this can be dropped.

>
> > +
> > +        /* move out USER mode to use direct writes to the AHB bus */
>
> why ?

aspeed_smc_test_write_page_mem had this comment on it and I copied it
over here. This function is very similar to that (we're sending WREN
in user mode and switch to AHB/direct mode for the PP). I can remove
this comment if you think it is unnecessary.

>
> > +        spi_ctrl_setmode(data, CTRL_WRITEMODE, PP);
> > +
> >           flash_writel(data, addr + i * 4, write_value);
> >       }
> >   }
> > @@ -468,10 +479,13 @@ void aspeed_smc_test_write_page_mem(const void *d=
ata)
> >       flash_writeb(test_data, 0, WREN);
> >       spi_ctrl_stop_user(test_data);
> >
> > -    /* move out USER mode to use direct writes to the AHB bus */
> > -    spi_ctrl_setmode(test_data, CTRL_WRITEMODE, PP);
> > -
> >       for (i =3D 0; i < FLASH_PAGE_SIZE / 4; i++) {
> > +        /* Send write enable before each Page Program */
> > +        flash_write_enable(test_data);
> > +
> > +        /* move out USER mode to use direct writes to the AHB bus */
> > +        spi_ctrl_setmode(test_data, CTRL_WRITEMODE, PP);
> > +
> >           flash_writel(test_data, my_page_addr + i * 4,
> >                  make_be32(my_page_addr + i * 4));
>
> Can't we call write_page_mem() instead ? If possible, the helper
> flash_write_enable() becomes useless then.

write_page_mem() writes the same value to every word in the page,
whereas this test is writing a different value for each offset.
write_page_mem() will need to be refactored a bit to use here (which
I'd like to avoid unless really necessary).

>
> Anyhow why isn't flash_write_enable() used elsewhere ?
>
> Also, all these routines  :
>
>         aspeed_smc_test_erase_sector()
>         aspeed_smc_test_erase_all()
>         test_write_page()
>         test_read_page_mem()
>         aspeed_smc_test_write_page_qpi()
>         aspeed_smc_test_write_page_datafifo()
>         aspeed_smc_test_read_page_datafifo()
>
> call the page program OP. Probably PP is called only once and the
> routines are immune to the WEL clear in patch 2. Are we sure of that ?

Yes, all these tests send a single PP only and operate in user mode.
The test this patch touches switches to AHB direct write mode to do
multiple PPs. In this mode, CS is de-asserted after each write, which
results in WEL being cleared and WREN needing to be sent again.

Maybe what I can do is that I can inline the flash_write_enable()
helper in these 2 instances, and add a comment as to why it is needed
only in those locations. That might help clarify some things.

>
> Thanks,
>
> C.

