Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2545021ejf;
        Tue, 27 Feb 2024 00:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1sGoyke9BNj+az+p93bc+Cc4xhK6Qj31c7xLk+YqjO4a6s/Ub1otNmqVuEi39B9rOmZJteerv25hkF64aFmbzYvoAd3eq
X-Google-Smtp-Source: AGHT+IGFUzq3BKH58IepH1KoOsd1sv0TcV3BIBBa/UDBE/1COfkyFSFhK+MFP3+LH1FviaZbibZ6
X-Received: by 2002:a05:620a:55a7:b0:787:7752:b1cc with SMTP id vr7-20020a05620a55a700b007877752b1ccmr1503299qkn.15.1709023571629;
        Tue, 27 Feb 2024 00:46:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023571; cv=none;
        d=google.com; s=arc-20160816;
        b=nYJaqjLH221659Fb/e2YUNXbErp0yKgNtuRtKJdiqAQLVtrd2ctQja8BCLPyZlvCMp
         g9VP/0Z1QZHaqk+pWwDjkttb1MJBsTAfXydjJVp0EeRxpelDudiyd5B2ql5jTpbIo+EX
         GXVrg13BVtU64znlwo4n85LxuqPW6JrgDUske2+5PZ8JUAM7Ct3DIglHIbjVUrHTssJL
         nmGLsUU2NMTyKRvI/fRjFN9NeNpjSaW0BSMiS40362x7kQDq50e81+3jfuW1AWnZTSuz
         ZbR150OZibCBGtDUDKMQJDXTcsAjy/LkIHeoaZan8xOSarvOJbfGBl2rkKDr4qPsncxT
         aQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2Yy5kHw7b+fXUkeiiZUfupvxhJnRIRkwmG0B4GAOIY0=;
        fh=facu1oTvKA/HKN7iCFvkDafETsZNhTzOJ+0oB5Qc1ZQ=;
        b=RnkSOrPjbEfpToyxzhb5hGanMNsKWganbabCWlstDGUw6DJkuRecOdPtZaUUKAOI93
         ypU8WJdh003KAk1WBiVGAD9/+teMK6Q3WXiQQW6F+gNPXdSp+nq+3F7hJ3JsWMV2agzS
         /ryj6GrxTs3KHVqwMm2OHb8MGuipC9ga6zOKbnshZ4P2jjo3++aZfaviKco+7cb/TtKj
         CfM1wOzDyT/fVvNjMm83O8AGYhn1AGQjhQzc9KQuxeeQYU0iHjmjInhl0VG5EtLC9KiY
         nbPuGRXhsTgtpw08sV6x5op1CJBJiPtz4uYeyjjzhApzNz4xtYfrReKGMcaGuB9ZOoUW
         VUDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GonaCAdQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05620a134a00b00787ac643457si6788486qkl.70.2024.02.27.00.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GonaCAdQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret2M-0001Ru-Eo; Tue, 27 Feb 2024 03:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2L-0001KV-JC
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:05 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2E-0008H5-HT
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:05 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so5196959a12.0
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023317; x=1709628117; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Yy5kHw7b+fXUkeiiZUfupvxhJnRIRkwmG0B4GAOIY0=;
 b=GonaCAdQfNf93rro4lzApaXfoma/f/Yw5A4oyNEFDtWcKpAYkgK1ZINyAygZOSLhAZ
 plj/dBbovFwz6yN1BDVm8Hh7FmWkXSnOVa1g4De5RvDF4Ocbr1y/EQRUfb5sy6qchCoS
 isQTtEVGygvvkgH983UOdTCFuUdVK9F02tJYJWBlYCdxv3xIfsgIx3oNqJoozeCRKSWF
 K6We8GpnFciPV4N7tvgCxoOmkQ8lvSF7AwHQZvFIos8EPWbfdCK2fqfZfLUNwb++/fPa
 2buf+JyDtK9LgLciI6WRWO389/16lYDGGntEnGQUFrfU/s90vrdd1UpMXExTPAoW4m5E
 ck3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023317; x=1709628117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Yy5kHw7b+fXUkeiiZUfupvxhJnRIRkwmG0B4GAOIY0=;
 b=FtFVktQJYJJ4RKN0w7gLLmKm51/h0tbQUghmhnLBKh8jbUcfN3s2yshhchDu+eCy7P
 BMS0mFdnaUIq/A1RxemLa5rJWWVhFl7bhYjpsYg2CBaIMi/j6TPJolHoZEnu8kpW0eVu
 g39J4g67JtA36wjUwr/geHVuclgEl9bj02kJwl9sXq+4EIuaIZoGFFrj/sGQX/Ry3Lz9
 ocGUPKa5UWTnSum+hR1lGT1HAoLGq+q+8scYkRtSv9VK3mz9taBSaD7oG/sUR4Hme/bD
 mgkRwFMOYmuY3KPVwtu9NrgaJPyDIW+RSANnLdP6UbYdxxe5nFXOMhPIcHEg71fJcFCQ
 tBag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4P2fsB0IdkXfZRHh1j6SPzXzZD0cF3f+NJgGYHl3gUeJ1dacyKYmEBbLjFzXFJDgrJ+IlUqchI+4DqhggUtPnbs8f
X-Gm-Message-State: AOJu0Yz0WgChGuz+5l5Kqv0GhJm+WLOsRoc1VUHg29H3qp+VhyCw1g7d
 V3K21fyP/m9dOYPHs4+E+a7LKvZF3Vewpyz86XFtplZMgnMOU0XC6tmJj2S9B1kwVsyPKRXfN0I
 T
X-Received: by 2002:a05:6402:b14:b0:565:63d6:40d7 with SMTP id
 bm20-20020a0564020b1400b0056563d640d7mr7121911edb.5.1709023316976; 
 Tue, 27 Feb 2024 00:41:56 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 u11-20020aa7db8b000000b005653f390f77sm541381edt.10.2024.02.27.00.41.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:41:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Kevin Wolf <kwolf@redhat.com>,
 Minwoo Im <minwoo.im@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Subject: [PULL 20/30] hw/nvme: fix invalid endian conversion
Date: Tue, 27 Feb 2024 09:39:36 +0100
Message-ID: <20240227083948.5427-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: npZAJat0faLf

From: Klaus Jensen <k.jensen@samsung.com>

numcntl is one byte and so is max_vfs. Using cpu_to_le16 on big endian
hosts results in numcntl being set to 0.

Fix by dropping the endian conversion.

Fixes: 99f48ae7ae ("hw/nvme: Add support for Secondary Controller List")
Reported-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im@samsung.com>
Message-ID: <20240222-fix-sriov-numcntl-v1-1-d60bea5e72d0@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index f026245d1e..76fe039704 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7924,7 +7924,7 @@ static void nvme_init_state(NvmeCtrl *n)
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
     QTAILQ_INIT(&n->aer_queue);
 
-    list->numcntl = cpu_to_le16(max_vfs);
+    list->numcntl = max_vfs;
     for (i = 0; i < max_vfs; i++) {
         sctrl = &list->sec[i];
         sctrl->pcid = cpu_to_le16(n->cntlid);
-- 
2.41.0

