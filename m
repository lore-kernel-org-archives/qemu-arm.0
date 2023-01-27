Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1488925ejc;
        Fri, 27 Jan 2023 14:48:20 -0800 (PST)
X-Google-Smtp-Source: AK7set82eX6ZfwMvf3hQ/YAvdkJxPYVec61cQZDg7LcOxWOqlmvqw/dg4BAsQkG2ovIJdN7EDjat
X-Received: by 2002:ad4:45a1:0:b0:537:633e:b13c with SMTP id y1-20020ad445a1000000b00537633eb13cmr26283361qvu.41.1674859700254;
        Fri, 27 Jan 2023 14:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674859700; cv=none;
        d=google.com; s=arc-20160816;
        b=z0V4gSfNY6jVwZbvYVRxuOCstRAvmwVqnFPf5uS5D3v8fsoDDkB+PZX7QDpkg8hZbr
         DMcOOmI9awcoyCn9OyKe2KXTwREi0e7uCJ8x7S8CbDfplAXfe/JrerpnaQ5FluYBrhLc
         dxbfAn1zy+sCZuMr89WVgf/lTlL53R9eG1a8II1FppkXh3KMg0c96o/PnVTxkVmruVsy
         fF5WLckLvPIKflsb3UZEm1nJX4van0jPupymVpIRthxqJl/iGorlWLnZzgCJ0XOxK7pi
         47Is06oRkLijSdcbG93pGPln8oBzMkW9wGPass8msYLQ4W7h2TT1urLA3kEUxhk5USSZ
         UZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=1e0/PGUN4/1YKyQq5ZEih9uomfIieCqX5fsFRyBTOgw=;
        b=JpqNIYA3/PpqHJ4pGRaI/6vf+OAG5nP0OTv5Gr+X3oOLyMBJNRoHr3+6R+razTl4gm
         CYNzjN56MeoNcPZKq/p4Hj1IF0VeoTmohU2VDWt57suKpXVuG+lyLYljNVPfRfmcz8lR
         bHNKO/epdU8mw7bG3WcIHqySyRHRZsYOLNOmJlayAhy9BYyIBZDSJMNmvD39Z9Rzfxy+
         Fp8UjagHDnCKvH2GyWfooD3OJyy0IyCbFnlS7dgPT6d5mLFBuCWOkDtdLG9+uanukM8e
         ir/P3va69RVYX3//wy238lU3238uKgICgsv3deCqlLHvC28Zp3HnZ3b6sHOArKjfulop
         6qKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YITe2UWR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020a05620a281400b007067470045csi3605325qkp.21.2023.01.27.14.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 14:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YITe2UWR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXVn-0002ma-9Z; Fri, 27 Jan 2023 17:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLXVl-0002m8-OH
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:47:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLXVk-0001f4-9E
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674859675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1e0/PGUN4/1YKyQq5ZEih9uomfIieCqX5fsFRyBTOgw=;
 b=YITe2UWRZz0lPayYMxqU6HLh/NzQEKInTV7mFzDi+aAVSg9k2L3JNOAI+UWDmAidrxG4xK
 KmJDjVhhlkAYer0a0m0mMuYv6gVrSTiOVp78MZvPLCMH8WtpHKU+sFrB2YLE6V32R7iTRP
 LnvFHC8nY7JnY+zcSxWRb4YSURuKIM0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-8Chw50bYPpmpxbNeEHK_cw-1; Fri, 27 Jan 2023 17:47:52 -0500
X-MC-Unique: 8Chw50bYPpmpxbNeEHK_cw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 620D7887400;
 Fri, 27 Jan 2023 22:47:51 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A40DC492B01;
 Fri, 27 Jan 2023 22:47:48 +0000 (UTC)
Date: Fri, 27 Jan 2023 16:47:46 -0600
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 03/19] scripts/clean-includes: Skip symbolic links
Message-ID: <20230127224746.2rqorp2ushelp4wj@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-4-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nFdtMmndFI9X

On Thu, Jan 19, 2023 at 07:59:43AM +0100, Markus Armbruster wrote:
> When a symbolic link points to a file that needs cleaning, the script
> replaces the link with a cleaned regular file.  Not wanted; skip them.
> 
> We have a few symbolic links under subprojects/libvduse/ and
> subprojects/libvhost-user/.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index 8e8420d785..f0466a6262 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -113,6 +113,10 @@ EOT
>  
>  files=
>  for f in "$@"; do
> +  if [ -L "$f" ]; then

I don't see -L used with test very often, but POSIX requires it, so it
is safe for our choice of /bin/sh.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

