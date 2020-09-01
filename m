Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4932124lfc;
        Tue, 1 Sep 2020 13:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd1KuUrkFT6xe3rhcCTSU/BqrTUPdqj6KeKAWbV68vjPekz2gg/g1Fatr2p0wwSl+B9mUZ
X-Received: by 2002:ab0:1328:: with SMTP id g37mr3068635uae.4.1598993718760;
        Tue, 01 Sep 2020 13:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598993718; cv=none;
        d=google.com; s=arc-20160816;
        b=IMPBKuiXbsvRIHkpEEhqWp2iNqA1bk/mGA9QZeHXnSrhp4Itlk9khK16htyNtgDyMu
         8C6korWsoMtU0aNjGWQJyvcLHMMcXRMkYvdh3sNHwGn7DRz6nC3aN/VpuScXlCfVQ6ys
         TnoAUfvAhFem7Ge5tNom46ykC8qdv1AXCkx/qghM9oZlgxJbJAO5/4NZe2a01+n+bAeS
         BF8UvBLo6lgk1V2bD6K3xN3gyoyxP2ist76oGeU7LGEmCaT9kNGJ7u01XIigxMwPZcro
         4iTgJpAb0NJnJjr47QSfrS1gi2MFhXduqkyVQzvdvqaBfHIbVOrotj7QFQPxPYFVUDVM
         mK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=HwMBq4L31jb9hDXnrjyPO3sxiRNCcOtXm+rN5EL9+Vo=;
        b=Udrdl1xS/fH0SMYcFdBe83AN1KWav/cLQCGbv1SGul4kTyFWCNffKl14wqfcCU/ki3
         EP0WZNSCPbxdNyaaaG59h2OEGyJrDRR4F6m3A3s3zPJEq/KCMuSW2TFjTo5EBIGwIE6p
         E2pDn7/1osSfYd/jTdfKJJ1RUhFXTM2QVFJmjWgXhK5SjDFXSeWqFyHq0Qs/rW5KOA5s
         0lkWTC+39AOaOJrm5q44fQcKMyqMCp6KUpVGDVyoMxCRDCfDNOObXrd7zzoflGObYWkL
         gwGRHuXVtNCbhqtlx9kh2RkQZSjaddsuTn52/vjh87MfrPECuE66G1rVFJY/Hc7R8EBb
         gM8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Q+IC/Vmr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si770303vsq.63.2020.09.01.13.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 13:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Q+IC/Vmr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDDJG-0001Vu-0u
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 16:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDJ5-0001Tm-9p
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 16:55:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38871
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDJ2-00081K-Kr
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 16:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598993703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwMBq4L31jb9hDXnrjyPO3sxiRNCcOtXm+rN5EL9+Vo=;
 b=Q+IC/VmrJ8xVa8zuiOBTbYTfYcHhxKOl7hsLZ8pgploWa5vk2Q05kCmDQkmwpBXdymKC4o
 pg4IHR6JR31yRazJ0aNyAF7RFRMyac6JrnCQqeZ0WjJz9EXPAIWNHZxzwvj8TS173evli7
 nrFheJf9w8iHGUQLTfAP2KNDgoAw5ZM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-SAJlzmDFNyqdodb5Wu4bWg-1; Tue, 01 Sep 2020 16:55:01 -0400
X-MC-Unique: SAJlzmDFNyqdodb5Wu4bWg-1
Received: by mail-qt1-f197.google.com with SMTP id e6so1979482qtg.13
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2020 13:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HwMBq4L31jb9hDXnrjyPO3sxiRNCcOtXm+rN5EL9+Vo=;
 b=SiKHnCrCbjCSj/ePAXgE1Fg/qQu+Ci9RRZ+4yNtk36ll072mHsJyT+/9ZtrDS1Nvsz
 DjmgthoGCSwb8DdyJJYdQ67iUaRXbIB9MRnVYROW60Aa2193NSpSPtrW3XXN1gk3f24B
 CyVFKoQ3yIcWCynMro9aHpxEe/YS8uQW9Z1upStzWVq3E6PJwjsA40aoCv9WqQ37VQn1
 CK2vg7aAXtuYEo3NhgwMba9Nj+bCvK6gLR0+R7UifcTBRRV3fnCbW4935A6dv3dw1TzX
 1q8IYyf6WtfVS8nReA2+NHoAPV2R1LUcejs2L46diYLnmtnO3AnIWEZnv7aALMFCQVuR
 j6bw==
X-Gm-Message-State: AOAM53154CSBBnkcc/mgU8NJ6vJHPzT/S50gzwoNvM1uO4iZjmNbC8OQ
 4SfgFNHz7p7rvsb1F1ky6ZEzS8B2PEzvtTw41i+NjrdrY9NFRJ53HuGKp+9PMrLfouzPk7ojEnj
 JPK+jAV35AQFO
X-Received: by 2002:a37:87c2:: with SMTP id j185mr3908714qkd.458.1598993701386; 
 Tue, 01 Sep 2020 13:55:01 -0700 (PDT)
X-Received: by 2002:a37:87c2:: with SMTP id j185mr3908692qkd.458.1598993701166; 
 Tue, 01 Sep 2020 13:55:01 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id h17sm2956296qke.68.2020.09.01.13.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 13:55:00 -0700 (PDT)
Date: Tue, 1 Sep 2020 16:54:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v8 2/5] memory: Add IOMMUTLBEvent
Message-ID: <20200901205458.GD3053@xz-x1>
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200901142608.24481-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 02:08:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nh4Pdwj3zg6D

On Tue, Sep 01, 2020 at 04:26:05PM +0200, Eugenio Pérez wrote:
> This way we can tell between regulars IOMMURLBEntries (entry of IOMMU
> hardware) and notifications.

s/regulars IOMMURLBEntries/regular IOMMUTLBEntry/

> 
> In the notifications, we set explicitly if it is a MAPs or an UNMAP,
> instead of trusting in entry permissions to differenciate them.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

[...]

>  struct IOMMUTLBEntry {
> -    AddressSpace    *target_as;
> -    hwaddr           iova;
> -    hwaddr           translated_addr;
> -    hwaddr           addr_mask;  /* 0xfff = 4k translation */
> -    IOMMUAccessFlags perm;
> +    AddressSpace            *target_as;
> +    hwaddr                   iova;
> +    hwaddr                   translated_addr;
> +    hwaddr                   addr_mask;  /* 0xfff = 4k translation */
> +    IOMMUAccessFlags         perm;
>  };

If these lines are identical, then we can avoid touching the spaces.

With above changes, please feel free to add:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

