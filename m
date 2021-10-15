Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp623077lfc;
        Fri, 15 Oct 2021 16:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaK4aw2GSDomZEkWkEmcOCso7nqtoLJ+wXdnprrKFlgfx3WOe4CB4DOzRlLYPvKvSwHiub
X-Received: by 2002:a67:fdd3:: with SMTP id l19mr17649261vsq.37.1634340724658;
        Fri, 15 Oct 2021 16:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634340724; cv=none;
        d=google.com; s=arc-20160816;
        b=wVb34XBJQ1GPpOpqihUXyq0AZp1lEcLNgIeHSbc3WKaQEFxJfyaQUr3JRj2TmXhrB1
         S2qO42mXzccG/P1tCbAoRJVz8+WC12Ic9Nmi5K9xw7T/4ZE2pVx6m66Ngw5rX+uLDwfo
         eA3uUIJDQOzDD0d2guwlmUwZ2ZVQgIncGvV/JxUD0F0eTwujTjl4qQ71ltJ916hkeyos
         lfsDoTpN988wlbYoNqFhHGnAEibYNW5E797tRSSG39VRO/YUe4fNxVKfFKxVZgE1io2+
         yKLivsIcxmg/GX47FWBT5JsjmAm+xVVsCIUB7WnkEvXmegKVycbwtR6/0lFCw0Zb4gYK
         vjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
        b=NctmbHr7eQejgWwul4l54SmKsCIM7YPuMUVTphSLOiOPWz1LxSvH1gCOKsYDJVVWRJ
         M1LbHgXlOKXu43JBTrbs2AEExcjLR1Zbfbg493KJWj7bqdtgiiKr5S1sAetRS8StZnSG
         5x9/ONxj2ziQZTQHOkAjyy3hbu9MMz35WgWBfqhT4+QCwMsnXM9s1GCXQk2GqwCrfqLn
         T+fyvwjCA9t+X97fHX7roPaYdgfq06iM5kfVtEWDL9R6VvMYC8K+aYKvuhZQfWdXmDkQ
         aa3ro83w3aKdOSLwWbpwQ/LrVSFi/vBNYw/MDz6HFY6W5ZolupguiB8lk5vkrOiDeFZ/
         ZlFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGE3BySf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si7945099ual.57.2021.10.15.16.32.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 16:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LGE3BySf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbWgF-0000Nv-W8
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 19:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWg4-0000NH-Gn
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 19:31:52 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWg2-0002Um-QM
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 19:31:52 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so3575652pjd.1
 for <qemu-arm@nongnu.org>; Fri, 15 Oct 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
 b=LGE3BySfYXyWi7ah3iBw3Ddb7IrL25CErAshQVgRYsyTeVF7XgKR+uj02MxFxrjo/x
 2TegCpFWukh5/064OO22WObFlF+fbV5SSpms25CFf+ipifvZfeUOkQ1YwSfroRti6eu6
 RpOjhxhqk5wK7WoDkerMUwtgpADd0uQivgkAjMUIM5sppoSCoespi0ke/WwYr3gBHAfy
 HsAhIw/3G9Xn6BtoPSPQHXxMn3e65R+0mFIDaOK5KtUJFS+GMHlbcbhqplwPpZ48A8Xz
 lncGt9UFYDHabJqJVI223Q+TZtJeUOnA1M4UIae7/GCMc2lhVeKlQgSsK4lWJFQxQcAk
 zD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J+L1utn27MGlQ35iulW095bePFsQG+QxIx1adp1qiTg=;
 b=2WO+JGRlp5zDogAoJPMAxpMV5UYrWLC0yjcgv8z8igybGa3RLZ/y+q5fWl0dDvozN4
 OT/GkHYbNU1iX2AVH7y8u9qxMAfRFOFuIKG+iIbFdk1D5HFGq8Pag8axpDm4lIKmVFbO
 uthNdt8A+ijtq7LCjmYT4CR8JcwZvzNPlh+o35Qy1NGoFfLBoLg7Je8YnLWqAdzDwJ+x
 3YeYCDbJ4dlKilP2VXy5zbcHfXiknYmDYYbOgOiszAcphM/ZMRyksXD/iff9rsXqfv3H
 WBm7w4thTcXGjqy/U86ZT7XyvRIrPVZcJZCRNjEEtHcTwuSa5Eas1JNlxKN+nVHcuZh7
 fheg==
X-Gm-Message-State: AOAM5319Ca9WOz1B3fti0wZG/P2KeweK80jwzOPDeRWPLW8AAWEjlRky
 eYfCV57qQo8S7ZrJ2gZR9cpapA==
X-Received: by 2002:a17:90b:4f4b:: with SMTP id
 pj11mr17103951pjb.4.1634340708825; 
 Fri, 15 Oct 2021 16:31:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u193sm5419487pgc.34.2021.10.15.16.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 16:31:48 -0700 (PDT)
Subject: Re: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
References: <20211015124246.23073-1-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adc064ec-b068-cb91-a883-27e4ed77ee88@linaro.org>
Date: Fri, 15 Oct 2021 16:31:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015124246.23073-1-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: robh@kernel.org, drjones@redhat.com, qemu-riscv@nongnu.org,
 ehabkost@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RXI6n9719QCp

On 10/15/21 5:42 AM, Gavin Shan wrote:
> The empty NUMA node, where no memory resides, are allowed. For
> example, the following command line specifies two empty NUMA nodes.
> With this, QEMU fails to boot because of the conflicting device-tree
> node names, as the following error message indicates.
> 
>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>    -accel kvm -machine virt,gic-version=host               \
>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>    -m 1024M,slots=16,maxmem=64G                            \
>    -object memory-backend-ram,id=mem0,size=512M            \
>    -object memory-backend-ram,id=mem1,size=512M            \
>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>    -numa node,nodeid=2                                     \
>    -numa node,nodeid=3
>      :
>    qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
> 
> As specified by linux device-tree binding document, the device-tree
> nodes for these empty NUMA nodes shouldn't be generated. However,
> the corresponding NUMA node IDs should be included in the distance
> map. The memory hotplug through device-tree on ARM64 isn't existing
> so far and it's not necessary to require the user to provide a distance
> map. Furthermore, the default distance map Linux generates may even be
> sufficient. So this simply skips populating the device-tree nodes for
> these empty NUMA nodes to avoid the error, so that QEMU can be started
> successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v5: Improved commit log and comments as Drew suggested.

Queued to target-arm, thanks.


r~
