Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2219856lfb;
        Sat, 23 Jan 2021 23:22:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAUjZm/azIR4QWUypBLj5YH8I9mGs0dMhJEnQyaDASqXUIw9EBinCEEZgOIfQFkpRps6co
X-Received: by 2002:a25:abe3:: with SMTP id v90mr18447808ybi.438.1611472965436;
        Sat, 23 Jan 2021 23:22:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611472965; cv=none;
        d=google.com; s=arc-20160816;
        b=QZFssv/62ALWy9CiR38iwcpGxwFJCYkjPEhrJB/WV7hJ8+xpYMUzuXXeL+GN1Ug42F
         YG5s2vVSonkD6eXiRIBPi3IZSOS8cdq7zpL97FhmOOP04pwW0yfTThvG8R2Re5P6k11r
         ujsEkecFsd6IAQyF4oGVsAfmWRMp58HZR2DIAPM9VSsU1eckbv59inUfu+hWzVaixybJ
         hy6HvRd/JIOdr8GXVZt2pvr1oWVE9yzkma9qKLgBCC4TeK0SKIr8TuLT9rn9b+t9hsaM
         nxvmGLLNGRflnNJeMZqMWKM9Elifhuv1DbRXktz0p5klqdFLasYca0UplCvSMF2W6AVH
         aIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:message-id
         :mime-version:user-agent:dkim-signature:dkim-signature;
        bh=lI8dD8+1bkGGZGNoKlDpwVOrGSsg57zh4d6OBiSBlA4=;
        b=yTjJpTGMXIoZKJXFgux2a0JLN/onZ0TT7KrOYdIXKAffGVita4RZa6+FqVjAErFGFk
         Mu03berq2Hk+kMBhilLaBgip1CQJI0mthLiTpVsWGv4ZkEg1j5AWaKOpK6lecdWWPUGS
         2/9gaEMJbPVBf5ezWwW1deQVIpofKOQmbgyzH0yhMoyHsuJUEFcA/c0w0sg8B+QHl987
         TcfGUDtMzY2O6LjAKD/YOUNjK7P/wdUMV9d0TiMPlnsO8ctSqntE0OUFkB8crqaNw4n3
         U3S024+DrtxiCCHWoVRMBBs6XV2OV8YJDlyaXFfbkCeaziCYAzZ2kKenqrlc3kqZnTAW
         xg5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sent.com header.s=fm2 header.b=smUiuzAm;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=N6Ckan6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=sent.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si12598987ybb.300.2021.01.23.23.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 23:22:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sent.com header.s=fm2 header.b=smUiuzAm;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=N6Ckan6g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=sent.com
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3ZjQ-0002qG-SV
	for alex.bennee@linaro.org; Sun, 24 Jan 2021 02:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bertofurth@sent.com>)
 id 1l3WFs-0003Pf-KM
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 22:40:00 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bertofurth@sent.com>)
 id 1l3WFp-0001MF-JB
 for qemu-arm@nongnu.org; Sat, 23 Jan 2021 22:40:00 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F87B5C00AC
 for <qemu-arm@nongnu.org>; Sat, 23 Jan 2021 22:39:55 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Sat, 23 Jan 2021 22:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm2; bh=lI8dD8+1bkGGZGNoKlDpwVOrGSsg57zh4d6OBiSBlA4=; b=smUiuzAm
 /C9hOBuRoffTXC+ngAXqei5N1yFIRXHTVHqEComOD6vRL3NpS+KfnFWVYKGMNkA3
 jWl/IXQ8yFdhtwUHzw5UjqBrb+DFavOPv9pgLPWirZP6WFx9geWHK39V76hJK30r
 vJ37Z35+vc7Z6qxHD23Hx/0PX90KHX0+R0uwdMMxEpBn1JZG088yE4iV/2s5SQj4
 reAG8cdIPZijnoZOfJUKvbng1xfmIlqPwDNzLJLh6qWjvmzcA8u8afd/9HaxzUx0
 znnRBs06z1xRA/nFUAT0SWotkuI0IWC3lyBLRvIMUlZvfXJlqSHlj7QOlHFbxdTj
 uZ9klLQCclMN3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=lI8dD8+1bkGGZGNoKlDpwVOrGSsg5
 7zh4d6OBiSBlA4=; b=N6Ckan6gXb63EPouYKKabTpjw/TXYxs8j6xANx5pjceZ0
 fZshOS6cn1HoLC0T57Eyj4D5vu32OnMTxsQYI2RId6v7KL5kO12bdxtQ5GrOZSQR
 jEqj4nWtddZFMh6cO7vybn3gaquFUpQ3ohWbNd72UCvjQjWd7AOXK/old6ZN7PW+
 d1TB1qvCKL2EoRiCaEJsl8mlLJl0ZR20B8qpmLtHDDeytkoz2m7CI5G4L6TZZ8aZ
 lVeyH389S6s5kXnZw4HLEUSFjBes0MgmubTu/sIX9+Z6XTLonzmKFiVfPcHrTMqQ
 Af8DJezN58iQiOXusWVGjb/UVYzUivfimf2WjvMwQ==
