Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp7011902lfk;
        Mon, 22 Nov 2021 06:13:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykRd19w6qS0to21ANdrJJCJWfj/PgAtyId44y4Lobmjyohk81Ub2R59p22josa5Jy9R9j/
X-Received: by 2002:ab0:750c:: with SMTP id m12mr85657598uap.119.1637590428882;
        Mon, 22 Nov 2021 06:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637590428; cv=none;
        d=google.com; s=arc-20160816;
        b=htiDndI2Kf7epOdaGZdnx3SMxxBASLt9vg3bhaR9AJBCEMYFoBWjWLaBWOXmhT/66i
         G2PuZskPLKk3bQvyiv/2PDy2RYvCkxukpJd2Kv6R7qipdpFeaG9VZYgldRYkf/NCOvki
         G5RoabuPUrPT7ZZ0mb4FgJCdAORkfw8vh52UQZyomEqY0dRlNd0QlfB4TQDFuWzRzZM3
         qAaHmbIbWeEwHCuNE608C31OPfRMsPOAKcDPtw9FSNPrqbyBLLMOW9Jg0Tm6BBRU3oFJ
         hw1vEEfD3XwMJkRuZ3E23eqZlMFvhIqlzE5VO2Q4EO+I3DWjfQCPeXnYrX9XH7OslLDX
         nl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Vd02JsOmoQqykn35Ql408cjfDULXbY3etoCqux97PAc=;
        b=w+BW3FBjy4GibeA7CPUbddtUNUtL8GHVy2ZSRo0Cef1qx+H1iDpUn4t076jJcyJlBw
         DzAtuEDIIpxIEVrEOtUVhsA6zt7dDmwuqmYPW3kmcseezAaU2tlpKSnyp0PNQiGSVihS
         MM2mJcU1kuY1SaEXTW17cpx6UzyG8z7UqN2LRU6MwxdvsG/PnPQ69BCLjeFUiqvbc0Ih
         wsjNhrUfnpRhCbiGAJrwFtwnxArwccOG2023DmRfn/e3VdrmbtpJM1+7zdaD8SOLYTUK
         1kSv2TaXhLyCboj2KBEjZ92tpBitRO7z9imSdDC5o4sEFlt6C9IYnUJ/ubaGLDV+VE/P
         sI6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M+Th399J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si24573353vsj.329.2021.11.22.06.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 06:13:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M+Th399J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mpA4q-0006H2-8O
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 09:13:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpA4h-00069l-5i
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 09:13:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mpA4e-00008p-Cc
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 09:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637590415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vd02JsOmoQqykn35Ql408cjfDULXbY3etoCqux97PAc=;
 b=M+Th399JQpYmFhLkT2yeEIuY9tyuoRnyGMKT8rzz1nk4f/xL9aNGvmRdjJe2XwvCT2dFYE
 48Knaq8RhpjM473gYSPG8tv0vbFUknC3uNgY0/cNBqMR7i1YeOnBmLzFTmeoaRjLpss70I
 PDY4WiN36hlBmCl5iR/OWoi6dTH7rxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-K5qTg-w9N-ixndhnO8xEmQ-1; Mon, 22 Nov 2021 09:12:54 -0500
X-MC-Unique: K5qTg-w9N-ixndhnO8xEmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C2A1DDF4;
 Mon, 22 Nov 2021 14:12:53 +0000 (UTC)
Received: from redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE5F1981F;
 Mon, 22 Nov 2021 14:12:52 +0000 (UTC)
Date: Mon, 22 Nov 2021 08:12:50 -0600
From: Eric Blake <eblake@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2] qapi/machine.json: Fix incorrect description for
 die-id
Message-ID: <20211122141250.n6wwuh7tmvt2iult@redhat.com>
References: <20211122032651.16064-1-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211122032651.16064-1-wangyanan55@huawei.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E5diVOMgKVYX

On Mon, Nov 22, 2021 at 11:26:51AM +0800, Yanan Wang wrote:
> In terms of scope, die-id should mean "the die number within
> socket the CPU belongs to" instead of "the die number within
> node/board the CPU belongs to". Fix it to avoid confusing
> the Doc reader.
> 
> Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  qapi/machine.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 067e3f5378..f1839acf20 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -867,7 +867,7 @@
>  #
>  # @node-id: NUMA node ID the CPU belongs to
>  # @socket-id: socket number within node/board the CPU belongs to
> -# @die-id: die number within node/board the CPU belongs to (Since 4.1)
> +# @die-id: die number within socket the CPU belongs to (since 4.1)
>  # @core-id: core number within die the CPU belongs to
>  # @thread-id: thread number within core the CPU belongs to
>  #
> -- 
> 2.19.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

