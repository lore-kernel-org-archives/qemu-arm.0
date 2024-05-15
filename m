Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp964015ejl;
        Wed, 15 May 2024 15:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7X84qDVGhNm9pyotvejaS9UsBgLvjfWWI66kkvgDh1RAmFHeSaojdEGZDjbI6myOXH4kAlBJNBqRqdl82HH5bbBk+8uDj
X-Google-Smtp-Source: AGHT+IFUC/9shDkrMA/SM32mURBxwEpaYqgmRhb42uU/x+5GraajvN7UEdtwoMb8q34JfWwQrkv7
X-Received: by 2002:a05:620a:4ad2:b0:792:fe50:33af with SMTP id af79cd13be357-792fe503626mr225650085a.63.1715810550463;
        Wed, 15 May 2024 15:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715810550; cv=none;
        d=google.com; s=arc-20160816;
        b=Knk3nhI88cO9/yNniEkjkDT2zU42mN+St0niXoirx2iZ5dPUX3gP9k1qlgDPn/Le6i
         FmBGOA583++KDwOPJdZDGIH1w23uBgzAUuDshV0/MTNFe+3tZ3GNA6FeHKN4zpkMch9h
         5vgx32/m0JL2lUdCtJ6HGaUbnuOaqtoAzA0NEh0QXRhQpBOIAhruHKo2jJ1IF73dY6Zj
         rlmt7OHSurK4opCxR+tQ2RAqQb1hG1o58b2QvBF0F2je3YcT6p+Drf9dFPyO32KUM5lJ
         XgR9FNZBtq8qLaMOa4al4NVxZ0hdU0v+UzBHgNvH+zH4c4Bxdz5rd3zQlbz3rZcNrFQ5
         s3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=xElT5ZYqp5D7rh3ZWiAAfUyWXd6KJ/0bkqeudsbUmic=;
        fh=gUzTq4tolmFW3Q+fOqmLxnoFbDg61iXA0WxRZYlF3dM=;
        b=CUol+BEZPWszCDodBeF+2x7FuRjHTI/KUh/wAsLg6W9T1rqfV30oecq+8Li1kj18Lo
         TyfSu8/VXsak+DNbXuoAVkN7NY+UHRN7qhScdvnnSrkbIn9XiSZScExyswzvYTjaiwVj
         5yQMg29K68/3JDfYqrQazNDTnSLwk8RLTBR36fDG6zoiMhqZP1OozdjyWlPGQlRJnCEF
         BuZfHLM3vIU/NdwSgzAEj1lH13QLGnHXLHQm5DQtIFsulNjlXNxlo6MJNkk+4ooYHDnx
         qmaASi89PdDcLnxPUX47P+Pk0pZiVVrTEussG9Qa3KomaJB8quN5ihfdZYinWvVz3a8R
         DLeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkImwTG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf2772a1si1491416485a.58.2024.05.15.15.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 15:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkImwTG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7Mha-0006zZ-0M; Wed, 15 May 2024 18:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s7MhY-0006zR-P7
 for qemu-arm@nongnu.org; Wed, 15 May 2024 18:02:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s7MhW-0007pm-7G
 for qemu-arm@nongnu.org; Wed, 15 May 2024 18:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715810536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xElT5ZYqp5D7rh3ZWiAAfUyWXd6KJ/0bkqeudsbUmic=;
 b=IkImwTG5yUs7BOtJAqGGqKm2u9vhJqfjyWJjh7sbGqh53o3PbJOAzL3MxlWUtQ5I9BoYZE
 ngH5NdgBGwFhccar0ARDVC0C/lryVU6+xnxueHqV4sKP82oCQbCs0jyR03aukGLdgPOapY
 zNuSWkJpDU/uasl22hWbNHMSIvPrx0E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-szJL2G12NLSR8bEtI2_vzQ-1; Wed, 15 May 2024 18:02:14 -0400
