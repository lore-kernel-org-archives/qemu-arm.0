Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1952577njc;
        Mon, 4 Nov 2024 00:10:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaU1W1l8HGLHYrVuSpKdqxw0+QwjAWRVm1WZiqLaT44sskaxyz/3VeXd5fqo/1tPpEiqi4uG47OzQEoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFVu4AmZJjtzuF8e9htBTbc2E2TDBzSni6wa9hk/s2A2BKrxkadmuZ8criywizGXMT1JQhu
X-Received: by 2002:a05:6122:90e:b0:50d:40bb:ae14 with SMTP id 71dfb90a1353d-5106b1a5dbfmr13246606e0c.9.1730707852728;
        Mon, 04 Nov 2024 00:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730707852; cv=none;
        d=google.com; s=arc-20240605;
        b=Mhv6/8Mh2GhbuVbnFVDw8hLyhiOHTT28Y4EuUEr7RGO/u7WdLhGbY1GtQ089glRoRl
         0MWEdc97PsnUDPx8q1JFlEyIdYR2B8LxSleQqpq0KtaZ5DvyjFsoAs3KtC44QxDJR5is
         RnNaqfBC+bBlA6ThDqzoOrXir577Ken+DqXahbdNHFIXYMO4k4WOSVoyhgJCZLrIWLx3
         GWCmNA3493yJvLpAvixRoxnnreru4KbkB6VpPC0qy8HTSt8ep5HLkqs4anKU248FKfoy
         V6WTEqfgbx29QZBT609gBRuoGkmYNhrkPDxvYY40ZBdUZLQkxsflDUDDpSR15NRzW3qe
         X9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hsvFWEW0xJGriJ1D6kxyQEeUqlfhMgoHBy+8WIhB1OE=;
        fh=4dpUTdtEZD0KF0CiBhogXc6ZW5xLRVU2ExSddqgFbh8=;
        b=HSm2NrmGa7msX6pyzTyjN+Rz/g6CN6x84N06A9TOjsAJcAxywqxtE+bbdrm88yPkQB
         rLC9gzJTGC+FCTCK7a0+Vvy+trkmfuQzCetHCBJkcMPSEbl8ibxAM1xHT/kAs6bQG/sN
         /hp8llegCVBvm5+IduK9GjLY3N6uoAFmFpF1OKPF+iUjEMmEjqTUHYWkcE/I42OOXyE6
         zNaWa9bYoi8z0AF1/d6VEsTkkjhCclMC5akUmr16/EA4kWFj/TaLGKb442KJzWvA0SXw
         waBDYxLzuZZyIH/N3d90/NrD2wZVrAHJ3Oj7XN41DBm8vb7D8CDbYEbIXp9hcbGlIx/e
         TLsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vw7mVoBy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f1f89si1020501285a.74.2024.11.04.00.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 00:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vw7mVoBy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7sAW-0000hk-Kr; Mon, 04 Nov 2024 03:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t7sAT-0000d3-3g
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 03:10:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t7sAR-0002VT-26
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 03:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730707830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hsvFWEW0xJGriJ1D6kxyQEeUqlfhMgoHBy+8WIhB1OE=;
 b=Vw7mVoBycAJR4D7T818Tg7v9vYS+3NUa67hKEfj+yi2hGJ7xtliQpnmuJ6Vi+nPnz1m1l2
 GStxbg4oo1T0JeRJgmrdBMW9Bw2VyG46bp8jRBETNwshC3aNjr8cBZ45ARRatfX4/QUxKb
 n2MBmcNscfMcQy381uvAznwUHA9AB90=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-fikFks9EM_qX-DKeeLXrQA-1; Mon, 04 Nov 2024 03:10:27 -0500
