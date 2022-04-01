Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp648478lfb;
        Thu, 31 Mar 2022 23:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEfroOgFbLX20EoBxWpa8zZoXs477UnLQnejnZ+ik11rX6KbSSk8krUAf9WpijQMxRGWKu
X-Received: by 2002:a05:6214:20a6:b0:443:5818:ade2 with SMTP id 6-20020a05621420a600b004435818ade2mr6815011qvd.84.1648794792677;
        Thu, 31 Mar 2022 23:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648794792; cv=none;
        d=google.com; s=arc-20160816;
        b=Rt4OYdJKFlkTchoOEmMm2lTZl76NwFIY0l5FEVtHszYHjA5NVsGE2ZTqxJfLedP6R2
         HRAe3Q/GS++RrK5RG1UiKcoKemQnUpuaQ8EipGwOGkFbZASj34w3xSak9l08WK8nFr/y
         jlW+l2z3KMaJAGa5Qnw0c9muQrBwiSbvOm0/nDXSoe+jD2GXlD09vjTafpuns2mhMlv7
         zG+b/pTw5EHGGXVhoxFHJrEx7XetPjXLpDaZhs6lIKHFXW9k0VN5QI5Zvz+cmM38cCjR
         uWFSoaVPERoqB/OLLQhAxlnj0cnzge/1syXdQ1HUadj1oxBz8m6bExkrutnC2Kgnuz/r
         Fb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature:dkim-signature;
        bh=rmxuBU5Ss+vCVyRV1OjgMNmbd8PheO0tHibWUCm+8Ws=;
        b=Gtf14HEhKOo3Nv7LoB/cYi38/8qWijD2zb0VrRfSYyrw8fIaGb07unBvuw2xiJolsn
         AJhecTKpg4izCE8JQ7Da4Z6P5K3+aRIQp9/6S/+fAmanq00VqQsECAVcMvOeyN1cSg9J
         B0YtKtrSWQ8TJFi6fHNH/Gc6VDyBKYpVw0RArYbDMBCKKnpoQfQkkU5x8UbvDMf4gT3K
         J/Ku0FWEEYvuyddZD9Lbz8kQCbtS89jx3yetc27uCT+LN4fipLelt49mKXvC6sG67wxg
         2aTW5n48gl7cD6YfSjeskBzlrmJMNWH26RakF9RWogRyKZmOPvDYe+NGTXDDd40SzdGn
         nHQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=qVw3UO7V;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=YKdzeZqj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a63-20020a376642000000b0067e4be237cfsi822747qkc.20.2022.03.31.23.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 23:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=qVw3UO7V;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=YKdzeZqj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naAqN-0001yy-EL
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 02:33:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1naAmc-0001yj-8T; Fri, 01 Apr 2022 02:29:18 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1naAmX-0007jK-M2; Fri, 01 Apr 2022 02:29:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 656AF3201C39;
 Fri,  1 Apr 2022 02:29:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 01 Apr 2022 02:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=rmxuBU5Ss+vCVyRV1OjgMNmbd8PheO
 0tHibWUCm+8Ws=; b=qVw3UO7VGvSSYZh5kf35U6NDmrJj1vYaQEOfCk+4BuQBiM
 4kotvXsgzT2kyoGZn9dcutArsfczDAwF6RweSFaoyjKx7gN6H7efZwei9t4ry0EX
 JsTIzvIisjiStp/qFrQ/1BPRWCyp9Y48q/fgTOrdOFrp94AXtCgLzatZ7B0Y4RVZ
 8NWrkDeH6PRPF0Ifne06x7q88m9wH0oEbz8JJL27+KAL3mKpHQVVTsV4t/2AhXul
 Qs3AIA+H6Lc2bkNwn/Y2GJSpagRHanqc5a7Cn8hTgGLY+offdnaSYbntXxDICehQ
 ahvpBktbXqocN0CMahhSyYx2AxAbC7M5yD2QYKnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rmxuBU5Ss+vCVyRV1
 OjgMNmbd8PheO0tHibWUCm+8Ws=; b=YKdzeZqjacENFHbx130hOS5lXD2p03kzu
 TibS46+kNbh+74JgMLzc0KFLtuWx6va49J2iQP0JclDYggxyB9HdwTw+WSxePfQc
 VbvzadheFpQOg9SNyGqI4l/bAmhh7Oe3YCXw6sWEGqK+XUAdV+Jgf+0Qitib75di
 HzhrQxlr5GnCVcTCsjQlhwk7Lo3bjNpRzQMNplKcWI/In6kRaW6RusyOSmFEFB/H
 bAuP1FUn2WJR2WhFZhpre+/AVx4i/PpnAn4LiqKyPhJbdNMVQg2WwpbCnU2eexPz
 7poE+kaXxHHUkBVZSSY0v0nreELmZCcneM/LRdPsSmO0qiBGPDOPA==
