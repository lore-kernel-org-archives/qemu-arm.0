Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1109512ejj;
        Fri, 24 Nov 2023 04:05:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+cLpFq3srsRBY1pABjobYJuKrwhC3TOKpNqNPwL69oSDkcdxj+Ndosehya0w/bguTp7CP
X-Received: by 2002:a05:6122:1d45:b0:49c:b45:6cba with SMTP id gd5-20020a0561221d4500b0049c0b456cbamr2512814vkb.12.1700827501087;
        Fri, 24 Nov 2023 04:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700827501; cv=none;
        d=google.com; s=arc-20160816;
        b=OmcdZ9I9IizlT92tAEKYlhogzhEpNsC5fCpq1kUs64oYQqtYwy7eUJ2UTg/1lro6zy
         +2BBVc0zqDzyrJHghtX7Bo25jitjkMwPDR3bLYvW89p+uHwjOPMRB/QdlLVkWaSoLJTg
         NWiIamZlz5QhCjk4GKeAPy9SuMv4hof0yhVWWrbvIeFIc+eBLdeTCy3bVum6Llxskb/z
         1wyHfQU6DnzYypjMHZWFuxWD9WYxaMd0vAa9G9/NZfel6o/cNXCTMNqebruBtBKs+rrX
         wYt0GWOBk4nhdceCOCx4Cq05YoU6m5Ou5iWIoO1LMCyhUPXedCCnRUeVmduBOJ+RAYkH
         Pprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=5eBNzZF9B5EoGQS4Gocw933h7EYJ+MZzRFH5dERGUGM=;
        fh=a+hYKkKMNlwln51ZXvWB6Cxq9uxm8eNVdkGdUJjRqpo=;
        b=yOs2+giyG99uVLe6dE0IFZXDdQgioz+G/waaeoeCpoOjPf/VBAWNMajhCUxDmgyarj
         8/DkotDMqlF4HmabRNhNsTXFmnA6/3IkpGI8xNHzCJzs36YW/8RACa6O9FWbtE9Mpn+G
         LBc8Wxny5U+hPleN5YafMYfKjEP0kwyXK7xXtC5QoLzxgSnm/evLl0m0/+KsgfJuL+74
         46xAyQ2OHj/6YMJg46e98HZYFazCSUcLarbiMKf+Quol2YUNAKvtkWIO2VkdOGCjJDYX
         +q0OaZLYzf+QSmV5n+urt41IYWEfKz+vCNDM4o2AjKtxzuZ4fQCmP9dtGn3OndRPnxVU
         FKUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZzS304d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k62-20020a1fd341000000b004b03bb13301si742223vkg.183.2023.11.24.04.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 04:05:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZzS304d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6UvQ-0006n9-HW; Fri, 24 Nov 2023 07:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r6UvL-0006ba-9M
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 07:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r6UvJ-0007xu-2L
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 07:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700827478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eBNzZF9B5EoGQS4Gocw933h7EYJ+MZzRFH5dERGUGM=;
 b=SZzS304dfwPKfjxXydBW5ckgON7rikfW5G3QQNXRaFeNqwzXUoovzrtEM5zgWDrttfu63X
 sTmGbMBw35E5DzdLDA2b87Kqj8FbK1BkSIW1yO6yCp/5rxFWa6feN8nOnrwXwHSPwUSozJ
 HvjXBs8KQroHJ2MJVlOIdX2SM6DieVo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-V3bj3g4vOQeOHtbMpw7r1w-1; Fri, 24 Nov 2023 07:04:37 -0500
