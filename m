Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678557eja;
        Mon, 6 Nov 2023 03:08:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHiu9uPg2P+4oCAmzoiDwX/FmW8droxMA8VOj0E3kdFcOH/DIC89dzFpCshfrUsBf9aAJk
X-Received: by 2002:a05:6102:c93:b0:45f:3b30:9ca9 with SMTP id f19-20020a0561020c9300b0045f3b309ca9mr2079888vst.15.1699268897973;
        Mon, 06 Nov 2023 03:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268897; cv=none;
        d=google.com; s=arc-20160816;
        b=c33zk7W9kmrk9Q8AiQ6Iw95rC2BcuiIPF6QHdIHiDLNI9RnxM5JprLERXmsENHs0Dl
         uhpnU2kkNIVKy8WdGZuc5Cf2pF8aqnTubRGgZi2co4URbM1paOGHXLdCbrDjvh7XSAO9
         7Es66ElnTA2m3t1BrvV6v19Tu9BhqznxMlpfcScNLCQ/XI2Xie/1LdSlZHoLhIUplGd2
         GOwDdzn03yvFChUbB4gw+hm5o+MoYeQ9rfzBQPPrsOXfzQ5MPzgfwd0xvYvNG1CdrAbw
         WX0MkxLZrI0pEn7/BBR88cFBS6bCiPetxlihuvw6RzQjiLUizpmvTSZLTt//mHICmpOP
         qViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HIk2D2Zy+mW9KoNQEGhLCqqc6EXwTlAoiLD308KY354=;
        fh=wKPAfzysS4tcL3tAeYvV/VveclYm430IzPgaH2k8XpQ=;
        b=YknLOEgE3d1I3b1C3YlIhUnUAzQ6Rlb7FDXF19a20972FA5zooRqg2NrGe6ThvsJ05
         DOQJZSEKo9CakyPiD/wo2wO9NIF44kPpAV1JeXnDmyPS7Wb0FTSOGUaUsA6wiv6cKqPu
         rmCHQBnpEFJB9RfqWRM/mafa6gy/PutX6QtM4EOZi5jvsJb87BV4bbiEVyvB2ig1Smot
         Nm925bycRzAO3LFIEEJBPXcjjUlp21yk1Q9k1n7wA/5a2n7JlZkWmwjUFPjVK+E4KcaB
         wfqtneCsNs/+P5l3M/m+Rqtgfw3r7JWBBGsAFTbs71LaRzAAmq+SDGm96H6+USQT+iOF
         sFPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MC1qL/c1";
       spf=pass (google.com: domain of kvm+bounces-708-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-708-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-708-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id s10-20020a05620a29ca00b0076cc4d494c2si5297827qkp.88.2023.11.06.03.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-708-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MC1qL/c1";
       spf=pass (google.com: domain of kvm+bounces-708-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-708-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EFD61C20BED
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E2918AE5;
	Mon,  6 Nov 2023 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MC1qL/c1"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FCF1864A
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:08:09 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345C8BB
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:08:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-507a62d4788so5742921e87.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268886; x=1699873686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIk2D2Zy+mW9KoNQEGhLCqqc6EXwTlAoiLD308KY354=;
        b=MC1qL/c1JmdA2KXSwgfHJKlCA7+0CjClNDrlzpwQSCtS3LwZxQvHhGlbwsPQoAvv5T
         Ke2Rv3m3G6W1HCszsuy078PCNSQcP2XQgb38kbywCev20nGWx2gij8c8aVTviThbKj7i
         h3llptGcshB5xHE8t8qgdUdOpHk36Q3c7CWuEwVB8dJvCZ9eSik15ZH/srOBPoFNgyqd
         zCIS87D4Y++AahEUkw6a9C8awyNp14AmrsvsUYP6h6cjV7vU0VUB+lR7u5YkBQH5f/hM
         E6lCzmsoXOFuTkRXshAWPsS8CbGhN0CeE19YYFCBW7rQamfWEbHbYHibmJCyn1f33Ma0
         2bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268886; x=1699873686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIk2D2Zy+mW9KoNQEGhLCqqc6EXwTlAoiLD308KY354=;
        b=N2UZOx9Jlu9/RJHw2+Io3XHwi7zp0OrrxJ/PWTYkvOgSy4Z2//ZpcPhk31sMfwNWmn
         a8NF5jZ/75bb+PAEn1q8KKYc90ls/jtMrKrJXgbKNdrKTsUyL0iy3id5iJP6uHm/wrX3
         8gpIC6gsVdNAv9oMfTHtf2vB+xtxn8csTQV7WCHfWYBTqejaD4gZa14yOFTl4RhErKR+
         MH87NIgV2fEHWVSCuub+6ULXR+AWQWNxl5NlJ21Z2tOFFTHAnZpSUgD4lWR04M9g0Z3c
         aOKTxOddcHdAhFIofpzvCxosbDnAVI86aeJwgKsJRgdiCW51aFuxcaAEK5fzKpFL8CZ2
         Nzfg==
X-Gm-Message-State: AOJu0YwitjABMVfNvunoIS1EtX0xyFb22YEMeG1W+S/0D5JFVHT0Ak6w
	135gQJb7nEFBDr5wJ990GQH3hg==
X-Received: by 2002:a2e:7c15:0:b0:2c5:5926:de52 with SMTP id x21-20020a2e7c15000000b002c55926de52mr22771440ljc.53.1699268886360;
        Mon, 06 Nov 2023 03:08:06 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c348100b003fe1fe56202sm12104665wmq.33.2023.11.06.03.08.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:08:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 39/60] exec/cpu: Have cpu_exec_realize() return a boolean
Date: Mon,  6 Nov 2023 12:03:11 +0100
Message-ID: <20231106110336.358-40-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 23FOQX0BFRof

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918160257.30127-22-philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 cpu-target.c          | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5d6f8dca43..eb943efb8f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1152,7 +1152,7 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
-void cpu_exec_realizefn(CPUState *cpu, Error **errp);
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 void cpu_exec_reset_hold(CPUState *cpu);
 
diff --git a/cpu-target.c b/cpu-target.c
index 79363ae370..f3e1ad8bcd 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -131,13 +131,13 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
-void cpu_exec_realizefn(CPUState *cpu, Error **errp)
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
 
     if (!accel_cpu_common_realize(cpu, errp)) {
-        return;
+        return false;
     }
 
     /* Wait until cpu initialization complete before exposing cpu. */
@@ -159,6 +159,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
         vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
+
+    return true;
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
-- 
2.41.0

