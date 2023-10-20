Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1004991ejb;
        Thu, 19 Oct 2023 23:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuLA9Hhe10nZEgoIpdhNpX6xDImeSggVLwkrXpf6nbY1rtKmCxbln8qVNdLkz/zDX0LWtI
X-Received: by 2002:a05:622a:646:b0:400:9896:b0fa with SMTP id a6-20020a05622a064600b004009896b0famr652310qtb.64.1697781675839;
        Thu, 19 Oct 2023 23:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697781675; cv=none;
        d=google.com; s=arc-20160816;
        b=CPzHqlvauSDpoaDt0tLAYzH5XwJTAJK/8li0dIZ0bnnCSKCu9xcWC8Wj6YO+tBp4Rc
         CyXUURahpfbgPqMKBgFa6rSBGFoUz2gCR6EJHTgAzaRX+HzKf86WmDat/sGiD1jPT7xE
         4fp0IugVKfg5HTS+aMJEDERcr0TmhO8wlorBzzPchsu0U1l0crn4AacRg1tX/SO8nrTT
         9p1/jWkrQj6mJqk51zqLDwW2Lc9fBBJxgRYwDHYxtIuReJLq/yW0fzcHJQ8nPrcrK3O5
         EQJsKycBb+NuwLdGwF0ztOY+AU5+qvtJgPLmOBtoA/OAnnNozb5QQsVOq57APBE+KBuw
         EERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=By6fFvCIZ+y84oZD5B6R+3yCZKFuimvkYCCwwog58Ik=;
        fh=beYvyTLMTzHVIUcktLXIIdaQpg47VUIrenr2Va6Wlwg=;
        b=a7IAHS1CbpDCM4XCL5F7QN68BcOJgcBzI2oz4SJszzg6Dlg93UX28diw6vNwslfLGI
         7AS8GgCSd4AgXdUOdDsuG4uIiWtnbAHlBagDUiRgWApYznsDeAK/H/u2+oLJrdU9gp02
         c0rJWZOizVESztATyWyatdi9T3tEVpFNoyC+90HfF1NzDGulq3OXOkyyptANAvA8do4r
         Ih6gomEJt5FYjZ8f9TXZPkcscn1iymc9W+vGmhYbkKqF5gNZ6cpxPREBDFDgM+s5eMaC
         4YggkEjpuqvDaQGgP4VdCAgp/qEaQlub7j9jhJUa7NMrX1YaI5NXiLsVi6RyiJsjOk9p
         eNrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8f2irpO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ac85a82000000b00417d1246db4si815251qtc.537.2023.10.19.23.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 23:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8f2irpO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtiZ3-0008OH-Ok; Fri, 20 Oct 2023 02:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtiYy-0008MI-GK
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 02:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtiYs-0000nI-Hd
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 02:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697781640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=By6fFvCIZ+y84oZD5B6R+3yCZKFuimvkYCCwwog58Ik=;
 b=Y8f2irpO/YY/GjqYy31yMuSUHZcZeYM1XnG4k+4+Bl9JKNXcnEyz2EGQwuIUB/T+ZYuBCQ
 aHRlpfXRxe7WinOeHqkFmJHWqwHux3b1bo5IAR+PfbaqDQ5w2qAoPt9Yd8IlGkqaK8DZuT
 kPbn/seEIDjkO7CTp+oRh/kBVJsDDf8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-XT1JhQtyMii97KXI78uJ1A-1; Fri, 20 Oct 2023 02:00:38 -0400
X-MC-Unique: XT1JhQtyMii97KXI78uJ1A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A436188B779;
 Fri, 20 Oct 2023 06:00:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8255B492BFC;
 Fri, 20 Oct 2023 06:00:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C3B421E6A1F; Fri, 20 Oct 2023 08:00:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org,  Kevin Wolf
 <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 02/22] qapi: Inline and remove
 QERR_DEVICE_HAS_NO_MEDIUM definition
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-3-philmd@linaro.org>
Date: Fri, 20 Oct 2023 08:00:36 +0200
In-Reply-To: <20231005045041.52649-3-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Oct 2023 06:50:19
 +0200")
Message-ID: <87h6mlbzp7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
X-TUID: OcMYreyLTURT

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Mechanical transformation using sed, manually
> removing the definition in include/qapi/qmp/qerror.h.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/qapi/qmp/qerror.h | 3 ---
>  block/snapshot.c          | 4 ++--
>  blockdev.c                | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 1a9c2d3502..168177bcd7 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -17,9 +17,6 @@
>   * add new ones!
>   */
>=20=20
> -#define QERR_DEVICE_HAS_NO_MEDIUM \
> -    "Device '%s' has no medium"
> -
>  #define QERR_DEVICE_IN_USE \
>      "Device '%s' is in use"
>=20=20
> diff --git a/block/snapshot.c b/block/snapshot.c
> index b86b5b24ad..eb43e957e1 100644
> --- a/block/snapshot.c
> +++ b/block/snapshot.c
> @@ -345,7 +345,7 @@ int bdrv_snapshot_delete(BlockDriverState *bs,
>      GLOBAL_STATE_CODE();
>=20=20
>      if (!drv) {
> -        error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name=
(bs));
> +        error_setg(errp, "Device '%s' has no medium", bdrv_get_device_na=
me(bs));

Break the line after the last comma, please.

>          return -ENOMEDIUM;
>      }
>      if (!snapshot_id && !name) {
> @@ -420,7 +420,7 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
>      GLOBAL_STATE_CODE();
>=20=20
>      if (!drv) {
> -        error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name=
(bs));
> +        error_setg(errp, "Device '%s' has no medium", bdrv_get_device_na=
me(bs));

Likewise.

>          return -ENOMEDIUM;
>      }
>      if (!snapshot_id && !name) {
> diff --git a/blockdev.c b/blockdev.c
> index 325b7a3bef..e5617faf0f 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1422,7 +1422,7 @@ static void external_snapshot_action(TransactionAct=
ion *action,
>      bdrv_drained_begin(state->old_bs);
>=20=20
>      if (!bdrv_is_inserted(state->old_bs)) {
> -        error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
> +        error_setg(errp, "Device '%s' has no medium", device);
>          goto out;
>      }

Outside this patch's scope, but here goes anyway...  Elsewhere in this
file, we have two instances of

        error_setg(errp, "Device has no medium");

The user gets to guess which device.

Looks like commit b6c1bae5df8 (block: Accept node-name for block-stream)
and commit 7a9877a0263 (block: Accept device model name for
block_set_io_throttle) sacrificed the '%s'.  Can we put it back?

