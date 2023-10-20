Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1340065ejb;
        Fri, 20 Oct 2023 09:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUKrKZg8j3N1VtJZexktlbvyP3NR8kTheGl/QiVoM0b2OFJlJNxvk28ALifb6CG9Twanlv
X-Received: by 2002:a05:620a:469f:b0:777:659d:7fcb with SMTP id bq31-20020a05620a469f00b00777659d7fcbmr2571803qkb.36.1697818093235;
        Fri, 20 Oct 2023 09:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697818093; cv=none;
        d=google.com; s=arc-20160816;
        b=WJJtsbYCB3M1WalWwCGc7G697Hp2/z4fqVkieVYrqEJtrt1AYZbg5+RPoU40/N3aos
         ESdEhP31+IKK/YN2GdYZHxbttiW992Twp013FLtiJxUVVzDuNiyjckYA04uPAuLAhenL
         VGpQgWc8otlaJi5ooppLl08HbirgXqPOy7P/reX1UEN5fkHi1xRIg4K5lAncgVRye8TY
         XnLjxnMGzAQE1fjXDFxCdwXV7T4Z++Bhz1muiRo8Dlppai7pHIxtlJ76gzMOVP2gxvqn
         7PFcOqcVOnj8DBysGo7NBMy1z3rBdiT6azQozeyLsb/rb3IBUFeHZt79zPH8k0w5UkHe
         bB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=6sh2tTqqzt+fCS20R4EZXWMlcUrT2ew4eP3bmw4QvLU=;
        fh=z46/IVP2/IS7320ELdCiDQeXUFOSh5QhHN2bZKEsqnk=;
        b=QfAz/ysVUgYlhXmxLZnNPu61v0vTzxsyQEIh6iCsQyvN1UZsVQdLKctcijxyXPxwJV
         KXASLYJyc55zHcFVqgjdL/RKgHZmbD/nyXgQiYzDnlDTf1gXUFQ0vx7eptcIz/fnEcMb
         gQvqt8OiXm1U0KfhD3RD4GZtLjamVuQxRZ9/sB9xGQTaeY+Lx/VgSZVO00kd2GNhDFf4
         mYA9NXRSSEztB/jdNyyYKsaMvHK611r5MEwYUOBUn0yHuXJUjCOBz1yrwhTBxSKuIcdf
         h+q+nt4w2HQlP6/Am34uL/AG/Xt/VdxYYqZAuaQ7ff8TjZYuQzpzXwTZC5HqVt+LASOI
         QG3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LEyMBSBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr5-20020a05620a390500b00773a83f33aasi1685758qkn.698.2023.10.20.09.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 09:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LEyMBSBg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qts2j-0007pF-Qe; Fri, 20 Oct 2023 12:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qts2Q-0007H4-HF
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 12:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qts2O-0001d1-2H
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 12:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697818067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6sh2tTqqzt+fCS20R4EZXWMlcUrT2ew4eP3bmw4QvLU=;
 b=LEyMBSBg5LlbSwrsYPah2w8l9hA5MSjF4pqa5bt4Uo0og5jdCiSqhPqhw2+zGvY0TezpyW
 YuqOm+MTUc66WQZ6oAJBRZ5qO/+UMmGZRGABhKGMjrM3wthDDloqSMJD/s1yNTbLehZhJc
 CHf5wX6wBsoc2fHYQs7cpGf+Bj+RdCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-fMKHpESBMAGMrj_ARGJK_A-1; Fri, 20 Oct 2023 12:07:45 -0400
X-MC-Unique: fMKHpESBMAGMrj_ARGJK_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B34A88B773;
 Fri, 20 Oct 2023 16:07:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACFEF111D798;
 Fri, 20 Oct 2023 16:07:41 +0000 (UTC)
Date: Fri, 20 Oct 2023 09:07:40 -0700
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 kvm@vger.kernel.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Weil <sw@weilnetz.de>, Peter Xu <peterx@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jeff Cody <codyprime@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org
Subject: Re: [PULL 00/17] Migration 20231020 patches
Message-ID: <20231020160740.GA472217@fedora>
References: <20231020065751.26047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dQl1U8CNCS9+/GUj"
Content-Disposition: inline
In-Reply-To: <20231020065751.26047-1-quintela@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gPfLmf4d5j/G


--dQl1U8CNCS9+/GUj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--dQl1U8CNCS9+/GUj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUypcwACgkQnKSrs4Gr
c8gs3Af/d/J1Qw1a6oSy8Cx1C9N0Ia4e908KPVp3OfXPjwqroYXoyb3RWPdqxY7B
y3UUFgEr5C69ZOEbhb04N5tPc7QVvwcpmviB4DmcAtBycBl3sxCXWaejzvOmfm1w
m/Q5NUJe0EoKX6sSqYxx/99cZA998qotK+jsZHtPnvrB03MV3k03lUl3uPBEs5un
9G1GRWl/HFYFg11fdxJt9IozCzb5C+cirkU5SmEPHWGd7Ee6J/N7KPhSo0EqcKws
LaMox+Ic/cJClzZJ1yXyKHKFtqcognYx9+ViktOVCVIRE0IYQvUgD0nV0qIAV9r6
NKL/P6v8LUifcCk3eAoC8UarO0NVeg==
=CToo
-----END PGP SIGNATURE-----

--dQl1U8CNCS9+/GUj--

