Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1574063lfc;
        Thu, 11 Jun 2020 09:23:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylbfVdJTtmYxKc6NbwX+6Ksc3HewJL4AvNZvs4BGqPVmtE8C4EBFZGjlHykF8hp+xEl6Qm
X-Received: by 2002:a25:73c3:: with SMTP id o186mr13811230ybc.230.1591892619906;
        Thu, 11 Jun 2020 09:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591892619; cv=none;
        d=google.com; s=arc-20160816;
        b=qZn+Z+m/e1g+1Na5jKdXZI+tq3PP8ZJ6LtHZBzUkA/N12+uu9weEAjacs40KPo7FMu
         vd9OM/84yISZK5GakycCXz0+N2/hmKet1y8dkDCt5GBWi7K9o2fDeNBgFlUuGsU42651
         v7N7UtaGAtBdn5CHdPFx2ev09koboBlIuJBoyHipz0DIb2Qtlmj6LaVxCbaF7N0FV354
         f0Radh3HqlyXb6S4lEDvv9Pjaj6HA1w4c70VK9b/OYmyPdMDHFbCMRBvKfG0Sti3fvMx
         +7G22n4idPyZmFHvWH0weSggzedwv7EsmMSSRqpBQS4vZmuzXZU6a185ahy3chL/XGLW
         9HiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b9hGE1kZUZvCbnSbzRYkY+Xwj8Z7keAHPfrl7Jr1YeY=;
        b=nD0LmjrktykJaG1JC8FIRpqJMRA8bWxzonkySZDTGAfLGM7mnjjdMt8RZqOzcHqQRw
         wODCCem60L/KqOjd4hfkjbaIGDu7Qqd0qZ7uIBb4ftGoj0EVJiBuDrRxLYioxkYgiIkY
         fUGh+50ii2NBc3TtANrMPcUnNHKfu7rqWA3C3OYgWD/9WaMFMIhF8MB0WSeNk8dZOW1x
         xIZaMlqv9n4qoD/VrM8nZBEQ4HLfYPLgR+5AHKJ7EqgIhyg8SmtusTGT/eluhRgg79Bn
         nW2WkrVxIsTORngNPUIdgi7IBXNnBy5NVd00NLuC3GJ8cVZhDn9+4d/YLGjfZXI4jwZs
         KvcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D2fbtrNM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si2931350ybl.37.2020.06.11.09.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 09:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D2fbtrNM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjPzP-0003hX-5P
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 12:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjPsQ-0002GV-JL
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:16:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58296
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjPsL-0004EF-3L
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591892180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9hGE1kZUZvCbnSbzRYkY+Xwj8Z7keAHPfrl7Jr1YeY=;
 b=D2fbtrNMOt8bYWpep6477EXLFJ5514MblM/sqUtf0DTSHD8JwxYradDez5aGxMkqsHEMvH
 u5kcDLV0STpjQUmCs2+N9dkW7tI3u9YZIhk/vNQi8j6/IU1Yg6NTtMUIW4YyTjoA5LWps5
 uXLvV21hibbRiZOuXmxNwXGgBIOKUS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-p7YAsd7tMVeMvrFtBMYn0w-1; Thu, 11 Jun 2020 12:16:18 -0400
X-MC-Unique: p7YAsd7tMVeMvrFtBMYn0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A301005512;
 Thu, 11 Jun 2020 16:16:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF11E10013C2;
 Thu, 11 Jun 2020 16:16:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH RESEND 9/9] hw/arm/smmuv3: Advertise SMMUv3.2 range
 invalidation
Date: Thu, 11 Jun 2020 18:15:00 +0200
Message-Id: <20200611161500.23580-10-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-1-eric.auger@redhat.com>
References: <20200611161500.23580-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SFUmD7ZKtdq8

Expose the RIL bit so that the guest driver uses range
invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 1 +
 hw/arm/smmuv3.c          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 5babf72f7d..4e7ec252ed 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -54,6 +54,7 @@ REG32(IDR1,                0x4)
 
 REG32(IDR2,                0x8)
 REG32(IDR3,                0xc)
+    FIELD(IDR3, RIL,          10, 1);
 REG32(IDR4,                0x10)
 REG32(IDR5,                0x14)
      FIELD(IDR5, OAS,         0, 3);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 4dff438809..78920f5158 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -254,6 +254,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
+
    /* 4K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
-- 
2.20.1

