Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp602767lfy;
        Wed, 19 Aug 2020 09:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMWnoGvYtbrh1fd1imbU5uuAl0QQRxQuP4TM/XXzLMhM/unJ0+wFcXbUD6pz5JXfvXxi+u
X-Received: by 2002:a25:3855:: with SMTP id f82mr34515668yba.301.1597855144785;
        Wed, 19 Aug 2020 09:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855144; cv=none;
        d=google.com; s=arc-20160816;
        b=t4Q3KgIteM+i5jUUXmGYXbbdsRq4Jy1woDDlGLPov3cBn/VEsPLVSyW1NlLZjiLOAO
         ipca7NDUcT6SS35HE1wD/Io7xjfRmQftQn4CT708nu8IPGVOZQfrnb8zPjlxHa88nBmI
         RRMW6qQnnK04IE55mveJfI2qLSF6P46zR/381QcXOU2rhdnB2rNswufDeskDQwfNr9dx
         A7GybZ+9UN3EDovPW76Lix/0WzbQg2lxouu18AvhfUiXWws/+iEXMq42HdKZco+XbHVq
         cH2xxQQNsdgWS3swDCG0WMPY03fLlH1Q23IoH/qnuUNLK9DgIdXN0zd+onf5mJCkbj1t
         NJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=7/CfPbqVwkBQNKsZsmfMjrcuU/QPk8UD5NZ/+SlLU2A=;
        b=gGV2a5hIXX8X/AQapA+xNKvlnecaYOa5MATNXTH3qqPFdboznqUvLr6TEXcso9FOmB
         Ne4+PB3DyE6VNM2YOjY/z4hpRHKC7scP6a3sm2Y0j4esqeu1whijrm7iuEso6dObZaXG
         1sL+/5hcMo3MkC5p5b5y3ez1ai/X63txSPLi0wq5o5umuYIZtaMqBCjLlTVCCVdN+Y/M
         LQUcAm0HDQ9XN/UZxVGD/m4QYWlxlx5bMLav6TqcW7SiLLRNR4BTYTfv2pWUvppwBkLX
         cAc8Xuq6ZfDi1etLarme/NskgwHkl/CMD+cONklU5S8A1HzbDhL6/ZHfrNQI5FkJQtaQ
         l1cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jCVAkbK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si29434305ybt.476.2020.08.19.09.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 09:39:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jCVAkbK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8R7A-0004gK-5S
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 12:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1k8R72-0004fZ-CU
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 12:38:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21953
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1k8R70-0001z8-SK
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 12:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597855133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/CfPbqVwkBQNKsZsmfMjrcuU/QPk8UD5NZ/+SlLU2A=;
 b=jCVAkbK3y6eQtX5LaEg3RcqstZ7E8QGaO8UFvnXcZCVhYqLXovFFwIUrWLrfDm7MVzDrau
 H+/KDhAx8gFV+YqEpsEAILpAsYNNTCypvCJ5rUarUiPqVaIvebjFQ+lO2P6WekTg32MMPq
 pUjauDrPCm/PwTlDx0pzSvq4g2t9Jhc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-Ij39T0b5MzWrhxWmJxM_vA-1; Wed, 19 Aug 2020 12:38:49 -0400
X-MC-Unique: Ij39T0b5MzWrhxWmJxM_vA-1
Received: by mail-qt1-f198.google.com with SMTP id m88so17087177qtd.15
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 09:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7/CfPbqVwkBQNKsZsmfMjrcuU/QPk8UD5NZ/+SlLU2A=;
 b=cJOFAAWMELOWcR0Ku+9o8m8oruWq0N7Eh/Bl7KTeYWHbtK3v5nUrdB9lwvHaCMKZl6
 Ux/hkRZ42MTeqyDsBuLQQtLpX0CoxVMU/6fQjr8fz7QXLwEu9v8S7943yb4LmmKEXDTm
 UKXkIKd0DqQVAln/wtVIqZd6rBpnagSWitx72UoReTQorT4/hl74/V8cAF8/Km7e+sNE
 2nyJHEb71fKlKscOqgRRo6tt2vS0rhs/Qzjn2TJvLp3R685cw8mjpzhi7D8C/2+9uq+r
 BIb5rz66PPQSauDkAKmuelSGcav/C5Lbk9LSkQQxEGQiLWyn+ZGiB1Nn6ZKcwyNwsmx5
 aYcg==
X-Gm-Message-State: AOAM533c2SUvOBQaEu9kmCGfA7jumIxUnatqTmUWmNNVJUMw/Aprz5tH
 +0KHq9cv9/B0qrdeVRzEj+DkAURjbLa4PWgEmfpsES/byP9X1LrTJo6N9QOBM1ot6J8uLcEErwp
 b6OlqRRoaljCY
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr23269633qkg.326.1597855129219; 
 Wed, 19 Aug 2020 09:38:49 -0700 (PDT)
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr23269614qkg.326.1597855128969; 
 Wed, 19 Aug 2020 09:38:48 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id 2sm24545280qki.46.2020.08.19.09.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 09:38:48 -0700 (PDT)
Date: Wed, 19 Aug 2020 12:38:46 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v4 1/2] memory: Rename memory_region_notify_one to
 memory_region_notify_one_iommu
Message-ID: <20200819163846.GA305409@xz-x1>
References: <20200818130151.31678-1-eperezma@redhat.com>
 <20200818130151.31678-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200818130151.31678-2-eperezma@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: HqaLjgR9fECL

On Tue, Aug 18, 2020 at 03:01:50PM +0200, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

It would be good if there's some commit message, though..

Also, I'd slightly prefer memory_region_notify_iommu_one rather than one_iommu,
but I'm fine with either.

-- 
Peter Xu

