Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1006326ejb;
        Thu, 19 Oct 2023 23:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo4178QFMcEF0TpqtlHj6qRumD2CTODGvtUPYzGqbNGniHp2tfmyEmEcxFHpLTHo+oze1N
X-Received: by 2002:ac8:5dc7:0:b0:419:798d:490a with SMTP id e7-20020ac85dc7000000b00419798d490amr892056qtx.42.1697781803554;
        Thu, 19 Oct 2023 23:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697781803; cv=none;
        d=google.com; s=arc-20160816;
        b=I+lUQPEg1bOu3CQw1SQyuO+WFKUjvvXv+DxbLWGVDlPbnrHONHUp6NPObvs/7D0y5i
         TmIEsjv+/lZGbZT2iD4mWtDecdCkE2+WbzAtgeWqYrddrQ8i5H4Chje+/SMgya4UdLMu
         4e4UOk6VsYhJLGaDbE0IN/xobSODFaTpAM0oW0iGSr0RvgPcx4wr/oEKafuaZ/CCxCoN
         y7nQlcXoi3QcMed0fjMy0b9smIoiYoZ6RxkwcZ6xTd0f49MjiZEx4W3O6c70bXWQ8K1S
         2Z6bjEuFiFX0Vq/BrpcUxmP7DhKaJwVBWW0eLfM9eTkZWRKlpwJ7iOGMHvKVHlTXzNY1
         OJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=XvXd/CvwOLF3vatmL+w+Ha8aND4rxf13jwceXT75Sww=;
        fh=h3KSBVDjeKZweF6BTTNSOGEmMKonM27ABmBE2kAqYH4=;
        b=diU7QEHBenvYfe4RulBfOjKpixX9jBhVja8d2K8fNAGnt3upYaF5jV9yNf4KmHaH7f
         qz7hncLL+EOxUAekvHZpbdbRIcT3iW0xOQj0XvUbKOaVsy1bxLQUvc5ihQVBznzBE3+Z
         urD+lN2Ae2IF7idFcuKVa3Iack+a8FvSkcoetDcdWm3qmaq+Nitpmj4WkKMxNdPgMSPh
         KtKqVtBInHrm0qEkTzT2p/7cv/cNY3ifGN8SQbvnLZh16ELjJMFqQEZ8GmUzKZb73Ihu
         Bm3S7GEGYDGV1Os5irX42Etp4kvQNvkK68KdOmlX0lIiCZvqWZOFO0sT3TwiAmszYLEO
         NrfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T0ajzuN/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a05622a01c100b00417cdd2e10asi767002qtw.346.2023.10.19.23.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 23:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T0ajzuN/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtibN-000224-6o; Fri, 20 Oct 2023 02:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtibK-0001wq-4V
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 02:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtibI-00027o-Ir
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 02:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697781792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvXd/CvwOLF3vatmL+w+Ha8aND4rxf13jwceXT75Sww=;
 b=T0ajzuN//UJQoD6yYeuoRQ6LdMuUDWAYnoFZ9s0wFKWBXp8lrjhrysgBpBWQa0QS8xFNjX
 9NTMGkSovi5F3NSz174xHetlsoVDazxxSbJUcWHV/Yd9D7jP3zE7LhgbhWDVqPu4xgKnSe
 daMWk41qBS9vLYPyo7aRxDUIvVV5L7I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-FB2A_Z7ZPAG9Iyj0oaWwDg-1; Fri, 20 Oct 2023 02:03:10 -0400
X-MC-Unique: FB2A_Z7ZPAG9Iyj0oaWwDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1A193C0FCA8;
 Fri, 20 Oct 2023 06:03:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F9F7492BFB;
 Fri, 20 Oct 2023 06:03:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F62821E6A1F; Fri, 20 Oct 2023 08:03:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 04/22] qapi: Inline and remove QERR_DEVICE_NO_HOTPLUG
 definition
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-5-philmd@linaro.org>
Date: Fri, 20 Oct 2023 08:03:08 +0200
In-Reply-To: <20231005045041.52649-5-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Oct 2023 06:50:21
 +0200")
Message-ID: <87cyx9bzkz.fsf@pond.sub.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: /vl7vqMNUK0d

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
>  hw/core/qdev.c            | 3 ++-
>  softmmu/qdev-monitor.c    | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index daa889809b..e93211085a 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -17,9 +17,6 @@
>   * add new ones!
>   */
>=20=20
> -#define QERR_DEVICE_NO_HOTPLUG \
> -    "Device '%s' does not support hotplugging"
> -
>  #define QERR_INVALID_PARAMETER \
>      "Invalid parameter '%s'"
>=20=20
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 43d863b0c5..9b62e0573d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -479,7 +479,8 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
>      static int unattached_count;
>=20=20
>      if (dev->hotplugged && !dc->hotpluggable) {
> -        error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj=
));
> +        error_setg(errp, "Device '%s' does not support hotplugging",
> +                   object_get_typename(obj));
>          return;
>      }
>=20=20
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 3a9740dcbd..a964bd80df 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -911,7 +911,7 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>      }
>=20=20
>      if (!dc->hotpluggable) {
> -        error_setg(errp, QERR_DEVICE_NO_HOTPLUG,
> +        error_setg(errp, "Device '%s' does not support hotplugging",
>                     object_get_typename(OBJECT(dev)));
>          return;
>      }

Could factor out

    if (!dc->hotpluggable)) {
        error_setg(errp, "Device '%s' does not support hotplugging",
                   object_get_typename(OBJECT(dev)));
    }
    return true;

Idea, not a demand.

