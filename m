Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8180433wrx;
        Fri, 8 Mar 2019 02:09:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgyU/lXkWZo4OuM2Ex9WGXUxJoJTb+SuSXFtjN1clnHHwVx9c05mI0s58vj85nxnpmZD6I
X-Received: by 2002:a25:4108:: with SMTP id o8mr15584402yba.244.1552039774729;
        Fri, 08 Mar 2019 02:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552039774; cv=none;
        d=google.com; s=arc-20160816;
        b=jiJK+azwr5VbCQIWqQsp/d1U9wNkNYiNDAdPwIR4naNrmEbyLXM7hEzZN+Zv/JflRy
         plwrTvMsZYOc5vwKRKCmDKN3Qcrlnzb8tRUiS84d0G7y8zEvZnhqq2TLV9XRtAnj4u7a
         SIM/LJOGtfWKEg/s6zNkFJWOOt9X7nFmY4XbzFBY23IchbJ/vs3rEwOgzKujx1gHj+FP
         rupQo4WlXp5PmGcXu2uSsYrwwsvv3mLMtetQ7o+uOeUfPJrJJ4bqDMt+i3BagI+qfetu
         7TAFYOzebOqX0J/ahmsP075SHhBnX7VGB0W5St709FlyQ+tmliCNt8JzUVWpvK+7hRz7
         bXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=OwVOJwJBtwmAbFH278I+wNzSh7RytKG2eM4WYHNXF+Y=;
        b=zlTT48hVTnmBUSRFN7fyWF9LxEjV1bmuMXFbyCCuVcsaLAEMgrElRLKrG8i2hy330F
         nLzkpdDX33rOg4D3x6ioPL8TiSLhF/ted/g6SKrme8yl4JJyORMArSloPjPXLsxCIDCK
         BsdkW+kCvxAwMWSBcmvFh97/4ZJ5RsoHcvWE0piEFF4Y0qBm00gvgINl+KxpAmKyup7k
         Q4KGO6he+44yuTPbMKIdbTrr/ES3VfAL4RdUUHhjxNn5Y0OliFeyWm9Y6f9UO20urduE
         yx5PCGg9q/cf/m1UFzZPGlkN6GvfNs5Qlzd0q9sh4CrVMerPFxkx7IY1/a8b85oA9EzB
         NyYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si3974990ybp.335.2019.03.08.02.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 02:09:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2CRa-0004Kh-3r
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 05:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2CKe-0007RW-IP
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:02:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h2CKc-00048I-JX
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 05:02:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h2CKa-00045e-LB; Fri, 08 Mar 2019 05:02:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D314630718DB;
	Fri,  8 Mar 2019 10:02:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-151.rdu2.redhat.com
	[10.10.120.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BAD018BAB;
	Fri,  8 Mar 2019 10:02:01 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
References: <20190308013222.12524-1-philmd@redhat.com>
	<20190308013222.12524-6-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <08a34be1-9c4c-cd05-84f5-a83a461d63ae@redhat.com>
Date: Fri, 8 Mar 2019 11:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190308013222.12524-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 08 Mar 2019 10:02:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 05/18] hw/nvram/fw_cfg: Use the ldst API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7lOa8j6kSu5g

On 03/08/19 02:32, Philippe Mathieu-Daud=C3=A9 wrote:
> The load/store API eases code review.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 684c2cf00a..8eb76a382c 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -141,7 +141,7 @@ static char *read_splashfile(char *filename, gsize =
*file_sizep,
>      }
> =20
>      /* check magic ID */
> -    filehead =3D ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
> +    filehead =3D lduw_le_p(content);
>      if (filehead =3D=3D 0xd8ff) {
>          file_type =3D JPG_FILE;
>      } else if (filehead =3D=3D 0x4d42) {
> @@ -152,7 +152,7 @@ static char *read_splashfile(char *filename, gsize =
*file_sizep,
> =20
>      /* check BMP bpp */
>      if (file_type =3D=3D BMP_FILE) {
> -        bmp_bpp =3D (content[28] + (content[29] << 8)) & 0xffff;
> +        bmp_bpp =3D lduw_le_p(&content[28]);
>          if (bmp_bpp !=3D 24) {
>              goto error;
>          }
>=20

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