X-MC-Unique: szJL2G12NLSR8bEtI2_vzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-41fe6df6ef3so29032925e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 15:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715810533; x=1716415333;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xElT5ZYqp5D7rh3ZWiAAfUyWXd6KJ/0bkqeudsbUmic=;
 b=F62ZcNNXIMPX7xGAISDvgZB+eqzHfNVRUwg7Pya12MpaHcxraCYi+sADQeM+pE6zY1
 vknVgzrgF63tI4Nz2PfXBb2rLXBTLE7adKAFojqzKtEfK+XcKt0hUUa8/k7NjMtr/dLY
 1n6/H6B2QgtnHoitdJSPueNvIKyTTKLl9y0Byn9m+naoRUgetBaWVe3Sipz53uyqE7As
 X7DSN4idTSDLozgPOsC7vNzFRIIzZnfcVFbdQyiv4luw6oMjyGxGXy6r/o1MpV1y7Plw
 xScDDMKHIfh3v4bSeOxJYHFz0ANlw90lGhmbZhwajFT6kZwNzRWjuFS4hYc3cGwSW8+P
 Ga1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDJKR/UrxAeCTAhoPii5/DymmoUVC0P3QGzQ9In7zgosp5t2KrxOin4jEJYrl9oUJBFNxkAKMdkFDqr7CEmMsQ2aMt
X-Gm-Message-State: AOJu0Yx1Qk2z0IeMB4V17btggtuRbe4n4GJZam94N4qFUmzoEn3Y2Hbt
 nC0QA1PDJEu1PEqGV3hoAjD+GhbkrA1VjbMRcnAtCbf8nkscI1PGRTdK9sWCMCaxqBwaSo/WQk9
 ND0KC5jnOFSotMag4GUCl59gCT5H7fBE8dfvR3MRgFjv2SmoXtQ==
X-Received: by 2002:a05:600c:444c:b0:41c:83aa:18b7 with SMTP id
 5b1f17b1804b1-41fead6d1c8mr117537305e9.33.1715810533171; 
 Wed, 15 May 2024 15:02:13 -0700 (PDT)
X-Received: by 2002:a05:600c:444c:b0:41c:83aa:18b7 with SMTP id
 5b1f17b1804b1-41fead6d1c8mr117537055e9.33.1715810532546; 
 Wed, 15 May 2024 15:02:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:443:357d:1f98:7ef8:1117:f7bb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe8f9bsm248654525e9.6.2024.05.15.15.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 15:02:11 -0700 (PDT)
Date: Wed, 15 May 2024 18:02:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 5/5] virtio-gpu: fix v2 migration
Message-ID: <20240515175905-mutt-send-email-mst@kernel.org>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
 <20240515120104-mutt-send-email-mst@kernel.org>
 <ZkTjZCTwIbkZIVZd@x1n>
MIME-Version: 1.0
In-Reply-To: <ZkTjZCTwIbkZIVZd@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vLy3vjaxYaH+

On Wed, May 15, 2024 at 10:31:32AM -0600, Peter Xu wrote:
> On Wed, May 15, 2024 at 12:02:49PM -0400, Michael S. Tsirkin wrote:
> > On Wed, May 15, 2024 at 06:15:56PM +0400, marcandre.lureau@redhat.com wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > 
> > > Commit dfcf74fa ("virtio-gpu: fix scanout migration post-load") broke
> > > forward/backward version migration. Versioning of nested VMSD structures
> > > is not straightforward, as the wire format doesn't have nested
> > > structures versions.
> > > 
> > > Use the previously introduced check_machine_version() function as a
> > > field test to ensure proper saving/loading based on the machine version.
> > > The VMSD.version is irrelevant now.
> > > 
> > > Fixes: dfcf74fa ("virtio-gpu: fix scanout migration post-load")
> > > Suggested-by: Peter Xu <peterx@redhat.com>
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > 
> > I don't get it. Our standard way to do it is:
> > - add a property (begin name with x- so we don't commit to an API)
> > - set from compat machinery
> > - test property value in VMSTATE macros
> > 
> > Big advantage is, it works well with any downstreams
> > which pick any properties they like.
> > Why is this not a good fit here?
> 
> I think it'll simplify upstream to avoid introducing one new field + one
> new property for each of such protocol change, which fundamentally are the
> same thing.  But it's indeed a good point that such helper can slightly
> complicate the backport a bit.. I assume a global replacement of versions
> over the helper will be needed after downstream settles on how to map
> downstream MCs to upstream's.
> 
> Thanks,

There's nothing special about this specific code. If we want to rework
how machine compat is handled we can do it, but I wouldn't start with
this virtio gpu bug.

It's a big if though, I don't like how this patch works at all.

-- 
MST

