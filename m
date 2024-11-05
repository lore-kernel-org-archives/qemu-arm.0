Received: by 2002:a05:7022:611:b0:8f:43c:4b5e with SMTP id 17csp2907068dlb;
        Tue, 5 Nov 2024 07:33:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXz63mZaySrU2Wjorxza+bPRqe5EM69xxMgy0T4W0epok4oYWqVhQfIFi+E84QG/OH86KbTeWMgeTMuqw==@linaro.org
X-Google-Smtp-Source: AGHT+IERQM04jYYlWWgUI5WBRcaZY6rNe6GjK8jsYP+0i0M7ov6IiRm2ysTosTzLQJWT4kC88aRF
X-Received: by 2002:a05:6102:2914:b0:4a5:220e:6fb3 with SMTP id ada2fe7eead31-4a900e8fa92mr23918858137.16.1730820795514;
        Tue, 05 Nov 2024 07:33:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730820795; cv=none;
        d=google.com; s=arc-20240605;
        b=bnMPmp3ygKNwJ/yffpWaz9k8mSnaFCiypJDx9DZG5A6x6vrxMylvqleZUUv5g7Bz2Q
         ztqI3TB3XgUfPVRBliTLQi8DIeFysKTFloFf4m712yv/4wMloCq9n3ZEO7KWoUWiqpwZ
         FWx3OS89SCDQ1g8bOiM13oR1Ajs/cZ6AO0YCcR5H+gUQlq4lBVBz+FHTykAb+U5knYLG
         KBVVuta/Wq0ZYjFknqtNxliMaT2nSL9w71wlZMQ87aBaAX+lM15ElkgA61E1QWUZmOCo
         hlsI4hJtsShRSzaCS53GXEs8L8XEY7C1k9ZcwepTL+JZroDxseFD1SBqz06fx6F4VU2E
         BW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w/+Dw+aYt6NbuWkFBOKFczpVcmoeYxuOifXoZQ9eKwo=;
        fh=qwQlQavPaQ7lQdQvZpP0bm8+SmYJl/i558Pzgt6evkY=;
        b=MfBUZLbckSabvmvM4eTghizuXLv4sFijuZFhqQstdbEBzNA5L2NR1+tIrqkry6zN33
         CFhpFycvjv6l+BFEJM9lRBGNtJsfTjMuhgkZHUGYh2oY19Oin1q6H8nc9rDTLRJK6hE4
         2ASBTqoFYdxaR5+Zp5O7paUGiwx9DP6F976f4Qw9J5Typx6ODwpgpXmIRILZC2ktg5aC
         3Bye667KWGC3S6RJaXPWAfhsKPStY/QvP/WbYjhQEisDUr+2Xee//kMrVm6cS7gU7rFD
         9GYmM3ing2DPGmoeVSTP03/BWiJVCQ8ODx4gOyai7Ku2u+ENK5ussTy0/bLw4PkWYf+p
         UjxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ekj3rA5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a9783239cbsi1567763137.368.2024.11.05.07.33.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:33:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ekj3rA5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8LWC-0005Yz-Ut; Tue, 05 Nov 2024 10:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LWA-0005Wl-87
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:30:54 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LW8-00041n-Hx
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:30:53 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso10381093a12.3
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 07:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730820651; x=1731425451;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/+Dw+aYt6NbuWkFBOKFczpVcmoeYxuOifXoZQ9eKwo=;
 b=ekj3rA5x7MOLG0krhrECqLm00lL8+uKGFgOrnS/nKdcSgcpfKBSeqJVlw7oMoauf4x
 tEw/HP/yp5UwQfKZmT00xqMQ7TQbSOl5gzpA+Je/e9FiXRKRdTFMXwlKyCo+9SYMjxdi
 ON55kgCcHqBCge2Q4L9NFzkWqUWkcqAsjMPcesnK4BQbkvtIDF0+sqq2ko2qBFAb4fe/
 MxEETxxCEcQgdUPu2/Pqspmd23UkfDYyT2BL6RkkuQTFjTWRySoQX1Nm8bd8+0tPbJi7
 8/ngzFoBleqBjR9CyIlTX8i4wK1USBAVNvtMSuI7XkFX67IEDlBueGttQ1ry9ICkHxII
 Swbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730820651; x=1731425451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/+Dw+aYt6NbuWkFBOKFczpVcmoeYxuOifXoZQ9eKwo=;
 b=qxbnSt7dvwxBDhGr8Ss2KiWJ3UNu9ub40a5MlY2Nqf+bE3Z6B629DO9R8XoR2Tq1D1
 qztdD38A1TbddJ6/FXDSMEAWZaEXvXP/xnk+W0NOgwzMVXYe8KTlrncYCrE23oCALohJ
 1bJPXNJUDcJzlJdQjXL/kxh3c0sI3zCOU/yCt97dMHbm+QLjgv4coB/scAOtDWXrgkJa
 bwuwswKl+9DpgbiJBd0SgGwjMEb9yNuI02OgO0/L8ilvGfjcDXKjBB1SvWkE+2XxPibD
 km2k8Iga+ibsm5MP0mbbQq7gDTSBIMb7uVGPfiJYTLN9SKuf+JrJuIruHy0U5LHUjUqh
 z9SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRqs1HcwHGuh23Kges7nXpXso6RzVsENrZ9SaqxWODNCLhkLKELpDRWgBO87A9i3KXdXEfwSEplg==@nongnu.org
X-Gm-Message-State: AOJu0YwfuUYqMZTzG0OeFXg57uJVesQ8dugP0f9R/wf9W6ad7o00ezk9
 LLyPzga5UnpkjUs2TD+3+GXTKO76qMs8R9FPId0bVbDxXBrwkPU5uKlyNCTzOQ==
X-Received: by 2002:a05:6402:2687:b0:5c9:7f41:eb19 with SMTP id
 4fb4d7f45d1cf-5cea966bceemr14580439a12.4.1730820651081; 
 Tue, 05 Nov 2024 07:30:51 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aae3fcsm1419415a12.21.2024.11.05.07.30.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 07:30:49 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v7 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Tue,  5 Nov 2024 16:30:12 +0100
Message-Id: <20241105153022.91101-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241105153022.91101-1-phil@philjordan.eu>
References: <20241105153022.91101-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::530;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: BQ1HaXz7A/QJ

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0844f5da196..c7964ab784b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -506,6 +506,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -513,6 +514,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2608,6 +2610,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.3 (Apple Git-145)

