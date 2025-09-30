Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57086CCA470
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 19:26:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3fyf-0003Y9-Pq; Tue, 30 Sep 2025 15:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubinz@google.com>) id 1v3fye-0003XE-RB
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 15:25:32 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yubinz@google.com>) id 1v3fyb-0001hh-N1
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 15:25:32 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-633c627d04eso1453a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 12:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759260324; x=1759865124; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qqHguemmuaBeQjOcMdhjoGD+aUF1ah3HFfnAophTSMA=;
 b=R05y+ScPkEQ1wABP2piO+fLhAT4tSuwlOPho8aCSj1zktFTnYHJ9oEdz28pHieUk4g
 HMD4o/uNkX60BCkQuehjK2GOZVQlcrovVDMAYo9IVXrVvbKponA9G07qPjTq0mQWcBIW
 PW5yuXjii/rTnzgWjAxYbgnMGdg8ZQu4d33CurF3TrMioWKbAG54fTmp5Lw8uxnOipUk
 ZAq8gkhJnO9USufHSSnQuhpEQvEloe0Lfcl0IJd352PJJr4cPliMASMi363QwVJxpGTq
 5hPVr770+9G2JZpOzvSgsUf2OL1TAkt5nfVKWDOJ6FhxMgWwO92onjO0OAD8HnWYMJSX
 7DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759260324; x=1759865124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qqHguemmuaBeQjOcMdhjoGD+aUF1ah3HFfnAophTSMA=;
 b=uKJUligy1SYiMNOJLH8o3KBxPWJ/qwTjaHP3hw7AO7W2w8GAPG20XXhelij7meScX9
 PawzLx5teZj5GfKkWJkiaGSGUOAMzVoNpcAZLakj6buMPZnSuysfeucObgcfY1PUPgPi
 liPQ8aHF8ATaJX8LzjqZjk1YxdHjKhsi050SqeZcK1WOl6SeQsGXONeznXvh/JCQSTiA
 wfBlwwdV7s3OYFnrbsdi/HxxRiGmnVfKl6KFpP9Kvzoizrj2vvZZotWk4ut1W6dkp4jo
 +c7AhMDL2iL2Q71RI84IVGTpBdzAJccmW+HpoOHc4ikFXsu0r9P2O7kINPRJ8SxjfiMK
 OjOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzFqqCoG5EKbHzQ1kKxg2FZ/d+FWZI6/GTmUMtLjRFLL/dnJvvyLuzefdC9kOrYvW+pjj0BAj6Vg==@nongnu.org
X-Gm-Message-State: AOJu0YwgYo03J0DXtn5ZWYIlRXqEAy8bpricfN3Li1By8YeV3ocRZ9V/
 5cu/rxCR0ahvkTH4XLCqFDO1qZ91UhUyZh9dMrfSwFggQyviMmfCFpl6kp/2YiJIbuIkYjYWrj/
 XnEduSybwbq1RPrwpsQJB7Y3v87XRrtdZDXOjE5Yh
X-Gm-Gg: ASbGncs5CBaY8cRj15i36Ky+tJbC8Ch5Yta7qIMpUrOiQEn316x8oE+uiLwDgsK2UMT
 9JSc564pe1l4cgjxcJQKIYkeceHwzac7xCYiZ1UyEGnHvTtpocwXQJLxKGl+DjtaunbN8Op6gpN
 SFiuBlkeCFxJXDXMJP1RdO6D9/R/QN6GnTiP5eodoDXT7QLULPXhhZeThK8dYhWjlCcdMl2OXDU
 y1SGC3zQp9XguNWJgndd7RDGwJJoL4dZ/PQ/3Cglp6sYK11/qBO0wW57lMUpxwpAvboY4Xla1Vl
 fCT0B+IeOc5pKw==
X-Google-Smtp-Source: AGHT+IElC65yuE1FPh777GW8WfCXG4ndzs5Yvw4PZgZ4AhcT5KljZt1UGhG/UqbQxEPi8otB90zT+USiiyIaz1OUY9g=
X-Received: by 2002:a50:d71d:0:b0:62f:9f43:2117 with SMTP id
 4fb4d7f45d1cf-6367a952f6dmr24978a12.0.1759260323966; Tue, 30 Sep 2025
 12:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250916-quanta-q71l-eeproms-v1-0-3648692cc441@google.com>
 <20250916-quanta-q71l-eeproms-v1-1-3648692cc441@google.com>
 <37f60533-8e6b-496c-850b-16aff7fb7be3@kaod.org>
In-Reply-To: <37f60533-8e6b-496c-850b-16aff7fb7be3@kaod.org>
From: Yubin Zou <yubinz@google.com>
Date: Tue, 30 Sep 2025 12:25:12 -0700
X-Gm-Features: AS18NWCD9QzUrrvcVyrkfIdxIG61t1M-VFNsCVekM-H58-VFbJc7sA3bq6oHSd0
Message-ID: <CABU_6B+PVUAxc8HLNvP8ym=hRM27StXjhJcc+e1j6i8OkEDwxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm: add eeproms to quanta-q7l1 board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="000000000000ae476d064009b66a"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=yubinz@google.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000ae476d064009b66a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cedric

Could you clarify what functional test you are referring to?

