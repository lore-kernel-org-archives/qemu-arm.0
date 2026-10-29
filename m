Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AC606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o1FgHHw2
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMLlF-0005wP-Mm; Thu, 29 Oct 2026 04:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xMLlE-0005w5-5N
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 04:45:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xMLlC-0001tx-3K
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 04:45:23 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so17261505e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793263520; x=1793868320; darn=nongnu.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=iQdQSxoeCwJuwjBw3x6Yg4uFVncSQXfuks6CHEb3zUw=;
 b=o1FgHHw2Cjwp88o3G2y+fcHjCexALAHcxsY/qkR8P0SghI24v7vxzm9XT5anQlefuR
 RdUwAqV269J5snrsNrc38Q8MCjkUf/zkaMvcep8tlwGMjSSlIJqqpaEDQgTVgQo0PbaC
 8YcnofrjqjZvXouNajL8skvln1+eYtyzloWlkEJ13OoV6Xl0DZogm8u5oOA3iZmfsvEQ
 /Db5EJiJUx7/lIVZqrP/qlshC3XnQfHvDQ1uuzR2ZFeXvI/cYB7uoH1JEKgIJUSuuFxO
 LgdfecVdM+d3pgltayeyFI5OTwR2ZtlgvDaRySHcylGDFqbkobVyqZyTZMt7Y7U11m1z
 yOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793263520; x=1793868320;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iQdQSxoeCwJuwjBw3x6Yg4uFVncSQXfuks6CHEb3zUw=;
 b=eTKeJOCU0dUyz71cUcdNMeutykWAtt2QB3GIC1jcteWVWV2Yc7+oLW1ENsDviGbkuF
 Gnjnqb77lNZRXhOdfGdnPMsaMMwCxTYnIk9YMsDJyFzutLUa2HSBR2LV9285ErIfuvE2
 cfjGWJT4DtlC1cXk79e5JkPunsQzGRq+Pz0nn9B1KUl0YDx70QdhJcsVsVQiSfiBoMqh
 dPmDaXofn+/YnttjKQnlepXd4vppqOP9A+z+QIOugxCYOegEu/r/myrpn1KhDmdM2T71
 6pfT4QcRaC0t0Jq19pkbecf746HT/ci27a07bgI9VM/x7uwXxWEpxwXFnZW+VmAWxC9d
 wDpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSaKeLlMkqEYCiZoYjpcKLx1gMAjPALAb3WoNvFnqJJDD1qrFhDr4/j6kwFBJpjvXoeQnIgnoTKQ==@nongnu.org
X-Gm-Message-State: AFq9FYJuZ6AnqIMw6cBLF6BBdhKobEbOwt9YiZc2H7ZHmGwhv30YO2My
 zPxSp6GjdjQsHZZYYVDC6w0bzDrUERNXkno3pQMuzY3SutJYiT2KJRY3
X-Gm-Gg: AYBFou2q8gsN0Njpe4jxNJ7Gkjt97qf3+IPpawbwfzL8wXBHS8lIyV1RG8al/yBwV4e
 hmW+6yGzOwYPwBLEsYu57mHIwvYMiln2GVwrAIG6f6CWJQoobDSCCEb1sYJVbkGrhpHOjCXhErf
 yG18O2Pm00npcOgCnmNYHhYK1bNG3p24blRgcq5U09no406PkEu5YB6iNWDo/BHonTBp6f2J0vs
 OgDaPS8h6BjQWVuxmiHPcHEA3tubOYxW0xLzy6BLH70BTQHOcxsuMvAWRmTZpyWgsKT+HUSP57e
 ygD35Bgt4QO6o3Q8VCxp/UW59oZkx/s7SNF+jTwI8WYB9o4PEbCfgY7jNdaobZxH1mYZg1XaUlN
 6AKNYQvdkS2LCU94z8Z9XiWy/MEhb5RhBgeAPdiM4iMkRgk1d3Ca/BE4JJwK7WDWTRLhfkPiLZ7
 rKkv4RQtOdacRjy+a52bA1S9svrp7cQJLjYuxwnYmRfHk+bDlunsaQzerm2O1j2rrd4Ltdm/IgX
 D4ffXxTUC+KPi2MVA7PPh8vNg4ej4VnC8pDLOAipIBp8kIZyJ8MBDD9xDMybVnP2UsytJw/3Hwn
 Nw4qoDFTYlrJjTe8SoWDZUESgt6AWF85olmC5EuNtrZRVoA/0nBWYldAYWwPxZasZw8=
