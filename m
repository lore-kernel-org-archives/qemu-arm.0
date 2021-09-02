Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp418879lfb;
        Thu, 2 Sep 2021 09:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBqNW8PYpbY/3xRqfukx6zCUDQhLKD94aKl+PA2OOwMrGwWdlUuP1avSWHGtjJ+hoxOMF9
X-Received: by 2002:a2e:9205:: with SMTP id k5mr3202232ljg.26.1630599382948;
        Thu, 02 Sep 2021 09:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630599382; cv=none;
        d=google.com; s=arc-20160816;
        b=AL+7hwyyWKSODwCp87Alb3Ea0j42JvzXstFY+agENToE0bYyEGHJeoxWVVprwNUpLr
         GgvUC2p7zuiz8X9uIV89/Ir5GA52cJ8eJ98oXedVQW6mPPEnEmbiNBFFaA7+yMOv6M+O
         O2DvtZoQ5+y2oA+ih4pqt7j2MPnS8B/F5AyP0yfT0BqNMczvMZayEkKXfKMlYkHUFrkS
         vp8IILFBpLceu72kkv071DSFhfd1Z8e1MvOUUQlv4LkbdZhA5zzfO8aScVO7dXmXjnd1
         UwrxTz0gHw9X9dzKx+R5HLR5bFbdy2tNTGFaEZSEjZYsNMOXzW2GkOKplrCgsm9+xKRy
         3/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=P0fp1qqpF59XMbIIHxComfWKKQIg8VIlTwHVvhBN59A=;
        b=aWob2IXFA0aSzgZQeE08ug2EyYW+m0KSPJR7x6unmuehLGX13dyTZU/Cs1e5ZjDLfR
         LatgvWMs098IfBLroBWsFzfSVvuNHMzyO/Ob+lK4qa8F7nSrh8mOrI15fISgepNvPInB
         HYNyHdNMVrzt9DfGa0PjDvSkehFLJnUPqkVK8evSR1IX1vKg0R+RvIyFgd6erxYB+j0H
         REGd2PNud148DSqX3dOM46zxjvRoyYLVaVGqWSxRWaBQm+O6yKWqfTCEeyGlrLD6yPps
         ZMxrvoJ8kkv0SRVGZX1VAXvfBZ+cfXeNw4lft6QSWjWoj/Y9V39rdFYUNKstk57/CeuD
         kQnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="G8+gv7/l";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id 8si2243468ejl.416.2021.09.02.09.16.22;
        Thu, 02 Sep 2021 09:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="G8+gv7/l";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346275AbhIBQRU (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Sep 2021 12:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346305AbhIBQRM (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:17:12 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A690C0613A4
        for <kvm@vger.kernel.org>; Thu,  2 Sep 2021 09:16:12 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x6so3800987wrv.13
        for <kvm@vger.kernel.org>; Thu, 02 Sep 2021 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P0fp1qqpF59XMbIIHxComfWKKQIg8VIlTwHVvhBN59A=;
        b=G8+gv7/l02p+3pIOfkKqyIa3SJNJqqucn0S8o/siAkKaxmFM5RO224iTEbB1+wTzyT
         yH9VCpxFWBr0t0GXhQxQRUuO0CaUa3ZzEf3celJhLqjAbDckl1E6mqaq2dCEttikPZRW
         NTgh0ED5VO3rDtoACT4pDd4RK9nfKb9VvyIT09l58j9YQUutJPWiW1YUvmfRQD6MaciO
         hgQld4iTpFhaM+A7V2MEdU+/ZRnuTgXC5fBFAjpnxBcFkFzPQ9ZRGDj/1+tmyCyow8jw
         rBfrG9A0yoltXZKggfPRhQMqdG2T5CPTN8x3VdAjvEoK7uauTkkWkCFDPZbLzkrywDXE
         DO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=P0fp1qqpF59XMbIIHxComfWKKQIg8VIlTwHVvhBN59A=;
        b=k0DEcHz/7WqO6jlmUG3qCr2mKaRPyW9xyrivrIfxT0Zd6oX/6uL4dx9ub0e/TzkH40
         +d4BdKz1KQqybPMMNfMABsHFQq+3OQ8Bf8eGHtl2qN5U2XWz6a0T6SBK66nx8rq/OFHw
         EUQ89HXoIza9y7GDB37Uavk8gaArAW0xivL3MVEJlyx0NRzxonJIgXMATDCRjCq4Beys
         DnivEG8bcU/h1BMlvoAIs7TrzDd/eJB7VMx4a5Do0UkQT4aAV/s2D/tQKxcpJ3vZbTMU
         fWzhscVNmdwvXnoCIjXTI5chN6PYebU2n8jRpul6cXr4GhTbyBojYUaaNV01EGadv1Ds
         Iomg==
X-Gm-Message-State: AOAM531dNKWbzGb40Ep1472U04n/LVEr4lvBylda5WQweo+/bqwddMCE
        oAata86DtVfiWObzI5VlZkc=
X-Received: by 2002:adf:d191:: with SMTP id v17mr4847443wrc.345.1630599370860;
        Thu, 02 Sep 2021 09:16:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id l1sm2293844wrb.15.2021.09.02.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:16:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To:     qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 04/30] sysemu: Introduce AccelOpsClass::has_work()
Date:   Thu,  2 Sep 2021 18:15:17 +0200
Message-Id: <20210902161543.417092-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pWpmjIwo0egc

Introduce an accelerator-specific has_work() handler.
Eventually call it from cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 5 +++++
 softmmu/cpus.c             | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 032f6979d76..de83f095f20 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,11 @@ struct AccelOpsClass {
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
 
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
+
     void (*synchronize_post_reset)(CPUState *cpu);
     void (*synchronize_post_init)(CPUState *cpu);
     void (*synchronize_state)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7e2cb2c571b..2a61dfd6287 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -255,6 +255,9 @@ bool cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    if (cpus_accel->has_work) {
+        return cpus_accel->has_work(cpu);
+    }
     g_assert(cc->has_work);
     return cc->has_work(cpu);
 }
-- 
2.31.1
