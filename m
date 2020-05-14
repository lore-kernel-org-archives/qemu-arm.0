Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1084672lfb;
        Wed, 13 May 2020 23:48:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXIXewjJn8dbvz5ptvBeKYrJStvGh/4hRLbErW9Vu9TVYFAASvDoK/BvrXTYTtF+jogRZc
X-Received: by 2002:a37:8582:: with SMTP id h124mr3294309qkd.375.1589438898758;
        Wed, 13 May 2020 23:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589438898; cv=none;
        d=google.com; s=arc-20160816;
        b=pFpa+arRFmkN4/7XU5pB/OTMRkKrFbe0fwQ8oxVPNd7aAuVGfrWa1VhqfIzKWHuRvN
         2TKpgCfBZ5kSKVjuRRt75goiXaNzmgIW4yJ/SNVn4q1jgEO8fq4ecO1SI4mOPUsS4Oyl
         LXlHmXi9iUYi8h6bPEpDXr6TclY7RHd0y5urPZP8FPKGz8DgAkOhhqSYQzlbQA6In3Ll
         1OHK92uZ5xYkd7V1sTbNc8+v3PTeD2M1+9BWqFBmuy5pCuiQNoEhVK79N2eNllbgGhG4
         fBP4r+Tjp/k7gX1amYpKGuEFUXAFiy6fVDAv2csxKS6PfkhEyQVSWKWhy86uaUfIFTeZ
         OG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OKaumr5EXNcZi+ukxrme9UKCcCxboPvshd3EtOFXab8=;
        b=I+A5Bg0glYS+tfwNcJchuLgIu8YJAYqd5qJJJI7Ao2utlaGF2d3OR/AiH8B4nMYInj
         QhmNH80DhB7xxdQ9oX13/r6Ib5N5GZqUWMUZ3HKhuJeN7xhyz8zw1qVisRHG5xeYGn29
         yF/yRb3JFy1Zrm7Almgo5phYFKhpfR+o5fdR0FTiOK1nCgws5M/PFZJpEtYYHrh6B3tu
         kFFyhG3b3MpeONCXL2snOPqMcuqVjRIMgsLMCBHEneqaXtxhYAdZq+nihXliMJctVTYm
         UrGf9AAYMgltBrjzv5JcwW1p+ep3G2Gud+ohY04KblmJfQjkaqlup1FDYGyyFRg4LfkD
         08Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IW22/RPZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si1294897qtm.141.2020.05.13.23.48.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 23:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IW22/RPZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZ7fG-0001wa-50
	for alex.bennee@linaro.org; Thu, 14 May 2020 02:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jZ7f8-0001ug-Ve
 for qemu-arm@nongnu.org; Thu, 14 May 2020 02:48:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42148
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jZ7f7-0004lE-Bp
 for qemu-arm@nongnu.org; Thu, 14 May 2020 02:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589438887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKaumr5EXNcZi+ukxrme9UKCcCxboPvshd3EtOFXab8=;
 b=IW22/RPZVJG47LD1bikYRJv+iXenVA7KiBMBeDeW9rACv6KYHipye0BR1wqmVEvyNMne03
 JDQ0ZmOjjmI90xZDK4Qwyp2mVy8EkyhBw42UhOiFdVuPYpyyrWgwoNHPbh34eCHb5Og1F7
 kqoVeiBjWjPv6tQeIGS4g2pNcSvjOME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-FXljx_hvM3GlYh1B_TKwBQ-1; Thu, 14 May 2020 02:48:05 -0400
X-MC-Unique: FXljx_hvM3GlYh1B_TKwBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3148805721;
 Thu, 14 May 2020 06:48:03 +0000 (UTC)
Received: from [10.72.12.133] (ovpn-12-133.pek2.redhat.com [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4623D6E712;
 Thu, 14 May 2020 06:48:00 +0000 (UTC)
Subject: Re: [PATCH v5 00/12] Cadence GEM Fixes
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
References: <1589295294-26466-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <78cdc918-5c0a-a0bc-1d90-69e49dbfe0cb@redhat.com>
Date: Thu, 14 May 2020 14:47:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589295294-26466-1-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dPoEo5sezxVE


On 2020/5/12 下午10:54, Sai Pavan Boddu wrote:
> Hi,
>
> Following patch series fixes issues with priority queues,
> Adds JUMBO Frame support,
> Makes Debug statements compilable &
> Fixes related to multicast frames.
>
> Changes for V2:
> 	Fixed build failure on fedora docker machine
> 	Fix buggy debug print to use sized integer casting
> Changes for V3:
> 	1/10: Fixed debug statments to use %u and %zd
> 	      Remove rxoffset for buffer address
> 	2/10: Add inline functions to get tx/rx queue base address.
> 	4/10: fix read only mask
> 	5/10: Move packet buffers to CadenceGEMState
> 	6/10: Add JUMBO MAX LEN register
> Changes for V4:
> 	7/11: Fix up the existing code style in register defines
> 	8/11: jumbo-max-len property sets the default value of jumbo frame
> 	      Add frame lenght checks for tx and rx
> Changes for V5:
> 	8/11: Add a cap on jumbo frame size and print guest errors if exceeded.
>                Move jumo_max_len property into static properties section.
>
> Sai Pavan Boddu (11):
>    net: cadence_gem: Fix debug statements
>    net: cadence_gem: Fix the queue address update during wrap around
>    net: cadence_gem: Fix irq update w.r.t queue
>    net: cadence_gem: Define access permission for interrupt registers
>    net: cadence_gem: Set ISR according to queue in use
>    net: cadence_gem: Move tx/rx packet buffert to CadenceGEMState
>    net: cadence_gem: Fix up code style
>    net: cadence_gem: Add support for jumbo frames
>    net: cadnece_gem: Update irq_read_clear field of designcfg_debug1 reg
>    net: cadence_gem: Update the reset value for interrupt mask register
>    net: cadence_gem: TX_LAST bit should be set by guest
>
> Tong Ho (1):
>    net: cadence_gem: Fix RX address filtering
>
>   hw/net/cadence_gem.c         | 458 ++++++++++++++++++++++++-------------------
>   include/hw/net/cadence_gem.h |   6 +
>   2 files changed, 265 insertions(+), 199 deletions(-)
>

Applied.

Thanks


