Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4945233lfc;
        Tue, 1 Sep 2020 14:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE7tHYyLghs/gZ7hqr6X4zsVnZ5fa6wo0HRt9MLy1jgaSYsT6jzOekAa3h3c2vX8M7RE6Y
X-Received: by 2002:a25:d98c:: with SMTP id q134mr5253535ybg.73.1598994898824;
        Tue, 01 Sep 2020 14:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598994898; cv=none;
        d=google.com; s=arc-20160816;
        b=Ie8WK8/tSdYJBTY7ML/UqVCl1NO6BqoecOKzzJ4aPy8vYTG2MnxXjGpj3O9IqC8n4+
         VcphFJCBPLlR3dG+HKvQ8mxo4sIk+bw4TTDEg/xE25D86agtZpFq+WL527PSwwcWeKMN
         RTRCst8uoOq+IrY6JlH13QeDNO97jPR0KLkQI2cQPjC4cRcBpAq4St9TCWg2xvntV3Pj
         j9ysOzM+dtBqzJv+63SNTEuJCpArPhH2GYB8KduJ6Un+jX1dUBPo44fNL3DGF2nVX0yJ
         UifLSV9hxr4aKCpbm3Ovwh7nEp1Xah5WwZtVQjA/BCrcV+KbNZq0DQHry+L2gLZNnPtD
         Edxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=oMzSUbuaS0SLP3V0nKz6raRAbmrCMnOI9nSqqBp6t90=;
        b=J+Vxg3eGuBO9hi5cRdYRGvWB9lE0T0i7TPNDAnnooHu4SheQvP2aRnUEXdDKMcsiKB
         BZj2YOB81FsbZrOCh6SfGvs+CGsIf8826di/lJ+hA6zWa4mWnApCOxxK4fdZp2t67DBf
         qWzoXUQaWKfHM4OgQhkN8Xms8BrEuM5aBpZRlWSZek9kUnS27vwGYpvkLx1F81GvjPwx
         4Ph3Vc42wKMA2H75PGMvqO08zfcENwdjdmpCaJ4x2vkif9172aq9F2zTnHSMTVpEJZ9F
         dvwOxkcb+/DmHoS3tezYNzwtl38Qj0nbi8V0gQXAtVrXuSfQxwbu0SyJIz3a5sAqOBlv
         Dt5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="DTk/XWws";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si2119397ybt.336.2020.09.01.14.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 14:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="DTk/XWws";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDDcI-0002DA-8D
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 17:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDbV-0001lD-T8
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 17:14:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28407
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDbQ-0001bL-NB
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 17:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598994843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMzSUbuaS0SLP3V0nKz6raRAbmrCMnOI9nSqqBp6t90=;
 b=DTk/XWwsqiDJLwZWlzBs3kNKtsFnBPq5j0Sq9i34WT7aPHCac0OxdaL18Q6AGzixmOQOj2
 gNSKeorEOAd6kwxsScW9cxsgA9GEBEFlC1EJo9CC8i2kIiq+qpsT622r/ZnKFadLleQEIv
 Uvb2FTM1t3eMklkVanmrPcE33QMmePg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-wy8CUikGOwu1IVF1Z0klkw-1; Tue, 01 Sep 2020 17:14:01 -0400
X-MC-Unique: wy8CUikGOwu1IVF1Z0klkw-1
Received: by mail-qk1-f200.google.com with SMTP id g6so1864657qko.21
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 14:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oMzSUbuaS0SLP3V0nKz6raRAbmrCMnOI9nSqqBp6t90=;
 b=oSBHLxia0wM2L2PGzNs1BNkvrHoyVmsxDuSkXqpnbz4C4jTMpvUBZiZ3f1PIvMRhbf
 /k3j9ueYtiySfZmpGTcojhtgdrufOAwIX0XDZhsQcj63X05fXjQkad4MLuODmCfmSjjJ
 HwiIh3urBidvwMdzDno/MeXzva4IvKwnAaHaXCgiieu37tWCLYW4og5TkCKjrmLr5r59
 xSOWEV0WBt0QEtxxoAziYXImvPAbtmKf36PkZnZLiFRG9v8cWu43EQicSmBN4/jT+tWg
 F8DMSWaW+yaul9TGSMR+ywttxtdqeJn1ckjwjN89E4OOJpBQCPF25RaPpma/s6QJZ+UV
 EIdw==
X-Gm-Message-State: AOAM531L5GBhiAzF4tQOK+QJkEglgSiocaTreukF6iJngM/DKeBgIxGc
 UFHuWIt6FhV6azW855PqjIgC2YeS+S0ZgdCH9VxdkLjRIlffJ3awvk9yWthv0t33MGrzocriKkD
 +gz3f5rfsplo+AhU=
X-Received: by 2002:ac8:f57:: with SMTP id l23mr3890625qtk.166.1598994840997; 
 Tue, 01 Sep 2020 14:14:00 -0700 (PDT)
X-Received: by 2002:ac8:f57:: with SMTP id l23mr3890592qtk.166.1598994840761; 
 Tue, 01 Sep 2020 14:14:00 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id b199sm3148134qkg.116.2020.09.01.14.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:13:59 -0700 (PDT)
Date: Tue, 1 Sep 2020 17:13:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v8 0/5] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
Message-ID: <20200901211357.GH3053@xz-x1>
References: <20200901142608.24481-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200901142608.24481-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TDqOFeYyThvs

On Tue, Sep 01, 2020 at 04:26:03PM +0200, Eugenio Pérez wrote:
> I am able to hit this assertion when a Red Hat 7 guest virtio_net device
> raises an "Invalidation" of all the TLB entries. This happens in the
> guest's startup if 'intel_iommu=on' argument is passed to the guest
> kernel and right IOMMU/ATS devices are declared in qemu's command line.

Thanks for working on this, Eugenio!  Sorry to let the original one-liner patch
grow into a patchset... :)

I think it at least looks very good to me in general, besides another trivial
comment on patch 4.

-- 
Peter Xu

