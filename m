Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp588618njb;
        Thu, 5 Dec 2024 19:20:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUIGjqI02BvUZFmaYjDvld20H5yKRo9lzRA7EB04ldkGN9FPlmEU+yyFedOv/PzggUcLbV3HvbsMK1HQw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsQKWsAHs8QrbqTM0+S0RJGiOd/hGfo/H29xxqottB2XALllkKPnEOCLMirbb5gMuD37yr
X-Received: by 2002:a05:620a:4084:b0:7b6:645c:cd0 with SMTP id af79cd13be357-7b6b4170082mr966516985a.7.1733455229170;
        Thu, 05 Dec 2024 19:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733455229; cv=none;
        d=google.com; s=arc-20240605;
        b=QQT49r5vyWjPXommkb4uiqdpPQnZt3Ry/EGaHiFhhoneJX5wfbJvLQmOxZKydo4xD6
         +3ZZJWQ3Sxv/lVLIL9XaB6mNDbmG4AFkyd8yASQiRkqWtt5gIM0rZM79HjjOeGtEleir
         I0wigc6e/ZN7x0jZqN3Vf8qk4e+mCTwCpXdf1edWmjSb82qA2vNwdS+QLRxDYt4lX5Sm
         U7M1DiqLfJDp/fCl66zWU4SvUnk4048mBeCd3c+u00joC++JIFFyjrHLVkA2H3bDRSuk
         xkCEdIghu29de1x+xaSCWmAJYUNqWqh09enc9yEJPDkYcpbnAQnR8XYjEtoDZ9iwm6ec
         ViDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9N64e/pgYn1nLyblM4Tcpb97CAaIRtiZkD+VUNH0Gl4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=HRXVokCwJKBEKK1CGvfnsCUo1qpiJ0E+UTJDAs6OLeptrG4KNg66WFPcq2/ymtiSYh
         cccRG73lGn788kp90Y9A3Ge3nKcwOJz1/dKyxVNBE2J748p4Ch1QDhDyZNX3iTbtv+Cd
         sNDPSf55VmjR0eVhv7U6BBJYU9hzfBguLn4s1r8v4t60//kZEM3DZzkQzkWwsP81Inx6
         KhBwJRvG/MRa+bh0Rz+dsFVRRuytLsDmkuHgvkiTohgo0E3bkBSf45b/tIrpaKUug37Q
         gfc/mBjmx85bD8Y9Y4gpC5TQfWq5lJQRCqMorcFqgxxaN00yzGlczqCurViZJZwVm/pf
         pXrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XnPd//kl";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297f887dsi16969591cf.441.2024.12.05.19.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 19:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XnPd//kl";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJOsp-0006GC-Me; Thu, 05 Dec 2024 22:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOsn-0006FT-QN
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 22:19:57 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOsm-0006Ae-9s
 for qemu-devel@nongnu.org; Thu, 05 Dec 2024 22:19:57 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71d4032b3e9so1415886a34.1
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2024 19:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733455195; x=1734059995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9N64e/pgYn1nLyblM4Tcpb97CAaIRtiZkD+VUNH0Gl4=;
 b=XnPd//klYcvi7MGkUGT394ZB1HqCSaAIuPJ/DMi2LXRIURPt0ZJiPVp1TTfQhRJDjP
 mQBQjUA69UCAZFS6JPF/YnJ+JpAliFC2vdjtDFqfQvlmIPiA317rKtZ7ZWe6dAMuU5ME
 /zgu0NeXlakd9qgJ5TviTAAB+s+Jx18Qb5v414uMz34VSMJQV0EZaFvqeHIlVXUXJwzT
 4mpuvR+SKEKUCd3ZdAq5Ak3AG57cdjL35I6IDbfmJZmhsmYqGoj2rt5w+nUZm0r8XQCq
 ehdZyiZBVFyLbvvXepewp0TmpRYkb/rJXWYTQSxdT5M0KB0/n3o4tRQyNXk5IHIFUBAd
 Fq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733455195; x=1734059995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9N64e/pgYn1nLyblM4Tcpb97CAaIRtiZkD+VUNH0Gl4=;
 b=Hnw3+3wSq7qqLtWuYZM0g8TDUeULI+kuH3ZHCaQ2q/f3/p9jRpoCCYQO9ZCyAtsyDn
 aExGrM+kww2z7w4ndFs+mMRyzWGmjv9RAbBErairv1Ib4v773r5nkKQsWYrHLgN0iWUy
 QgK2q0dG1/175/KOnda0BpR+81Qpkh6+Ki99hH5H8b1Gw+7uGYWizNsg04CiQekBxOUq
 V0JvwG7mzDh1kNoXqTNrjZKGRif/rf+obtH/17uyq4s47LrKbah+K+Qlci7NgnKMy5T/
 Y18CmE+aXpJLh8wimqsafctEe0H2+DPLKHt9VnFqP4FAUUjgrZ0h5kPq3EUARPAU1eNV
 PfkQ==
X-Gm-Message-State: AOJu0Yz0sZQA9/XTbC7RUaGXknSlHUjteEH3SJ6jhM5H9ioTWRYym5iC
 S9SaU+KSUErgQYncHc0pxvNAJX9u7wQ2Klz8s9DBjXXc039+usuJqdNQTGbetZoUTzC0Y2FJBsN
 IWM+OGtIp
X-Gm-Gg: ASbGncvPsZ3uh0iP9BrxvvQUlFyXrq96c95kdJVsVX1r6Ep0mSAm5U9h4q1GL8CFITZ
 i8Y7t9aZE1LLeEFlc+XgolTXfN4GMgO7HA1TJM1IaZwCWckO25dL5iO4R1HRCCW8r7wBtjULPsi
 A4DjYuBvg1crWS3KaDvTL3Gm3rPWe4+jhquxhQ564loDbOMM5FG600k5HTsnU/rNbrxWqrHUpGm
 Y1sCNcZeMjjUdpVcoxl8E/CHoGktGIfjJ/NxoRVlw9Y8TFy7mftCVluIjKB+k7zL6NIsu2YZEsF
 Ay9H8hJvTVO9Xtjw4Nlq6uENEvVlwHpxj3wY
X-Received: by 2002:a9d:5ccc:0:b0:71d:53b6:ef5a with SMTP id
 46e09a7af769-71dc2c64885mr2443693a34.6.1733455194894; 
 Thu, 05 Dec 2024 19:19:54 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f2793255bbsm541045eaf.40.2024.12.05.19.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:19:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Two more float_status conversions
Date: Thu,  5 Dec 2024 21:19:50 -0600
Message-ID: <20241206031952.78776-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FEjZe76TcmgF

Hi Peter,

You probably have something like this in your AFP tree already,
but while I'm sending all of the other float_status patches, I
thought I might as well send these two.

Based-on: 20241206031224.78525-1-richard.henderson@linaro.org
(target/arm: Helper type cleanups)

r~

Richard Henderson (2):
  target/arm: Use float_status in helper_fcvtx_f64_to_f32
  target/arm: Use float_status in helper_vfp_fcvt{ds,sd}

 target/arm/helper.h            |  4 ++--
 target/arm/tcg/helper-a64.h    |  2 +-
 target/arm/tcg/helper-a64.c    |  3 +--
 target/arm/tcg/translate-a64.c | 17 +++++++++++------
 target/arm/tcg/translate-vfp.c |  4 ++--
 target/arm/vfp_helper.c        |  8 ++++----
 6 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.43.0

