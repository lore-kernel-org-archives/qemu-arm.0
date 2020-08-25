Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3157160lfy;
        Mon, 24 Aug 2020 22:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIJGqxo7FuzLl5gIxN3kvkKQ3vjN//LkcvbGJ30R1O1eEIfM50wGtllVxZundPhxZHRvPV
X-Received: by 2002:a25:328e:: with SMTP id y136mr11841317yby.281.1598334686873;
        Mon, 24 Aug 2020 22:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598334686; cv=none;
        d=google.com; s=arc-20160816;
        b=bTK5n5jtyrVbbu54JDyFOb5SalmBQFYCk5FGUzgwxwGBDuoaOszCA+FOSHosVW4N+t
         mttuh+AwnLS3PizKLPlZnKrNfuSiOKLzY0QFq9f+z855VSftQ1ABreyEKKt++/6Ut0+H
         92yuWevMUCA5CtPo657YladxTUJMXX+Qaan/hFiTLbTemQiCE9cXrmlxbfXulXwUauPg
         jTCt4IO85FUp6Vmr9pjtCDM46tWsrohFq1YR1knEHL+9OVRgQPNKASoX1WQUzimnhPn+
         oeLwuZogjRDinRqR2AHmIeCeQ5nkMDn6hgrDWmrL605gurSZ9ndknjV46Uswh6P02SfM
         74+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5ccRjVKuwYMcflsMajXtDQ1h/Iw/3YpycJlS3w9onxc=;
        b=YPFpy+t34uZwdQvBB9goJtNUVqOuPR7wBrG92gdQp1j7w9YfyXfFvI+iJeoXDnCvcJ
         68TNKe1UcE+5+6pKI5kql4V5d/4iKvNCzN2cAtesX+Zz0ihCuF//au74mfmG/8UCuOlA
         6r2DVyIsgvhWn0Nfv/Lu6ZIBqaYUwaEd0K5DzM6pv3UTjHKZpmQDWkdY9OI1z3kBaxWm
         3NVIJw+FMt+0DCqhDpbBLQ8239sZjG3DGJCqD6oieLoICZLVs1LR+sUO3f/bQiSz/05K
         yEkqstdmqewbW8qFOvxlzSwvbYOUkVwcF0+efP2uoCCb4l0nCa4sU4jnZeDzc8z2Stqe
         QJWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AEldW8Dj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si13307328ybk.54.2020.08.24.22.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 22:51:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AEldW8Dj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kARri-0007Zt-2B
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 01:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kARr3-00078L-HJ
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 01:50:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20150
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kARr1-0007zx-K8
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 01:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598334642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ccRjVKuwYMcflsMajXtDQ1h/Iw/3YpycJlS3w9onxc=;
 b=AEldW8DjYZ1ai4k+JYGz+9tAhXgCiyukitgtu52ghq4qowi70i2sF7XxCpbNf4+SHxNFlC
 d41tTRD71DGQA9mr83MjnQ2zYLd2R4wFR5gpWixSXycQRpn6HIhnCIFxSfFxKyi41o33G1
 j1611BV9NVY2cxCWTVz0vliN4vr5HNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Myr9DzcKPJqcGIA0Udd9zQ-1; Tue, 25 Aug 2020 01:50:40 -0400
X-MC-Unique: Myr9DzcKPJqcGIA0Udd9zQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AC001074665;
 Tue, 25 Aug 2020 05:50:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5282D7E33D;
 Tue, 25 Aug 2020 05:50:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 75DAC1753B; Tue, 25 Aug 2020 07:50:32 +0200 (CEST)
Date: Tue, 25 Aug 2020 07:50:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 6/6] virtio-vga: Use typedef name for instance_size
Message-ID: <20200825055032.kyxqleo6lxzvbkru@sirius.home.kraxel.org>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
 <20200824215936.2961951-7-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200824215936.2961951-7-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:37:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AZ8C3Z+swpx/

On Mon, Aug 24, 2020 at 05:59:36PM -0400, Eduardo Habkost wrote:
> This makes the code consistent with the rest of QOM code in QEMU,
> and will make automated conversion to type declaration macros
> simpler.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

