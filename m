Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1231922njc;
        Mon, 30 Sep 2024 06:24:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcsKKLhNmNmsYpGGIuXHSKaq5QdCycsANaUEnXnnJn/El6aJmFjD3c3pDGufykRJ6ziXRPs99vEAQKLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGkq6bNzyC/v0qgpx7yQotJ5QdMOfew6YdfbVE4RBp7G9+pLsqyavFHl/1GVKDeTSyNEfY8
X-Received: by 2002:a05:6870:89a3:b0:261:22a4:9235 with SMTP id 586e51a60fabf-28710ba9068mr7207369fac.32.1727702642371;
        Mon, 30 Sep 2024 06:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727702642; cv=none;
        d=google.com; s=arc-20240605;
        b=KUugDb0IZ+mKHaLtBbK6hSGi4xLFfQOZ+qY4Ld+SzlzUPetdZs8rKkj9D7rQ8/Jmx3
         KBcOE+kh4GDeypmz7+uOUgZ6+0yPF8mj9u2jmwlOCEuLuswrOcaPbeLscRFC3ZVMf2jG
         5udz3SSTaQGHsa8lmuNWSGp+GhbTWWh1Dun6PtAcDK4AOoPau/ON1/UCZSDc0byR6NZY
         jDEOMNsA01YeWtkh7zh3yJ8Xfe1RbSz2X3L+4CYy9L7Y5OXRaQhTaopNCsn7CEJzOJ22
         l65/968PrD/xYmvnJjfvyimN9fsrSbgvNaqprWHSU/2KJkq6kLPO2MlsDuLGR1d6c5ji
         8eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=y49D8L+xH7T7+8zYU2ZZJmAVprThYbfty07i+lBtO/k=;
        fh=473fBm433A1Q8N7qMV771k6WBZJ4+bbDdUfHwK8sObY=;
        b=E+EVfw5zPyL/L6/1ljhVaioVp2PKtgaEkk0hV4uTQe5yNO+nKr6YvleoRR1d/Gijzn
         CshyxbD9xWbM+8EB82B35rkmK8BGEh/1B4eNxkiyktLTkF4mk6V+TRyg/fFhIe9Og5i0
         CtIQXe/LAO46Jg0/f9+IsgBHG9KsxHOfqpMTb2XKnrj6BA63kKMKNgDFDczR7WkHrC/1
         cobNGTOajuz3xkLAnFpM0xhstbDtyDtdGv1O8nC3Rj0PCum1Bs56Iql1lIP0rj1+IlFv
         +ofANAt3wz1abLR/2YBeJ35m2UDqz5Qxda1la/H6LRdnSEQMxYiP4WxjxxZ73vUjrMWa
         4qqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=QxbEMqGV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84eb1fc7b8dsi1370254241.14.2024.09.30.06.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 06:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex-team.ru header.s=default header.b=QxbEMqGV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex-team.ru
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svGNB-0002jZ-7f; Mon, 30 Sep 2024 09:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1svGN9-0002iJ-Ly; Mon, 30 Sep 2024 09:23:32 -0400
Received: from forwardcorp1d.mail.yandex.net
 ([2a02:6b8:c41:1300:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1svGN6-0001J7-FE; Mon, 30 Sep 2024 09:23:31 -0400
Received: from mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:b1cb:0:640:2a1e:0])
 by forwardcorp1d.mail.yandex.net (Yandex) with ESMTPS id 1C18860A20;
 Mon, 30 Sep 2024 16:23:21 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b737::1:2c] (unknown
 [2a02:6b8:b081:b737::1:2c])
 by mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ENZBJX1IWa60-boQthCi9; Mon, 30 Sep 2024 16:23:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; t=1727702600;
 bh=y49D8L+xH7T7+8zYU2ZZJmAVprThYbfty07i+lBtO/k=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=QxbEMqGVu8CuTWz4MfL9JkKLKCGswjxb53UW0bOfOfSAplZXd1LMFQK3g9fkB4V73
 XPLmGicBR90EcEKipsOcXI1Xl4FN5GqrkQim93JHTw4s9ojR4LTNVOCL6JsM5Dz2M7
 Z/C5Fvqi4bQ1O1xTMKVN4O8Pk4YnU7y3wBFv32Gc=
Authentication-Results: mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <a9b78fc7-c2f6-43ea-b3b4-eab5eb3ed0f3@yandex-team.ru>
Date: Mon, 30 Sep 2024 16:23:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/19] qapi/block-core: Drop temporary 'prefix'
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, andrew@codeconstruct.com.au,
 andrew@daynix.com, arei.gonglei@huawei.com, berrange@redhat.com,
 berto@igalia.com, borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
 den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
 farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
 idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
 jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com, kwolf@redhat.com,
 leetroy@gmail.com, marcandre.lureau@redhat.com, marcel.apfelbaum@gmail.com,
 michael.roth@amd.com, mst@redhat.com, mtosatti@redhat.com,
 nsg@linux.ibm.com, pasic@linux.ibm.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, philmd@linaro.org,
 pizhenwei@bytedance.com, pl@dlhnet.de, richard.henderson@linaro.org,
 stefanha@redhat.com, steven_lee@aspeedtech.com, thuth@redhat.com,
 wangyanan55@huawei.com, yuri.benditovich@daynix.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, avihaih@nvidia.com
References: <20240904111836.3273842-1-armbru@redhat.com>
 <20240904111836.3273842-4-armbru@redhat.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20240904111836.3273842-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Yandex-Filter: 1
Received-SPF: pass client-ip=2a02:6b8:c41:1300:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1d.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: GH5Cnoe/legY

On 04.09.24 14:18, Markus Armbruster wrote:
> Recent commit "qapi: Smarter camel_to_upper() to reduce need for
> 'prefix'" added a temporary 'prefix' to delay changing the generated
> code.
> 
> Revert it.  This improves XDbgBlockGraphNodeType's generated
> enumeration constant prefix from
> X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND to
> XDBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND.
> 
> Signed-off-by: Markus Armbruster<armbru@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

