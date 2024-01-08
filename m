Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2238403ejo;
        Mon, 8 Jan 2024 04:10:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK5sFXbooLeH0gsbk6KdQLJv/OqlhnK/Ku96aLUuXylyyV9/YUC6UmNptugwoL/BngzisG
X-Received: by 2002:a05:622a:58c:b0:428:3624:2f4f with SMTP id c12-20020a05622a058c00b0042836242f4fmr3111967qtb.34.1704715808332;
        Mon, 08 Jan 2024 04:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704715808; cv=none;
        d=google.com; s=arc-20160816;
        b=nP69PhpV+xPBFmFXixRKjl8yEUQrM1WY/IPJAEJehHdmT9rHcVGgiCPRiNxxjkhP+w
         QlprIEZ2oFTnw6XEU3ieXC4ICdLuukQUHrmcUv9Fstq76JS66+ZGAbW5Gj/7n2WFaeaC
         171Wv1n7O8ML2v85diQNE7IBUn4ZhM84iHXRS3vX/LcVO9tFFnEo1vxkMmfpLv8Djt9f
         ahzr2jLT2yHo/r9ey+pKc0Exh1pQtXcxCFUObxUyZqRMA/Fkz/7kXTjWG0+eWuPakp2V
         iWnqh0L0HfYIp4mUFLnedRehuIwr3ZWcgcm0TVCC2kvU2QIT/8w0Gdqq1M2kEZUG53ph
         m5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=+ydfLVrkZ7pJkLYd8BR7nMyvLuYvhX8AL5RDxFfkbWg=;
        fh=yb4b79XAGCI30noH8GSpCr9rwvQW/pGoAYpupm/Cfyc=;
        b=KJBkKoXReJKM7+B8oMKcFIkHqkmVbz9shPvd5GJqHGSlFIxtTxRa3stzAEdafjh8zk
         VkSURja1h5isB5+KIER9BCpr546bMv6KXlpgqjQL5bCmCQQY0dYNRu+r/Gxj8fT0wVaG
         9m8ptj1KGlGjDKWOAjOWsmnBtnSO8HLqN56yR1v+xgqIEk+mfG5MMMvvCryxWM+ktHi+
         PbAXVNenlxg2XQEO6aj0H1F7hrGm+CLrdODfZKiSR7S0GpxjpA44BgwZEjJsrIKJ7Sod
         rYkf8NLqruHcxWVLQkRSMZkglsY95a4/m9Kbxm4Rtosq+XlH9xgYwhbpIckqPTqdiQTL
         +n5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQeMcWPi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a05622a170800b004299e308fe2si235875qtk.388.2024.01.08.04.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 04:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VQeMcWPi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMoS3-0003Z2-LB; Mon, 08 Jan 2024 07:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rMoRu-0003YA-CM
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rMoRn-0007k9-GL
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704715764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ydfLVrkZ7pJkLYd8BR7nMyvLuYvhX8AL5RDxFfkbWg=;
 b=VQeMcWPiUBfQ/ojJ10Y+wyyEyM+4GP0Ov0HQpTPExZFBqgH0/yJ0eiuI4cIKMpGCZ0Ez9S
 2JEIC6Vnx/rP9R6CwkeDo60konJ8/PquiLvHWAlAaxTGkYPFexmrXEquAIlrUx1/qBz0Zd
 72zx127wX8WRRqzlvNxMq9I/wG8NHlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-JMHaL6SvNeebYLR2qYpJ6g-1; Mon, 08 Jan 2024 07:09:21 -0500
X-MC-Unique: JMHaL6SvNeebYLR2qYpJ6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F375837183;
 Mon,  8 Jan 2024 12:09:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBD31C060AF;
 Mon,  8 Jan 2024 12:09:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5821521E6806; Mon,  8 Jan 2024 13:09:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <ankita@nvidia.com>
Cc: <jgg@nvidia.com>,  <alex.williamson@redhat.com>,  <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>,  <peter.maydell@linaro.org>,
 <ani@anisinha.ca>,  <berrange@redhat.com>,  <eduardo@habkost.net>,
 <imammedo@redhat.com>,  <mst@redhat.com>,  <eblake@redhat.com>,
 <david@redhat.com>,  <gshan@redhat.com>,  <Jonathan.Cameron@huawei.com>,
 <aniketa@nvidia.com>,  <cjia@nvidia.com>,  <kwankhede@nvidia.com>,
 <targupta@nvidia.com>,  <vsethi@nvidia.com>,  <acurrid@nvidia.com>,
 <dnigam@nvidia.com>,  <udhoke@nvidia.com>,  <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 1/2] qom: new object to associate device to numa node
