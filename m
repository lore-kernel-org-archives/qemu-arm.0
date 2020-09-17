Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp369680lfq;
        Thu, 17 Sep 2020 01:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI50LTGpQRbxp0bUZerKUN1Xu27NEN6rHyXlSM9B4+v53KI+7pxsV4XMRUw247o67Sr0xU
X-Received: by 2002:a25:4ac5:: with SMTP id x188mr29091423yba.72.1600330384654;
        Thu, 17 Sep 2020 01:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600330384; cv=none;
        d=google.com; s=arc-20160816;
        b=CSA+n+gPyJXnQ97PafKjhQLyTCklH+MDMi6ZIo1TXZC6WgmAMKl7DXLC8Rm+ZIZvXR
         ld3UmAUO8kLossH0PorD5sVmozy8zr73tb2aGSgc1UzfCVrtI/6MVBRgYhKWnek7DXLO
         VyGBh1nHqmk8eqdLiBIMitnInkJ1Dh5sK2wQSj3tziHAqBK0vRmfZ1Srs+yeuR+m54sp
         rPJz+SVjVQvlMAo9D8ZJwuWFxvd3e9SmedLuv9marpVv4RdTyKEC8hiLL9E833cXIHFX
         NqE5C2bklAWSDdxzKvCRBrFfl6Sh+OjDitZXNrJKbbQnh+bwrKVlF7Im1abbuj8YedD9
         mTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=6tMBenZwZgz1qalsrYhPuXgGamXvglozQwBCFf1bGPY=;
        b=fJvsLnEoBU13/KB8SAVS5EbLrWhMs3v1OabIQv9ENmUhQODXbBvJaNiWUwmg9M0L2C
         L1eGjIUt5r7XGdIVqFj3Osadz+6rXYl/Db4gKt87OyTug24Y6lOEh4jiz5COAvBDU4B6
         nEiLEjcnAP3t1Athhb4yh8KMpK9rNZdwvJEyB/XNLHUnTa/jk5pcggBo55kASQtNWoqi
         I236SumsH/5C6fr78J5866c/gH1YXKiQiHIEPq6mLlaq21NT92O5ggN8v/Gfn2e9flpV
         VPVpYdr275d1LLTfY1ZzZDBbgiWgNG684Y60NI2VPo4M4FEQmR6HFTW8j7VL0OYtvRYd
         WTmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fX5GpzN3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u186si20860570ybg.389.2020.09.17.01.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 01:13:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fX5GpzN3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIp2O-0008V0-0G
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 04:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIp2E-0008Q1-8a
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 04:12:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIp2B-000890-GB
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 04:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600330370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6tMBenZwZgz1qalsrYhPuXgGamXvglozQwBCFf1bGPY=;
 b=fX5GpzN37/kUSkUZYy+g22q+Q5fgmMXRrRJxmXNukSNgs7blXxEbi3d2egjirZ6hL9Zile
 qqK6SElANXp7fCaIcz2yaQPYKZoQVQUSC+OuVnqCz3KlEEjGhgU21yZBAJEqxnzbMlJsmy
 KeVoKPk01lMNwwkCnSPR1z7aeZU//cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-cOSGnFIfOiSVC2nNvBg0eg-1; Thu, 17 Sep 2020 04:12:46 -0400
X-MC-Unique: cOSGnFIfOiSVC2nNvBg0eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16DBD10074B1;
 Thu, 17 Sep 2020 08:12:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B278778814;
 Thu, 17 Sep 2020 08:12:42 +0000 (UTC)
Date: Thu, 17 Sep 2020 10:12:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Message-ID: <20200917081239.bdfhkofodqvhg3i6@kamzik.brq.redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-5-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200917032033.2020-5-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org, alex.chen@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mnfgBpxXe0hT

On Thu, Sep 17, 2020 at 11:20:25AM +0800, Ying Fang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
> also recursively adds any missing parent nodes.
> 
> Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  device_tree.c                | 24 ++++++++++++++++++++++++
>  include/sysemu/device_tree.h |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/device_tree.c b/device_tree.c
> index b335dae707..1854be3a02 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -524,6 +524,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
>  
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    char *parent;
> +    int offset;
> +
> +    offset = fdt_path_offset(fdt, path);
> +    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
> +        error_report("%s Couldn't find node %s: %s", __func__, path,
> +                     fdt_strerror(offset));
> +        exit(1);
> +    }
> +
> +    if (offset != -FDT_ERR_NOTFOUND) {
> +        return offset;
> +    }
> +
> +    parent = g_strdup(path);
> +    strrchr(parent, '/')[0] = '\0';
> +    qemu_fdt_add_path(fdt, parent);
> +    g_free(parent);
> +
> +    return qemu_fdt_add_subnode(fdt, path);
> +}

Igor didn't like the recursion when I posted this before so I changed
it when doing the refresh[*] that I gave to Salil Mehta. Salil also
works for Huawei, are you guys not working together?

[*] https://github.com/rhdrjones/qemu/commits/virt-cpu-topology-refresh

Thanks,
drew

> +
>  void qemu_fdt_dumpdtb(void *fdt, int size)
>  {
>      const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 982c89345f..15fb98af98 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -104,6 +104,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
>  int qemu_fdt_add_subnode(void *fdt, const char *name);
> +int qemu_fdt_add_path(void *fdt, const char *path);
>  
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>      do {                                                                      \
> -- 
> 2.23.0
> 
> 

