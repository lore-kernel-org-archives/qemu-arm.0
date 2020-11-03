Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4582841lfa;
        Mon, 2 Nov 2020 23:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygkoBjZbLLZorpeCiZOCVvFGs7vzHpJYlKoVJjkJIQG4tbzVV/sKDuXViI/hkzhV6AaLDH
X-Received: by 2002:a25:8186:: with SMTP id p6mr28213004ybk.236.1604389111805;
        Mon, 02 Nov 2020 23:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604389111; cv=none;
        d=google.com; s=arc-20160816;
        b=s3uJsMDIlmwQrNarasj+96KfJH0CmwmBs6IeGSqaQnX+GfWV5XBaDppe1xTyJl/xxE
         cOhWicgtz3LNuE1ytMzpT+RChewdn//C2nLKP4ypYPs1GE5FxSwF/88W0hA6CCLGgEDD
         Xdqg+iMVxoF5ZXno4ieQlIzORwDw8xq5B0LDF2wQk67vyMk+W98AqH0bXewjHUKjByCv
         //kxMiVxbqAvKRL96YtifhOTxakKCEbEMSzpWf8hKQB9sLwPv89lC4b7yWDJyEF/MlbT
         rRqMCwaXEpsR/r5XQpo6Pd+EvTRAuYPS91q0QUAL6Xyxi5pa/haoj5rVvnNSA3/6SNlg
         W0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=KZbk8Pvu9P1MDRxHjoPxzMMUAgz/zXJ8ZOeV1XYIN+M=;
        b=uw1ScAe+S3HOwDg0xIt20f7ZfEkIgj9yVYDLtCfE6lQ1+00RSqbpcYuW9N7zhhwXbl
         GK2dYmrMvZORAooFDo5YzIA1S2OTfurqt03sXdTGX1g8HubrsigVbye8dMyCjCfEKVgB
         /ggBMVnPJVGaV7H0BFFNVxUqj3O+Oq3M9f4Q2rJUWsL9J+YAu1+Mz/j2rfkWlVkTjr0U
         KJnJ3Wf0dggnpoN+WnkLF9cOKoy/zlqgLCoZhCB9tF+IssGdZRQhNv10EAtCbx+QNrUL
         +2gkoJeI9udCA2ik5LjyCyqwLMysU9yZ29r+AtXAlXSF0z94HDzG42J5YJ+dZ2SZ2ZHF
         Hc5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j67si16645987yba.222.2020.11.02.23.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 23:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZqtj-0005Z3-4b
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 02:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZqtb-0005Yr-EN; Tue, 03 Nov 2020 02:38:23 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:50572
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZqtY-0004FX-PI; Tue, 03 Nov 2020 02:38:23 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 1DDDF5FBBF;
 Tue,  3 Nov 2020 08:38:16 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 14/14] target/arm: enable Secure EL2 in max CPU
Date: Tue, 03 Nov 2020 09:38:15 +0200
Message-ID: <4572030.GXAFRqVoOG@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20201102105802.39332-14-remi.denis.courmont@huawei.com>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-14-remi.denis.courmont@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 02:38:16
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vDSq5W2hJPuw

Le maanantaina 2. marraskuuta 2020, 12.58.02 EET=20
remi.denis.courmont@huawei.com a =C3=A9crit :
> From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>=20
> Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 649213082f..8c3749268e 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -641,6 +641,7 @@ static void aarch64_max_initfn(Object *obj)
>          t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>          t =3D FIELD_DP64(t, ID_AA64PFR0, FP, 1);
>          t =3D FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
> +        t =3D FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
>          cpu->isar.id_aa64pfr0 =3D t;
>=20
>          t =3D cpu->isar.id_aa64pfr1;

Answering my own patch as I have a policy question here...

This exposes SEL2 without TTST (small translation tables). On a logical lev=
el,=20
the two extensions are orthogonal. But per DDI0487, SEL2 implies TTST, so I=
 am=20
not sure if this is considered an acceptable deviation in QEMU, or if=20
implementing TTST is deemed necessary.

Note that there's what seems like an editorial error in the spec: VSTCR=20
documentation covers the scenario that TTST is not supported by the CPU, ev=
en=20
though then VSTCR should not exist.

=2D-=20
=D0=A0=D0=B5=D0=BC=D0=B8 =D0=94=D1=91=D0=BD=D0=B8-=D0=9A=D1=83=D1=80=D0=BC=
=D0=BE=D0=BD
http://www.remlab.net/



