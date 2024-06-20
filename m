Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1396916dlb;
        Wed, 19 Jun 2024 23:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsHDLeLVv7wWEn7Scdkh3jgqeyr5uy+wOc4zPAwXE95EQRCr9nWnYn8wjw1CsVj8WJ+/V9hBARnsumStKExN98w1QDzuC4
X-Google-Smtp-Source: AGHT+IEptnhr+1YYsP5lLyl10WBnPs+R09NLULGbu111MH9GDY1ZFGU1nFmpi8M8M+h4oZM+mY8Q
X-Received: by 2002:a05:620a:4710:b0:797:a842:bd44 with SMTP id af79cd13be357-79bb3e0fc6fmr504559085a.4.1718863283199;
        Wed, 19 Jun 2024 23:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718863283; cv=none;
        d=google.com; s=arc-20160816;
        b=XhhkdTqnibLWjLp9j1J4CgYdK0EWiPjna7bmwyGQUUKhDaCuyglmKgOEF7gFX5cAOf
         5jjAKRMX5Y6jhJGOgBQzwpB80pd2t4uWh8CS53iA3D8y7HReYMrXf8a8z6/22C/5QwvH
         c0HiwQbaqyrjLcTiLf6JWNN22x1suJ4s7hfM1OewDYbMDkhLd/dPcX+yKXwD67qGjw51
         rNF4eQb2mPnsIHy1uJ0Mef9LuBeiqrCuoxCKqk4E+sC5QBehfqp+Kc5mQPhNksVM2zPN
         8W6XUd7cNNU2TV+RHZJEcHkSxafRVn8Z//7rmxHskeLQB/0FPhzv1R9P6Qo96ZAIVGxH
         cOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=BrtHCO8OOCm3AJTfzCktX9lEvLZ2QxCIgM036ga1ReM=;
        fh=sMw5wUJBWGBtSuNC/py39k2nZzHQbArBDjR2xR28Mfo=;
        b=qHuTg36p22/Q916fGvBk+Dl9BSLFPte40u868W3tr6kfyXn3Wnnahgi/Epzt9m1YYJ
         2uGz0edOZI2BEFtK63LbIQ1d9ipOeXp1z2x6qivLwhxYPoUuIa2rxuEsF8y6oed+xTbv
         QZep0GfCBppGQjODV8EHVyYCNBqz7XG6S59v3bJBcmxcjuN4fzPJdvziq5BFgGEvaMFy
         HkBg6uZbmcJFSaIBjLxdjAzxu2o58vF820zK5Vejwe8rtY5lyK13WctFSbrCrK6d+13M
         5XQm016CPdLJmNOXCT5fb3YFOVW5CzlPn/AbEd5hWW6eLRepqsoAyBFfURK6eqggnWqE
         vhBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe596bcsi1605006285a.637.2024.06.19.23.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 23:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKAqb-0004BN-P0; Thu, 20 Jun 2024 02:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKAqW-000434-Ei; Thu, 20 Jun 2024 02:00:32 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sKAqU-0004f1-MX; Thu, 20 Jun 2024 02:00:32 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id AF027261A3C;
 Thu, 20 Jun 2024 08:00:26 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 3gbgHnBG4Jvk; Thu, 20 Jun 2024 08:00:25 +0200 (CEST)
Received: from applejack.lan (83.11.22.244.ipv4.supernova.orange.pl
 [83.11.22.244])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 150D72606D1;
 Thu, 20 Jun 2024 08:00:23 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 0/2] tests/avocado: make sbsa-ref working with >1 core
Date: Thu, 20 Jun 2024 08:00:12 +0200
Message-ID: <20240620060014.605563-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: BDBkOfahqLgw

Recent changes made sbsa-ref crash when more than 1 cpu core was used.
We handle it in firmware now so one patch updates it to the working
snapshot (TF-A 2.11 + EDK2 snapshot + EDK2-platforms snapshot).

Other change drops "-smp 1" from CI to make sure we test default setup
of sbsa-ref.

I have no idea why previous firmware worked with 1 cpu core and failed
with any higher number.


Marcin Juszkiewicz (2):
  tests/avocado: use default amount of cores on sbsa-ref
  tests/avocado: update firmware for sbsa-ref

 tests/avocado/machine_aarch64_sbsaref.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

-- 
2.45.1

