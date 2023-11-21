Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp419946ejy;
        Tue, 21 Nov 2023 04:12:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELwnxzdjY+1Pmjb+OiuXH6qznVSBN0ciKKUQapLkIXRKB2QYMpQvg+Eq4cOLnpo/3Ipxy/
X-Received: by 2002:ac8:584b:0:b0:412:2dac:acb9 with SMTP id h11-20020ac8584b000000b004122dacacb9mr12378978qth.8.1700568755602;
        Tue, 21 Nov 2023 04:12:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700568755; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3CbDNWxCUfMKQvBhzGaHAF8uIPiEBkmgXjYlBlBOLKXSBlMdy7ydgIe+fbSfME2gq
         AY3VzMUwJW+KCcLppmD9J3JCEWdAImrMDHFxtERh8FEpkVSo/cg7dUjVoQ4ow8BaLNMb
         8xWZISMjmgMPvGTP2qszIDky/GnYtfwNRFHyxyLMJsxlstf+N1A5p1GdI48ZiGDdXNKD
         JsjEMv8XlDG8jZ5JLqCXTWkQUJpydiURjeLg/Zbp57NkYlffh+YCvjfcsye0C+pNcmum
         mHwhckqGpzhup+38WFmDtxnGhV0gL7LkVpjYH+PQ/kZJ/i09D8/kqDe4wWQ61jd8MHTw
         HOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=TF0gAB9WSwpKOqjmrXXi1XjhOCnDRrZ4WlPzaCamL7w=;
        fh=A6d4BJTkcO4Tb4V34rr2mSX3341RstIj7VsNiQUca0w=;
        b=PBXBsfD02h1FcvoEnqrvqURBWCdHVERVbqvqbSp9moS3hUIGKkQw57ffrYxp1Yz9rc
         +cBPdGhqwi4jG3YFr4zaHYFuJd/krH95P4F/GsdH38OPqlNJAnx80WiWRtmYFOm3l64y
         vfn850mGigHvRt6S7u/N7N8YO1xpAX7InteFwHHHXeiln2KCFl8jJITB71GcTnd0tbDN
         jMIpXgecIpzutJ3cPsiYUnWonl9YjTtYWGhr9roYEfYVxWZwI9syo1+0vDIGuIu7VhqO
         bzeOP8GCh6LZN0asXGTvcypDrfNtj0yusZvf/XsZ6aErzxZXbTnR7bARgBFHpv/5H1kW
         4lJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EASYvuVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a05622a03c700b00419900396c6si9331249qtx.207.2023.11.21.04.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 04:12:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EASYvuVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Pc9-0001aH-H5; Tue, 21 Nov 2023 07:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5Pc4-0001Zc-3X
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 07:12:22 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5Pc0-0001xK-2B
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 07:12:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b26d6f7dbso7729245e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700568733; x=1701173533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TF0gAB9WSwpKOqjmrXXi1XjhOCnDRrZ4WlPzaCamL7w=;
 b=EASYvuVFqPB1gSvxk91q3YwiYM8jxparsbv2vmCRFdFWBM1R3tGIJzcfMxEobj9uKt
 ZEikJHc8IE2GEOWKOWYusYln8GEytEQ1MyQFkVJ0mXJK1rSJooMQEKVCqm7+o2xWrGHJ
 lBtj+MWbHrUSkJG/YpDKBgSi0tqOCiy2rRDKGkDGkvIq3skM/gReqNNalN0V2U7AdyAU
 HJrXkClHKTsEqIKmkLIXAbpvQlvVIr6uVwdyhKVhBp3I035/HyfwzJ8KWyrUh/dfbhDA
 FNzpy0shutt7T/sLGi3SDCyp1ESGnMlQB32yw6VQvcjsQoxWi5AUAtM3wD/qQUXVXk4A
 XWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700568733; x=1701173533;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TF0gAB9WSwpKOqjmrXXi1XjhOCnDRrZ4WlPzaCamL7w=;
 b=bSq+3LTQf0rIbOT28tmkexMw8d12d3xa8XTBuwssHdfeKqn7RFBmUfbjWvR9HIkEiH
 +qsvLE0yVVSfRB0iZbe1eOq02hNaJb3/mJi6qHEB2ZCKlnCwHo9eMIoELHC1HqDXUz/r
 DsjBPxJeyYJXDSl+DQX6x1KKGPGxfoQJaGass2ZzFEU9mpokr/pudo1il9hgGdVN3OhM
 X1aoY4jMNiKjS5ApRcBifCoXbFU7gfFB4UaYpLaQ5lnwtNi49wAIG7oW8A7U7QkSISHd
 jQvQhjrNeAcQcIkGeoDqBvbPnOAHPriiEbG/tkJ+UWmt/05dBkVhXGouVFRDp46M3XD9
 2Lug==
X-Gm-Message-State: AOJu0Yy0ka+Yl5Sqr7eXfFiFFWJLrjDvAWqM44BZqZDPTPvtD3sb9IIh
 MPWgiKloWCqvmoM2D5zDVaZ42WmrJomVCsvuOnkJwA==
X-Received: by 2002:a5d:5cc5:0:b0:327:e073:d5fe with SMTP id
 cg5-20020a5d5cc5000000b00327e073d5femr6095959wrb.38.1700568732868; 
 Tue, 21 Nov 2023 04:12:12 -0800 (PST)
Received: from meli.delivery (adsl-27.37.6.163.tellas.gr. [37.6.163.27])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d55cb000000b003143867d2ebsm14192554wrw.63.2023.11.21.04.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 04:12:12 -0800 (PST)
Date: Tue, 21 Nov 2023 14:10:28 +0200
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
Subject: Re: [PATCH-for-9.0 03/25] memory: Have
 memory_region_init_rom_nomigrate() handler return a boolean
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-4-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-4-philmd@linaro.org>
Message-ID: <4h38a.h95poe276hnn@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: sKC2cAW1vz+Y

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Following the example documented since commit e3fe3988d7 ("error:
>Document Error API usage rules"), have cpu_exec_realizefn()
>return a boolean indicating whether an error is set or not.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/exec/memory.h | 4 +++-
> system/memory.c       | 8 ++++++--
> 2 files changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/include/exec/memory.h b/include/exec/memory.h
>index 4140eb0c95..8e6fb55f59 100644
>--- a/include/exec/memory.h
>+++ b/include/exec/memory.h
>@@ -1498,8 +1498,10 @@ void memory_region_init_alias(MemoryRegion *mr,
>  *        must be unique within any device
>  * @size: size of the region.
>  * @errp: pointer to Error*, to store an error if it happens.
>+ *
>+ * Return: true on success, else false setting @errp with error.
>  */
>-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
>+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
>                                       Object *owner,
>                                       const char *name,
>                                       uint64_t size,
>diff --git a/system/memory.c b/system/memory.c
>index 337b12a674..bfe0b62d59 100644
>--- a/system/memory.c
>+++ b/system/memory.c
>@@ -1729,14 +1729,18 @@ void memory_region_init_alias(MemoryRegion *mr,
>     mr->alias_offset = offset;
> }
> 
>-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
>+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
>                                       Object *owner,
>                                       const char *name,
>                                       uint64_t size,
>                                       Error **errp)
> {
>-    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
>+    bool rv;
>+
>+    rv = memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
>     mr->readonly = true;
>+

By the way, do we want to set mr->readonly on failure? Should there be 
modifications if an error is propagated upwards?



