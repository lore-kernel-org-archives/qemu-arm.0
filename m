Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73170C79F89
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 09:24:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3VaS-0006MI-Om; Mon, 07 Sep 2026 05:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x3VaQ-0006L8-S3
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 05:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x3VaP-00024s-G5
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 05:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788773060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MTr5UwxO4Cqc3fOb8vc8m9tnhH1jpx4Go/BW6KFEozs=;
 b=gfmOYC4QwmNipZJ8B/hasR2a2aRJVg1Wrb2zD6Dlf9wpl/1cVzScBPuVDq8hlNNuWLv/Zw
 BjubGJauq7m7eMxwghkgIl993hYhHgZKoBtRdty0jImTqio97awrrwwR88JcH7gj+6Sn6x
 jP2aZtSwMPKxymuEDlv2WpVmOE93WII=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-5cJsZqI7NT6ab676uS292w-1; Mon, 07 Sep 2026 05:24:19 -0400
X-MC-Unique: 5cJsZqI7NT6ab676uS292w-1
X-Mimecast-MFC-AGG-ID: 5cJsZqI7NT6ab676uS292w_1788773058
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49cf5bd2f12so46076725e9.1
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 02:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788773058; x=1789377858;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MTr5UwxO4Cqc3fOb8vc8m9tnhH1jpx4Go/BW6KFEozs=;
 b=OUraRXGfQ+nZZlUbWMtQn98vXGJQQvQiU/oEGFUjy7InTo4kYDvqvNfHXBOYhT2V1r
 WIFVthuanyS/CgrjnOopqHt5cYVj2pD5YHgaHSsPvKy2rfaaEukRzbv/siCWqyXiFi6q
 5dA49IP+Y7fkVHwojq79f/mtrLLCRv0jStN6mCDrJROasu7LRM/KNdcBWfgcn/a56zkk
 HEm7nyB6cO8s9Cw/6UD2DSA4em33KMC0f9kJzWKsfr0hid1h4GIa7WhZOMGSyAFENszm
 S7frziQzNjHsVv7znFuN6e3hQOsg2Zal03P0hA1n7X5lfRKnZJAUtOmIWD/mSu09BeN4
 09RA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw98m81/OeQVjyYmPdM3xk/jJBulshXvvKL0b/VRfJdup1iy+Y8642EOaOvKDyOfrDkpYvursuixw==@nongnu.org
X-Gm-Message-State: AFuF++m+QovCXIGwlx9FJwJG6VkgfvbGdFrLjkbE7Zg8Q3XHU2aywsWE
 4e8glUdqkWmeW+IYoBFmArOolY9oENTPQTGLFDUZopiF0ytb2elSbJM2ehkhsZNsM/dK0eTRDkp
 ygxFMuF8JQwE+kfMlwvUVPp/xO/YXg9jgzkmdpXvM51ILt/inQ3i6Tg==
X-Gm-Gg: AYBFou0vv6A4AzSYs9QyNXrwafTT0tA8spPvUdQhm7dDvC0LzUOY5MPOp8ChvG4J9Mg
 tBm5jn6U+jjD08Ujbm9ECOhAvOomXI6DXYwNMCQJW0tV33PadTax21WOLHPYsHnH8WJQ1+KvR3W
 tsPc92Y5x0UgjQAcNiPT5OEZWQTuxKqt5P/gp+CORoMu3xQ+6wxshIScEQrcKhqIIIXicmBxHY1
 iwveUEGaHUYruXqu/lyJwFAXe6qJexewqZTC81kyMCSus233qSuSsLsrCWUyRS5A8e/iuCKzbLR
 ckmWe2noIpTwfLb2nZ8LH7V41llvJkydvyF1KCBwUTifgVzjWQF7uqGTb7TF8qJVfyVtIynYjTd
 Vw2Z4klhDyHKjH1QozZuPfM8=
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id
 5b1f17b1804b1-49cfa211cd7mr201179005e9.27.1788773058402; 
 Mon, 07 Sep 2026 02:24:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id
 5b1f17b1804b1-49cfa211cd7mr201178565e9.27.1788773057905; 
 Mon, 07 Sep 2026 02:24:17 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm402779555e9.5.2026.09.07.02.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 02:24:17 -0700 (PDT)
Date: Mon, 7 Sep 2026 05:24:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v1 3/7] hw/pci: Add the ASPEED VGA device id
Message-ID: <20260907052308-mutt-send-email-mst@kernel.org>
References: <20260907092004.2590015-1-jamin_lin@aspeedtech.com>
 <20260907092004.2590015-4-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20260907092004.2590015-4-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ax0CmQfW3ORv0PK4rx65BTS0Q5ltsRUA9TAcTalR3SA_1788773058
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
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

On Mon, Sep 07, 2026 at 09:20:08AM +0000, Jamin Lin wrote:
> The ASPEED vendor id is already listed. Add 0x2000, the device id the
> display controller of the ASPEED BMC SoCs reports, so that the model
> added by the next patch can use it.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  include/hw/pci/pci_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 16034aaa2c..e16d93dd13 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -292,5 +292,6 @@
>  #define PCI_VENDOR_ID_NVIDIA             0x10de
>  
>  #define PCI_VENDOR_ID_ASPEED             0x1A03
> +#define PCI_DEVICE_ID_ASPEED_VGA         0x2000
>  
>  #endif

you do not really need it, it should only be used
in one place. open-code the dev id in the implementation.
subsystem id will be copied automatically if not set.

> -- 
> 2.53.0
> 


