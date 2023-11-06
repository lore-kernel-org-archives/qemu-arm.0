Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2676062eja;
        Mon, 6 Nov 2023 03:04:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpIPVSBGhRJWgtgcJwjEErXSuheI1T5S4zGFd1V7GB756skj0B3nwRb619C0ab5//i1Yoc
X-Received: by 2002:a05:6a20:244f:b0:15e:4084:6480 with SMTP id t15-20020a056a20244f00b0015e40846480mr13855926pzc.27.1699268652862;
        Mon, 06 Nov 2023 03:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268652; cv=none;
        d=google.com; s=arc-20160816;
        b=NIzN2Y+zns6ULdSyFTkrW+mNIE4dKSQrmrr9z0We7uvqWbOSL5kmDiuAIoNW9Kr0eq
         sF1VCEOb7efiYGMyqxiyWhKMjP3wpWGSwF4wm6v/E/fAkErCzt+q0RVp8iMogX69ms5t
         q1S8Lchn3MSJRaoGn68i8uG7TThJJr95uZpFPg1RiW2Sn1MqHIJrpLz848vYf8L+bkMu
         sG7hBjLz0wck6zGxe2MOkzgYmdxI2tVtNgCiuyQ+Qmp7ohv9hsHb8KWQy3iiwFMG0etB
         OVMvwxSIQocen9j+9j2EsJx9j7+SyS3+Z9mjavNM/znm0koEwkwy7tY0yWr33H/+4wnQ
         QWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=d9nIh4jZ3rUpsBw4LSZSNiaZI1TuJJRNoEVBCo+5kN8=;
        fh=cH6NZHz0vX/LCpLYO2a9Vsevc7oJ78/4JiVNewc1xN0=;
        b=wj3M7hRSnTCK7vqeFaSg2DwIugTfhjlqUrLRbwDzo+HNP1byGo68OcDMYbPwOxkl4J
         x83qx8bOGVdJS+IyUS+EXK790csvjwmwLIudMbBTfMxSm9ndRLWxzuiWWZ4c+kIH/eQA
         AzC43aoHAJ5kWiKwtRCiZuU5fPSqOYSwhyLg1cM02B3+rjKbVnOBVekjZ+I6o7gchZxx
         5oPaWp0KKXvc22SmRPNT0155kfnDnW73gVUHvfz4RScHLfhsJG0XNHyImwElSQexTpdO
         afhGl3QmzK4JmQxSmbNP5TtDhWuVkGONQbd2EJYAPjcu1bwQdlWm0X9fu2t0Mey1tisj
         uVcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BaU0smQd;
       spf=pass (google.com: domain of kvm+bounces-671-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-671-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-671-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id j190-20020a638bc7000000b005b8ac0af52csi7340156pge.1.2023.11.06.03.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:04:12 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-671-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BaU0smQd;
       spf=pass (google.com: domain of kvm+bounces-671-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-671-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4B4FB20E60
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5831EB2C;
	Mon,  6 Nov 2023 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BaU0smQd"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D0F1EB29
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:03:56 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E8DBB
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:03:55 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-509109104e2so5570680e87.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268633; x=1699873433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9nIh4jZ3rUpsBw4LSZSNiaZI1TuJJRNoEVBCo+5kN8=;
        b=BaU0smQdlIyA05qINXOo4to7vqfUT3jnu+wuKPcKFYEq2Y28PbNBKjo3CcbEAFLNTn
         D5ySEE31D8PfBRkEYvTfB5G554LLBRfzekDQSI09Cec3CvTS9ecp43SvJQr6iRgetcfk
         Ybxtlf3hwyfk1WLpSk0348Nxy2W2qRcc+oYXcRKDypAvtrQUeCPe1W7TOqmh1C2PSTFq
         EPcNmtSkMtDXmq/T/K+XLOz7FviBFBidt14iRiqHKILBQ9mp1BN6G8cV8LS64C2pMfi/
         t42QhuPyhH6icvv9a72lGCUDFJdi2twmwgVVcYF0TSfm1EfDoXjuAieLfkk6V1Xf3QYB
         8K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268633; x=1699873433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9nIh4jZ3rUpsBw4LSZSNiaZI1TuJJRNoEVBCo+5kN8=;
        b=Ae5X/V/fC2a7AKb5g/uqsl9Gp8EazAQQyeSLvzHdKv5jQtIckhc05WyUc75Kj0NFn+
         u6KzRvxJghNTzvVYzK6kvq3f3ri9FLGCLHwRIEzdwSMm32KsHz+uI+uWln5PDa9Jhovl
         VQix1uq+Qafdp6gNl9ydZqqJy42kKp3yNs1OsIipGgzG7cOLpvDP6LqGt9yMdkEiM0py
         s8KmyXloH79rLNQcQRf3clvOdImXMC9ewXgQNZ1kop78jDZaj9LXGXgbWV1991oOo1eG
         6STreswYcDmLyKWj39esBfDmCidpQD7hE5bdrhpJfkPdGzmmItFr9OB7sYvEUGuW/eXt
         WoxA==
X-Gm-Message-State: AOJu0YxpaLNNhz76ElKc0LORYInqmBNkq1XsTCMO5EskjQN3aLS7KP/O
	l1+atREJ9IYIjLysY1Nf8kUoHL7mlGQHP+0sK9Y=
X-Received: by 2002:ac2:51b0:0:b0:500:b7ed:105a with SMTP id f16-20020ac251b0000000b00500b7ed105amr19847445lfk.29.1699268633369;
        Mon, 06 Nov 2023 03:03:53 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id p12-20020adfce0c000000b0032dc1fc84f2sm9188671wrn.46.2023.11.06.03.03.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:03:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 02/60] vl: constify default_list
Date: Mon,  6 Nov 2023 12:02:34 +0100
Message-ID: <20231106110336.358-3-philmd@linaro.org>
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
X-TUID: 3sNonnZnJEx3

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's not modified, let's make it const.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231030101529.105266-1-marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/vl.c b/system/vl.c
index ff76eb0d07..8c803228f4 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -194,7 +194,7 @@ static int default_sdcard = 1;
 static int default_vga = 1;
 static int default_net = 1;
 
-static struct {
+static const struct {
     const char *driver;
     int *flag;
 } default_list[] = {
-- 
2.41.0

