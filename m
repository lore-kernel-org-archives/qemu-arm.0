Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp190272lff;
        Fri, 6 Aug 2021 04:10:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySx6WCyVWAiOEViTbzSDr4tNnY2Z1A6lQJb492RGo3Bv3vkaY9L/iuZlX5UMOHyjvg6sJQ
X-Received: by 2002:a67:db05:: with SMTP id z5mr8192671vsj.23.1628248238911;
        Fri, 06 Aug 2021 04:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628248238; cv=none;
        d=google.com; s=arc-20160816;
        b=WEVUP0+httW87gHWstkH6/KsQ6e/660gwF9EMTly0r4s1E4/ETyIIiYShMQzQcIOoE
         mY+QFbct6FMkBLbzqnCPsVLuhRfdTyDDWSCjc/XtuKdzXolD5H/6mgW7BiMm3jRPDagt
         ygj26ZYROHL2jFkRTri6IQ06dXgg8ZJiFHT2oV6tOi4nYQ+KqR/D18bI9XCycZQrROVN
         OsXUvtes8j6PKZEt/5i6mzvn18BWC/SOOgpi4IbKw9NRm/cMSUKO58jO/JuUA8miqnUy
         +rD1VMFEk9I1I/M+/OViIvCCqm6uxurmakEe27pCwgz6GGuokWywTqYenZHF9Sf+gU0c
         0RYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=9RtBNB8jMAZPkPUHqq2AZEZwQBib3996b4AOMsts9eM=;
        b=rhsJtkusbuLe6LWGwjLwomvw0pcd0+x0/Y9U+EG8+xMhsLm9eIGaYF3c55/aDFIUv+
         dfdh//K1oZMJTjXEM/08A4g999Z/Ov1uUhBtEw2I8nnwR2HB2Hha/iCCFFFyqD0n6pFU
         gYyv/p9uADhMxuvdAnyL6M9zy00jcq6379QGpsVE1nSG8UkoJiZ70SkHktkJoxsscUTK
         4hV+SKEqljAjwc4JGPyLFYrSyxLqtVYnvrxfe+XVObRmLQ8dsvT759xkaIgotFm/H3Yv
         I1rdXu6kOAQbGQgrX5TUy4b2bo2iHkfDJldLjlp4JmO8PCjrTYN4YGCtata0ybtyyTDr
         Lo5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KQ+dWfQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si2963413vso.317.2021.08.06.04.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Aug 2021 04:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KQ+dWfQ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBxkM-0005Yy-1u
	for alex.bennee@linaro.org; Fri, 06 Aug 2021 07:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxk0-0005XX-TS
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 07:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxjz-0002EY-BB
 for qemu-arm@nongnu.org; Fri, 06 Aug 2021 07:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628248214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RtBNB8jMAZPkPUHqq2AZEZwQBib3996b4AOMsts9eM=;
 b=KQ+dWfQ5N29zAPO5glKRGVblMWXH1+LiQMCXjw7fMi5YnPepR0ZPVxPS7lcqrjhGUC742t
 BgMGqgbNWhPFpoJ2ty1FI4bLwJaMTJBN1AoZpz6olmtz8WL+9jfbulZMOzkJW2vzqqwqm7
 LL2K3EgvgeK6f6NsLGP6Qvcg9wejYfY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-Gxro_hymPx2VufiEeOQqWg-1; Fri, 06 Aug 2021 07:10:13 -0400
X-MC-Unique: Gxro_hymPx2VufiEeOQqWg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m37-20020a05600c3b25b02902b5a02478adso1897604wms.0
 for <qemu-arm@nongnu.org>; Fri, 06 Aug 2021 04:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RtBNB8jMAZPkPUHqq2AZEZwQBib3996b4AOMsts9eM=;
 b=PB+rlmhKY28EhARCwZndCbqLrhxA7wdpV5CW9iAB7EMmei5Qdke6o9Q6mk/ciHXdN6
 9pEmbS6KVVkNrI9CUpJ5ggWRKmcka96bOAetFMopwp1TKOMoeEvRQaHEAxXrYMECID2w
 1MwD2ycP7tiJ1CYks4AoUO4XZPs6dadUzGQOOJbbr+J1SFxpyO46opRf2afkej8+k2m0
 ZpRJlCv7yR1jQtMWFKX4+lxeOzPeyq/YSV4K9fuNYvQzJV34AT82cCAA8ST7l/c532jm
 Qwdu2GkQkmy5QJUjWVKWjw4S35Wmp3q8gX3rQAR0xNoA9Wzb1HJFCwALwYWUT5kNTPtK
 1QqA==
X-Gm-Message-State: AOAM532bwya98ho/qfjcLHfBVtS/1Kx1p5iPSLtCprCdkip0YcOYtpdg
 anuyH+ispGws8w2Fi6VEdRH6IZjAALZ8le2UlmFvYwrxfJsf6OCA6fEEbJ0mW5uoCD5iicAMNgH
 kMGTM/rt6glAA
X-Received: by 2002:a1c:32c1:: with SMTP id y184mr19032037wmy.70.1628248212457; 
 Fri, 06 Aug 2021 04:10:12 -0700 (PDT)
X-Received: by 2002:a1c:32c1:: with SMTP id y184mr19031856wmy.70.1628248210018; 
 Fri, 06 Aug 2021 04:10:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id x21sm11589520wmi.46.2021.08.06.04.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 04:10:09 -0700 (PDT)
Date: Fri, 6 Aug 2021 13:10:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v7 08/10] tests/data/acpi/virt: Add IORT files for ITS
Message-ID: <20210806131008.0aebc81a@redhat.com>
In-Reply-To: <20210805223002.144855-9-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-9-shashi.mallela@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1OoiAZadFOaf

On Thu,  5 Aug 2021 18:30:00 -0400
Shashi Mallela <shashi.mallela@linaro.org> wrote:

> Added expected IORT files applicable with latest GICv3
> ITS changes.Temporarily differences in these files are
> okay.
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/IORT                   | 0
>  tests/data/acpi/virt/IORT.memhp             | 0
>  tests/data/acpi/virt/IORT.numamem           | 0
>  tests/data/acpi/virt/IORT.pxb               | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  5 files changed, 4 insertions(+)
>  create mode 100644 tests/data/acpi/virt/IORT
>  create mode 100644 tests/data/acpi/virt/IORT.memhp
>  create mode 100644 tests/data/acpi/virt/IORT.numamem
>  create mode 100644 tests/data/acpi/virt/IORT.pxb
> 
> diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..2ef211df59 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/IORT",
> +"tests/data/acpi/virt/IORT.memhp",
> +"tests/data/acpi/virt/IORT.numamem",
> +"tests/data/acpi/virt/IORT.pxb",