X-MC-Unique: fikFks9EM_qX-DKeeLXrQA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-539e13b8143so3942974e87.0
 for <qemu-devel@nongnu.org>; Mon, 04 Nov 2024 00:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730707826; x=1731312626;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hsvFWEW0xJGriJ1D6kxyQEeUqlfhMgoHBy+8WIhB1OE=;
 b=EXaCBWSJ2fMtJcUY5eUkTgTPL6hWDBAybapaHgAQJjPFUNcsLCmgnw7gCgHM/KmX9p
 1FHqSCbGevuEPlo8KxGxUynn+WrdbarZVzFzuNal9T/BGJ2/0X8FkYRvuJ+ZzdjEcRe5
 IrZwK7aQvIVBZpmfORSRHDuOISWAMSnaihhO0/uA6cQvojXPZl03HIsVWxSyrIXyHjrT
 cbBxwWR8+Yssb52gHOnzKlZwYUNsCNMsj5OS65pB7PFDpNPZw1dMmKXAxozpv0kCw/Ni
 ORGHmuCd9RIzZrljbqP5gOb5cV8NWFZgxO+K0ILkCJMSolzD5a4YLhszBScQz6KVq8To
 3tUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZUDafmbJWidCIWzEW3VCxhjx3uXGlVUS05ixfe7UazWk+xrB/VTWFVgu6NMi6SUBXc3nZx5zjMUWW@nongnu.org
X-Gm-Message-State: AOJu0YyYFWxKMPe9uA2h1S5nIjayqKjo1BUP9KfMyoM0xqH40CobzgiA
 8xvvdzyOxIrIBwOqneYg909yFSuN61ysRoC2TbBZpKjZ92KNfh/ozmKs2y0yJTtcWy+D4JxCVAp
 00LDxQrC2DaogvbXNrhIBl9P2637iv5PYDVGDnvlMUBdaO1fzNZAS
X-Received: by 2002:a05:6512:3d11:b0:539:530e:9de5 with SMTP id
 2adb3069b0e04-53c79ea55c2mr6851560e87.56.1730707825970; 
 Mon, 04 Nov 2024 00:10:25 -0800 (PST)
X-Received: by 2002:a05:6512:3d11:b0:539:530e:9de5 with SMTP id
 2adb3069b0e04-53c79ea55c2mr6851543e87.56.1730707825482; 
 Mon, 04 Nov 2024 00:10:25 -0800 (PST)
Received: from [10.33.192.239] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca6f8sm175297375e9.39.2024.11.04.00.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 00:10:24 -0800 (PST)
Message-ID: <3db226a5-ade3-4ddb-a599-131805ac8f04@redhat.com>
Date: Mon, 4 Nov 2024 09:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix EL3 AArch32 MMU index usage (again)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241101142845.1712482-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241101142845.1712482-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x4dNyzdnwBvt

On 01/11/2024 15.28, Peter Maydell wrote:
> In commit 4c2c0474693229 I tried to fix a problem with our
> usage of MMU indexes when EL3 is AArch32. The problem we're
> trying to fix is:
> 
>      Architecturally, when EL3 is AArch32, all Secure code runs under the
>      Secure PL1&0 translation regime:
>       * code at EL3, which might be Mon, or SVC, or any of the
>         other privileged modes (PL1)
>       * code at EL0 (Secure PL0)
>      
>      This is different from when EL3 is AArch64, in which case EL3 is its
>      own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
>      have their own regime.
>      
>      We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
>      do anything special about Secure PL0, which meant it used the same
>      ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
>      where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
>      controlling register when in Secure PL0, which meant we were
>      spuriously generating alignment faults because we were looking at the
>      wrong SCTLR control bits.
>      
>      The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
>      we wouldn't honour the PAN bit for Secure PL1, because there's no
>      equivalent _PAN mmu index for it.
> 
> The "spurious alignment faults" part is
> https://gitlab.com/qemu-project/qemu/-/issues/2326
> 
> Commit 4c2c047469322 tried to fix this using what I described in the
> commit message as a "more complicated approach", but didn't get it
> right in several ways. Full detail in the commit message of patch 1,
> but the major visible problem was that regime_el() would return 1
> even when the CPU was in Monitor mode; this meant that page table
> walks in Monitor mode would look at the wrong SCTLR, TCR, etc and
> would generally fault when they should not.
> 
> Rather than trying to fix up the multiple problems with the complicated
> approach, this series first reverts that commit and then fixes the
> initial problem with the idea that commit 4c2c047469322 describes
> as "the most straightforward" approach: we add new MMU indexes
> EL30_0 and EL30_3_PAN, and use the EL3 index as EL30_3. These then
> correspond to "Secure PL1&0 at PL0", "Secure PL1&0 at PL1", and
> "Secure PL1&0 at PL1 with PAN", and parallel the NonSecure use
> of EL10_0, EL10_1_PAN and EL10_1.

I can confirm that this fixes the problems with the bpim2u and orangepi 
Ubuntu/Armbian tests, so if that counts:

Tested-by: Thomas Huth <thuth@redhat.com>

