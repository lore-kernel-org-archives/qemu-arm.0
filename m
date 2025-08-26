Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E04FCA0FF2
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 18:52:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqymW-0001GM-5Y; Tue, 26 Aug 2025 14:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uqymV-0001G4-Cb
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 14:52:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1uqymN-000190-Lc
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 14:52:31 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCPDo8019144
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=85/pXZ0yJ2qwVaoSY5LUAd4y
 7GWHz0rnttOkP0YTZO4=; b=N834HX4rDOjMUra/ZGdm7A0i9dW3MI5w28EdoCpc
 pnCTZEuG4DspVWEoOvKnvc4/i3sokPg4YXlV3kDGBrFDjWr+0t/MeIuJ66NXX9Ve
 vFfcD0i3+raXn0TYEFGd9YTqsYuLCprRJRDbg0+GFeeOcu+DCCL2VnHufxL58v0X
 8D+7PiHXQ4nckvBlMMcRAGGVZKZSfdhdy4/0XXAyUk/b0CAHL9MnUyLHGMsuzdDN
 B0lQTMXQjN+TUFebwLddswFVVXv+QgmY8ljxqLGpDb8ioJkepIpPAurnAOL9bCV9
 dkSPN1MWepP+Nbu+VfkldTC527H5bnm/u45mSoZF5Jr7iQ==
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8a3x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:52:19 +0000 (GMT)
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-e951acdc109so7268268276.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 11:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756234338; x=1756839138;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=85/pXZ0yJ2qwVaoSY5LUAd4y7GWHz0rnttOkP0YTZO4=;
 b=E8bzlKJpLYW1ZuzvADh1vzair4zuFPAVTeLNPcTdhD4M8gLxGmVl8c4jlbgyz9gSKQ
 Vz0XWqY8r2WvwdxbqRIZWG7fH8MHWUtrfrkvivO8JTTTySeNg5UpnrShr5Y4Qhx79bQQ
 ivfAjDHZP+PKN41J9sV4pC/wH63pvu/r1uoAa+aLmMLbOr1UXU3NJLBMT5RuaLOx15pa
 kjXHNqsTG/4OLzqxi7UX0VBnpKeAG/YKWa1rcUmjafPZQVpAyrFlqlzysEjWOi9BsqVr
 5WZysi3N9/cuMxTEzXJfSi0RJWML86sslARlHki1ZCva6T9X8NsSxdwr+GeNr0Nb0lnq
 gvUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCLNdEzF5+hJCr3mYAO53NumYx/N0SbNLFjJZvcIMPQpfYKvTYLRXyLLBOjRz7DvQ1mu589wzFvg==@nongnu.org
X-Gm-Message-State: AOJu0Yz1IrkF2Z3HibiIse1SzHHkMKEJXJH62xYWHgLWFrRXa94tbDvg
 sf1pVpgZhaMxXQqBxUNXVuDzh8JEkcw4RyNvbtyjJRRlSTDDQEkCzSQPHlxDXUMHV8vtdnMc4M0
 3d9DXQ/eYiW/Ha9UkKmSnSIJ2zTPI9mGlE2hYNRUj0KUWwRYjZFF2UFz2lbTtsZJbR0hI47mYYH
 N4WMSLL4hkwEnovpSspsYr5lEoLbh70g==
X-Gm-Gg: ASbGncsG1KxsZn3kDsy5wtUH2PKbHk8ruacttn5fNpnwDw8hhR8x9lXFZCTQcZBw+JX
 5I2J+tnMFMytD9qpYpmZbNMYdebkNSpd8oWizgWC4K9MDtgUgYnU/gNEKtX0jj1NUNOdq1d2Ybw
 MS/IiZI64wUUtBGgx0QRXjYB8=
