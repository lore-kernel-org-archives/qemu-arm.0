Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3808443njn;
        Thu, 16 Jan 2025 07:01:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpqAsUdxzMTIml2vH3kw3vVqemRTZduIPm5hmxmazi/tH1RGUl6JMKqic9rYnQ91RBczf/z8dwMEFfeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHijWf2MM2fORBpLOjlZGmFl5bavD4CuPzpFvvi97Y9FxVHL7m9sWjfxL21S2mSZ6ZVhljL
X-Received: by 2002:adf:ae59:0:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38a88b898b4mr22635235f8f.2.1737039698925;
        Thu, 16 Jan 2025 07:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039698; cv=none;
        d=google.com; s=arc-20240605;
        b=XBgYuOcBuT+4g89cX9iaRCvTjmO972Vh0DxXUF1ZraAWTD0NgJoMFwETe/a3v7SHaR
         H4TVgCjzhmC602ddes8WyOrhuUFTPjGgZj7R7IUnaP7BHsFXquN5GQTw5WQF+peGDNyK
         paYfGTGd3IYwUilkhbIdoYhIF6RweV+VFRUDAJMgL2pcotR4Rbtpe0voK/MiK11IVWhp
         Q74dOtgyvO6lT2d2JRuvzarBCQpo+DoNcZhb+Kht9u+7aj+RuRg+/Nfo2y5zTgj53IJQ
         sXZ+ERAklygjkg6lPlIe2IffCFW4TNpYjfrdKYo463naJ2aufpoOJoYwq19CMX7FDujr
         1xuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ncjei48IWitzJKqL1woSljhbl8hcDr3h6yIvRO+sxGY=;
        fh=SE2760jRVPOs7sxBizymfCBS5/W1vLNWf05dAOQpvAM=;
        b=cM7tJxu7o9s9XF2pRGVxH3ZojQ48oFsGh9EK4kbGepAh9JksY3ujOOMk3XeNMoaPUH
         C1qJnKSSlPTp39B9QIIUzDIkLgRsPhvAM5Bt/P16tViJKiYmh5fAjDk9fCf6Wt/85XnI
         QWnGmBOR2riZXziQJvupdsG3qfhQZAlyJLZiYC622C5sQ+1I+47ASPcyokNuME1uv25M
         +XTc5rODHXe2ItejG6egbxZcdp3WZ+iwpzyIuzhxpmx+wdfl25JdvrTzlJSRjMzoPh1h
         P79puN13ZJ1Q71giCQuqZZpUWkLSZqJzKdQLcnjhiIhkSqg77VF1TEXB5oePP4kqkYWi
         zc/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fMKEOyar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38bf328374esi46467f8f.543.2025.01.16.07.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fMKEOyar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRN9-00032l-TI; Thu, 16 Jan 2025 10:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRMI-0002Oe-Nj
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:36 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRMG-0000Bh-ER
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:34 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso6800685e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039631; x=1737644431; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ncjei48IWitzJKqL1woSljhbl8hcDr3h6yIvRO+sxGY=;
 b=fMKEOyaroFi/sI+VcoinB2qR1vcq0EE5R4ZiTLqv0Ho1UXRCGOVuHQIFwMueBnmyac
 fkvoh28cGdA+B5oh1cy0X4Wzf2pMlseZWd+Phds2r6za4Rkg8Pfrsi/52dp1Bon1fycS
 0o4jLXrs1pWAg7ru5lI3psvxzt8CDZzGxYbar91NKrXcM4jGagxzregu4UufH9Ie9sHD
 ipiwQnAGemADRqBnhC+hyDiW0CAlunR7ayDNcfAhDgkjOvgZ4jBLcBmi7D7O2Sa03mgP
 S647i/ueRlMiqpEhqZbrQWR6VR7jEQiH3MSrtaagJBjxJxmoE81dl94NpTCEnf76YGCo
 m8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039631; x=1737644431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ncjei48IWitzJKqL1woSljhbl8hcDr3h6yIvRO+sxGY=;
 b=Tat41hURkSDUY1teUnNuUUBL8Y3SHOKyUdNkBUK7sal3jjks0yikr7MKSELa87ybaI
 n4PPhW3y8BUO6CQgSRo3T2mnUubqsWIHzP8VTmGr+x15tUPtWOs2RgeSIAQTxgPZx5yp
 UqjNy2kWIVtB1L2BVk7XgpGmcvcdzHdBaixHDrIEqjtE6XqayUQSGWPQ8AlGsLR/hX+V
 PdYmdOer+iYtcDZ5mcJn38qRCenWZUSj1Ql0QEw955byoDbLL0Zplo8Aa1Zl4fMRobMS
 R9E//0D4y8YLZEMoUbBM9yoLKDz7dy/3DYraiSK6wShx4nAILdV4jUBaW5h2VBCWzFyL
 /aig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwDqoBY3JG14fG7MVcwNREXAXxGJXJo4O2bbVwv3k39d1XlTX1zhY5aeyE2EaTgYTEDlvsgr1aLg==@nongnu.org
X-Gm-Message-State: AOJu0YygjHtsXLNK0M82WLAQyY1OwNhiH7hvaXPZyUdMhwlrUXCM80T8
 fqDODjNtcKx9s97NZqd4QuKx/BatBGtmSLprZNudRCVAWZNPpzS07jT3orD5P4c=
X-Gm-Gg: ASbGncuTGJsnW0D9z0MttYaQp43SPWD5yZBcQvEAabWmmPsl4aycOYTqx4mSxjKvq0p
 zZ6J9fbyaVucsQLG1GISADocOhPYtE+D/JV9Yqt3j/1ClU6dyXEN6VaTcbghzXlMld67ddCvsGk
 vfjDb0l2WnGPS6d35hsBRFDer5OzCDI+P5uS4Y8QWLfsrz86iKLbRJ6rMT+oUuOPi20mF75i3uJ
 5UamZWB6j1O2AIzw+fr75uIz7ljw2QdPIRM2FG7OhjGuGDYc2Af1eJ9vMS+euMG07s3DMgLUgWb
 iRA31ciaeB4bUGsOuwJQ9q4mryOIXFI=
X-Received: by 2002:a05:600c:a09:b0:434:f609:1afa with SMTP id
 5b1f17b1804b1-436e2684aebmr303238395e9.4.1737039630130; 
 Thu, 16 Jan 2025 07:00:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499932sm61857625e9.7.2025.01.16.07.00.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 07:00:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 09/13] hw/arm/virt: Remove deprecated virt-2.10
 machine
Date: Thu, 16 Jan 2025 15:59:40 +0100
Message-ID: <20250116145944.38028-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: NRJe0kzR7xfC

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 14fc4b100a3..54c7b92b6d9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3551,12 +3551,3 @@ static void virt_machine_2_11_options(MachineClass *mc)
     vmc->smbios_old_sys_ver = true;
 }
 DEFINE_VIRT_MACHINE(2, 11)
-
-static void virt_machine_2_10_options(MachineClass *mc)
-{
-    virt_machine_2_11_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_10, hw_compat_2_10_len);
-    /* before 2.11 we never faulted accesses to bad addresses */
-    mc->ignore_memory_transaction_failures = true;
-}
-DEFINE_VIRT_MACHINE(2, 10)
-- 
2.47.1

