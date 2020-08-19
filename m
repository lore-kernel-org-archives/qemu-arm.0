Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp603716lfy;
        Wed, 19 Aug 2020 09:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVOoq52ox+GgugYvMw3tzPjk28Ayep8EZFuR4xJUvdi8VBT4nyEw8SmpFzubcHS6BeMirY
X-Received: by 2002:a25:3b06:: with SMTP id i6mr35601196yba.270.1597855230260;
        Wed, 19 Aug 2020 09:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855230; cv=none;
        d=google.com; s=arc-20160816;
        b=udi2aabqTSAEH3YEnUnmQQ8DkbqFn4tPbQ2prTsJNdxaSP60Tz4QXo8zFYk6wEIUhb
         jWhMwB13jhEWHNMrbDmbFcvKjnsUxyvE/4QSfed1yhShQ3j/3EY8qb0tfHusafvbp119
         f4pgkYuIaMr7nvZ3kWha0vKx8/ofaq1XVYJnnmQzk+z8Cd1AlJMua+PP3EJ37c9+yAGj
         ZkLfL1HnjzchoucECmuv6goKJjiwBhJKJFYuuA1o5/ebc2hOaN8tghgElL3Au/lZlf17
         ZTpTi4hQk/szyiuNymQpySprNo3NwymDS3lpjpnNvcfZRfb58VvdK0RZ4oYPtTFulke7
         2IWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=qvx1PubyBKAzg8T/9vG5A1Kawx1VD1yyunwPD//mz5s=;
        b=ZZLtd0NHAjR7PCDTjLfOzzOjzpJeA+8tCimeRqmY4iY/Hi0hRHgilxidofcGfgUEC/
         lcm83fFndN226VlEPjBb5RpKlPasgbQkHzYSyzA4c0PgJFf3HqFdPG5U5eB0B+i65cnr
         kFTZv+XAAwVepIWseeQNmWIR7ceWSDL9jVfYT8CPoQYN9R1SdvJydXQg4wEGygXE6U+U
         59ptmB6atNf8vNa/qdmphhk6DedIMtvQXxECnMLCGXUdgMfvhMQ/y0EHSxTCz/txjRzI
         m0QC/6iFCK0T2JX8hgbLGqoY8S/e5RUZU3fANgzlEwUpGIilK0f/AGivGj9E3kAH62hu
         oJQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ezWiRTfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x206si25346833ybg.206.2020.08.19.09.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 09:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ezWiRTfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8R8W-0005rV-0t
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 12:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1k8R8H-0005pD-4o
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 12:40:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33575
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1k8R8E-0002Jk-Sm
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 12:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597855210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvx1PubyBKAzg8T/9vG5A1Kawx1VD1yyunwPD//mz5s=;
 b=ezWiRTfxmNoTodtiNC18ZcPqBmmZUSWfunAEOT0vUp4xHQmUCSAEBz7DwPVR+H7Kf+GCTP
 7uLB6ecXCT1DDlstJ5Le4bTqtMWuYPNMg0gNWmtoBX4iSBTOmpV7oxBWs9V2B1ohqNu1Sf
 tQdXyuRvs2gn9v23FrgT8T7zhelrFnA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-VUd94kDMPJmToO8_600Cjg-1; Wed, 19 Aug 2020 12:40:06 -0400
X-MC-Unique: VUd94kDMPJmToO8_600Cjg-1
Received: by mail-qt1-f200.google.com with SMTP id u17so17110634qtq.13
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qvx1PubyBKAzg8T/9vG5A1Kawx1VD1yyunwPD//mz5s=;
 b=FSShvjRwzaD88FthbNGFEKdKyGghDBElyMdnJQQn/AygdxoynwatLIqEa/z3qripWA
 rgf224mOtzDqvaYArAS+Bavhd+PrLLdqVE0uQ7VcXg6g8U+UjGIKlBpw1Tk+pNOezQrB
 AFiAdxDw6qcwQhPBLiF1Q5s6mUfzaqjV0tYGxPJU/9I3AnJrzq/oX7W/4TkC3fPgNxdH
 /CnMxoobcEw/96LWawLCOAFpbwpOO8rUiW3vNsU2nRY0TGjJzdzY51s0D1wkpWh56MfN
 1ay4Y8Q7q7RCilIAcJ1azkXF5twN21jBMLX4dZ7KqhZ6Z2jzZcyEbBg01Bsrjf70HE7K
 9NzA==
X-Gm-Message-State: AOAM530a12T/efK9bKmqbwCz0SzB+pwNQCo0XHqeKEJ7cUYOjnc7kIh+
 3SmwDXyHCvb4Ro1D81e0IAVCwN0zRMhn08TOknz2MGyEzthRGkjRRm8DyDiOXKc/56mHjevp+bR
 84662VaNGMl3Z
X-Received: by 2002:ac8:428f:: with SMTP id o15mr21812990qtl.213.1597855205712; 
 Wed, 19 Aug 2020 09:40:05 -0700 (PDT)
X-Received: by 2002:ac8:428f:: with SMTP id o15mr21812969qtl.213.1597855205490; 
 Wed, 19 Aug 2020 09:40:05 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id f31sm29091534qte.35.2020.08.19.09.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 09:40:04 -0700 (PDT)
Date: Wed, 19 Aug 2020 12:40:02 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v4 2/2] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
Message-ID: <20200819164002.GB305409@xz-x1>
References: <20200818130151.31678-1-eperezma@redhat.com>
 <20200818130151.31678-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200818130151.31678-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=peterx@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnnEkTDPPdKW

On Tue, Aug 18, 2020 at 03:01:51PM +0200, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

The changes on the callers of memory_region_notify_one_iommu() seems to be
still missing (and, to embed the type into the notification process)..

-- 
Peter Xu

