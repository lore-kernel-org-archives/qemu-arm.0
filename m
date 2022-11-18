Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp16475ejx;
        Thu, 17 Nov 2022 23:02:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5xfjySHQqLbrbbhuxE+RCfbNLFGOkyzO2zdTmDErIKszU7WqXWBvKAnycVKwOwD0/LkTDF
X-Received: by 2002:a05:6214:131:b0:4b1:92ca:9cd7 with SMTP id w17-20020a056214013100b004b192ca9cd7mr5636578qvs.103.1668754933445;
        Thu, 17 Nov 2022 23:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668754933; cv=none;
        d=google.com; s=arc-20160816;
        b=AKj40SHFImAsDoAlAnnQ55e9cl9tSZdYYJyZ3yrOnp1j3NfpO0h6KJU72rwiIt21Eh
         sfzvLWYi3Wyst6hcjxlwhVvx0AgpTKMWan4BpSODAsVC3HVXANneuNHgU9JqB/LVj9Jj
         tcX6NrQBxhb8iR1ASnSN4LLFSoUzWA01yJ18xW6cmOezMOFJGcMEhQ9Mwu3xcmuiJK9y
         C7hiSYdmZewEW9JLI8PyqA5axZBRdX7z45wpvMDOwWyToBjaHZLL8RtBiOiFrsOiBYJi
         KwrqkomA/gQm5VxDI304OrU72kK+y0kPa185iFWG21OjkPtb+no3jwr8GzTr8XnoB4g+
         5xgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=4v4fQEQf83/Ze8lhFMGTOZ7QWBFmgaYZ5TXgaNKw8fg=;
        b=jp6qTgYwCj2oA9nBw/cfl4Jlf/HrwseyQ/3nmIR43CoMOSRa3Dri6WJSTPe3b9aq32
         Cd9gQ643lTtUsUBXsdxp/XAUC6N1CZv+WzNoVivqAnkK2Ol4c0jqcQf+j/SEPlpF4JrQ
         6nMe3B9BWmkqIMKGVRU83ry/Cxe94/hJtIhDjtIa6wOuaFFjmirzrOjozs+B+h5dgosh
         lGnCGmIzJ+veMPKk+ARepE7GmhMksryPEBPkRNtoNOY6gkcV0sU+Q2KMXLhF0xY1cFI4
         Yj5kkqRXXe4drX8KvY9GJPMrocBNxO5GtoptHSbBEQvzxh0Dyw7jiIvg84N/QFBWoiuk
         a7uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=sHFux9gN;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=gBDEFxQm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a248600b006f582368e97si1835076qkn.368.2022.11.17.23.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Nov 2022 23:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=sHFux9gN;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=gBDEFxQm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ovvO1-0003Q3-12; Fri, 18 Nov 2022 02:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovvNn-0003OQ-Mo; Fri, 18 Nov 2022 02:01:54 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovvNk-0001yn-8c; Fri, 18 Nov 2022 02:01:50 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6CB3032005C1;
 Fri, 18 Nov 2022 02:01:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Nov 2022 02:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668754905; x=1668841305; bh=4v
 4fQEQf83/Ze8lhFMGTOZ7QWBFmgaYZ5TXgaNKw8fg=; b=sHFux9gNKxwIRdAguP
 kfUSOlq6nD/6fdJO/DPL8mn8xJF9yfO0j3GfLWJhiP7EMaIGEOD4dpCSPgsc//Gt
 Gsc/YRlMIHJ2iWchYUJxd2rIEziAI3hr3MoxwUcpyKYi+uGDPqwCUAXXKke0qplx
 F0o+6G8B/uxWtU2b+KW2OFgKf5haxFl91AhQ41ij0HFnl2o5OEPBf8k0G0D+e5u7
 OJUJw+LE1va7pQ+fm2zg2JCjERtC4mCdkgefjBmpXmoYWmv2yhMB9LmGQFMc64GK
 FuORquMDwknq92+qal7D94OC4k4rVjY6TVRWgyQIeqMok3fo/z7yfoVSekoOQoKD
 J7Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668754905; x=1668841305; bh=4v4fQEQf83/Ze8lhFMGTOZ7QWBFm
 gaYZ5TXgaNKw8fg=; b=gBDEFxQmJ0QXhTP1myDJh/2k7wShp6VU+dhk12Ly5xpd
 45978o8di+9ily5onyqWtiJuU0aLvYp6O2cjSr9Kou/QCdA7WNdTWF9dr6gQqX3A
 4xL8MHNxN3VzVCvL4V8uHfKn/d7zAyMxzh1jQYnlLh2hqEcPi6OcnVbhHjkwi/qz
 8q0ucaEBO49KfFVoQaUNSOHzySL4XcOnYdkx9Jb0nUgKTQtUI8SXgoQXmrWfXQ3I
 8/Qru8PYnRTFolPhCaJQvHu61+04SHsjbT/Kg8e7X9/QJ/grrpl2Uw0O5KaER45z
 SgQQ59MNa3cf6HmQ9n5JDDWU8Y4boQhK/CBBVIy3Bw==
