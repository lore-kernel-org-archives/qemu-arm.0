Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5583302lfg;
        Wed, 3 Mar 2021 10:31:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyfvQeOf5tYZIybd3z1SAH4YX8wuKAOdUBOnoJyUgWJE3SIeTwDWMlPiaZieXVFb3mjKLM
X-Received: by 2002:a92:ce4c:: with SMTP id a12mr576757ilr.258.1614796306965;
        Wed, 03 Mar 2021 10:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796306; cv=none;
        d=google.com; s=arc-20160816;
        b=g2ogRCBs+sBOokcQ2nzQTYX6WeoFZNNGA/LOQrPELcak71ZPKZ/nlccp4VFX0qm924
         vepONdfbbtsJPrpoeZC4X3UOQSZLsYgQ2q4U1BfGZQ6Oko0wWSNTGFDTasUl3kfGgdee
         PIPbXtrwWJsN7kd6jjuZmgX26CHtMAls3+4wGYB06lrUkuu4Yuhs3dQl0dFiPk/CVWqo
         saK2NTX/EaodQ4zrzmQ8ei6MylCiEV/B0bsNtC08Z4DAjV6rOvlWmxBwP7cXFgtVkZRA
         XBLjXVUImQDgt0dTMXsweBLzSMdlkXWT1BATSwvhweVFCeNG/qVsQvYTrHMDD5fZUeLs
         AyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3WOU0ObUPkLYlvbEIzar57F9vUZTGCF79gCYDqtyU50=;
        b=BFf/Wkybevmho/h4hS3kEI/kFpXKBVluNDeyo0E9zF7nQALgtvrojr1XuKDjbWncJl
         X5q/X8bqqzuzQHYTzfO08znAEpanfdWCoLjRhq+jWZ4TtKiUpMkHVbtPANq9MXt94T18
         G9+g3dHGYcIDjg0hng5l9tHKvrddT58hdb+W0NAeth95+9uhp9bSOlEcNoGE0jnsKYPM
         YOaYSlkDRzGTsIA/bmK3eXwrD3JIsA/wJf2X4i2yWu+YGO0+aNGnFSNPxJr/f6EZjyTM
         wIMNAXYSQhayS9rnIBgmW787P++c0iszxeVBEG1D7wR13XJlWXhBFdKhnXum20PKn/Fb
         iseA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d1VEViNY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si9512630iop.79.2021.03.03.10.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d1VEViNY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWHi-0001M4-8J
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9B-0005HI-7h
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW97-0000W7-KH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WOU0ObUPkLYlvbEIzar57F9vUZTGCF79gCYDqtyU50=;
 b=d1VEViNY6/wGgCbeExondXtj6gt2w3Q+bXqTqBc1TprqTfmYQQRKlYd05rqqkm7ppA8uWS
 uqBk5n0O/S/L9wn+dgupYIntqbowfvYw3TdlESiS9zdkWI2ivCrGMWa7Aqp1UZFs1kFk7k
 bj/0yKXFtKNlGPHCk5DZSAgImbyFjR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-R-e1eo19PlmdGtMVfTcS7w-1; Wed, 03 Mar 2021 13:22:51 -0500
X-MC-Unique: R-e1eo19PlmdGtMVfTcS7w-1
Received: by mail-wm1-f72.google.com with SMTP id s192so3392581wme.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WOU0ObUPkLYlvbEIzar57F9vUZTGCF79gCYDqtyU50=;
 b=I64oCYxW8IY2lqgRME3GD8AHFSJA6rJn2f5YJMCHNhn6giGB7kQSXVA669B3CqDtY9
 KbH1qxlSLJybZ67T/MbpnjUVJSmy4gy+y+skhcR1M+KD4PMSaBLZxtLWP0VnY4WfHjsD
 MhzigQNySN+sRMADwn5jqyCMby9vhejZLKVM/OUddKL9FEGjkrtrbYiFGjKgmbE5frMz
 F5CdXAvXcbz0pQVoA6/fkNhTVa9wN+dCOaoq/W7P0lli3svInNbODFhbDqm+1sBIpMZN
 wJmqVQQTR3i9Q3EnJiqv0u2dXq/V9ODIKYVhRdVy1ei+0KDV8svhFr7gnQq17IujY1BH
 jvlg==
X-Gm-Message-State: AOAM532VeyuKw2gAI39szJ/gnh8qbyBvvt4EDCGxNy3u8O2oI1lHud0d
 A2rF8Ec437dhshUamWq196gyz6Azhy8Wy4bV+Df2m0QO4bIHqpCKmBStBkIV7CWM2lAjdMO7VXg
 07H6O6/0k07Q/imm1ApeVdxttPJaeMKWJBGJY32WkCdI0CJl4VdukEcf93T4HFovi
X-Received: by 2002:adf:fe01:: with SMTP id n1mr28570488wrr.341.1614795770243; 
 Wed, 03 Mar 2021 10:22:50 -0800 (PST)
X-Received: by 2002:adf:fe01:: with SMTP id n1mr28570454wrr.341.1614795770019; 
 Wed, 03 Mar 2021 10:22:50 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a198sm6785613wmd.11.2021.03.03.10.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/19] cpu: Croup accelerator-specific fields altogether
Date: Wed,  3 Mar 2021 19:22:04 +0100
Message-Id: <20210303182219.1631042-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QrGc2j1iSWy/

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..074199ce73c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -393,10 +393,6 @@ struct CPUState {
      */
     uintptr_t mem_io_pc;
 
-    int kvm_fd;
-    struct KVMState *kvm_state;
-    struct kvm_run *kvm_run;
-
     /* Used for events with 'vcpu' and *without* the 'disabled' properties */
     DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
     DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
@@ -416,6 +412,12 @@ struct CPUState {
     uint32_t can_do_io;
     int32_t exception_index;
 
+    /* Accelerator-specific fields. */
+    int kvm_fd;
+    struct KVMState *kvm_state;
+    struct kvm_run *kvm_run;
+    struct hax_vcpu_state *hax_vcpu;
+    int hvf_fd;
     /* shared by kvm, hax and hvf */
     bool vcpu_dirty;
 
@@ -426,10 +428,6 @@ struct CPUState {
 
     bool ignore_memory_transaction_failures;
 
-    struct hax_vcpu_state *hax_vcpu;
-
-    int hvf_fd;
-
     /* track IOMMUs whose translations we've cached in the TCG TLB */
     GArray *iommu_notifiers;
 };
-- 
2.26.2

