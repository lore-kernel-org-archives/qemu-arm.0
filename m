Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp663067lfb;
        Mon, 4 May 2020 10:25:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKk86Jc+VQ/wRQ8B/f7hhPBNLaWb2YFoV91fKlW1kEh5IRlKt0wTCStrR/3+bVC/8xORgED
X-Received: by 2002:a37:7b01:: with SMTP id w1mr259879qkc.167.1588613155808;
        Mon, 04 May 2020 10:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588613155; cv=none;
        d=google.com; s=arc-20160816;
        b=GnY70w/5sa3HLtYZ/pA1VPalPK9p9vVXmlkPzYBEplLhAFLkWbYwnU/IWfe/83H/Ct
         ceCskc22hGQHgwtcmrN91syyuoIJNIu7q3WAFPhavMkSwkmnpxqeJAEmOpstUI9LuKmW
         j1H9m2Mml6cWLPtdWKZ0tjLKQrBpzIZi1+18aMpJypOvxElHP6iBl6jH0Z6Sf8MLuYtC
         cUS7co5FwkH7G+1DGb497lgfdW5Stv/kwQ/WS0ryLvwDvrVI7XCaeC1km7zuKuvofX52
         cgUAoLfapP+qcTiE7y3z1mIWZe3BLfwb0RJgwnibbsoQlCYDnwnF6V7U5Hr2jFpZJ/nx
         LgFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iA8FqqMjH3exPTKpefZtcF5t6yrp6h6MGztNneH3c1g=;
        b=szB9QePt1mdM559dSr4byBnUHN6JZEOg4EUg/eIrukA06sH74JjWYNvyhu8hvSsMiL
         +7f5kffk1ZJe1tff9BMdRYA8L++HDLV0QM1wWdDQtu4mcT891IkGAi8/WulRaEvstRtX
         gYxewzdQrA2nv8+liZ/zcfBCvD24MHVaBs2bVdPBiyWqJaj2GSfcv40tgX//WXT6k6Hw
         Var1eXnGt3JfNSl8mF7sIVmVhoNPBqLL9HIsEsGI/o+cSGAakjdn6KR0xlVQhT0BSsz/
         fPm4V+C4oHfKPCkclJxsRVBx9gVfAHMFf6f2+nvwQnIylFQup9bMMqVInTFVs1hj/cSU
         8mNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KvoCXzGN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c15si6903969qtp.307.2020.05.04.10.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KvoCXzGN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVeqp-0003BQ-8N
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVepx-0001uX-2u
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36400
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVepv-0005Ge-D6
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588613098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iA8FqqMjH3exPTKpefZtcF5t6yrp6h6MGztNneH3c1g=;
 b=KvoCXzGN929cGi2yVuCZoVvRWBs4noMn8Zog/PzgeNRIDg6bZ7qZ9VVF4JCWMS48yPeqxb
 YckVRny11e2ELm6+TqkWyLw9EQkDJq5t/2oqoaSnKrVFU6wiaJRr2VG9fErJmJOSx3CQ/x
 Bel5CGrSemuVFNKcuIDjD8kYKfvRSN4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-tmcO1zg8N7i9Erj_Z5KYUA-1; Mon, 04 May 2020 13:24:51 -0400
X-MC-Unique: tmcO1zg8N7i9Erj_Z5KYUA-1
Received: by mail-wr1-f72.google.com with SMTP id 30so191811wrp.22
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D57NXlFkbN/fOUMJdqhRrNFq2S4cg5DUCwfIfYPqP+M=;
 b=t8nzmFYsnFDGPCD8Sd+QTV288ssVgstATx23O7ISeOrJaBgqKLSatu6nlZOef6ZUWS
 9Jrtw7ZPp+b/1NAM8O7mDVPLKtXfG3bjEBzUq7nMCl/sZ9MZzOCc/HqQ7Z/p0wTqqA6O
 NpiWB+FGTNteizzwLCE3BXBZuMaUHqqG/GOlh7WZOlpNok8Ch3p01T+I/+KigAjj+NUl
 W0HZAGAOZ7WKzOlGL6/Cj3bphC+rvR91IcSagc/FA+pXl7G/1FMsPf1ntGUWMNiEK+cz
 7WyK74D2M5AP4dtKk7/cddmJiOuqb++GcD/mlovR+icLzpMHeVD7anxSBLin0AEDBcNu
 1xmQ==
X-Gm-Message-State: AGi0PuaUyfH0cy7LYOjldVQGe7px2GmgYWWFr2fJfav99WajYyncecMn
 2e7gzN7Z3/mO+7mUaO8lAc4BvAtdJNghPNix106Z81UnBOKlyvkd9Yk90bNmOBoCyycryDVyRmQ
 Na2CjRJ4FlSIo
X-Received: by 2002:a05:6000:11cb:: with SMTP id
 i11mr97441wrx.339.1588613089892; 
 Mon, 04 May 2020 10:24:49 -0700 (PDT)
X-Received: by 2002:a05:6000:11cb:: with SMTP id
 i11mr97414wrx.339.1588613089638; 
 Mon, 04 May 2020 10:24:49 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a8sm7329475wrg.85.2020.05.04.10.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 10:24:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] target/arm: Restrict TCG cpus to TCG accel
Date: Mon,  4 May 2020 19:24:43 +0200
Message-Id: <20200504172448.9402-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 05:09:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: he9on/vZjd85

These are the uncontroversial patches from "Support disabling
TCG on ARM (part 2)"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html

The other patches are blocked by the "accel: Allow targets to
use Kconfig" series:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html

Patch #4 is new "Restrict v8M IDAU interface to Aarch32 CPUs".

Since v2:
- Fixed set_feature() clash trying to KISS
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg697523.html
- Fixed aarch64-linux-user build failure reported by Peter:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg699319.html

Since v1:
- Dropped 'Make set_feature() available for other files' patch
  which fails to build with KVM only, see:
https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html

Many thanks to Richard Henderson for his patience (again...)!

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (4):
  target/arm/kvm: Inline set_feature() calls
  target/arm/cpu: Use ARRAY_SIZE() to iterate over ARMCPUInfo[]
  target/arm/cpu: Restrict v8M IDAU interface to Aarch32 CPUs
  target/arm: Restrict TCG cpus to TCG accel

Thomas Huth (1):
  target/arm: Make set_feature() available for other files

 target/arm/cpu.h         |  10 +
 target/arm/cpu.c         | 662 +-------------------------------------
 target/arm/cpu64.c       |  18 +-
 target/arm/cpu_tcg.c     | 664 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c       |  13 +-
 target/arm/kvm64.c       |  22 +-
 target/arm/Makefile.objs |   1 +
 7 files changed, 698 insertions(+), 692 deletions(-)
 create mode 100644 target/arm/cpu_tcg.c

--=20
2.21.3