X-ME-Sender: <xms:s5tGYiwm2r5pfaSO6eDRrGkRNTA3FLKcAlKk-n95Ual86MTNqsyn7Q>
 <xme:s5tGYuTks-FHgSnSCxHHsQYT0Bo9K-VKaesJLtbHyKWAMvPicgHSz0UWGU9Foy-sO
 wwyDZHtPfJ4QsapGOU>
X-ME-Received: <xmr:s5tGYkWlzWqIxmvHca91hrSjBZyaaEs3NgMJhcMf-YA2dmo3vVY_ZHRNqnokOXwih0luiGOGRysHeV_jA5c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeihedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:s5tGYojIirKRX1nHYwijNq52XV9OTgqghLIx4GZSU7FV0gunjKf6gg>
 <xmx:s5tGYkBW5b6juH1RgINUSo__SlqT5B29GLFHMJ4OQnQCFBeHU9Bv1A>
 <xmx:s5tGYpLVCdctXoDeseUQU0t4xLCtgK-tiS-jAyNFxe-V4hd1UpQdQA>
 <xmx:tptGYg45t1tJ62u3BSTKHxKQmXOaypBluz7pdHDc-PdC8t_lj89iVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 02:29:05 -0400 (EDT)
Date: Fri, 1 Apr 2022 08:29:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Corey Minyard <minyard@acm.org>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <Ykabr0wQe9VLISu2@apples>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331203205.GB29333@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wNNz7fwNrt/x6wb4"
Content-Disposition: inline
In-Reply-To: <20220331203205.GB29333@minyard.net>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Jeremy Kerr <jk@ozlabs.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hTkPVVeD/TpW


--wNNz7fwNrt/x6wb4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 31 15:32, Corey Minyard wrote:
> On Thu, Mar 31, 2022 at 06:57:33PM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Hi all,
> >=20
> > This RFC series adds I2C "slave mode" support for the Aspeed I2C
> > controller as well as the necessary infrastructure in the i2c core to
> > support this.
>=20
> I've been wondering when this would happen :).  I had put some thought
> into how this would work, but hadn't come up with anything good.
>=20
> The big disadvantage of this is you are adding an interface that is
> incompatible with the current masters and slaves.  So you are using the
> same I2C bus, but slaves written this way cannot talk to existing
> masters, and masters written this way cannot talk to existing slave.
> You could adapt the masters to be able to work either way, and I suppose
> some slaves that could do it could have both an async send and a normal
> send.=20

Would it make sense to introduce a QOM Interface to differentiate
between the slave/master types?

> But you could not adapt a slave device for the Aspeed to do both.

Exactly, the Aspeed must be able to defer the ack, so it cannot
implement send(). Even if it buffered up the write, I don't think it
would be correct to Ack the transfer until the host has Acked it.

> But that said, I don't know of a better way to handle this.
>=20
> You don't have the ability to nack a byte in what you have currently.
> That's probably something that will be needed.

True. Didn't consider that. Since the ack is basically defined as the
scheduling of the bh, I guess I have to come up with something where I
can also pass a "return value".

>=20
> This is obviously not something useful by itself.  How do you plan to
> tie this in to something else that would use it?
>=20

This is specifically for implementing an NVMe-MI device which uses MCTP
transactions (in which both requests and replies are master->slave
transfers). I just wanted to get a feel for how you maintaines would
envision this begin done before posting that. The NVMe-MI device will
function exactly like the example i2c echo device (i.e. receive an MCTP
transaction using the normal i2c slave interface, parse the
transaction/request, master the bus and start a new transfer).

Thanks for your comments Corey!

--wNNz7fwNrt/x6wb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJGm6wACgkQTeGvMW1P
DelcWAgAuffOgOL6hsIf62K6Ht4aDhZ5FJ/wgL0g4E+ofQ0CPxsEdVO+OTiKpASr
u+9hz2lOs/iW3YnAFzMTz9vHTtoQsSdXuRiN3CA/cPiBvM6tVp8Vtt2QHV1NjWam
F4sWoYpqXOwbjfzQT06VYgZbMex+N0egxUfBNjm7zDIsM4kaqR8Sql2Ct1noYkNr
CfzIKh19/OIW58EhUb/RUKn++FX1j2KFMhZaPhqKaOv57E6Ah8NODhkviyLqBBiM
73M1WhHbyrIq2cXXXRMuuMzRvu4LPgRwloxyBQzMeEEO8nAv3TY3+p4j/AdztY73
e9xXy7TfVf4qoQqG2VODMJRBGzMSPw==
=dg3E
-----END PGP SIGNATURE-----

--wNNz7fwNrt/x6wb4--