X-Received: by 2002:a05:6902:5415:b0:e93:486f:b35e with SMTP id
 3f1490d57ef6-e951c3eabc8mr17969831276.44.1756234338321; 
 Tue, 26 Aug 2025 11:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZQYetQyTe6eNzQ6CPrF+RXWfP/d06IUWrGCBuZEt+Cy6b2/dZ4bRET5y+KFXcQdgMa1MqycyLmTrtljLGXB4=
X-Received: by 2002:a05:6902:5415:b0:e93:486f:b35e with SMTP id
 3f1490d57ef6-e951c3eabc8mr17969793276.44.1756234337693; Tue, 26 Aug 2025
 11:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250811193654.4012878-1-vacha.bhavsar@oss.qualcomm.com>
 <20250811193654.4012878-4-vacha.bhavsar@oss.qualcomm.com>
 <CAFEAcA9wQ8qh3Ah+QNNXY6u8ut6ZMVqaxFTvDDhvEGYrazFPsA@mail.gmail.com>
 <CAEWVDmuAkDuss-vB35dOPP-zSOZTEK4WJGfvqLQdHNG-63h51Q@mail.gmail.com>
 <CAFEAcA_BV1ThJ_2L5pDd8WQhSPKd2WKbW1eb1Owrr4YswOg9Bg@mail.gmail.com>
In-Reply-To: <CAFEAcA_BV1ThJ_2L5pDd8WQhSPKd2WKbW1eb1Owrr4YswOg9Bg@mail.gmail.com>
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:52:06 -0400
X-Gm-Features: Ac12FXwOshq15iM9M3taex3Ush5om9-aRFkwby-1GZWKH2j3VbZhBrvXtVMAuLQ
Message-ID: <CAEWVDms-Ttx_P6WePjsxRt-=rAmr2aLVFOZEhC4mitdypWMcxg@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] target/arm: Added support for SME register
 exposure to
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d7436a063d492b53"
X-Proofpoint-ORIG-GUID: uNLZDPNrDUOwOj3aEzZKou7oI_LqFdXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX1oeCC9qnwPgb
 cnQKYK6fOsqbt8I35sMpuMVtIj9W2WO9LNn40218YuB4IlTLyN96foxzQSpnk6vOBJfzQeTiQlK
 4czsmWKztFYhOFlcguYTPr6extghlE9Jei/Vo0mxvMsVP+km9/Km2LEfQDQJqq3L5/n0JuJsUBD
 w3nsgHr9BAKYlPW67CfMGZ/fZg9/VNvhwxqL99L8zIOp/DREldSFjUTYmnd++NnO5GpWXV75o9Z
 NsN7e5LPddwsZwPxpj1PSLPSG4ZSjlIy00agfI6KNIUADgSBj71RMyUkp9N+0W41zEbZqvLPvN5
 nLAB5zZL3vwdd+jY/sDwcjnu5jwl9+F+qDCAz2UDI2LBBs2EM2X5UynUKXPrkKHlPBAjSvQBo63
 pXWpqGLK
X-Proofpoint-GUID: uNLZDPNrDUOwOj3aEzZKou7oI_LqFdXk
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ae0263 cx=c_pps
 a=peiObFy/9J5zY6vzkL/ViA==:117 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=MnRh-OebXABTEl0PWvMA:9 a=QEXdDO2ut3YA:10
 a=1bpXJGBOwjeF4DSuyk4A:9 a=Aa2kB7t5TC07PRbR:21 a=lqcHg5cX4UMA:10
 a=uSskPZdq7w8du69dlLff:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

--000000000000d7436a063d492b53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have sent a new version of this patch series addressing
these comments.

Looking forward to your feedback.

Thanks,
Vacha

