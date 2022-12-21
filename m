Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5351812ejb;
        Wed, 21 Dec 2022 09:58:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXviTWwmCpmCkeeLyQzLxf8R5tCNJuuz3SXhmQkwQA8/zNUm5pX/Xphkd4MwSryYOmHFrHzW
X-Received: by 2002:ad4:46cc:0:b0:4c7:8094:ecaa with SMTP id pm12-20020ad446cc000000b004c78094ecaamr3240997qvb.44.1671645516703;
        Wed, 21 Dec 2022 09:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671645516; cv=none;
        d=google.com; s=arc-20160816;
        b=DjYsWQKuWsAIzEVJaGCryLDU5OnxIROz+Ir3a+dbuT86u52JbJNwWo16D+k+lXws5k
         xX1siHH3HbtAJzx1DwoAmMnIgPvFedVnmQUYo776PivCHRq3L9LdatEE3Cic4fLKHkbZ
         +j4adIBNFSFtNL2LQ10j3BS0EzPtMw5sEc5Clcf8+Iqy0jX8NSwPQxozTzhaTGxSbdYA
         VfeZGGWDFdr8Rbo07A9AWRef4nBWHm89hgX1kevSdujDS1AppbzVNSv+ZYRiHaFlKrZ/
         pIEuN6XjbwJtvHxWg3mR9kOJeAz1LIHidyh7ZLqTEHIsCiEV7LA0vpPsKu1XI1NZOKFD
         +cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cIB7bOqRoV+jCCK+MjlbRhBtB8ep4WaqUIq92CXaplY=;
        b=ejizgfyiUPiS+bTG1D1EFbfDTqScyq8dUq6UOojVbdi6mHLEdfLkwIfJr7FDZkIFkx
         r/JC6zwmqOwxPj1VoFBAc96e2VO5tpwk3XD/Ock9lCCQPP3jMInT63ZtQGYO4JdJAq6Q
         J6JKEf7O1cDZK3tGUyVsWST+se4ntUdJG1KQjk+xdesF9VINeckHZd24isD4WD/15RRf
         LYqtLIAO+0MxBpO5CO2NA//DQw2LhhviU8jAFbyo13xUGOUbbJGTxlKB+RMB0Ng8CS40
         tRj6GDUJcEZFA2kbx9LHE6uc1xHKQKlcpgEc7yLfg93YT0W81HHF8nnVh598nRpvJc5E
         BfGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DmPM7GwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq11-20020ad45fcb000000b004b3f32aea24si6880261qvb.395.2022.12.21.09.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 09:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DmPM7GwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p83MC-0006aV-5p; Wed, 21 Dec 2022 12:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slongfield@google.com>)
 id 1p83MA-0006a7-VF
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 12:58:18 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slongfield@google.com>)
 id 1p83M9-0003aT-Fu
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 12:58:18 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id 128so15440590vsz.12
 for <qemu-arm@nongnu.org>; Wed, 21 Dec 2022 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIB7bOqRoV+jCCK+MjlbRhBtB8ep4WaqUIq92CXaplY=;
 b=DmPM7GwXuOQXzj2OP7hHEvqsiL+muOptG+jl9/1Wkq2icM6phYzvX4WOCI56O0A8Lf
 M06blPrsosxktclr25S166NcyM/jx+sVw/SiDfLEoaDWd6bWOKFzUGermjaeR3d+Dk8x
 nVYqkppsZI6RqsxIBpZd9aH8nFAuxcXQ8+OqjvL++3ZBu7cikgVYStt/PZZfxHv04ULN
 z9i0lSxd+2eVSPmorzDsf8PKwxoXPJTBBd3EQyKI0oqftv9xyLH9QAs4crDSaKaksDZS
 Unv46jVI3JL5C3eo8tchDdO0liOsHJH7Zb3No2oSkmgaHyiEoszs7TCBbfPLSZMIItOd
 gIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIB7bOqRoV+jCCK+MjlbRhBtB8ep4WaqUIq92CXaplY=;
 b=TOLhwH6UjjqyRj+7HDLoBg+VLGdwh5JUHqnUbtuB0Jz8l1cQAQEIZnYBDJXwJbYuLi
 HoM7gWPeKdH9nzDmocPe1Y84zKyXb5a8Qe0TGg69NrCPPcYJmCepRpRrKZa+WwCNTdB5
 AfzAE/aHSTj5xfExDCwIzGDPWnTjNEGmequUd4Ulh2PcpBaugFV17jEfcQQAGAkVSILV
 DWUHVzE9lLEdd58GWnMihCjperQWMvxB++eddwFbq/9HqkgkHs/JOEiaV7fnlP8P0KM1
 wJkznodCgi3b+R7GUXqSm5dNd3jKKFfilPNm+Oipdw3IVtDgYkX0c225DlSGGVMvDQLO
 dWCA==
X-Gm-Message-State: AFqh2kpQHbFN9CQUUEalVnFtI/JuGlMEdaQBeGx4LDtKiWcrY/b4Iu2x
 VZmnzBoazHy5YUUIfd2m3RPylI6CieEkojeb+Gp+0Q==
X-Received: by 2002:a05:6102:7a2:b0:3b2:e40d:1d9b with SMTP id
 x2-20020a05610207a200b003b2e40d1d9bmr323660vsg.51.1671645495712; Wed, 21 Dec
 2022 09:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20221220221437.3303721-1-slongfield@google.com>
 <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
In-Reply-To: <587d650e-fba3-ba44-793e-919dd6f75a90@kaod.org>
From: Stephen Longfield <slongfield@google.com>
Date: Wed, 21 Dec 2022 09:58:04 -0800
Message-ID: <CAK_0=FLEiWQMWqzkM_EZ4VCzwRYeTbN9djuFgDR1EwVAZ1oALA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 andrew@aj.id.au, joel@jms.id.au, venture@google.com, wuhaotsh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=slongfield@google.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: bNI7pzfcXEd0

On Tue, Dec 20, 2022 at 11:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> On 12/20/22 23:14, Stephen Longfield wrote:
> > With the `size +=3D 4` before the call to `crc32`, the CRC calculation
> > would overrun the buffer. Size is used in the while loop starting on
> > line 1009 to determine how much data to write back, with the last
> > four bytes coming from `crc_ptr`, so do need to increase it, but should
> > do this after the computation.
> >
> > I'm unsure why this use of uninitialized memory in the CRC doesn't
> > result in CRC errors, but it seems clear to me that it should not be
> > included in the calculation.
> >
> > Signed-off-by: Stephen Longfield <slongfield@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> I think imx_fec.c is impacted also.
>
> Thanks,
>
> C.
>

Thanks for pointing that out, looks to be exactly the same. I'll send
out a separate patch that fixes the issue in that file.

Best,

--Stephen

>
> > ---
> >   hw/net/ftgmac100.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> > index 83ef0a783e..d3bf14be53 100644
> > --- a/hw/net/ftgmac100.c
> > +++ b/hw/net/ftgmac100.c
> > @@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc=
, const uint8_t *buf,
> >           return size;
> >       }
> >
> > -    /* 4 bytes for the CRC.  */
> > -    size +=3D 4;
> >       crc =3D cpu_to_be32(crc32(~0, buf, size));
> > +    /* Increase size by 4, loop below reads the last 4 bytes from crc_=
ptr. */
> > +    size +=3D 4;
> >       crc_ptr =3D (uint8_t *) &crc;
> >
> >       /* Huge frames are truncated.  */
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >
>
