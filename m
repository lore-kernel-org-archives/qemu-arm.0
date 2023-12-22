Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp214230ejz;
        Fri, 22 Dec 2023 04:33:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2JrH3ukhvvlDm73+Tf9BsUKtGYDJAcvV3h+Q4rFBI3Kki/1Ke7UUuMgdkDPK69eNjHoC8
X-Received: by 2002:a05:6870:d0c2:b0:204:290b:a834 with SMTP id k2-20020a056870d0c200b00204290ba834mr1374363oaa.80.1703248401272;
        Fri, 22 Dec 2023 04:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703248401; cv=none;
        d=google.com; s=arc-20160816;
        b=dKOtF6EcuoOb5Kpc0ZY/BY6EQwQMkhHEarCQGkep09mrNYbV4kpst7fqF9nn2oxMPs
         i/PgOoB5Q0PtGUKrZ4EzcQ3ECUDi8p3iUgADB68qq+JXll8PbhWp7NeKPZf+I3OrVgtj
         48BwXwRAQaJjB7XQcUgmp4+Y41o90uaph9+xCcWrkG8MlXkqHvpDRN/Wn8E4EhADxxhL
         /N8cqsBjO2ZMXyCV9yzx5qYJSIcNa7rUOl2OAYGLROpDnrLH8vh+/lhCjvedXEKaRtoQ
         3OfgDcy0OFaSdvZ92ISJaaEiT0YGs2HJFdE5+2y2YqDIZAEqQk8eb3S0b4YRKjjjTrgX
         i9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=hUvCISjbl+loCRULzXzhvpLMDReBHUPtGPw/5RU/wxA=;
        fh=yb4b79XAGCI30noH8GSpCr9rwvQW/pGoAYpupm/Cfyc=;
        b=NY/sZD6detZaUl4EelvLR39ZPrSBMhPf9cPz1gFWadosDrEcEHSDNzNcZWPmmxU/g6
         BEMj3CisEG0clsA/4xxl4kzed0oZRpn6CVsnM6vQKgyDIrUjlN9HGh+AtAETS4UYYs0j
         UGVrydb8FGNuNOk+h7J1lpAFsj3W5pjI8TBDzhv99co6KoRp4/gxCFkaXgIQvZv6ge9Q
         2kekbq9iBXsBr3ceZNzZX9t+lFhexvFoL7qo467cDo00Kz+OexwJE+cRClD55EV3bydS
         S7EiIgtmDSrg7mPeBIx+EIB4q9O/4BBGFFJjN88WyK6IThrY32SYYWWbEFtEPULzkk3N
         LqJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aS1zpt6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ac85704000000b004277b584742si4348161qtw.505.2023.12.22.04.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Dec 2023 04:33:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aS1zpt6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rGehv-00056F-Q0; Fri, 22 Dec 2023 07:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rGeht-00055U-Q5
 for qemu-arm@nongnu.org; Fri, 22 Dec 2023 07:32:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rGehr-0003kC-PB
 for qemu-arm@nongnu.org; Fri, 22 Dec 2023 07:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703248366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hUvCISjbl+loCRULzXzhvpLMDReBHUPtGPw/5RU/wxA=;
 b=aS1zpt6Ea9sNApCdekAHSFjuCtZ4usmWyEpBUuDP24znjsUKdpZspc7merUx0UXw5488yX
 3kG7MG6UTVoa2EWJm3It8Ey0WlhmjF4ZifAUrHCpdrot3jEeesg5amThb3QRHwW2GAjDpi
 BB6rzi7QHtl6LxOMELa/1bTaSvCWI/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-Mt6qJCkmOZu9zv_c3BnRQQ-1; Fri, 22 Dec 2023 07:32:43 -0500
X-MC-Unique: Mt6qJCkmOZu9zv_c3BnRQQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5974C85A588;
 Fri, 22 Dec 2023 12:32:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C053492BC8;
 Fri, 22 Dec 2023 12:32:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 29CA221E6920; Fri, 22 Dec 2023 13:32:41 +0100 (CET)
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
Subject: Re: [PATCH v5 1/2] qom: new object to associate device to numa node
In-Reply-To: <20231203060245.31593-2-ankita@nvidia.com> (ankita@nvidia.com's
 message of "Sun, 3 Dec 2023 11:32:44 +0530")
References: <20231203060245.31593-1-ankita@nvidia.com>
 <20231203060245.31593-2-ankita@nvidia.com>
Date: Fri, 22 Dec 2023 13:32:41 +0100
Message-ID: <87msu2h0ye.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: a03wxWfzsyO4

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
> use this object to build the requisite GI Affinity Structure.

Pardon my ignorance...  What makes this object an "initiator", and why
is it "generic"?

> An admin can provide the range of nodes through a uint16 array host-nodes
> and link it to a device by providing its id. Currently, only PCI device is
> supported. The following sample creates 8 nodes and link them to the PCI
> device dev0:
>
> -numa node,nodeid=2 \
> -numa node,nodeid=3 \
> -numa node,nodeid=4 \
> -numa node,nodeid=5 \
> -numa node,nodeid=6 \
> -numa node,nodeid=7 \
> -numa node,nodeid=8 \
> -numa node,nodeid=9 \
> -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
> -object acpi-generic-initiator,id=gi0,pci-dev=dev0,host-nodes=2-9 \

Does this link *all* NUMA nodes to dev0?

Would an example involving two devices be more instructive?

> [1] https://www.nvidia.com/en-in/technologies/multi-instance-gpu
>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index c53ef978ff..efcc4b8dfd 100644
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
> +# @host-nodes: numa node list

This feels a bit terse.  The commit message makes me guess this
specifies the NUMA nodes to be linked to @pci-dev.  Correct?

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

