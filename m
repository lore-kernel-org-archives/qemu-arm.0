Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2956491ejb;
        Wed, 6 Sep 2023 11:24:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4SpTb9OabwrCnEkVce6mHl8Z83HI9SuQvTgGVcH9hQXPNCY0x4oRQ/eYC1RYnabCqeuzK
X-Received: by 2002:a05:6102:245:b0:44e:a2ee:8408 with SMTP id a5-20020a056102024500b0044ea2ee8408mr4013435vsq.23.1694024699154;
        Wed, 06 Sep 2023 11:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694024699; cv=none;
        d=google.com; s=arc-20160816;
        b=FnobSaKuVVEIsk0U5VQMJODrlab2PgLa9G8yeF60BxhhGG5zlFiVIOfAPU2ZVJEKr8
         xTEaA9MUEVoXY6p4aHs+u35IMxKYo0VJ3x2ow673MHz8Sc3FaVFapqgdstpgvELnJyZ/
         /873OWIe5gcQoOQaciGNQe8GvPqH9riHDt6YUY87Jz92C9SYhhZpW7pTw/oVe13ey1Na
         uRASdrmRi547leZLLfMjUNCohOuuBkqmbcN8KN7yZjWVN7gpU2n0O42P4gS4F1fE0fqi
         ynIApcb63w/9w8tObk8+pcnjxg+qoyZT7oqko8/wnWegbRLWqVx1DwCu5PNbF+ul8gc2
         VjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=+baSq7qiQ//hYtxuAvyzqF6fR6J/0sYFJ6q1mOQ6clo=;
        fh=5V3NnYbYhqdxpMaqPEI7CpZFhLVaJVyDoK1mIYWZUnw=;
        b=WRoE9CIl2+MQQB1p6ZtjK+DKETmalxpsXbcxzO5KnwaATmr7+JGLf/kOKLqD6Nq8ae
         n99/tRlf3Dk1dYHFwuRi5fzswF2WazAIryESjd+VjsSekU4nSCoecbELGToOU5Jl3fQy
         vlFpXUuJLbeKZvftdBjBouofgvVZg0hG6d4nOBQqOYU3cmUrRxuX+uaHWhllKLxce5KA
         ZK+LYl5oezYXZYUk2cj/CnDuUVZAmmCKGXTTYm9i+17/rbBICcvG0XQTWhI/ZLgQxdgw
         sYhk4l2nE7rl+mqCAi+88zaPr705vkhdYPmfDZlevupXlMdetVVurLn6HAXmgCCdh45L
         E6fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RSHxxbjb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a0cf401000000b0064f4d7d85c4si10215812qvl.354.2023.09.06.11.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 11:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RSHxxbjb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdxCT-0001A1-W3; Wed, 06 Sep 2023 14:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qdxCR-00019L-DP
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 14:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qdxCP-0008Px-7N
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 14:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694024650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+baSq7qiQ//hYtxuAvyzqF6fR6J/0sYFJ6q1mOQ6clo=;
 b=RSHxxbjbDJ39P5N6/7uv5wwJKRXYOc4nG0rUBGm07O9lq//OFi8pQ8igTk6Ounvc3gLgYY
 rwsBWuvrbofqbBFyUlYwPtUP1CSU3EbyfTlr50qOyfNXfNQQmjErisiF2atcbkNOKq0ZiX
 yoOFAf6lG957zgpFBzpt3ViPXJJjAJQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-6J-mYOGlOvGjCpCX06wXXw-1; Wed, 06 Sep 2023 14:24:07 -0400
X-MC-Unique: 6J-mYOGlOvGjCpCX06wXXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1AFD182EF45;
 Wed,  6 Sep 2023 18:24:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67173200BABC;
 Wed,  6 Sep 2023 18:24:05 +0000 (UTC)
Date: Wed, 6 Sep 2023 14:24:04 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PULL 00/26] aspeed queue
Message-ID: <20230906182404.GA1282605@fedora>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="azU0J3sEjH/FQVCp"
Content-Disposition: inline
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0DaKGs3kMmDV


--azU0J3sEjH/FQVCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--azU0J3sEjH/FQVCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmT4w8MACgkQnKSrs4Gr
c8gBnQgArCMSfvmgC8tNjPnhGgLKYCczmZ53+XNMLQC32T8j7BWEMzUQJr56Z7bq
k4GQHErfo1OoIxaYQyRsDROu2leD29ifgSBbk/GVQDlUDzeQCFibnfJ2jH/MMPhr
jRqP+R5ZmvpY+yJ8PvXrWL9xC9OzOyU+iU2DTqIdkHPPTnVyhhWa8Lj1r1zt7bkm
9YlkHmQScTe1CcZud8KCigV+dMO7PmEklS2pUboOcfkZc1G7UTf53n6rrei81FbV
XkjRyQzXiqA0qpRG4LzUps4DXJAOpzxQQPuv2hQ6pmzJ6f5O/xzKJhYD8rMam8cL
fsANeCCyuwKtMaLh2j5oHbeyjuhcvQ==
=QMsS
-----END PGP SIGNATURE-----

--azU0J3sEjH/FQVCp--

