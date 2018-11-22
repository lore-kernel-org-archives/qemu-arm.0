Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp695880wrt;
        Thu, 22 Nov 2018 05:35:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W0F7hSUzvTDOXDVWAU6XkB+b50Rmbm4xV4+dGm6SKSTwFlNlENrrpNKHcBRZFO3xFQhW/t
X-Received: by 2002:a25:3cc4:: with SMTP id j187-v6mr11280990yba.399.1542893754240;
        Thu, 22 Nov 2018 05:35:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542893754; cv=none;
        d=google.com; s=arc-20160816;
        b=ioNEamI5jTxEu6x6RsN6izEExvczEPmlDnGj18YhSsGVDaQY2kBGjwaHh9MoNeCyAg
         Pp0TiI6LfNkOym00tbHBbHw1fkY+yu7FqaOhqinJPA23hoGTXGEK2DM7R1bZ+Kw2+j0f
         nWmt0RspT9fYIRDyoRJckJ280YcaDba+TwU1r8/wStpt7RGOAEY2kDnjRJrS/8rkPcOl
         PF+swqaY4pOrRYjf/e70AQfns9PWK3+pg52yy5JIyIqXa8ZaqfaSYGCoU6IlPeWyTgdw
         9d4GEOTkPHbJ3JUqqbuBqUVl1k+oj8jegNTLECyuJJytbovSOIEU8rUsKCropg+/kxhr
         JOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=IaU8QCs7PfopA2eNpNs5IntveuivOXh+rCmMJvP1cJQ=;
        b=VFfBxJY2sVJbVhHjyhaHeP4hyMJeLeCNDAOmd7wVNkz2JsR5nmFHDCd9gQy/bPZPec
         Su5VBGD2DuLxdMvJqZp7uE8QIn/clpkoXJEkct52W+KrtR8YCv1ahsnF0/A1tohZK8mY
         1myG05/zMD02xfnU/DIdXA0OwloMLr6+Eb+EvsqsA/4Lbv98fqQl5LDB44ek7vwRk8no
         ndW7YFHOzliNBl237r1hZyQmg2u/adP7tMgaSi7phnNvbjbYSf7t4uNXjHmgsgi1F3md
         jBIG4LhyRoxK3e7jIdfzeLO4Gn9TGz8BznEEEXyPGiiH3fcDMTSOLc7sTHHKoMN6pOL1
         Pr7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n189-v6si31406433ybc.385.2018.11.22.05.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 05:35:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPp97-00083N-41
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 08:35:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gPp8c-0007vT-7l
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:35:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gPp8a-0001hX-82
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 08:35:22 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gPp8Z-0001bx-5k; Thu, 22 Nov 2018 08:35:20 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gPp8Q-0005AF-0v; Thu, 22 Nov 2018 13:35:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 22 Nov 2018 13:35:05 +0000
Message-Id: <20181122133507.30950-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-4.0 0/2] Rename
 cpu_physical_memory_write_rom() to address_space_write_rom()
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fPiYrkTHaRqr

The API of cpu_physical_memory_write_rom() is odd, because it
takes an AddressSpace, unlike all the other cpu_physical_memory_*
access functions. We note this oddity as a TODO in the
docs/devel/loads-stores.rst documentation.

Rename cpu_physical_memory_write_rom() to address_space_write_rom(),
and give it an API that matches address_space_write().
We also adjest the cpu_physical_memory_write_rom_internal()
function which is local to exec.c similarly.

thanks
-- PMM
    
Peter Maydell (2):
  exec.c: Rename cpu_physical_memory_write_rom_internal()
  Rename cpu_physical_memory_write_rom() to address_space_write_rom()

 include/exec/cpu-common.h   |  2 --
 include/exec/memory.h       | 26 ++++++++++++++++++++++++++
 exec.c                      | 30 +++++++++++++++++++-----------
 hw/core/loader.c            |  4 ++--
 hw/intc/apic.c              |  7 ++++---
 hw/misc/tz-mpc.c            |  2 +-
 hw/sparc/sun4m.c            |  5 +++--
 docs/devel/loads-stores.rst | 35 ++++++++++++++++-------------------
 8 files changed, 71 insertions(+), 40 deletions(-)

-- 
2.19.1

