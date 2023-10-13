Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1502991ejc;
        Fri, 13 Oct 2023 06:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjbXYakI0EWXGWtdiaRDz/kY69Ry+MOvohsVxHKAvQRpc5oGubEe4FNwZXpEY3xO5tG7QS
X-Received: by 2002:ac8:7c47:0:b0:417:fa78:58a4 with SMTP id o7-20020ac87c47000000b00417fa7858a4mr28016603qtv.42.1697203086531;
        Fri, 13 Oct 2023 06:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697203086; cv=none;
        d=google.com; s=arc-20160816;
        b=di2HQf02EaGAD0L5w2YsVoYWmtVmL9iLQfHo+WcCZ4uN0b/PngpFCJihwzXx/Tltm4
         5IS6KGl0yLYlEmUvnWC8H++O2W8WujuCzKPWj/xenU5t8zz/WWHEjCsMhoKSBhN22uBD
         m/4QqNkD9BIkyAsBPWLp+AJG/QkT0bzwbtdmdAVDHu2ysOXzn0xw98pFtdqRkOXU4TJg
         VZFYaEoPLVABJXxO3ow6UV1lIjRmkffdhi4lowfQSOb34I/vNJzubUjDA4cQkqFXS+H3
         HUUTesodJeqEW7B0vgdWEI6mgz4D9YmyeWuZ+EGEfV1D4FPI/22LXUtVuokCQqEa+WrL
         mlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=p6MiK6w31lleNdz0E7ANCa/awvHMcP9h8TXacV236/Q=;
        fh=1TvFAV4g/zwF4u8q+aERJOD6dXHMuQW9SeurUNBxU/o=;
        b=t5OHmorRbaPIkCPkjpn+Ivkk33ryvyWLfrELa8flIQxfjhiLaEgfJ4IErS/ToDaV7O
         ipBSJI81/ttvIwwgVsrDuKa/u2VskVUnHVR+B8Phz9PdmwCvtuqDm/8m/M8zVeaY35TG
         F6za1heQpwUu6KrMNei1dC3A4Xmn2pMgp7KrojZsoVRrdA5KFXWAsMa612Th6P/Ol5fR
         JGb8O8G9YeWKVDbeR7T661d3jBxaCmSHY75QDgJyzgSUJqFrQnH5HuaolM8Xq6gfwA2n
         aLFiDAa/U3skrWphWOJ1CfrMHrmMuZMq3HerD8d36Yr+ZuYHDAl4K2dBVQicSOVj3h+O
         Uagg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e94YzDAX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020ac85810000000b00419674b991asi1192327qtg.505.2023.10.13.06.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 06:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e94YzDAX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrI2j-00016r-Ds; Fri, 13 Oct 2023 09:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qrI2H-0000ze-1e
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 09:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qrI2F-0007X6-DD
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 09:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697203018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6MiK6w31lleNdz0E7ANCa/awvHMcP9h8TXacV236/Q=;
 b=e94YzDAXDMLvliMt9s7hQZVI66sXhqbQ8v98kUw/zMxBtYjwmFYjsKsAbjEnSZdx0h2qti
 yVGL4wObGLqNsUoCkN8PwWLaI2ugD3GAgTu2LDSe3MTr33MzODzXzbRO9Kp+j+P0oTTzES
 6iqT6C8LJoMMp6B1MqgaK5JUSYutyHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-hgNPPakoMumXJwH4ylgRoQ-1; Fri, 13 Oct 2023 09:16:54 -0400
X-MC-Unique: hgNPPakoMumXJwH4ylgRoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B659B800B23;
 Fri, 13 Oct 2023 13:16:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C446C1596D;
 Fri, 13 Oct 2023 13:16:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 778AA21E6A21; Fri, 13 Oct 2023 15:16:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <ankita@nvidia.com>
Cc: <jgg@nvidia.com>,  <alex.williamson@redhat.com>,  <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>,  <peter.maydell@linaro.org>,
 <ani@anisinha.ca>,  <berrange@redhat.com>,  <eduardo@habkost.net>,
 <imammedo@redhat.com>,  <mst@redhat.com>,  <eblake@redhat.com>,
 <armbru@redhat.com>,  <david@redhat.com>,  <gshan@redhat.com>,
 <Jonathan.Cameron@huawei.com>,  <aniketa@nvidia.com>,  <cjia@nvidia.com>,
 <kwankhede@nvidia.com>,  <targupta@nvidia.com>,  <vsethi@nvidia.com>,
 <acurrid@nvidia.com>,  <dnigam@nvidia.com>,  <udhoke@nvidia.com>,
 <qemu-arm@nongnu.org>,  <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 1/3] qom: new object to associate device to numa node
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-2-ankita@nvidia.com>
Date: Fri, 13 Oct 2023 15:16:52 +0200
In-Reply-To: <20231007201740.30335-2-ankita@nvidia.com> (ankita@nvidia.com's
 message of "Sun, 8 Oct 2023 01:47:38 +0530")
Message-ID: <87sf6efyrf.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xHc3cLGQ6uDf

<ankita@nvidia.com> writes:

> From: Ankit Agrawal <ankita@nvidia.com>
>
> The CPU cache coherent device memory can be added as NUMA nodes
> distinct from the system memory nodes. These nodes are associated
> with the device and Qemu needs a way to maintain this link.
>
> Introduce a new acpi-generic-initiator object to allow host admin
> provide the device and the corresponding NUMA node. Qemu maintain
> this association and use this object to build the requisite GI
> Affinity Structure.
>
> The admin provides the id of the device and the NUMA node id such
> as in the following example.
> -device vfio-pci-nohotplug,host=<bdf>,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,device=dev0,node=2 \
>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index fa3e88c8e6..86c87a161c 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -779,6 +779,20 @@
>  { 'struct': 'VfioUserServerProperties',
>    'data': { 'socket': 'SocketAddress', 'device': 'str' } }
>  
> +##
> +# @AcpiGenericInitiatorProperties:
> +#
> +# Properties for acpi-generic-initiator objects.
> +#
> +# @device: the ID of the device to be associated with the node
> +#
> +# @node: the ID of the numa node
> +#
> +# Since: 8.0

Since 8.2

> +##
> +{ 'struct': 'AcpiGenericInitiatorProperties',
> +  'data': { 'device': 'str', 'node': 'uint32' } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -947,7 +961,8 @@
>      'tls-creds-x509',
>      'tls-cipher-suites',
>      { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
> -    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
> +    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] },
> +    'acpi-generic-initiator'

Please keep the object types sorted alphabetically.

>    ] }
>  
>  ##
> @@ -1014,7 +1029,8 @@
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
>        'x-remote-object':            'RemoteObjectProperties',
> -      'x-vfio-user-server':         'VfioUserServerProperties'
> +      'x-vfio-user-server':         'VfioUserServerProperties',
> +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties'

Likewise.

>    } }
>  
>  ##