On Fri, Aug 22, 2025 at 8:27=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Thu, 21 Aug 2025 at 22:37, Vacha Bhavsar
> <vacha.bhavsar@oss.qualcomm.com> wrote:
> >
> > Hi,
> >
> > Regarding having the SME check inside the "if we have SVE" check, we
> were looking the the
> > Arm ARM, specifically the following excerpt from section A1.4:
> >
> > The architecture provides the following:
> >
> > - A general-purpose register file.
> > - A SIMD&FP register file.
> > - If FEAT_SVE or FEAT_SME is implemented, an SVE scalable vector
> register file and an
> > SVE scalable predicate register file.
> > - if FEAT_SME is implemented, the scalable ZA storage.
> >
> > Based on this, we were considering the following update to the change i=
n
> gdbstub64.c and
> > we wanted to get your input.
> >
> > if (isar_feature_aa64_sve(&cpu->isar) ||
> isar_feature_aa64_sme(&cpu->isar)) {
> >             GDBFeature *feature =3D arm_gen_dynamic_svereg_feature(cs,
> cs->gdb_num_regs);
> >             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
> >                                      aarch64_gdb_set_sve_reg, feature,
> 0);
> > } else {
> >             gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
> >                                      aarch64_gdb_set_fpu_reg,
> >
> gdb_find_static_feature("aarch64-fpu.xml"),
> >                                      0);
> > }
> >
> > if (isar_feature_aa64_sme(&cpu->isar)) {
> >               GDBFeature *sme_feature =3D
> arm_gen_dynamic_smereg_feature(cs,
> >                     cs->gdb_num_regs);
> >               gdb_register_coprocessor(cs, aarch64_gdb_get_sme_reg,
> >                     aarch64_gdb_set_sme_reg, sme_feature, 0);
> > }
>
> Yes, I think that will be right.
>
> thanks
> -- PMM
>

--000000000000d7436a063d492b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I have sent a new version of this patch series =
addressing<br>these comments. <br><br>Looking forward to your feedback.<br>=
<br>Thanks,<br>Vacha</div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 22, 2025 at 8:27=E2=
=80=AFAM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">pete=
r.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, 21 Aug 2025 at 22:37, Vacha Bhavsar<br>
&lt;<a href=3D"mailto:vacha.bhavsar@oss.qualcomm.com" target=3D"_blank">vac=
ha.bhavsar@oss.qualcomm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Regarding having the SME check inside the &quot;if we have SVE&quot; c=
heck, we were looking the the<br>
&gt; Arm ARM, specifically the following excerpt from section A1.4:<br>
&gt;<br>
&gt; The architecture provides the following:<br>
&gt;<br>
&gt; - A general-purpose register file.<br>
&gt; - A SIMD&amp;FP register file.<br>
&gt; - If FEAT_SVE or FEAT_SME is implemented, an SVE scalable vector regis=
ter file and an<br>
&gt; SVE scalable predicate register file.<br>
&gt; - if FEAT_SME is implemented, the scalable ZA storage.<br>
&gt;<br>
&gt; Based on this, we were considering the following update to the change =
in gdbstub64.c and<br>
&gt; we wanted to get your input.<br>
&gt;<br>
&gt; if (isar_feature_aa64_sve(&amp;cpu-&gt;isar) || isar_feature_aa64_sme(=
&amp;cpu-&gt;isar)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBFeature *feature =3D=
 arm_gen_dynamic_svereg_feature(cs, cs-&gt;gdb_num_regs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_register_coprocesso=
r(cs, aarch64_gdb_get_sve_reg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64_gdb_=
set_sve_reg, feature, 0);<br>
&gt; } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_register_coprocesso=
r(cs, aarch64_gdb_get_fpu_reg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64_gdb_=
set_fpu_reg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdb_find_sta=
tic_feature(&quot;aarch64-fpu.xml&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0);<br>
&gt; }<br>
&gt;<br>
&gt; if (isar_feature_aa64_sme(&amp;cpu-&gt;isar)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GDBFeature *sme_=
feature =3D arm_gen_dynamic_smereg_feature(cs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cs-&gt;gdb_num_regs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdb_register_cop=
rocessor(cs, aarch64_gdb_get_sme_reg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0aarch64_gdb_set_sme_reg, sme_feature, 0);<br>
&gt; }<br>
<br>
Yes, I think that will be right.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000d7436a063d492b53--

