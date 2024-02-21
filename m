Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1985006ejb;
        Wed, 21 Feb 2024 07:20:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWtQkyPukB90nXUuNtH/E6NXZg3Ww+TzHeNLV6z7rLJqGZ7Rsgf5XvOc9LghuX3T1j90/hNu4nVFve1oTstB1NcuIoKkl8
X-Google-Smtp-Source: AGHT+IEKDNEQnIWRLRPa8IDd9JlgSIis4iXLzPWeVO62jerDH6EJ6LuxJ9IfcINV6Fy/B8okStvX
X-Received: by 2002:a05:622a:1052:b0:42e:2869:7f1e with SMTP id f18-20020a05622a105200b0042e28697f1emr5472319qte.47.1708528846725;
        Wed, 21 Feb 2024 07:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528846; cv=none;
        d=google.com; s=arc-20160816;
        b=EH+IBlXpBo0+4QUdACz2q88wBSoXPj0E2ZgoORC3Xcqi/Fkw0v6MO4H/0mQzjtYgqM
         eQQsnHHC6ZThZrKtClyo+lNo6IQ2T28zAjmLE3nE3RTVX0Eg5eTou82wk9dH8HsjNYEs
         xz1EmUcAMd5J6n0H/ARlH2H5lgfn5RvtPKlC21jvsxcIuG0I+LPWxtMpdWX2D6Utwmqr
         bhqN8A+yB5+ARtiU7KLTXBgeiQnKhgqw/fvbqxYTEjecQUq0DDvZQF1CKe+cwFO0RTFv
         Jz9GQw/j2O9fpq0E97fikqnAiFlkYszNMjaR05MbaJwfTJYaETEbcbQ6yzawXywBSvz8
         lrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=WpWsv7TXPJRwiwzaQ7u0AhVyyYRTTjtj1qipgKCR3gg=;
        fh=1RNoIdQyD5R61BslZul+TrPHEL1og0EE4iqFdst43XY=;
        b=kDBKF8JMpfisAPlt6FD4rICaqIyW4taoMkW6W0pwDFOMr/Lw9yuD6GobWkfekICZ82
         wQ5sr0o8kqyhWff5JCK0uXQnPzdguJ+VZXyU+645fdTWl7Z+eqh8XjFTtXD5pxmhByT4
         ENAxcLgK7bDbkgU9a9XiVLnVjRid+6x9mTCKMVN8lS2KNe0n3oYwKd7DzoL+1FrzXsfv
         eYsG/i7Kcp+aNZHFa1UI/bM4S6Ilr5EhBpERU2gFIdLye/X8bRo4qNKlEfEZAyKASQ+a
         55d6HCIBmsoGqr+mwsppFW59e8MwghQK+H+VJWSv/jp5A8BtWO6RtdCJBGexsqqGaf/5
         UjYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GyPvvhUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020ac847cc000000b0042de91c4276si10693214qtr.567.2024.02.21.07.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GyPvvhUG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoOT-0002Nd-Ib; Wed, 21 Feb 2024 10:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rcoKk-0001tO-Li
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 10:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rclA7-0000qU-16
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 06:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708516398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WpWsv7TXPJRwiwzaQ7u0AhVyyYRTTjtj1qipgKCR3gg=;
 b=GyPvvhUG/UgT4BVmNSDjGdsD9X/opmQR3eJPkTPhqWnT1aoa+4KGjEBUjTabU8VaOByeyk
 uZBGxsSdiHeOgR7mcENsfptFv0aS3eMYXSmu+i0Ue5U1kAJ9GTOhoIAR5W+8hUg3FLx6wH
 50MJikzxQRHCvcyPPSchTMkNnS22hbI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-iSS_1aocPZGcr1kIRgCKQA-1; Wed,
 21 Feb 2024 06:53:12 -0500
X-MC-Unique: iSS_1aocPZGcr1kIRgCKQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01503C0ED4E;
 Wed, 21 Feb 2024 11:53:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5CAF8CE8;
 Wed, 21 Feb 2024 11:53:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B82CB21E6740; Wed, 21 Feb 2024 12:53:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,  Fan Ni
 <fan.ni@samsung.com>,  Laurent Vivier <laurent@vivier.eu>,  Alistair
 Francis <alistair@alistair23.me>,  "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>,  Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  qemu-trivial@nongnu.org,  Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH 6/6] hw/vfio/iommufd: Fix missing ERRP_GUARD() in
 iommufd_cdev_getfd()
In-Reply-To: <20240221094317.994454-7-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Wed, 21 Feb 2024 17:43:17 +0800")
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
 <20240221094317.994454-7-zhao1.liu@linux.intel.com>
Date: Wed, 21 Feb 2024 12:53:10 +0100
Message-ID: <87h6i2uj89.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 51pTb6gVyx78

Zhao Liu <zhao1.liu@linux.intel.com> writes:

> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the comment in qapi/error, dereferencing @errp requires
> ERRP_GUARD():
>
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> * - It must not be dereferenced, because it may be null.
> * - It should not be passed to error_prepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> *
> * Using it when it's not needed is safe, but please avoid cluttering
> * the source with useless code.
>
> Currently, since vfio_attach_device() - the caller of
> iommufd_cdev_getfd() - is always called in DeviceClass.realize() context
> and won't get the NULL errp parameter, iommufd_cdev_getfd()
> doesn't trigger the dereference issue.
>
> To follow the requirement of errp, add missing ERRP_GUARD() in
> iommufd_cdev_getfd().
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>  Markus: Referred his explanation about ERRP_GUARD().
> ---
>  hw/vfio/iommufd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 9bfddc136089..7baf49e6ee9e 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -116,6 +116,7 @@ static void iommufd_cdev_unbind_and_disconnect(VFIODevice *vbasedev)
>  
>  static int iommufd_cdev_getfd(const char *sysfs_path, Error **errp)
>  {
> +    ERRP_GUARD();
>      long int ret = -ENOTTY;
>      char *path, *vfio_dev_path = NULL, *vfio_path = NULL;
>      DIR *dir = NULL;

The problematic use is

       if (*errp) {
           error_prepend(errp, VFIO_MSG_PREFIX, path);
       }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

