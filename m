Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3049683lft;
        Thu, 23 Jun 2022 08:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tfq0HIISzWhBJUyixzHZV3QYW/QA4KawMBK19eLQnSrI3IJavfsMmvGFU8CM234td0Jz2O
X-Received: by 2002:a05:622a:120f:b0:306:6c0f:4116 with SMTP id y15-20020a05622a120f00b003066c0f4116mr8484038qtx.193.1655998157244;
        Thu, 23 Jun 2022 08:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655998157; cv=none;
        d=google.com; s=arc-20160816;
        b=KGdC3d9+SKnADa5POH9OM9CffE9fCzw0LI54y3aGjjqe9IAxP1gp+teXHDqN1KeStI
         451x+LGtDksJfYgdUnA+cEvLmdSuhdmvOOrazugh9Jl7Q3eULKomrqYt6DbbIc/rEk76
         u2fuhRR9V4EBY3ab7EEJavgRH/sg1Ptu1469nVRHCy+ga2k6DZqzGZc+XA4PuHR/1GTv
         AnX+3R8QY25mv/O2Gf20RjRBvd2G36w9JSAbE2AUtmTBiFXIamk5Yc4YKyaukiD2BgXl
         d2b4D6Txco7+rZkNgfGi0z8XwBrlyscS2WXDvHeugf6h5yYNynFjndcg1NauG6PfHVDQ
         VbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y/al4SC9ETDnXMlQMUYXIugxttS8K4Odi6fLvPdUCb0=;
        b=QP0wnjZEKgy6AM6VZxDuO63OvPEp8iqMhsIatZ0ByK+I/MeAcHWkQlPuxUhtlck1xA
         +QyOym/QMMDMWHAIEPOrk1idj42hXTYbMnV/TzPLh4aNbFiq77P4apFCtyv3sQBEIRbC
         FOEVJZVCpkt1Y46UNygIEu59Mxzr5h158H5NkMmMEcnkIOdm4/co8i2uHi2M0p/C0q+e
         eHV/y2GjzBqm1cfMvWeLLPMPI8UsSYs6K7Q1sIZHO1ycfVL8kLOUVdYeg9XgDDz7dxiK
         NL3t2h9A0VXX5/mG6Ytoiv9LsULSjkXtdwum6pywPy5SElry48ONCqOn/NVpOIcJwk10
         5gjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=i3HGxgF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ad45c66000000b00470544ff38bsi6202541qvh.400.2022.06.23.08.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 08:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=i3HGxgF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4Olg-0004DY-OF
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 11:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o4OlF-00048G-SZ
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 11:28:49 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:38431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1o4OlC-0000ji-Rj
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 11:28:49 -0400
Received: by mail-ua1-x929.google.com with SMTP id b7so6414010uap.5
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/al4SC9ETDnXMlQMUYXIugxttS8K4Odi6fLvPdUCb0=;
 b=i3HGxgF2I0Fsgzfp/3vJACIWuRMt4ccNuSHn9Cyd4fPgXbl18jGdeo7iVm7HubnOLP
 TpudPUW7EIUdhu3JVVXd3Uuq1gPRwSNQQf1oKyLm/GxoayGVBQk/qOsX0Mz1a6YxsPT8
 hKgoofdUc5sV1Y7WiXX4jgPEo4L6vZtgJGmSGVyFrFUpW34AX+UExZ5u+QRFOpKwpC3r
 fdNM0QJTWyGjt+3xFz10Bz9z7Zg2VIIsZh6kEUscubn8mv3atY1eZ8Xuv2eKhUTsytH/
 Ieb9vfRpZVzdB5QJZbQeZOdpZR4Vj6HkWd7+M2NnQP3idABAFcvvd6WbDx8qebshfTBo
 YauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/al4SC9ETDnXMlQMUYXIugxttS8K4Odi6fLvPdUCb0=;
 b=04JnBNiTlOf0NXInU0iDsynRfI7sm42qj5ek6I4Whcoqx1unx45UlCGo5YE7lBz5wd
 aaHGx4eOcTtv+2MpfdRYalS8Tu/cCKKC5QBo8bptMJVnW7/Rr4NqUWqDtfE/+dT1Srb9
 H2MUN4t8Mlf+L1f9XXsA2IlMihgTjAPNJzhHb3HHKAnMuz2DDMXkEL14fdsD7luJ1598
 XuoancJcDBeAAEMDZrExFL2OVqiRALAuIjopdOzH6MmW63wxM4ZH18+4gw8M8ituv1NA
 vaJ9xe8MAoOVnx9148YFgtNR6jLFCX6OOQb69A/hdXwS9iclZdDBJCz9GEvYQR8Aa8os
 UArg==
X-Gm-Message-State: AJIora/e94ntJgqFuXKND81BFfh5NAvsSA9DO23cTP991oCmzOmhvZkQ
 gkCY4J4tz4npJ5mTN39xukKmAAA9Azp4a61LAlDCMg==
