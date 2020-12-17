Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2483742lfq;
        Fri, 18 Dec 2020 09:13:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrOYcCufvu3dZMoWSUQQxkXXFvchE9eq1sCgygEawGvVwYriUFEyYdRfHLuq3cfOMKfp6i
X-Received: by 2002:a25:2046:: with SMTP id g67mr7019370ybg.199.1608311617058;
        Fri, 18 Dec 2020 09:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608311617; cv=none;
        d=google.com; s=arc-20160816;
        b=jbifo1s1EFa/Kux8bjxfhTB9U9gGmRdIxDvLi4w5ieg9oY2uAt4pmz1XGUEBYoDjNI
         sZ+13Ys7JHtmSi5onDPZ5i969/q/qRsK7vOoPvhQTn8GyOIev2UJhmAtfMnx9LwykhG2
         W2ooACTlrntP4LppqL15deQHW++jauJguGjv+b2dg0Ewszve3Ox6QOT3NEaEU/79Wkja
         nLgTFBMZ5EIl0NRSC+Hh7+UazXtZlOUYjupBbfEoNyMMnmr4I9ZGEA8I4GgiIOuecK3s
         /1CzKOTpXCdPzRpP2gWUfXhpYd/AZDrSNPguZihHkvpyJdnxRWwlVdFGHrSBjq//UEiw
         3JPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=EwBeDMgH3Kp9cppHD55XwlqzAh7idOu7q8t/VsFWDD0=;
        b=z47A0AC43mn0Q3QIUP08g9PLSbMSank1uCnGF9UAHPmcM1D2p0kSZ208C4wwSv70Zg
         TOCOUOXCtCrpGpOdYhRIIixK1WFMk8p2PaXmZZya26bwLlJpUINea5NC0qMCHSW5/eD3
         prkvYjZawujFXp9qhzZlKV9eu/QNeYJyMvg4Fs+7TEh91KusfNN7d/bh6zKqXTVz+IM9
         vOp7oSQqghQnk+nMrF+5krWLBcYd26qtyLos3Di0UilJZuwBKzQWWH3Mh6Epe80VRQyz
         3ZjBDRPfvZmtiD5+jmV+OinOuDHSua2xAOdGv9Gxjglh/vYrnF7lMqg7wGnHNm2L1liy
         BCNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ctDUoqEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v133si8001725ybv.365.2020.12.18.09.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 09:13:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ctDUoqEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqJJw-0006Xk-DV
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 12:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kqJJJ-0006Wq-Jx
 for qemu-arm@nongnu.org; Fri, 18 Dec 2020 12:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kqJJG-0008Em-Qb
 for qemu-arm@nongnu.org; Fri, 18 Dec 2020 12:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608311572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EwBeDMgH3Kp9cppHD55XwlqzAh7idOu7q8t/VsFWDD0=;
 b=ctDUoqEWN7KapOjA2AlLrXQCxf08zxHb3/fEhWnKSVft3dKyqmqkhAX6y026Z3Fa0dl9pU
 dHQXEVtho2xHJJphntP9ry0IGZjalgTkzjmIn5J4S90B3TkUurezAFo+Q+nnu9UpJrcGWd
 5tcCX8Jcb3NNQ638EARDbYSDk0nKaXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-hrdYafUAMlWrhHBTbKkA2Q-1; Fri, 18 Dec 2020 12:12:50 -0500
X-MC-Unique: hrdYafUAMlWrhHBTbKkA2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E53801817;
 Fri, 18 Dec 2020 17:12:48 +0000 (UTC)
Received: from localhost (ovpn-112-107.ams2.redhat.com [10.36.112.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9832C01E;
 Fri, 18 Dec 2020 17:12:48 +0000 (UTC)
Date: Thu, 17 Dec 2020 10:05:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist
 resizable
Message-ID: <20201217100501.GE4338@stefanha-x1.localdomain>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
 <20201130131104.10600-2-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201130131104.10600-2-zhukeqian1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
 kuhn.chenqun@huawei.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I98N5PxAJz7d

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2020 at 09:11:03PM +0800, Keqian Zhu wrote:
> @@ -1839,15 +1841,26 @@ static void dirty_memory_extend(ram_addr_t old_ra=
m_size,
>          new_blocks =3D g_malloc(sizeof(*new_blocks) +
>                                sizeof(new_blocks->blocks[0]) * new_num_bl=
ocks);
> =20
> -        if (old_num_blocks) {
> +        if (cpy_num_blocks) {
>              memcpy(new_blocks->blocks, old_blocks->blocks,
> -                   old_num_blocks * sizeof(old_blocks->blocks[0]));
> +                   cpy_num_blocks * sizeof(old_blocks->blocks[0]));
>          }
> =20
> -        for (j =3D old_num_blocks; j < new_num_blocks; j++) {
> -            new_blocks->blocks[j] =3D bitmap_new(DIRTY_MEMORY_BLOCK_SIZE=
);
> +        if (extend) {
> +            for (j =3D cpy_num_blocks; j < new_num_blocks; j++) {
> +                new_blocks->blocks[j] =3D bitmap_new(DIRTY_MEMORY_BLOCK_=
SIZE);
> +            }
> +        } else {
> +            for (j =3D cpy_num_blocks; j < old_num_blocks; j++) {
> +                /* We are safe to free it, for that it is out-of-use */
> +                g_free(old_blocks->blocks[j]);

This looks unsafe because this code uses Read Copy Update (RCU):

  old_blocks =3D qatomic_rcu_read(&ram_list.dirty_memory[i]);

Other threads may still be accessing old_blocks so we cannot modify it
immediately. Changes need to be deferred until the next RCU period.
g_free_rcu() needs to be used to do this.

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/bLU0ACgkQnKSrs4Gr
c8h+Mgf+IS0RkUmTpoHXTKsa66GScp11SfqJ/QP3bfrig/BykyvFTGEpzSY+F11N
9zASeC/fvB/dk8t/Bdl+5xzce2PyQ9i5PStow8iuZrCiYGyJHX6YMnRyj9sj7Gxi
WCVVhXPMIIlOdd0Ffs/xeKYGQDNDmgMApEVsh1bHwnGEeMqQNqqe8GVm6Bj1zy06
KoTzRFdZ6g4J8ZlFpe8WpIJ/vopVOhyhXd67cPT7FH89tHGBCDxS0fH1iPEuyD0O
qX1bwBpQsOjbIcUVQCVwqOfJ95KCw+30jdTXo7LVW2taJrw380Gc/v7CyPTJch78
+N+ihQT9dN0hbB1IV8ODgN2wCdopWw==
=f8dr
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--

