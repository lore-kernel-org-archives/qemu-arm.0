Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2194990wrq;
        Thu, 7 Jun 2018 07:49:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJQhAal9Tlv38A4iQtdzyqKwaLfKnoLBkLCygQkhfnq54sF4om72hUdfr6JmAusdwtnLp+V
X-Received: by 2002:aed:252c:: with SMTP id v41-v6mr1921071qtc.403.1528382991064;
        Thu, 07 Jun 2018 07:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528382991; cv=none;
        d=google.com; s=arc-20160816;
        b=CsfjRx5PW4D1qfT1CnoN9k4+IH/CDQP1XNPpZvVZ9jKyu5PFD9tBXiIL7kkuYk78uT
         GWpfwZRJvs9y1PyfjdeXox+g1l5+y9oN1NRUyXa5SX7R3EH7uVvOUTK3hYJ9+1L10ObZ
         irBLr/ZBpN/UqQBJCd3zhCP+x33i1DQTWHjzJyTw2Ocsz6Pj0JIvC31w9m68pO7j1aV1
         Qo6s/UgVeQwxvMt7CrcqZeCt13BhaDxEQEJXptgwMr3yrYN4GZ1mw1kBsYOy0qIfUiYP
         DejzjqJwkjx/bOjxOtBK/jGDkGfMsf51bwJHbmgXyj+gACGMHbKZcKZ37rA2hQYyYbt3
         /L7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=yrrAZLQwkrGgoP8Sfl2BzyhBOWKsGVQ+Bmuqu1a8XiU=;
        b=Iny/UzVduztyLCnqjeSqw9+mq+3AVUtoYY7I0f4xqsPoBo7kzhPKNJzJ8HVYewvhz6
         31rlUrWLRPB3Mu5ehDV1589PiMtd6RIoJFnAmxr2rxw0iUop+au46gAvBXEVV7LSU/ie
         m2/t02pMVZs8mZmR6v/NSYVCpXaoqPYdVKJopnz1AiWZ85xQ7cmJT30dNIF0uQq4jQR7
         5yMZ4uTvf6K2UWRkVmPuvGiSsKmvIqEL587xBKB9M/wU2DXe7O0iQmgCaV6hv7+xR8/T
         u5kxYa9No5vd27CFlfPh4tzOG4s5ld0GMAOS3K/PPxQ+XKvbAaY1wCZ+UHd4amgU3JhO
         4osA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sSjxNPKB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a130-v6si8416366qkg.283.2018.06.07.07.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 07:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sSjxNPKB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQwEY-0001yc-Ex
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 10:49:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwBr-0000np-Gh
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 10:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwBo-00089o-Ew
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 10:47:03 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwBo-00089b-97; Thu, 07 Jun 2018 10:47:00 -0400
Received: by mail-qt0-x242.google.com with SMTP id l33-v6so10083740qta.11;
	Thu, 07 Jun 2018 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yrrAZLQwkrGgoP8Sfl2BzyhBOWKsGVQ+Bmuqu1a8XiU=;
	b=sSjxNPKB+rGlNFvsn4JcC7k5cYWQqm2JlVbKCtuMSZBL5vZqcVcvgl4/QM4pDAA8D7
	2NidFZJXdNgUz/ok6wGR4B8unEwK/+Q4iIBJL6M99cJunXd4+kXarwRKrKWJP5MVfJ9k
	q3RIx2b5RWCFPyJtLVwBxBB0oVyK1XiCPcKzCyV2EJQw44xOOJUee3zuJnio6qak1R6K
	M2iZAKtEb6Bqo7zKiZzM+ZJkfs8SK0rmBs4MCfMMOcNmE1hM2A07V72UYL/2czCsFipq
	KGqu6vkD0/f3ZOldMDA9s5nNFW9xV5eCjxzy4oDtrp6AlwC1S57Nu4V4bUVE6IOyL2EH
	M+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=yrrAZLQwkrGgoP8Sfl2BzyhBOWKsGVQ+Bmuqu1a8XiU=;
	b=DFcb7HmX5UvThljYRJu7nvI774xHnooTcCVuI2y3NRYb4B3wp/f8LLle+DZrkDt6iW
	any4gPkzXjgVR2jDXrr7lV7j+NYzdrcCLjMShw8K0M+24zydv4Ch9X12nniSjmOxRBEO
	L3FBYAgt/MsQFCU2zbIArE7xKbTEnaedXGic/GH0/PicSJFfepQLDm+kAp/KfEihJO4P
	QbbNxFGP8eNMiGCwON56YngGa8IsJ1yj4+ry66c2nNW+8ikLFu6Y0tGEL3Wzn8ymaq0N
	+JvuE8Hd32IzrQIWslC4xVntCfd/NN17DS7TftDfyemzw9y23SrDHinbdUyq05pvKHG4
	U1lA==
X-Gm-Message-State: APt69E2VQRcr07EG2q86RXZ3ed3RFfhNFniuoqBR85B3PxoCpoTxj4D3
	raGPWu+x3GPzm8efnc6BFCA=
X-Received: by 2002:a0c:a9d0:: with SMTP id c16-v6mr1963561qvb.7.1528382819657;
	Thu, 07 Jun 2018 07:46:59 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s128-v6sm11607363qkh.2.2018.06.07.07.46.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 07:46:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Thu,  7 Jun 2018 11:46:41 -0300
Message-Id: <20180607144645.10187-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v2 0/4] qapi/error: converts
 error_setg(&error_fatal) to error_report() + exit()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tfZKsXaYBhBf

Hi,

This series converts error_setg(&error_fatal) to error_report() + exit() as
suggested by the "qapi/error.h" documentation.

This reduce Coverity and Clang static analyzer positive falses.

See http://lists.nongnu.org/archive/html/qemu-devel/2017-07/msg07585.html:

    On 07/24/2017 04:52 PM, Eric Blake wrote:
    That's a shame.  Rather, we should patch this file (and others) to avoid
    all the inconsistent uses of error_setg(&error_*), to comply with the
    error.h documentation.

Since v1:
- patch #1: use assert() directly (Markus explanation)
- patch #2: use abort() without error_report() (Markus 'no lipstick')
- patch #3: replaced exit() by assert() (Markus)
- patch #4: no change, added R-b

Regards,

Phil.

Philippe Mathieu-Daudé (4):
  hw/block/fdc: Replace error_setg(&error_abort) by assert()
  hw/ppc/spapr_drc: Replace error_setg(&error_abort) by abort()
  hw/arm/sysbus-fdt: Replace error_setg(&error_fatal) by error_report() + exit()
  device_tree: Replace error_setg(&error_fatal) by error_report() + exit()

 device_tree.c       | 23 +++++++++++++----------
 hw/arm/sysbus-fdt.c | 42 +++++++++++++++++++++++-------------------
 hw/block/fdc.c      |  9 +--------
 hw/ppc/spapr_drc.c  |  2 +-
 4 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.17.1

