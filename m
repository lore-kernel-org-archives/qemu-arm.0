Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3771348wrb;
        Tue, 9 Jul 2019 07:39:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPXeLUNbBrYCLtCPRbdYwnnu39sRDfiItJl7q1aMbzvqe4rFbPtCNk8BRiQdL7r0+8qilY
X-Received: by 2002:a05:6402:683:: with SMTP id f3mr24135785edy.200.1562683187540;
        Tue, 09 Jul 2019 07:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562683187; cv=none;
        d=google.com; s=arc-20160816;
        b=WHt9BJwn7lrHekPi3WUJNiM3pnVwy4wljonOG6oC3chExaF+FQa+Tn2zTX5cAX3ZRJ
         rtXKaHmMB/dkRrU1n3eg56hlNnfrsu5wXLQuzo/WgATpEJ9R32IZgWkBCV3yphQJu92b
         UF5GPebamfRA3Pp+Wjt8hsgDk5Cd/DvHB9SUPEs/dN9I/NwcyLtg1VI9g3aLsO3B8ZLG
         MilTEdD2fdysFO+85EfpcFW+lHoxp6JAEz0hr7cKk/cQNAptLpixG4C/H2VjdBtr/VZc
         iQn5/w6Nqc/QENgNbSyROpTgFDxI9nycjbUl10brDjZPDoXwmxBhUKEm8wZFZEs2EllL
         wRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=iAbNxK9f4lkz6dU2zy38fJVIP/bjB5B1QuO7iWshhXY=;
        b=QhT/tRLZnthC4igyoJ3nwaAGNsRJYxlUJ0cgrfX4grBbtzma2L8Dt2SLzTmVgqpExK
         cYwX4Jw6QyQIj2+WE4n5tzRt469uaZDA7Ff8pAWC66aZNijgz5yOfL8u5f7hcHxFWXSR
         dlVn1n6X8HVywITEvbIEPd9zxxhQE4VC7FSYyJSxR3r9drkBMkuAr93dwyxWGKpz9/yh
         i+jjnSclanDAkUkSK3UoJW+FQS1KXlUTI6CK4lYzIWtwWG8qra9N6kuz53W7K4wLHKg1
         aoUMXTDHlHDg/8ZpOT+frYHsSLb42/V6qssa3G+ZatTxRJKAYUyITvHbO4qie8OVi+NE
         ml0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HKUcxsKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r51si10248481eda.28.2019.07.09.07.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 07:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HKUcxsKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkrHW-00053C-Kx
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 10:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33517)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hkrHJ-00050t-Cn
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 10:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hkrHF-0000Yf-FH
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 10:39:31 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hkrH7-0000UI-4t
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 10:39:24 -0400
Received: by mail-wr1-x441.google.com with SMTP id r1so14982072wrl.7
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2019 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAbNxK9f4lkz6dU2zy38fJVIP/bjB5B1QuO7iWshhXY=;
 b=HKUcxsKFMc030lAegtqLfHQuHMH2YuM/3ZR63iqOltueU34Eubh1+dmZ0aHqR9swXs
 yzRQmvaHcRdg4Xahz5I7ZdQO+H1uvXUWN47UQUkvd+PUnxsnMRlWQ9FvZ+gE5ICGSJp2
 a2ud6Thp2yzpaXHms7VADdlqGwUJCTWrX7hZv3FNdXgQx4MBtpJX011oJztftH7Eg5VP
 JgBY+PCu8y3okm27sSVmlG/n19eNFoo2dinCbgiBpcW9u10cItfJYsDLPHmWHbo1/ARO
 6DRgcFkxVEwZYuKc3YIHB+6X1zyGSKXbFN2v9UiRJAaZFG5KgS6Iy1pT3zGJiiV3bvW9
 Vtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iAbNxK9f4lkz6dU2zy38fJVIP/bjB5B1QuO7iWshhXY=;
 b=lkmny+mjeovcfU2i1IkcuW9Gd9tfdyM2OijKYw9pmfKNFKIxRylEC9r2L7pv6J1OBC
 w8yV5fBb47xRrgnwOEaw1uj0jhxQbnXcysF5V8MSq+8zYmvKV5Z0GwyVf0uWRwwaW6tk
 DzH8/B6D2imqbSAU5aMjAyWX/Ml/pveTONKfmJcn92Z+yjo8fD44hwFCTveTzZMEjJFM
 Om7lMA3Z9c49fy8TaHb0x9cUgPs/k5CnIfXPh9gqI10FIX2k6oIL9OiDhW0jvcNsqcPH
 FtFGCtUcJFoA4etYLqgjTsWzwpHZLXthPdq0hF5FpmMHpNljrUq8FopWEbwUglvewSmf
 EOeg==
