Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp3267406ocg;
        Tue, 11 Oct 2022 08:16:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4RfqBe18vNh1SQMutARtaOE1Hqgfc+7+kR1ZNIDfZcDoovWQRzfJRew4uhCHe9pbpsjY0M
X-Received: by 2002:a37:4553:0:b0:6cf:4dbd:b5f6 with SMTP id s80-20020a374553000000b006cf4dbdb5f6mr16879260qka.339.1665501402594;
        Tue, 11 Oct 2022 08:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665501402; cv=none;
        d=google.com; s=arc-20160816;
        b=Odt5w4aruFGlanddPvb1KS4btuIbL8Oyx0ryvKo4GVVQeJPAOcSd1zrPbO5bW1qz/C
         fL5EhBf5ZAZOHTmjbCLCdXZxOrV0kN1JDfiDX1Pacb2wbdyYDDjcghyyXfao3nhp8Py7
         LQNjRmgnDSTzBS7tZloVnnwWekeMHIdtZr0q3Im4cM8F3JzYcbFcdSv2qqIxvQCSWLOV
         M9E2k9HBT0SkrlLGgmE89s/FjBdDQRZZc3XkTZdDbx71T3IdXd/Gog4tTbAOqy4ni+Iu
         BTgiJJtN59mF7kenRO2YktBxUJKijzTacyWndAvrEwm3qAKsO72fs8vTaURmnCKzodRd
         TRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hHX8szJU5lcx5EEtgywgG95dJJ6buvOr4N4lK8qFRng=;
        b=WFNlz311LkqcxQCu+WReZR1bhZRwnf4ve0HPLkpME+1YnBQNhmzj6Ycc66QsMp53cY
         ZOtRy2DgqZK8v6v6POqw6PTdXlvOqPjMuINSckM25EqPUYBv8I632fbQcAT1e899p0Qf
         QSp6exyUWBoy2lB0X3Eb73GyQxHN71YS6dQ0xwWhRI+t7F4rnYvV9bi/59pi14Bxd6ns
         8eXM/+ffYwRyvCsbiLXlMSOF2ioVwagT5uG+WrQG1ix4it0ySD/jfmT0UWojqh1COXyd
         t3RPbKhYIhy12wql9TgZ2tKhD1G0Ge25jJ+eNCmZyR19HU27GzT8O5+65pNe4z40EnHG
         1tOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSzxis2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020a37ea04000000b006cf427bc181si6813227qkj.8.2022.10.11.08.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 08:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSzxis2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiGzo-00061f-BZ
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 11:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oiGw0-00030C-Pa
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 11:12:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oiGvy-0000Zh-Ju
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 11:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665501160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHX8szJU5lcx5EEtgywgG95dJJ6buvOr4N4lK8qFRng=;
 b=GSzxis2+Rbfuc0/qV/IEBQEr3SvBq9qSohKD0V2KXysygLmtEqi6H01Bgb45IwGi/4PvdW
 ggRo0qoWDqKeTBLjEuHm+6NfQr9N+GopccQ36US/Jxbys4GBfM3BOZcOnwo8/Hz4603xX5
 eEL1eCn2hxa+DFZCXf6t6J/Xl5Kzs+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-pcPQJl3tMVegkmptjmZ4CQ-1; Tue, 11 Oct 2022 11:12:39 -0400
X-MC-Unique: pcPQJl3tMVegkmptjmZ4CQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7867101A528;
 Tue, 11 Oct 2022 15:12:38 +0000 (UTC)
Received: from localhost (unknown [10.39.194.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41B7D492B05;
 Tue, 11 Oct 2022 15:12:37 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:12:35 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/10] Dump patches
Message-ID: <Y0WH4+1zi8SmJqtq@fedora>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BAQDXEqVhTaktHoJ"
Content-Disposition: inline
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3exn115TWhel


--BAQDXEqVhTaktHoJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--BAQDXEqVhTaktHoJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNFh+MACgkQnKSrs4Gr
c8jGSgf9GgMdODAWykAqQVDjYL02ZPZ1OCJzdqT1xtcY+HQz7v+UtpCL0Q3+14LG
CDxobk6SgXBUTQCIRcHroJRnG4HYshQNTboLlUjKoiMN3jM7e4NExPyTMKpFKlFI
PhQnD2fjUEfvTsWE1vdwKwIMsVr6eTes21kW/igOUE+FAbvABCciMjwA6FCqYN3+
V8hfUfoN2+t2I8Q5gCgEJDoRzjmvD3JIu7DrDHBW7NGGtfSsKeddyZ/xfkBv1E9O
S5Brz/HpZqm1MO3pIlSFpTgMi/oKC+7r5LVUvFqqP3hKp2LE23+XagiUtxYYVtS1
3ivn5b/bjEutjhszMd0M6Z3xpIZ9pw==
=V0Rp
-----END PGP SIGNATURE-----

--BAQDXEqVhTaktHoJ--

