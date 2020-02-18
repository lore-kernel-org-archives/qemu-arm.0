Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5956144lfp;
        Tue, 18 Feb 2020 02:06:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuA/vbuVRmBAWt5Hn4nor5M2wA9f+D0OaGU+bxDi61M7/2U6sPnHfRfasiQNYD9VWGhJg3
X-Received: by 2002:a05:620a:1112:: with SMTP id o18mr17473678qkk.126.1582020360890;
        Tue, 18 Feb 2020 02:06:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582020360; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/cES/Yjl7cfNTbfOcL32+Ok+S6TaO8/BpgSKxG8F0VvggcR6dPp1V0hH7Ba4tH0Cy
         ZWxdcb3uV+g3tO2rRTIgO1d+I+Rw2wK8dUuB2sXU1McrUozofEivoDEphe5BzSmEf8CG
         h/qE6gldZDlwumG05o3u94tykdKYprF6XjsH8AaK/MtwpnGNS1bIYtDwvfaEKqXS6cGI
         uSF0rqlsjdSZQz/z3ysGe1h+4YV/GMVi+hy7sF2V+Nv/XGWwc3rd0TmdWkWmX7PlHjm4
         w/gzKAoqMZLFhmI1+7D1Ajj+dW5PLJ98K09hXs/vFgUGXbXQCTMAVjdV+Vo//0u+VqEZ
         4B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=7fA3qA3hN2cAGYJmN+23/u+eYsRYv732LFFW/O7nLGA=;
        b=PTMDR4KJD3HaMw9aozCeWMNz5RN6MMNyzwd7M5BYaZDkEXovo1Nee0omPNyAkKD5TT
         Mf9DmSmUCRyPW/TEvGvlyyBQEQVvvAihuNbMhzgoP76oCH6ZOwh4psjTEqk53Xcb8d6O
         e3UXiF/rhJZ1OnD8kn53nwuHt6oMHIkiFQ6g6h33qrWYpWL94XDwbhgojkNJJScl1FQN
         bq51G4DqTqnviygWGZZIYfWFfIauCi/3DC+s5I2dSPclWqMyy0BtZLuYd7jQYaxxqBQL
         015lyy3mOpOc419JoVev9RVT0gx6dk+XWxNWs91uFB8dehRFAH2MWbdd5EFo14Alag6c
         E0yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S2kXHtmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si1439552qti.136.2020.02.18.02.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 02:06:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S2kXHtmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zlQ-00063i-BO
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 05:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zlG-0005wj-DR
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:05:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zlF-0000um-Af
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:05:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47112
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zlF-0000uC-68
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 05:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582020348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fA3qA3hN2cAGYJmN+23/u+eYsRYv732LFFW/O7nLGA=;
 b=S2kXHtmATwfmQv0zzY3IjIYuH8duhex7C1Ih6Q/b9DC2TJKudPA3SccNzii2lVcFPi4Xf4
 vhboeY/P64SUWZC5TVUnww0b9opDIQvBRGHoO7+qij7r2fhpCqMJRvGVgx6fb6VUUvY5v8
 v+znHJyf4m7irqs9T8KI2pmp3VyjEco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-31IcOHKSPqGEBO0qrYQR9g-1; Tue, 18 Feb 2020 05:05:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79B2477;
 Tue, 18 Feb 2020 10:05:44 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29CDF8CCC5;
 Tue, 18 Feb 2020 10:05:22 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:05:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RESEND 12/13] tests/qtest/libqos/qgraph: Remove
 superfluous semicolons
Message-ID: <20200218100519.GO3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-13-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-13-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 31IcOHKSPqGEBO0qrYQR9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOsZmAMIlY5w

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Fixes: fc281c80202
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
> ---
>  tests/qtest/libqos/qgraph.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index 7a7ae2a19e..ca01de0743 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -474,7 +474,7 @@ QOSEdgeType qos_graph_edge_get_type(QOSGraphEdge *edg=
e)
>      if (!edge) {
>          return -1;
>      }
> -    return edge->type;;
> +    return edge->type;
>  }
> =20
>  char *qos_graph_edge_get_dest(QOSGraphEdge *edge)
> @@ -590,7 +590,7 @@ void qos_add_test(const char *name, const char *inter=
face,
>                    QOSTestFunc test_func, QOSGraphTestOptions *opts)
>  {
>      QOSGraphNode *node;
> -    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);=
;
> +    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);
>      QOSGraphTestOptions def_opts =3D { };
> =20
>      if (!opts) {
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

