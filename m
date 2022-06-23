Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3137754lft;
        Thu, 23 Jun 2022 10:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLJRtmuDgdbfFTQUVBMIb+EwDI/Qxjg0V7DKUv9ZVg2eYNVtJIXE6DosMnaIr3v6m0mbhc
X-Received: by 2002:a05:620a:2408:b0:6a7:62b5:8cee with SMTP id d8-20020a05620a240800b006a762b58ceemr7410529qkn.327.1656005896797;
        Thu, 23 Jun 2022 10:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656005896; cv=none;
        d=google.com; s=arc-20160816;
        b=yZJC+YGeWyJpTnxbvqo+MjFLb5YjY2uRpr+AjQbs8ZZz0IsoeFjSlA+YP/arrWwHCc
         2Il3whA52v7VdMIu1sxIEtvlqN68zGs9UKIYFT6dvQQDExrBQ2oD/F+nqxwn5K2bVHUa
         F9O1Z+ZoqjZ+Hkg8OfcR7AaautzPPQuJ14vOZ8kz3rkC20Qq5zLNrnrK6krVr4I01ntQ
         TGIr8ChVR6HOooz4E2XL2lqCoQM0X174ovgMknyKiUkPShGt8RxCCJ8BSHVG5LXO/Q6B
         so7VnpRYGrT7fgUF15rTiFXbHbbkDzox8q70wPCjbCfrOO8F15VYDjsZQYtzqbfuTFtB
         c4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BsOR0Drrg8NbjN8hlHDn9mzbKAw7sN1c8D4d1r5DoKw=;
        b=xyVQ2uAd9L3AZNC0zX2V9AswzhVqQR7u6MNvfy8pLLzFCfis7OZCDdQUL7TVUYtshO
         6kcagRQFtSqqbeO3uxQbBZKz9CcILTea0DOn+PFAitPXkLUKTLdzNQUqvUby1vw/Ygfq
         Sewm/xBVOL8NbBvhVvNhf3u4LVxUA3TSSkug/ekU0w1x7O3PGBM6+r5dIkR53+q26vBf
         xMkUxncktl18NodTASTtqvdktDxBc7GxB5P/jBJgPIkMmmdLBntBwrmaajSwJBK0J/5G
         UCvuU8DgjsoXuGplZdQ38BLybPadAc+hW8lsIqWj1cNV5FymtCYrtu6maaF1Bp0fMcF0
         6OBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=AHUrzddN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020a05622a031500b002fc26474292si15160347qtw.244.2022.06.23.10.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 10:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=AHUrzddN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4QmW-0008P1-AK
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 13:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o4Qm0-0008Ob-7o
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 13:37:44 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:41834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o4Qly-0004TK-1h
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 13:37:43 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id t127so5377325vsb.8
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BsOR0Drrg8NbjN8hlHDn9mzbKAw7sN1c8D4d1r5DoKw=;
 b=AHUrzddNxvbfQogky0AuzTpubdKMUskeAznKIpujPljNMjg/IyDAT0yXBYIFFd0YyD
 ZrKRZz6p0I/+XKV1MoI6fVlIxQ3zx/IrdJ2M3ptLsCRCpu+j3Tsz9UofEKnLj5aRmTlq
 5gcQqIFP+98fk4bBY2g/a0vc9REH1HoWvk/VYXSUY/4Jfxrt2UadL8furs0+kiC17Z4Z
 6yyxT6hTGbos2F7oj0kUaYZAXFWC0kE7YiMKBzew5hStwCUkyGfMCAGvJL9ODkK6MTez
 6NO65ZdszG91Tzn/3Flso1cQ5R1bN0Qn/K5vmR1djy+KsOFWwSLdj5pglMwxbctDk47p
 rMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsOR0Drrg8NbjN8hlHDn9mzbKAw7sN1c8D4d1r5DoKw=;
 b=nsSrUrXQFjLOqoGY370EZVHEbSQUBhgi1M/ITndtBbqTJ/0xgG+eIjSFljNPY28El5
 qkJ1BHHwCEJszlUSOzRYBQFEDkk6ZnLDwIeTMfgNiegQ/WYg/fmMQm4OpSmYEFMnH7ZX
 MLXhZNRH1MiJq4okll3cpZkoLU+9EV3j1GNoZwiSDHGtMllaNDQPV4Fp3ilxC37mAn4S
 gB1iVmWE/i1E6kTIYcS3v7eG837+Gwm2w48ighOJt34haz0VZjCG0RzoIbOqJ2aZyOgF
 k3LqngrV5cxFURJrqHgJhRt17zW6KSltNBzK1lS1YCYyhPMeJOLuypQtmFU3CrQZtgBT
 zDZA==
