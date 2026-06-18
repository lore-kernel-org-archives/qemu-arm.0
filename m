Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDD1CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 08:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa7ji-0002jB-2c; Thu, 18 Jun 2026 04:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wa7jf-0002hp-FX
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 04:04:27 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wa7je-0000XZ-26
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 04:04:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2bf2247e38eso7915095ad.3
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 01:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781769864; x=1782374664; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLAhpCXb8CR70BZayKJv189+g663L+Sf0BEOB19GJfg=;
 b=SCA0m+yStDdFa+XflFXIY8WiKT+BNnpyyzmNvdgUB2uRIEwQ4pd4BeT8ZSy9Xsu/lj
 w8j7cxmV1OYHHS6fSNI1iiuiVHGdR7LF6KSHqQFEGnkQAb52fc0eGKqzHnHwY8HzuZEZ
 SLRd5zGlofRiEDg8/vjAHA6+XgJmoEwfPjf6PZ2i7LFtJKZ1sWQ0jCe76+fyGRlcU5cH
 A3CdUUidg8sLyhYTVAYeAO/hQ/85phK5P/J6roe+/SUn/LAD1dhzcAL+hWCe52+jKj1M
 UPtSafbxXNcThRKSXh57e0ZpFS8bygnhmayYRwdHK/0QP7cXmK8aXiWh2LEalD6zUhVF
 622w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781769864; x=1782374664;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bLAhpCXb8CR70BZayKJv189+g663L+Sf0BEOB19GJfg=;
 b=D7TDgd9kJggd55/2oC80e2FcF5LdAgQZCS0SuHHjaYF2B1QSpykYDA7+YhPOOszXiL
 LY42WcnhW8Q/Ol3x1cTnYkWhcAEwHKs/J70W1A3U+17pv5QJTSobHlpYG1icMjJ4wbIZ
 3OuS/CwQMBoCi6qcZANphQXNxBgdHtladP1xPaf1lOpWRJMJRv+nVqoLJ/QHnrKT68NW
 qMtyWD7yJiuKRQf5TQPr9A1a4H/y87RUM2u0AoI+ut0ao4UULV+Zkx4T+v2TuEQBD+9S
 s6RebH57HAH2aUMZVQO/WWAhrq8MubmxNI01ck1bb1TPMRyjbc4FeaqIgCF5tThZKQEm
 ptMA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/xhbFjOj2Zj08w0SvBvn+3HjCMM24ZFXZ/upzbPeHisXTLeL7TpXCJp2i7X3r2+QcNFcx+K6KQoQ==@nongnu.org
X-Gm-Message-State: AOJu0YxRoECrT4rJ5tA14U6n+jpgENTyyMBwW+9dsV5WZaSzE8Wri77G
 CumCclsRUCkyjdN1QhboZxmlChkhJbfbKtUNtStmHP42wAr/vGFsw2/Q
X-Gm-Gg: AfdE7cmz28dnvXpSOd/tBhfBgzNpnVIGntmZ5p+h7QLj7445jEX5iPH545JNo/AymbL
 B3WrQtXKIKFz+LE/gsnjuYCFcx3ZS6VqrSWb544QEVcyEVop0gBibDEgr9PvG3/ZLSlfGWdmtKW
 g/NOQKQcTunDFzhAsjUcTllXPAL93echJG/5ZLNsIxpPTVdlUzMC1mxowNRMzKW+6zvM4lwfClK
 xTXKYaSkaKn9fn9ZvpdSyLLjDbEzCbiaGXjsvvGRnWyypnvjHpng98E9GQNsQxS1s4CIdPKc0di
 wINy94EotecSFJBmDop9dsDRZBVIcZ57YSBk4O+G4BbGZifyeZnQLBaOmmyOfT8187I9sYTG96q
 wPNo0vXbZlO2tOCvlmdikFHrdtu1Z+GKpORFSdvNUd3r7iB+RISmODckH6fGEiMiSS6Yt3fOp3J
 xheubjYrqEGgNND4hLKqnB
X-Received: by 2002:a17:903:950:b0:2c6:b816:43ba with SMTP id
 d9443c01a7336-2c6bc21ee45mr77387985ad.21.1781769864406; 
 Thu, 18 Jun 2026 01:04:24 -0700 (PDT)
Received: from smtpclient.apple ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c433557c47sm191794745ad.79.2026.06.18.01.04.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2026 01:04:23 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v5] hw/timer/imx_epit: Replace DPRINTF with trace events
From: Jack wang <163wangjack@gmail.com>
In-Reply-To: <667b7388-0a56-4eca-9590-748039dd2a4a@tls.msk.ru>
Date: Thu, 18 Jun 2026 16:04:03 +0800
Cc: qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 peter.maydell@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F581D203-AACC-48F5-BD00-2C642E198980@gmail.com>
References: <20260617161406.14705-1-163wangjack@gmail.com>
 <667b7388-0a56-4eca-9590-748039dd2a4a@tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



> 2026=E5=B9=B46=E6=9C=8818=E6=97=A5 15:15=EF=BC=8CMichael Tokarev =
<mjt@tls.msk.ru> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 17.06.2026 19:14, jack wang wrote:
>> Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
>> and DPRINTF macros, replacing them with modern QEMU trace events.
>=20
> Hi!
>=20
> I'm curious, why do you send these patches to me?
>=20
> Thanks,
>=20
> /mjt


To be honest,I am quite new to qemu and it is my first time to use git =
send emall to contribute so I am little confused about exact routing =
process
Last time I submitted a small patch to Peter and he kindly reviewed for =
me, and he still give me some advice.After I change according to his =
advice I tried to deliver the updated version to him.Since this patch is =
just change the #define macros with modern trace so I thought is may =
also fall under trivial category so I cc'd you as well. I apologize for =
the confusion and any noise this caused Thanks for your time
Wang


