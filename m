Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1015312njc;
        Thu, 20 Mar 2025 08:08:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8HVmGRzuVcpvwqL11S/YQqe+cqvOTwHVP+E8hLMIjLYQN0dCBYlSyL1QpIMSRpvsSX2lN7X727rYLPw==@linaro.org
X-Google-Smtp-Source: AGHT+IG9iH+tG6NBsZPxmvlwoMN1zHMrjx5Dm/9/6WC7dbvAxVUB793mmCNarEjPQgHxLg5ssSRP
X-Received: by 2002:a05:6102:c8c:b0:4ba:99b5:60f5 with SMTP id ada2fe7eead31-4c4ec84caf3mr6223780137.23.1742483320540;
        Thu, 20 Mar 2025 08:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742483320; cv=none;
        d=google.com; s=arc-20240605;
        b=O/XDpeiB1MwbOWENgMMjxtEa3e7A5I5+xS4Afk5mnOcT65DrK+6SNe3j6mdzn8Yucc
         Q9SVLIvDXD6hDu9ML1yjK6lSAzHu75JUSixgI3vTDj0Sa2po7KYts/dyYuyC7X9ZHnKP
         LyDal9uz7mW8DqvCAKO2hyA+Kg7fLONHkn3gdPWy7g1FKFz9t/gLnZMilCl2YfjEq1Up
         ooZF07uxph/OXoo8CiXlYR177Os1IaYeRFWyD/WPHedIN9m7KYeZRdSD9H52xAIw+hE6
         K0+2xcbV2GhRX7LqvJnzFTb6/cXmb1SDDS8ZygmebnfFqOMxBPhPiSN1LLX4fdsxpM8Q
         qkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=c9yns0kqa2xJIDUDylPCBI0tJ3zxQmuR2h0E8zR4HjU=;
        fh=nDFlYaei8P8t+7kUhsWaqA5H1A9WTaVnQjIgJeoFoxA=;
        b=YNAoQ6s2lI0YR6xU4r7RgNDzicgSDp4Q1IGqReZdzu/jIrVdli9aF9t9qoqxrYD4dO
         8YkPGdZbChZZCkW61SinQTu85ufQyhw4J8sagKDcxsDQNZkcv+VQ3DiZDfIB4dWaTSng
         ZjeGjRafSY8JBeptOxIfYqQ2jAvG7vJrtcwI6siLonj8Y2kgrmaSyCOvVl8Je0HPHJPX
         DTMSHNbi8YEpngpHCoC7U3DzZobBEri279OpufsuITzuFuQNrAW8IY9jnIijfxcVvYcQ
         fjnJcmWdo6CFSSbUPqhHIQlbncPezOsYhHYbTU5xtsVLz7I7NB09jbaeVLn/Oc3XAiJ9
         8gzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mDR0kjf5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c50bffd5b5si12797137.361.2025.03.20.08.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 08:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=mDR0kjf5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvHVP-0007M1-3N; Thu, 20 Mar 2025 11:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1tvHVI-0007LM-K4; Thu, 20 Mar 2025 11:08:16 -0400
Received: from mgamail.intel.com ([198.175.65.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1tvHVA-0003xy-FO; Thu, 20 Mar 2025 11:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742483288; x=1774019288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RWPlgBik2uYXJARadCDUkKWja/DJTcipTYX3tVIVQM4=;
 b=mDR0kjf5RBQ5P9cKNIOnuCxS45Sow9Y+LkHnLPCoHqmuN0N3Kbd3LELp
 jQIsv7pbzaTQzm0w0SMg1FUqGAsa64Y/KE9rvwsjj/Q5ZQEA1fM2iGKF0
 QKT7rrjvfGMbXfC8Jf8OVAoHBDHo0rxrSZ+T9w1Brl+Y1DmvV2QmZx7R1
 XIGBtmEKDAM7+ExZVXilBB2W7njL8/5UAt/MCUtYfCVBg3FFplu4oX6P0
 psv95UIadbu8OCChBHjldvIWnuB3TgYI0S/mSHONgkBfyQuqsNq4Vh7Gv
 MsBVkpfl6cy1eKvigxlujUeubDoiX1AALE2lCdpj3tmXMV2CWOjrLtw4B w==;
X-CSE-ConnectionGUID: CsLbEAMsSiylkef+70N7Rg==
X-CSE-MsgGUID: Qoq0w0GqRpyzrkQoi+eH8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43890289"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43890289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 08:08:04 -0700
X-CSE-ConnectionGUID: 4DQ3dTgDTOWTrphrA9QZbg==
X-CSE-MsgGUID: pLWUzIZIS2O4yY+KdxxxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128180140"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa004.jf.intel.com with ESMTP; 20 Mar 2025 08:08:02 -0700
Date: Thu, 20 Mar 2025 23:28:16 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/3] hw/char/pl011: Pad PL011State struct to same size as
 Rust impl
Message-ID: <Z9w0EIgD6A3oBL33@intel.com>
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
 <20250320133248.1679485-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320133248.1679485-3-peter.maydell@linaro.org>
Received-SPF: pass client-ip=198.175.65.18; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mvf0coZRghOp

On Thu, Mar 20, 2025 at 01:32:47PM +0000, Peter Maydell wrote:
> Date: Thu, 20 Mar 2025 13:32:47 +0000
> From: Peter Maydell <peter.maydell@linaro.org>
> Subject: [PATCH 2/3] hw/char/pl011: Pad PL011State struct to same size as
>  Rust impl
> X-Mailer: git-send-email 2.43.0
> 
> We have some users of the PL011 struct which embed it directly into
> their own state structs. This means that the Rust version of the
> device must have a state struct that is the same size or smaller
> than the C struct.
> 
> In commit 9b642097d6b7 ("rust: pl011: switch to safe chardev operation")
> the Rust PL011 state struct changed from having a bindings::CharBackend
> to a chardev::CharBackend, which made it grow larger than the C
> version. This results in an assertion at startup when QEMU was
> built with Rust enabled:
> 
>  $ qemu-system-arm -M raspi2b -display none
>  ERROR:../../qom/object.c:562:object_initialize_with_type: assertion
>  failed: (size >= type->instance_size)
> 
> The long-term better approach to this problem would be to move
> our C device code patterns away from "embed a struct" and (back)
> to "have a pointer to the device", so we can make the C PL011State
> struct a private implementation detail rather than exposed to
> its users.
> 
> For the short term, add a padding field at the end of the C struct
> so it's big enough that the Rust state struct can fit.
> 
> Fixes: 9b642097d6b7 ("rust: pl011: switch to safe chardev operation")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/char/pl011.h | 5 +++++
>  1 file changed, 5 insertions(+)

LGTM, BqlRefCell<> has extra fields to make BqlRefCell<T> bigger than T,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