X-Gm-Message-State: APjAAAVQ2uuU7s5MAFXU4epeGBOeRWytlo0owXChFjgyBdWvdCqC16AB
 jLPEwPnL1uSqfn4Z0XGzLpu1x1PNEaCjuw==
X-Received: by 2002:adf:ca0f:: with SMTP id o15mr25764697wrh.135.1562683154678; 
 Tue, 09 Jul 2019 07:39:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o4sm2940122wmh.35.2019.07.09.07.39.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 07:39:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 15:39:12 +0100
Message-Id: <20190709143912.28905-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH for-4.1] pl031: Correctly migrate state when
 using -rtc clock=host
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Russell King <rmk@armlinux.org.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EKwGUqGHM0S0

The PL031 RTC tracks the difference between the guest RTC
and the host RTC using a tick_offset field. For migration,
however, we currently always migrate the offset between
the guest and the vm_clock, even if the RTC clock is not
the same as the vm_clock; this was an attempt to retain
migration backwards compatibility.

Unfortunately this results in the RTC behaving oddly across
a VM state save and restore -- since the VM clock stands still
across save-then-restore, regardless of how much real world
time has elapsed, the guest RTC ends up out of sync with the
host RTC in the restored VM.

Fix this by migrating the raw tick_offset. To retain migration
compatibility as far as possible, we have a new property
migrate-tick-offset; by default this is 'true' and we will
migrate the true tick offset in a new subsection; if the
incoming data has no subsection we fall back to the old
vm_clock-based offset information, so old->new migration
compatibility is preserved. For complete new->old migration
compatibility, the property is set to 'false' for 4.0 and
earlier machine types (this will only affect 'virt-4.0'
and below, as none of the other pl031-using machines are
versioned).

Reported-by: Russell King <rmk@armlinux.org.uk>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think this is correct, and it makes the "rtc clock should
not stay still across a save/reload" work, but I feel like
there might be some subtlety I've missed here. Review
definitely needed...

 include/hw/timer/pl031.h |  2 +
 hw/core/machine.c        |  1 +
 hw/timer/pl031.c         | 92 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 91 insertions(+), 4 deletions(-)

