Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1050527wrs;
        Tue, 12 Mar 2019 17:06:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyB+yf6e9Si+eLQceqnuDl5jdqE9FNj9dV38yCzW9SxBDfiIh52yUYqabW3g2xq5JlO0Rgp
X-Received: by 2002:a25:4147:: with SMTP id o68mr34047470yba.410.1552435574500;
        Tue, 12 Mar 2019 17:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552435574; cv=none;
        d=google.com; s=arc-20160816;
        b=KvJhDkB7tdlc9AYtuhMQEeeVZaIUnU+T86XrUmFz4+JtrI9ChQM1rZ1ruuHdYX/SgS
         AUgI6B7pA72h1FnvKLFP5WEwKoqrHpUhgYyYtBstnxo4AM5ooAejpHv3EllI1Wnn6PDz
         5/DizmkHZdW9XhORgYBjG3AtEIVfWQGCSjtwgKnalhTA0i5HfDlDRz/v46Z62PPzLKy8
         Zm+7OqmLEA594QJ7NjyVYTwpechaBwcub6PlDIyrCS6TSFwK/PfM/IhIKJXje/xhOP5x
         MpdUanjy9yrCATlAwS1701ex4HddLsUuxrKXNjCI00CQLWRkktsZgl3JSlXpdjGfyaBf
         YRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Zq2VmFCzSfGEaXPWs5Aljr02anskcQxLrU//EJA5FGg=;
        b=TbRyrUs9mMp5TiLLjPHo2uFWDZ2QHVpjx2nM8rJhL9xefyFvSCAzLyg9+ehVgqnB46
         taJ5vX2ueH9Y68cAdRsI5lBmbHQATVCr1cYQ2G6PUIyyXfvCEQFxgBrB0qF8723mS/Kj
         CHPpWj+715sZhnc0FSGqJ5pMYcJ+6aSlvfWuQD8TDPweFBMJWivRbKLlL1ktdpj665O4
         wf05fShBhhQkFC10PbOVtGBBWKUYvxfKMiPwZ6Q09kYMdXJQXlgMr6rj4ISXLdaYfDlT
         EzR9sZlCjMT22xopB+UEPVVbhE2lNF6GydtlseQCWRjjVbhffSGafYBH9oUI0XyUAtjq
         y/KA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si6360918ybh.302.2019.03.12.17.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 17:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3rPS-00020D-20
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 20:06:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1h3rOy-0001z8-HU
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 20:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1h3rOx-0003HB-OY
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 20:05:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1h3rOv-0003DC-QG; Tue, 12 Mar 2019 20:05:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC59C85376;
	Wed, 13 Mar 2019 00:05:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-121-71.rdu2.redhat.com
	[10.10.121.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2108960CC0;
	Wed, 13 Mar 2019 00:05:38 +0000 (UTC)
Date: Tue, 12 Mar 2019 20:05:36 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190313000536.tfraijkzfacr2yih@localhost.localdomain>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190312234541.2887-2-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 13 Mar 2019 00:05:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/2] BootLinuxConsoleTest: Let
 extract_from_deb handle various compressions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMxde7WEIeGv

On Wed, Mar 13, 2019 at 12:45:40AM +0100, Philippe Mathieu-Daud=E9 wrote:
> Debian binary package format supports various compressions.
>=20
> Per man deb(5):
>=20
>   NAME
>     deb - Debian binary package format
>=20
>   FORMAT
>     ...
>     The third, last required member is named data.tar.  It contains the
>     filesystem as a tar archive, either not compressed (supported since
>     dpkg 1.10.24), or compressed with gzip (with .gz extension),
>     xz (with .xz extension, supported since dpkg 1.15.6),
>     bzip2 (with .bz2 extension, supported since dpkg 1.10.24) or
>     lzma (with .lzma extension, supported since dpkg 1.13.25).
>=20
> List the archive files to have the 3rd name with the correct extension.
>=20
> The function avocado.utils.archive.extract() will handle the different
> compression format for us.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
