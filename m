Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp303051lfp;
        Fri, 7 Feb 2020 00:27:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4NCyycm4kkc9Ziob7XlMirTfMtdtznAWZBYtFZZ5zGarYGljzcifPlgS+o2gVejIgNEXf
X-Received: by 2002:ac8:f02:: with SMTP id e2mr5961275qtk.216.1581064022693;
        Fri, 07 Feb 2020 00:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581064022; cv=none;
        d=google.com; s=arc-20160816;
        b=qAJVGtc5ss+yDjHsoTZ0Z5ggetvcI9KkNgQWt2d2Vg0Ka6CP4SXXtandwBZIGNYPad
         rUw7NqNEfKOAJBLl+lR9t/BfOfUMsKQSwCnqio0bOyoj8Lrz5zHZgCZvRjWUAlP92iG5
         tYS+2Tf5azbXXo5Gg+Li4qYjyJlU5XFEDCLn3ie/fK+kreMEk/4birZk8OHy7rTreKvX
         9jeQ6Zk46R5aCumQIy716ksf9rrDiS79FY7E8dmixi3ty/vVxIqSGW8TlCfFG6qxHGTb
         gSV2Vw+r2p2razsv2Gc1gJUrsCIAzZA6sHut0EtMceZvhe+4Kp6MSWWXPGUn0GZnMx5a
         Qb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=uwyqtmyEhZCV+SovDAOUhUZzsaUHNv+ozZ7l+V/puMY=;
        b=yHqLoT7BMuwuq+FAQurUjI0yvYRBAerba3WDB/9/+Z52VuFl47CrZ6o7JzKdsJqase
         fiGjtLofbtjiyYz/gmw0rA0f670QoxqBGYs883f7YVGV90+c9ny4x0Kd5xR267Ene2NV
         3y3JB9QF9Wy0A8lQVrDUJ95MChQqo8VUsIpbZov9sEOCEl5eM2tc5Mf17axwVuKNvU0E
         EWp5F5vavo5aBvDGpGMzCthqBerr8grz5RCKq1eN8HSHAAQO4FDNLadbA6amMt7Lzi3G
         ehFob3t4NPkZeIxMbmWXQ54kbctkwbY1r2VtiNlUVgodtGz93hOv63yNW2aBLsTxipiD
         XQSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="WOPm/+0Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si1015982qkb.191.2020.02.07.00.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 00:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="WOPm/+0Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izyyc-0002Yg-3i
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 03:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1izyyT-0002Y6-U5
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 03:26:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1izyyS-00014l-TC
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 03:26:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49680
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1izyyS-00013H-Pd
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 03:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581064012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwyqtmyEhZCV+SovDAOUhUZzsaUHNv+ozZ7l+V/puMY=;
 b=WOPm/+0QZRaSeg0aDeE+OGRZHw7e7Jx7ERzDnk2tRCxwOz0s8YWuczRWFDuFxx7MHd/b/1
 ZMLC6k7qKX49hY7UucAQDeVCVBKis6N+VHFWE1Vw+Va4fv1doovf2qofnGk5dOw5r1Ktpe
 1IWLBJ12VQnLstjz837iM1SxHNWp++M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-Vc0G0U-BMIGHRjxXbtnJ0Q-1; Fri, 07 Feb 2020 03:26:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4109DB22;
 Fri,  7 Feb 2020 08:26:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AE757FB60;
 Fri,  7 Feb 2020 08:26:45 +0000 (UTC)
Date: Fri, 7 Feb 2020 09:26:43 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] docs/arm-cpu-features: Make kvm-no-adjvtime comment
 clearer
Message-ID: <20200207082643.m7pkyjbx5h2o4zh7@kamzik.brq.redhat.com>
References: <20200206225148.23923-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200206225148.23923-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Vc0G0U-BMIGHRjxXbtnJ0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 96bs4ytITko3

On Thu, Feb 06, 2020 at 11:51:48PM +0100, Philippe Mathieu-Daud=E9 wrote:
> The bold text sounds like 'knock knock'. Only bolding the

Who's there?

> second 'not' makes it easier to read.
>=20
> Fixes: dea101a1ae
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> v2: Removed unrelated hunk
> ---
>  docs/arm-cpu-features.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> index dbf3b7cf42..fc1623aeca 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/arm-cpu-features.rst
> @@ -185,7 +185,7 @@ the list of KVM VCPU features and their descriptions.
> =20
>    kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  This
>                             means that by default the virtual time
> -                           adjustment is enabled (vtime is *not not*
> +                           adjustment is enabled (vtime is not *not*
>                             adjusted).
> =20
>                             When virtual time adjustment is enabled each
> --=20
> 2.21.1
>=20
>

Not-Not-Reviewed-by: Andrew Jones <drjones@redhat.com>

