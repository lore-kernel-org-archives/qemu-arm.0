Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1980977lfk;
        Mon, 24 Jan 2022 08:51:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVZgcB7fmjS8sVNzQ5SRjc2Et3WrhkVEKP6S1sN/RKsWIAWuky2hYGMr2mCdfr/5GUGZzw
X-Received: by 2002:a25:1906:: with SMTP id 6mr23969650ybz.754.1643043111808;
        Mon, 24 Jan 2022 08:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643043111; cv=none;
        d=google.com; s=arc-20160816;
        b=uyuXPZk0JcNdfwOHL2759900yTfZbP10FJr99hDj0KMEZj3xs9f0yvYJXgLzMGZAqQ
         JosnuZNyYXCTVG0FRJUHTErsp2JCbFzqi5LPtf9xQaRgv30bCb9THTnSkxuuoVA/xSUy
         WF6/sPPNZWC7zrENL6AXZ29xRVhK99ZZCYBJYRyewdcu/DqmGIN1EgJauxsQKoLzDpIT
         Ebh8wC7T4QoH7io7FhMV+nKgbo3by8EtwpnPoJiC3MZ8ygSwYArHbFLftbE2sEucTShP
         Wp9rFsg+zbM5LzGm5RbXIbXxj5jzkUdRekoth2wqAthRBSxcwW25OTrR6Z6CmWCnV/Ld
         Lmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=t0ZPIxteoUPMB57KEi0W5HzQ2U1AzrKwoFCarKOZnI0=;
        b=AcAd/oVt+QDDo1NV6r1AaYercvzYuqE8GbVR77ydJGgI9yJG+P595oIFHK2LfqJmMo
         EMaR2SyZTBs8H4cfJL/ggCARxhCrwwHMiOSVj3+A9IvOZMm5E3JBPDiuM3KaZJJrVAtM
         JF53SCO9a/WQvqUUXDAkN+Cpp5oo0OwvNl7QQK1qTfKzAwJQNIFQOpi/3JzfkHcR7XBn
         RqFQ6bFbwZ1erpeeV3ZzKW5Jqe8vjjpRC5mTi9PsKtWZxkdctoPCsJTRvUTfkwKAtSkJ
         FVKQrAjTQjvWVPElbWyBP31oHW5lNOGpcSzB02KdTBoOrc2URlu9/p7AzbvVMEJSkTK/
         7iKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 204si16296253ybs.801.2022.01.24.08.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jan 2022 08:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1]:56086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nC2ZL-0000vg-8U
	for alex.bennee@linaro.org; Mon, 24 Jan 2022 11:51:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1nC2Z0-0000ta-AS; Mon, 24 Jan 2022 11:51:30 -0500
Received: from relay68.bu.edu ([128.197.228.73]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1nC2Yy-0003rZ-9W; Mon, 24 Jan 2022 11:51:29 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 20OGoAkS020784
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 24 Jan 2022 11:50:13 -0500
Date: Mon, 24 Jan 2022 11:50:10 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v3 0/3] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <20220124165010.jn3lrwk64i56u7cd@mozz.bu.edu>
References: <20211215182421.418374-1-philmd@redhat.com>
 <Ye7UKJTY0D2rbJN2@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ye7UKJTY0D2rbJN2@stefanha-x1.localdomain>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.56, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1s2l2WhQC5R

On 220124 1630, Stefan Hajnoczi wrote:
> On Wed, Dec 15, 2021 at 07:24:18PM +0100, Philippe Mathieu-Daudé wrote:
> > This series aim to kill a recent class of bug, the infamous
> > "DMA reentrancy" issues found by Alexander while fuzzing.
> 
> I took a look at how to protect DMA transactions in VIRTIO devices. It
> will require setting the MemTxAttrs for address_space_ld/st_le/be_cached
> calls. Errors on write (store) can be ignored. Errors on read (load) are
> a bit more questionable since the device performs some operation based
> on the loaded value, but at this point the driver has already caused the
> device to do something no correct driver does (as of today, it could
> change in the future...) so undefined device behavior might be okay.
> 
> It would be easier to be confident if there was a single place to
> disable DMA re-entrancy for a device. The currently proposed API
> requires per-device code audits and fixes. It leaves decisions to the
> developer of each device. This will be a lot of work to fix and we
> cannot be confident that everything has been covered since this is an
> opt-in mechanism.
> 
> For these reasons it seems likely that DMA re-entrancy issues will
> continue to creep in. I think the only way to rule out this class of
> bugs is to implement a centralized change that doesn't involve fixing
> every DMA access in QEMU.
> 
> Thoughts?

Hi Stefan,
Do you have some ideas about how to do this centrally?
There were at least two attempts to do this in a centralized way, but it
seems there is some worry that edge cases will break. However, I'm
not sure there were any concrete examples of such breakages.

[1] https://lore.kernel.org/all/20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org/
[2] https://lore.kernel.org/all/20211217030858.834822-1-alxndr@bu.edu/
(AFAIK Neither handles the BH->DMA->MMIO case, at the moment)

-Alex

> 
> Stefan


