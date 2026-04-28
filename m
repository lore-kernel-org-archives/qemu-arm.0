Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D9FF886F
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 17:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHm1A-0002O7-Oi; Tue, 28 Apr 2026 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1wHm0x-0002NW-TH
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 13:14:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1wHm0w-0001IC-Js
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 13:14:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d74086e5bso11029943f8f.0
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396463; x=1778001263; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Fl0/h3nzidW/WKWzaLQox6loPwv8HC8F8fL+naMpu8w=;
 b=ekAHlnA1FfTeOOSKR6A7O8ZByS5vIOeuswbrWJu+0MbxVjvHZPvVDWSGaAHhP+5mHz
 9wJn7ZXInDbn3L+qx3z1NY3uYvvygmAK45uy3YjdJ7M2wTHzL4/M6XJOtl/3Hiw76+WA
 9+M4glTXgQBtcD1TRjgtpr/6XkB3T2ZJYcjT3PgPhcwSiiNeyFsskNHZ595fSwov6HOX
 qIMce4jCky5lYq+ZS629rBMDoh0CSXaojNbBtYcVf1rtWOys0GrUaV3w5e5kWKCf8IWA
 ysR0eIFMSsg/0SxBShVNzl0iysLUPC90hD0Ca7+c+WkhHgFWaujLSC5D03FJVSbfcNGg
 7+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396463; x=1778001263;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fl0/h3nzidW/WKWzaLQox6loPwv8HC8F8fL+naMpu8w=;
 b=LEE/AzE7z72BnXc/iwV/9CxiLOlO8SNlhYOi0DH7FcSH0BOaUovPL1qqM9eoNnAFDp
 Vv7JQEtp7kAmiKzUKNVi9XZcLOekBQjrDieOgXfBbFkLQLuE994bRUZr/jCK1KPs3Dix
 bGY5wT0DK8XpSE2kejo57K8GyvTLS1di9LDK5Q/TwHjv2o1ZnkY8GggRQaUHTMSR8EVq
 ok77VjG7EFq2rIBgE9uFx0Zg/qjVecBtF0PpVYJCM3Uu6hrThzc9oO37QR/v+GZ4dkXy
 H58kdaIZhmIeSMfqS66yElHx26Xh2SmxtZGcjmXmUEOgZOxrXe8giy+ToKR4jTEcpjLX
 GT9w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9WYC1uaW6dGbA5voDaJRrtZnv1pSrFspV8haDC79OdkJlTPVcR7WYV+ZKTvtpLij8QjQs/TUEmqw==@nongnu.org
X-Gm-Message-State: AOJu0YwHsS7NYVuZM/swqkBhAMxFlCQManZin57bNr1FnnKtOd6AMFu5
 nZOIs2BRGR6i+Cac2kNjF5OJYkQm8B9ZOGLOvhHVTYArWxEjADvUZsM/
X-Gm-Gg: AeBDiet9MeytTxk+M37QowPYrZezWhMzHTleaHn7Gp9+4qN8S2TLBs/Kwt645Rm0xOH
 ZlNsko6uhhDFDp+3IoqRWRU9IYMfO0igvssVKv8rtWW9EJ8zW57bc780zQNBjN1LIWXhdEAd6nN
 m9z1xPKQxgS5F3ZaZoAzGvFYyrlH2eeArGsFYyQR00MPYHbxuXZnO050mYOnCO6M/WJS4M7i8hB
 HZGNbXm51WjMjjfeKNKlqGe5rZHUOptct4+GHmwIlbIGfw4mdlTCiql840qpoE6mCThpFuEaNRJ
 cxuTQmOsZpF/NgwLJcTWAaqvS2lTngRImcrQUtMUIqyy9XlJAJZnVwpp8ocPIc00Jv+bfa41x4m
 6ZSyYN2D5SRoX6sV4TCEb1Tn2++IsKA6D3rTTPz/vecv7PSobZMvUQ28uTyW5PtBSIiSiZhMNPO
 Ow/kejXPbwUQliNbb0dF+vYlmoyBGaMBpdj5pmvkkGteqVXHzRe5EWDEIDbMq7NduXgLC8
X-Received: by 2002:a5d:5886:0:b0:43e:b020:f8a2 with SMTP id
 ffacd0b85a97d-4478f143dd5mr308702f8f.19.1777396463261; 
 Tue, 28 Apr 2026 10:14:23 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:3c42:efa3:bde3:4d05])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463d02f6a1sm8000371f8f.13.2026.04.28.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:14:22 -0700 (PDT)
Date: Tue, 28 Apr 2026 19:14:20 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] hw/arm/raspi4b: NOP all DTB nodes when removing
 unimplemented devices
Message-ID: <afDq7IehobyGYPtW@osama>
References: <20260420162114.308519-1-osama.abdelkader@gmail.com>
 <CAFEAcA_29onASJ7bOs6jFbM9Mmj_X-SrJ85hSWxCOa-4WbFA8g@mail.gmail.com>
 <9a0a42c7-a36f-48d1-9eb1-008d2565c342@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a0a42c7-a36f-48d1-9eb1-008d2565c342@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=osama.abdelkader@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Apr 27, 2026 at 01:07:00PM +0200, Philippe Mathieu-Daudé wrote:
> On 27/4/26 11:53, Peter Maydell wrote:
> > On Mon, 20 Apr 2026 at 17:21, Osama Abdelkader
> > <osama.abdelkader@gmail.com> wrote:
> > > 
> > > fdt_node_offset_by_compatible(fdt, -1, compat) only finds the first match.
> > > If the blob has more than one node with the same compatible string, extra
> > > nodes will remain active. using the same loop as imx8mp-evk.c
> > > 
> > > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > > ---
> > 
> > I wondered about whether it would be worth abstracting this
> > out into a helper function, but it looks like at the moment
> > only this raspi code and the imx8mp-evk do this. If we get
> > more places we want this we might do that, but not worth
> > it for two.
> 
> IIRC you were first against the approach of "use a real world
> dtb and patch it", recommending to "generate a dtb with what
> we emulate"; and we merged that as 'temporary kludge until we
> properly emulate the missing device'.

Thanks Peter and Philippe for the clarification, I would be happy to participate
in that solution too.

Best regards,
Osama

