Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp397962ejb;
        Tue, 31 Oct 2023 09:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXnuk3OmOf6BogkQRrm+gNzyUH2ND3701YSibJnQ+uBB/hstv0r95417LAyYtvgtWHjq6+
X-Received: by 2002:ad4:5bee:0:b0:658:1ca4:97f7 with SMTP id k14-20020ad45bee000000b006581ca497f7mr15218613qvc.34.1698769086142;
        Tue, 31 Oct 2023 09:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698769086; cv=none;
        d=google.com; s=arc-20160816;
        b=0woKCFmWLOwnKHKCqdCCL2mqsYHiPOTd08I6PeLbRdrkWbJ1vL1tGxxyzWwLA2Dybc
         UQABH4XrhcrlZP0F4fiHBEYH6e7wnLmBr8cEGJJJgaET8CE6pONthS5U7KwWmLBCPnym
         FbyyRK6yfeQmmMO6DEzSbGVvEj3Zdjmpn5GIFy74JdwRo+AHBJ3ON1P5VFJ73UBWzG7E
         PT14XLAxy8sJMu4Uoj3CEn/mT/IIJWtqbMlL6IXTWbk4JIHX0BPPEvKDMUpW17QVKjwa
         cbnEfcfAbxHMckSloCPpAm5zoIBO7q5jaSz8r8ViZd/UYLkepJxKAfNSq2oJ6xMVs6V9
         ADVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xBSyK3FHQ+KE2LrZmhqh+WokgESDBygvJ4SHaVNO608=;
        fh=H2hmCH1E3HOXZkf0ld1q3KH4Yfo3HRnW9DxXcIe2QQM=;
        b=UNwzVOVzp1XE0ElXILM1U2GdzZdU/I5vc8x2iMhoUpXOexwkjgHfr8EQhLWQuV4vWg
         XcjTPGvEPAjdcSxKq0ldJ9flnMxndp+qPR06o/RhrK/muukuoT0FQBI+lIDpCh0WtGAZ
         GkyL/N+o3/LN/MQchWS/yDCuEV0rkoCBtOJ2pAvNJra0GizURnffKGnIXNcULtqBNXg1
         VdcBPT63N6UPa4AEHPsIwDlavNhqHluaw41IrZ6qnNKtXWwIhRDeqZEaouBDFe5g1U7m
         /y0mz1VZqlCt6dh4IR7kaZmVXTgkE92ntrnVui04DhDnvhK/mAIAAjZ0KlJBCrQhUaYw
         egrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6xy5gBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020ad45004000000b0066d113e536fsi1352710qvo.300.2023.10.31.09.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 09:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6xy5gBi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxrR7-0007aj-Qa; Tue, 31 Oct 2023 12:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxrR6-0007Zu-D4
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 12:17:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxrR3-0002BN-QS
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 12:17:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso9200626a12.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698769064; x=1699373864; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xBSyK3FHQ+KE2LrZmhqh+WokgESDBygvJ4SHaVNO608=;
 b=a6xy5gBioCWShRgALPEVlYxsQywi2ljzQvjiXLqBCjCwDtr757wemOJqdEX+rgHXsV
 T4UfTi5QAzbO2XgTw2GywZj6DA6kTj3F2H9BDJ1c1f30bF5UrNuJoRFylTRzTmL/IjJK
 vJgWrYe8iAnHYesCTAzKZmAZXWloduZ+TY7lCPTnEJanAmtTiUecdQn086oejzNJw1cR
 mraMeB6WR8g5Trt3EG9gptiPmnvy/UifjzLCmS8C3XXFxeFd3d4cjpiX+za+z92RHhWT
 4BEgmBaohF4jQ9mQmMzWlrWIWEHonH/SsVIVTeMEtOp01m9PdwSLMMWvYR77nQiX+O7s
 R7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698769064; x=1699373864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBSyK3FHQ+KE2LrZmhqh+WokgESDBygvJ4SHaVNO608=;
 b=SNOut2NmpAaXdmQFcfh6xuHo81yIifdFBTTxQil4QbDHja8ZtKHTFY/uHx9jsu2y2g
 jf/pTRsRHMUF+LAa64jkHS69cma3Y6R/LZeh4ZC/0fvIeiDHCcrXmWO5k1n8t+gJ1lWa
 sW86I9s+GDwVxFnAuu0Qnfr7NOdv78Gujv7s8iViyC1S5xwyrniYMTlUmGFH/YPEKYw3
 tuaXV9/pEm7ZKdJZ9RWlrQMJz7D9ib3PXrbxUUlkUfIBINhgpA93iVx1gQBeQJ+KT9J8
 Au/iLsj9yfHb60cRVdCG9OMI53w3WWtBCCRdVVs3SnYOJHn7rHoXGd1kVU7+rx7PbcfR
 rzpg==
X-Gm-Message-State: AOJu0YwY63nZTxMnJ3ZE4nb241PPiZXC9RjlW8OGIlfi9oiBW9Sjfi4e
 v3AkvGRiS6nBfM61jdT1DWrYCx+CNj9Kb7I0DhU6wQ==
X-Received: by 2002:aa7:d298:0:b0:53e:7881:6bdf with SMTP id
 w24-20020aa7d298000000b0053e78816bdfmr11226917edq.14.1698769064061; Tue, 31
 Oct 2023 09:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231028122415.14869-1-shentey@gmail.com>
In-Reply-To: <20231028122415.14869-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 16:17:32 +0000
Message-ID: <CAFEAcA8XE3xUcc0kmN-1ki6eKZmGiTFM7Xavsvmc3+rMCJk7QQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Various tracing patches
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: 97q+bKGBoHrs

On Sat, 28 Oct 2023 at 13:24, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series enhances the tracing experience of some i.MX devices by adding new
> trace events and by converting from DPRINTF. SMBus gets also converted from
> DPRINTF to trace events. Finally, when tracing memory region operations, host
> pointers aren't traced any longer and are substituted by their memory region
> names.
>
> Bernhard Beschow (6):
>   hw/watchdog/wdt_imx2: Trace MMIO access
>   hw/watchdog/wdt_imx2: Trace timer activity
>   hw/misc/imx7_snvs: Trace MMIO access
>   hw/misc/imx6_ccm: Convert DPRINTF to trace events
>   hw/i2c/pm_smbus: Convert DPRINTF to trace events
>   system/memory: Trace names of MemoryRegions rather than host pointers

Since these are mostly arm devices I've taken patches 1-5
into target-arm.next (with the addition of "Hz" to the
frequency traces in patch 4). Patch 6 looks like it needs
further discussion.

thanks
-- PMM
