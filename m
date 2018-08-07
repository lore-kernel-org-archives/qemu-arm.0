Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4005219wru;
        Tue, 7 Aug 2018 02:52:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeahV+EL1TUE8/LnHXDp1ynbWIU1M2mCApDqVqhWl0j8MLvCpir/jRHfDCJhMpflWl6fu0D
X-Received: by 2002:aed:21f3:: with SMTP id m48-v6mr18610727qtc.121.1533635579226;
        Tue, 07 Aug 2018 02:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533635579; cv=none;
        d=google.com; s=arc-20160816;
        b=SwG4fftx65o5vJWL+D7JI+ZfaHqb+fubwNvoSRd38d59lLWB+GHi9tJ1krzrG9hCcx
         Bk87mgAZkftqRWWM8JuEDEDHcSnHziXlspXWF3XZI1jL8Y8PWH2PIIJOoHZ0GlSc2ZOn
         YJPUxdowgesFtLoPxKwOa+CEpTGQkseMNHmyiXzyxTicYpfwvEKBBBXqVr2/1OaW4/fO
         eZ49SpKriTyOK2EoZ2Y5qwj+mp38pLfQZfaTMojvpUBLn4wG+b+LjAEO+JluVpME/rf9
         f4EMJoXQaHtr6H3kSeVo99ogP8/8hQUVRc9OIFXi0Lb4mKd/jwczzsPOK89cIVwUkQMP
         UR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=6lACdjE7L0Qlc1yqyVWmO3fIgr4rhb0ZfhJ2tTGDGWA=;
        b=DZYdefZi5XiEQs6EuJUbxLAur38bdmNal/T10ptAqxj/d15yDQW8GpylIcjmF4CB48
         OvturHVmjWHOpjWDdoyEtpdXejk+XX9TWQxYeY5PArfEPrYzuhs3aPAFx56AdGXiAW2d
         BHQlyZsdPbWtlTghD+DG0wz7HPG5jso3+sWuYzNd4eikmGDjRBNsK52REWtvyfSlr6Rv
         yxhWCSux2rF7u2UvvKtMpy/k3lMAn+Ay+yVnbjrRKgpccEYaYOsESIaUYZCeuqV6VpK7
         41ls3TPrl5Kd1E8EeM15rLFeWUuXduIXykd2jgwLvf8kCKD6m2XF1CKrQO806YbGbfCf
         NtBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5-v6si870581qkc.120.2018.08.07.02.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 02:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmyfi-0003Vc-PO
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 05:52:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmyfX-0003UQ-Na
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 05:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmyfU-00074G-El
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 05:52:47 -0400
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:46663)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fmyfU-00070k-8L
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 05:52:44 -0400
Received: from player739.ha.ovh.net (unknown [10.109.143.216])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id EE60A1D56FD
	for <qemu-arm@nongnu.org>; Tue,  7 Aug 2018 11:52:34 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player739.ha.ovh.net (Postfix) with ESMTPSA id 2EC1B4A00AD;
	Tue,  7 Aug 2018 11:52:23 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <881a1c50-52af-d6b7-fdc8-5b9cc69ca5a2@kaod.org>
Date: Tue, 7 Aug 2018 11:52:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807075757.7242-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7773494432540298048
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.103
Subject: Re: [Qemu-arm] [PATCH 1/7] aspeed_sdmc: Extend number of valid
 registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MbmPoLdhlYtu

On 08/07/2018 09:57 AM, Joel Stanley wrote:
> The SDMC on the ast2500 has 170 registers.


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  include/hw/misc/aspeed_sdmc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdm=
c.h
> index 551c8afdf4be..682f0f5d56dc 100644
> --- a/include/hw/misc/aspeed_sdmc.h
> +++ b/include/hw/misc/aspeed_sdmc.h
> @@ -14,7 +14,7 @@
>  #define TYPE_ASPEED_SDMC "aspeed.sdmc"
>  #define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASP=
EED_SDMC)
> =20
> -#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
> +#define ASPEED_SDMC_NR_REGS (0x174 >> 2)
> =20
>  typedef struct AspeedSDMCState {
>      /*< private >*/
>=20

