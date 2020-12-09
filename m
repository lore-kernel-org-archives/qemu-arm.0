Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4907973lfb;
        Wed, 9 Dec 2020 04:39:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaIwr8lQ6iHgBEq+k3Uhj1Lz28k5TnZwI3qL8wBMu43sub4IHuphIxxpvtUCfQcYh2PEr6
X-Received: by 2002:a25:e03:: with SMTP id 3mr3193851ybo.414.1607517565639;
        Wed, 09 Dec 2020 04:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607517565; cv=none;
        d=google.com; s=arc-20160816;
        b=SZgKFv0uYBSzQwOgezOXX759tnpMFjMy8JGgI/qQua8GHIHnTnXYfLjr6F4w2aP6K2
         SR7a3u7PketW8S6smahnIUhW9EY67S9hnMJsJiKZGaTbL4Zp4OZYxkJWtmmc6dC7rRzZ
         tp+cf2zCqP7iblPmeH4VrFta4Kp3O1SUD6kheS7pp6oa0d3niuHFtFSJyLy543Cq4kxU
         jXNtUYVaFjrcprZ4F5msZEZRkeD6uBiJzOlFm10zYYVso+CR25sj37uuQm1R2vW8BynQ
         ZepDEBV1VQ+V8PpnMXLYeqrszTeGasrM1Xnl/GRaF71TZl+zgKQNDSwPtE5inmie5j2P
         osdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=eRYE6Bs8IJU+dyWV0vJRJ1C25MM3R/YR9eqCPLb4tNs=;
        b=QgyKtj33HMxXQqksM3SuOES+2wYWxExyoFrkjzledSnocXzYwx9age6fv/qC7Vc5y8
         ASM1X2j0POPXLBXOQePC9Zoqdj7t3FSlRVo+JzxTZxgOvVXODQB3sY5uMhdpxvU6wFsQ
         xm3WZFVnvR4YZ0xo8nTlaB0/ERM1zkV9pDthM+mWKu8KefBYMLk8/1btyXf1YaQlLx0o
         ka/1pzqlbZ/UD8UADMrcdo+QmSoHn8LuKd/flLCSX1TLfrz5XKWA4zDvFHzXn9H5JMJJ
         H/eEH+2Xoh1XkI/s43x4JknYocumZSlsRN/RYIOv30nAK1M07gVUZvuYgSs8I/kb5VhT
         VPWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OBCm2CsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si1646443ybm.290.2020.12.09.04.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 04:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OBCm2CsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmyke-00006v-MM
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 07:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmyjv-00006o-K7
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 07:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmyjs-000052-MA
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 07:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607517513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRYE6Bs8IJU+dyWV0vJRJ1C25MM3R/YR9eqCPLb4tNs=;
 b=OBCm2CsGltyZ+q/79Hc47QDQ9uDlVVk0LxAPrE5YXpWLxqfq1b50BOZWdTN3PMyM7qMjw/
 2zeRI8PpNouaurp7q4EcOTebjKsy/TdrfUCD0IOZa6D3XOArR2xWHtXG4/0z4rmGKsExqu
 AY97NPJslUhfOPIahpjpfh3Ml5L0TDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-TlYemluuNDemilc7FE9bsA-1; Wed, 09 Dec 2020 07:38:29 -0500
X-MC-Unique: TlYemluuNDemilc7FE9bsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E422E1009611;
 Wed,  9 Dec 2020 12:38:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6C61001E73;
 Wed,  9 Dec 2020 12:38:24 +0000 (UTC)
Date: Wed, 9 Dec 2020 13:38:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] bugfix: hostmem: Free host_nodes list right after visited
Message-ID: <20201209133824.5415d133@redhat.com>
In-Reply-To: <20201209025648.23068-1-zhukeqian1@huawei.com>
References: <20201209025648.23068-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, kuhn.chenqun@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lXU+W2WezSkk

On Wed, 9 Dec 2020 10:56:48 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> In host_memory_backend_get_host_nodes, we build host_nodes
> list and output it to v (a StringOutputVisitor) but forget
> to free the list. This fixes the memory leak.
> 
> The memory leak stack:
> 
> ==qemu-kvm==209357==ERROR: LeakSanitizer: detected memory leaks
> Direct leak of 32 byte(s) in 2 object(s) allocated from:
>   #0 0xfffe430e3393 in __interceptor_calloc (/lib64/libasan.so.4+0xd3393)  ??:?
>   #1 0xfffe41d58b9b in g_malloc0 (/lib64/libglib-2.0.so.0+0x58b9b)  ??:?
>   #2 0xaaac0cdb6e43 (/usr/libexec/qemu-kvm+0xe16e43)  backends/hostmem.c:94
>   #3 0xaaac0d2edf83 (/usr/libexec/qemu-kvm+0x134df83) qom/object.c:1478
>   #4 0xaaac0c976513 (/usr/libexec/qemu-kvm+0x9d6513)  hw/core/machine-qmp-cmds.c:312
>   #5 0xaaac0d2e980b (/usr/libexec/qemu-kvm+0x134980b) qom/object.c:1001
>   #6 0xaaac0c97779b (/usr/libexec/qemu-kvm+0x9d779b)  hw/core/machine-qmp-cmds.c:328 (discriminator 1)
>   #7 0xaaac0d26ed3f (/usr/libexec/qemu-kvm+0x12ced3f) qapi/qapi-commands-machine.c:327
>   #8 0xaaac0d43d647 (/usr/libexec/qemu-kvm+0x149d647) qapi/qmp-dispatch.c:147
>   #9 0xaaac0d21f74b (/usr/libexec/qemu-kvm+0x127f74b) monitor/qmp.c:120
>   #10 0xaaac0d22074b (/usr/libexec/qemu-kvm+0x128074b) monitor/qmp.c:209 (discriminator 4)
>   #11 0xaaac0d4daefb (/usr/libexec/qemu-kvm+0x153aefb) util/async.c:117
>   #12 0xaaac0d4e30fb (/usr/libexec/qemu-kvm+0x15430fb) util/aio-posix.c:459
>   #13 0xaaac0d4dac8f (/usr/libexec/qemu-kvm+0x153ac8f) util/async.c:268
>   #14 0xfffe41d52a6b in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x52a6b)  ??:?
>   #15 0xaaac0d4e0e97 (/usr/libexec/qemu-kvm+0x1540e97)  util/main-loop.c:218
>   #16 0xaaac0cd9bfa7 (/usr/libexec/qemu-kvm+0xdfbfa7)  vl.c:1791
>   #17 0xaaac0c823bc3 (/usr/libexec/qemu-kvm+0x883bc3)  vl.c:4473
>   #18 0xfffe40ab3ebf in __libc_start_main (/lib64/libc.so.6+0x23ebf)  ??:?
>   #19 0xaaac0c82ed5f (/usr/libexec/qemu-kvm+0x88ed5f)  ??:?
> SUMMARY: AddressSanitizer: 32 byte(s) leaked in 2 allocation(s).
> 
> Fixes: 4cf1b76bf1e2 (hostmem: add properties for NUMA memory policy)
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  backends/hostmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index 4bde00e8e7..9f9ac95edd 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -105,6 +105,7 @@ host_memory_backend_get_host_nodes(Object *obj, Visitor *v, const char *name,
>  
>  ret:
>      visit_type_uint16List(v, name, &host_nodes, errp);
> +    qapi_free_uint16List(host_nodes);
>  }
>  
>  static void

