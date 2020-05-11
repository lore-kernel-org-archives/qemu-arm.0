Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp555233lfb;
        Mon, 11 May 2020 14:12:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypJoQDvSiXtgUxu48MP0O6KJbJHrrXZLpGB4PUsKFXqrKnEQvjeIYKrTjqJJuUJZzRqT9MvB
X-Received: by 2002:ac8:3664:: with SMTP id n33mr19563947qtb.363.1589231535286;
        Mon, 11 May 2020 14:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589231535; cv=none;
        d=google.com; s=arc-20160816;
        b=zYPFNk3jx8FhGmS18oZQUC1Aa+uNZt1o2Te6oFakdf5WcaMEUf33ANJEEEA91XCGVS
         GkMe41PWweLkT33CQi2Wpn9+EWy8Em9vddO6qAOMAOu9aSdxDWnZIUvDuvT5ifFeP2JQ
         rlMJMr0MYBcrXR5vTlLzvElcOqszsXWq+83RexXFuWDujPn19RWRfXM/gxWDZgWX34Tt
         ITguSg6UMmVVwoWkejImRbvROw/6ijOQKkmW+DiIq0zKtt/GOnxKgCxxE56W2NIHsFLJ
         TxGGjdfA/uoDycbiBwrV614ZOl4BChwApCqlNJvwULSpsFz0NDffznhgPi0rTK6yv3O9
         Smzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BU3FEZ7eueZUvi2B9gCb6a6ZgqGmsW/r9yKr8z1X69Q=;
        b=I5ACfsWx3YUabIrVhojnrTHQ6fZemo2nmI0uLq67VdLsUvcSorq0BygWqkbkXWT1jU
         JuyQz+6Ur5NUzg7lLE8KvLcC+KZDrgez7u/WIMynRBqgby7j+i71N1+isQ0mjBzfUhxw
         WdGH6yD+pEeERoys1iSTaRtTvHf0vwuHOQAwtWtyKoA57Sc/XAWMxJuRrTA226NU0u0Y
         dcqpGzmCsV68mpm9OR3f7Vi5WeWNN8C99CnunzuU/pda7m7Yg7r/w1IZHoQqzkchdAXN
         WuP0B6b+LMPb2WRLDnVGHi47D45voLLc9YFqhlC/LEld5F0rW/9AC80X2/pOMtgMF7AH
         C+gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MoF+nPEu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si452279qvk.153.2020.05.11.14.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 14:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MoF+nPEu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYFig-0003Nw-Lw
	for alex.bennee@linaro.org; Mon, 11 May 2020 17:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jYFiX-0003M8-Ps
 for qemu-arm@nongnu.org; Mon, 11 May 2020 17:12:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20380
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1jYFiV-00061H-JP
 for qemu-arm@nongnu.org; Mon, 11 May 2020 17:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589231521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BU3FEZ7eueZUvi2B9gCb6a6ZgqGmsW/r9yKr8z1X69Q=;
 b=MoF+nPEuiz3aulCYb+YAMtrTFtwLu5I3V5EqI19siCYMlvODTbu8Ajvx/ErCD8Kmz6lIr0
 fFkC9zsFsVPCsEQAFi3TBUs7tN/27vFVo5DKN/HdSNzMNV40fiRtW84kAOnI+g8KmfOH8D
 JBpoHN6ss8w2EuHZVn1bqQA1EmAz3Fc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-OpDU1SdrOti084JjMrdC1w-1; Mon, 11 May 2020 17:11:59 -0400
X-MC-Unique: OpDU1SdrOti084JjMrdC1w-1
Received: by mail-qk1-f199.google.com with SMTP id r189so6990602qkc.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 14:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BU3FEZ7eueZUvi2B9gCb6a6ZgqGmsW/r9yKr8z1X69Q=;
 b=HwpgStVYwe2xgS/I1rniVY3g3I0OQEsX87Mzd+D61h3wezzoynt6X3Eat/evhEe0pw
 jUN3cU4WvFEjxRpPdwV7xOFSU+jnfolQgb0pFzlmULRNtmt1c5I2oNTfcg/hS2ZNkrIH
 WDMSlaQTZSqC2GrxZKSi6gO3W0quhMRElteBLSQgi+xJClcI4qlowIRHL5GyItUkEKy+
 75zxIN9jWv8fMnxyZnT/LGabAJVdka5rhaJQP+mzatx45ALJ9qMVAGx64rzXaUxfeODN
 pn1Q/FA/3OXKWQlcTLhMb0pd0fb2aEaSVeh9p2AmT3MD5t1x0yKRjkPOl/RcrlILpGeO
 41Ug==
X-Gm-Message-State: AGi0PuZDTcbp+PPG+b9davStrfOTov0/tVDRNViannQvAIA7DzuVEoli
 S+APP/8T14yQvcGG2TsWEjw4Ujp3SThlf9U2rZ5qJ249e7uMn5+ULM5s21ivJYyGCpL1UOPvDhe
 Ilpe8peDOQNLx
X-Received: by 2002:ac8:6695:: with SMTP id d21mr18780367qtp.176.1589231519474; 
 Mon, 11 May 2020 14:11:59 -0700 (PDT)
X-Received: by 2002:ac8:6695:: with SMTP id d21mr18780346qtp.176.1589231519208; 
 Mon, 11 May 2020 14:11:59 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id l2sm9315250qkd.57.2020.05.11.14.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:11:58 -0700 (PDT)
Date: Mon, 11 May 2020 17:11:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/5] virtio-iommu: Handle reserved regions in the
 translation process
Message-ID: <20200511211156.GM228260@xz-x1>
References: <20200508173057.32215-1-eric.auger@redhat.com>
 <20200508173057.32215-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200508173057.32215-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=peterx@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 00:05:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qz6u68UcRX4G

On Fri, May 08, 2020 at 07:30:55PM +0200, Eric Auger wrote:
> When translating an address we need to check if it belongs to
> a reserved virtual address range. If it does, there are 2 cases:
> 
> - it belongs to a RESERVED region: the guest should neither use
>   this address in a MAP not instruct the end-point to DMA on
>   them. We report an error
> 
> - It belongs to an MSI region: we bypass the translation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

