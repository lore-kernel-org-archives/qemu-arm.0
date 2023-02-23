Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp921881ejc;
        Thu, 23 Feb 2023 09:09:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+FC/qDai0CKhT++9Amm5d7NI7ylE9cXWXZa3EDXW7kcfW9/O06/bgb0VcQ2olJg9GYlsqw
X-Received: by 2002:a05:6214:e61:b0:53c:5e57:cd02 with SMTP id jz1-20020a0562140e6100b0053c5e57cd02mr18022153qvb.38.1677172158639;
        Thu, 23 Feb 2023 09:09:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677172158; cv=none;
        d=google.com; s=arc-20160816;
        b=scZ3UQi65q5xETVMcM2Jw54bObLf0ou5D9jU9ZrRqlGmMDpbvjE4t1KiIEFZgj2jpV
         SN+WoJMreyJksYf2UbUw/jQYd+8F85rV6ltTmTDHjU1+82L1MHBDGtPG4/cnFoxqCfS0
         fyy/ChhPYl/K+Z13/v5bVAn4D1nb9gaq46nZ/m0HQupGP1J22Zozj5o9xVFAxaSe/oFy
         Bu0ZdFY+InYOzkydOls3UZY9M/k5zdNO16hilrC27OEHdXGJLQW1S6JAfUH9aH99vDfO
         8KEhPvbkwy+arz3X5J+ra7V7qSXhNghbiKQhbnmWlPJxELE498sQvsOluPMWG6eMXJ46
         IbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bn+qZpML6lrMrK0gjKDL5LctfTdthgr58F7D7OqYxuY=;
        b=ia9sXtCUa5hkZBnb+X0bAPYRpRyteKbusdxYyDh8u+CJFbhW48j5Dq8ssGP3cLsJpK
         A4veDP4QjaD5bGtJDYaBkROio3rFt0KU5g/4FKmrvWWN3jGAoEy5c+a9sQ2IhSufWVWA
         8ARzKBJLohMtah9F77iFufEhZsGNNo0brNEuxOuzgNpfTTb0hxtJrnPu/MMDjrUvmaMb
         gIza+TJD2TNwH2Yqad28hwRlWCkN0uL91c3s493ybo2pXoJapZCHUjU4L3zLzzh/GCD5
         O9VSyprqzHTpgaUEe8WSoh6OphqmMHeKxN1E9w5M/hEix9ybBITlPf7/87pLRV3cqxLo
         ilVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZU1kSth8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do32-20020a05620a2b2000b0072d8141fc88si5482262qkb.581.2023.02.23.09.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 09:09:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZU1kSth8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVF5f-0007sD-CS; Thu, 23 Feb 2023 12:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVF5Z-0007qx-Tr
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:09:02 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVF5W-0003BS-Ja
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:09:01 -0500
Received: by mail-pl1-x630.google.com with SMTP id h14so13890389plf.10
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 09:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bn+qZpML6lrMrK0gjKDL5LctfTdthgr58F7D7OqYxuY=;
 b=ZU1kSth8XzPQo5tjEN5OS/y2ugB5Ff0f6LocH8zbrj57HXcVJEWG33oJAkK67Gb5op
 OC1eeRILxwPW35MEAZUi+Z433DXHOi0sfHYp9VMau7o16Sf/V1ohRWDVSI3bbgAOGvTw
 K11POCYXXE5wOl6PepT/k9+u+k2ZFUN8QqlJG+jcHACXNxJspU/rw5LLfKuKGC2VCXiu
 ZLCVtYAtCiwe77jrCbqm7PxSRxOZAKtbuWZX6UCvnj8Ju2L+9lo1LRwng5ejCkKeiyjt
 MDL1xOmB5o/X0K42sntE+q79uBhipBHBHiO7PnHPXe9UVPXaiOBBA1jKQg+tNifCoX//
 lSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bn+qZpML6lrMrK0gjKDL5LctfTdthgr58F7D7OqYxuY=;
 b=i7krbFuu5y6UIOkUDQdcLCBhrUn50140A6Mg57fF58vle9Wn+EmW5Hyqkz/ZOnBnSO
 UTLx1gvtTrWaZXeR/i46ZW/qkPGCXUpQc13DDrBwSLSWLyBJk6JeLkR0K3QInI6a2vDw
 5gqJTIyzZkxm7/yCN0grCFAPF8BVFGwi0YXnEtAi9mcTur0A1k0d/7bNKo4TpXdaeZIx
 hDM0NXIykBpw/Ouj33QRKmfweTzEDtkGIxe5HgknNURaJLyMHYdg5DPMTm2LsCmR+KN7
 +H9l3FYGDV3VW5JO75h8Yg492WOmELbn0vmd/M5RyetLnxu4ymbw3b1qs+QSwgeUsyYz
 hYjw==
X-Gm-Message-State: AO0yUKUJpqrQTlNdIou2Cum1Akn6abyM0xQvO37l0+kTq5jYZmG2Vmh8
 MY4oaWS0A2PQjGkWSJZ/FsxzpfGaATPnCEZi1VK6mw==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1303974pjb.137.1677172134328; Thu, 23
 Feb 2023 09:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
 <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
 <8e759fa2-674f-184c-1ddc-35638a18bda5@linaro.org>
 <CAFEAcA-6vYGvnxE9ZiQ_WYoD8jg1kiQCvj4A-DjncW=TUiM8Vw@mail.gmail.com>
In-Reply-To: <CAFEAcA-6vYGvnxE9ZiQ_WYoD8jg1kiQCvj4A-DjncW=TUiM8Vw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:08:43 +0000
Message-ID: <CAFEAcA87_M1+mcMWuu8ugjg78FBLCrw53uYH=Zo-n_ih-bkWvQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: rEPdtv05eVUJ

On Thu, 23 Feb 2023 at 16:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> The current state of affairs is arguably broken, because it
> means you can't migrate a guest from a BE host to an LE host,
> because the migration stream contains host-endian-dependent
> data.

...thinking it through, this isn't right. The current code
has cpu_exclusive_high always be the 64-bit word from
the higher of the two addresses. The change proposes
making it be the high part of the guest 128-bit value
(which is different if the guest is in BE mode).
Neither of those definitions depend on the host endianness:
they're just different and we would have to figure out
how to convert between them on migration.

-- PMM
