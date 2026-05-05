Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06FCCD3427
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 16:34:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKIjF-0002bG-Gj; Tue, 05 May 2026 12:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wKIjE-0002ao-2d
 for qemu-arm@nongnu.org; Tue, 05 May 2026 12:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wKIjC-000802-64
 for qemu-arm@nongnu.org; Tue, 05 May 2026 12:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777998872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z+kr8Gp+Yps/IQFI3wHs7K3+JQMHSwqLLkf25SlXS4g=;
 b=OOuUs3jGethlfuaAkdWEwhJgbGmsnKzSuTnORsCiYQeNW4DiECgZjVXe3JmEGqd2gOJn18
 5IOm7Kdgbe9Z1Ia9ckx2MNyYY+6o/VJ2mbtthmSFGpDfLYLjgG0eYWlpdoaEJKK0LbCrHB
 BW9JyZ7pjSH4KZaVkURXYNCpdIbD1D8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-LMKpfINuPoG8Wj-XBTn65A-1; Tue, 05 May 2026 12:34:31 -0400
X-MC-Unique: LMKpfINuPoG8Wj-XBTn65A-1
X-Mimecast-MFC-AGG-ID: LMKpfINuPoG8Wj-XBTn65A_1777998871
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8f9e55c40a5so647771385a.3
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 09:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777998871; x=1778603671;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+kr8Gp+Yps/IQFI3wHs7K3+JQMHSwqLLkf25SlXS4g=;
 b=f3KUkpeBDwbWWIeC2EX0uh5kFwCtUcH50S6kqbb77+DTCrDxls/GksZvevKxk8KSOQ
 9S1v4FGUB9hPQVfzScRBBIGFPJ3g3Nax8hB5u49UNCIK7JTdP0DKdEQHevXeAdBDScqY
 ZLA47OucIG4HPpbVarDt3eVsvQxJi0wl6XbNYEnLGxCgH8lg6h34yPnbrOGSrUReMQYF
 JdRpmUsWIEtiaUiGH7MONVzoBGmGsMUFtve0XRBkLPZt6krOzg4pgrWjnCqLaWgkbbPd
 JvmkaEd49QV/oAFaPHqYmNFCT6XRPmy85JYy0eWrbPV7h/zyIgov+Es4u4O/YiIKJPRh
 n2HA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/UAffWNDEyP/oqXEEjZt2egk8fDEde3FYTv4dRMV3GLCS3r8y1uPzZdCzOqDmbKIyI9rrcvcu96A==@nongnu.org
X-Gm-Message-State: AOJu0Yzz8xBnb04yKeuL0gWsk6vPqEi+cEhGteRZLFxHIf4P4yjkNlN0
 o+4VizJUK8OvMZBNvKES+5lkEb3np8XoS1sn8r+sVQEyJMR6apCwK/sF8BcHTisJyn4Fq181QGL
 +zY/d5T0yhuBkjIal/J49KlrMEtRqn1afdy5MRNcltV94pY5yaFHeoQ==
X-Gm-Gg: AeBDiesMNX7aLxJGy9bPDBOeGjwlTpY8olURWWOklOzb/7JNVf64P+eoI7hNqLzkiGL
 TQkCTAtdgHDld/i0G6iirazrtQC6cQCvoinKUCNX/jFsRundlNm44jkhhkFAv9u1DoWviUVPpMZ
 plCs7lw2tsYqXokENhrjOYJ0r3o4UcsQ+FtBHUSaZ5CDKjsNchCWkqV/Z0x6mSCalkq1knV+FX5
 asqV44B9QoVo+ptfvwPIyTbnD4sN94w9vENtwmaqfL/dSApPvYIQCHUdpNkcCmNpI3ktsP2gTJR
 pN+c8EdxHxjQJG7uyRkhnv1FFSYUrmI5UNoFoVK+TpjDbE1pxR2VocDJGnGp4wixckahppQJakP
 no9riXu52urMaugWOZDoe5Pmaul/qwx1C8wM9rxr8gdRuAqH78yPTYp5Fog==
X-Received: by 2002:a05:620a:4891:b0:8cf:df8b:1e5e with SMTP id
 af79cd13be357-8fd15ecc29emr2336537385a.5.1777998871137; 
 Tue, 05 May 2026 09:34:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4891:b0:8cf:df8b:1e5e with SMTP id
 af79cd13be357-8fd15ecc29emr2336523185a.5.1777998869759; 
 Tue, 05 May 2026 09:34:29 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8fc2c91cdfbsm1416972085a.34.2026.05.05.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 09:34:29 -0700 (PDT)
Date: Tue, 5 May 2026 12:34:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/4] MemoryRegionOps .impl cleanups
Message-ID: <afocE9r0gJfx4kis@x1.local>
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20260428093339.2087081-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: luqOTHC1rA-qvYkice01trmASx2qMa3yGUqPS3JbQkM_1777998871
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Apr 28, 2026 at 10:33:35AM +0100, Peter Maydell wrote:
> This patchset is some fixes to MemoryRegionOps that were
> accidentally setting odd .impl values, plus an extra assert
> that we can now add that a MemoryRegionOps doesn't set
> .impl.unaligned true but .valid.unaligned false. They're
> originally from the CJ Chen / Tomoyuki Hirose patchset that
> aims to support proper synthesis of unaligned accesses in
> the memory system core. I still want to get that patchset
> upstream, but for the moment this is a set of simple
> cleanups:
> 
>  * riscv_iommu_trap_ops set .impl.unaligned but not
>    .valid.unaligned
>  * npcm7xx_fiu_flash_ops failed to set any .impl at all
>  * xtensa_mx_pic_ops failed to set any .impl, and was
>    less strict than it could be about .valid
> 
> Patches 1 and 4 have been reviewed.

I queued it..

-- 
Peter Xu