X-ME-Sender: <xms:C-wMYDVGmqMg3HZG4jUVt0jtvg6UEzPjFYXm97FAZ3TtEqCXvwdmAA>
 <xme:C-wMYLmelTrKap4jUyaMv4g-l6WejAF6v6xyLylwwkF5rFbY53iJOFmpGKGLyacsw
 jlNJv7fOghEtkeSUCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
 ertdenucfhrhhomhepfdeuvghrthhoucfhuhhrthhhfdcuoegsvghrthhofhhurhhthhes
 shgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeigeffkefgieffleeivddtleejhf
 ehteegvdeffeeiffefjefghfejvdefudfhgfenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegsvghrthhofhhurhhthhesshgvnhhtrdgtohhm
X-ME-Proxy: <xmx:C-wMYPYiOxY-wDuxRkIEszqQx4WU168oe5N9UbUk_iXQMXDqGr6C7A>
 <xmx:C-wMYOVSQmzJJoO_QrUMQbkXF56EcFsERuXUDBfGgmRUNlvas5RHOw>
 <xmx:C-wMYNnNFuy31CZBlj9ZA1v1-tynx3rc17_1tZJ1xDEkf2ZTuUNGNA>
 <xmx:C-wMYJxid4U47kxS3cB1uEPN6vjYkYwktMxKFLig2nKa7woImT14oQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3FA8F130005D; Sat, 23 Jan 2021 22:39:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <994f40e1-2a5b-4b7a-a4aa-23f824881d8a@www.fastmail.com>
Date: Sun, 24 Jan 2021 14:39:02 +1100
From: "Berto Furth" <bertofurth@sent.com>
To: qemu-arm@nongnu.org
Subject: KVM guests reading/writing guest memory directly and accurately
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.29; envelope-from=bertofurth@sent.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 24 Jan 2021 02:22:19 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ybGQfS+spHBC

Hi qemu-arm,

Can anyone give me some advice on how a machine or device can read and write kvm guest ram memory and get a guaranteed up to date result? Can someone point me at an example in the latest QEMU source code? I'm working with an ARM-32 guest (-cpu host,aarch64=off) running on an ARM-64 host (Cortex A72 - Raspberry Pi4b). 

I have a problem where if I write directly to my guest RAM, (such as a DMA transfer) then the guest can't see the change straight away. Similarly when the host writes memory, the guest doesn't see the change until much later.

If during a KVM_EXIT_MMIO the qemu host changes some values in guest ram memory (via address_space_write() or cpu_physical_memory_rw() etc...) , is there a way to make the guest be able to accurately read that memory as soon as the exit is complete. Additionally if a guest changes a value in ram just before a KVM_EXIT_MMIO, is there a way to ensure that the QEMU host can then read the up to date newly set values?

Is there a function I can call to get any memory caches sitting in between the QEMU host program and the guest to be flushed? 

Should a region of guest ram be set up any differently than calling the normal functions like memory_region_init_ram() and memory_region_add_subregion() to facilitate this? I see that there are some memory initialization functions that deal with logging dirty memory but from what I can see they're only used by VGA displays and for VM migration.

I understand that the proper thing to do is to set up the memory region in question as MMIO so that when the guest accesses this memory a KVM_EXIT_MMIO will occur but the memory region in question has to be executable and MMIO memory areas are not executable in QEMU. In addition it's not easily possible to predict before hand exactly what memory addresses are going to be involved in DMA, so I'd prefer to avoid having to dynamically construct little MMIO memory islands inside the main guest ram space as the guest runs.

I'm assuming that the guest could be modified to disable d-caching (modify the ARM register SCTLR / p15 ?) and that may help but I'm desperately trying to avoid that if possible because I'm working with a proprietary "blob" on the guest that I don't have all the source code for. 

I know it's not very professional of me to make an emotional plea, but I've been working on this for weeks and I am desperately hoping someone can point to a solution for me. I am not a KVM expert and so I'm hoping I'm just missing something simple and obvious that one of you can quickly point out for me. If I have missed something obvious then I'm more than open to taking your abuse, mockery, insults and derision in exchange for some guidance!!

Thanks so much for your help!
