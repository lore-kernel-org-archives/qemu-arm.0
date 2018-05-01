Received: by 10.28.4.212 with SMTP id 203csp5139322wme;
        Tue, 1 May 2018 11:05:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqu2vKunWbDSFqIhupnJSydwUEoCc40nMAcj0ximteRuoOqLROQJ7YeKqPwS9wSpHm8lCtr
X-Received: by 10.55.142.134 with SMTP id q128mr13377077qkd.76.1525197918689;
        Tue, 01 May 2018 11:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525197918; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8fYO9by2xp7A6h4fHUBvuCovLzcFMb6eEpDi9eSXeeHFeN7lCR1H3ojOufX+yo5tC
         6JvHF99Unq3CDf4gnwZE4ZxlSdhzwkZCHhNo75wk75+tA+CtOYpRJyynr2oSZFGDAR5c
         2f0/MGiLRpZ6Gb9qjic7l+2vJdYmHYyizMD33RymzNzT8xg96138p0YXEHCe5cQDxOly
         bCnJuCNQ/2R0zfmyMBnOemmlPyg6vKFKqtFXws2PduhVKcBmK00L9NfOr8yYJbfen9k7
         5ay4v7e9t7ZjUe+SCoPfCq51bv6DWGwnXaXPHQPDgiTUHztTIC/LwAluWB68+q4WwpdO
         i7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=V1LlPnp9vNZHiPhtR+RK7W+cN80g2Hnuxhx3TU51Om4=;
        b=uV63X0UXP21MclJDpt65JiDP0FxnmvkKZprhiNmgwrGZTkuC0z73H+jMZDo2N3d9lQ
         +ZUspOFPdKzsBzYd6JJdvB8yec2mC/PpZKUNK+JBsFop4ga7elby7jv9z41FP/sTB77Y
         EbtY2h32+DB6HtTPTbXBcG/2hyxzuT5f5yeoJnme2wnJAk8o4yY9pWC+0wnYPScUet5+
         NK2XfLKls36qAGSkE9IlQwkLjDsIOtsHU5/t0CZQ1f+W1Y0duWecdGUoXNP32FrRkcaQ
         wLIV9ZLQb7HBpbR4bBinYknT63MAsVaEayGdEJYXAK0nnlrPvwEkKkMRqGh+pUzR7N/3
         OAgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eCDb8j3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m46-v6si5126483qtb.241.2018.05.01.11.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 11:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eCDb8j3F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDZeQ-0008IM-7I
	for alex.bennee@linaro.org; Tue, 01 May 2018 14:05:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDZeC-0008HW-Fk
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDZeA-0000ZL-0d
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:04 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:39420)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fDZe9-0000XX-RS
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:01 -0400
Received: by mail-pf0-x243.google.com with SMTP id z9so9618505pfe.6
	for <qemu-arm@nongnu.org>; Tue, 01 May 2018 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=V1LlPnp9vNZHiPhtR+RK7W+cN80g2Hnuxhx3TU51Om4=;
	b=eCDb8j3FsTOworYmkV65ymvxdKj5vPbc7ZU5kC+SwQB60KXo7np0gVBnuGD+QFtu9/
	T3bSIERZuM8l+EFL2gmE/R2Qaaf+xSZ7w9BDKw5iSxc195cIfibJuZA17fc1GzNIqcJP
	wzfhLKk3jA8qd2YfVDh4+vvU6ANZKdcIWAWpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V1LlPnp9vNZHiPhtR+RK7W+cN80g2Hnuxhx3TU51Om4=;
	b=V8SCc9E+kINvHKADGiyiJSG6dGEcGKNkgKO70v9/3T2B7HfKJH85BYpK5NYqa3LLQn
	+VUcQ+B8t/cpYmD70d+NWHqdh1gQmyX48Qm0K+Cm6uuMy7nQklRy6jKT1h+kikMlbtF/
	sUT/Sk1xgH5DOVfmNqO34RdGonaOPe/IgxD+Pftnw50Yb3DpqFv9SuAGjHatE30wtcKU
	6bbWFrdXzIEPRsLnVC5jcZtBeTEhW/G1METUvKL4h+0QV9Cyg3WPLwhabK+vXUP/1dJd
	Su4V1yQFhYrHS94IP4YsUnW65Ip58EhAEWyLbGD+rZJevWAI0GHczrQE7FrE63QJr8bn
	vANg==
X-Gm-Message-State: ALQs6tDSrIj4r/++rCnklT03fkJB5kO8bNxnOWgE1T7AVAOZuPW6jqZt
	pqypoB7mzGu+QIaGwnRWquQEkw==
X-Received: by 10.98.73.215 with SMTP id r84mr15049723pfi.146.1525197899254;
	Tue, 01 May 2018 11:04:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j5sm23732224pfe.119.2018.05.01.11.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 11:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 May 2018 11:04:53 -0700
Message-Id: <20180501180455.11214-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH 0/2] target/arm: Coverity fixups
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSlLDKJFmfLX

The first patch covers four related false positives.  However, 
we check the same condition twice and we certainly don't need
to that.  Plus the assert might just help documentation-wise.

The second patch covers dead code.  I believe that Coverity is
right and that there are no paths that have !is_q at this point.
Add the assert to check that is true.

The RISU tests that I ran over these insns came out clean.


r~


Richard Henderson (2):
  target/arm: Tidy conditions in handle_vec_simd_shri
  target/arm: Tidy condition in disas_simd_two_reg_misc

 target/arm/translate-a64.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.14.3

