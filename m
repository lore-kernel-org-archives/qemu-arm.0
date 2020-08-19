Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp490401lfy;
        Wed, 19 Aug 2020 07:14:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9ivB3L9UtABa00H6EIBaUjK1fTKw5HjT2XD3S97HVRNf96qXt1mUJVjnBfig3XxSfcRFs
X-Received: by 2002:a67:445:: with SMTP id 66mr10851347vse.205.1597846460748;
        Wed, 19 Aug 2020 07:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597846460; cv=none;
        d=google.com; s=arc-20160816;
        b=AyfmQ60QW7Bb6/rl8myOY4OJBo3L5m50mKpX9DnuwWXEvU1YzNJABDuba+imgN0unp
         HmcqdEajRfzITCOcH13gVPA4NpjQa4AiGfxkYV+iKL9gPD73yxiA1NDbKQig9gIIgIHK
         B/Krp6rw8VuwV+Ermc4f0F8q785rnUkmabuBJTbVTa/BEk+aoxVg57lvIG5dTia0Nv4x
         doPqSso/yozyFZYZ7HRJhgsCoewbtW4J/kzEAnc78PWa81IBrLFobKXU5sdxpKpL8CPm
         H/ImnQW23DzWz743+5fuT/C+8S8jz0MplkRcg4IhmA4U10p0ah7rfPeMUHnwHrgKJ6hY
         H42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=XuQSGk1xLC0D9Z9pnyuZtZwysCty3Vs4FCDNPxUoJe4=;
        b=DOkfz2zVHgOQOfYUIh2G6cuVjvyvRsUqX0dpgPYfpkeYWD87K95WMILcSl8Xw3I6T9
         RZ4vsVHMFmLAR0vFyRTTf9bFBWE5vgtX72bnIFHwmJxu/ozwcP+pSDOfc4EICwAc8ySA
         pZ/q16nv/OJ9iAaEoBmB59VMivl61EmxTWuR00VX7NDq4pe7bKExvdavClYMVFx/RziE
         F1yiL6E5anYdVZVq/6zH/3Q+SciNvLC4uJ66oVLesFRg/UNUANNjChNVs7KjRtAT7ZUm
         ewxIrV5v+MYLXYi8X1NDYav2aZ16WXN+llir+93ekPEpEI0RbYdELgrF2griPPqfMgtn
         4BTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CGPblsY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si4565756vsf.316.2020.08.19.07.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 07:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CGPblsY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Or6-0000jj-3F
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 10:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8Oqp-0000en-1y
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:14:03 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31573
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1k8Oqn-0006iY-DJ
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597846440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XuQSGk1xLC0D9Z9pnyuZtZwysCty3Vs4FCDNPxUoJe4=;
 b=CGPblsY8gEWGIP9f+11YXneNc35EYWSuW3Yys/hXNc1+48yxbdzzYWF8QZ7y7Hc6njTTiW
 aCFI7qfg1GrQfx2UnkWtdnhJQ7JCh4hHrjPYrcVi0h0FySxxrAsC3Kc3J+OljQg7wdCYKT
 XMulYRI9Tk9Z3LjdPc6cnJTsdDsPJIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Wup_fGVzMN2DD1MLxhF-lQ-1; Wed, 19 Aug 2020 10:13:57 -0400
X-MC-Unique: Wup_fGVzMN2DD1MLxhF-lQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1226664086;
 Wed, 19 Aug 2020 14:13:53 +0000 (UTC)
Received: from localhost (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD3C10098A7;
 Wed, 19 Aug 2020 14:13:45 +0000 (UTC)
Date: Wed, 19 Aug 2020 15:13:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v6 1/7] Open 5.2 development tree
Message-ID: <20200819141345.GE366841@stefanha-x1.localdomain>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200818143348.310613-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 cohuck@redhat.com, David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 David Gibson <david@gibson.dropbear.id.au>, Max Reitz <mreitz@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYV7PwD6NVjw

--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 03:33:42PM +0100, Stefan Hajnoczi wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  VERSION | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/VERSION b/VERSION
> index 831446cbd2..7d40cb9d36 100644
> --- a/VERSION
> +++ b/VERSION
> @@ -1 +1 @@
> -5.1.0
> +5.1.50
> --=20
> 2.26.2

This patch was sent by accident, please skip it when applying the
series. Git should do that automatically.

Stefan

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl89M5kACgkQnKSrs4Gr
c8g3vgf+OR00zpvolbOLjqmOV9qD1cl8sDnvjoDOkHD80F84nawezKgNV4fNHUhv
45jNcrs7yMs1xe1BugNvz8VYMJi6zq2I3dcQ6PwfxUZVQ6TcJfIfR9QlVbS2rXOn
YVHmq2ReiPNloFjr/Y/OGGkk50kuR/J2+ud4Gv0KZ/F9ZtrPvSnvxtE9ccDj8o7m
4xE8wwmlQZqUW9gQwAmcLwsvzpFpghoPOuEcd+ORFzBSNvvOgzyI1ckXJypk9OMe
Nsnos7QksaRAQzkPTqOqdZoEEEDjiyiWLJPONt3HtOW/ZqasRmd2Xij4hqN/YQnG
WyRVJECTMpTkzk56qcOwObiBdALzFg==
=VDDg
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--

