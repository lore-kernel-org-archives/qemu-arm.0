Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp414585njc;
        Wed, 19 Mar 2025 10:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxP/wqmWdbWM0W3WhXmcuvmIjXM20yusH5OoaliJyV8uoxJlkLD9ettvWex58SXl0JCqRqNumd5GpGlA==@linaro.org
X-Google-Smtp-Source: AGHT+IF3G64b8FIpD7IQGAo7ICKLWBlBKZAmvPKZVfx3XMzhF6bX2r85H+mKZvXWI+bcvGpfzjWK
X-Received: by 2002:a05:6214:238e:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6eb293dc12amr60994686d6.34.1742406183047;
        Wed, 19 Mar 2025 10:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742406183; cv=none;
        d=google.com; s=arc-20240605;
        b=J57neAM276LNY452qfYDwPDBU9la2rZjIVDAL/UZKL/33wR4ls4hHqLFBip6aU4K/8
         QY12OrJxk8YvaKdWHdhODrsL9t4jLZuy2c4enlRYLAvK/QOHe3JIf1Jl5ae2j11qzksD
         CGwAxM2ywin+HJz3EXmEQtIrSxVgUHLenF+mBzj91g9kFPY9lZs6CJwWaoeDb7P0W/Zl
         YUVqJ5k2FazzFHzFamIfu5hzptSg2skstnlFPMUzz6IcDf7Yq0V24gsvUv38cembJi/J
         vdLoa9xA+QFD1R29TJjVMC3OVzaP1h4vdd+1PLG1ONo0V4+B10IbVVFWsSa736EQSvdZ
         A8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=xdHr+wV4v5xUcIHu4GW0sf3yXF4EP+1qdf38St8V2tE=;
        fh=j5X9ht/I+PfDKrgjttnSSXExxXXpzmINnVo4YM9/Tzc=;
        b=cPh7Ljj6Dh0paL9F9fxlrDRCnJEpbdxx4xC4RDa8swhr6+sY2eDhREsvEKgiKB1aaS
         JISj4Nysykzhv+UJqKCUj0YMaltBqOZDHmaYAOK0hKV7o+D8Qje1I3G8KfCeSkkI36Re
         IGpNeklEOlCZCFUQ7MJKQ2b08y5dBLD79gJtJWlM0i2Vb6scQ3G+pxWeh74hAx5lsI9y
         Wyh8o4mi7IxDnzRbcTMMypPEe6kH0EMABSoSXbGrJvXC074K5NIPHy19UpiCyjoSELv0
         epjaT3cbe5eLtyJXdxkQiR6Z7ikp4//yYXrOMoPjlm57nvEQv9kViyXdYX2WMVxMO+rD
         mC3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KahzDsYO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade3706desi147260806d6.436.2025.03.19.10.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 10:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KahzDsYO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuxRL-0006ci-JV; Wed, 19 Mar 2025 13:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tuxRJ-0006Zd-1z
 for qemu-devel@nongnu.org; Wed, 19 Mar 2025 13:42:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tuxRG-0007uu-U8
 for qemu-devel@nongnu.org; Wed, 19 Mar 2025 13:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742406165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdHr+wV4v5xUcIHu4GW0sf3yXF4EP+1qdf38St8V2tE=;
 b=KahzDsYOsjZjS6tw5IFaL7vyyKVuCF80U7Qdhk9aQxvNMeCoLyUiF8T2u9/SiQUIWw8Kd1
 tT5Me1DHmo34eNtgdebtXkxeyKDOdvFaPu4Y5v4Ooqa1mJg1fir3Wdfnx+nnNSFCCfkmJ+
 T7LLvuSynlP02N2e6gfov1pmgZfMKC0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-b5eKdsYzPpqA0Y-wwY4HIQ-1; Wed, 19 Mar 2025 13:42:44 -0400
