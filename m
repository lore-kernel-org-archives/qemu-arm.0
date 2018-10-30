Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5190099wro;
        Mon, 29 Oct 2018 23:37:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fZ3Hr8Urcp5zTsSM58vQxhQjj0ZFNLAFgpIq8Ai/+qNytQHlHmYcmCcr16sq7ssQtLejYE
X-Received: by 2002:a0c:d107:: with SMTP id a7mr15834814qvh.104.1540881448939;
        Mon, 29 Oct 2018 23:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540881448; cv=none;
        d=google.com; s=arc-20160816;
        b=n660ghG+dywRIJElBw51oI/TiHA3nPY/CbV15XvCydrj7SwXqWRBnSeTyWezi5/GqC
         sNylzTF0cWaz8QJ6DTWRi52S+4M/n2Zf2dElul5ckQa3a2e0OV2BY69kQ0yqVGc50HlQ
         kvcfIPpk3R8zoskfVe1b6tRddhPRSg7ZUbzLoLyrxHgrmwlR8QjJBoDGVxr5Cqklubzn
         KCbo0lni4iA360fZTC4mWjEOvfSsC4zbPKCUgZqHrGrbJOR4w23i09FUqLKb5vOL2NhJ
         rfvkk7JNBJKYbQulI4jnvpMdiDoNDSJEz3+uWHNgETpP1ZJi4YNNbgGJ0lPll9PlyQy7
         5xiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=eMAQRv5reOwUPgZCubNpRjUMRn3q7OB0pfajsV82CeE=;
        b=iK/EeTOC9olKl4SRl27RGmtMqzB3d9xE0R/JDSqkPE7RcJNfJ0TGIegKu1bVpNiu30
         Zz4ala5bTfS7XOCbMrxcYGX8T1MDvmdJ6MOJYS+A86zsmTO2q+rKC3oGgmfB5tK4iwpV
         dYpdojSHlLsSYP1fl1IwIy/tzRF8T3AHT+cOV2UxyOrjWms7ovJktKFJQC0um52ZqTvA
         w0Kv2Bq+VFSjm75HrWnNNl8fgpI0CofC4H5O5P2GuZEVyvX8cUyeq04qMMDEk5wJET5x
         TCL6OmLedKT09DgmbXcaWjWPq4XCioMTURuYOMtQkQqumWNCJgmNox8N3bdZf2FAfbbt
         ZFEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b64si1332693qkb.201.2018.10.29.23.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 23:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHNea-0007hC-E1
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 02:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gHNeM-0007eo-Cb
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 02:37:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gHNeL-0004YX-3e
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 02:37:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56712)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gHNeK-0004Xt-S6; Tue, 30 Oct 2018 02:37:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0272E308FB90;
	Tue, 30 Oct 2018 06:37:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B9123DAA;
	Tue, 30 Oct 2018 06:37:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 80F2EB3DC7; Tue, 30 Oct 2018 07:37:08 +0100 (CET)
Date: Tue, 30 Oct 2018 07:37:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20181030063708.w6l2hslpoirsdhmn@sirius.home.kraxel.org>
References: <20181029223207.31878-1-philmd@redhat.com>
	<20181029223207.31878-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181029223207.31878-3-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 30 Oct 2018 06:37:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/3] usb: ehci: Add support for Allwinner A10
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vG/Si4m39mp

On Mon, Oct 29, 2018 at 11:32:06PM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> Gerd: You already review this code here:
> https://lists.gnu.org/archive/html/qemu-arm/2017-01/msg00345.html
> Can we use your R-b again?

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd

