Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp712335eje;
        Wed, 14 Feb 2024 03:17:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXla6FYPA2/h72nfaFkszM9Xuqoyak6zTx8qaUoBZt696X7VSLoCzzACn1IUvXLMzyDP+1Ls8gdwPl5iI16ewwm5mtGhG3
X-Google-Smtp-Source: AGHT+IGmZO6F7qDi2lDcud1F6GfgxMk7K7rLt990/SyWfALtx6Y6Ii7nyGojx5FvJBxX4qOvtgTi
X-Received: by 2002:ac8:47c2:0:b0:42c:7b97:da16 with SMTP id d2-20020ac847c2000000b0042c7b97da16mr1734430qtr.3.1707909457447;
        Wed, 14 Feb 2024 03:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707909457; cv=none;
        d=google.com; s=arc-20160816;
        b=TX4EPVdTaRvsS4hZhQZmeWn4iPnjRaHaOW50XNWQ6AQWSuFsDcpbjhHk1j5wbedP9u
         EyDoCUpYrozCIaieXdWXJ3itZNGrnxnZ0Epi03NQggB7FkxdwJ2eoFER7HaKgdUf0K/L
         65ZTIIdH8N92MUWx45ux7V7PoZR++/IdEr6E9WHq9jIAsiLFK+OWd6EdB6Qj4PQt6NeE
         YQUeveea4cSl6cA12UqrnBTm6Cm1X7lut+8HbcDueQPnY07IsPJvkvySK9q/wNdL/CAL
         Wi3jhH/acG4nu1Gm9EfB0W4VnTZg+NxXnFpDImKKyquBHfwoWT0YN+UU2RDkN1tZZqD2
         2S3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ZoIzxN4wtVZC8VE/mIbpxC6DW0nDJt+pWpq7gnJFkLU=;
        fh=bKI87bUznl6aiyAQlZULVpVLw46s8TN5U4ar3BAbiI8=;
        b=hymHhun9lq2JNjAo60NhF6Zm6SlYgW4oN2OIOhQylJ46+8BfOVUuSC21tvyDq5DL1P
         xmKc9nxvFUaUGOB2LhmiBbvtuRe3pbb+Mdz1WDDNH6WKUurZi7A38h2ASXtQZdjABLY+
         VJdbVHJpqc3g5lN4agTSFPLGgcc1tuZ0y1RRxXG4CAud0webZBZgKCIpYD8SMISpIsbo
         azjbLdsf9Z3lMjUawGOZeY5RVQafxtVwxDnJEHYz4v+qj7DN5wXrzSRpmHbqgD9ljhAR
         jRIRBjFMU6EJct+q8xxvxqJmbkXjMRf1pU0TpTFKVTMFRznCZdjpVVvdEkuWlWk0L6t0
         7ajg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JK97LMxc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCWQSeMzKpjkWfUFBPH6+UUv8jyytEE8R0QMl/CKry3TIBMKLCIvbdqoK+xMBQR8s4SHELQWIwYSlP8lvTchUpOyKbRcQvY/
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020ac85c15000000b0042c798aa03fsi5472519qti.112.2024.02.14.03.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 03:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JK97LMxc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raDEl-0004Ml-Qr; Wed, 14 Feb 2024 06:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1raDET-000426-NR
 for qemu-arm@nongnu.org; Wed, 14 Feb 2024 06:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1raDEP-0007CO-G3
 for qemu-arm@nongnu.org; Wed, 14 Feb 2024 06:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707909312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZoIzxN4wtVZC8VE/mIbpxC6DW0nDJt+pWpq7gnJFkLU=;
 b=JK97LMxcNUYXwesjQVo0PoosMvBpwcR11QS9oD+WWT9iPAE/Ykj4/etHTbMG9e5Tu12h1v
 eCox8xWdRWMtrrdhm00vxLAKViNyp5Ys4TA8r4APzNQT0cdzO9gZMj+gZfWFAiq3tLHNY1
 PhGmdU8mB+l7+2EJvSV6/l77WitC+XE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-8_IqdrryO--wfN0VQyIQrA-1; Wed, 14 Feb 2024 06:15:11 -0500
