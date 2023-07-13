Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3096819eje;
        Wed, 12 Jul 2023 22:47:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGi2AZBd3PNcwb3k92h1rBpGQWZpo8i9vNN0YQ7jhagEB4eLe4Nx4k2k91hLzjovSeF0VvN
X-Received: by 2002:a05:620a:408e:b0:766:77bb:8989 with SMTP id f14-20020a05620a408e00b0076677bb8989mr1024616qko.0.1689227242516;
        Wed, 12 Jul 2023 22:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689227242; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+gxACPoHv1KcjcsHONIkdzW7QfgKE8jFsYiSVg2ncmRPEMgPU2yu3HPXImTbIo69j
         PmHjqntYDf4jGy6x5h7vi9Wd4VD52KSBtXxzAnNmUl22vn3lZ/1hjyMd4W58mxaczQw7
         jW2i+iEntfNYDuismtqhtz7wFnXbrBtBa12H29GXEXOgCu8T7Mt1WKahCYQ195zSJPe6
         esOW0StyvMoocrrtvBIRHHVq6Jl3AME7weKv+2pOXmHXdTfjYsxBB2EgtE/Sdz5o08QE
         /vzI+l3EhoT3Wq5t2Sd2LWdtyRVfbtCiSgQsIMVm/EclaSQDS5QYuBfCdrjGaWaUZ3Yb
         h5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b7/M09j6+JvuS1+idsB/slCvA7ztltwHYrvijN9pjK8=;
        fh=HG7+8NG+gFyTR0uRZiWeu4GDRUTSvE55u2ps4eGUrf0=;
        b=EuoTkAlacmSdiH20TFU1JaArJ0FBvMoUoS871wNk6U3mnpNFcDHltrOYnCaBsdkBov
         mJQ7hIHwyIKxPcep0140IhpFk4M7p5M2Gg63l76uOExdgTXYz4mzdxM5d5LqryW6lCOJ
         DcUDzGGwsC80faUP2ES1UcedZwKC6WmHYYslJfwH4HR7wcmPzPq3djCkB2TmrGQhaR0/
         AyShnwXe0aTTAzUMThCtwcLeIZfCcYHJiVQ0AzfBbv+j5HBVQ+wUlUN6SV0AMaaUrWUO
         LXH4aKztpcSb9NmX4SKRCVmRHXebsdBgjhuxTY+cRByGyeBsSzOicV721O54J49aZLuR
         bfdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oo7+u9sK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a378704000000b00767cc0e1e96si2571055qkd.268.2023.07.12.22.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 22:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oo7+u9sK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJp9k-0007k8-Hn; Thu, 13 Jul 2023 01:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJp9S-0007gu-R4
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 01:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJp9Q-0001VP-RA
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 01:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689227164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7/M09j6+JvuS1+idsB/slCvA7ztltwHYrvijN9pjK8=;
 b=Oo7+u9sK+m+PvbqH2S5ojnRhUQVvaJkElKjWul5Z10XBYtIWgAXmoo+bKEc34T8hSIHq+S
 Cfy1Md2gpTIKfcgijs42isFdTFg8chJv0Vp6/kInBHUiBCqY+qZ53mkxfW/OmoXIS/d51s
 Z/wuMRI4Vn/G/6UHSSDawm0cfnOwC0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-ge9Y65ZVN9CPR4MogL8R6w-1; Thu, 13 Jul 2023 01:45:59 -0400
X-MC-Unique: ge9Y65ZVN9CPR4MogL8R6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0AB88F2981;
 Thu, 13 Jul 2023 05:45:58 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9A0111DCE0;
 Thu, 13 Jul 2023 05:45:55 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: [PATCH 3/3] hw/arm/virt: Support host CPU type only when KVM or HVF
 is configured
Date: Thu, 13 Jul 2023 15:45:02 +1000
Message-ID: <20230713054502.410911-4-gshan@redhat.com>
In-Reply-To: <20230713054502.410911-1-gshan@redhat.com>
References: <20230713054502.410911-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PXNujOY0qsHW

The CPU type 'host-arm-cpu' class won't be registered until KVM or
HVF is configured in target/arm/cpu64.c. Support the corresponding
CPU type only when KVM or HVF is configured.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 43d7772ffd..ad28634445 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -217,7 +217,9 @@ static const char *valid_cpu_types[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
     NULL
 };
-- 
2.41.0