In-Reply-To: <20231225045603.7654-2-ankita@nvidia.com> (ankita@nvidia.com's
 message of "Mon, 25 Dec 2023 10:26:02 +0530")
References: <20231225045603.7654-1-ankita@nvidia.com>
 <20231225045603.7654-2-ankita@nvidia.com>
Date: Mon, 08 Jan 2024 13:09:19 +0100
Message-ID: <87v884t4b4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6DdFRWPOCRGx

<ankita@nvidia.com> writes:

> From: Ankit Agrawal <ankita@nvidia.com>
>
> NVIDIA GPU's support MIG (Mult-Instance GPUs) feature [1], which allows
> partitioning of the GPU device resources (including device memory) into
> several (upto 8) isolated instances. Each of the partitioned memory needs
> a dedicated NUMA node to operate. The partitions are not fixed and they
> can be created/deleted at runtime.
>
> Unfortunately Linux OS does not provide a means to dynamically create/destroy
> NUMA nodes and such feature implementation is not expected to be trivial. The
> nodes that OS discovers at the boot time while parsing SRAT remains fixed. So
> we utilize the Generic Initiator Affinity structures that allows association
> between nodes and devices. Multiple GI structures per BDF is possible,
> allowing creation of multiple nodes by exposing unique PXM in each of these
> structures.
>
> Introduce a new acpi-generic-initiator object to allow host admin provide the
> device and the corresponding NUMA nodes. Qemu maintain this association and
> use this object to build the requisite GI Affinity Structure. On a multi
> device system, each device supporting the features needs a unique
> acpi-generic-initiator object with its own set of NUMA nodes associated to it.
>
> An admin can provide the range of nodes through a uint16 array host-nodes
> and link it to a device by providing its id. Currently, only PCI device is
> supported. The following sample creates 8 nodes per PCI device for a VM
> with 2 PCI devices and link them to the respecitve PCI device using
> acpi-generic-initiator objects:
>
> -numa node,nodeid=2 -numa node,nodeid=3 -numa node,nodeid=4 \
> -numa node,nodeid=5 -numa node,nodeid=6 -numa node,nodeid=7 \
> -numa node,nodeid=8 -numa node,nodeid=9 \
> -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,pci-dev=dev0,host-nodes=2-9 \
>
> -numa node,nodeid=10 -numa node,nodeid=11 -numa node,nodeid=12 \
> -numa node,nodeid=13 -numa node,nodeid=14 -numa node,nodeid=15 \
> -numa node,nodeid=16 -numa node,nodeid=17 \
> -device vfio-pci-nohotplug,host=0009:01:01.0,bus=pcie.0,addr=05.0,rombar=0,id=dev1 \
> -object acpi-generic-initiator,id=gi1,pci-dev=dev1,host-nodes=10-17 \
>
> [1] https://www.nvidia.com/en-in/technologies/multi-instance-gpu
>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

Appreciate the improved commit message.

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index c53ef978ff..7b33d4a53c 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -794,6 +794,21 @@
>  { 'struct': 'VfioUserServerProperties',
>    'data': { 'socket': 'SocketAddress', 'device': 'str' } }
>  
> +##
> +# @AcpiGenericInitiatorProperties:
> +#
> +# Properties for acpi-generic-initiator objects.
> +#
> +# @pci-dev: PCI device ID to be associated with the node
> +#
> +# @host-nodes: numa node list associated with the PCI device.

NUMA

Suggest "list of NUMA nodes associated with ..."

> +#
> +# Since: 9.0
> +##
> +{ 'struct': 'AcpiGenericInitiatorProperties',
> +  'data': { 'pci-dev': 'str',
> +            'host-nodes': ['uint16'] } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -911,6 +926,7 @@
>  ##
>  { 'enum': 'ObjectType',
>    'data': [
> +    'acpi-generic-initiator',
>      'authz-list',
>      'authz-listfile',
>      'authz-pam',
> @@ -981,6 +997,7 @@
>              'id': 'str' },
>    'discriminator': 'qom-type',
>    'data': {
> +      'acpi-generic-initiator':     'AcpiGenericInitiatorProperties',
>        'authz-list':                 'AuthZListProperties',
>        'authz-listfile':             'AuthZListFileProperties',
>        'authz-pam':                  'AuthZPAMProperties',

I'm holding my Acked-by until the interface design issues raised by
Jason have been resolved.