diff --git a/include/hw/timer/pl031.h b/include/hw/timer/pl031.h
index 8857c24ca5d..8c3f555ee28 100644
--- a/include/hw/timer/pl031.h
+++ b/include/hw/timer/pl031.h
@@ -33,6 +33,8 @@ typedef struct PL031State {
      */
     uint32_t tick_offset_vmstate;
     uint32_t tick_offset;
+    bool tick_offset_migrated;
+    bool migrate_tick_offset;
 
     uint32_t mr;
     uint32_t lr;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2be19ec0cd5..37a1111da1d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,6 +34,7 @@ GlobalProperty hw_compat_4_0[] = {
     { "virtio-vga",     "edid", "false" },
     { "virtio-gpu-pci", "edid", "false" },
     { "virtio-device", "use-started", "false" },
+    { "pl031", "migrate-tick-offset", "false" },
 };
 const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
 
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 3378084f4a8..1a7e2ee06b3 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -199,29 +199,94 @@ static int pl031_pre_save(void *opaque)
 {
     PL031State *s = opaque;
 
-    /* tick_offset is base_time - rtc_clock base time.  Instead, we want to
-     * store the base time relative to the QEMU_CLOCK_VIRTUAL for backwards-compatibility.  */
+    /*
+     * The PL031 device model code uses the tick_offset field, which is
+     * the offset between what the guest RTC should read and what the
+     * QEMU rtc_clock reads:
+     *  guest_rtc = rtc_clock + tick_offset
+     * and so
+     *  tick_offset = guest_rtc - rtc_clock
+     *
+     * We want to migrate this offset, which sounds straightforward.
+     * Unfortunately older versions of QEMU migrated a conversion of this
+     * offset into an offset from the vm_clock. (This was in turn an
+     * attempt to be compatible with even older QEMU versions, but it
+     * has incorrect behaviour if the rtc_clock is not the same as the
+     * vm_clock.) So we put the actual tick_offset into a migration
+     * subsection, and the backwards-compatible time-relative-to-vm_clock
+     * in the main migration state.
+     *
+     * Calculate base time relative to QEMU_CLOCK_VIRTUAL:
+     */
     int64_t delta = qemu_clock_get_ns(rtc_clock) - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
 
     return 0;
 }
 
+static int pl031_pre_load(void *opaque)
+{
+    PL031State *s = opaque;
+
+    s->tick_offset_migrated = false;
+    return 0;
+}
+
 static int pl031_post_load(void *opaque, int version_id)
 {
     PL031State *s = opaque;
 
-    int64_t delta = qemu_clock_get_ns(rtc_clock) - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    s->tick_offset = s->tick_offset_vmstate - delta / NANOSECONDS_PER_SECOND;
+    /*
+     * If we got the tick_offset subsection, then we can just use
+     * the value in that. Otherwise the source is an older QEMU and
+     * has given us the offset from the vm_clock; convert it back to
+     * an offset from the rtc_clock. This will cause time to incorrectly
+     * go backwards compared to the host RTC, but this is unavoidable.
+     */
+
+    if (!s->tick_offset_migrated) {
+        int64_t delta = qemu_clock_get_ns(rtc_clock) -
+            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        s->tick_offset = s->tick_offset_vmstate -
+            delta / NANOSECONDS_PER_SECOND;
+    }
     pl031_set_alarm(s);
     return 0;
 }
 
+static int pl031_tick_offset_post_load(void *opaque, int version_id)
+{
+    PL031State *s = opaque;
+
+    s->tick_offset_migrated = true;
+    return 0;
+}
+
+static bool pl031_tick_offset_needed(void *opaque)
+{
+    PL031State *s = opaque;
+
+    return s->migrate_tick_offset;
+}
+
+static const VMStateDescription vmstate_pl031_tick_offset = {
+    .name = "pl031/tick-offset",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl031_tick_offset_needed,
+    .post_load = pl031_tick_offset_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(tick_offset, PL031State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pl031 = {
     .name = "pl031",
     .version_id = 1,
     .minimum_version_id = 1,
     .pre_save = pl031_pre_save,
+    .pre_load = pl031_pre_load,
     .post_load = pl031_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(tick_offset_vmstate, PL031State),
@@ -231,14 +296,33 @@ static const VMStateDescription vmstate_pl031 = {
         VMSTATE_UINT32(im, PL031State),
         VMSTATE_UINT32(is, PL031State),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_pl031_tick_offset,
+        NULL
     }
 };
 
+static Property pl031_properties[] = {
+    /*
+     * True to correctly migrate the tick offset of the RTC. False to
+     * obtain backward migration compatibility with older QEMU versions,
+     * at the expense of the guest RTC going backwards compared with the
+     * host RTC when the VM is saved/restored if using -rtc host.
+     * (Even if set to 'true' older QEMU can migrate forward to newer QEMU;
+     * 'false' also permits newer QEMU to migrate to older QEMU.)
+     */
+    DEFINE_PROP_BOOL("migrate-tick-offset",
+                     PL031State, migrate_tick_offset, true),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void pl031_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_pl031;
+    dc->props = pl031_properties;
 }
 
 static const TypeInfo pl031_info = {
-- 
2.20.1

