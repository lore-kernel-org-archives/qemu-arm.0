Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp254766lfg;
        Thu, 25 Feb 2021 03:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+/UfEHh2rJWEXzDRBdes9lJTi3RQEc9VXB3A2okYkGtiINWwyf0Fa5bT86YaaifDvRTZj
X-Received: by 2002:a54:4017:: with SMTP id x23mr1562914oie.3.1614251824563;
        Thu, 25 Feb 2021 03:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251824; cv=none;
        d=google.com; s=arc-20160816;
        b=IuenP3gc466Igjlw7d/Hw3EoSzQfYzg2fXNGfVj3Rf497+ZLDHCf/fWaXMsQpctTIg
         JAV6moM3JZ56+/ZT6YTDx68SdrED2X61dsqRfWGdwQlKsngpVtT2OtsjSXX7cF7eV5/O
         8Rw6F/mfGG0ru4+urTLSQoYKxoG5A7fCbu4oNw431aq7AXIJ5mJP2+carTtnXRDmw+J9
         RLM08tgcrDzL8K0aiDIzMx9Xup41dW+fjv+qkWfnRIhDIROhWdVjjW+KWRrDtD2bBwE9
         lUDZJeDNNXDzHh8hOZVGcfujZn2Ft0Ud1u7YdXwTh5xXNaCHxOh1yXZHTa7qzfmSp+UV
         kjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=qFJv2BJP3bdfcBM2Q+30gmjNRheti8JdPTSqyNddEaQ=;
        b=KdjRu3dTRP10ACascb1xTAH+q+ABHTDDq2IgRXFrjQQmv9EUsJeE5zaO00QarMwXM0
         M9wvJUUIHhvDbivfSSfOtJGp1GImBrHNJIfoWliA4ttyZsgKfGKNLA32hw0fp3sGVBNL
         r+uUnUPk4IjGhRV9xr2KpVM+Gw7ygHdT0l4EKGDYyqF2XRoZGHeev/MOWJwdUtsVsiL+
         qSjaGPKH+AKvWsaQBDRk5cfHA4OFmxhIir6IcuCjmyDjd7X8LCK5u9qIy0jas+VVZ0+t
         QctFk1zxyud3tcmSTixBRjhx0YTE+WIilbcLqLlsCLM6xuEzUiVxxk3hGSWxMrP0QmbS
         2o0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MEiwEBp3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r206si3363874oih.76.2021.02.25.03.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:17:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MEiwEBp3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEdj-0006w8-S7
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFEQb-00037n-Lr
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 06:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFEQZ-00010l-UR
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 06:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614251006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFJv2BJP3bdfcBM2Q+30gmjNRheti8JdPTSqyNddEaQ=;
 b=MEiwEBp3lM3jL/pJEL+cuaqxScpDJLhvO1pNAdLI6y6nX9tI286X2VAwPX4R9SCSrxLEtR
 4xtSDU6jBz/oXfKsW7Mj73crrOooLZpynFTHYKDnogiShB0jFj40/dt+HOlJMtCH3zlhra
 l2fw6FW2tzmwaTubsfhP08/esXO7hCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-FBze5yr7PSCCQpK9Aon6QA-1; Thu, 25 Feb 2021 06:03:22 -0500
X-MC-Unique: FBze5yr7PSCCQpK9Aon6QA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BD191052BA1;
 Thu, 25 Feb 2021 11:03:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D43F19C79;
 Thu, 25 Feb 2021 11:03:14 +0000 (UTC)
Date: Thu, 25 Feb 2021 12:03:11 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 1/5] device_tree: Add qemu_fdt_add_path
Message-ID: <20210225110311.quvchs32o4n6iqpt@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-2-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210225085627.2263-2-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AiF3Tt3NgP8r

Hi Ying Fang,

I don't see any change in this patch from what I have in my
tree, so this should be

 From: Andrew Jones <drjones@redhat.com>

Thanks,
drew

On Thu, Feb 25, 2021 at 04:56:23PM +0800, Ying Fang wrote:
> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
> it also adds any missing parent nodes. We also tweak an error
> message of qemu_fdt_add_subnode().
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
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
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index b9a3ddc518..1e3857ca0c 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -515,8 +515,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>  
>      retval = fdt_add_subnode(fdt, parent, basename);
>      if (retval < 0) {
> -        error_report("FDT: Failed to create subnode %s: %s", name,
> -                     fdt_strerror(retval));
> +        error_report("%s: Failed to create subnode %s: %s",
> +                     __func__, name, fdt_strerror(retval));
>          exit(1);
>      }
>  
> @@ -524,6 +524,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
>  
> +/*
> + * Like qemu_fdt_add_subnode(), but will add all missing
> + * subnodes in the path.
> + */
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    char *dupname, *basename, *p;
> +    int parent, retval = -1;
> +
> +    if (path[0] != '/') {
> +        return retval;
> +    }
> +
> +    parent = fdt_path_offset(fdt, "/");
> +    p = dupname = g_strdup(path);
> +
> +    while (p) {
> +        *p = '/';
> +        basename = p + 1;
> +        p = strchr(p + 1, '/');
> +        if (p) {
> +            *p = '\0';
> +        }
> +        retval = fdt_path_offset(fdt, dupname);
> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
> +            error_report("%s: Invalid path %s: %s",
> +                         __func__, path, fdt_strerror(retval));
> +            exit(1);
> +        } else if (retval == -FDT_ERR_NOTFOUND) {
> +            retval = fdt_add_subnode(fdt, parent, basename);
> +            if (retval < 0) {
> +                break;
> +            }
> +        }
> +        parent = retval;
> +    }
> +
> +    g_free(dupname);
> +    return retval;
> +}
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size)
>  {
>      const char *dumpdtb = current_machine->dumpdtb;
> -- 
> 2.23.0
> 
> 

