Received: by 2002:a05:7022:ef18:b0:66:7a29:38e1 with SMTP id qy24csp3802765dlb;
        Wed, 21 Jun 2023 09:39:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kmcBdll3Lu7iK1pBDNINelh6h44MRmTiJD/AkwWZePG9mRTr1GY72G7g2dm0HuLR+GAdm
X-Received: by 2002:a1f:450a:0:b0:471:5103:9bde with SMTP id s10-20020a1f450a000000b0047151039bdemr7243075vka.7.1687365572961;
        Wed, 21 Jun 2023 09:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687365572; cv=none;
        d=google.com; s=arc-20160816;
        b=xpP2T7Y6s1ZziHjT+ohwQG6FkwjYMXLhDwVj0uMTRXzLU3rUbB+RuXdslgKAzzerGY
         qhwFd71h6QFx+49szDxJxlkZuwTloEMwIai+mtbswWXltxlNP0YC2D02tUkxYXSAQ5GJ
         +r+AViwyIs/ypSHC74DCVm702qfVmY4I0OhjymbQKDUCweP6eCx4A+D6zN5uybK7mHG9
         gSmMXvN5YYfgwjErMBExzl64MzQfQDh0n7WGcdJooUGaKgI6NZOSdy5145chZo/sqgJ0
         cH5S3K3uyofUUuGxzY4RPMiU/3EPedVxESUDLd0HeZHG8+/Ug+PscEHm4bP9IHkfiA2g
         IOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=b3kLutWMAf4ldTDiPaZpO3JJhX/mGY08hOkfs/KLLaY=;
        b=gpJWe2Ub2IXCeT29fXQGbSEp30lrPOLuPNWqFLhqh8YSK9i+th7XgnhMctw6RgrBjj
         pWAHmmWLF7nRUxJGGrUawpDFo9T+ijdBkoGKE8o6kXexQomTyzL5cDYVAisYWeKGXnrN
         qC0IpMLHA2ysuNAp7kR3hNwdrov9j9EQZk5Js9nijlJWvNApbhP6PDrtMiiURGBo4ca3
         1iWwvPl2JM/2UQpnfFvUa2CrQpavJmdO17t+xfpqju0qnDtMkrHGGqUtZnVtIKM/nCGS
         CT44rRF2XQKycTuGltUYEdoyJ7vbEZRuWo3gWDL85RfY7gnfwtzilNpw/uUZot8vSktM
         Pdjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqz6kUiJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv12-20020ad44eec000000b0062ddce6bf96si1923615qvb.220.2023.06.21.09.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 09:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gqz6kUiJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qC0rc-00032I-Pl; Wed, 21 Jun 2023 12:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0rb-0002wY-JR
 for qemu-devel@nongnu.org; Wed, 21 Jun 2023 12:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0rZ-0002C5-Qj
 for qemu-devel@nongnu.org; Wed, 21 Jun 2023 12:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687365561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3kLutWMAf4ldTDiPaZpO3JJhX/mGY08hOkfs/KLLaY=;
 b=gqz6kUiJAwgjPdfkqs9gA7P2tAafyRIRk+tLgbKqL24yKD40cvHvFBXTfKhFbqzMPc3DNy
 4I+uWAVmP+5iDYrwPzh+lumxLkuOD+XUfNQLswSIXGpRkFO8TIT0Kwu8MZott+Jfqq5IbT
 0i56uK0beylBflZPfduk7EfMNxJmSc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-ME5BvfcQP0iwnAqLHTqgHQ-1; Wed, 21 Jun 2023 12:39:17 -0400
X-MC-Unique: ME5BvfcQP0iwnAqLHTqgHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B29E68C5866;
 Wed, 21 Jun 2023 16:39:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EB17425356;
 Wed, 21 Jun 2023 16:39:15 +0000 (UTC)
Date: Wed, 21 Jun 2023 17:39:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 16/37] crypto: Add aesenc_MC
Message-ID: <ZJMnshzF/W39FJ9x@redhat.com>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
 <20230620110758.787479-17-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620110758.787479-17-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vMI6CyRR513a

On Tue, Jun 20, 2023 at 01:07:37PM +0200, Richard Henderson wrote:
> Add a primitive for MixColumns.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  host/include/generic/host/crypto/aes-round.h |  2 +
>  include/crypto/aes-round.h                   | 18 ++++++
>  crypto/aes.c                                 | 61 ++++++++++++++++++++
>  3 files changed, 81 insertions(+)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