X-ME-Sender: <xms:2C13Y7auN3Hhf1l_16m0FPIXpJHI7dZD5YOZ1Z6XeVt6qqazrBlMAg>
 <xme:2C13Y6YDa2cCy24sRg3Y6skpu2Q0zhNNjTpZmQQ7xDycUkjlq1ytEB3E6z7yZzQW5
 JWmbV7ufI05kx9o6Ac>
X-ME-Received: <xmr:2C13Y98JQHayTqgYNWOgIztL7PlrdsN886eYaUMdRX03HUx6vFevTNAdTxL_jMDDeGbMub4xtVE6jVwelq1ZJk0qdyYFCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:2C13Yxr6maJaROB-YIBqvpQlDJicCLZ4U8AeuLKWFiJpBSOBFuR7hg>
 <xmx:2C13Y2qdfuo6hcJ58c6iYSqH3h1_Gw4Ebfk7EeK5ZUhS1JSOVEMjGg>
 <xmx:2C13Y3Te9CPZfAAsnmC9OrRHxi2zQLt3ddqLjJMltnpAjt_bkVmTZg>
 <xmx:2S13Y8iPgsEKh5Con_BJL3fkfEDVg_mYFK_8hZCVmvnR-yDVBOQO1g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 02:01:42 -0500 (EST)
Date: Fri, 18 Nov 2022 08:01:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
Message-ID: <Y3ct1OzQfPLGEQ1T@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
 <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0+9N5QmAVCKw6LCu"
Content-Disposition: inline
In-Reply-To: <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ww5gW8E+dECS


