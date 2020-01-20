Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp554838lfp;
        Mon, 20 Jan 2020 10:59:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQ9l6w/+EIY2SPSnfaNIiRDty76YP+4iTlYFvQB3kSEg99kFEkvq6PFKDLh4u++XDN34tu
X-Received: by 2002:a05:6402:c0f:: with SMTP id co15mr532914edb.200.1579546798649;
        Mon, 20 Jan 2020 10:59:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579546798; cv=none;
        d=google.com; s=arc-20160816;
        b=OPLjOLJLwLrlnUZUbYnO3QBMVnIfRbe9VSuxFi568ZQ802YURUP7/n9sMQn0oLut/d
         VupIcGdU6bn1s+p7w+tgKXBNcMQRbBnuPbe6dKu+nM0xuZ/d4CtCbtKy6Y+hXDPSVm0d
         lB3B72JUltDFrtbp7W7bp6MsPH2Hue9CzbHhVgsLp0YLLB2tZ2I8G7XtbooN6EJZalmP
         gkHYN4jItUdmpkuSh98j52/bR3jY6Ij8nuKtBTlmJznoZXyQuv+f59Bicbur/lClK1rN
         gR2fvwUyqcYtiheBi0+frpV4x0xJ9AdcE+J2DuolODwJmT/rUR0LE7WzXevGpgmDk/XO
         FBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FyT6X3cvGudDEoArP9RMSmHzFqcNVVsTlP/NRJe7+5c=;
        b=z2R2bGSnuO2vhnFAqD4Uu662sQvoY+Yhz4c7IeQRztcItso3mH8t1/XzKyE/nBYKIc
         +klc0rw8jr2DSFv77nMuJMNHx4MLiswlWC3pAfboLf/4/VJaVnG63H4HcJXxJF8T76lA
         vzKdfVCR92OPNIVxyhRpYZOleLg3chndEUo7UpV5+ujR7nsefF0MdYoIK2nJGN6BXXUb
         UYaQeZTZ6BVYPTjSmLsKPRiM78xIO5Pwi1TnBHD+2G+WSkMyBO5k2n04hlpMl8Zwbnwl
         KVxxDYYrizSgkOSDQYydIMkP5wJV4705g0nYadsIDpJUcqOqSIiVU6cAD7Ub4d0CeZui
         WSZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IOuf5kih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si26225233edt.55.2020.01.20.10.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 10:59:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IOuf5kih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itcHF-000674-5J
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 13:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itcH0-00066j-Uh
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itcGz-0004ow-Fm
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30764
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itcGz-0004oe-C9
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579546779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FyT6X3cvGudDEoArP9RMSmHzFqcNVVsTlP/NRJe7+5c=;
 b=IOuf5kih7yaymkjgrBty22xiuZY/jxE6Fsery0tnGwr6DbMVd1M6guLfPp++lozAxz1358
 JWlnAreHSaMVjIs27Ko2UwnCscTJxlNKkORzJqCGTbfzzIgq4W6cmscLoWCl62t9CpbIiU
 KqsQFoigDPoktayGn8QaJKnbU+eT5/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-n8UHzYvbPhKR4e8PYMSZng-1; Mon, 20 Jan 2020 13:59:38 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3DA818FE888;
 Mon, 20 Jan 2020 18:59:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BCD95C1BB;
 Mon, 20 Jan 2020 18:59:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] MAINTAINERS: ARM fixes
Date: Mon, 20 Jan 2020 19:59:26 +0100
Message-Id: <20200120185928.25115-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: n8UHzYvbPhKR4e8PYMSZng-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GtfcQicqVnGE

Few fixes after looking at Vladimir's commit-per-subsystem.py script:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg651545.html

Since v2 [2]:
- Do not move 'OMAP devices' section, but add 'SX1' new one (pm215)

Since v1 [1]:
- Rebased (dropping patch 1 merged as 1232ed1f27 via qemu-trivial)
- Add qemu-arm@nongnu.org to STM32F405 and Netduino Plus 2
- Added Alistair R-b tag

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg651746.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg671653.html
Supersedes: <20200118085509.30182-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (2):
  MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM machines
  MAINTAINERS: Add an entry for the Siemens SX1 (OMAP310) machines

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

--=20
2.21.1

