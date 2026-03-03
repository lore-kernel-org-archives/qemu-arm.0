Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1BEEC1444
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 13:50:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxQ8s-0006y3-Qv; Tue, 03 Mar 2026 08:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vxQ8k-0006pM-Ih
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 08:50:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vxQ8i-00034e-6X
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 08:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772545818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AdqA/kmjpsE3VC0ENsT1VKsbar2/DNF3vL+6YVM6Xzg=;
 b=ay6yG2qzFdo0QGxe2++fBBY4+HOOsyY7U2Pb45unlhgJ9yYOcbnXcd9R0G9aImZOI9kITy
 WTAr6u2jBuhzU6+rfg4kDjkql6kRCUCWCZ1r201REQl1UcfnxmEzPACeHAOIKH0hCW2VbO
 bYuatLeSeRAJRQ17S4TcHcQyiWi2vcY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-_m6YFQwDPX-ZKoy3lJk9sQ-1; Tue, 03 Mar 2026 08:50:15 -0500
X-MC-Unique: _m6YFQwDPX-ZKoy3lJk9sQ-1
X-Mimecast-MFC-AGG-ID: _m6YFQwDPX-ZKoy3lJk9sQ_1772545815
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50620483ff6so495345531cf.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 05:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772545815; x=1773150615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AdqA/kmjpsE3VC0ENsT1VKsbar2/DNF3vL+6YVM6Xzg=;
 b=rOuMogSCvkxc7uYsybKAlmEU0PYsKIM+x8LB4kbmXA83KNrVHH3rMMr36ilNwdKmIp
 LK+GRfS96vAE88oYrk7CNYrbSX1/JDd4cfcMUBhTFk/o0NW1VOJWdBXGK3ByeLmYSquD
 AtvhNkJSxttPOWmVFIo9asjFnvo2LKrvVmwYphl78iAuLTvZrnEvPCxiN75HOEn9zCrf
 fbW1TtVDybIsNHiO1fY7soz3VBPnvWS9dVK9oK1D/dknI7rJGzekFhirZQK04oS3WyyE
 DXcti/jbIRdbdZN46Cw9zU4qHQ9DbCkZzkJaYbJtHJP10+W15jzi3RmvSq+GM7l90+MS
 qxcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbNN3b7V9PzQ0TaF1Si2rq36aQTiZ8o5gtt/SKcchbuLwUOLaYJunxzWOYlJ7lV4fHzaLjWGEA8w==@nongnu.org
X-Gm-Message-State: AOJu0Yzg0MZM30/oy0W5SA7EYSh3Z5NkYV+pzGDmqoT5ibqMMVUzyACU
 qHLLLHYH8DT+ZcrjYaqeA6bT0k/CGzrsLH531Kj+nNdOqJ7CJ44rifqGTq2BnVsRbySp4lKEhtC
 M6n7UM/pd6W40DVMISpNCj0ztaBcvICsN7BjW2olc+mkukVPkfLm9gQ==
X-Gm-Gg: ATEYQzw7TY4hI2y5TETnEnxB+z82iw2q3wEH0IuBcHoEIDZB4qMyW/mQoQ8NHiEpTzu
 C4DnX+hgFOiDrBmy8QXJ1d2kej/wqZ1de/8xDw9zx8GV4ys+FSAr9dsMlLhNNvrmEa3kCCvGWHy
 TjiD4HTFrYkyh1IseKbc8SkGGtLCTM9viSsyF4UAUOaE4kARCCm5xfXp7A6o2NDIr3EvdkQGfsB
 ePEGnqAdz29h9S+nEK32QCS0XdypynQt72I5JIrIDjMKgogzabHEZlprHKUx8gVQKYIQMqYarHq
 EQvEKBXkUD0qDZq53Gc7LznxYFbv0OAG8byKj+LJ+YnG5WSaQGATJtx8Nk9I/BaQKNw+G1FAfhJ
 KITHQNAxPHMXhqA==
X-Received: by 2002:a05:622a:138d:b0:506:6e65:2334 with SMTP id
 d75a77b69052e-50752884908mr176471081cf.7.1772545814636; 
 Tue, 03 Mar 2026 05:50:14 -0800 (PST)
X-Received: by 2002:a05:622a:138d:b0:506:6e65:2334 with SMTP id
 d75a77b69052e-50752884908mr176470761cf.7.1772545814122; 
 Tue, 03 Mar 2026 05:50:14 -0800 (PST)
Received: from x1.local ([174.91.117.149]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-507449add38sm132020941cf.13.2026.03.03.05.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:50:13 -0800 (PST)
Date: Tue, 3 Mar 2026 08:50:02 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, sebott@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH 1/5] vmstate: Introduce VMSTATE_VARRAY_INT32_ALLOC
Message-ID: <aabnCoT3Wp6L_ZuJ@x1.local>
References: <20260226100232.500781-1-eric.auger@redhat.com>
 <20260226100232.500781-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260226100232.500781-2-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f9Wp1NtcrwlSDQNGWXFEfDJQyh30CvL44PqQLu77z7s_1772545815
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Feb 26, 2026 at 11:01:29AM +0100, Eric Auger wrote:
> Already existing VMSTATE_VARRAY_INT32 requires an array to be
> pre-allocated, however there are cases when the size is not known in
> advance and there is no real need to enforce it.
> 
> Introduce VMSTATE_VARRAY_INT32_ALLOC as we currently have for UINT32
> and UINT16.
> 
> The first user of this variant will be the target/arm/machine.c cpreg
> indexes/values arrays.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