X-Received: by 2002:ab0:1e08:0:b0:37f:1f74:3084 with SMTP id
 m8-20020ab01e08000000b0037f1f743084mr5089903uak.39.1655998125147; Thu, 23 Jun
 2022 08:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 23 Jun 2022 08:28:34 -0700
Message-ID: <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Hao Wu <wuhaotsh@google.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000000037505e21f1cc2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=venture@google.com; helo=mail-ua1-x929.google.com
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
X-TUID: sAeGs60HTrsB

--00000000000000037505e21f1cc2
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
wrote:

> From: Graeme Gregory <quic_ggregory@quicinc.com>
>
> The FRU device uses the index 0 device on bus IF_NONE.
>
> -drive file=$FRU,format=raw,if=none
>
> file must match FRU size of 128k
>
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> ---
>  hw/arm/aspeed.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 785cc543d046..36d6b2c33e48 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>       */
>  }
>
> +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t
> rsize)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +    /* Use First Index for DC-SCM FRU */
> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
>

We've sent a similar patch up for the at24c but in its own file -- but
looking at this, we could likely expand it to suite our cases as well - is
there a reason it's named qcom_dc_scm_fru_init?  Presumably that's to
handle the drive_get parameters.  If you make it use `drive_get(IF_NONE,
bus, unit);` You'll be able to associate a drive via parameters like you
aim to.


> +
>  static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
>
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105",
> 0x4d);
>
> -    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
> -    if (eeprom_buf) {
> -        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
> -                              eeprom_buf);
> -    }
> +    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 *
> 1024);
>  }
>
>  static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
> --
> 2.25.1
>
>
>

--00000000000000037505e21f1cc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 22, 2022 at 10:48 AM Jae =
Hyun Yoo &lt;<a href=3D"mailto:quic_jaehyoo@quicinc.com">quic_jaehyoo@quici=
nc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Graeme Gregory &lt;<a href=3D"mailto:quic_ggregory@quicinc.com"=
 target=3D"_blank">quic_ggregory@quicinc.com</a>&gt;<br>
<br>
The FRU device uses the index 0 device on bus IF_NONE.<br>
<br>
-drive file=3D$FRU,format=3Draw,if=3Dnone<br>
<br>
file must match FRU size of 128k<br>
<br>
Signed-off-by: Graeme Gregory &lt;<a href=3D"mailto:quic_ggregory@quicinc.c=
om" target=3D"_blank">quic_ggregory@quicinc.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/aspeed.c | 22 +++++++++++++++++-----<br>
=C2=A01 file changed, 17 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
index 785cc543d046..36d6b2c33e48 100644<br>
--- a/hw/arm/aspeed.c<br>
+++ b/hw/arm/aspeed.c<br>
@@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)<b=
r>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0}<br>
<br>
+static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize=
)<br>
+{<br>
+=C2=A0 =C2=A0 I2CSlave *i2c_dev =3D i2c_slave_new(&quot;at24c-eeprom&quot;=
, addr);<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(i2c_dev);<br>
+=C2=A0 =C2=A0 /* Use First Index for DC-SCM FRU */<br>
+=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get(IF_NONE, 0, 0);<br>
+<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;rom-size&quot;, rsize);<br>
+<br>
+=C2=A0 =C2=A0 if (dinfo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(dev, &quot;drive&quot;, bl=
k_by_legacy_dinfo(dinfo));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 i2c_slave_realize_and_unref(i2c_dev, bus, &amp;error_abort);=
<br>
+}<br></blockquote><div><br></div><div>We&#39;ve sent a similar patch up fo=
r the at24c but in its own file -- but looking at this, we could likely exp=
and it to suite our cases as well - is there a reason it&#39;s named qcom_d=
c_scm_fru_init?=C2=A0 Presumably that&#39;s to handle the drive_get paramet=
ers.=C2=A0 If you make it use `drive_get(IF_NONE, bus, unit);` You&#39;ll b=
e able to associate a drive via parameters like you aim to.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AspeedSoCState *soc =3D &amp;bmc-&gt;soc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&amp;soc-&gt=
;i2c, 15), &quot;tmp105&quot;, 0x4d);<br>
<br>
-=C2=A0 =C2=A0 uint8_t *eeprom_buf =3D g_malloc0(128 * 1024);<br>
-=C2=A0 =C2=A0 if (eeprom_buf) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 smbus_eeprom_init_one(aspeed_i2c_get_bus(&amp;=
soc-&gt;i2c, 15), 0x53,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eeprom_buf);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, 15=
), 0x53, 128 * 1024);<br>
=C2=A0}<br>
<br>
=C2=A0static bool aspeed_get_mmio_exec(Object *obj, Error **errp)<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000000037505e21f1cc2--
