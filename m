Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2316DD111A8
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 10:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ0om-0003SH-2u; Mon, 01 Dec 2025 05:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0nO-0002Xq-3N
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 05:06:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vQ0nM-00039q-1W
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 05:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764583566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uW1p99+fEKKcsGF5xx8D4kXfkA4YCt3Lw264D2SyIyc=;
 b=P2TLC6Qt4q1nEDmVhDmfTAkYDZTcoRa73TvVED6Aq6mi5xf8rRTMK0D2UlPZl2JqJDpUSA
 c3V98zSXwcWlzIvr6l6UfaIvIj+2md4f8dwbpBSIn9fXfFKMvNl1MfAPh/K9TW/s10YHTa
 WNgoqFtKsfUq12BLiGyhBEcfKTnItBE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-5v1LdhbCNFitkQLgrPS7xQ-1; Mon, 01 Dec 2025 05:06:03 -0500
X-MC-Unique: 5v1LdhbCNFitkQLgrPS7xQ-1
X-Mimecast-MFC-AGG-ID: 5v1LdhbCNFitkQLgrPS7xQ_1764583562
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42e2e5ef669so849080f8f.0
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 02:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764583562; x=1765188362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uW1p99+fEKKcsGF5xx8D4kXfkA4YCt3Lw264D2SyIyc=;
 b=w/lhzl5wS/CMJosuxvDbYn1QoJhl6fAbUGpEfhC73GkgtTubhAZlBSBUIEPjre/E8Q
 WQJYxhsNXIF5UxoWCbD1GYQVipSmsAT4vD9ep3eYtqwoXtbqYjC1KPL2LeWe1jOA9Zk6
 3y6ChBxOFoad5Mtnl/jS2iqWrPyssrQ49VAACEXwLAz3dqLHaxM0Sq+ZRpfUpaflAiYV
 XZKTzoTobmpqLZhVAGCc+Oj5YINTBQXsoHIXrF77o89dKKngzA0xnhzKYmjOTX0B5AMC
 aETmbrwFqr9kivWw0zoWk7xbJk8Vbsw0WO3Y3Dm/i8QexKyM6Tk6IKikIS8Klg7heIO+
 daew==
X-Gm-Message-State: AOJu0YyzUp6b+uVRg1EAWhNbvrWM6xTqswcyYnwhQK6VaMqledccCJhB
 IZP+sMT+RNMY/+IVrHjaMoM9FEMu4hiS4LTViEttTiGdHmFd9yCL/3ElxvhfPqgcFSvUeGqjR34
 8Jn4Q68Cr8XubLlsBxrgbpzRI7TlgUcreMfz9OYerZ/SnEKzf+8rQLg==
X-Gm-Gg: ASbGnctloozsSWP9mxoJVx5zk07N/gcYW3N1rV4P4vfvJ8Wl2wuIXpx9enNyfNagshx
 4wbfHhSjGhEO7mSQVInbx200FHZocyXA7mfCNiRUTIJl0rIrtdCJQXBj8rJ/t7GsAUy/n6bNlPB
 p4AyBaM72MVR+RGFCQaz25dDPPLgCMNpJLHY/JfyGAquBFxolBm8hFoRmBBwhXx6pRbXyuBks8x
 ZOWOTQTmLtpH4LA4GZAQeUBcOqzdGD08q3yxbX5VcIA44UNhrwf2JLv/vMnxmDnyCOfZN83hkov
 GRCuk0sT+mo2pkr21591d0z07yAqGlgCU754nloXvf0TtXJ3PRdFqi5YSXm8o/UH3ifyBw==
X-Received: by 2002:a5d:5f54:0:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42e0f1fbd71mr27026366f8f.12.1764583561900; 
 Mon, 01 Dec 2025 02:06:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhuYmeLXGraGZvXTc50VFEuB2MxTZxQVtw773W22xA0ONbEaj/VVEQOaSMqTTXLGSZ2IxBpA==
X-Received: by 2002:a5d:5f54:0:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42e0f1fbd71mr27026320f8f.12.1764583561483; 
 Mon, 01 Dec 2025 02:06:01 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c30c4sm25852149f8f.9.2025.12.01.02.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 02:06:00 -0800 (PST)
Date: Mon, 1 Dec 2025 11:06:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mchehab+huawei@kernel.org,
 jonathan.cameron@huawei.com, armbru@redhat.com, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 3/5] target/arm/kvm: Exit on error from
 acpi_ghes_memory_errors()
Message-ID: <20251201110600.370bc0b5@imammedo>
In-Reply-To: <20251127004435.2098335-4-gshan@redhat.com>
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251127004435.2098335-4-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L0URQxowoVx4y3AOOmk5PuVCIa0x6hmJD0APl10KSkA_1764583562
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 27 Nov 2025 10:44:33 +1000
Gavin Shan <gshan@redhat.com> wrote:

> A core dump is no sense as there isn't programming bugs related to
> errors from acpi_ghes_memory_errors().
> 
> Exit instead of abort when the function returns errors, and the
> excessive error message is also dropped.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/arm/kvm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..acda0b3fb4 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2460,8 +2460,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>                                               paddr)) {
>                      kvm_inject_arm_sea(c);
>                  } else {
> -                    error_report("failed to record the error");
> -                    abort();
> +                    exit(1);
>                  }
>              }
>              return;