X-Gm-Message-State: AJIora8tb4gq0P6xU27hP2/AYHknpqzsy1aT9AXAm82mhiCG3DUCw4uc
 +guN9505zR9KoZvK0Dnd/ghigIk2hUqsdpZ7Q4KcAw==
X-Received: by 2002:a05:6102:3570:b0:354:531b:6b9c with SMTP id
 bh16-20020a056102357000b00354531b6b9cmr7578448vsb.57.1656005859715; Thu, 23
 Jun 2022 10:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
 <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
 <f4d49ce6-f4b6-66fa-e980-43c185652981@kaod.org>
In-Reply-To: <f4d49ce6-f4b6-66fa-e980-43c185652981@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Thu, 23 Jun 2022 10:37:28 -0700
Message-ID: <CAO=notyrQ3697_79_HtGCO6MryA72LHhaAvf75QLpdR5LH+O4w@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Hao Wu <wuhaotsh@google.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Delevoryas <pdel@fb.com>
Content-Type: multipart/alternative; boundary="00000000000004401505e220e9f2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=venture@google.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: GpnZELbjpeMV

--00000000000004401505e220e9f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 10:16 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:

> On 6/23/22 17:28, Patrick Venture wrote:
> >
> >
> > On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com
> <mailto:quic_jaehyoo@quicinc.com>> wrote:
> >
> >     From: Graeme Gregory <quic_ggregory@quicinc.com <mailto:
> quic_ggregory@quicinc.com>>
> >
> >     The FRU device uses the index 0 device on bus IF_NONE.
> >
> >     -drive file=3D$FRU,format=3Draw,if=3Dnone
> >
> >     file must match FRU size of 128k
> >
> >     Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com <mailto:
> quic_ggregory@quicinc.com>>
> >     ---
> >       hw/arm/aspeed.c | 22 +++++++++++++++++-----
> >       1 file changed, 17 insertions(+), 5 deletions(-)
> >
> >     diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> >     index 785cc543d046..36d6b2c33e48 100644
> >     --- a/hw/arm/aspeed.c
> >     +++ b/hw/arm/aspeed.c
> >     @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState
> *bmc)
> >            */
> >       }
> >
> >     +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr,
> uint32_t rsize)
> >     +{
> >     +    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
> >     +    DeviceState *dev =3D DEVICE(i2c_dev);
> >     +    /* Use First Index for DC-SCM FRU */
> >     +    DriveInfo *dinfo =3D drive_get(IF_NONE, 0, 0);
> >     +
> >     +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> >     +
> >     +    if (dinfo) {
> >     +        qdev_prop_set_drive(dev, "drive",
> blk_by_legacy_dinfo(dinfo));
> >     +    }
> >     +
> >     +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> >     +}
> >
> >
> > We've sent a similar patch up for the at24c but in its own file -- but
> looking at this, we could likely expand it to suite our cases as well - i=
s
> there a reason it's named qcom_dc_scm_fru_init?  Presumably that's to
> handle the drive_get parameters.  If you make it use `drive_get(IF_NONE,
> bus, unit);` You'll be able to associate a drive via parameters like you
> aim to.
>
>
> I have seen various attempts to populate the Aspeed eeproms with
> data. The simplest is the g220a_bmc_i2c_init() approach. Some are
> generating C code from the .bin files and compiling the result in
> QEMU. Some were generating elf sections, linking them in QEMU and
> passing the pointer as an eeprom buf.
>
> The drive approach is the best I think, but the device/drive
> association depends on the drive order on the command line when
> devices are created by the platform.
>
> We could may be extend the GenericLoaderState for eeproms ?
> or introduce a routine which would look for a file under a (pc-bios)
> per-machine directory and fill the eeprom buf with its contents ?
>
> Any idea ?
>

