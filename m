Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2818326njc;
        Tue, 15 Apr 2025 10:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0EYfdGiNg+sPu3eMF98F02fdasm+m3GwAOJ+OREbZtI9hT+/uFadeqX0Bou2QT+dDdMuKX5uK3YO2pw==@linaro.org
X-Google-Smtp-Source: AGHT+IHC198gdPsdNofk9wFyUakqqYEhO/MzMTese+Vi9duUp/8OHeND2fRwOFMn8LTh8bv+AqHa
X-Received: by 2002:a05:622a:130a:b0:476:ff0d:ed6c with SMTP id d75a77b69052e-47ad3adbb3dmr2238081cf.40.1744737857434;
        Tue, 15 Apr 2025 10:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744737857; cv=none;
        d=google.com; s=arc-20240605;
        b=eswKYlFe44KOsstRxNu9zuZV8KgnfjnpZa8Yaji48iOnIhIsV863apbkcYVSrkaR1k
         xnGcMW0s5MTUP8Ah5gnOg7lMCyomYxWle9UG9isfOq0ue53P8vdiCRgjfPKyfEmrWBNE
         Te8QBQN0iTz9YGJM8E8mD02XFeX173EAmrpWiBywDzklmn5dQdmP5G5BQB4PmAhz6ajs
         A7+NjwWOxOArCqM8HMIoyTRdvLA2BbamPXPzXgBed2BCjXxwqKR+ctRrIBCutdd0/pp1
         v24sHJ5tfz3mXoZLl+yXtVvVJpaBrLQx6g0lEZGhXb/NYmzhph+dU+mma7D/POiXx0Ni
         Qg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PeByU0jwFO7MH0hprr6LSgGx+kuJBq/jNjVmMX1KbGo=;
        fh=5dDhRaRbX3tP9Vsj4H76VAlPUgnYVMxhznpdbMeD+Rc=;
        b=eP2M503dL3G+AQ9U4agA8OYfw8ToRrFOa449usco2GyLKtBA+LCwzxkIvVSCuBrTPe
         Z2R9xhId34kj5bxb6aKxpnZC+a6X89tTPLD8nLoRsw31byN9TznrnjsCWpCxd8vXaViX
         dxlm6Bf0vSRs+bnHuOvK0+gIzGLd2HfbbXtWkGOYkO6nPtPAErA5B536iNEt1T83TTwg
         vZRGgVuK/XnzKTXyAcDsOTrE/iBIEzfghy/H1RhRuGq6kQNw124XhUHhZijHV+J8dBIc
         7slLGaNH3A7ugTUKAVlBvf0KphyKBa6H+GYFtEqa7hjA09PucLWLabved3WnOvPEK6+q
         H46Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LQW3pQ8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edeb329si114817421cf.520.2025.04.15.10.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 10:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LQW3pQ8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4k03-0000Da-Js; Tue, 15 Apr 2025 13:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4k01-0000CX-BJ
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:23:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4jzz-0006vn-FD
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:23:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so40286975e9.0
 for <qemu-arm@nongnu.org>; Tue, 15 Apr 2025 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744737782; x=1745342582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PeByU0jwFO7MH0hprr6LSgGx+kuJBq/jNjVmMX1KbGo=;
 b=LQW3pQ8gCiu/uJhNAoYXzSwFLB+9K+k1XV9UrhVjS3DrP0aPzj5wiQEAu+qmHClTlg
 mn5x8bX4Fib+Yj1RhY7636Cb/PdQIyQQHRUSuNFr0CpU6PuljMU/+kZrSuDJLd1SeG4S
 MM2Ab4A1Xm/A6ZIrwMI4BPZGvXVuDbXjiIBUu77ZeR05PTXvRyIwYNoejxxf0QiRZJvl
 sCVHX037ALe+c871YmCx6i2lh99Rfm+XHHWiLOoLPe533ZS05ae88enGmNzdp9kcYy/m
 7NEZHGVaVicP8yvWK91DuleBHlpMh4aFJl3m2BBU3LyjQVXL0+ekfubMlzrnMdgCeGSl
 /CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744737782; x=1745342582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PeByU0jwFO7MH0hprr6LSgGx+kuJBq/jNjVmMX1KbGo=;
 b=JZs2HThZ0Q7nQJT/VkMz+N0yXGX64lgGfozeAdctRQREGgjC9KC7jkYzXiUzvvASnQ
 ilaEanRJZsURq+f7Ult2ck9BLhu0bwVwaVRhczZkY72MRoL77iXP2vQ+fJiVKUu9hRVV
 pwQLmDMq8ZWwVZyrxdpnWiMgRy10yyiNXUjclNnNEHW9GrX5MI5vrxdn1hO5WTc3hqFF
 RxS7g3aSNGnG98bB9XkFZJwkssd3d0sxvHBZY7K4LTq8SR5W5/HqFJyDYZQCC31ME/09
 1HT0dv+VTbUNiDHeFEPBMxeajfXH0K3E2Q0lWXSXBC2w028xMs7ZcMCBDyq5v8/Vidby
 hnDQ==
