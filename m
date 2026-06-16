Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988DCCD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:51:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZW4w-00019y-TI; Tue, 16 Jun 2026 11:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZW4v-00019R-VC
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZW4u-0002Fm-Cf
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781625110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cFnbQnGTJ2IewXTUH8bk5sEhzZ/zFLPWGs1+B8RGTCY=;
 b=JcaEQduhOkVThxdRUGXQIXXP6yzA0yPA0+yRFBBCdZhrVjvSX/Yowc8XP4zeNSbfEVjw2l
 cD1gaORH4ge4XLPXUDI4qMdJb81dsjrv9p2XrlL47O9o5Kfg7GY86muHL+KlOrA9dQLZRI
 8fjk6/OP1KPJbkdtJt6f4Bxq6nqEpP0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-9ZZVJCrMMH2SVVo8-UXZHw-1; Tue, 16 Jun 2026 11:51:49 -0400
X-MC-Unique: 9ZZVJCrMMH2SVVo8-UXZHw-1
X-Mimecast-MFC-AGG-ID: 9ZZVJCrMMH2SVVo8-UXZHw_1781625108
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5aa43c27d47so2713814e87.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781625107; x=1782229907;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFnbQnGTJ2IewXTUH8bk5sEhzZ/zFLPWGs1+B8RGTCY=;
 b=tEdI8o6woqB8FQbh55UFDNQ6bvBmxi8VLs9kYWkr5hXE6NbG4FRB05mBmUfP5bx15y
 UJKur9tfazrgOG2biVKP/SwXZcbhwNMrymt0SmCB2/UGCfnE+xXFZBpkFUFuG7Mu2nY9
 Pj8Zg+t2m6NofWkJlAmkVLN9AFvboI09Vr9DFhV4t6owi5wcrc6DZaIRpJmRJ7IoRGS8
 4GJWcVDd35UNt4RETpxL+SOR/CdeRXLP4kaE3AuvGFOkWCdRFMlzv5n1l6JvMJpaKrvn
 89/hqDQ1Lu2uCZvI6ZI3OACWqqKDHlYwkb12jRi5ctoiOEc7NKZIcOwfdbnNinSRec7l
 02Xw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/rvXax2DBSYnTYBvRbypaDxbnpek/DwTf4TeGI0kHAnVW8ql4A7QVmNx2cSw3h/jW1kO+BFOyTww==@nongnu.org
X-Gm-Message-State: AOJu0YzMHW79nIcmTNcAjD/KUasr9MzoTtvsRnW1XAuNDnvglXIlr8bV
 2RmEJNWwZ/dgNaZ+AK2jnnklDANtIPWFloOTUZ/nWgRNpMrrB4rr4s8I3TJQt0PaedL0/JaPT76
 Udl8hKmTPnUujpWVH8IzzntZgrSQ/1Uz3TarTMd5rAykvEZYCb1LpZA==
X-Gm-Gg: Acq92OHNgkKNY9NIrynro0ZReoULDF1PPFacJElF7pgb4Q1/uXFGwjmFiyY8mrRMvH6
 LmWZvvmE2qRVZtiG5eq0fZPHYYsp7CcaEewM6RiNg5D9Ru5ASZoGNxWZzQlNoQwJSUpaO3gqVdB
 Oj7QCHjattiK2hhuXbsdNQfPG1qhmk4UBXCCiuDzhTUsc5Aw7SIQ+ss6nuugDg1xPiXcNAXjvAh
 mPtcbRZXVr66WQNgtth1igtGBmvTCPcdkRzvFMA4wigLNKlwGUUQkpsO8EDKVg0Q5U5S1wjXixv
 o7VNX/9LUunBlb3lq8+N9y8F3r1Mdngg5Hb3BNhD7+ULj2vXPTN+KEXsErykapaN7bfPlsbo8OA
 yvKliJnxGKSkB7ve1c5z6wdRvEJQecjznX1E2SOWFrOk=
X-Received: by 2002:a05:6512:b95:b0:5ad:2fde:cd8f with SMTP id
 2adb3069b0e04-5ad46fbccb8mr22205e87.2.1781625107375; 
 Tue, 16 Jun 2026 08:51:47 -0700 (PDT)
X-Received: by 2002:a05:6512:b95:b0:5ad:2fde:cd8f with SMTP id
 2adb3069b0e04-5ad46fbccb8mr22185e87.2.1781625106959; 
 Tue, 16 Jun 2026 08:51:46 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad2e1b49aasm3607701e87.77.2026.06.16.08.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 08:51:46 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:51:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ding Hui <dinghui@sangfor.com.cn>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260616115004-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <20260616021153-mutt-send-email-mst@kernel.org>
 <dfc55b58-5f5d-4ac8-a508-b208cf9565fa@redhat.com>
 <20260616054555-mutt-send-email-mst@kernel.org>
 <ecbd8c97-29f4-4e80-af15-ef5c25f2a66b@sangfor.com.cn>
MIME-Version: 1.0
In-Reply-To: <ecbd8c97-29f4-4e80-af15-ef5c25f2a66b@sangfor.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jL9vX-VMXv0P8aSXrEIiTvvCepNMCmtJRPdP7A7rk8M_1781625108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jun 16, 2026 at 08:50:27PM +0800, Ding Hui wrote:
> > What is the question, exactly? That's why I made the list of 11 issues.
> > Is that unclear, somehow?  Another reason to include that, maybe.
> > 
> 
> We can take the e1000 issue on aarch64 for example:
> 
> Link: https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
> 
> The software allocate ring buffer for hardware to receive packet.
> In normal case, the hardware fill the RX ring descriptor, and with status DD bit=1 (Descriptor Done),
> then the ownership of the ring descriptor is converted to software, after the software consume
> the descriptor, it will write status DD bit=0 and give it back to hardware to refill data.
> 
> pci_dma_write calls memcpy at the underlying level, and on aarch64 with glibc 2.24+,
> the memcpy/memmove implementation uses a branchless sequence that copies
> the same byte three times when count == 1.

Yes this is issue 11:

10. on non-x86 memcpy will do multiple overlapping stores even
for single byte writes. E.g. it does it to avoid extra branches.
This is causing issues in practice.


-- 
MST


