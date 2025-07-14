Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70061C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 22:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubRcL-0005Qx-Ng; Mon, 14 Jul 2025 18:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ubQ8j-0003vO-AF
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:51:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ubQ8h-0002Xs-28
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:51:09 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGJY1B005363
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 20:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nIo6Ez9MDmdng9k6EtMZRgfs
 jG7XH380hTUP5ClFNxc=; b=Y0E+C5v4K0eFv+3vaWPshe2rCkRAlJI8v7HVZPSC
 ysqIPYFR3Fuy64inEcFqOZQrYvdcvc9vff9gQy7F0DCYy2RZxFefc3MvsK2TJOvf
 gCrBWq1Y4vV8DyWwfY3tpx3dp4i+4b4/oK3IrRLywjbWDJks9XWqHycUByQViPPI
 PG8lLYHLVDfhfz+PfzxdUsBWqzYk6cGdkhFxDsXjr8Jj4orF/+dxQ3bcchZ7bKFE
 AOJ0HV0sNawiwxesWwCX8I9kk2CgBoO7ASaYdsYZEyb0O2391LEO5i6GOvtDsZpE
 oHAe86TFsKnCMnFWJ+3+F54BEdIZOop4a/plv0D3tM2MPA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37wyt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 20:51:05 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7111d608131so76163047b3.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 13:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752526264; x=1753131064;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nIo6Ez9MDmdng9k6EtMZRgfsjG7XH380hTUP5ClFNxc=;
 b=ryl1CYvklsy9S9kX/kQJf3MtiGSHWdEPd/qR0MSwo6jJWIEW6xHWwwMkh70YepgRXY
 N5lLPDRXW6yH9PwprLM8GVkq7to+BczvBNjEa1/bsh/h9DLYI1Tu0UnuoijgyPmg+DgG
 f92Aoj8RA8ycfysTEGweURVgYIkdcT3qiExZu0mp3Z0tJLmwK6vfT2XGs0jcVdB3xkHc
 a7yPzuvGAlaqcl2SIcD1SMwWXmbJDy63AvoT868HeFhm+QsO96TskNU1SNcOxRrNgPRL
 XIpwr5kRA1Nj15a9kpfjK+OyyVFzmwBo8YhwSDkjR6qKxTtWDA40eBUmQhd258RX4Cja
 nxoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwU6axB6EXks1FSds31yeOxiVoowKzQvwHz4Q4GP+5+Gb4o0sKIfol1wPh2Q+ohrwpDm8XinaCTg==@nongnu.org
X-Gm-Message-State: AOJu0YyzvBlKZCFZL86UvT9VeLYY8JdF/GyLmwNSSdFEnHU5zVtConqQ
 v/7onDIfA/8fsFLWx7TiDleNMgvPPH5VDHAg2qpr81RU+ym0aLoRQ/y5HmB6l2hI/lmFTXRX95u
 mqqVhccDUyKVjGrM66mhYTr9nmId49jM/rLBil5PigcPl8HdrKx6jzC/cyubPAR3hbKUnBNTwT2
 NqIqTYhn4DcS6lQkwQmWtxVZGZLgSRRA==
X-Gm-Gg: ASbGncs+fu+EWIHBgTE59LWBfh9vyICR3xFSvaj6IS57kB4X+5XtMv6QDTROtKA/AGO
 sjRayruTMMUPMm3WuyMVdBmxKQxn+jawtWhJB036CVlb/0i8ZdUfz+8efEV2IsDfW0rteazTBGj
 vui4nNJs9tw4aVTnJsO0eDKw==
X-Received: by 2002:a05:690c:6e0c:b0:712:c55c:4e5e with SMTP id
 00721157ae682-717d7a0e9d6mr201694667b3.18.1752526264444; 
 Mon, 14 Jul 2025 13:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6kh6ItOLVkNq/HwiVZy7iIJnwRLK8i0PeWz1vmtVSpkc0s8UF5aMyU5xeE+/tYXFg65nZlSbMhUNCNreFgtc=