X-MC-Unique: b5eKdsYzPpqA0Y-wwY4HIQ-1
X-Mimecast-MFC-AGG-ID: b5eKdsYzPpqA0Y-wwY4HIQ_1742406163
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d01024089so38243265e9.1
 for <qemu-devel@nongnu.org>; Wed, 19 Mar 2025 10:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742406163; x=1743010963;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdHr+wV4v5xUcIHu4GW0sf3yXF4EP+1qdf38St8V2tE=;
 b=vEYYVFt1V8gu6+KPfsg5wT/UO4S5SnIp8k9Ct/oRUChbHjZkeJLIh8KUrYM7SxSGTZ
 Fcgf9+XgSFazbTdQlAJQBSXJeKC47jcSSE/hk75G1UCTMJs5hhu5LoQohK4cE3zRJ55u
 p+DAZUb62XaeFo9yoFnI4Fj9/K3gx8eFDkvymhkGxLNGJLG40AsefTTxsSBqOe7GfWQZ
 KygfHrN4Xhtc/vWzn5mNNk7GeMv3On2Lsijoav9pJgqYIFYZMv88GFevNw6APawJRt74
 E2ELixj+j+vvvWoaHwmjhlsXoE9y/KTarmChTVwpGHj59U64RCNfRPxVLG/5RAC98i+u
 msPg==
X-Gm-Message-State: AOJu0Yz4u+ShtgJoj1nJFF4hr98ibIXoF+f8ZIi9NM5dDQ4sCY2iHDfy
 pXE3cOOg1aiKttZyNZOMpY8S3PYd95If4vohURGgCQEt3IKlatzZoKFXExB+tizWMReruYoRj8t
 2BjdQkjtKCi/b2/tPIvfjVDerVtsDmVksoj3pNuU7bPgUhXVtT1Qu
X-Gm-Gg: ASbGncu4VSin6wouA/xU+d1SMYcxL2Ae/A71aBu2p4nsR+/mXa31Liw5KvNXFK1BB8b
 +Zh9R7am0q9peHXPUDcqUEuinUH3N+To5br6BfGybtJv8cm28YB8QH7UZXDPta7d0psvC95Hzae
 4LG7MRswXiZBNEuqpjRjlalNiUmAaEo5Lv323oJDPjt7o3/dkV6lPWhBqNuZMB4pSIzfULjVXcj
 7c1QvS7ci8YF8gUnwyLM96dxQtSBwOsQZfjYTzDvT1otDb/aW3zZiaNbGPNyFowgHOviJOAHarc
 BAqUhVj7rw==
X-Received: by 2002:a05:600c:4503:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43d437c3327mr41385195e9.15.1742406162864; 
 Wed, 19 Mar 2025 10:42:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4503:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43d437c3327mr41384875e9.15.1742406162407; 
 Wed, 19 Mar 2025 10:42:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f476a7sm24700675e9.9.2025.03.19.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 10:42:41 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:42:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:MCIMX7D SABRE / i..." <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] Integrate IOMMUs with PCI hosts that have ATUs
Message-ID: <20250319134141-mutt-send-email-mst@kernel.org>
References: <20250307203952.13871-1-jason.chien@sifive.com>
 <CADr__8rgTBJW-KKAr55Y1wHLS7jRDyvQjx=vJCGAj4T1YZhUNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADr__8rgTBJW-KKAr55Y1wHLS7jRDyvQjx=vJCGAj4T1YZhUNA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LIJLmRLseE2G

On Thu, Mar 20, 2025 at 01:19:18AM +0800, Jason Chien wrote:
> Ping
> 
> Jason Chien <jason.chien@sifive.com> 於 2025年3月8日週六上午4:40寫道：
> 
>     The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI hosts
>     also utilize it to implement their ATUs, preventing coexistence with
>     IOMMUs.
>     Overwriting a PCI host’s PCIIOMMUOps disrupts its translation rules.
> 
>     This patch series introduces a mechanism to route inbound transactions from
>     PCI hosts to the IOMMU, enabling proper integration.
> 
>     The final patch depends on another patch series:
>     https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg00003.html
> 
>     Jason Chien (4):
>       include/hw/pci: Introduce a callback to set the downstream mr of PCI
>         hosts
>       hw/pci: Introduce an API to set PCI host downstream mr for IOMMU
>         integration
>       hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()
>       hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATUs
> 
>      hw/pci-host/designware.c         | 18 +++++++++++++++---
>      hw/pci/pci.c                     |  8 ++++++++
>      hw/riscv/riscv-iommu.c           | 15 ++++++++++-----
>      include/hw/pci-host/designware.h |  2 ++
>      include/hw/pci/pci.h             | 21 +++++++++++++++++++++
>      5 files changed, 56 insertions(+), 8 deletions(-)


Hello!
I tagged this for 10.1, as qemu entered code freeze.

>     --
>     2.43.2
> 
> 

