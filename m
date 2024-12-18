Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1202618njk;
        Wed, 18 Dec 2024 12:23:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWF/N4UJhePB85omKvU3FxUPUtZPzurUKo8yaj6cfWq4r2pB4M1ExcOmOs6Yq3HoOMYdWycH+3gFPdvWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKYw/hm9x6/lEdPSRyGV/HN6FYSu+cjpvLHyE8zFwKZOB+/Hnt4vR6UsDoq0mkiNrv4jHw
X-Received: by 2002:a05:622a:99b:b0:46a:2876:d667 with SMTP id d75a77b69052e-46a2876f0a5mr54725631cf.18.1734553386454;
        Wed, 18 Dec 2024 12:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734553386; cv=none;
        d=google.com; s=arc-20240605;
        b=BnFpBMzdsd9KxU3IyOXPsuTfy/S53U3gaF7sPCtBbKNd+1POgIOdF2yoUp4D10dF9v
         udsYPixYbcnmIMmu7V9DGwXKypWjk1fKITS1redgp7JWUHdb7mDpAQJ/VGLRFnZxFOWn
         Hz7CebDE3jUM6qNMSb1+89Wn03CYzJu/S+NO1+pBoQ9MwUgO1+V4kjv6muvVdAamo3XX
         OecGYGZwhMU76ZnAoJUmWu1PPpllJnyCe8CVI0O1RiPcvguQ2747YWmSHAaI7gTIa8oo
         z3I5BWP8OdXBdjp+HU3CXxg+I4KF1XRQf9MgPA9tdHedVN5qS4KmtHdWdYlFDwCvOnth
         6v+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tWKYgt5aMGAKvg/2WjXvMcUsTzDGBxtHl5Z/cPeCSWU=;
        fh=VwXP9V7jQe6k3D0faq6AKvXqmzXsCoDVWjt65RJa+OE=;
        b=IwydToRzfQzYeJlBa437vRQTLoQanzalRinenMtTei03cwy3v3JImm2JpEmPL6hloo
         g49jCCTKv5l1d6mz/h6n82WjTV2p+9OaNBkFg/Q2b00P1ayTrfrL9+sbrHGMl/rZSS49
         oIOk9x5G8ESXg0ibpVWljp3RoeyS0Z+43z8Sth4tjCpQKSK/3Ib/FvIg5nrGG9OdIEzt
         RMLz+gPH9aoa2E9BJ6H1AxjsM6SXfvVRqwpWSIk15hlSoOfOvsp7WkhFyqfniqB/V3Z7
         VK1Nej26IH0pgRWSMjxr3WGyrEWneccwxZjpLXLzLYLuPAVuL/bAlH8JDn+a24Ke6J+C
         oWfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="f/xArgV4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048e61a3si1242082285a.570.2024.12.18.12.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2024 12:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="f/xArgV4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tO0Xd-0001Op-D0; Wed, 18 Dec 2024 15:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0XY-0001JY-Pb
 for qemu-devel@nongnu.org; Wed, 18 Dec 2024 15:21:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0XU-0000Ge-F4
 for qemu-devel@nongnu.org; Wed, 18 Dec 2024 15:21:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso73304f8f.0
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2024 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734553259; x=1735158059;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWKYgt5aMGAKvg/2WjXvMcUsTzDGBxtHl5Z/cPeCSWU=;
 b=f/xArgV43ASkNj3QHfcC1KI+CdQVWC6tdaFgCgx+NQyXN/AcxOv1bM7MaSqmlm2WKo
 f8vFaBdKWAYkUUeiuizrKwWyX7gU233gx4LzfB0kHeR9lcORbg9NaSKmNc02rUnVOa0I
 wAbOCnI8praGdNQ8PWsx/qX+Vd545qGmusJVPm4lCnt/FZOL+iB+Quh1FL38JP+3jISV
 sQAa8oeYkPZ2ubJiy2BvYN+1MBJyvlWEjnu+vYjNJLD/B6cUhHppZEulOfw8Bk4ReAUn
 GmtDJCRxT2aZH6yvAzKuATW7BBLv69DBHmGX3qG+RSN65AuIEwF1RPYM8zdUOqgA2NU2
 JLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734553259; x=1735158059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWKYgt5aMGAKvg/2WjXvMcUsTzDGBxtHl5Z/cPeCSWU=;
 b=URSZJOqc5uF5cFsC++ivlzOZKKHmu86fUqufS9B4gKQ/JWHzMb1wddESM47T5YpMbV
 nkQIf/01GEOC5CiQ+MGaNnYILDiAe6xCQ29iPpFFFuA+JA08m6oE2YApUAaMgmJ4rN8c
 qRJsZ85j53wMhsLLxUUpj849NHfrqoDqdYDFik4fNjCAcLYEH19OQGIiBn8TA9cDSdmo
 CtIyKhtegTUnZnE8f9XEnv4QslRjumKGd364dmN5u8gW2FGkPHzqUpHvksA1eAd8bJ+U
 bXY8Bkn8k9YmBZ8gu+jEZ5GlKwIpSHbLnvAUDsA2gJ7OY0pI9rGeF2y1w6o41/IP5DdC
 tj6Q==
X-Gm-Message-State: AOJu0YyRmFtNMQf4L6wXZQ6ZgEqOQPPJYRXtShza9cki2YS2xDjisrJs
 FCcveLYZSVo2yZTMREJSTnWHUG9qoJlKk3/vOzAulNTnoxAzQ2d1ReKk2JRYgnlUn6+HB3OjD96
 aKA==
X-Gm-Gg: ASbGncvVtfq1SllBUxQwKkCQy8X9bJcfvdorwoihnIMdwJTal0dAs5Xcs6k2er9vtSe
 heXHmxXd1LYS49GNfkV5AZYCfUiCNx9Ngj04T2CEKW27JxNetLq6RFZUbZXxP99ToVfjfart2el
 G3kyzveNDAPhj2bBmubNEzZM51H4imzxAxrVBY+0QrCx5MbpLkG5vGZKDyPa7IwImmoVeF1CMHQ
 8jhncos8iDidvL3bedcadbgwIAC5n+tt6AZx3DkmF00nPVrug7cbq696czqV3ikbGB4LYEJCui3
 NMQzLE4OfrzGcg1ipHV3zEiiNt24Fhf1
X-Received: by 2002:a05:6000:188c:b0:385:dc88:8214 with SMTP id
 ffacd0b85a97d-38a19b34d50mr959801f8f.43.1734553259003; 
 Wed, 18 Dec 2024 12:20:59 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120c7sm14842267f8f.13.2024.12.18.12.20.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 12:20:58 -0800 (PST)
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
 qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v15 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Wed, 18 Dec 2024 21:20:26 +0100
Message-Id: <20241218202036.80064-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241218202036.80064-1-phil@philjordan.eu>
References: <20241218202036.80064-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::433;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: jFM8kcgbztdY

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
Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 822f34344b0..5aca2833c2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -507,6 +507,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -514,6 +515,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2617,6 +2619,11 @@ F: hw/display/edid*
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
2.39.5 (Apple Git-154)

