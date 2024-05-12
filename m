Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp1514323ejb;
        Sun, 12 May 2024 02:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlXhCQpSzHJ4Bfc+u+6Pm8Svs5ssExJZkKuYnVFpQYEDJJpNrTAdfrHRbx9a8zGDj6n1LsQWnk/Bh46grlxC4dAmPeVlaY
X-Google-Smtp-Source: AGHT+IESj1Iys7tSHBx27QTSihrvv4hnWiJT9urasam3IKXGQLBWDYHn4/m1bYZ2KsmNrUa7c5qx
X-Received: by 2002:a05:6214:310f:b0:6a0:9388:885f with SMTP id 6a1803df08f44-6a168179594mr88216856d6.5.1715504463516;
        Sun, 12 May 2024 02:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715504463; cv=none;
        d=google.com; s=arc-20160816;
        b=rElBcAcWNKZfrvSunuI5MaR542mL2R3VNHSVl0lCOYisPsNbCTiyOks17TWKMDcJ00
         F50znEKwV6kce/yNl6lHojbAT0Lmog6mzJ+brQzcR6zY09dnXH7nmqVoyhhZOgYnAtFw
         LadyQRavsHYVxRzNgN2IMKlYpxNEPnoUhtYtZRf5UQQaD7u4A87tBk6n7guFZ4k6QhYo
         1wKPnEFSzXkFyho2UvevEBOheNIQEH/goebF6IGPaVgzYk9wFvOFAlSibKWZ81b4C1GY
         gdQm/XOKyYrcCyDGeAKHounHZjeZkgY9SOlyuT9qEIqq+j1Sb0T/68U2tMomJ+6vWxel
         lisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=s2HUUSV/R8kHZKSr121aPfLsWX8/+1NKAhwK3cedQig=;
        fh=PgujkUoiRNTACQbf+oTtZVyxLRk28CoaDSrL/NcpRBI=;
        b=DT3NuXKsfiyGR/8wgwmbUyAC1lAnqtK0kyv6dRs3eKwy5sUHiLE6V5UGbJsWo7DiEn
         TWx26YTayHb5F6MbqyAclzJ4EYIUeSmXIdUIXyqpnDxrQjRMLxv0a4ZqAT2XLgwNYglf
         0CzqbBv/edBron1AR3PRZsUqPkdLNldyhXE60ZpV7BqtwpwhswMondhaWQiWPG5gyd6R
         hXLtUUNYjs0jS5hi9NUwgHg3u3eZaTs9muP1tB8gGRx5+eL8aQCcx8aYiPy/axKTXsFz
         n0nunLmM7kYaDhGfxnjC1cY+XfMhLxDLJZJJs8BzKSRLdgrgb5lfK8DfsnAl0VCJW/np
         +r3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CnSae8Vy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f2f36c2si72370876d6.515.2024.05.12.02.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 May 2024 02:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=CnSae8Vy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6549-0004d6-K8; Sun, 12 May 2024 05:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1s6546-0004cF-Sh; Sun, 12 May 2024 05:00:18 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1s6545-0000pz-AW; Sun, 12 May 2024 05:00:18 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a5a5cce2ce6so69198966b.3; 
 Sun, 12 May 2024 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715504414; x=1716109214; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s2HUUSV/R8kHZKSr121aPfLsWX8/+1NKAhwK3cedQig=;
 b=CnSae8VyhVRHxPbnvqPS6aYSGk5WL8H9EQMiX7YhegCcAvk7crL/JmfjLxmWXUsuQW
 zEp+i5/N8Mq4CsSO0dKt9oGIOq5SE7xgl1HaKYixaDqIfobMMjo0y9HZ1pXg6t50MD3x
 ryFB3Dx4lKjYyahOAYE7nfqY/5SrzntY5ibfCxqHIfry2OZ9R1seTKBCDFjvsR0V6XoU
 0cKE1gu3paasdceMA4Y15td+kB+4LLi1Wua8uv81OdZcd58Qhrj5lXOmu/zf35mxZ63H
 4FBZMqIZYkuuxUmdoYZZ2+uyeteqk7J0YMGzmscXvYP50eUPTwth4RIE2liNtFmQAx0A
 DDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715504414; x=1716109214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s2HUUSV/R8kHZKSr121aPfLsWX8/+1NKAhwK3cedQig=;
 b=ZQIn9J80SgWPwSzv8NSOY0pqeHGKdiz8ZPh83Zce/6PZtTAC3VkIRxluw8el2jOTr2
 TUX73tBiCwmCPqDE6LfSugKKQjWzqb1Eply820B8Gjy+WKu6XVZJKY8KkHxrSULuADUg
 gP0qzfY53Mhi6y9I0fVJSGX8GtKrqcZ3nQ+YdTldIXswGq1BnS7S6RZveFufQH5N1unT
 44DjWmldNirn/54MpWFWVcR8qSDIL43yUSlHSCEIwpwE6EQyc9TKOS4GcunQnYUX63xP
 LAYFXv0NjLbNp55WravYH2R6EM3YkEqTu56GPu+E4MAEDb34FfJjNfUPxvgM3QYz49uB
 apDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuPx01AfotSquAmMuIJXr8wnARAD6/2SJFI/L09AeA7kEXYUEOh0z/zIiIaYpo0hsDPhX8BSa0t7NWT0gDUOFqvsO6
X-Gm-Message-State: AOJu0YwPEenOnNTt/IeUlqmPFi5bETdFX4uFMq0o9cWQ90ekPqRlVdx7
 SsVflGG8Q8L30vpV8CX71Qc74YJ1u4Gx03B7zb9CIFsNzwfmsIJc+9spGw==
X-Received: by 2002:a17:906:17c5:b0:a59:c9ad:bd26 with SMTP id
 a640c23a62f3a-a5a2d54c601mr431144566b.12.1715504413771; 
 Sun, 12 May 2024 02:00:13 -0700 (PDT)
Received: from localhost.localdomain ([212.70.119.223])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf9csm432214366b.7.2024.05.12.02.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 02:00:13 -0700 (PDT)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Rayhan Faizel <rayhan.faizel@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH] docs/system: Remove ADC from raspi documentation
Date: Sun, 12 May 2024 14:27:16 +0530
Message-Id: <20240512085716.222326-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 40cr6vN8VazB

None of the RPi boards have ADC on-board. In real life, an external ADC chip
is required to operate on analog signals.

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
---
 docs/system/arm/raspi.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
index fbec1da6a1..44eec3f1c3 100644
--- a/docs/system/arm/raspi.rst
+++ b/docs/system/arm/raspi.rst
@@ -40,7 +40,6 @@ Implemented devices
 Missing devices
 ---------------
 
- * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
  * PCIE Root Port (raspi4b)
  * GENET Ethernet Controller (raspi4b)
-- 
2.34.1

