Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B3CD343C
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 18:14:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJFMU-0004N8-Ln; Wed, 12 Nov 2025 13:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJFMD-00036O-6e
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 13:14:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJFMB-0006nJ-Am
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 13:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762971250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7+Ad1DQku/KL3b7bCdX4+uTWQCvm0tEszy834Ayws4=;
 b=ID4rNeIpPblYYxfEoBrYe5W66n0vbimx7NLRQMPQVBOxOc/RQGNg9jD4BNGuCsBGHSEXo5
 2k9+AxLOUz1kZVidCbA/h1EAki4zoClA83GB0M7TO5txGlaYeWEWkYUt163740NeOkAhbR
 u63u6V69jl8dTRDgxCq0/ZzZX2QHQHo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-guLOp6W0Nj2iaC6tUU9e9A-1; Wed, 12 Nov 2025 13:14:09 -0500
X-MC-Unique: guLOp6W0Nj2iaC6tUU9e9A-1
X-Mimecast-MFC-AGG-ID: guLOp6W0Nj2iaC6tUU9e9A_1762971248
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477771366cbso23045e9.0
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 10:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762971248; x=1763576048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7+Ad1DQku/KL3b7bCdX4+uTWQCvm0tEszy834Ayws4=;
 b=liSbbyX63Nl3wtCYlSJuIq1vIJBckY9fDQwIpISwk5hz01HaAnQBGNMeSzqcxr67iJ
 DQ5bjOV3ML0jVA97Hnk5joV2LetlPcMwTibG5Ypt5KqZxMVM5hSN0IUmobqOI0g6QNTN
 TCvaz7aVaI141vOV6fNKOIQ3dqSv2wrkH8UpgeObuk/6/0lZ0ow1exclSvdan3Qc4mRC
 /cpQUMWV479amOtgH/zUxmKZaYPT3RjMw/F6Sg+/6uoHMp0Q8wPtb1qMy8HxSTIVIyed
 k8QHu/34CaWd7NKVRKNkGi+g2VD7OEd5YqpRCjGZmRtxdx/b6rLbq0hL3GfZRiPsf37y
 at2w==
X-Gm-Message-State: AOJu0Yw59U/t7EtVIFBVWP1imv7jAoOmB7e8KmPprTb3zI0O1FdLN6Tz
 57pWATcOfpR++h5hNgvFNihuahoPGkmeAzv1q7WCUOHuzJgbOWJbQSnbE76JPnxijaF734i7awA
 3jJih9XHuca9iFVfy+/+t3+q58bqMbDiBFHnaH1qjCkFpLn1TZToM4Q==
X-Gm-Gg: ASbGncvnQ98ihFZQuwRjE3gAUKER0r8LYyzdXRSnnX2+Te7U1FGEO0KJpqP3gLKTSkG
 e2Cgy1r8Ql1ElGXBfP1Xz5Zq9yDQNsy2H1avktfZj0jJBBQTYhfkUseTqayNwza1S0kOV3P2RGR
 XqtmEwsKecURRr4p5jw53Jy0+vbwdRApUUO3kLDFb9Mo6BJWHxVp0B0u8hOtTEF4Z+37qhldduA
 hC0cJ2BFP1HTwW8uzNbFv6OUUTmQortxuVG2OlZj3dIstNWfDA/u6Sgp2bokryIhG6TkzcFnY3O
 4uElQj8wfIF0DaT4u1Nr19SYpKMAzqJu56jCEBsg+L8MNr4axVrteSLplEcffc8lL7B+6IRuA86
 vVAkx7+6jqvE8igu9kb9/5ck9Gm9DDsjdCeYzjepVw5gkAKdh/Xw+9wZ/jSzVFw==
X-Received: by 2002:a05:600c:1d0f:b0:471:16e5:6d7a with SMTP id
 5b1f17b1804b1-4778706ea91mr33694075e9.13.1762971247844; 
 Wed, 12 Nov 2025 10:14:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExx7YrdQI+IydYpEMMuMdDOGxLo8j/rSItSIu9aQs64pFfJY+BoQHkmXgSTSSwlx02YpTuFw==
X-Received: by 2002:a05:600c:1d0f:b0:471:16e5:6d7a with SMTP id
 5b1f17b1804b1-4778706ea91mr33693785e9.13.1762971247394; 
 Wed, 12 Nov 2025 10:14:07 -0800 (PST)
Received: from rh.fritz.box
 (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e51e49sm46851355e9.7.2025.11.12.10.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 10:14:06 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 1/2] target/arm/kvm: add constants for new PSCI versions
Date: Wed, 12 Nov 2025 19:13:56 +0100
Message-ID: <20251112181357.38999-2-sebott@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112181357.38999-1-sebott@redhat.com>
References: <20251112181357.38999-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mb1o88WyIqwjtwIfyO-HVyB04HeHKiyxv8bOgodm3cw_1762971248
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add constants for PSCI version 1_2 and 1_3.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm-consts.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 54ae5da7ce..9fba3e886d 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -97,6 +97,8 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 #define QEMU_PSCI_VERSION_0_2                     0x00002
 #define QEMU_PSCI_VERSION_1_0                     0x10000
 #define QEMU_PSCI_VERSION_1_1                     0x10001
+#define QEMU_PSCI_VERSION_1_2                     0x10002
+#define QEMU_PSCI_VERSION_1_3                     0x10003
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
 /* We don't bother to check every possible version value */
-- 
2.42.0