So we have this in our eeprom_at24c module because we use it with Aspeed
and Nuvoton:

void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,
                           uint32_t rsize, int unit_number)
{
    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
    DeviceState *dev =3D DEVICE(i2c_dev);
    BlockInterfaceType type =3D IF_NONE;
    DriveInfo *dinfo;

    dinfo =3D drive_get(type, bus, unit_number);
    if (dinfo) {
        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
    }
    qdev_prop_set_uint32(dev, "rom-size", rsize);
    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
}

With this style call in the board:

snippet from downstream version of
https://github.com/qemu/qemu/blob/master/hw/arm/npcm7xx_boards.c#L305 that
we still need to finish upstreaming:

<snip>
     /* mb_fru */
    at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);
<snip>
    /* fan_fru */
    at24c_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 8192,
1);
    /* hsbp_fru */
    at24c_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 3), 5, 0x52, 8192,
2);
<snip>

And then we call it with the bus and unit, the pair of those has to be
unique for the drive parameter to work:

-drive file=3D/export/hda3/tmp/mb_fru@50
,if=3Dnone,bus=3D5,unit=3D0,snapshot=3Doff,format=3Draw
-drive file=3D/export/hda3/tmp/fan_fru@51
,if=3Dnone,bus=3D5,unit=3D1,snapshot=3Doff,format=3Draw
-drive file=3D/export/hda3/tmp/hsbp_fru@52
,if=3Dnone,bus=3D5,unit=3D2,snapshot=3Doff,format=3Draw

The above code snippet is what, I'm fairly certain we had sent up for
review before, and we can send it again if you want.



> Thanks,
>
> C.
>

--00000000000004401505e220e9f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 23, 2022 at 10:16 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/23/2=
2 17:28, Patrick Venture wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo &lt;<a href=3D"mailto:qu=
ic_jaehyoo@quicinc.com" target=3D"_blank">quic_jaehyoo@quicinc.com</a> &lt;=
mailto:<a href=3D"mailto:quic_jaehyoo@quicinc.com" target=3D"_blank">quic_j=
aehyoo@quicinc.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Graeme Gregory &lt;<a href=3D"mailto:quic_ggr=
egory@quicinc.com" target=3D"_blank">quic_ggregory@quicinc.com</a> &lt;mail=
to:<a href=3D"mailto:quic_ggregory@quicinc.com" target=3D"_blank">quic_ggre=
gory@quicinc.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The FRU device uses the index 0 device on bus IF_NO=
NE.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-drive file=3D$FRU,format=3Draw,if=3Dnone<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0file must match FRU size of 128k<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Graeme Gregory &lt;<a href=3D"mailto=
:quic_ggregory@quicinc.com" target=3D"_blank">quic_ggregory@quicinc.com</a>=
 &lt;mailto:<a href=3D"mailto:quic_ggregory@quicinc.com" target=3D"_blank">=
