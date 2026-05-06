Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D8FCD342C
	for <qemu-arm@archiver.kernel.org>; Wed,  6 May 2026 15:27:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKe9h-0001bF-7d; Wed, 06 May 2026 11:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wKe9g-0001av-6h
 for qemu-arm@nongnu.org; Wed, 06 May 2026 11:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wKe9e-0008AF-Ii
 for qemu-arm@nongnu.org; Wed, 06 May 2026 11:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778081237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u2T5xde/UtWWzJw4y+B8UwuzneDjtmJD2qAanQG+R5w=;
 b=BYLC1r6uV5S/ZWTdPEjXotqu0Zogdydrot30M1Ud2YJzaJqu42v7fx5P6/Hi3Kzmu0bXCb
 jFcElLAb/NbmBDuFGH6rpJHXjldIx/ybqfCWjvO1nhgCof4TsbEUXYxkaUv8OAXKOE4kjd
 n9Q47zw9XACyigow6olx/jxT2DfygMo=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-1WHPC4k-PvawePBdvWp31g-1; Wed, 06 May 2026 11:27:15 -0400
X-MC-Unique: 1WHPC4k-PvawePBdvWp31g-1
X-Mimecast-MFC-AGG-ID: 1WHPC4k-PvawePBdvWp31g_1778081235
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-95862466f3cso3836151241.2
 for <qemu-arm@nongnu.org>; Wed, 06 May 2026 08:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778081235; x=1778686035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u2T5xde/UtWWzJw4y+B8UwuzneDjtmJD2qAanQG+R5w=;
 b=cZfTVJj8CEsWEWOkHqaZFHmU9JA7bOCUb8uzYoYplOu6/a75HQ6cXH+8NnPB6yRgkz
 vSs6A4dExKPicVz7xOwZ0unxky5MUgWQ/2nVZpLitxuck8H7g2PO0lu6BgdR2i/41/tB
 ZpnW211qN5BBXgrON9mughrwVwLQZ026BSPYKP+qMWqnhzK2Dh+6irngvBgZmqlq5rp5
 ftS+WhiCSW3KV8NGAtC4Ki/pq2QNDAVUEjsiUGJmpx70ZAjadRNkBQJZaGWL+jq/sri1
 cCH37yMlzBX565kB3FKSk71mj0lsdYq+8sIJJKC3kx1g45vSSkVK9LJMr/0PCfCE+ofw
 FB2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4kSgzfJiQqdE+XgOIQYmzyVoujBKgAajFUGCtNBtBgOBPQHOUutQjZeD5dIRpEyNdD9dzmaCPlw==@nongnu.org
X-Gm-Message-State: AOJu0YxULq7ZuX1x3GG5/pyowgwzBqg4bQjMLf3IH43OfVxo4VbB+Ugj
 1I/jqDyGV3qSW2BMhYW1/mNpHv220fytcYdCImOIGurHZ36zXCD0ZvHf29NvM5LFR0hNaBCGvxa
 kBoYreNCjOKmOW9yEGRg7TULeUxnea0iYKCjbd7yyw/8cpI+e7DIMfw==
X-Gm-Gg: AeBDieu4jfOzaHZUuR91x2dvDukJk0e69jYyaoXC75bE6YrY/cmgb3qHpAvsTjHoAQa
 i3iFyHnhPMtYNFpK8zW0n6lDwyAJkLYCG+TGXQYP7fz6KOea1fJpdiy6yNOKYi18KDiv1hIzQcT
 Eqgb4/QW4waQOqBDHAE0/vdjMZbm/ahIU1HLNRlRVyhQHIzE5Lyvv4JgMWKG+gpCe3cch3lSK6w
 is3+lSdgii+RW8As9xhrBMO0SLt1rJ6xua9LGD38WOy1Ni+UgXJcxeZJKddGRRrIZIiBVZcUipN
 HDCnEGrOXzjP6iMuVuDzc5EGDo9gAFRPJhvCR4KfI4wY6XS+tU8C13jrEawz4lr5IrOAzTJ0uvo
 yahVRscugeZ5gaPZufZM093R1FFjfQCsOgrC2woNI9byuBoQhDHEBxQVk0w==
X-Received: by 2002:a05:6122:e26d:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-575596891f1mr2207382e0c.9.1778081235068; 
 Wed, 06 May 2026 08:27:15 -0700 (PDT)
X-Received: by 2002:a05:6122:e26d:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-575596891f1mr2207299e0c.9.1778081234106; 
 Wed, 06 May 2026 08:27:14 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b53ca982a1sm204102286d6.38.2026.05.06.08.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 08:27:13 -0700 (PDT)
Date: Wed, 6 May 2026 11:27:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 18/25] system/physmem: Use translate_for_debug() in
 cpu_memory_rw_debug()
Message-ID: <aftdzpB-hSjo7PEz@x1.local>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
 <20260430093810.2762539-19-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20260430093810.2762539-19-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qLtuYxi7q5psaBeN252eCrLnd8cQsyj2vdwYVV9GxIA_1778081235
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Apr 30, 2026 at 10:38:03AM +0100, Peter Maydell wrote:
> Currently cpu_memory_rw_debug() assumes page-granularity for translations,
> and it works in a loop where each iteration translates for the vaddr
> rounded down to a page boundary and then copies up to the end of the
> page boundary.
> 
> Rewrite it to use the new cpu_translate_for_debug(): we no longer want
> to round down the input address, and the boundary we copy up to is now
> determined by the lg_page_size it returns rather than being assumed
> to be page-sized.
> 
> This, together with the implementation of translate_for_debug for
> Arm targets, fixes the bug where semihosting would incorrectly
> fail to access parameter blocks that were in memory where the
> start of the 4K region they were in was inaccessible due to MPU
> region settings, even if the parameter block itself was readable.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3292
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-id: 20260417173105.1648172-18-peter.maydell@linaro.org

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


