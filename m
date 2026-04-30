Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEBCCD13DA
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:27:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wITI6-0001gz-P9; Thu, 30 Apr 2026 11:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wITI4-0001gX-3p
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wITI2-0007Ei-Bp
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777562817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AfuLjk0ckcITtpdP7fbvc86SvFMubnat1hWAe5rmLlc=;
 b=EiNomSH4OwX4DNvuPhDj579cFb/I5oI2QUJ5W6BgPEAiTdxgiH6JXIBy7tIuo5Qk09x+RY
 4hci+V4aNz8JbZrt6q7NjVm2VlvevoZFTNYJsGCsxn1x+ct8tEIy3tKaAfhi93nmOeKNA+
 741rsU8cfM7I14Yj0+RUWj6Qk2ktOWU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-aJBD54BwOGyT96tUoiu0mA-1; Thu, 30 Apr 2026 11:26:55 -0400
X-MC-Unique: aJBD54BwOGyT96tUoiu0mA-1
X-Mimecast-MFC-AGG-ID: aJBD54BwOGyT96tUoiu0mA_1777562815
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8a1accb970fso26665886d6.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777562815; x=1778167615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AfuLjk0ckcITtpdP7fbvc86SvFMubnat1hWAe5rmLlc=;
 b=Bb1ydF/qcEYxNKHcVdA7YN0E9PO3YoKgMQ2uU6U0xMg1oILHideURIZSedjEa076gM
 TkBLhuLmSDn9a3AFaTMW2DcUjWQzF1wqwqut09kQ8dLXqDtmAcSIZMfue3LfJwJmrjug
 Cm7F6RO0fHRhi9sep64ZuTXxwTdW+W5qZUKrSkLCONWTmXSQgScUqa2k36Du7Y40v7CK
 Ddx0ydU5t8yzZC3GYm+EgN1cQXjYvoUCcGFhhdeeTQXWqIj2N/x/Vo4X1HF2Ea9aHAuh
 r4FFDoPLmj3xrrA/r7vb3PReInGYyAJ8pNrny9vnZBUeeFdXWDfR5oijv6QrIjNBz3KR
 ANkg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8n3OCNFfGWdjhpzjdqYjRM/+/S+VSmarTFdgiQJyK7XaxyG7DdQy7Ns5/BBBqKqDDaHtG13hKQRg==@nongnu.org
X-Gm-Message-State: AOJu0YwA+M5BTlXxuP8Z6AKn0MjPvxdu+Vwb4LWdR/c7sO+gd+1TjMsf
 d3ZMK+2YkWW/NOfczMaJcCvbw1AcOls4Wau5JeOFdDnUIUS6LyopTT8aWHq5Fa8p89LhrCdudmI
 a1nFVI8ysH1zPZvq8qxRgm5MhgSwarI89Nxp8rH0crUhKVGCkZ5PD9A==
X-Gm-Gg: AeBDiesw2nBMUbxkf2WUqA061NR3GnJ2Qsq14S9O8lPvL3hMx01MXnFJ9D3Fk/3NWjs
 q08R7IgNZbwBlBoSRmBEVr1KDJDy6W9QKz1JRsy8fq3Sf3SC2tTJUWA1jsYTZD6TbDf8rfyyo/K
 St3vF3JRWTXaNKJs92XdIqsU+sRgyXw5cListZNT7dgfhnJg7vOF2Ym6Qh8cUl5WFTK+FeDgrBK
 x/hBrlVQT31yxq2Uq5fFcjPwZ5Urqd0ZRUUrJjig+voXxamBBbG0izuWRwTqunTsi+SDjHM46xK
 2lXY6D/OM6tw8MjPfC5RPLgusO1QPXearFCCM/+VEuOa/Mg8y5AVdydTHGqoR/K+0fBFOXJE0pm
 G8dtGlBbXBmZB3v5a1YcYv6jzpgO1yAGSg6R/SoBh+LFKJVMdimptsXo0GA==
X-Received: by 2002:a0c:e005:0:b0:8b0:2fbd:8e28 with SMTP id
 6a1803df08f44-8b3fe77eaeemr42081666d6.5.1777562814917; 
 Thu, 30 Apr 2026 08:26:54 -0700 (PDT)
X-Received: by 2002:a0c:e005:0:b0:8b0:2fbd:8e28 with SMTP id
 6a1803df08f44-8b3fe77eaeemr42081176d6.5.1777562814358; 
 Thu, 30 Apr 2026 08:26:54 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3ff057fb7sm21033286d6.0.2026.04.30.08.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 08:26:53 -0700 (PDT)
Date: Thu, 30 Apr 2026 11:26:52 -0400
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
Message-ID: <afN0vAmIwRXnOz_Q@x1.local>
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20260428093339.2087081-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YltmXrpJYzDB_r3OeqbAfXv2wre0cGm0rg-pIIZzR1Q_1777562815
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
> 
> thanks
> -- PMM
> 
> CJ Chen (2):
>   hw/riscv: iommu-trap: remove .impl.unaligned = true
>   system/memory: assert on invalid MemoryRegionOps .unaligned combo
> 
> Peter Maydell (2):
>   hw/npcm7xx_fiu: Specify .impl for npcm7xx_fiu_flash_ops
>   hw/xtensa/mx_pic: Specify xtensa_mx_pic_ops .impl settings

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


