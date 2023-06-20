Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp308460ejt;
        Tue, 20 Jun 2023 07:41:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+jopB7H3zoKHSAH6+tZYsJUrk/uhMmDi9af6PwkxeK895mWTGCKUOam06UWvwEnF5Z3Vs
X-Received: by 2002:a05:622a:1a0b:b0:3fd:e203:e698 with SMTP id f11-20020a05622a1a0b00b003fde203e698mr10046924qtb.14.1687272088712;
        Tue, 20 Jun 2023 07:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687272088; cv=none;
        d=google.com; s=arc-20160816;
        b=i1hh74gcx+0p1oTTKMugcOx4pUktp4Fyw12puFzpQx/uRC4x1eL6UfVtqkCfoq3JhH
         WQpL3NWjP5FdcxGJ3KIWnsr/30RGwn2MtSsOY8ENMa9kG6mFeLi7q+ZhIA8RTxCKzNPg
         K2+ilGj3Ksh1Y3f9z/ADvpXH5qaOtz0eVrXIQ3xJB24fUrsDtg1j1Mjbm+1LAXNAoODh
         rwPHI7GDN9OBXu9qdohGVjqzpDmoJsE4eMAFhd40sluOwLJPb0TXVOoDOKDnl6bza1/s
         gmy1YMxXaU6hsywL2s1u/Y17O8eQVSYUJqOA3MVnioay07x1CqgX/syRhn/Q5HhqBYOK
         spgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NS6iJj9ZYraYMqYtcqEbHnR62qF6mLsZRWuy0Yfoj5g=;
        b=okK2bUzw1MZ3OLgZlactg8MbyDr126UFt5hP0LE0aE7OsA5t0tptkI8q3+NYCdlJ79
         V0vpQCJdQAjZN6nSFmVehoOINxzzqgrL9zAXjRwAyHlkO1LHMnP6j7S0nnfseeROaFqe
         VxrkmxX80ZN7SH4ZALBxBnWu1ECyLxgAJ3YcUn+4sLNhTiPuzF6GWEoCPihA2ufAprNk
         5rs11nUoVu+8+mgpKmlRMCrCF/TGb347vpj+NKMHdrw3F04HCoaoVtPKm7/g53C49N6k
         mkY+KRIFGwe3WGyUsM4xOgvaCnMIR6N82yjYIc+pll0sKFYkRtK71Z7oRjfRRILTrIzh
         mDpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VCSjE9Nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20-20020a05622a025400b003f525da7fe3si804332qtx.710.2023.06.20.07.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 07:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VCSjE9Nu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBcXb-0004UV-Rm; Tue, 20 Jun 2023 10:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qBcXa-0004TM-3b
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 10:41:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qBcXY-0007AZ-Lo
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 10:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687272060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NS6iJj9ZYraYMqYtcqEbHnR62qF6mLsZRWuy0Yfoj5g=;
 b=VCSjE9NuRv5PsjQZaKEvqmg8NNSEhmryZXH8e+MxTSHr8irb5kjIG8a3343E+cWAb3x/6Z
 3MEyQccmArqWjfRCNRn5uhJJgSeR2l8L/JExlp4p7TNKpVZXPLxke/DeUDWWVkiIbWIX2b
 urZjkeRkwjYJkYNd/yK80jzsXh6k3Uc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-eF1IDbo6Nkqsd4mlfzO_ag-1; Tue, 20 Jun 2023 10:40:44 -0400
X-MC-Unique: eF1IDbo6Nkqsd4mlfzO_ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 797978CB787;
 Tue, 20 Jun 2023 14:35:39 +0000 (UTC)
Received: from localhost (unknown [10.39.194.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB5DC40C2063;
 Tue, 20 Jun 2023 14:35:38 +0000 (UTC)
Date: Tue, 20 Jun 2023 16:35:37 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 05/12] hw/virtio: Add support for apple virtio-blk
Message-ID: <20230620143537.GD2625194@fedora>
References: <20230614224038.86148-1-graf>
 <20230614225626.97734-1-graf@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f+gUStivgWLpd+Tn"
Content-Disposition: inline
In-Reply-To: <20230614225626.97734-1-graf@amazon.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: deudQCR4bDvK


--f+gUStivgWLpd+Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 10:56:22PM +0000, Alexander Graf wrote:
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 39e7f23fab..76b85bb3cb 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -1120,6 +1120,20 @@ static int virtio_blk_handle_request(VirtIOBlockRe=
q *req, MultiReqBuffer *mrb)
> =20
>          break;
>      }
> +    case VIRTIO_BLK_T_APPLE1:
> +    {
> +        if (s->conf.x_apple_type) {
> +            /* Only valid on Apple Virtio */
> +            char buf[iov_size(in_iov, in_num)];

I'm concerned that a variable-sized stack buffer could be abused by a
malicious guest. Even if it's harmless in the Apple use case, someone
else might copy this approach and use it where it creates a security
problem. Please either implement iov_memset() or allocate the temporary
buffer using bdrv_blockalign() (and free it with qemu_vfree()).

> +            memset(buf, 0, sizeof(buf));
> +            iov_from_buf(in_iov, in_num, 0, buf, sizeof(buf));
> +            virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);

--f+gUStivgWLpd+Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmSRuTkACgkQnKSrs4Gr
c8gXyQf/a/dAGy7yH5m+O8jsAgPajzhILNEhPzumEK/q/YdHE58pEBhJPl6KDcfc
X1fllPg9yiqfocCqGIIgqHBrj965W9P3O7MCMy/aFeIobK5BUYbhmtaB3OyYzbvd
fmMVoRZ4igjlQ50gyvoMYK6sKJ7/K9rjZlVyj9jQtNfJv++srwXwtbriNUgVKRgz
Qkil3OaaA3iuMqYE45z2LVifVd2VrsSj7K9E3W85gL+tRe0veBC9amhx/z//Dt4l
i8DmqNBd5lMNo4sqnqmtFzdYy+7Xv1B5C0GVr0Tw0lrdZchGsbZXdydJMa6n8sqQ
i7XiN/+L8o36OM08f8Eujc430udbpg==
=yRQO
-----END PGP SIGNATURE-----

--f+gUStivgWLpd+Tn--

