Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp511570lfm;
        Wed, 15 Apr 2020 05:34:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypJPLdoQSRZH8xpHJ7nyqJGZsmwc2wAijG6lNvRLbT0kt689cbUXlmFl0istcMkwzx5svQrn
X-Received: by 2002:a05:6214:1e5:: with SMTP id c5mr4446761qvu.79.1586954082961;
        Wed, 15 Apr 2020 05:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586954082; cv=none;
        d=google.com; s=arc-20160816;
        b=OHi+P9CEcW3as1O84uQ10jYuuqPGoCjDtT+qgT6KTe0Dhsy5SNNTnRs4oDA7sdVroY
         R7hOUwIKWzFztzo7ol9MUNQrOPb8Ms8wefaNuXJaBulbNj5qdEU3pM1tllB30PIJGH/P
         3sTDTbHoT9pWWfpd7CjR3Bwd5jQ7buxYwN0YZEgNxlVJqSF9Km4Dk9chURUqdcqC6cIU
         YQh1MpGteWUozag2v4tE9PQVLMsnkLKL8ZIHaf6ZH5EkSDZyCm5TyfUsturyLyWeyU8W
         Jji+Z54od6H2VhQDl2B8vyF7IZWyMLuRhNz7krJNz+R29GAafxR6ucc3GbF8gGysyQaP
         g+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=AjITELnrO9zXzpwFXvDf1wViCmnwO9q8mSJTOlJwaPQ=;
        b=EjBuoeeabpL9L4M8vTH5yEU2+cYqw5zC7RQJ6l+UOzuI7sCy8hAdCr9F7Zvf6nAlgM
         OJ/oiQaS//Ea1s5zwMM9IKLNhSe711pl6pKsEZ8eVxN6gq5jEJ9U+ibvgkc9FgTIj2H8
         ry+UDYuOMvHzbXNhf1Vb1EdXe3BmGSA/5amaYBEUnXTK7divXY9H7ZBCLVO5Vi09ujhW
         0NiSzS/g+tl9hsXohVKkPJU1g2mVqDMrbetJwjiVKfVy2qs28B08jWBxwvIYA53vCTf1
         egE5IzXEABAHZoGoRrgKhiE7dSE2eAJieGuA2/Eln6KyXW2sxZLpvQwnuM8VgGAn6UBp
         zucQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kpk08ujx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si8193381qth.70.2020.04.15.05.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 05:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kpk08ujx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOhFa-0006Ri-CK
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 08:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jOhEH-0005Xf-AD
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:33:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jOhEG-000806-0O
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:33:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56760
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jOhEF-0007zN-Sw
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586953998;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjITELnrO9zXzpwFXvDf1wViCmnwO9q8mSJTOlJwaPQ=;
 b=Kpk08ujxApKQAnZ+cmOY/EelgqjgIE6c3zh64cl9MR9UEkrodI2/Gw/YXwv0GJiYcSLIdi
 IhL5vhhX3fVKD+CSTocOGd88VFxpahFY9vDHBlI3L6iG347qwnQw/RZi5JlXL+ljAEcnHW
 iuVoXbNQ9zv1ovDZgPiLHKHPwOLZstY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-35qgMPhuOw6sYPz-SRf3dQ-1; Wed, 15 Apr 2020 08:33:16 -0400
X-MC-Unique: 35qgMPhuOw6sYPz-SRf3dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37DFD107ACC9;
 Wed, 15 Apr 2020 12:33:15 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F28405E240;
 Wed, 15 Apr 2020 12:33:13 +0000 (UTC)
Date: Wed, 15 Apr 2020 13:33:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.0] Deprecate KVM support for AArch32
Message-ID: <20200415123310.GC1344391@redhat.com>
References: <20200414120935.12719-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200414120935.12719-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QuGV2ZmaIsFy

On Tue, Apr 14, 2020 at 01:09:35PM +0100, Peter Maydell wrote:
> The Linux kernel has dropped support for allowing 32-bit Arm systems
> to host KVM guests (kernel commit 541ad0150ca4aa663a2, which just
> landed upstream in the 5.7 merge window).  Mark QEMU's support for
> this configuration as deprecated, so that we can delete that support
> code in 5.2.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I was reading the 5.7 merge window writeup on LWN this weekend
> and saw that the dropping of 32-bit support had gone in; just
> enough time to squeeze our deprecation warning into 5.0 so we
> can drop the code in 5.2 rather than 6.0...
>=20
>  docs/system/deprecated.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)

The docs are sufficient to start the deprecation process, but
we might consider also having a warning from configure, or a
message on stderr at runtime to make it more visible to users.

>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index c633fe2beff..3142fac3865 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -336,6 +336,14 @@ The ``compat`` property used to set backwards compat=
ibility modes for
>  the processor has been deprecated. The ``max-cpu-compat`` property of
>  the ``pseries`` machine type should be used instead.
> =20
> +KVM guest support on 32-bit Arm hosts (since 5.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The Linux kernel has dropped support for allowing 32-bit Arm systems
> +to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecatin=
g
> +its support for this configuration and will remove it in a future versio=
n.
> +Running 32-bit guests on a 64-bit Arm host remains supported.
> +

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

