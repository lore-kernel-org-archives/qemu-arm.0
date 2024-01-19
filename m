Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp878672ejg;
        Fri, 19 Jan 2024 03:36:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqB/La7Z8sN47c7zoU/JJsz32qFHkm3bXHEYWSCLZYNjfwSJZhnJTqYunCHKGApw6UceOo
X-Received: by 2002:ad4:5c69:0:b0:681:931d:20c0 with SMTP id i9-20020ad45c69000000b00681931d20c0mr961649qvh.24.1705664201705;
        Fri, 19 Jan 2024 03:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664201; cv=none;
        d=google.com; s=arc-20160816;
        b=SHzjMNT15cZoN94Xh88wek1jRqsK+N+egpDpmmMJm3aqI2zUU5nDXrDM0FrPiElysY
         KjPVD/3noD3vwR/k6FXMwgITysNEq5pIvvs7ZHD8E+DnktopPjcymRPKx5PHKj0xE4Nh
         330i7jJ3O9Xe14P7lMLCD3MIPMGUTVyi8etaVT/MK4bq5ph+5h10prZJPqkj9QR/Af1f
         jVk6g4hl1Js1JTdOsQPaTMMUMkI6r78xvaVN/Ep8KDmBiSmFOj/UrQSvSFsjKHiNKqQl
         1huLfF0AV5VKrA/c59QnrOPxZGAiTkvWcZ3A2i/LNgJASNPkl944K+Q/jJewTLpkLzu8
         F97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4V5MwJ3yzBvCl1jR3LZsLDTSMljFxa13ddLlRCJyMuc=;
        fh=ljlq2IERA83R/N9I+W7btu6jk8dnbNWtb9KZN1Aqt3M=;
        b=yJwJHTkzlFkPc5PNzscMFHWmNQsUsHJMiumCATOnNk3k87kTt+/SywDrE+GabYoeLD
         Re8nDAd9cy0A7Jw1SCn1+n/w0NXlkMEEKZYxAw5+4kBcaRyzmeh4uijclbTmpEDjqCfE
         wLk1DXDgDFcY8Tw7JGIsYO0pnHpO0QGnFmCikrZ4B9xBs6Jtb18fTPnl9nYl6E19vB9a
         871dLj6JixQ8DlNbQz1qjpAKqzHCV7cb3r3qF6o9x1cXGJwA4giQQ9Xk9XtsmkUCu1W8
         z6gAWptCkVZg/f+BEAXREBvg4ejbd+kldbqAqt72SUvnfhU69Yh2VFlrlBZqIWjMJAtk
         vu6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yjueg+Bs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020a0cf586000000b0068177f1fec2si6474785qvm.556.2024.01.19.03.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:36:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yjueg+Bs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rQnAg-00038P-UT; Fri, 19 Jan 2024 06:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAe-00030F-O5
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:36:24 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAc-0002O2-AT
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:36:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40ea084ec14so1271045e9.2
 for <qemu-devel@nongnu.org>; Fri, 19 Jan 2024 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664181; x=1706268981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4V5MwJ3yzBvCl1jR3LZsLDTSMljFxa13ddLlRCJyMuc=;
 b=Yjueg+BsESEHq9lwdZMlj9v/mN0HCf7eMYlMOQLpLYbgvcVKiNW1Sy6NVRBUw33doa
 WiO3dlMZtU/SxsigLh4Ik7Yl91tqU4gMORI2UCjhQvD5Ljkwzo5AGs2WpwEl9QyT0VsO
 J3jmC4vardD9+EDk58bRG1JOn6VBL+tDpx9wfRW8NZRpjvMsy2M2HaTnGt0/VfBe3b8b
 VrYdnDrEPmPrRyJYSBPeYC4Ed3ldnT2eDO9efu0cw4ZaPuNKLmB1sRjKynUzEPkTLrhd
 e0er/XjafnznvGibE7vmn5yQlzni3N1IaTaTdPKW4k62wx/1IT9V3KIWpcwvVg3n8jFY
 thXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664181; x=1706268981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4V5MwJ3yzBvCl1jR3LZsLDTSMljFxa13ddLlRCJyMuc=;
 b=bSd+Uuo1qLbBr7jif/87XgoQPx/Hvcjr9+Xmcgon3l8qm4LFVV/mvMpmgymwtBu0e6
 yDqxe904NQ5HUnvOJDFmZ8RR0nNp871EdCh9eWT/7hQLYq+78gQuqZrhOs6PAAliPrh6
 E7Qi/MWtJ2T20TxmnS8ayp/4aC6sEgxW5hDsVhvWG6Zusc2Y1djbucQA6HyrJGIuqDzB
 Dl9vNa+VIM1PcDl1Uz4Bl533BlUkfjKjPKwvRZzLDOir4NuhWYM7hlw+pD7Ejvj0+qD7
 GuxESyHfC6C6cggxC8cgj670oRNQ4cWRrkFACFtlZhBRYR1P4rwOe9CDTcgTTqBR9cZM
 o67w==
X-Gm-Message-State: AOJu0YxfWxg2mxzMd8jQfiPjgmHTArmx4zs1IUWlVwWvo5PPLfEpcej8
 1tYZO/u7FwB/oustC6uexkmCvd4tvz9+VGKxh/FPfmNr9YnsZQ5FsgB5vfXfWqdcep63H4Lswy/
 4pYu2SA==
X-Received: by 2002:a05:600c:1990:b0:40e:50ac:d24e with SMTP id
 t16-20020a05600c199000b0040e50acd24emr1781197wmq.13.1705664180890; 
 Fri, 19 Jan 2024 03:36:20 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 fm16-20020a05600c0c1000b0040ea10178f3sm237439wmb.21.2024.01.19.03.36.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 devel@lists.libvirt.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 16/36] hw/block: Deprecate the TC58128 block device
Date: Fri, 19 Jan 2024 12:34:45 +0100
Message-ID: <20240119113507.31951-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E+CPwXVS2Cs1

From: Samuel Tardieu <sam@rfc1149.net>

The 16MiB flash device is only used by the deprecated shix machine.
Its code it old and unmaintained, and has never been adapted to the
QOM architecture. It still contains debug statements and uses global
variables. It is time to deprecate it.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240109083053.2581588-3-sam@rfc1149.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 2 +-
 hw/block/tc58128.c        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e6a12c9077..15e39f8bbb 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -273,7 +273,7 @@ The Nios II architecture is orphan.
 ''''''''''''''''''''
 
 The machine is no longer in existence and has been long unmaintained
-in QEMU.
+in QEMU. This also holds for the TC51828 16MiB flash that it uses.
 
 Backend options
 ---------------
diff --git a/hw/block/tc58128.c b/hw/block/tc58128.c
index d350126b27..6944cf58fa 100644
--- a/hw/block/tc58128.c
+++ b/hw/block/tc58128.c
@@ -202,6 +202,7 @@ static sh7750_io_device tc58128 = {
 
 int tc58128_init(struct SH7750State *s, const char *zone1, const char *zone2)
 {
+    warn_report_once("The TC58128 flash device is deprecated");
     init_dev(&tc58128_devs[0], zone1);
     init_dev(&tc58128_devs[1], zone2);
     return sh7750_register_io_device(s, &tc58128);
-- 
2.41.0

