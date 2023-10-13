Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1339966ejc;
        Fri, 13 Oct 2023 01:12:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7Bebm75ZX1LUGcN0egtB6zoNqiYV7o2ciVHsITlDXmpyjCTO4hGQvFqm2he36F9GmdESt
X-Received: by 2002:a05:620a:3725:b0:76c:a911:f74f with SMTP id de37-20020a05620a372500b0076ca911f74fmr37739933qkb.27.1697184721835;
        Fri, 13 Oct 2023 01:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184721; cv=none;
        d=google.com; s=arc-20160816;
        b=v9C84u1ViIPhToOMViffX6feMbzghpSSL82P7LVu8m8HFkrklDNC1fyD4mOIj0l8V1
         Bu83+Y1ofqLKUTGYQFECa3iQqyy6jxpkEYsbcerX54xBC7X+A6MlhcwjHihzIdkqzZEN
         AsasevwU1TRs7jIv5tQEZo9kcxRhpHztQTfl/Ar4pKUg4Ihzv3aIPV1MiWefVjMf4D/a
         l0C8cC+MzIJySfTxT5GIEa5UgBo5p/EbFmXdmHgdTmtGBVqO+kotUrssS8zL0kNM2xjV
         fYTaRdoyjjk5qhQoM/+KKorXwI3sdg5dATspbjmPxyH1oQzxPqGem6u7I6LvxzxGTjg6
         4oBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KB0gvugYc9C6TU4Cb/iuN+aDu5QpjXM6/bIk/+OkcXM=;
        fh=cF18OC1CawvBZplI+kHlCER8ycHiGLYU96cieEbgLUs=;
        b=HdpB91a+yoKEsOnkkxCk4XmjZMGYkgP/g10WmjO4LwCm40wHjKAnwJMBwZbfQRDIco
         8AREJQnBl4McBEZL/3RciP33U8BU4S+4Oc5lk5KlIVD5XEt3l/eoj8Ct18s2ml7ZSJqf
         GRgy4mE7oKvYMwE0HzrdHpL4mi6oRcdVT6FjugEOu3mNqwFQpw70JOsuwVf9BgDuzhAg
         gu2Q1fXmYNbMCTxW72W+ZMFqMO3z3mNbnWhJt8r25r0Xm2YVE8Tn1udd3hBtCXzE/SDc
         kv52qQyxg/JP4P/AcVT6zYQkmCl+V7ULmhMx5Ibz6NwNnPA6/N9OQK3D3kjhjBHIkxOi
         jGZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fqvjLbZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br34-20020a05620a462200b0076f17d9dc1asi835751qkb.493.2023.10.13.01.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:12:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fqvjLbZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrD5m-0000Yi-QL; Fri, 13 Oct 2023 04:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrD5d-0008EP-11
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:00:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrD5Z-0007VV-49
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:00:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4064867903cso21641475e9.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697184003; x=1697788803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KB0gvugYc9C6TU4Cb/iuN+aDu5QpjXM6/bIk/+OkcXM=;
 b=fqvjLbZhNGXRCCNSs3vrFzUApQDf3DmRzB/zxfpiveZp6U8q9s1NPUpL8ap9YaH/3M
 RLD2hNb+p1mVQWK2mz6jRABTdxDvzQgCCkKsHaMn5nNyyn2iLC5eAs1vv4MGfui9CbcH
 nzaTf8c4kzgbaH4BLegreurw6e6ODseyE9c1h2ruY1lQVi9ZiwLQuummE8RDmhIWjK3S
 6o8PgOpuTzbwYSAvFHRougDezuaE4jvNPgNzqhEAtFVC4vClCM4zYByWOt6ZGN8BVKhs
 nQe0MgpdHa+GwbRShzSZfTIoE0tA/IBliGhDkrevwCzvOnFG8rivQC8Z7jYScBtpFQvp
 3Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697184003; x=1697788803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KB0gvugYc9C6TU4Cb/iuN+aDu5QpjXM6/bIk/+OkcXM=;
 b=noHtCQu2CQFX7GQ1dWjIpu3S9DPTqI4dDipBbaXCrcyjLdNBxAmbJVa9kCfAoYHO23
 PsLWYi9oKGBlKn59t6JCdnvU16WrcukdxfRbf9tcvinTx3Tq9j/Lv8+IhgOPAaaAhXKL
 xlUCEmxkRrSVyJwpzEbqUSzBmaWFdVgbVXxRJmU+z515/0B7wmFv99lJcs9HF9Sg84dS
 bqMNz+gBqCSo8H4B5l0GHtt87Q+9KeoLzeagk3F/IGVyEH9JNF0gMnVyOvBQIT5vYFkN
 6H1fs03ea1mIchJR7U2H7exTcA1Xni45fkHHEtik/zFKTO52ZxvjHcSq4xdeopdJnB+W
 0+VQ==
X-Gm-Message-State: AOJu0YyC6Bf3MOGBRQOGclajBAB1N3urXj0pEauZ0CxoP7kxqekGCJ0c
 dgVNIKVfdfR54/0c/DRfxuWKPw==
