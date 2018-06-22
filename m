Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp569531wrq;
        Fri, 22 Jun 2018 01:36:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcvbfaNPWdZLYXkLMMbcJ6Akn9M0yesaBXBH1ywG9J+J5jFCqMxaDJAMsEyZQMduNLFjS8R
X-Received: by 2002:a0c:f748:: with SMTP id e8-v6mr540248qvo.174.1529656603773;
        Fri, 22 Jun 2018 01:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529656603; cv=none;
        d=google.com; s=arc-20160816;
        b=apaKTiM+MNZpTk5cafszS7rqmp3TZozCDcrqAOpf6ZDjptuEouKsdr2GD0D66hZpR1
         Vsco7VYDrU+JjSFI6V10jqh3eDnYbRdORdr45mAtvHTD18MtZa5ILB3/3bBlVU8KW2JC
         cW6Aur44ooDRVmJ1KZtdrjh+v12pU54lv+UoiONapzEKahdUZWB67MDUP0ngd/MhhUfs
         6MtGWUBSTezsGJ/nAlxbykqNiUaSJ3YUI1BlsMJtLGbgafM2MB1Tpu7QQYi/KGh/+PmB
         dfcY0WjBGbKTKgu2wHz0JUk4MKiQnvexfBL/EsXI9CK0EDmbaKP/9E15EnbsD5GqMOed
         6xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=jOOwzwiI3NIxphnuxr+qPtzfWLScRtE4uR01idFfuZw=;
        b=Sh5SK2tGS2dQadW2Zn3iESho+Y+Bj1mbNTqFneew9TcCM6e/yFM+6n4oS4NxTJHh9/
         W6ICSfaiQyGhFCtCjF8kstJ1NcVE4utSLb2uTdEirlGmzRwbeawHaE1EyENahVccD3OJ
         sSnmhviTVpo1nUUdyutagrDWpA6eJYAQPRQmzPlfoT2YoymXhsbF2+6a0el3jAA9bsiG
         tP3rJa/XKH++H0IJhYOvo62rr+DwlG8U80SeayIACWHSGWWrkwI4UthJ6fqb8O0NlllM
         sFA5fFCVs0ZzatOgwXB9HzJpCH/F3Pnme5LHwHEpmlyy8jy4RQnZ0M5yKlk1kbOxh9E+
         qzDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r16-v6si75986qvn.243.2018.06.22.01.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 01:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWHYh-0007Fb-5h
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 04:36:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fWHWw-0006Rf-72
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 04:34:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fWHWv-0004eH-7r
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 04:34:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54046 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fWHWn-0004c4-Nt; Fri, 22 Jun 2018 04:34:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B3D881A4EAF;
	Fri, 22 Jun 2018 08:34:45 +0000 (UTC)
Received: from [10.36.116.139] (ovpn-116-139.ams2.redhat.com [10.36.116.139])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12146111DD0A;
	Fri, 22 Jun 2018 08:34:43 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e8e5e2ff-9576-402d-1502-9b584b0295f7@redhat.com>
Date: Fri, 22 Jun 2018 10:34:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180621180224.8312-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 22 Jun 2018 08:34:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 22 Jun 2018 08:34:45 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH 08/11] hw/arm/omap: Use
 qemu_log_mask(GUEST_ERROR) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SniVZYeiFOy3

On 21.06.2018 20:02, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/omap.h | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
[...]
> @@ -997,14 +998,17 @@ enum {
> =20
>  # ifdef TCMI_VERBOSE
>  #  define OMAP_8B_REG(paddr)		\
> -        fprintf(stderr, "%s: 8-bit register " OMAP_FMT_plx "\n",	\
> -                        __func__, paddr)
> +        qemu_log_mask(LOG_GUEST_ERROR, \
> +                      "%s: 8-bit register " OMAP_FMT_plx "\n", \
> +                      __func__, paddr)
>  #  define OMAP_16B_REG(paddr)		\
> -        fprintf(stderr, "%s: 16-bit register " OMAP_FMT_plx "\n",	\
> -                        __func__, paddr)
> +        qemu_log_mask(LOG_GUEST_ERROR, \
> +                      "%s: 16-bit register " OMAP_FMT_plx "\n", \
> +                      __func__, paddr)
>  #  define OMAP_32B_REG(paddr)		\
> -        fprintf(stderr, "%s: 32-bit register " OMAP_FMT_plx "\n",	\
> -                        __func__, paddr)
> +        qemu_log_mask(LOG_GUEST_ERROR, \
> +                      "%s: 32-bit register " OMAP_FMT_plx "\n", \
> +                      __func__, paddr)
>  # else
>  #  define OMAP_8B_REG(paddr)
>  #  define OMAP_16B_REG(paddr)
>=20

Since the qemu_log_mask(LOG_GUEST_ERROR, ...) calls are not shown up by
default anymore, I think it would rather be better to get rid of this
#ifdef TCMI_VERBOSE ... #endif block now and put the qemu_log_mask()
statements directly into the omap_badwidth_* functions instead.

 Thomas