Thanks
Yubin

On Tue, Sep 16, 2025 at 11:10=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.or=
g> wrote:

> Hi,
>
> On 9/16/25 19:50, Yubin Zou wrote:
> > From: Patrick Venture <venture@google.com>
> >
> > Adds eeprom init for aspeed helper method and adds 24c64 eeproms to the
> > quanta-q71l bmc board.
> >
> > Tested: Booted quanta-q71l bmc firmware to userspace.
>
> Could you please provide a FW image and functional test for the
> quanta-q7l1 board ?
>
> Thanks,
>
> C.
>
>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >   hw/arm/aspeed.c | 15 ++++++++++-----
> >   1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index
> c31bbe7701381f6980e874f9fca51805ff9fb9b4..bae59ae7394882e3fc93863049a37ff=
5a8737ff8
> 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -561,14 +561,17 @@ static void
> quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1),
> "tmp105", 0x4e);
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1),
> "tmp105", 0x4f);
> >
> > -    /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */
> > -    /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
> > +    /* Baseboard FRU */
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x54, 8192);
> > +    /* Frontpanel FRU */
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 1), 0x57, 8192);
> >       /* TODO: Add Memory Riser i2c mux and eeproms. */
> >
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2),
> "pca9546", 0x74);
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2),
> "pca9548", 0x77);
> >
> > -    /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
> > +    /* Add BIOS FRU */
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 3), 0x56, 8192);
> >
> >       /* i2c-7 */
> >       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
> "pca9546", 0x70);
> > @@ -577,8 +580,10 @@ static void
> quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
> >       /*        - i2c@2: pmbus@58 */
> >       /*        - i2c@3: pmbus@59 */
> >
> > -    /* TODO: i2c-7: Add PDB FRU eeprom@52 */
> > -    /* TODO: i2c-8: Add BMC FRU eeprom@50 */
> > +    /* PDB FRU */
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x52, 8192);
> > +    /* BMC FRU */
> > +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 8192);
> >   }
> >
> >   static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
> >
>
>

--000000000000ae476d064009b66a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Cedric</div><div=
><br></div><div>Could you clarify what functional test you=C2=A0are referri=
ng to?</div><div><br></div><div>Thanks</div><div>Yubin</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 16, 2025=
 at 11:10=E2=80=AFPM C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.o=
rg" target=3D"_blank">clg@kaod.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 9/16/25 19:50, Yubin Zou wrote:<br>
&gt; From: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt;<br>
&gt; <br>
&gt; Adds eeprom init for aspeed helper method and adds 24c64 eeproms to th=
e<br>
&gt; quanta-q71l bmc board.<br>
&gt; <br>
&gt; Tested: Booted quanta-q71l bmc firmware to userspace.<br>
<br>
Could you please provide a FW image and functional test for the<br>
quanta-q7l1 board ?<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/aspeed.c | 15 ++++++++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt; index c31bbe7701381f6980e874f9fca51805ff9fb9b4..bae59ae7394882e3fc9386=
3049a37ff5a8737ff8 100644<br>
&gt; --- a/hw/arm/aspeed.c<br>
&gt; +++ b/hw/arm/aspeed.c<br>
&gt; @@ -561,14 +561,17 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachi=
neState *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, 1), &quot;tmp105&quot;, 0x4e);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, 1), &quot;tmp105&quot;, 0x4f);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /* TODO: i2c-1: Add baseboard FRU eeprom@54 24c64 */<br=
>
&gt; -=C2=A0 =C2=A0 /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */<b=
r>
&gt; +=C2=A0 =C2=A0 /* Baseboard FRU */<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, =
1), 0x54, 8192);<br>
&gt; +=C2=A0 =C2=A0 /* Frontpanel FRU */<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, =
1), 0x57, 8192);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO: Add Memory Riser i2c mux and eeprom=
s. */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, 2), &quot;pca9546&quot;, 0x74);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, 2), &quot;pca9548&quot;, 0x77);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */<br>
&gt; +=C2=A0 =C2=A0 /* Add BIOS FRU */<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, =
3), 0x56, 8192);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* i2c-7 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(aspeed_i2c_get_bus(&=
amp;soc-&gt;i2c, 7), &quot;pca9546&quot;, 0x70);<br>
&gt; @@ -577,8 +580,10 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachin=
eState *bmc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 - i2c@2: pmbus=
@58 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 - i2c@3: pmbus=
@59 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /* TODO: i2c-7: Add PDB FRU eeprom@52 */<br>
&gt; -=C2=A0 =C2=A0 /* TODO: i2c-8: Add BMC FRU eeprom@50 */<br>
&gt; +=C2=A0 =C2=A0 /* PDB FRU */<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, =
7), 0x52, 8192);<br>
&gt; +=C2=A0 =C2=A0 /* BMC FRU */<br>
&gt; +=C2=A0 =C2=A0 at24c_eeprom_init(aspeed_i2c_get_bus(&amp;soc-&gt;i2c, =
8), 0x50, 8192);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void ast2500_evb_i2c_init(AspeedMachineState *bmc)<=
br>
&gt; <br>
<br>
</blockquote></div></div>
</div>
</div>

--000000000000ae476d064009b66a--