X-Received: by 2002:a05:600c:2107:b0:405:48ba:9c with SMTP id
 u7-20020a05600c210700b0040548ba009cmr24266073wml.16.1697184003223; 
 Fri, 13 Oct 2023 01:00:03 -0700 (PDT)
Received: from localhost.localdomain (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003fe23b10fdfsm1798183wmm.36.2023.10.13.01.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:00:02 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [RFC PATCH v2 70/78] hw/rtc: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:57:37 +0300
Message-Id: <aba72599f8eb496fe5c4f1683b1e9d96d5e1a843.1697183699.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RmWktmFdqAh2

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/rtc/aspeed_rtc.c  | 4 ++--
 hw/rtc/mc146818rtc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/rtc/aspeed_rtc.c b/hw/rtc/aspeed_rtc.c
index fa861e2d49..59c64b01b9 100644
--- a/hw/rtc/aspeed_rtc.c
+++ b/hw/rtc/aspeed_rtc.c
@@ -68,28 +68,28 @@ static uint32_t aspeed_rtc_get_counter(AspeedRtcState *rtc, int r)
 static uint64_t aspeed_rtc_read(void *opaque, hwaddr addr,
                                 unsigned size)
 {
     AspeedRtcState *rtc = opaque;
     uint64_t val;
     uint32_t r = addr >> 2;
 
     switch (r) {
     case COUNTER1:
     case COUNTER2:
         if (rtc->reg[CONTROL] & RTC_ENABLED) {
             rtc->reg[r] = aspeed_rtc_get_counter(rtc, r);
         }
-        /* fall through */
+        fallthrough;
     case CONTROL:
         val = rtc->reg[r];
         break;
     case ALARM:
     case ALARM_STATUS:
     default:
         qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx "\n", __func__, addr);
         return 0;
     }
 
     trace_aspeed_rtc_read(addr, val);
 
     return val;
 }
@@ -97,25 +97,25 @@ static uint64_t aspeed_rtc_read(void *opaque, hwaddr addr,
 static void aspeed_rtc_write(void *opaque, hwaddr addr,
                              uint64_t val, unsigned size)
 {
     AspeedRtcState *rtc = opaque;
     uint32_t r = addr >> 2;
 
     switch (r) {
     case COUNTER1:
     case COUNTER2:
         if (!(rtc->reg[CONTROL] & RTC_UNLOCKED)) {
             break;
         }
-        /* fall through */
+        fallthrough;
     case CONTROL:
         rtc->reg[r] = val;
         aspeed_rtc_calc_offset(rtc);
         break;
     case ALARM:
     case ALARM_STATUS:
     default:
         qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx "\n", __func__, addr);
         break;
     }
     trace_aspeed_rtc_write(addr, val);
 }
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index c27c362db9..6b6eef94fd 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -439,120 +439,120 @@ static void rtc_update_timer(void *opaque)
 static void cmos_ioport_write(void *opaque, hwaddr addr,
                               uint64_t data, unsigned size)
 {
     MC146818RtcState *s = opaque;
     uint32_t old_period;
     bool update_periodic_timer;
 
     if ((addr & 1) == 0) {
         s->cmos_index = data & 0x7f;
     } else {
         CMOS_DPRINTF("cmos: write index=0x%02x val=0x%02" PRIx64 "\n",
                      s->cmos_index, data);
         switch(s->cmos_index) {
         case RTC_SECONDS_ALARM:
         case RTC_MINUTES_ALARM:
         case RTC_HOURS_ALARM:
             s->cmos_data[s->cmos_index] = data;
             check_update_timer(s);
             break;
         case RTC_IBM_PS2_CENTURY_BYTE:
             s->cmos_index = RTC_CENTURY;
-            /* fall through */
+            fallthrough;
         case RTC_CENTURY:
         case RTC_SECONDS:
         case RTC_MINUTES:
         case RTC_HOURS:
         case RTC_DAY_OF_WEEK:
         case RTC_DAY_OF_MONTH:
         case RTC_MONTH:
         case RTC_YEAR:
             s->cmos_data[s->cmos_index] = data;
             /* if in set mode, do not update the time */
             if (rtc_running(s)) {
                 rtc_set_time(s);
                 check_update_timer(s);
             }
             break;
         case RTC_REG_A:
             update_periodic_timer = (s->cmos_data[RTC_REG_A] ^ data) & 0x0f;
             old_period = rtc_periodic_clock_ticks(s);
 
             if ((data & 0x60) == 0x60) {
                 if (rtc_running(s)) {
                     rtc_update_time(s);
                 }
                 /* What happens to UIP when divider reset is enabled is
                  * unclear from the datasheet.  Shouldn't matter much
                  * though.
                  */
                 s->cmos_data[RTC_REG_A] &= ~REG_A_UIP;
             } else if (((s->cmos_data[RTC_REG_A] & 0x60) == 0x60) &&
                     (data & 0x70)  <= 0x20) {
                 /* when the divider reset is removed, the first update cycle
                  * begins one-half second later*/
                 if (!(s->cmos_data[RTC_REG_B] & REG_B_SET)) {
                     s->offset = 500000000;
                     rtc_set_time(s);
                 }
                 s->cmos_data[RTC_REG_A] &= ~REG_A_UIP;
             }
             /* UIP bit is read only */
             s->cmos_data[RTC_REG_A] = (data & ~REG_A_UIP) |
                 (s->cmos_data[RTC_REG_A] & REG_A_UIP);
 
             if (update_periodic_timer) {
                 periodic_timer_update(s, qemu_clock_get_ns(rtc_clock),
                                       old_period, true);
             }
 
             check_update_timer(s);
             break;
         case RTC_REG_B:
             update_periodic_timer = (s->cmos_data[RTC_REG_B] ^ data)
                                        & REG_B_PIE;
             old_period = rtc_periodic_clock_ticks(s);
 
             if (data & REG_B_SET) {
                 /* update cmos to when the rtc was stopping */
                 if (rtc_running(s)) {
                     rtc_update_time(s);
                 }
                 /* set mode: reset UIP mode */
                 s->cmos_data[RTC_REG_A] &= ~REG_A_UIP;
                 data &= ~REG_B_UIE;
             } else {
                 /* if disabling set mode, update the time */
                 if ((s->cmos_data[RTC_REG_B] & REG_B_SET) &&
                     (s->cmos_data[RTC_REG_A] & 0x70) <= 0x20) {
                     s->offset = get_guest_rtc_ns(s) % NANOSECONDS_PER_SECOND;
                     rtc_set_time(s);
                 }
             }
             /* if an interrupt flag is already set when the interrupt
              * becomes enabled, raise an interrupt immediately.  */
             if (data & s->cmos_data[RTC_REG_C] & REG_C_MASK) {
                 s->cmos_data[RTC_REG_C] |= REG_C_IRQF;
                 qemu_irq_raise(s->irq);
             } else {
                 s->cmos_data[RTC_REG_C] &= ~REG_C_IRQF;
                 qemu_irq_lower(s->irq);
             }
             s->cmos_data[RTC_REG_B] = data;
 
             if (update_periodic_timer) {
                 periodic_timer_update(s, qemu_clock_get_ns(rtc_clock),
                                       old_period, true);
             }
 
             check_update_timer(s);
             break;
         case RTC_REG_C:
         case RTC_REG_D:
             /* cannot write to them */
             break;
         default:
             s->cmos_data[s->cmos_index] = data;
             break;
         }
     }
 }
