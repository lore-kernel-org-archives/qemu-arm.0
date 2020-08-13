Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp562193lfy;
        Thu, 13 Aug 2020 07:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycdBM25CjJEF2h4o7FKf+wjnwWU7F8wGheuWt5lxrUOobjpZuqWBTeqxA+EOIzWEI1b3I3
X-Received: by 2002:a25:fc22:: with SMTP id v34mr6715555ybd.393.1597327851252;
        Thu, 13 Aug 2020 07:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597327851; cv=none;
        d=google.com; s=arc-20160816;
        b=kw3cTSZSNF8bJ00G0sO6BdvUiXDyBsisPN63Fg3m/rlNf8toVGpgvRq3CNJDIH7W5a
         SkXggw7TDtQnCNIAvb0ydUww/5GoknF6DwwoL8C4sql2F2xNZCYClW+Aui3ctiwAXgAv
         mx2z6iV36op4Xrjm2CKm1JAvviyHP9heevo8y0dQUViFHWNlVDOkAa0xozJyyKpysAkU
         rvjlP+tzBDfB+6gSnPnHFr7jE5PUHfEvjuBxvHVg3Osm5ENezj8S/lQNP5rNS3XSxnBv
         S0hwkKUl0G9QE1TfJ9ugY7x81Qf75Sdo8N+puu2asaacfpHJk19IcIxjJ4kVc3AU3RxY
         DybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NVPDnLmocfHe5Sa6VrlDK8fY4Ttdiv/N4UKighL6YYQ=;
        b=BkPbLbeh06U7K6AmvECPnDbXVoSYnkQLFQ3RbhlR4y2qQXb+qo9fRjISr/Oeo9ZRDf
         ONSD11Jo7fnUfl4rSn7G1VOua0lyLPRZzFb733eejSdeVbfMUxFFf5atNn/3TqkVi42s
         OdFDpZiDNU10sDqsfvfqxC2Hwv07Rvgst3aSGLMrcDIFXnKm3YyRZnJBeS9UuHLSBlcp
         sjcpGbqckPEORd1CW2tGt+RzRq/9PCD9jYLdS6PZOSPpy+BOzrkB3u68oWtPGmphQeiW
         E7ovovtrBk9uUfHQO7mRniyiCkbRV2bdtwBdTWA/8o98cJG2NeMpwZxO+jg/KHN96yd+
         EPfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WNdT8afK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y83si5473129yby.351.2020.08.13.07.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 07:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WNdT8afK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6DwQ-0001Yq-CR
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 10:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6DwH-0001YQ-K0
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 10:10:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44770
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6DwE-0008QG-Vq
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 10:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597327837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NVPDnLmocfHe5Sa6VrlDK8fY4Ttdiv/N4UKighL6YYQ=;
 b=WNdT8afKNLnWhM7tltB66JapenVJuDlPa2oeLwTpGjR3+Wkw5AmX9l1hWISBjkdxMmV4AG
 hq2O8Jg3YVrLt3/4c6rvuLzNLMvh9ZtjAeDK4MiNXrpKExUwG2lPqwBQ7wLNaCrkikH8kp
 ofOD+tKjMfnK+SOgP+ntwYookMqF174=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-sZP0J6thMRmKfsCWay_Hkw-1; Thu, 13 Aug 2020 10:10:35 -0400
X-MC-Unique: sZP0J6thMRmKfsCWay_Hkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81D9B801AC2;
 Thu, 13 Aug 2020 14:10:34 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DF4260C04;
 Thu, 13 Aug 2020 14:10:27 +0000 (UTC)
Date: Thu, 13 Aug 2020 16:10:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [RFC 0/9] Support disable/enable CPU features for AArch64
Message-ID: <20200813141024.ujmfh2a47utka2zq@kamzik.brq.redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813102657.2588720-1-liangpeng10@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26pM5YoD0XGt

On Thu, Aug 13, 2020 at 06:26:48PM +0800, Peng Liang wrote:
> QEMU does not support disable/enable CPU features in AArch64 for now.

Yes, it does. We have a handful of CPU features implemented as CPU
properties and we have QMP support for probing those features and
testing whether they may be enabled or disabled.

> This patch series add support for CPU features in AArch64.

Actually, it just adds all possible features as properties without
considering if those features make sense to expose to users and
without considering all invalid configurations. That's not a great
approach.

We should try to tackle migration between non-identical hosts, but not by
dumping all the burden of determining a functional configuration on the
user. Instead, I think we need to audit what we're currently exposing to
guests from KVM. If there are CPU features that make sense for the user
to control, then we can do so using patterns for other CPU features that
are already under user control. If there are other ID register bits that
we should be masking/adjusting, then we can make those changes too. IOW,
let's take this one ID register at a time. Eventually, we'll come to the
real crux, which is MIDR. We need to provide a guest an MIDR that allows
it to migrate between hosts with different MIDRs. That'll likely open the
errata can of worms.

Thanks,
drew

