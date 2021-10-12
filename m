Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1486885lfc;
        Mon, 11 Oct 2021 23:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKTe0pXXnAWqB4u+F5ggjfelBHGj/TdJSh/xWsSvdiQuK/MKVQBosXvAA8YFQVn3nzrE9f
X-Received: by 2002:ac8:7f44:: with SMTP id g4mr8742726qtk.130.1634020867594;
        Mon, 11 Oct 2021 23:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634020867; cv=none;
        d=google.com; s=arc-20160816;
        b=ahZWhC+zC/PVG6uPhVmO9vDbFP4OiOyVwnR8UC1tGyjOd14a6kEAsRYGFcvEwlaB3A
         usoH+Rk1UVmHT3Oh/9n9155pTu0lUQfWL0VXKMzZzw8tPSdMkFtGAzZanJJ7x/NSAqXR
         vjJ2bWPEzoy86qvqa+W87FXdtuFSyDZqhYPnMZwuicZIYJbyVpV+jVF7dCWCJzkdz3jZ
         6zm3B/ImK6enYPiZiR+gIdkG85AKydBqsTA4wJEZ6ps88E9LWK9a2g8d203Vxrb51MRq
         J5taE5s4fz/Uo+NwFsgDFIr+EQvIqYiCDj4QfrtCAL5pz4PGXUSpcn65RGKBuixxZLez
         p/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Sg0ZUIe2qujzGohFbDm5tFYCs8RdfXL+QYfcG1lJnYs=;
        b=enAxKwmnMsnCEVkaP8pzh8a0rwQTJ70mJauQcpkId4T25gPKp90i4aFZ5ccdV/Qj8B
         q5ANgKnBCEtsOnzl2rjWTYC5MgScuNyDYe6fONj8wmv62KQ6CZmieGD0X++tHczoyLa3
         bk39CEleJfMQ7+K80RKl7tvZruv82hvE0kqzEm3nph/VP3VVbEPy5rN4KVbxxNZsctpy
         oz/CBA26aDx8D5ZmACtAzUGi45nklHDOyIvqbRLW+woSzxQHxzKLJGiPbjA/t2Rato7x
         wd5eQTFvmTKaHDUZwEXATRWGE02LKwu4wq0aew8Gs50/Rkjhnwfgmx+zhPRnU/zMvL9y
         Sifw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PUhcG7qx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si6188981qto.396.2021.10.11.23.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Oct 2021 23:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PUhcG7qx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maBTG-0007ui-SE
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 02:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maBSD-0007t1-2Z
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 02:40:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maBSA-0001dN-96
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 02:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634020797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sg0ZUIe2qujzGohFbDm5tFYCs8RdfXL+QYfcG1lJnYs=;
 b=PUhcG7qxb0dbrR7b+Yg8iiMyg81sV96tem+VvVoBmXDaCZBFn4UTtqVu166UVrwIUyfdzT
 4YFhv+HOvPKhyKQgst9VGkbJFo1XJ9vT7GEaZZGjS1rDjswiD4hKSjLbJ4Xojr/M5OadA7
 xBXXt2PbHoV+kR8nbFA4ZOZ5azkedGo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-cIe9jlrSPiOZDsmGcpi5-g-1; Tue, 12 Oct 2021 02:39:54 -0400
X-MC-Unique: cIe9jlrSPiOZDsmGcpi5-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so18056221edj.0
 for <qemu-arm@nongnu.org>; Mon, 11 Oct 2021 23:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sg0ZUIe2qujzGohFbDm5tFYCs8RdfXL+QYfcG1lJnYs=;
 b=h+k98lhDzHFQNXuaz6y7gu7rX4/pPP8THjPqADMQY8azFEEAmv7ojXNPlAXXssbOaB
 Pj5tpZyEA/tFZb9730L9wiw7Bnf303aO5cAbCnK+bsVfZ7cDdsHIB6loIHrywhLWQ9Zs
 E4bzUd4rFDDJLR5OgS0ETpKXvh7dJi1px7XN/s8nG0Iddv5ow3BK9x9/az31sw1zVdYn
 qSRP8v8yb+MwZ+gA2Pvs4nsY46dOTlIgLxdMOsGSfOYC+vU0QcYNODkTP9K5heofho6h
 Vaudrc8sve8s7YThtRzmxze1XOb5FT63zTFU/FCdnXdJ3gTu3LQ82HgwuX5AVYuU0loY
 KpPQ==
X-Gm-Message-State: AOAM533VODEPYJl4M1C+YLYUL3rnqdw+0p0DQ6LfIZwXgXktFRCNxytX
 L/Lnp4IM+gmjDNX0zT4tUAvnuBkSyBTEVlf/wAb3MMTzZ77rQoyHhPtUe9k88Z1MlG/e7DtjD9h
 BkwyYqTV8L5j5
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr44808288edd.365.1634020793417; 
 Mon, 11 Oct 2021 23:39:53 -0700 (PDT)
X-Received: by 2002:a05:6402:354a:: with SMTP id
 f10mr44808263edd.365.1634020793172; 
 Mon, 11 Oct 2021 23:39:53 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id n23sm5328248edw.75.2021.10.11.23.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 23:39:52 -0700 (PDT)
Date: Tue, 12 Oct 2021 08:39:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2 1/2] numa: Set default distance map if needed
Message-ID: <20211012063951.iopcrftqtw67exln@gator.home>
References: <20211012063603.166255-1-gshan@redhat.com>
 <20211012063603.166255-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012063603.166255-2-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U3fs4hoyW+AH

On Tue, Oct 12, 2021 at 02:36:02PM +0800, Gavin Shan wrote:
> The following option is used to specify the distance map. It's
> possible the option isn't provided by user. In this case, the
> distance map isn't populated and exposed to platform. On the
> other hand, the empty NUMA node, where no memory resides, is
> allowed on ARM64 virt platform. For these empty NUMA nodes,
> their corresponding device-tree nodes aren't populated, but
> their NUMA IDs should be included in the "/distance-map"
> device-tree node, so that kernel can probe them properly if
> device-tree is used.
> 
>   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> 
> So when user doesn't specify distance map, we need to generate
> the default distance map, where the local and remote distances
> are 10 and 20 separately. However, this is going to change the
> hardware description of the guest in this particular scenario.
> It's fine as the guest should be tolerant to ignore the distance
> map completely or parse it properly by following the device-tree
> specification.
> 
> This introduces an extra parameter to the exiting function
> complete_init_numa_distance() to generate the default distance
> map when no node pair distances are provided by user.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/core/numa.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

