Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB8DCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:15:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENZa-00065Y-I0; Wed, 07 Oct 2026 05:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xEKsa-0003Eq-3H
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1xEKsI-0002AF-C0
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 02:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791353481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KjBGitEkOT6/H3O0Jz3UU2krKy3QWVZjrAiPk8YehM=;
 b=WtIIQfh5oUPZrGfw7Dol6srCAmDQte8VESTes8MDrABggIQ/c63kYlCjRaOfooTSNow3Ga
 8ztmytunbCsnA8yOE+l0f1h0XJbPj7aXhj1+cZQFIx+YhTZGRZydrtJ3YIBPWipk6cxZ/b
 A76haY++eMz5hK7NicQ1vrE7fKJCrJQ=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-W0CUrtqGME6dqPnydqSGFg-1; Wed, 07 Oct 2026 02:11:19 -0400
X-MC-Unique: W0CUrtqGME6dqPnydqSGFg-1
X-Mimecast-MFC-AGG-ID: W0CUrtqGME6dqPnydqSGFg_1791353479
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2e601800e58so9804305ad.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 23:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791353479; x=1791958279;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0KjBGitEkOT6/H3O0Jz3UU2krKy3QWVZjrAiPk8YehM=;
 b=yTujgJHR7BlnN81T92exXxKn+4eDwYkFcE6UjXRxyMIM8S9p/euYac/nJKXl4WDEbi
 jKyvK+oSMXX09rrrGCmVzNvUJlzLyYP1x1kM1pPqeCnglFubqtMkKE8REdS5yZUwzT09
 ugHVCji9veby/5e2B4Y4f0+Zj0OYx/Jn5wCqfeNxcorSdVNV1JFzOMfi9ajZvJI9qDvG
 z9i46Z42K1/ldPlIOZFASnmt//IaMdMz44PtubXt9YlQYLO3MmAmQ5oZDFCWhr4F3nJ/
 p9DlrsnyZ2mC0bzc4RsJ5EySs+IRIeyHZmObty7+CynhFtPLn04k/PIDY8fa94cb8q4i
 n+JA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxrTy+iINTXUKBXwfdCisgY4RkWvNlazE0OOC77okOyS+W1CKQ3cmgdsOHCrerXbArWcsNXjWk2Q==@nongnu.org
X-Gm-Message-State: AFq9FYLrmJGoi2Mf0M2oxLMtMo4hVnvoUpWGExVjIC03+MjJA2UJaV/J
 4rBCTufDw4ARDTMBMma9D3u0mprO/N1DU+6egF+hqX2s/R4hTIFinbGwzSJLxse/6Tdx4IE5NJZ
 qbwxUD90xmAxvsqhkgHfsP34BCWR5m+zSvMmUkxAs1GQ/Z4/3HzMOr0PRkFeS1GQcuCpMYxWD0O
 Erid2xptU3jnBeg4mXmrOh1c/VidYe
X-Gm-Gg: AYBFou1yEhh6U8e8B4b88flFDy7EL4coijgkL64CYKwl6IH4bz1ZwBvHbgWPXv+xpNH
 HNtYT4PIdYyMCc+jy4rrVTgI99mVBGXQ6Ga3fpdmEAhnecZZnuWR0BrFiPiT422G8RMnhJeQkG1
 3SYAzqPQpdR0zZiCAcyKtz7QpM8zm3FosjdutDEjLVum1YUvzNREDynwuQVadqe0a7aDMT4QkGH
 M8QZgD38kvBea7YaQw+0wn7Tsqd3gfWYQHOoDRuicV9Fz5c/u3SgdP93tQuA3eYZrFdH3fO7w9N
 9w==
X-Received: by 2002:a17:903:2c10:b0:2e4:b112:14d with SMTP id
 d9443c01a7336-2e60054442bmr11393835ad.54.1791353478709; 
 Tue, 06 Oct 2026 23:11:18 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2e4:b112:14d with SMTP id
 d9443c01a7336-2e60054442bmr11393675ad.54.1791353478256; Tue, 06 Oct 2026
 23:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261005032022.3980903-1-jamin_lin@aspeedtech.com>
 <20261005032022.3980903-3-jamin_lin@aspeedtech.com>
 <179119075845.699310.5944945395562648270.b4-review@b4>
 <SEZPR06MB736267CA04EA7BB0EE82D87DFC942@SEZPR06MB7362.apcprd06.prod.outlook.com>
In-Reply-To: <SEZPR06MB736267CA04EA7BB0EE82D87DFC942@SEZPR06MB7362.apcprd06.prod.outlook.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 7 Oct 2026 10:11:06 +0400
X-Gm-Features: AclHuK9YhCBll7k6ee6cr2xOKlOWG5fTekkMuOlJEvKfQxFPaHMc_LiizB4zZ9U
Message-ID: <CAMxuvazTUQ7Z2c2+6mUpKr1EJgaVTdxYqyeyZgb7LMRbAXfrEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/usb/redirect-server: Add a usbredir server
 device
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "clg@kaod.org" <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a3HB-UxAJaCybDFTgFp2z15NgAI-mGfp4eiR1jk_qqs_1791353479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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

Hi

On Wed, Oct 7, 2026 at 6:16=E2=80=AFAM Jamin Lin <jamin_lin@aspeedtech.com>=
 wrote:
>
> Hi Marc-Andr=C3=A9 Lureau
>
> > > diff --git a/include/hw/usb/redirect-server.h
> > > b/include/hw/usb/redirect-server.h
> >
> > What do you need a header for? If there is nothing to share with other =
units,
> > better keep it all in .c.
> >
> > --
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Thanks for your suggestion and review.
>
> Nothing else includes it. The main reason for having a separate header fi=
le is readability.
> redirect-server.c is already about 1600 lines, so I thought keeping the s=
tate structure
> and constants in a separate file would make the code easier to follow.
>
> Would hw/usb/redirect-server.h be OK instead?

Yes - I don't think we have strict rules about headers

> If you still prefer to keep everything in the .c file, I will move it the=
re for v3.

That would be "my" preference. I don't mind large files as long as
they don't mix various concerns/domains/levels.


