Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1090737ejb;
        Thu, 7 Mar 2024 04:00:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGznUztBvIoi3BhJgJUQqBY642ulgyCu1P2FGQZm8uys6or61StlL9LS1cHi/KkhLY+COZbgLPiJ5HukV4TpmyYRFvGC0H
X-Received: by 2002:a05:600c:4ecd:b0:413:7c2:7c0e with SMTP id g13-20020a05600c4ecd00b0041307c27c0emr2076000wmq.11.1709812849030;
        Thu, 07 Mar 2024 04:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709812849; cv=none;
        d=google.com; s=arc-20160816;
        b=k/W0JeiG7KLbRrvDlwLMoSEYQPNxI75/StuzDgIYaVpyVyOuozo2lStTfHJgNmmXOP
         L5fpvf4SBObEfJyLvK9YqHlsJR6oDk8DjQFY8yqtxEd0VQoFlFpSjXn3oTKj/AclJ9Z0
         w/zMyRl4zQTNbH915B8A8CeDXDPcjGABzcd/nedVV3pu3dSX2c5tQgHDfvjS6y3gwpzh
         T6NrF0TEy9N/GokkJ1N8sKWUSHDQmfZXB4lJpB5QksqvTWcnenalUqgRzOC0kROJ9gVf
         Dz4lqbrs15/SwOjTHip8aTxwc/W9zO42MrMS5rR1MCXlnzXe5sGpztQBDutMBl+tMZnF
         fExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=twWUN2kiBJHMBkCBDehi/T5jG7Og4Pb2CjHBjUGsfYE=;
        fh=LGrl+5LqcYzjRpnVa+In2APV4KLm5pU4E8x7P7zrNHc=;
        b=EcnHx7z+aQwrF5Fm6GK7N2DFbG/iCs1Y6gQh1mrLJSiolxb36HwvmZhMhiMcCYmN4J
         Xwt3+GUpkr5ewCzBXE/zqq2NNBQbNHOKaQzMEMCo3xpKKPmC7kZE4ZxeuWt/5RUve9mY
         /29BL6VTaAGxUBd5Du622A2FgBFMDZ9bg8q/dFYnu6onIU/CS91W22zH9pwgchkjWW/c
         2fX8xp7iBTCrnQ7zJsVN16CknlDy+G2LGVc2el5XYojjH5IMbEg5nAdLIs8vqrqGAFzH
         JBzFc7yCmOxdYxfMND5jNUBUlIxOCmKePBYzDvOFTJs3EiXrvt42in9kE2C41ETX1eyi
         fdWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQY8bPya;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o39-20020a05600c512700b00412f1958a89sor1473769wms.2.2024.03.07.04.00.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Mar 2024 04:00:49 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQY8bPya;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812848; x=1710417648; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=twWUN2kiBJHMBkCBDehi/T5jG7Og4Pb2CjHBjUGsfYE=;
        b=xQY8bPyaTTthEUXQrP9l+2U6IIeeyykwWiYJZA3yc2vtT+Z87XWkNifGN9nVeYJx4b
         RJR7LqJDm52+YnVsDdjopzG2SepyiZlOGAM4LesSBgNtCZEwwMK4b2tjTH3tisZzInnj
         G9Gjvx26ZfKFL5qb3LOKMDKYs0vOoW4nqSN62ZRdlFWOdKbaARtLppLc7TwKDRpwD8ac
         NZYg1RD66Rl3G48YH98sPdJX02NjVjdsrSXSGNsbiLMzYE8rKl4lMBDgR6IEBwcqSCeo
         6GQA7+70yiu2wuu1LsfdgWgSkRfRjtB4uDTSp4gYmPDZkltN/g6HLt2iMJi41wgrFpjy
         qFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812848; x=1710417648;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twWUN2kiBJHMBkCBDehi/T5jG7Og4Pb2CjHBjUGsfYE=;
        b=Zdat+2qWADIF5GDIQPKY92RelzMiPo0EypTA4mXIllkZwXVH/FGiKIuIQ0iAkveQb/
         EbjeR441dBDJd4j+YahVjtS4K7vroUDWsIfKbMA7cjGDNC2f3/fGljxiTwcBqgAmA5PI
         NlBwbMFRKgZa31KKRricC/Sf00u1kViilPnbfBSmyG+QMa3LR+uJe8PJQLtaqU1AvuXD
         +lthG+wlJ8zIOs4D7lHU2u3P/KiTeaU3ErQzP+0rv+i+IlygxzZVxob8Sye+hm6n/cby
         T3mRIAkT6sCQNnvzvqwjRBxg7zsX1FVxgC7r2HYdgRi1Pr20pCqJWpzg+W/CaCFEpEhg
         ZJfw==