X-Received: by 2002:a05:690c:6e0c:b0:712:c55c:4e5e with SMTP id
 00721157ae682-717d7a0e9d6mr201694417b3.18.1752526263937; Mon, 14 Jul 2025
 13:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250714174330.913636-1-vacha.bhavsar@oss.qualcomm.com>
 <a38e4185-71e6-4edf-99c6-c4c1f85066d0@linaro.org>
In-Reply-To: <a38e4185-71e6-4edf-99c6-c4c1f85066d0@linaro.org>
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 16:50:53 -0400
X-Gm-Features: Ac12FXyXIHT500WhPC7rLG27dpTkFmaJZxmlD793maJCR3poJFCsNvSd66CYJxk
Message-ID: <CAEWVDmvPVc1A+z6o_AwLsS8zaMsnTO1qxSYFESf0yuoe3R2vKg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Added support for SME register exposure to
 GDB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006bfe510639e9d131"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE0MCBTYWx0ZWRfX+p7Mvm6E3KRF
 Ur6wwlC98vqLxamuzyLPemJ5NJ4LZZY0CcNAy/r0rZfpCww5Vorj+rzDa0NF3CPbQm5qbj2ZpZR
 Lfyn2B9dHntSQ+un/iG7I08bAPaZBFto1fSycBg1qFGvLEY+yFXZmMl549vU7ZcgiGEsqdV0986
 SO2o/GqhpuGj1y6/Oxd+PGj62WRMB5JaT8nXHhhdWwwVVoMQx5E7DrGxoRaPtPB6PDHKRcrxpQD
 Pm475GjSNz932BpZvVNzZ5u58yNR/E12Q9pgHBk2utSdlfpOijoaouw5MTgsbOSrfvNI+iH530V
 2DbQo+w84OYyELg3aGmQO1/pMuCA8r5Elim0CY1rA+0OM3K0VfuLHBv/WVNwRO4WWsKAzFA882X
 /ijf4cCzAipC6qcyelf0xkjsp09V2R4v333d5kMMCOB2ci0ue7vcLTRg4b8eYCsAiaNLXQmg
X-Proofpoint-GUID: cQrjACOL3mzRRQyDg5s8YTmYUKnFznJJ
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68756db9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=Nvkyb4XKfDslDQzV8p0A:9 a=QEXdDO2ut3YA:10 a=HjjZBBvkAAAA:8
 a=55cpyvLwM56_CnIXs54A:9 a=vzHnaPgXQvQ0fdxY:21 a=lqcHg5cX4UMA:10
 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22 a=yryXaR-spxf4diMYRkVC:22
X-Proofpoint-ORIG-GUID: cQrjACOL3mzRRQyDg5s8YTmYUKnFznJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140140
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

--0000000000006bfe510639e9d131
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thank you for the feedback! I have sent an updated version your way with
the suggested changes!

Thanks,
Vacha

