Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2942228lfo;
        Tue, 15 Mar 2022 08:07:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOMwi/zAyxFycs7RROpQjqTo5pekvh0LTXDjJyPknF1nYNbvDNYd9FmMuHS6+xWF7E5x9F
X-Received: by 2002:a05:6e02:15c6:b0:2c2:5ab0:948 with SMTP id q6-20020a056e0215c600b002c25ab00948mr22395324ilu.171.1647356821594;
        Tue, 15 Mar 2022 08:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647356821; cv=none;
        d=google.com; s=arc-20160816;
        b=UeoDC1IT0dAThzX4HVecxETBF729gLoZz5siYmoklDjpMY++8Hucg9SZAzkSRUXCrl
         pY/rhe70BbzJ/Lz7W3LQjDnODqmb4X/siDC2pkPvCMJ74httgAnb7HyiCdw1zJWncely
         iilmV+xBGN1Nwtel/ZtrSFHoFC/o4twzjJ/mrZENXnHIAxdE/KXYmcN4wFtPsIxln/Z8
         TW97jGyX2hKs3d9h9s+syhj8G0qQYtS+RUq/Vid44N5xbGD79jgb/gdce2WZSGlVmY/R
         hI7pIEW6Y4rMVYGA5zpqxyeYaCU3kZy/ZGrmSKAHJUPE73Y74Ft6iKAOLVYu/IS4kklC
         p/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=b1vtrqtreGEjTX28OgdREfjdZTT2OuSjlmz6kED2+DE=;
        b=k53uX68wbvyT2VdlUhF1KE9lPbHYNozMvuPZGeeuESd0vpTWnjDQctBVatSj2dS3gd
         WoKZq1ibEye3VuInRjv2UpDQjXcKie4op2/x2Hu0NbyYsITQ+bcFENwOhr4ReMMrqAw0
         XHCU8l3EMA9cSa0oMkZ0II4DYnM48KFcbwJYuZEMHhgqWXJL5f29enjYaZPZ7Gm9vzkh
         LsFyyBuM0LXYZDRCW8cdrrv0pV99rwlrKvyp3ETI+/br25nZpzpsVQgEgF9XZatpARap
         UtRLBo3PUNgwAWyp3NVc5Z7kWzPOUgTMg7LTJ+umdt9pR2SJFq1v+ALgSJqihqsQti8m
         0tsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a056e020de600b002bc6f27c19csi7740855ilj.156.2022.03.15.08.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 08:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nU8lJ-0004Hl-0x
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 11:07:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1nU8l4-0004HI-7Q; Tue, 15 Mar 2022 11:06:46 -0400
Received: from vps-a2bccee9.vps.ovh.net ([51.75.19.47]:50262
 helo=ursule.remlab.net) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1nU8l2-0005XU-6b; Tue, 15 Mar 2022 11:06:45 -0400
Received: from ursule.remlab.net (localhost [IPv6:::1])
 by ursule.remlab.net (Postfix) with ESMTP id 8FD3EC0233;
 Tue, 15 Mar 2022 17:06:40 +0200 (EET)
Received: from basile.remlab.net ([2001:14ba:a080:a501:23a6:ebae:8f2a:4d73])
 by ursule.remlab.net with ESMTPSA id OpAGIICrMGIKLxYAwZXkwQ
 (envelope-from <remi@remlab.net>); Tue, 15 Mar 2022 17:06:40 +0200
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Fix pauth_check_trap vs SEL2
Date: Tue, 15 Mar 2022 17:06:40 +0200
Message-ID: <2620199.mvXUDI8C0e@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20220315021205.342768-1-richard.henderson@linaro.org>
References: <20220315021205.342768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=51.75.19.47; envelope-from=remi@remlab.net;
 helo=ursule.remlab.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: U3cYbfu85QbZ

Le tiistaina 15. maaliskuuta 2022, 4.12.05 EET Richard Henderson a =C3=A9cr=
it :
> When arm_is_el2_enabled was introduced, we missed
> updating pauth_check_trap.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
> Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where
> applicable") Signed-off-by: Richard Henderson
> <richard.henderson@linaro.org>
> ---
>  target/arm/pauth_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index cd6df18150..739aa520dd 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -390,7 +390,7 @@ static void QEMU_NORETURN pauth_trap(CPUARMState *env,
> int target_el,
>=20
>  static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
>  {
> -    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
> +    if (el < 2 && arm_is_el2_enabled(env)) {
>          uint64_t hcr =3D arm_hcr_el2_eff(env);
>          bool trap =3D !(hcr & HCR_API);
>          if (el =3D=3D 0) {

Ack.

=2D-=20
R=C3=A9mi Denis-Courmont
http://www.remlab.net/



