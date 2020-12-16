Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp493371qvb;
        Wed, 16 Dec 2020 12:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytdfmwa1MiDl4sx0J2RCueXSEkcEr+Z2CvcxniSzlWAL6qMS71JIRl7hGuJhwX9z1gy0bE
X-Received: by 2002:a25:ca85:: with SMTP id a127mr50139397ybg.432.1608151723403;
        Wed, 16 Dec 2020 12:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608151723; cv=none;
        d=google.com; s=arc-20160816;
        b=B4vlUek5k036B5byr116bkaUVGqsequNYb0vzxFKZ5KFiEC/fqI8a34yEEVni7kxo8
         4Si24h+HNNjQBCJJUAmqv6LozOvcHI/zkqdnNONXhZh2x3DJ7azjJ7f5U7xGni/d8/pT
         bnn2OVxwmPhfq8u6nPexlibA0Cf7eTMeRJyXNKGHXfk6QTFQd+dxwlytYJ4G3Et7EK2T
         Y53ZrXnsAvUhs5QAksiGEtDhErPcRepel8myLcVJGIkH4nH6D+unBIztcQyivOhQg3ZK
         Qm0YTpFGuSJp83ijF5Cuk8bZTquL9gQULxMJkY00yda36I90OrWDld41KVLq3p54dNuj
         2Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=9n8M2ce9XuOwDa00NO6YtkIm7X0n60lrDnzJNFtdfiM=;
        b=RT5+gisSEqx2yR+0D7CTtEnWwpi6BHHsltIgdCQ8wNp9BSLngPyGwVx2uv0vYdlPQf
         zIVpbYuXHk6ExResLhbLNoURPjeravDwi5qRhz9FAiPel9YhJh4JKZVPaURgsyPgc6ZJ
         UYta1RUxxWOJQolRAS6ck3YhaoNDHglePqjL45E4LeG1fa2hJIdLZWYUn90D1xgus6rC
         fSFcbYqegXU/yBz6JiqJnsm3xqphf4nsbX007esRQnZZdkIVChamL2sBeE7h+zMaX2SW
         AlXLsy2+23VJLbznfoP725rSNR8XJcENB/As2rptxy56gm08kAdY9ugPiobsQGpBQQVO
         0CNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AWRF8ezO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si2163145ybp.134.2020.12.16.12.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 12:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AWRF8ezO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpdj0-0002pF-UQ
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 15:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpdik-0002o8-Lb
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 15:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpdii-0004Mk-Qb
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 15:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608151703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9n8M2ce9XuOwDa00NO6YtkIm7X0n60lrDnzJNFtdfiM=;
 b=AWRF8ezOLIBIk7z/LJ1pKBXOiT71F8E575HFNILbyBe21jrtgAVjR6rPjWjVE6xY2g5BfH
 Ot9fcLV/VsuN7Xr5pFMBeeoYMngaeJr3TynmsBhgwa8lnansgDMuhLwsWpA+mDcaHkPh8A
 z4grcfmjwUvicx5upImhU+Pn/QGrpmo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-gyM1g-HpO4io8ZlRrVxGKw-1; Wed, 16 Dec 2020 15:48:22 -0500
X-MC-Unique: gyM1g-HpO4io8ZlRrVxGKw-1
Received: by mail-qv1-f72.google.com with SMTP id l3so18668410qvr.10
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 12:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9n8M2ce9XuOwDa00NO6YtkIm7X0n60lrDnzJNFtdfiM=;
 b=SGk4fwUxppUQuM2IQHup0LJEZEqlLBUMTseTCoTZzL8LwM20GFGdmTwTdSyVZu3YF+
 NZEAWr/o1Vip01g6+3InHUe9JUHQhkJCNWiPWOQ4OfxP4rjh3DmojnPRzcXSlSghiFXU
 owFuyc+cej4++8i1dfoD6Ei3LgVKbeSKI0hJKzX6PefOZNOpZNxAP8Kv8FQv96/qBpWz
 5+HqBfTRxr2HjUq+dcizeXYLvBRzrwbaBKZO3NRNC9vNdCQLycDxqytXo+IzIFU0pSK3
 mdaPinwpdhmeawq46OQ9iNo2KQwxro1BMQFYTT3LNQ1dvQc3UBShYxLosPahjDscjHK5
 lXFA==
X-Gm-Message-State: AOAM531c0eMF/a4EwzeIs6bQnzIduINBFB9xewL1OlWAo4UnVoApQ3qm
 sJ+/HOYzG513I7K5PR92G7OoBzvIuYz3BcKe3+m/65/8F+K1dq441VbKceP/0z6qHRQuTY0/spC
 a6DtNTO+Rz/Qn
X-Received: by 2002:ad4:5187:: with SMTP id b7mr20491903qvp.2.1608151700946;
 Wed, 16 Dec 2020 12:48:20 -0800 (PST)
X-Received: by 2002:ad4:5187:: with SMTP id b7mr20491884qvp.2.1608151700786;
 Wed, 16 Dec 2020 12:48:20 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id f22sm1882194qkl.65.2020.12.16.12.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 12:48:19 -0800 (PST)
Date: Wed, 16 Dec 2020 15:48:18 -0500
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
Message-ID: <20201216204818.GA39844@xz-x1>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
 <20201215175719.GA112585@xz-x1>
 <8a23c62d-1167-d005-e98b-14507e15fbf2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <8a23c62d-1167-d005-e98b-14507e15fbf2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E0FVt08krTlC

On Wed, Dec 16, 2020 at 04:21:17PM +0800, Keqian Zhu wrote:
> One more thing, we should consider whether @start and @size is psize aligned (my second
> patch). Do you agree to add assert on them directly?

Yes I think the 2nd patch is okay, but please address Drew's comments.

Returning -EINVAL is the same as abort() currently - it'll just abort() at
kvm_log_clear() instead.

Thanks,

-- 
Peter Xu

