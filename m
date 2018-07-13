Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp747750wrq;
        Fri, 13 Jul 2018 07:25:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc9UGYwkybloRNfaxogh/H0qaLd+MOILPx5BQDRJ5ExsXrvR25dBY3OMbX5NbvwZ4DL7tqb
X-Received: by 2002:a0c:b310:: with SMTP id s16-v6mr7326072qve.243.1531491900025;
        Fri, 13 Jul 2018 07:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531491900; cv=none;
        d=google.com; s=arc-20160816;
        b=XUKUtBnsVHwWvwW0/Z6zJwDtWvTa9FEwzHZ2I1XGY2Us0tCyux9H8LZekpyaZ0Ct7N
         4mGiW8QL4xfknp95NIHUtlUGQTFGAgA70QhACxdDifzU0kpml9O+LEUTdd/7Uc0AnwFa
         al5pcuDVFISIR72z9PH0MQb7wsbmHtgyu30dVx61x5gWjCzpyTRM+whMrRbvFa2uvFG3
         wvTpImBBB/q6C7EywKTSt9I04YVm7oePSTjceN7ZPVlu/oECIOJ6VwxIzuoTpN7qOo0p
         cDUNgEPG9tMRmfKiO/Hp3biY4ufpWJgnydqlum/yAvWXjPkD5tGNHHM6k30v7+S+JBtJ
         pu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=d7kXqq8zZP9tMq8YAaq/xqmy95KAwHfCYsKW53IZtQU=;
        b=mDiXpoXOX5mLkhUsMLnXagY9ItX/5FVNEiBKK1rudUdW4hbYUw1HrkfJhYuU5HDaZA
         XWTzrq4F9PQOueD5zQkC1FoRCXEYPXgPCC9VNRf/k14aM7ajqQZNCNBPixTIEovkHwQc
         w/nE+vbM+lNMknA/fwLY8kXIeP+A3QAvfvMbKXrPdwaCYVqfsmKTy7oRNStL84jQkd7p
         hXdqjgj6vvnwUCQCh8l3M6HRtwl6K4Ffd4u9GizTbXBbIBLZeGjqK9Sp7CSFbrgrwj9Y
         2Hy9NjhwOMhDhF9IxKlUG7AGQsKj5n7T5tM2nTPtk8ae3G0l1CommLSgR8y4oyCuCaUk
         HXjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i37-v6si3785606qvd.67.2018.07.13.07.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 07:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdz0F-0000Id-Ce
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 10:24:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fdz00-0000HE-6o
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 10:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fdyzz-0001QD-JJ
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 10:24:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fdyzz-0001OZ-Cu; Fri, 13 Jul 2018 10:24:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fdys9-0005OU-CH; Fri, 13 Jul 2018 15:16:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 13 Jul 2018 15:16:34 +0100
Message-Id: <20180713141636.18665-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 0/2] accel/tcg: fix get_page_addr_code()
 victim TLB lookups
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JB0RY6+KT01F

This patchset fixes a bug in get_page_addr_code()'s
lookup of the address in the victim TLB, which was another
source of "we end up with an invalid TLB entry even after
we've done a TLB fill for it".

The second patch then removes a check that we had that was
working around the existence of the bug patch 1 fixes and
the bug that commit 68fea038553039e fixes, and instead
puts in an assertion that we definitely do have a valid TLB.

Tested with Laurent's m68k image to check we didn't regress that.

thanks
-- PMM

Peter Maydell (2):
  accel/tcg: Use correct test when looking in victim TLB for code
  accel/tcg: Assert that tlb fill gave us a valid TLB entry

 accel/tcg/cputlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1