X-Forwarded-Encrypted: i=1; AJvYcCVKdgTAah4zXxe+hqyoXkZvnGakKpWg4lgHbl62bNcqsW+vI8oIuqFVsmGOPBfk0Lpvbinw53yLJDI10ZTojQnCN8NoHaAi
X-Gm-Message-State: AOJu0YzFETXUL40zVfo/jvnl+EhHmiO3+yikVbT6kFUw9QzisJ9TuNA9
	NBWtsQvoUwVwLad8tDioGiDtqKRxKp0vRaxsXGf8DK8rCPh1TAFQaCSCod6HQtoNfg==
X-Google-Smtp-Source: AGHT+IHpiLitTFNjn86v2ggcN10vD7epyc0jEhUeO7saXhtlWV7ljeU238OFndl2+3dWsKcBM0XbgQ==
X-Received: by 2002:a05:600c:5252:b0:412:de1f:cdfb with SMTP id fc18-20020a05600c525200b00412de1fcdfbmr9194532wmb.20.1709812848632;
        Thu, 07 Mar 2024 04:00:48 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli.delivery (adsl-101.37.6.0.tellas.gr. [37.6.0.101])
        by smtp.gmail.com with ESMTPSA id v23-20020a05600c215700b00412e84e59d8sm2356539wml.44.2024.03.07.04.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:00:48 -0800 (PST)
Date: Thu, 07 Mar 2024 13:58:43 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Bcc: 
Subject: Re: [RFC PATCH-for-9.0 6/9] hw/xen/hvm: Initialize xen_physmap QLIST in xen_read_physmap()
User-Agent: meli 0.8.5-rc.3
References: <20231114163123.74888-1-philmd@linaro.org> <20231114163123.74888-7-philmd@linaro.org>
In-Reply-To: <20231114163123.74888-7-philmd@linaro.org>
Message-ID: <9z81a.ekdgcipljjf2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: FTzB3uPvfHo+

On Tue, 14 Nov 2023 18:31, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>xen_read_physmap() is the first function requiring
>xen_physmap QLIST being initialized. Move the init
>call there.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/i386/xen/xen-hvm.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
>index 789779d02c..3b9c31c1c8 100644
>--- a/hw/i386/xen/xen-hvm.c
>+++ b/hw/i386/xen/xen-hvm.c
>@@ -532,6 +532,8 @@ void xen_read_physmap(XenIOState *state)
>     char path[80], *value = NULL;
>     char **entries = NULL;
> 
>+    QLIST_INIT(&xen_physmap);
>+
>     snprintf(path, sizeof(path),
>             "/local/domain/0/device-model/%d/physmap", xen_domid);
>     entries = xs_directory(state->xenstore, 0, path, &num);
>@@ -575,6 +577,7 @@ void xen_read_physmap(XenIOState *state)
> #else
> void xen_read_physmap(XenIOState *state)
> {
>+    QLIST_INIT(&xen_physmap);
> }
> #endif
> 
>@@ -595,7 +598,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
> 
>     xen_register_ioreq(state, max_cpus, &xen_memory_listener);
> 
>-    QLIST_INIT(&xen_physmap);
>     xen_read_physmap(state);
> 
>     suspend.notify = xen_suspend_notifier;
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
