Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp976796lfm;
        Sun, 16 May 2021 23:28:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNngMpiDimBBsMvWONJbIrCK/nKINn0PEmK8L6mokXpI8x4fw7ceDOPINwrwV6rPv3XIZS
X-Received: by 2002:a17:907:105e:: with SMTP id oy30mr15261504ejb.258.1621232905905;
        Sun, 16 May 2021 23:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621232905; cv=none;
        d=google.com; s=arc-20160816;
        b=U75AhyY04uwiT9mSi9BB0F7dvX3nRd2M6oQ1JG30BmTTCORUTFZZ9xBZuDDPRbqqLe
         RQCXPPa09UFDsmEzO4eKDrI/ihnVoRcSR/RFEX43BDvFU2hcKOqslkySI+2MM/kMmwcK
         kZfeKYzwfSX8ukMY0bxRGoaWCwyJNi2zXI83sWNGF4abfez3feasc4/UBR82D20ghejG
         QNtHXPXrSQYu+vVDjSyxowgMJe9/cmXh/ZSOB9RuRso2Zh4KejF+Z+iMYaDpdYUxJtYb
         7MQ1R4UglB8u9ZNnyjLSLVyp9x3ZWgGVoj8vGZRBoeax6/1qfd1eWnad7HE4KycsG0bU
         48gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=F8EKD7X3zvaPvO13cBxnEbFADe9puGdX/izmsdjlu30=;
        b=ZOt90PWorhPak9MUrA4HxySOgXfprhKurJ+fOctfoQB3OOB5T9IWle2oXEwq9i3nNu
         hbbIicCb0Mot1RXr5vYxH+MnBSRYFOxza38TsO+dWaZIlkA0HDu9mKbfafOhGjyfkeix
         Vvo54ViQolBJZJeyYGgn7ySM/7Ozfk2/NWLwxqHh8dzyNq2pMpieInOKQbaybgcj4fCZ
         6Wv1mgtR4sr/AJhn4SpgB7aktdbsq38bKR6JNV2JNiek9KMfIar1oYesH8G51OpNtj/r
         REe5tzJcKWmRmC9VGtktl9O9/ItGT8rkZ2V6As8/091//rc3K5m/E7GHj0ZH0ves2S1k
         niDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KNHZZeCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si6933269edv.57.2021.05.16.23.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 23:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KNHZZeCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liWjo-0003MQ-V7
	for alex.bennee@linaro.org; Mon, 17 May 2021 02:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWjJ-0003L1-Qr
 for qemu-arm@nongnu.org; Mon, 17 May 2021 02:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liWjD-000823-Jm
 for qemu-arm@nongnu.org; Mon, 17 May 2021 02:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621232866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F8EKD7X3zvaPvO13cBxnEbFADe9puGdX/izmsdjlu30=;
 b=KNHZZeCQ3j6Cu6u6hRqSjMbim9KfXnjqN7z7pTGmk2X3OLQpCNKthK+IX4jEXCpZZWP3Xi
 jq7UmYzoadmccLnzvxvgg32m4q4ZUzlBskJN/zchyNXtewIoc4PFr+bLHaxASkII0+ICkr
 r/VWgreAkrDaJg3+LVCh0VpVVzGsC/s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-dLoTvSJDOMO0mMOGY-6zWQ-1; Mon, 17 May 2021 02:27:45 -0400
X-MC-Unique: dLoTvSJDOMO0mMOGY-6zWQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so3336717edu.1
 for <qemu-arm@nongnu.org>; Sun, 16 May 2021 23:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F8EKD7X3zvaPvO13cBxnEbFADe9puGdX/izmsdjlu30=;
 b=eQVfKmT6Fse9db41PiEHG/MQOEsegGAG1KxlHQ3X3YS5AnnwtZxFJh6nwQb2voS85r
 kr0bSCraj7vRXrYOseDLgKdQQmuCUVsh15uqPjcYnOR5MPgCVoGZe097W4EM/2tFT/jw
 lBwwx7RZcyMpUQ+rctUS936EG6ewzHyfTehujRrNraV8Sf6vARIMlBSJJ6zFdOGFF11p
 AsGPp1sYuMjwolhkNTUfRBF8CUh11Lmhvq6nYEQi9DxY88I2NMlERNnnIUETnD93Drhk
 KgqziK/Ch+AEX41R9Yn5sxKeifYkirlMS8akr9Mc0SDuyQgjWrNLN5ImLDYd8dJRZh23
 xuOQ==
