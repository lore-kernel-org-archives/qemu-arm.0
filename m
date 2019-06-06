Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5018552wrg;
        Thu, 6 Jun 2019 16:11:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTDZMUZGEkPXeMiQqTLyF3E3rEoBnL7hYElP5OX2fu2jErP6+f4SG7eSyajs6x0oyd1ERH
X-Received: by 2002:ae9:ec0d:: with SMTP id h13mr13476534qkg.26.1559862698265;
        Thu, 06 Jun 2019 16:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559862698; cv=none;
        d=google.com; s=arc-20160816;
        b=RZYnyZSqleFGAMDiMLnNo/nqAu7tSb/0gat0bb0dQea7908YJ2aHyv5zk7R4sWjQLL
         Ag398FaBy00C9JkRjPnDlZ0EE2DO8G7aWTC0hkQaAg68h2pPnvNl8Y+Ix0Pc/EmKANIs
         09ceJ5tBgBfv3EvzltiUSU+NTgvrVXPjuyFqUBRBinIZ45AtH0j/8iKO+lQLcFroTFVX
         TxnypOpgU36fCEFGeC7Hn467z1vQ9EEh8aAo5h5+15n8tkESFhrW5gfbvYlGRhpQEulN
         dwELX7CjuazN5s5JhuQ3jLv7dyMmchhkBxwvKDjZRHNHzR+MvnzyO6GFJDJKXWIMU9LH
         gGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=mFlOCfnxY5zWqN7YnuF7R1DbqDImOCT7zX/otazBxgo=;
        b=LJVVRUErdGzDQuwL+tkY9VOUKyjVJOa1AyRocj34YbeRT2ll9/uVaOwqZM7BFpeukz
         IqiGYUpywlYByUNK+7YHBUIL+kRAsKE0bhdpYRJddp4x9B1aV/WyuydL2M5Q/43TwElF
         Kla4GdTj3OPwNOWeml4ZLpj+zaIWOc2tqbdJqsIwF69q81rmjflJLB5OTeo4TMa2klBJ
         5uPH6sdg7EG9e7XCI1Y3bCxtclL5bOtUVF1/WF8MYSIQXvKW8xQpKZXvVRDQXwR+vIw/
         wfOPQcw5rmdVhXoQoOQ6OAhO1GGlOUmFS/KVtHzxQgViuP0M7SZELvbuTcuwolbGpf1v
         FZEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id k5si166237qvi.5.2019.06.06.16.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 16:11:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZ1Xl-0005NP-Rs
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 19:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZ1Rw-0007N1-Bq
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 19:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZ1IJ-0006bw-AB
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 18:55:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hZ1IE-0005r7-57; Thu, 06 Jun 2019 18:55:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 556953003097;
 Thu,  6 Jun 2019 22:55:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-32.brq.redhat.com [10.40.204.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3C447341;
 Thu,  6 Jun 2019 22:55:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri,  7 Jun 2019 00:55:19 +0200
Message-Id: <20190606225521.9187-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 06 Jun 2019 22:55:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/2] tests: Avocado-test for the SmartFusion2
 board
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +QnhLr903TQO

Hi,

I added test guide lines from Subbaraya Sundeep [*] to avoid this
board to bitrot.

v2: Addressed issues reported by Cleber

Regards,

Phil.

[*] https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg03810.html

Philippe Mathieu-Daud=C3=A9 (2):
  BootLinuxConsoleTest: Do not log empty lines
  BootLinuxConsoleTest: Test the SmartFusion2 board

 tests/acceptance/boot_linux_console.py | 32 ++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

--=20
2.20.1

