Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp472128njc;
        Mon, 24 Jun 2024 09:22:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvYYgphPry8YSgks/xCWp22dYCKT21o5usssqeI4Ql6wgzb5w40nf6qqq1sQ8ROU523JW4CM0aZzp/TWf2s+FI0S0tlh+O
X-Google-Smtp-Source: AGHT+IEmijJSI9WSfRCsZdCBEXEqJsFsADItPo8c4WSkaWrfZ0fPjAY0wZ7kn1uHuNpcZcA6NKe0
X-Received: by 2002:a05:620a:430d:b0:795:5d6f:8bbd with SMTP id af79cd13be357-79be7046c5cmr548963285a.73.1719246130723;
        Mon, 24 Jun 2024 09:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719246130; cv=none;
        d=google.com; s=arc-20160816;
        b=tpI/FcOF6TEhiBe7Fj3kmrMLr8wmiGjrLTCAfQPpXMEIuC4y+3yTut9oQqyrRxsLos
         uBDG23H205t6HPev9AqkSqiZrXRQSxF15l3toi+wVe2hwT2m6a/oe7LClSB0MymX8BPi
         7nZMDvAgkwPS8OMa55pp9xOEgrIw48cf1n5SOf0cRKOmMZ3+YPs/FOEvxDh4Ttaa22yL
         pe/agmMyWHLwjsEpGl9IRWTf8mYvBlnJRPX+FnNOXqx463Xzv6f/Id7sG4L+95/dbKTx
         jFHs0Hao7m8F2UrTP35XPsOxKSY49+IxP9e8r3gq1Fglxqt0PDpAU7FgBeWt4aWoClAt
         +UAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from;
        bh=1wWaglMO0CS5bhmCN+o+fbKukfg6+PBjMz3UcaeqIQM=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=Qt50vHbodKd3nY2/xuYwL9egaSpVk4asEbZrNxkk7x1BLE4I62szjrnpMJLde3WSYB
         +8yN72ZlO6LY/JCy4O8oAvYTAxaoj+GSRduxIbVIsOdlGY0Zbl0tIL8BUH8jFkQpGlKS
         8VdanELPQkf85QfWKuWXy7yoqkf9yKUPEoJyVy5yt/65w6XNOqx5WnJCid0Ro2e7iSn3
         DNbBHabxkhHqwWjzLzsEJ5Sd09scPhuI7gaEO00LSsmf4iloYHjIpJqowNkE39W3KQ7y
         rH5+5Vjpj/nOQGpqrksz6VEpCJw4sWXzmP/ntET1bchlBnP8xtq/yYOPh4OooysemjQt
         1Xlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9157basi905793385a.294.2024.06.24.09.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 09:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLmRF-0000Ff-Bu; Mon, 24 Jun 2024 12:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLmRA-0000CJ-Qo; Mon, 24 Jun 2024 12:21:01 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sLmR8-00022u-VB; Mon, 24 Jun 2024 12:21:00 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 41778261A9A;
 Mon, 24 Jun 2024 18:20:55 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id MEgInPk_aRAN; Mon, 24 Jun 2024 18:20:53 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C31BC260662;
 Mon, 24 Jun 2024 18:20:51 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 0/2] tests/avocado: updates for sbsa-ref testing
Date: Mon, 24 Jun 2024 18:20:42 +0200
Message-Id: <20240624-b4-move-to-freebsd-v3-0-71496bf119d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqceWYC/32NTQrCMBBGr1Jm7UhIY39ceQ/pIrGTdkCbMilBK
 bm7sQdw+R5879shkjBFuFY7CCWOHJYC9amCx2yXiZDHwqCVNqrRBp3BV0iEW0AvRC6OaK0fybU
 X8nUHZbgKeX4f0ftQeOa4BfkcH0n/7N9c0qiwMWRbp0zfd/725MVKOAeZYMg5fwGCDTU0tQAAA
 A==
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: MVlPm6WIudCN

We want to have some non-Linux OS in testing in case one of changes keep
Linux booting but crash elsewhere. So far OpenBSD was used for it but we
move to FreeBSD 14.x due to longer support cycles.

One OpenBSD stays - will be run on Cortex-A57 only. And only on local
runs.

At same time we add test to run on default cpu settings. For now it is
plain Neoverse-N2 but we are considering either disabling PAuth or going
with 'impdef' way.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

---
Changes in v3:
- kept OpenBSD/Cortex-A57 test for local runs (by request of Philippe)
- Link to v2: https://lore.kernel.org/r/20240624-b4-move-to-freebsd-v2-0-64ea7b04998f@linaro.org

---
Marcin Juszkiewicz (2):
      tests/avocado: sbsa-ref: add FreeBSD tests
      tests/avocado: add test for default sbsa-ref cpu

 tests/avocado/machine_aarch64_sbsaref.py | 90 +++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 25 deletions(-)
---
base-commit: c9ba79baca7c673098361e3a687f72d458e0d18a
change-id: 20240624-b4-move-to-freebsd-aafdeb75ef38

Best regards,
-- 
Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

