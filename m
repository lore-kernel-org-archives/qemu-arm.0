Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp77234lfu;
        Tue, 26 Apr 2022 02:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu1TUpqIW64nKhn46MhNiRzGFE0PhvQvtppZnc25QIxYH5e8UUJfmCD7rlh5mrgh+Vnz6b
X-Received: by 2002:a37:5584:0:b0:69e:d812:4b4f with SMTP id j126-20020a375584000000b0069ed8124b4fmr12184696qkb.45.1650964158072;
        Tue, 26 Apr 2022 02:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650964158; cv=none;
        d=google.com; s=arc-20160816;
        b=W95/gdd0etuimjv6rAY0lE9kp5RH3fBudjAarzdeYpcTMp5qyCmxmAQhHd8X7mAuLj
         kncXzwkOxPD49/0HCrfU/kTxY1I4VX96IK2gdbaCjlW0IOc4FHb/o9hdfT+KxFAO7V3G
         l8CnWQyt+EroaxUQdAzNyYKt6irdyzW5kaKFf3usdRZY7NrO4nfkTUXIxuA7N8Yafhta
         qyDJ6Pa5cjAIFvkN81i5GBk/sLes4a/t3SqY9TZVRwNGW0A0uTM7OcJRG9kjqYnyCft1
         fJs2PFTD53w4qzheA+ifOc++b3UkThhqVtRt3KvIewo4BrVndP7XDBjNmN7OXhmHV6+o
         a4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4UMWZP+S1ig7zzcHOBBbKvy/5mzU8oAd8Skcp4UhlxU=;
        b=OsSUmmn8zUJK2aqGEu16wjIwn5UuJ3sRT6taqxTn6nohXa8+BWTO4Uac5JIlHbJA3R
         BXCxgoLMvFjFSKQNcvCFfyiL3v2tTgHZDgpFnomMn5yJZPyT/K6qzn7NWuxSDTGVBC3+
         Qd4li8JFF1bk+GP6EPS2ky61a1MANha0IpeY6sMsOuMxnANufF4n/Dwwntg1IBh05SQ7
         fBm6w10tF6J42kIwpuBpNq3nl7VcHRf6GI4Xvn4StSzj54dYzmjG9MyGVLdF9ri41Pmf
         c4VktQaDQl689xNyT7wmRdqXxosfEbxuQXiJ9j0lHhHdJuDw9T6KUq6lb8TaRsaxGy48
         23jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F5HNnLNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23-20020ac851d7000000b002f1d13494c6si4780269qtn.561.2022.04.26.02.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 02:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=F5HNnLNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njHC9-0008BY-Hi
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 05:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njGyf-0003kU-3x
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 04:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njGyd-0000xO-J7
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 04:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4UMWZP+S1ig7zzcHOBBbKvy/5mzU8oAd8Skcp4UhlxU=;
 b=F5HNnLNNd8h8ljPvapfQ3Jg/R1/meri5BHMLPEJFzXzGbf/0vb0oT8iUocTN7CMtzyLy10
 pCNjTdmXZR8tk9166LY4mFBKFqsvpT+bMD8fWnk32bPzb3HUZHy2J2F3DNPLzWmYPpe24w
 fZowrAL1Ki6WXi5zdyHmc/pRdsDM+Ig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-BC7sMEHwMieLITKtRuO3Nw-1; Tue, 26 Apr 2022 04:55:17 -0400
X-MC-Unique: BC7sMEHwMieLITKtRuO3Nw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D18E586B8A3;
 Tue, 26 Apr 2022 08:54:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A822428EFD;
 Tue, 26 Apr 2022 08:54:39 +0000 (UTC)
Date: Tue, 26 Apr 2022 09:54:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 00/18] RFC: Remove deprecated audio features
Message-ID: <YmezTbozi9qjEzm1@stefanha-x1.localdomain>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gqisuhwj0IRf8Qnd"
Content-Disposition: inline
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qWRVA1WW+F+y


--gqisuhwj0IRf8Qnd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 10:21:43AM +0200, Martin Kletzander wrote:
> I wanted to deal with https://bugzilla.redhat.com/2043498 and I got a
> suggesstion that removing deprecated features could actually make it
> easier to propagate the error.  In the end (last patch) it turns out the
> error is still just reported with error_fatal, so it probably is not
> really needed, but I really wanted to dig into QEMU more and learn some
> of the internals for quite some time now.  So I used the opportunity.
> The one-liner ended up being an 18 patch series which was, for someone
> who has just one commit in QEMU codebase, a pretty challenging task.
> Although I tried my best to do things properly, I am not sure whether I
> handled everything correctly, hence the RFC.
>=20
> Any comments are very much appreciated.  Thanks and have a nice day ;)

Hi Martin,
The -soundhw removal looks good to me. I'm not familiar with the audio
subsystem so I didn't review the rest.

Stefan

--gqisuhwj0IRf8Qnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJns00ACgkQnKSrs4Gr
c8hlQAgAnSTgpon9DyHtiOjo7MjmkNCoDctEt60CsSNLCpwpPHvWMgoTkY4GPhnq
dnXmC+EWULqiwZYLg4TotKV12H9Zl51SvbGCpzcKwkLvfF1/9Vwm+Lshi/qhMjVE
iTn5OWa+MQaP0uwcS//j7/G31MZfp7dM9zk2soPrmkMszqu0Sz16u9L9m4eyfmSi
PnlPWMbVNVt0UpTJiZ5P3DlCoHkSRWsMmG2dcj58fhyZw3jR4Oi5XkxPaivZXXKp
9Oeo6K1UkPDgLVGirgm8U3zxsbv5oJ8q7yu1dvgZtlBF3MtkGgJbKNJFuqFLAs85
7yrrS3RabtZWkYVeif0z6vX5y7JbUg==
=TgWM
-----END PGP SIGNATURE-----

--gqisuhwj0IRf8Qnd--