On Mon, Jul 14, 2025 at 3:41=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/14/25 11:43, Vacha Bhavsar wrote:
> > diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> > index 64ee9b3b56..c39d636caa 100644
> > --- a/target/arm/gdbstub64.c
> > +++ b/target/arm/gdbstub64.c
> > @@ -228,6 +228,87 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t
> *buf, int reg)
> >       return 0;
> >   }
> >
> > +int aarch64_gdb_get_sme_reg(CPUState *cs, GByteArray *buf, int reg)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(cs);
> > +    CPUARMState *env =3D &cpu->env;
> > +    bool streaming_mode =3D ((env->svcr & 0x01) !=3D 0);
>
> env->svcr & R_SVCR_SM_MASK, although perhaps
>
> > +
> > +    switch (reg) {
> > +    /* Svg register */
> > +    case 0:
> > +    {
> > +        int vq;
> > +        if (streaming_mode) {
> > +            vq =3D sve_vqm1_for_el_sm(env, arm_current_el(env),
> > +                     streaming_mode) + 1;
> > +        } else {
> > +            vq =3D 0;
> > +        }
> > +        /* svg =3D vector granules (2 * vector quardwords) in streamin=
g
> mode */
> > +        return gdb_get_reg64(buf, vq * 2);
>
>      int vq =3D 0;
>      if (FIELD_EX64(env->svcr, SVCR, SM)) {
>          vq =3D ...
>      }
>
> is clearer.
>
>
> > +    }
> > +    case 1:
> > +        return gdb_get_reg64(buf, env->svcr);
> > +    case 2:
> > +    {
> > +        int q;
> > +        int len =3D 0;
> > +        int vq =3D cpu->sve_max_vq;
>
> sme_max_vq.
>
> > +        int svl =3D vq * 16;
> > +        for (int i =3D 0; i < svl; i++) {
> > +            for (q =3D 0; q < vq; q++) {
>
> for (int q =3D 0
>
> > +                len +=3D gdb_get_reg128(buf,
> > +                           env->za_state.za[i].d[q * 2 + 1],
> > +                           env->za_state.za[i].d[q * 2]);
> > +            }
> > +        }
> > +        return len;
> > +    }
> > +    default:
> > +        /* gdbstub asked for something out of range */
> > +        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d",
> __func__, reg);
> > +        break;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int aarch64_gdb_set_sme_reg(CPUState *cs, uint8_t *buf, int reg)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(cs);
> > +    CPUARMState *env =3D &cpu->env;
> > +
> > +    switch (reg) {
> > +    case 0:
> > +    {
> > +        /* cannot set svg via gdbstub */
> > +        return 0;
> > +    }
>
> I think you return 8 anyway to ignore.
>
> > +    case 1:
> > +        aarch64_set_svcr(env, *(uint64_t *)buf,
>
> ldq_le_p(buf)
>
> > +            R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
> > +        return 8;
> > +    case 2:
> > +        int vq, len =3D 0;
> > +        int svl =3D cpu->sve_max_vq * 16;
>
> sme_max_vq.
>
> > +        uint64_t *p =3D (uint64_t *) buf;
> > +        for (int i =3D 0; i < svl; i++) {
> > +            for (vq =3D 0; vq < cpu->sve_max_vq; vq++) {
>
> Mirror the q/vq loop from above.
>
> > +                env->za_state.za[i].d[vq * 2 + 1] =3D *p++;
> > +                env->za_state.za[i].d[vq * 2] =3D *p++;
> > +                len +=3D 16;
> > +            }
> > +        }
> > +        return len;
> > +    default:
> > +        /* gdbstub asked for something out of range */
> > +        break;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
> >   {
> >       ARMCPU *cpu =3D ARM_CPU(cs);
> > @@ -392,6 +473,43 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUStat=
e
> *cs, int base_reg)
> >       return &cpu->dyn_svereg_feature.desc;
> >   }
> >
> > +GDBFeature *arm_gen_dynamic_smereg_feature(CPUState *cs, int base_reg)
> > +{
> > +    ARMCPU *cpu =3D ARM_CPU(cs);
> > +    int vq =3D cpu->sve_max_vq;
>
> sme_max_vq.
>
>
> r~
>

--0000000000006bfe510639e9d131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br><br>Thank you for the feedback! I have sent=
 an updated version your way with the suggested changes!<br><br>Thanks,<br>=
Vacha</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jul 14, 2025 at 3:41=E2=80=AFPM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hende=
rson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On 7/14/25 11:43, Vacha Bhavsar wrote:<br>
&gt; diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c<br>
&gt; index 64ee9b3b56..c39d636caa 100644<br>
&gt; --- a/target/arm/gdbstub64.c<br>
&gt; +++ b/target/arm/gdbstub64.c<br>
&gt; @@ -228,6 +228,87 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t=
 *buf, int reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +int aarch64_gdb_get_sme_reg(CPUState *cs, GByteArray *buf, int reg)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(cs);<br>
&gt; +=C2=A0 =C2=A0 CPUARMState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 bool streaming_mode =3D ((env-&gt;svcr &amp; 0x01) !=3D=
 0);<br>
<br>
env-&gt;svcr &amp; R_SVCR_SM_MASK, although perhaps<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 /* Svg register */<br>
&gt; +=C2=A0 =C2=A0 case 0:<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streaming_mode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vq =3D sve_vqm1_for_el_sm(e=
nv, arm_current_el(env),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0streaming_mode) + 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vq =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* svg =3D vector granules (2 * vector qu=
ardwords) in streaming mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gdb_get_reg64(buf, vq * 2);<br>
<br>
=C2=A0 =C2=A0 =C2=A0int vq =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0if (FIELD_EX64(env-&gt;svcr, SVCR, SM)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vq =3D ...<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
is clearer.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return gdb_get_reg64(buf, env-&gt;svcr);<=
br>
&gt; +=C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int q;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vq =3D cpu-&gt;sve_max_vq;<br>
<br>
sme_max_vq.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int svl =3D vq * 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; svl; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (q =3D 0; q &lt; vq; q+=
+) {<br>
<br>
for (int q =3D 0<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len +=3D gdb_=
get_reg128(buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;<a href=3D"http://za_state.za" rel=3D"n=
oreferrer" target=3D"_blank">za_state.za</a>[i].d[q * 2 + 1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;<a href=3D"http://za_state.za" rel=3D"n=
oreferrer" target=3D"_blank">za_state.za</a>[i].d[q * 2]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return len;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* gdbstub asked for something out of ran=
ge */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: out of=
 range register %d&quot;, __func__, reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int aarch64_gdb_set_sme_reg(CPUState *cs, uint8_t *buf, int reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(cs);<br>
&gt; +=C2=A0 =C2=A0 CPUARMState *env =3D &amp;cpu-&gt;env;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (reg) {<br>
&gt; +=C2=A0 =C2=A0 case 0:<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* cannot set svg via gdbstub */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
I think you return 8 anyway to ignore.<br>
<br>
&gt; +=C2=A0 =C2=A0 case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64_set_svcr(env, *(uint64_t *)buf,<b=
r>
<br>
ldq_le_p(buf)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 R_SVCR_SM_MASK | R_SVCR_ZA_=
MASK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 8;<br>
&gt; +=C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int vq, len =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int svl =3D cpu-&gt;sve_max_vq * 16;<br>
<br>
sme_max_vq.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *p =3D (uint64_t *) buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; svl; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (vq =3D 0; vq &lt; cpu-=
&gt;sve_max_vq; vq++) {<br>
<br>
Mirror the q/vq loop from above.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;<a hr=
ef=3D"http://za_state.za" rel=3D"noreferrer" target=3D"_blank">za_state.za<=
/a>[i].d[vq * 2 + 1] =3D *p++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;<a hr=
ef=3D"http://za_state.za" rel=3D"noreferrer" target=3D"_blank">za_state.za<=
/a>[i].d[vq * 2] =3D *p++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len +=3D 16;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return len;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* gdbstub asked for something out of ran=
ge */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *bu=
f, int reg)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ARMCPU *cpu =3D ARM_CPU(cs);<br>
&gt; @@ -392,6 +473,43 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUSta=
te *cs, int base_reg)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;cpu-&gt;dyn_svereg_feature.desc;=
<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +GDBFeature *arm_gen_dynamic_smereg_feature(CPUState *cs, int base_reg=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(cs);<br>
&gt; +=C2=A0 =C2=A0 int vq =3D cpu-&gt;sve_max_vq;<br>
<br>
sme_max_vq.<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000006bfe510639e9d131--