X-MC-Unique: V3bj3g4vOQeOHtbMpw7r1w-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-540150414efso1177912a12.3
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 04:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700827476; x=1701432276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5eBNzZF9B5EoGQS4Gocw933h7EYJ+MZzRFH5dERGUGM=;
 b=k3Sngvp90xWx/u0P03cNW3vLtdJwpycs3rcLqC0GV2KeMCUrdbmv6Spp2DFgadziCd
 TsYGJKTY/7zBfzBE+nHaL5gqjlfukXfh47oIi3Wsw3pf+xw8V2BKad9vgbPvQyjPNyv3
 xGMA6WVsJiv9tihmsjTZfPN/huPg2lUleZknVFm2J+uINWZnBPI0hxTHL6za1E8LPsgL
 V5J51c4LMAebn5ctVfCJeY+QVUwhT6nglPP+nbLMkd14sA/DpuvCbfgKtJy3kVfd11rh
 USPdLATEmlORodAJE0xPDdKT4T3av13Iis+oD2YZ0JVjtTSVfY5pjIB4n/uzg09bk0Jm
 dhcA==
X-Gm-Message-State: AOJu0YwS5PJcvpySethPMBkjJmMz7v6kJzYrwBxpUjoB5+MJImP45AWs
 VNxF9vV9WOBlne8S/4JXJNtOGJnbFacxOK/C4EUGSj0OGak6XNTfsCrDyKqXU6ZqYmpF3aLkXMn
 kT8rVVKse4wKn
X-Received: by 2002:a17:906:da0c:b0:a03:1bf0:2b92 with SMTP id
 fi12-20020a170906da0c00b00a031bf02b92mr1890701ejb.41.1700827476359; 
 Fri, 24 Nov 2023 04:04:36 -0800 (PST)
X-Received: by 2002:a17:906:da0c:b0:a03:1bf0:2b92 with SMTP id
 fi12-20020a170906da0c00b00a031bf02b92mr1890678ejb.41.1700827476003; 
 Fri, 24 Nov 2023 04:04:36 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a170906089b00b009fe0902961bsm1976493eje.23.2023.11.24.04.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 04:04:35 -0800 (PST)
Date: Fri, 24 Nov 2023 13:04:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, David Woodhouse
 <dwmw@amazon.co.uk>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksandr Tyshchenko
 <Oleksandr_Tyshchenko@epam.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 5/6] xen_arm: Set mc->max_cpus to GUEST_MAX_VCPUS in
 xen_arm_init()
Message-ID: <20231124130434.057951b6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231121221023.419901-6-volodymyr_babchuk@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-6-volodymyr_babchuk@epam.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.058,
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
X-TUID: c9m34npci2fi

On Tue, 21 Nov 2023 22:10:28 +0000
Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:

Probably typo in 'subj'

   mc->max_cpus

is limit on maximum supported vCPUs and it shouldn't be set
by xen_arm_init()

patch itself though does the right thing by setting it
in xen_arm_machine_class_init()

Also below explanation, while valid is not the reason for
increasing mc->max_cpus.

Reason could be as simple as 
   'increase max vCPU limit for FOO machine to XXX'

otherwise machine creation would be aborted early by generic code
with error '...'
see machine_parse_smp_config()


> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The number of vCPUs used for the IOREQ configuration (machine->smp.cpus)
> should really match the system value as for each vCPU we setup a dedicated
> evtchn for the communication with Xen at the runtime. This is needed
> for the IOREQ to be properly configured and work if the involved domain
> has more than one vCPU assigned.
> 
> Set the number of current supported guest vCPUs here (128) which is
> defined in public header arch-arm.h. And the toolstack should then
> pass max_vcpus using "-smp" arg.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  hw/arm/xen_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index a5631529d0..b9c3ae14b6 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -231,7 +231,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
>      MachineClass *mc = MACHINE_CLASS(oc);
>      mc->desc = "Xen Para-virtualized PC";
>      mc->init = xen_arm_init;
> -    mc->max_cpus = 1;
> +    mc->max_cpus = GUEST_MAX_VCPUS;
>      mc->default_machine_opts = "accel=xen";
>      /* Set explicitly here to make sure that real ram_size is passed */
>      mc->default_ram_size = 0;

