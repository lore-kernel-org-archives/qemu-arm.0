Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7134401njc;
        Mon, 11 Nov 2024 22:29:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/CZkTzAHHF8pBwi7m34YpeiiJSr1AxsIQkTDhw6B/WgGe0dn2z/t+ny1A1arph1o/2Wd0DqzF5VWCPg==@linaro.org
X-Google-Smtp-Source: AGHT+IFtQgsuFrJLsLKmD/r7yi2CdHsH4dBE8AWlU0GrqrhjUxGyyMb8JaeEBXErJ5mvr4F9wlSg
X-Received: by 2002:a05:620a:178b:b0:7b1:447f:d6f0 with SMTP id af79cd13be357-7b331eb87dbmr2138708585a.23.1731392984400;
        Mon, 11 Nov 2024 22:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731392984; cv=none;
        d=google.com; s=arc-20240605;
        b=WoogbrBC2ajhSwdgYMwB3r3DB/SBqgdZqvzr5Q8Wi2NPBZUB+0NKzRv0C82iGeJnN0
         7JbpBG5YObyK31AmdtTemgPBTsqmHXSpkdCDKkl9PXJ2AF2cp+lttPsiFBULTtnpwVAq
         B9RJ+NdHKgIIfA44Cbaf5pfkPrIrXrYVrRwvFg+V+JGf2Fi2ptYi03bf7Vdy/MVqmcUt
         e0dVNwga1Yxcxa3dLlf64ZwdbXw18h2XytA/xMAqLvOcKeeCHCF6LktwUTGfDgVY3XuZ
         VagVkj/ywgwVaEDQUogSY8wnm/kwqFItUoPp5lUxbef4sqoRv1b9TBrgzgY319DpOEfy
         wzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BVyWWWlQjWdpHcql9rJH4/8KJiLR4q7DTqGtZA1YIr8=;
        fh=36XeOeSnsB5LbZUpSpyTPSVUP6DQSW+xMm0rZH0YiK4=;
        b=JySc8OLSH2Wzz5Mlp2HPdn6cqHopBj5hzCVJalN2zpVPpZ0Fv2U0lEtnpgNCP7yz6H
         EctY2yJcSSswqTuTDiW4sNbBGdI0B2j1q45eaI2bD0C9WUwn7RmPJ6fqTdmwTT55G4bt
         w1fFR7kkNwiSTrO6W8QqIX2Pn023TR8SslfZ8ldz8WXYQ1RbJSqnsNns3mmaaCHjWH+p
         BJrf0Ludq360iQZbF/NkWJfJbX8NN33yup0jfWOvd4CFBuVupxpkag/sd54yWJo6o3lj
         vNMUEXAS+iclqIo+0S7M9AtVnAn70PU0L6aiypPsdGTIBVUMwtkuRgTC1+mDxjxarLtp
         rGyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FwOJl1uv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad1f106si1311605885a.589.2024.11.11.22.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 22:29:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FwOJl1uv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAkOE-0005ua-33; Tue, 12 Nov 2024 01:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAkOC-0005uB-Gm
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 01:28:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAkOB-0001z6-26
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 01:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731392910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BVyWWWlQjWdpHcql9rJH4/8KJiLR4q7DTqGtZA1YIr8=;
 b=FwOJl1uvxA7eM2tMGZF5D9K3KbHRd8OSbqujxW2hLgsWgJSOW0B9aF1tu01qh7HebID7vx
 Ik+QdsrZBddriSWSZqUO2upDGtjDSu3UOKaumJ6UNXA0QZJ7CWHsM7/+O5QsOUvwSlfhOo
 0zvZmEhb2sGflRXRL+q1WUyke8WO/iw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-NMNUoCtjMZmBTYt2JRnkNw-1; Tue,
 12 Nov 2024 01:28:26 -0500
X-MC-Unique: NMNUoCtjMZmBTYt2JRnkNw-1
X-Mimecast-MFC-AGG-ID: NMNUoCtjMZmBTYt2JRnkNw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A57C1956088; Tue, 12 Nov 2024 06:28:19 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.48])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A5CF019560A3; Tue, 12 Nov 2024 06:28:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v1 0/4] tests/functional: Finish conversion of Aspeed tests
Date: Tue, 12 Nov 2024 07:28:02 +0100
Message-ID: <20241112062806.838717-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +/+KqH+hllwE

Hello,

The first patch is a proposal to fix a long-standing issue when
capturing the console output. In some cases, the expected string does
not match in the output, causing the test to fail with a timeout. The
change introduces a _console_read() routine that processes the console
output character by character as a possible fix.

Last patches complete the conversion of the Aspeed tests and remove
the console workarounds.

Thanks,

C.

Cédric Le Goater (4):
  tests/functional: Introduce _console_read()
  tests/functional: Convert Aspeed aarch64 SDK tests
  tests/functional: Convert Aspeed arm SDK tests
  tests/functional: Remove sleep workarounds from Aspeed tests

 tests/avocado/machine_aspeed.py         | 202 ------------------------
 tests/functional/meson.build            |   2 +
 tests/functional/qemu_test/cmd.py       |  17 +-
 tests/functional/test_aarch64_aspeed.py |  97 ++++++++++++
 tests/functional/test_arm_aspeed.py     |  74 ++++++++-
 5 files changed, 184 insertions(+), 208 deletions(-)
 delete mode 100644 tests/avocado/machine_aspeed.py
 create mode 100644 tests/functional/test_aarch64_aspeed.py

-- 
2.47.0

