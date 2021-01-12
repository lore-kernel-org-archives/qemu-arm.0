Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3324386lfq;
        Mon, 11 Jan 2021 23:30:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdwNeN+HvrWy2aEkQXYsOXzebdIBtA6Tsv0A5ZO9tf2O36F7NkxNr9OTBuzXSL6xlX6CQf
X-Received: by 2002:a25:50a:: with SMTP id 10mr5005395ybf.115.1610436609856;
        Mon, 11 Jan 2021 23:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610436609; cv=none;
        d=google.com; s=arc-20160816;
        b=zb8aO2CPvFGT4CfHauRYwRQVxJqjfvHS4CcfgMkilqKf7+aaPZE4KvZE/k1a9+PO+P
         zI+o389kt2/A+URYI1oaZleMsU/R7WolN89Zy+esvNJg56OttKGd58VFL3XkuC8rCJB2
         3kgkrlYTCoyrDluVPNs7lrR6z+aGGsnb/F7aQGSWhAU30/Y3YmmQGV8gs7CYVKIqK+ir
         z0ZBXVVZZVh0OPy9me14ORJHKVGBXZ323GSw8tmlIZRojjBdEPxLf4GnqQ8PzrAK1qxk
         EFV0JidilT0BmndxVdK33ytIqyQ9jUvCXXmbP0hPI7lAnS3oVlcAfJdY9yzvg2X7kQx5
         t6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=gQru6UOL4IFbnivLC0wZLNe/FpenhfZwaoHploLBnpE=;
        b=YziyBxUfNEaCBXte9H7pE954qxJ5bmK3Y0KT1ecGscb1hHX2OkpHZvvAZAfThktynU
         UqJICexP2WMu6VsZbQzDZD4Lm8HT8y4S5XisN+iAdm9LyZoOwwmICkrC7pVRXuMJGP1j
         aNLobOR6f1kMsTtKaKscxl3enxC0mPBQTWh/SPXEDjgALV6A9XT6R4Wk+OFgVISpGafz
         OqGsmjKg0oBdTFL2NI5tZpIkQzQEjoN5LYk1HEgX5FwFmisYD2ALx+g7tZ1JT/nHvrul
         8xn7rFTkSkQiPCmzuMFFpob46Egf9nngVAV0Y9XEoA9uflzp58xq8cX0Tm9+mjDCkT1L
         qybg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si2424276yba.445.2021.01.11.23.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 23:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzE81-00022M-99
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 02:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzE7g-000218-1X; Tue, 12 Jan 2021 02:29:49 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54780
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzE7e-0004Nf-EP; Tue, 12 Jan 2021 02:29:47 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 0D8A75FCEF;
 Tue, 12 Jan 2021 08:29:44 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
Date: Tue, 12 Jan 2021 09:29:43 +0200
Message-ID: <5671680.lOV4Wx5bFT@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <e46f18fc-8add-fea5-f598-c10570e7895c@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
 <e46f18fc-8add-fea5-f598-c10570e7895c@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: z3K1kDulTBF/

Le tiistaina 12. tammikuuta 2021, 2.20.31 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > @@ -3586,10 +3586,10 @@ static void ats_write(CPUARMState *env, const
> > ARMCPRegInfo *ri, uint64_t value)>=20
> >              /* fall through */
> >         =20
> >          case 1:
> >              if (ri->crm =3D=3D 9 && (env->uncached_cpsr & CPSR_PAN)) {
> >=20
> > -                mmu_idx =3D (secure ? ARMMMUIdx_SE10_1_PAN
> > +                mmu_idx =3D (secure ? ARMMMUIdx_Stage1_SE1_PAN
> >=20
> >                             : ARMMMUIdx_Stage1_E1_PAN);
> >             =20
> >              } else {
> >=20
> > -                mmu_idx =3D secure ? ARMMMUIdx_SE10_1 :
> > ARMMMUIdx_Stage1_E1;
> > +                mmu_idx =3D secure ? ARMMMUIdx_Stage1_SE1 :
> > ARMMMUIdx_Stage1_E1;
> > >=20
> >              }
> >              break;
>=20
> Was this a bug that we weren't treating SE10 properly vs two-stage lookup=
?=20
> If so, it warrants mentioning in the patch description.

I don't think so. There was no Stage1_SE1 before this patch in the first pl=
ace.

=2D-=20
R=C3=A9mi Denis-Courmont