quic_ggregory@quicinc.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/aspeed.c | 22 +++++++++++++++++-----<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 17 insertions(+), 5 deletion=
s(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 785cc543d046..36d6b2c33e48 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/hw/arm/aspeed.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/hw/arm/aspeed.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -992,17 +992,29 @@ static void fby35_i2c_init(As=
peedMachineState *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+static void qcom_dc_scm_fru_init(I2CBus *bus, uint=
8_t addr, uint32_t rsize)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 I2CSlave *i2c_dev =3D i2c_slave_new(=
&quot;at24c-eeprom&quot;, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(i2c_dev)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 /* Use First Index for DC-SCM FRU */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get(IF_NO=
NE, 0, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;rom-=
size&quot;, rsize);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (dinfo) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(de=
v, &quot;drive&quot;, blk_by_legacy_dinfo(dinfo));<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 i2c_slave_realize_and_unref(i2c_dev,=
 bus, &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt; <br>
&gt; <br>
&gt; We&#39;ve sent a similar patch up for the at24c but in its own file --=
 but looking at this, we could likely expand it to suite our cases as well =
- is there a reason it&#39;s named qcom_dc_scm_fru_init?=C2=A0 Presumably t=
hat&#39;s to handle the drive_get parameters.=C2=A0 If you make it use `dri=
ve_get(IF_NONE, bus, unit);` You&#39;ll be able to associate a drive via pa=
rameters like you aim to.<br>
<br>
<br>
I have seen various attempts to populate the Aspeed eeproms with<br>
data. The simplest is the g220a_bmc_i2c_init() approach. Some are<br>
generating C code from the .bin files and compiling the result in<br>
QEMU. Some were generating elf sections, linking them in QEMU and<br>
passing the pointer as an eeprom buf.<br>
<br>
The drive approach is the best I think, but the device/drive<br>
association depends on the drive order on the command line when<br>
devices are created by the platform.<br>
<br>
We could may be extend the GenericLoaderState for eeproms ?<br>
or introduce a routine which would look for a file under a (pc-bios)<br>
per-machine directory and fill the eeprom buf with its contents ?<br>
<br>
Any idea ?<br></blockquote><div><br></div><div>So we have this in our eepro=
m_at24c module because we use it with Aspeed and Nuvoton:</div><div><br></d=
iv><div>void at24c_eeprom_init_one(I2CBus *i2c_bus, int bus, uint8_t addr,<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t rsize, int unit_number)<br>{<br>=C2=A0 =
=C2=A0 I2CSlave *i2c_dev =3D i2c_slave_new(&quot;at24c-eeprom&quot;, addr);=
<br>=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(i2c_dev);<br>=C2=A0 =C2=A0 Bl=
ockInterfaceType type =3D IF_NONE;<br>=C2=A0 =C2=A0 DriveInfo *dinfo;<br><b=
r>=C2=A0 =C2=A0 dinfo =3D drive_get(type, bus, unit_number);<br>=C2=A0 =C2=
=A0 if (dinfo) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(dev, &q=
uot;drive&quot;, blk_by_legacy_dinfo(dinfo));<br>=C2=A0 =C2=A0 }<br>=C2=A0 =
=C2=A0 qdev_prop_set_uint32(dev, &quot;rom-size&quot;, rsize);<br>=C2=A0 =
=C2=A0 i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &amp;error_abort);<br>=
}<br></div><div><br></div><div>With this style call in the board:</div><div=
><br></div><div>snippet from downstream version of=C2=A0<a href=3D"https://=
github.com/qemu/qemu/blob/master/hw/arm/npcm7xx_boards.c#L305">https://gith=
ub.com/qemu/qemu/blob/master/hw/arm/npcm7xx_boards.c#L305</a> that we still=
 need to finish upstreaming:</div><div><br></div><div>&lt;snip&gt;</div><di=
v>=C2=A0 =C2=A0=C2=A0=C2=A0/* mb_fru */<br>=C2=A0 =C2=A0 at24c_eeprom_init_=
one(npcm7xx_i2c_get_bus(soc, 5), 5, 0x50, 8192, 0);<br></div><div>&lt;snip&=
gt;</div><div>=C2=A0 =C2=A0 /* fan_fru */<br>=C2=A0 =C2=A0 at24c_eeprom_ini=
t_one(pca954x_i2c_get_bus(i2c_mux, 2), 5, 0x51, 8192, 1);<br>=C2=A0 =C2=A0 =
/* hsbp_fru */<br>=C2=A0 =C2=A0 at24c_eeprom_init_one(pca954x_i2c_get_bus(i=
2c_mux, 3), 5, 0x52, 8192, 2);<br></div><div>&lt;snip&gt;<br><br></div><div=
>And then we call it with the bus and unit, the pair of those has to be uni=
que for the drive parameter to work:</div><div><br></div><div>-drive file=
=3D/export/hda3/tmp/mb_fru@50,if=3Dnone,bus=3D5,unit=3D0,snapshot=3Doff,for=
mat=3Draw</div><div>-drive file=3D/export/hda3/tmp/fan_fru@51,if=3Dnone,bus=
=3D5,unit=3D1,snapshot=3Doff,format=3Draw</div><div>-drive file=3D/export/h=
da3/tmp/hsbp_fru@52,if=3Dnone,bus=3D5,unit=3D2,snapshot=3Doff,format=3Draw<=
br></div><div><br></div><div>The above code snippet is what, I&#39;m fairly=
 certain we had sent up for review before, and we can send it again if you =
want.</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Thanks,<br>
<br>
C.<br>
</blockquote></div></div>

--00000000000004401505e220e9f2--
