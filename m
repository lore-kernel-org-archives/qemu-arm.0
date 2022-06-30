Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp599813lft;
        Thu, 30 Jun 2022 12:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tt9ROm8X8l/Fue+xf80wuRC5n8bluMLNTTOGkpv49Jouu0stPdAjjtk9beBOgpcsKpSnlO
X-Received: by 2002:a05:622a:190d:b0:31d:2ac7:9dc2 with SMTP id w13-20020a05622a190d00b0031d2ac79dc2mr5092212qtc.233.1656616658539;
        Thu, 30 Jun 2022 12:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656616658; cv=none;
        d=google.com; s=arc-20160816;
        b=WiKpCF7EssJ2h4jdh8FWaEeV/DZGf2B80JtTPWUDX1J1ng2uckKhw2mml/s/UGHceK
         1b6gj/yKFP80zOqWjMe+9v6Z56yjIO+BVTuBDlpcv2uXOUDG29gGXCReuLC6BYyPXXqG
         IU71RGdkJoaXLOe96oUq8d0AhkkHCx4rWt4yT46TInkmAVrJ/h1LEPrI+fXMBi5EtMkE
         o3RvDO5yolm3diwowBiX/Tx2p8Pm6tee533eXBxNDhRjJbKkCRLFL1V4iLU7K9d/ryb9
         BSQDR0woW/F0fTE9zJ16WV9lU2YYRcsz9tbeHaVaqWepvxswlLacH14MhSsoSkGyFm7u
         S/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FQSEROxB1ZEETv/NwPSkNBfTJLiVZOHdBv6PNc25cnk=;
        b=BnMoKL2MaXam8IqXqGHzl/4pck+s1fjwUJuAfbdn8n3rNY3QSe+6puWMShvj7pi+sw
         BG87kkiZUvs2e01glaKSZ/7Zodm1hwmV9QybwHuqELIAZ169QcpuN2SbFW/gYPbISkg1
         bcaEvqo4f5TFOV9Cyq08DR9D1t5B08/gpoi0EvtZ5Bdk531KDCCJGbDYYKx3gp+j1gP+
         LNcHiYOJN6do0/F+lWlJ3IdayNXFAvLog6ZBb9Z7j8HywFbNlabNOFbWsMsE6q1+xoiB
         AFX3SfU69lXCu0dpY9B1fVhsB6Njmqg2ot3I/0FClF4GVyr22Ryp5EGF6GJZM8LRdiAK
         LhcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=eqJhThCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05622a001100b0031c4793bdb9si4687757qtw.237.2022.06.30.12.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 12:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=eqJhThCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6zfW-0001BW-1x
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 15:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zew-00019S-SF
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:17:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6zei-0008N0-Bk
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:16:51 -0400
Received: by mail-ed1-x531.google.com with SMTP id c13so119316eds.10
 for <qemu-arm@nongnu.org>; Thu, 30 Jun 2022 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FQSEROxB1ZEETv/NwPSkNBfTJLiVZOHdBv6PNc25cnk=;
 b=eqJhThCrevIeeeUvsSqEtYmF2GvFvXArgqxjnA083YSc2QnDVlXi7z/jHvgjuS/YAq
 N3xd+YQ35fk/vZBXfDQSSM2vm9ZIlcUZTn4fu5ZJ6M/s8fRP9vTSk3wdsmDNGpaK7FXV
 1B6H9PXaGIFlveTEQgW4yK49EnArsFL+M11ZDY4W4Ae8NeL+06koicEPZnsrLeLJo8K1
 eKIzCxddx+kux11rJ4llB7MCD/Xxtjd/yIevAnTevsaxJpc8y48mLuDRoaNygcOfFkH2
 7nVzytdW+LXwXgFUtvqh+TkAI38ZEUnSKgwdlVTEEUb4ym1goEoy37Zb6aR2mu028z+N
 ACcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FQSEROxB1ZEETv/NwPSkNBfTJLiVZOHdBv6PNc25cnk=;
 b=S+qmiYI7X/bZNPrCc758oMOlHI59wa/IiHn0bJTGimVVsaOXX+Gboz4DVfxXjcgqG7
 jmKKMyja0LHuPKy5anWiUfRavJPCKnG3e9KfI9CIFXd048/bA/Z+ImJh0cd+7zty3Aw8
 v9EA03dhZ0hhTaw+XN9EnNIyC9cTAsdleQ72B3jIQDSnBKuD6kYRn3ilXXzt3XEYGL12
 KDn2KK/ezOyfw33k8KEp/J306Dqv/D99QKyaNKrYpF7Gp3LuD865TX8pb37JusH747cV
 FE4EsG6zhORCz/NW/QCZBUKNvEnuycI40zhqZ9bfgMQA5cCGosPFW9KVrKbzfdt9+f9H
 LuLg==
X-Gm-Message-State: AJIora8hVYCrCNLwJ9TudkGZCcGkdLetJR+tVN7RHwmwSuTDWcjhvM9D
 74IEXG3+q8Zc+7E7xoG0fCT8OdKGNBLjLKBg2EfxMg==
X-Received: by 2002:aa7:dcc1:0:b0:435:5db1:c749 with SMTP id
 w1-20020aa7dcc1000000b004355db1c749mr13530384edu.124.1656616605126; Thu, 30
 Jun 2022 12:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-11-me@pjd.dev>
 <293da11c-dde2-e646-c754-820720c410de@kaod.org>
In-Reply-To: <293da11c-dde2-e646-c754-820720c410de@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 30 Jun 2022 12:16:08 -0700
Message-ID: <CAMvPwGpZZgAd2RHXmvmxfgyTyVGd6Rx+avj=E24NWc0masdc=A@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Delevoryas <me@pjd.dev>, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=titusr@google.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vIlKXnfMf+fx

On Wed, 29 Jun 2022 at 23:30, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/30/22 06:51, Peter Delevoryas wrote:
> > From: Peter Delevoryas <pdel@fb.com>
> >
> > This adds the ISL69259, using all the same functionality as the existin=
g
> > ISL69260 but overriding the IC_DEVICE_ID.
> >
> > Signed-off-by: Peter Delevoryas <pdel@fb.com>
> > ---
> >   hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
> >   1 file changed, 28 insertions(+)
> >
> > diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> > index 799ea9d89e..853d70536f 100644
> > --- a/hw/sensor/isl_pmbus_vr.c
> > +++ b/hw/sensor/isl_pmbus_vr.c
> > @@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
> >       pmdev->pages[0].read_temperature_3 =3D 0;
> >   }
> >
> > +static void isl69259_exit_reset(Object *obj)
> > +{
> > +    ISLState *s =3D ISL69260(obj);
> > +    static const uint8_t ic_device_id[] =3D {0x04, 0x00, 0x81, 0xD2, 0=
x49, 0x3c};
>
> This looks like an ISLClass attribute to me. In which case, you wouldn't =
need the
> reset handler nor the 'ic_device_id_len' field.
>
> Thanks,
>
> C.

I asked for this because, so far, I've been doing all the register
defaults in reset handlers, including read-only registers.
I don't mind either way, but it seemed preferable to have the devices
consistent.

Titus
