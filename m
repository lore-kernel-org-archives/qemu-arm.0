Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2219869njd;
        Tue, 22 Apr 2025 02:16:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXT4p4fyxYBcaSJy6BJGearjBtec8rZXCLH/q5ljlqaTu2Ufz0jcTUl/ASG0Iv1OccYGdaEgzTTGUL7YQ==@linaro.org
X-Google-Smtp-Source: AGHT+IESGOPIKHM9wZDGbb1MrjUuXcWvjvJjPF7gpEB0mm0fi6CGWlOffhndcGJRAx6vaBXChp3q
X-Received: by 2002:a05:6214:242d:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6f2c45564acmr249977646d6.16.1745313359874;
        Tue, 22 Apr 2025 02:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745313359; cv=none;
        d=google.com; s=arc-20240605;
        b=JCgrwiNbF/4yrtc8xC6h6wjY2FUpcHUCfVWU67RghPX5viiC8+7DTJ538zeBET5Agx
         nyNWA7/NFiQC82hH575/LJ8vzuCZIzpy5gi8gCkzMJK9XPHUBdsH1gOBFVvPOIN726Vt
         S5yc3aUiD+CkS4ZMgbct9XRIezBRNmGvgR+/uNYwS8JG+ewnX++uyGXxWBzyFCI90C01
         vJMSbzX2Fqf3flG2ZXRZdCJT8gyza1c2/M9zGOcVeNxrBqfufVLFBEcXl3nkPnv1NPit
         5oHHBavov25Pkmyvl1jQgS8hv2Ff/BS+c/nITRJrulMmHvLhTbDnXUmp8YB5icptRG76
         Wjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=m4LilC9S0g51QIoVxZbOtiYfWWvCsFPYM3vagQLhIik=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=AeRJ8z7SYjmyChnp6E9fTq4Rsms+r3RIu/fGsWbvyDMdBM5q8cx5He+gfQFwuxmlPv
         aM5SkQIoUTl1SAE63ZUkXQUXHwQDDHX2E2jK0lnZlmX7ncBH8hkAGc5UrHskrdxVh0O5
         xeDmYbXHNuz2dhUw3fERLQPkGlMZceE/8pWn4Pb8VzuD1AnxuObWOGR6sn3DdqxWLu7q
         5k6eRLlBWGuACOijKtIP+rmdYLrCTC7Sez6bd5ulhNEMdUEHcGF7XKz3r0djTV9xYfTb
         5gC575vhIUsRvYnm/Y6zXOwRtKOi0DDK90SkCa0g2Pae5kz0phafwN4Sohm5yZIK0LhQ
         RDNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2c0ff24si106418216d6.329.2025.04.22.02.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 02:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u79j3-0006hH-9G; Tue, 22 Apr 2025 05:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u79ij-0006f2-8h; Tue, 22 Apr 2025 05:15:17 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u79ig-0006zm-Fu; Tue, 22 Apr 2025 05:15:12 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Apr
 2025 17:15:04 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Apr 2025 17:15:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 0/3] Update to test new ASPEED SDK version
Date: Tue, 22 Apr 2025 17:15:00 +0800
Message-ID: <20250422091504.3666464-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5G2CefW0kqOP

v1:
  Update to test new ASPEED SDK version for AST2600, AST2500 ,and AST1030.

Jamin Lin (3):
  tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2500
  tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2500
  tests/functional/aspeed: Update test ASPEED SDK v03.00 for AST1030

 tests/functional/test_arm_aspeed_ast1030.py | 40 ++++-----------------
 tests/functional/test_arm_aspeed_ast2500.py |  8 ++---
 tests/functional/test_arm_aspeed_ast2600.py | 15 ++++----
 3 files changed, 19 insertions(+), 44 deletions(-)

-- 
2.43.0

