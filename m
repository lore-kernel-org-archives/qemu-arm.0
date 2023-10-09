Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1806050ejb;
        Mon, 9 Oct 2023 00:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWK3fOk1Ubz0eO9o6QSqcPZB2ZGWRXcu9tCh6BTXU8P5NMij4rHA1sWjjN15hgwlBuRFxe
X-Received: by 2002:ac8:5905:0:b0:410:8bfd:1696 with SMTP id 5-20020ac85905000000b004108bfd1696mr16592831qty.49.1696837495997;
        Mon, 09 Oct 2023 00:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696837495; cv=none;
        d=google.com; s=arc-20160816;
        b=LJP1fUwC9ww6gawQurSeTUudBS7WY3h6mgrXR17SZ4XE8dteGlOKsJOvS+9ZAlbFMZ
         SYwhvfIYHS4yMBUFZIlBKRsKJV0h08n/M3lr1jUzUKJkOEfJeOLfjry1TCcp5uSTQgzE
         nMKhPFHVjU0fcdQUwm1SzoUxFHeNPmIQ5n4AAvn4h+56pw+Ffhyob71LRQxlTpQku4IT
         yVn3jaZRFBw0R1VotGCMziSiPHeKHq0hq0aBilICK15UD9DIF2fMzCM2026QmzsaQboB
         Z4zhdMapZA106M2F8YHfUAZ0jsJ3cjgRO/uO+mjt0VFS/gHr7mkXFgv7s/dz/BXGdUp7
         yxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=P2twXwE4VFcpf1LjW0cdZu7HpEYkQOkBrrLfPXtrlNw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Ud3PmLMUSysT96BdR6wXRLyPdaYm5U7kvV/MDCfAWJeq87cOq2lBGf5JdJDaJQetLT
         myT9RwrUBIlJuRxSKKsagBeQyJZo6DC6Etn0KTIaB4z194pGLkziMaGg+uaVwPGSl6Ar
         l73M7YYIsT4DxJfg3KtN2cgYTFKOC/OZBH448Ok09y20OarrwNI4gOYxPzh0vkl3ZIDB
         o7b6Qu6v2fC2wOmxGsHAP+ur/A90BpfVxWCBAass4rPhxTk4PQnJDbCFiKeuFNbbJyg7
         ApMmXGSr4jZYPVAZplj4E8WEQ7eHka0t5RDCm7rAspP2JUIFHgG8uTGHY1mk36Sl0Bov
         ah+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5YJuP9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u41-20020a05622a19a900b00419537da80bsi5784835qtc.117.2023.10.09.00.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 00:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=M5YJuP9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpkwX-00063N-CJ; Mon, 09 Oct 2023 03:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1qpkwT-00060G-EK; Mon, 09 Oct 2023 03:44:41 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <janne.karhunen@gmail.com>)
 id 1qpkwR-0007od-Lm; Mon, 09 Oct 2023 03:44:41 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c00df105f8so52864341fa.2; 
 Mon, 09 Oct 2023 00:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696837476; x=1697442276; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P2twXwE4VFcpf1LjW0cdZu7HpEYkQOkBrrLfPXtrlNw=;
 b=M5YJuP9h1R4Us0zcx6GUR0654COMzev4XE/1RPj5aCHXNRHrR3KatlpqA42DFB/z81
 F87xAA+x6xVh/Wj8Bthl/I2V9ZV/ickVk4fPGhjVveeuf+Fc6AJoXNl8ykT/CGv/i/IF
 nnuiabAFUCmftW7IZ2O/pS6ssr/PmlsebOWClTxIIjyIg2S3LeqJYSh7rRs1qSgTsv7t
 CQ7hscqEA4ZOomicYNfbsOdWLadd97blrZJY9n84+vKb+eImrgRMe8a8gWlZZyK54jTD
 fXKK2hG/qFtufG/bDpFrI4v3PJJKRzTsCU2D/Z9Lz2YFD1uxF2xaKvh3JZSFKFdnCW+/
 y/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696837476; x=1697442276;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P2twXwE4VFcpf1LjW0cdZu7HpEYkQOkBrrLfPXtrlNw=;
 b=etU/v0t0ZQCrBmri3wzGn8ScNFTzmgVw/HEZdClK/ovimbfxSkzoNsYuOIDo7JyxST
 hWiHnqXU4nQSAX8EyXxHLk7SLdFJAau62Dn43XF0Sqs+1dPP9QhDMHNBMrlzl3oMv8LF
 wkQTiqFx8aYL0pYL/jwWEExa+L/I5jZCQaDJew6pe7uG4s7uEKyzStQDHFnPJMcv568i
 3jX1Xj5s1P0WFUS+SYs2qvJickeVidTdLMgF2O55ih2ZD4q+jTqnqFmIisJJ0NWHXe3T
 gNUc5g366maCkotmt9oLoHBnpQ3UJssvAaQjLr81ReqsO8Pl7/J1r4KPuEwOHWUzwE1P
 lLkA==
X-Gm-Message-State: AOJu0YzHMO+n7GdP8jOxaVOTs8JnHG45dn/esoLika1+FzZ9V/MEUWpY
 8kQ2jz5NClFqhM7PI3oK/YseF4sjff4tPo+lnRi3vE+ywFo=
X-Received: by 2002:a05:6512:32cd:b0:4fa:f96c:745f with SMTP id
 f13-20020a05651232cd00b004faf96c745fmr14167478lfg.38.1696837475966; Mon, 09
 Oct 2023 00:44:35 -0700 (PDT)
MIME-Version: 1.0
From: Janne Karhunen <janne.karhunen@gmail.com>
Date: Mon, 9 Oct 2023 10:43:07 +0300
Message-ID: <CAE=NcrYLpeemYwiT+460n41SKkNpBPXrnrZ92ti3Q3mo3p5jOA@mail.gmail.com>
Subject: virtio via external shared ram
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=janne.karhunen@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: PlQ5xNsnLygi

Hi,

I have created an experimental setup for Linux where all the virtio
data structures and traffic can be allocated by the guest from a ram
blob outside of the guest default ram space. That ram blob can be
hotplugged to the guest or defined via the guests device tree.This is
done as some hypervisors, including tdx/sev/pkvm and others, would
probably benefit from a simple security policy that removes all
set_memory_{encrypted,decrypted} calls to open up the guest dma memory
in fragments that are not only likely to leak information due to the
widespread use of the DMA API but also slow things down for no obvious
reason. From the hypervisors point of view the fragmented shadow page
table space is also an unnecessary slowdown and a source of memory
waste.

I have seen forks of SWIOTLB that do similar things, but fundamentally
they are still SWIOTLB behind the curtains and as such unusable for
low latency / high bandwidth applications due to bouncing (copying)
data back and forth into those external buffers. The setup I have
created can act as virtio as it was designed to be, a zero copy data
transport path.

A trial integration into QEMU could probably look something like this
(in virt.c):

..
    emem_map = mmap(NULL, EMEM_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED
| MAP_SYNC, fd, 0);
    memory_region_init_ram_ptr(sr, OBJECT(machine), "ext-mem",
EMEM_SIZE, emem_map);
..
    emem = g_new(MemoryRegion, 1);
    memory_region_add_subregion_overlap(sysmem, emem_physaddr, emem, 1000);
..

So the question I have is that did I understand the qemu RAM model
correctly and would something like that lead to known issues
somewhere?


--
Janne
