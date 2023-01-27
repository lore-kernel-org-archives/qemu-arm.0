Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1458658ejc;
        Fri, 27 Jan 2023 13:38:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9mChaUAl5sA00OhP0bUCjYAdoCVMHrT3Q68Ax+43jtdj3G1Wo7GTxw0Rn/m88SoI6E/3rG
X-Received: by 2002:a05:6214:419f:b0:537:6dbf:dccb with SMTP id ld31-20020a056214419f00b005376dbfdccbmr17801628qvb.46.1674855531980;
        Fri, 27 Jan 2023 13:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674855531; cv=none;
        d=google.com; s=arc-20160816;
        b=g9pVV8keTt2w1xOInHB8tlPXfc83pYDaHMWjOxnGHeOd/VLRuXRPtofMxySdrJK/cR
         vKbyUGXiRT7tgaC50/b1IxfYhxN8jOSNIxHsWcMLO6jSFYPuchvakxVSKYzxYmdlsZhx
         EXKjyGjZxfNdEn0Rn47Gy1GkN4n1uk/lcc/7l6quTQ+DW2yK36l1+fIXKQSRLP8nSfBQ
         84lfqtU4jM79s6iv/hNVgLEzp7A7uqilWhM+Xrc7MAmxcrnLlXgdOJlyQ4NSmpxjFz2k
         owctPts0D+z6RVBLIeP12NjxSxqKjNPscBKx5AnAurQQ+jbNdCSmDjZQExo2NIw29Oy2
         cA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Ya3zFGla2F6Utbg1telArH2Elj2nIZTjDf4ias2Q7yw=;
        b=mT3mGAzw0rqGVRc4y8xVcI4BJWvJsMEIzIhOABtwQaHCqfBfmsDv9QaZ2GIq9cwF2I
         4lr1bVNtz0RC0CUeBLGSo3CDCIZqMRI43xwV+4/D0sfVu7WaPO6z5e6dn/QxbW0nqkCx
         g9XxkfeRdsaCMRMER2yA5tpePFgEXSvwhFOh+FWSjjBhjU4ScBXrqw5lvi9/bQZR0FEd
         FEkhui7e9dccj4ezPyf7VPYrIRCu7weLkmHGpJyi5YKxOMWmzPev/sebn87g9J7FH5pu
         Is2vqevzy6JBP6D/6HsFF2newUEB/BEd28yR2NdSCdqerndzEFVkEI/Vrxxp48z1Vqjg
         L7lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFffHq9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ad45768000000b0053180c8f351si3562050qvx.515.2023.01.27.13.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 13:38:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFffHq9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLWQo-00030q-4R; Fri, 27 Jan 2023 16:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWQm-00030J-Lr
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 16:38:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWQk-0002qN-Je
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 16:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674855521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ya3zFGla2F6Utbg1telArH2Elj2nIZTjDf4ias2Q7yw=;
 b=RFffHq9PzZgAq3QSV6cmDLECgaCPR6uCsaXg4SkHq+uuIPpWotDVcC92CO8IosxInDdoko
 LqSfHf1Ac6vouV6/YHsL0r1U1XVmkoDFyMRiqFmAaPKlw4dClx34EuI6lhKH1l/+7oGNr7
 mHIwFUGU5z9FQCu6K/kme6kNpZOocYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-TfwT3yR3MuiFniYt48dwAA-1; Fri, 27 Jan 2023 16:38:38 -0500
X-MC-Unique: TfwT3yR3MuiFniYt48dwAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040C8101A55E;
 Fri, 27 Jan 2023 21:38:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 214397AD4;
 Fri, 27 Jan 2023 21:38:34 +0000 (UTC)
Date: Fri, 27 Jan 2023 15:38:32 -0600
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
Subject: Re: [PATCH v4 02/19] scripts/clean-includes: Don't claim duplicate
 headers found when not
Message-ID: <20230127213832.qzjhacznhvpochpn@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-3-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1BtbeqrZBedw

On Thu, Jan 19, 2023 at 07:59:42AM +0100, Markus Armbruster wrote:
> When running with --check-dup-head, the script always claims it "Found
> duplicate header file includes."  Fix to do it only when it actually
> found some.
> 
> Fixes: d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index 86944f27fc..8e8420d785 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -177,9 +177,8 @@ for f in "$@"; do
>  done
>  
>  if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
> -    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
> -        | sort | uniq -c | awk '{if ($1 > 1) print $0}'
> -    if [ $? -eq 0 ]; then
> +    if egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
> +        | sort | uniq -c | grep -v '^ *1 '; then

Indeed - the awk script was succeeding even if it printed nothing,
whereas the grep -v is a bit lighter-weight and has the intended
semantics of exit status based on output.

Reviewed-by: Eric Blake <eblake@redhat.com>

>          echo "Found duplicate header file includes. Please check the above files manually."
>          exit 1
>      fi
> -- 
> 2.39.0
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