X-Received: by 2002:a05:600c:3b8f:b0:4a1:dbdf:17a8 with SMTP id
 5b1f17b1804b1-4a9643d381amr116520235e9.2.1793263520136; 
 Thu, 29 Oct 2026 01:45:20 -0700 (PDT)
Received: from [192.168.1.89] (95-24-99-141.broadband.corbina.ru.
 [95.24.99.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa813d2640sm49530385e9.6.2026.10.29.01.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 01:45:19 -0700 (PDT)
Message-ID: <b2cb177dd23af09fff8ed4c961eb06240a8253ad.camel@gmail.com>
Subject: Re: [PATCH v2 4/6] hw/i2c/aspeed: fix buffer transfer in non-packet
 mode
From: Timur Maksimov <gessingate@gmail.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Kane Chen
 <kane_chen@aspeedtech.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
Date: Thu, 29 Oct 2026 11:45:16 +0300
In-Reply-To: <SEZPR06MB7362E41CDA36CBE3ADB0F286FC6E2@SEZPR06MB7362.apcprd06.prod.outlook.com>
References: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
 <20261027-aspeed-i2c-nonpkt-fix-v2-4-07deed1dff60@gmail.com>
 <SEZPR06MB736293095EFE3149F167A71DFC6E2@SEZPR06MB7362.apcprd06.prod.outlook.com>
 <15aa908814cfe5e3fd3d0ac4c7b3bd043b28df36.camel@gmail.com>
 <SEZPR06MB7362E41CDA36CBE3ADB0F286FC6E2@SEZPR06MB7362.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=gessingate@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Jamin.

Understood. I don=E2=80=99t planning to write a driver, but I might verify =
them
if I have some time. Otherwise, let=E2=80=99s just skip them,  as I am not =
sure
that the current implementation is incorrect.

On Thu, 2026-10-29 at 07:44 +0000, Jamin Lin wrote:
> Hi Timur,=20
>=20
> I'm not saying they don't work.
>=20
> My main concern is that we currently don't have firmware to test this
> mode on real hardware.
> Although we can test it in QEMU using QTest, this does not guarantee
> that QEMU behaves the same way as real hardware.
> Without testing on real hardware, we cannot confirm that the behavior
> implemented by this patch matches the actual hardware behavior.
>=20
> That said, I think the QTest in this series is very useful, as the
> functional tests don't cover all the I2C modes.
>=20
> Thanks,
> Jamin
>=20
> > Subject: Re: [PATCH v2 4/6] hw/i2c/aspeed: fix buffer transfer in
> > non-packet
> > mode
> >=20
> > Hi Jamin, you are right;=C2=A0 no driver uses those modes, and I can't
> > verify their
> > work at the moment.
> > Do you suppose, that they don't work? Are there issues with them?
> > We can exclude them from tests, but=C2=A0 buffer mode is important for
> > old chips
> > like AST2500.
> >=20
> > On Thu, 2026-10-29 at 06:33 +0000, Jamin Lin wrote:
> > > Hi Timur,
> > >=20
> > > As far as I can see, no ASPEED Linux driver uses non-packet
> > > buffer or
> > > DMA mode for master transfers:
> > > - i2c-aspeed.c (old register mode) only uses byte mode; the
> > > address
> > > =C2=A0 is always written to the byte buffer register before START.
> > > - i2c-ast2600.c in the ASPEED SDK kernel (new register mode) sets
> > > =C2=A0 PKT_EN for every master transfer, and the address comes from
> > > =C2=A0 PKT_ADDR.
> > >=20
> > > Have you verified this behavior on real hardware? Which firmware
> > > are
> > > you running that uses non-packet buffer/DMA mode?
> > >=20
> > > Thanks,
> > > Jamin
> > >=20
> > > > Subject: [PATCH v2 4/6] hw/i2c/aspeed: fix buffer transfer in
> > > > non-
> > > > packet mode
> > > >=20
> > > > In non-packet mode, the first byte of the tx buffer pool
> > > > contains a
> > > > device address, so avoid sending it as a data byte.
> > > >=20
> > > > Fixes: 961faf3ddbd8 ("hw/i2c/aspeed: Fix TXBUF transmission
> > > > start
> > > > position
> > > > error")
> > > > Signed-off-by: Timur Maksimov <gessingate@gmail.com>
> > > > ---
> > > > =C2=A0hw/i2c/aspeed_i2c.c | 11 +++++++----
> > > > =C2=A01 file changed, 7 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c index
> > > > ff6ef6d23a..510758fb7a 100644
> > > > --- a/hw/i2c/aspeed_i2c.c
> > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > @@ -382,7 +382,7 @@ static void
> > > > aspeed_i2c_bus_recv_dma_pool(AspeedI2CBus *bus)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd=
, RX_DMA_EN,
> > 0);=C2=A0 }
> > > >=20
> > > > -static int aspeed_i2c_bus_send(AspeedI2CBus *bus)
> > > > +static int aspeed_i2c_bus_send(AspeedI2CBus *bus, bool
> > > > send_addr)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLA=
SS(bus-
> > > > >controller);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D -1;
> > > > @@ -391,11 +391,12 @@ static int
> > > > aspeed_i2c_bus_send(AspeedI2CBus
> > > > *bus)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t reg_pool_ctrl =3D
> > > > aspeed_i2c_bus_pool_ctrl_offset(bus);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t reg_byte_buf =3D
> > > > aspeed_i2c_bus_byte_buf_offset(bus);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t reg_dma_len =3D aspeed_i2c_bus_dm=
a_len_offset(bus);
> > > > +=C2=A0=C2=A0=C2=A0 uint8_t pool_offset =3D send_addr ? 1 : 0;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 int pool_tx_count =3D SHARED_ARRAY_FIELD_E=
X32(bus->regs,
> > > > reg_pool_ctrl,
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T
> > X_COUNT) + 1;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg=
_cmd,
> > > > TX_BUFF_EN))
> > {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < pool_=
tx_count; i++) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D pool_offset;=
 i < pool_tx_count; i++) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 uint8_t *pool_base =3D aic->bus_pool_base(bus);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 trace_aspeed_i2c_bus_send("BUF", i + 1,
> > pool_tx_count,
> > > > @@
> > > > -633,6 +634,7 @@ static void
> > > > aspeed_i2c_bus_handle_cmd(AspeedI2CBus
> > > > *bus, uint64_t value)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t reg_intr_sts =3D
> > > > aspeed_i2c_bus_intr_sts_offset(bus);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t reg_cmd =3D aspeed_i2c_bus_cmd_of=
fset(bus);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t reg_dma_len =3D aspeed_i2c_bus_dm=
a_len_offset(bus);
> > > > +=C2=A0=C2=A0=C2=A0 bool start_cmd =3D SHARED_ARRAY_FIELD_EX32(bus-=
>regs,
> > > > reg_cmd,
> > > > +M_START_CMD);
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (!aspeed_i2c_check_sram(bus)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > @@ -642,7 +644,7 @@ static void
> > > > aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_i2c_bus_cmd=
_dump(bus);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > -=C2=A0=C2=A0=C2=A0 if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd,
> > M_START_CMD)) {
> > > > +=C2=A0=C2=A0=C2=A0 if (start_cmd) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t state =3D =
aspeed_i2c_get_state(bus) &
> > I2CD_MACTIVE ?
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I2CD_MSTARTR : I2CD_MSTART;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t addr;
> > > > @@ -686,7 +688,8 @@ static void
> > > > aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg=
_cmd, M_TX_CMD))
> > {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_i2c_set_sta=
te(bus, I2CD_MTXD);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (aspeed_i2c_bus_send=
(bus)) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (aspeed_i2c_bus_send=
(bus, start_cmd &&
> > > >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !a=
speed_i2c_bus_pkt
> > _mode_en
> > > > (bus)))
> > > > + {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts,
> > > > TX_NAK, 1);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 i2c_end_transfer(bus->bus);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > >=20
> > > > --
> > > > 2.53.0

