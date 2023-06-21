Received: by 2002:a05:7022:ef18:b0:66:7a29:38e1 with SMTP id qy24csp3805055dlb;
        Wed, 21 Jun 2023 09:43:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jkptERnYDa65LZMOKCuBPsKzouC/gqpDGUmIVRAidOzBqNXiyWuczOduFasrK3F+q3wXw
X-Received: by 2002:ac8:7f84:0:b0:3f3:96a3:c76f with SMTP id z4-20020ac87f84000000b003f396a3c76fmr19853740qtj.22.1687365819907;
        Wed, 21 Jun 2023 09:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687365819; cv=none;
        d=google.com; s=arc-20160816;
        b=LJpW9i8thprcMJRGS0WO7dWagyz/RetuAPeNbCzHvmzR+/BJn4IopZE7oJ4BFAhU0Z
         /UwHzTKgorQstn2smeFuXUMBPzCpUznhGU4L/T5Sw9Zwml0jZwvN619vD14B8nK8Mwqa
         bEbawll0+kmk1He3/6824K4cNaZpECp6zsl1/Vy21KmA17YsC3AEDkWRg4KC8jSHjxBn
         zHHPp4g01zoIyw+m3gGKxesRYpYkbu1M/ZITHiFe297m2UejMWZtjkpiYssC/aP5oJC2
         qz5jIhJH5aqeOLLDkKQAvVZq/839RDMAfFuItCiF7UmDWIvRaHNK4mK0aZL9hGZnhuIb
         4Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Yke3TL7j7AabmOFekvtWm48sFMuuC+Argv+QQoSN+N8=;
        b=i1QnqxuY1S79Fxe+WXV3mx6lfZ1+spPk8+yXAoT/PVchbDJJ8JqQ9JnMwR7I9rbFCN
         7Fbhbu2Lt4d/tvnioQmJ6p4/QuwvFbgOBC6VLRK429DOqpQyZoP0/+nmOg3MK3yq6C1e
         qm691ObyVU1SPVmPP+DGyC6Y7rQyff/aER+SGMByM6qyAvKRcfipGgly+xeECHvCM1xF
         gTKvVJHVGK9zU/BmDeHCrQDvHeVAwwdx1PkLXuHZbopbdRLoROi7ZOAJbJ3QZkZVyhcJ
         CGX5GXVhJE4qLcZM0MMOlCS3ogw8zAms4rQTXGaIBD7vUKRw9SgsnRMdhwvS6SV2S/OL
         P1MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h2NCutzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05622a100600b003f221c60353si1880560qte.748.2023.06.21.09.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 09:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h2NCutzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qC0vU-0002Xv-My; Wed, 21 Jun 2023 12:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0vT-0002Vm-ES
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0vR-0004D4-9J
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687365799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yke3TL7j7AabmOFekvtWm48sFMuuC+Argv+QQoSN+N8=;
 b=h2NCutzrElqgDZR/RZ/N8hShMgKnRS+cM7seJXDbCz4JnXRkBs95U+t4XAsr8FnImYkZD1
 UmJNNdY1vnDSipAnyYBXBSoZMmCF+JOMMsRnKPs0IHqAVRnrtKyYy/ejarbD0n7bpGCBQo
 NszBL9Q0hXKWoxdwlBl7tRi8ryJ8pbQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-2nlj6bJLNYa78rOMG_NT4g-1; Wed, 21 Jun 2023 12:43:09 -0400
X-MC-Unique: 2nlj6bJLNYa78rOMG_NT4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 735373C11C6E;
 Wed, 21 Jun 2023 16:42:58 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEBE8200BA8B;
 Wed, 21 Jun 2023 16:42:57 +0000 (UTC)
Date: Wed, 21 Jun 2023 17:42:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 34/37] crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
Message-ID: <ZJMoj1HlvwvdLiHK@redhat.com>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
 <20230620110758.787479-35-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620110758.787479-35-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vYbr4FRm6W9C

On Tue, Jun 20, 2023 at 01:07:55PM +0200, Richard Henderson wrote:
> These arrays are no longer used outside of aes.c.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/crypto/aes.h | 25 -------------------------
>  crypto/aes.c         | 33 +++++++++++++++++++++------------
>  2 files changed, 21 insertions(+), 37 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

