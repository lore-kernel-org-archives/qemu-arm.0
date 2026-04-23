Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEFCFC0379
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 16:08:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFwaj-0004fV-JG; Thu, 23 Apr 2026 12:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wFwaW-0004dn-JJ
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wFwaM-00012l-DA
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 12:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776960443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QiK8IP/k+DnDYnRKizravr/pRsAQbIxHBJ6gwM6XuqU=;
 b=JxlEpZsPMsvV0g0oPShod/G+1eJXu3YvdXEoZlqyTI3sKemkQi97z4Z/xNpvuw/LWlKE3N
 UIez77YiAXCgUck8Iq63lwZO71dmqYE2/ALM2YNDU9sJvr9flsCQCQ/YEOq73sWhAOtmc6
 IljQtk2JdrkgjAHrtqh4z+cM58vYT60=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-S1AzYLqZPVCiRDY3_4Tn7Q-1; Thu, 23 Apr 2026 12:07:22 -0400
X-MC-Unique: S1AzYLqZPVCiRDY3_4Tn7Q-1
X-Mimecast-MFC-AGG-ID: S1AzYLqZPVCiRDY3_4Tn7Q_1776960441
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8a3bc7f5d43so157523916d6.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 09:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776960441; x=1777565241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiK8IP/k+DnDYnRKizravr/pRsAQbIxHBJ6gwM6XuqU=;
 b=QnlgyiUcpgcMMxnRNT+8EfxjjF5kshTxhu2mFyLKmmuVNR82HAwoNedlFgTmoiulvC
 H/MeXc33W3KRJ7mDB1SLhSB5vFU9eFCkCpad694+rj2RXhJQfUaX2BlFwuU70XIV8r9R
 5ghAMBkEr+veArVH6tAfgBkhOxBVcMwT4Di9JVv2aWPXsurUg1s0va5Ykx1RJIX1wGiS
 zsWUqaitA++GWV6SSP+MUU9Rj6ZnA0qlUdNHBzNmshRwvkF+PRiqWE1fChkW7edS1AFT
 6PYdCshIp5QfVhJtTpwIRZQv0P4FnmzN7B54LD6n4RQONDfwD57Kw3JjTgE1iS/A8lIg
 +3wA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gcYugCs4J3H10NjWAds2XSrrHcvMlePtM48ODD7w5tPUvPA+a+NhvjjDyQV0rY9UKQWz8H6pT9g==@nongnu.org
X-Gm-Message-State: AOJu0YwH1nmBrCKKRxeY672oqjbHUzJICIV9FP4Jl8OeyOPzSwvWCkj2
 RKVQ2PdD4cIpe+W5ygiu13vCFS2shEnCMD3d/8ZwXeW2IH2F0kKgveFi4/IE+KYl7GzUzAEoNf6
 X1N6LT2VfJr1S6m4ckx2WG0DG9mBPJfcl7QJ7AG/aw1zqVYoQBYv8Rg==
X-Gm-Gg: AeBDies0JwX4/30Q0Dn2tDPp8uchro/gaprDuqFGUuXfmiRFigTjG26Ci1bVfi9TGE2
 W62Ow7JJJ//Y5JLWjXRns7kHJkmzVuAo0Fk+Fa9pYe/xt1gRPliIc1CJDjF2y0MUNG0qPEwbSFp
 jJ6dIOfHMsztS9ke/83Ld4ArNTj4kiJ4UJFZjLc1+XIeSabur+7PASL1MskrrFziXM2On9XmAfv
 gs3SNlFt2NVBLO3FGX+l3mO+FkpJlJ6VpTykBjgLopw9iQygHqjz5etpJDt1acLtJM0wfiaHXWM
 CjiZOp4MXQbMmWEkcZf89gie7pmINgP4bq4JoXxkdEa/IzYUSA0abzigKS+rPk1/DUfShH2DkHI
 r4RGE+yGX5rVKYA4alJULy0f1ZSo4orYHpErMa21sX0GK3InvuHy8NOnpYA==
X-Received: by 2002:ad4:5765:0:b0:8b0:2b9e:9639 with SMTP id
 6a1803df08f44-8b02b9e9e6dmr428012506d6.19.1776960440670; 
 Thu, 23 Apr 2026 09:07:20 -0700 (PDT)
X-Received: by 2002:ad4:5765:0:b0:8b0:2b9e:9639 with SMTP id
 6a1803df08f44-8b02b9e9e6dmr428011796d6.19.1776960440100; 
 Thu, 23 Apr 2026 09:07:20 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ae5ec2dsm167327096d6.29.2026.04.23.09.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 09:07:19 -0700 (PDT)
Date: Thu, 23 Apr 2026 12:07:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: "philmd@linaro.org" <philmd@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 "farosas@suse.de" <farosas@suse.de>
Subject: Re: [PATCH v4 08/17] hw/usb/hcd-ehci: Change descriptor addresses to
 64-bit with migration compatibility
Message-ID: <aepDtUYjYfag6TeC@x1.local>
References: <20260423051804.362095-1-jamin_lin@aspeedtech.com>
 <20260423051804.362095-9-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20260423051804.362095-9-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bLByjLV7QoCLKbme7k0rV0sZahKHUXQmtGxgpGI2mJI_1776960441
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Apr 23, 2026 at 05:18:15AM +0000, Jamin Lin wrote:
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 0aa77a57e9..e77400c7ab 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,6 +41,8 @@
>  GlobalProperty hw_compat_10_2[] = {
>      { "scsi-block", "migrate-pr", "off" },
>      { "isa-cirrus-vga", "global-vmstate", "true" },
> +    { "sysbus-ehci-usb", "x-migrate-fetch-addr-64bit", "off" },
> +    { "pci-ehci-usb", "x-migrate-fetch-addr-64bit", "off" },
>  };

Sorry I forgot to comment here previously: we just released 11.0, I think
it means you want hw_compat_11_0[] now, otherwise someone using 11.0.0
released binary may hit issues migrating to some newer binaries before 11.1.

-- 
Peter Xu