X-MC-Unique: 8_IqdrryO--wfN0VQyIQrA-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-560127ce17fso2751648a12.0
 for <qemu-arm@nongnu.org>; Wed, 14 Feb 2024 03:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707909310; x=1708514110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZoIzxN4wtVZC8VE/mIbpxC6DW0nDJt+pWpq7gnJFkLU=;
 b=HqdqqZhoSbWWJx8c4zgiNlXXkV9F7lftacXbWbgj2iR8lj76ndwEs0pr/yrEq6WNSF
 xcU8gCQPUOVHklhhwwa9mshTUMulOioVrM5RP+N6W4K8zsknfD+K0Dp6taba8v0kYYpN
 ZWEN43u/Uiv3Yjsa6Ob0kR/hi5Z/nEXmXh4fFDd05fd6KlifCJ3UR8vQNqeiFzrCaioo
 WpEOAzzNy/D6aN/awJ4kk4iVuzZEd5ajHv5CPJOmhYi10dD8vfHYOfAuzMuV1BKeLbxj
 /i3IPRn1uRGjbKYu9AIR0BVYbKckREZOtQk8Fc21Bg2Wn+bh+bzCtfTroiqIpkny8y+J
 bcjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt/ujCCxiI4TQqBisC5T2NWI/1jsOL1GuHZcZGkQuhyu9y0QQ+JVMyKK92xlotv/p++bTVGI8FPss7hd65hQbZXT5I
X-Gm-Message-State: AOJu0YxQ2+ugH4y/YKfum8ANiAq6liXGnjK2oiTFEwjB26iCAxMCwTqp
 vzg7EOcmE2mxiwDKtcV3mssJma1RBGGb45unhHAQEeINFu1X2TW+kky2geG+GnDEWXa1SzZB5/1
 TcBQZ0rmF4PTgad9titVJqS2dHhrVq27/v4Kbfzap/8Wtmql/bw==
X-Received: by 2002:aa7:da0a:0:b0:55f:fba9:de8c with SMTP id
 r10-20020aa7da0a000000b0055ffba9de8cmr1705429eds.21.1707909310011; 
 Wed, 14 Feb 2024 03:15:10 -0800 (PST)
X-Received: by 2002:aa7:da0a:0:b0:55f:fba9:de8c with SMTP id
 r10-20020aa7da0a000000b0055ffba9de8cmr1705417eds.21.1707909309829; 
 Wed, 14 Feb 2024 03:15:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Fc1dZC9nuJ3DOptBHrZF/BOPp2m65fqkjj9dDxnAFgLD49vdYbYqBeQ7NPghzf/G62ZSSJPw7Ux+a4RNb7PUGWDgXmjyPCKb7fiF8Mjx6cy+ecqr5bwoxmHu0KFPr8JSzWBKJlz9bMGHhUWXjJeCSEC3xg==
Received: from redhat.com ([2.52.26.67]) by smtp.gmail.com with ESMTPSA id
 ca13-20020aa7cd6d000000b005638af177aesm171512edb.53.2024.02.14.03.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:15:09 -0800 (PST)
Date: Wed, 14 Feb 2024 06:15:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 36/60] smmu: Clear SMMUPciBus pointer cache when system reset
Message-ID: <8a6b3f4dc95a064e88adaca86374108da0ecb38d.1707909001.git.mst@redhat.com>
References: <cover.1707909001.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1707909001.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ruRHwp6jda+b

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

s->smmu_pcibus_by_bus_num is a SMMUPciBus pointer cache indexed
by bus number, bus number may not always be a fixed value,
i.e., guest reboot to different kernel which set bus number with
different algorithm.

This could lead to smmu_iommu_mr() providing the wrong iommu MR.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20240125073706.339369-3-zhenzhong.duan@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/smmu-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 9a8ac45431..f58261bb81 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -675,6 +675,8 @@ static void smmu_base_reset_hold(Object *obj)
 {
     SMMUState *s = ARM_SMMU(obj);
 
+    memset(s->smmu_pcibus_by_bus_num, 0, sizeof(s->smmu_pcibus_by_bus_num));
+
     g_hash_table_remove_all(s->configs);
     g_hash_table_remove_all(s->iotlb);
 }
-- 
MST