--0+9N5QmAVCKw6LCu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 18 13:56, Jeremy Kerr wrote:
> Hi Klaus,
>=20
> > Add an abstract MCTP over I2C endpoint model. This implements MCTP
> > control message handling as well as handling the actual I2C transport
> > (packetization).
> >=20
> > Devices are intended to derive from this and implement the class
> > methods.
>=20
> Looks good, nice to see how it's used by the nmi device later too.
>=20
> A couple of issues with the state machine though, comments inline, and
> a bit of a patch below.
>=20
> > +static void i2c_mctp_tx(void *opaque)
> > +{
> > +=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D DEVICE(opaque);
> > +=C2=A0=C2=A0=C2=A0 I2CBus *i2c =3D I2C_BUS(qdev_get_parent_bus(dev));
> > +=C2=A0=C2=A0=C2=A0 I2CSlave *slave =3D I2C_SLAVE(dev);
> > +=C2=A0=C2=A0=C2=A0 MCTPI2CEndpoint *mctp =3D MCTP_I2C_ENDPOINT(dev);
> > +=C2=A0=C2=A0=C2=A0 MCTPI2CEndpointClass *mc =3D MCTP_I2C_ENDPOINT_GET_=
CLASS(mctp);
> > +=C2=A0=C2=A0=C2=A0 MCTPI2CPacket *pkt =3D (MCTPI2CPacket *)mctp->buffe=
r;
> > +=C2=A0=C2=A0=C2=A0 uint8_t flags =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch (mctp->tx.state) {
> > +=C2=A0=C2=A0=C2=A0 case I2C_MCTP_STATE_TX_SEND_BYTE:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mctp->pos < mctp->len) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uin=
t8_t byte =3D mctp->buffer[mctp->pos];
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tra=
ce_i2c_mctp_tx_send_byte(mctp->pos, byte);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
send next byte */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c=
_send_async(i2c, byte);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->pos++;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* packet sent */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_end_transfer(i2c);
>=20
> If we're sending a control message, mctp->len will be set to the control
> msg len here, then:
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
> > +
> > +=C2=A0=C2=A0=C2=A0 case I2C_MCTP_STATE_TX_START_SEND:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mctp->tx.is_control) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
packet payload is already in buffer */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fla=
gs |=3D MCTP_H_FLAGS_SOM | MCTP_H_FLAGS_EOM;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
get message bytes from derived device */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->len =3D mc->get_message_bytes(mctp, pkt->mctp.payload,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I2C_MCTP_MAXMTU, &flags=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> ... it doesn't get cleared above, so:
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mctp->len) {
>=20
> ... we don't hit this conditional, and hence keep sending unlimited
> bytes. This presents as continuous interrupts to the aspeed i2c driver
> when replying to any control message.
>=20
> I think we need a mctp->len =3D 0 with the i2c_end_transfer(). With that,
> I can get control protocol communication working with mctpd.
>=20
> > +static int i2c_mctp_event_cb(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +=C2=A0=C2=A0=C2=A0 MCTPI2CEndpoint *mctp =3D MCTP_I2C_ENDPOINT(i2c);
> > +=C2=A0=C2=A0=C2=A0 MCTPI2CEndpointClass *mc =3D MCTP_I2C_ENDPOINT_GET_=
CLASS(mctp);
> > +=C2=A0=C2=A0=C2=A0 MCTPI2CPacket *pkt =3D (MCTPI2CPacket *)mctp->buffe=
r;
> > +=C2=A0=C2=A0=C2=A0 size_t payload_len;
> > +=C2=A0=C2=A0=C2=A0 uint8_t pec;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch (event) {
> > +=C2=A0=C2=A0=C2=A0 case I2C_START_SEND:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mctp->state !=3D I2C_MC=
TP_STATE_IDLE) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -1;
>=20
> mctp->state may (validly) be I2C_MCTP_STATE_RX here, if we're receiving
> the start event for the second packet of a multi-packet message.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* the i2c core eats the sl=
ave address, so put it back in */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkt->i2c.dest =3D i2c->addr=
ess << 1;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mctp->len =3D 1;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mctp->state =3D I2C_MCTP_ST=
ATE_RX_STARTED;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 case I2C_FINISH:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 payload_len =3D mctp->len -=
 (1 + offsetof(MCTPI2CPacket, mctp.payload));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pkt->i2c.byte_count + 3=
 !=3D mctp->len - 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tra=
ce_i2c_mctp_drop_invalid_length(pkt->i2c.byte_count +
> > 3,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mctp->len - 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o drop;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pec =3D i2c_smbus_pec(0, mc=
tp->buffer, mctp->len - 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mctp->buffer[mctp->len =
- 1] !=3D pec) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tra=
ce_i2c_mctp_drop_invalid_pec(mctp->buffer[mctp->len - 1], pec);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o drop;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pkt->mctp.hdr.eid.dest =
!=3D mctp->my_eid) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tra=
ce_i2c_mctp_drop_invalid_eid(pkt->mctp.hdr.eid.dest,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mctp->my_eid);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o drop;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pkt->mctp.hdr.flags & M=
CTP_H_FLAGS_SOM) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->tx.is_control =3D false;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(mctp->state =3D=3D I2C_MCTP_STATE_RX) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mc->reset_message(mctp);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->state =3D I2C_MCTP_STATE_RX;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->tx.addr =3D pkt->i2c.source;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->tx.eid =3D pkt->mctp.hdr.eid.source;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->tx.flags =3D pkt->mctp.hdr.flags & 0x7;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mct=
p->tx.pktseq =3D (pkt->mctp.hdr.flags >> 4) & 0x3;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
((pkt->mctp.payload[0] & 0x7f) =3D=3D MCTP_MESSAGE_TYPE_CONTROL) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mctp->tx.is_control =3D true;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 i2c_mctp_handle_control(mctp);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (mctp->state =3D=
=3D I2C_MCTP_STATE_RX_STARTED) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tra=
ce_i2c_mctp_drop("expected SOM");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o drop;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (((pkt->mctp.hdr.=
flags >> 4) & 0x3) !=3D (mctp->tx.pktseq++ & 0x3)) {
>=20
> The pktseq is the sequence number of the last packet seen, so you want a
> pre-increment there: ++mctp->tx.pktseq & 0x3
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (((pkt->mctp.hdr.fla=
gs >> 4) & 0x3) !=3D (++mctp->tx.pktseq & 0x3)) {
>=20
> With those changes, I can get control protocol going, and multi-packet
> messages work. There's a couple of failures from unsupported commands,
> but otherwise looks good:
>=20
>   # mctp addr add 8 dev mctpi2c6
>   # mctp link set mctpi2c6 up
>   # mctp link set mctpi2c6 mtu 254
>   # systemctl restart mctpd
>   # busctl --no-pager call xyz.openbmc_project.MCTP \
>     /xyz/openbmc_project/mctp au.com.CodeConstruct.MCTP \
>     SetupEndpoint say mctpi2c6 1 0x1d
>   yisb 9 1 "/xyz/openbmc_project/mctp/1/9" true
>   # mctp route del 9 via mctpi2c6
>   # mctp route add 9 via mctpi2c6 mtu 68
>   # mi-mctp 1 9 info
>   nmi message type 0x2 not handled
>   Identify Controller failed, no quirks applied
>   NVMe MI subsys info:
>    num ports: 1
>    major ver: 1
>    minor ver: 1
>   NVMe MI port info:
>     port 0
>       type SMBus[2]
>       MCTP MTU: 64
>       MEB size: 0
>       SMBus address: 0x00
>       VPD access freq: 0x00
>       MCTP address: 0x1d
>       MCTP access freq: 0x01
>       NVMe basic management: disabled
>   nmi command 0x1 not handled
>   mi-mctp: can't perform Health Status Poll operation: Success
>   # mi-mctp 1 9 get-config 0
>   nmi message type 0x2 not handled
>   Identify Controller failed, no quirks applied
>   SMBus access frequency (port 0): 100k [0x1]
>   MCTP MTU (port 0): 64
>=20
> I've included a patch below, with some fixes for the above, in case that
> helps.
>=20

Thanks for the review and patch,

Definitely helps!

--0+9N5QmAVCKw6LCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN3LdQACgkQTeGvMW1P
DelyOAf/acUJiYJrPvLnKdUrqx713+RANTqDPC9rQBe8QrUACkAOZVBxkwlx2kAe
/HlCIjubWB4IsO1572xvM5RG1KU4g6a2ItUx5D9LdU72Z0I2f+HKjFYnFRL6PyYU
ihGIKQnFXMLVEtxq/eS7pc7my9MrYboIylo/vAsQChnNE3u8M7RJE+yp8Og5XTIs
YGoZ1GV2hgavSkDRPJAtv8WX9JUqzsUvn//urGuPNDIvsJaNM402nfKSBkZQpDD0
yhn720xEk3uHOTD0Ea8EHG+Lgbsqhsnw9peES9EZA+0W8SzdVmkVcZlo7Gvb0YPi
oYrgFYHeBe+/j4MF/Q05TlZ7Hm1UOQ==
=TZ/3
-----END PGP SIGNATURE-----

--0+9N5QmAVCKw6LCu--