X-Gm-Message-State: AOJu0Yw9bpY6D+A6sfOG5B7/YD5Qpi1co8asNRWJW3r3Kpk0NGJ+Enti
 GAF1APOUIXxqD3rV6k9PKS9Ot5JIXSjNEMTVwxFZtsI1Qr5jMrfqfbpp69crTltSP3fPqTTrhw1
 2
X-Gm-Gg: ASbGnctdf4Zw4GQshC98YWE5rL57i3RLPppK1wl14CXxOLnubjD9fpSSJov5neInwkI
 q1a15zTAzLBDaTZO8IirdmTvgC2S/IvNOkQFOAl1yiKgUSDBGDQj17dgjcieX4D/IMtePwjGJda
 Q7xIgs5bM7OhBfPiW9IaEMa1jMgyl4pWsOIz1dKK84NOJwkdVVqBaNVYTEc9QircW73i0q95iTT
 U6vAaVYB92bsWyiqwZQD/2sw4p5I64wvMFpgBvlXOGADSfrmxEKGr35wSusJA26RLmy13UPjs9I
 a8CQ1T9orxHQ55MteVY3WVL10CIoxr5KDp75eZabcTMf9mQWW+kja8Aq2JAsHBKi/uX1t2vSjej
 qzNM1hKizCdo7d0MkyQdO
X-Received: by 2002:a05:600c:500e:b0:43d:7588:667b with SMTP id
 5b1f17b1804b1-43f3a93ca20mr185678855e9.10.1744737781985; 
 Tue, 15 Apr 2025 10:23:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f71sm214675675e9.15.2025.04.15.10.23.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Apr 2025 10:23:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 3/3] target/arm: Replace target_ulong -> vaddr for
 CPUWatchpoint
Date: Tue, 15 Apr 2025 19:22:46 +0200
Message-ID: <20250415172246.79470-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250415172246.79470-1-philmd@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: tSNkZIXceOYW

CPUWatchpoint::vaddr/len are of type vaddr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h   | 9 +++++----
 target/arm/hyp_gdbstub.c | 8 ++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 05ceb9bcf5d..a19c805af45 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -26,6 +26,7 @@
 #define TARGET_ARM_INTERNALS_H
 
 #include "exec/hwaddr.h"
+#include "exec/vaddr.h"
 #include "exec/breakpoint.h"
 #include "hw/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
@@ -1946,10 +1947,10 @@ bool find_hw_breakpoint(CPUState *cpu, uint64_t pc);
 int insert_hw_breakpoint(uint64_t pc);
 int delete_hw_breakpoint(uint64_t pc);
 
-bool check_watchpoint_in_range(int i, target_ulong addr);
-CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr);
-int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type);
-int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type);
+bool check_watchpoint_in_range(int i, vaddr addr);
+CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
+int insert_hw_watchpoint(vaddr addr, vaddr len, int type);
+int delete_hw_watchpoint(vaddr addr, vaddr len, int type);
 
 /* Return the current value of the system counter in ticks */
 uint64_t gt_get_countervalue(CPUARMState *env);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index 4e52d37ed80..4d8fd933868 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -125,7 +125,7 @@ int delete_hw_breakpoint(uint64_t pc)
  * need to ensure you mask the address as required and set BAS=0xff
  */
 
-int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
+int insert_hw_watchpoint(vaddr addr, vaddr len, int type)
 {
     HWWatchpoint wp = {
         .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
@@ -182,7 +182,7 @@ int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
     return 0;
 }
 
-bool check_watchpoint_in_range(int i, target_ulong addr)
+bool check_watchpoint_in_range(int i, vaddr addr)
 {
     HWWatchpoint *wp = get_hw_wp(i);
     uint64_t addr_top, addr_bottom = wp->wvr;
@@ -214,7 +214,7 @@ bool check_watchpoint_in_range(int i, target_ulong addr)
  * Delete a breakpoint and shuffle any above down
  */
 
-int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type)
+int delete_hw_watchpoint(vaddr addr, vaddr len, int type)
 {
     int i;
     for (i = 0; i < cur_hw_wps; i++) {
@@ -239,7 +239,7 @@ bool find_hw_breakpoint(CPUState *cpu, uint64_t pc)
     return false;
 }
 
-CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
+CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr)
 {
     int i;
 
-- 
2.47.1