X-Gm-Message-State: AOAM533nVeLYAo50PdsrM1lJ1clRuJKNkCbFr+4qYivR6Y7tDfqDBrtp
 JakAniVEoN0gn3vzKFGurmQkqZacGYXuU2spgDvXUOC1PmfuVDtInLDsSpbml7pC+++Z9qmLlOQ
 WaBwG8v4muKfe
X-Received: by 2002:a50:d68a:: with SMTP id r10mr71143324edi.90.1621232863925; 
 Sun, 16 May 2021 23:27:43 -0700 (PDT)
X-Received: by 2002:a50:d68a:: with SMTP id r10mr71143296edi.90.1621232863758; 
 Sun, 16 May 2021 23:27:43 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id b16sm8127565edu.53.2021.05.16.23.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:27:43 -0700 (PDT)
Date: Mon, 17 May 2021 08:27:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 2/9] device_tree: Add qemu_fdt_add_path
Message-ID: <20210517062741.t44x3gnlukczmjit@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OFvmjBDo6vWX

On Sun, May 16, 2021 at 06:28:53PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>

Hi Yanan,

This looks good, but the authorship is no longer correct. You've
completely rewritten it, so I think the most I deserve is a
Co-developed-by and maybe even just a Suggested-by. When changing
the authorship and tags, you can also add a

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


> 
> qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
> also adds all missing subnodes from the given path. We'll use it
> in a coming patch where we will add cpu-map to the device tree.
> 
> And we also tweak an error message of qemu_fdt_add_subnode().
> 
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  include/sysemu/device_tree.h |  1 +
>  softmmu/device_tree.c        | 44 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 8a2fe55622..ef060a9759 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
>  int qemu_fdt_add_subnode(void *fdt, const char *name);
> +int qemu_fdt_add_path(void *fdt, const char *path);
>  
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>      do {                                                                      \
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index b621f63fba..3965c834ca 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -540,8 +540,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
> @@ -549,6 +549,46 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
>      return retval;
>  }
>  
> +/*
> + * qemu_fdt_add_path: Like qemu_fdt_add_subnode(), but will add
> + * all missing subnodes from the given path.
> + */
> +int qemu_fdt_add_path(void *fdt, const char *path)
> +{
> +    const char *name;
> +    const char *p = path;
> +    int namelen, retval;
> +    int parent = 0;
> +
> +    if (path[0] != '/') {
> +        return -1;
> +    }
> +
> +    while (p) {
> +        name = p + 1;
> +        p = strchr(name, '/');
> +        namelen = p != NULL ? p - name : strlen(name);
> +
> +        retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
> +        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
> +            error_report("%s: Unexpected error in finding subnode %.*s: %s",
> +                         __func__, namelen, name, fdt_strerror(retval));
> +            exit(1);
> +        } else if (retval == -FDT_ERR_NOTFOUND) {
> +            retval = fdt_add_subnode_namelen(fdt, parent, name, namelen);
> +            if (retval < 0) {
> +                error_report("%s: Failed to create subnode %.*s: %s",
> +                             __func__, namelen, name, fdt_strerror(retval));
> +                exit(1);
> +            }
> +        }
> +
> +        parent = retval;
> +    }
> +
> +    return retval;
> +}
> +
>  void qemu_fdt_dumpdtb(void *fdt, int size)
>  {
>      const char *dumpdtb = current_machine->dumpdtb;
> -- 
> 2.19.1
> 

