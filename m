Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp415050ejy;
        Tue, 21 Nov 2023 04:04:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRvJOhLc0TFNtHOQz7G4/e4UqMFneWpNGP8WBwlVwpdiHWp6/wSoJJrr7z03r6XSvIOzzW
X-Received: by 2002:a05:620a:838b:b0:77b:cbac:e3b3 with SMTP id pb11-20020a05620a838b00b0077bcbace3b3mr14100905qkn.55.1700568280807;
        Tue, 21 Nov 2023 04:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700568280; cv=none;
        d=google.com; s=arc-20160816;
        b=B7v5XNgwRhfMsu3fqfGydBwOxL+siRPNPmjk9Tyx2OWmGPIx/L2ummp3xV3QLXfjsR
         TyAQ/hPKYtMuQitesLMuN9J4ySKZWgRPosM9kB1gpcunt02B7zmkSG2EvJftcqoNwryD
         v1ckxVUKo2yl5pbiqXxAgKv05Z2KyTFUYTMocSohMLO1o3EQTcZ9SrJWxJYh/Zbi8xrI
         eSM7nwANaU9MpcaPOS2kV/saxTp2u8nOw5azSziJ6CZUZbZW+qM4BBcXyI6IB9+ownYz
         G25X6Zu5/ssub+3taKSt013vJobEkBUL0sTWvhFkJJAKxs7plq5rZ2Fmlmv9AjEZAYE6
         AQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=EMDUbmyJquT/91SijMkiXaSNWlm7KxQHHDbgxa+tLZk=;
        fh=A6d4BJTkcO4Tb4V34rr2mSX3341RstIj7VsNiQUca0w=;
        b=rWHsbFZ98TFhaZQPUoNY7S1rdK/KivOLGS3V6EOXGvCIKcn2EwBw3NAT20QwjceoeA
         M7hdqu+JLCP/MOZk+FQnb2jCUlMppPScTZ8eupWJi2dHV/Z7OePIBTgyDBDXFZ1EC6L9
         KSWAoMEk4LTRL4GpjkE2+zLuCbhCL5pCWcaAPHbaPrJsolwAhKyFp7SUyELH9Dfjhpkl
         z3IObM/GxqiY8neNBhvIwimMtzaI1xz9HjcgrZD95CC6Xl8gEzWA9LgvC7Au2qmoba0+
         FN8tterlqAV8OQOm0NpuTysBQr/GGxMxyy0P9XkLQlJ0aQhk80056YhRrjeA0lsmKrjo
         Gypg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2ARs5QE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo21-20020a05620a531500b00767156771d4si8751114qkn.513.2023.11.21.04.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 04:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2ARs5QE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5PUR-0006Hh-98; Tue, 21 Nov 2023 07:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5PUP-0006GC-Dm
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 07:04:25 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5PUN-0006x0-6P
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 07:04:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso3521786f8f.2
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700568261; x=1701173061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EMDUbmyJquT/91SijMkiXaSNWlm7KxQHHDbgxa+tLZk=;
 b=n2ARs5QEDhPo1JVmy62FRrP6H+52ga1wcjMxf3MunZ+joG8qfOOfWLbZlFoprP8Kga
 DQa+n80yvwniXv4gf70hjShNFATUag2kbrEo3j4jC0qEdl0SMC9iASXlCTHq5QXZ7So/
 rPd+CbBckLYbxNSJ/UotpCYHFJfaLNsAQ3DC+PjTgNwtRM1m6vFndoqfNMwfDgsMnxrP
 B5bfUU98TMPNqyQB2hrzYP0HkXJZMIF1cBXmgTFn5LXqByaErPZMP/VB9Xb90V1V0fe2
 oGmS66293ofzYzhOexOrFm3IrfkF/hat9NLZDrERpvlx6K9aJcsptfHHDmAGyZ5HokYd
 AYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700568261; x=1701173061;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EMDUbmyJquT/91SijMkiXaSNWlm7KxQHHDbgxa+tLZk=;
 b=QG7pXi3VDe11LMtuzTz30jnV4xwTlUoNlgChqcYZFGEVVhgHAu+Q/s3trKIRnIqyoZ
 NMaI66ySQOmmI44h6ag0OxnTlIVWVOuqN82a0MuSgp5gOsH0NYepK5sFjzDCtlA09iIG
 X6UPFxcuhauoY2I063585vY7B3fptb/VaWK9nK0hUQr9GLqvlsKP0T929upiuMJGfBV6
 4VBDbHq91ojs2k9xBwGieeALOtse3R921LF10wYmehvWh9DwpQxNr4FdsJZfFh3W77tE
 rGxuFHMGq3mlGMvqb4baXMZa1oehbdRKBmbrfo2kelwQKAnOcbXURxNc0WgR7H0weeE+
 sZHA==
X-Gm-Message-State: AOJu0Yy70dtXlTBNlZg5pViTxrKKveQizCsC+xHIhCGmv+2Nayiwh7ny
 9LaGjsAywa6/gZAS1iJuPuGuY3dtNHmg+5V+VEI72w==
X-Received: by 2002:a5d:5885:0:b0:32f:e1a2:526a with SMTP id
 n5-20020a5d5885000000b0032fe1a2526amr7063301wrf.67.1700568260809; 
 Tue, 21 Nov 2023 04:04:20 -0800 (PST)
Received: from meli.delivery (adsl-75.109.242.226.tellas.gr. [109.242.226.75])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a5d4bc5000000b00332c4055faesm7777977wrt.87.2023.11.21.04.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 04:04:20 -0800 (PST)
Date: Tue, 21 Nov 2023 14:03:15 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 01/25] memory: Have
 memory_region_init_ram_flags_nomigrate() return a boolean
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-2-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-2-philmd@linaro.org>
Message-ID: <4h2v6.z3bmxgpq3k0@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ayHRaG0EsOYv

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Following the example documented since commit e3fe3988d7 ("error:
>Document Error API usage rules"), have cpu_exec_realizefn()
>return a boolean indicating whether an error is set or not.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/exec/memory.h | 4 +++-
> system/memory.c       | 4 +++-
> 2 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/include/exec/memory.h b/include/exec/memory.h
>index 831f7c996d..f038a7e5cf 100644
>--- a/include/exec/memory.h
>+++ b/include/exec/memory.h
>@@ -1310,8 +1310,10 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
>  *
>  * Note that this function does not do anything to cause the data in the
>  * RAM memory region to be migrated; that is the responsibility of the caller.
>+ *
>+ * Return: true on success, else false setting @errp with error.
>  */
>-void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
>+bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
>                                             Object *owner,
>                                             const char *name,
>                                             uint64_t size,
>diff --git a/system/memory.c b/system/memory.c
>index 4d9cb0a7ff..313dbb2544 100644
>--- a/system/memory.c
>+++ b/system/memory.c
>@@ -1583,7 +1583,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
>     memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
> }
> 
>-void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
>+bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
>                                             Object *owner,
>                                             const char *name,
>                                             uint64_t size,
>@@ -1600,7 +1600,9 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
>         mr->size = int128_zero();
>         object_unparent(OBJECT(mr));
>         error_propagate(errp, err);
>+        return false;
>     }
>+    return true;
> }
> 
> void memory_region_init_resizeable_ram(MemoryRegion *mr,
>-- 
>2.41.0
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