@@ -678,63 +678,63 @@ static int update_in_progress(MC146818RtcState *s)
 static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
                                  unsigned size)
 {
     MC146818RtcState *s = opaque;
     int ret;
     if ((addr & 1) == 0) {
         return 0xff;
     } else {
         switch(s->cmos_index) {
         case RTC_IBM_PS2_CENTURY_BYTE:
             s->cmos_index = RTC_CENTURY;
-            /* fall through */
+            fallthrough;
         case RTC_CENTURY:
         case RTC_SECONDS:
         case RTC_MINUTES:
         case RTC_HOURS:
         case RTC_DAY_OF_WEEK:
         case RTC_DAY_OF_MONTH:
         case RTC_MONTH:
         case RTC_YEAR:
             /* if not in set mode, calibrate cmos before
              * reading*/
             if (rtc_running(s)) {
                 rtc_update_time(s);
             }
             ret = s->cmos_data[s->cmos_index];
             break;
         case RTC_REG_A:
             ret = s->cmos_data[s->cmos_index];
             if (update_in_progress(s)) {
                 ret |= REG_A_UIP;
             }
             break;
         case RTC_REG_C:
             ret = s->cmos_data[s->cmos_index];
             qemu_irq_lower(s->irq);
             s->cmos_data[RTC_REG_C] = 0x00;
             if (ret & (REG_C_UF | REG_C_AF)) {
                 check_update_timer(s);
             }
 
             if(s->irq_coalesced &&
                     (s->cmos_data[RTC_REG_B] & REG_B_PIE) &&
                     s->irq_reinject_on_ack_count < RTC_REINJECT_ON_ACK_COUNT) {
                 s->irq_reinject_on_ack_count++;
                 s->cmos_data[RTC_REG_C] |= REG_C_IRQF | REG_C_PF;
                 DPRINTF_C("cmos: injecting on ack\n");
                 if (rtc_policy_slew_deliver_irq(s)) {
                     s->irq_coalesced--;
                     DPRINTF_C("cmos: coalesced irqs decreased to %d\n",
                               s->irq_coalesced);
                 }
             }
             break;
         default:
             ret = s->cmos_data[s->cmos_index];
             break;
         }
         CMOS_DPRINTF("cmos: read index=0x%02x val=0x%02x\n",
                      s->cmos_index, ret);
         return ret;
     }
 }
-- 
2.39.2

