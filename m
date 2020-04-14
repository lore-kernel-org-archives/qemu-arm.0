Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5175683lfm;
        Tue, 14 Apr 2020 09:26:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypLEG0+3W18/fygsHjzO01pO73IF5Z+jTh/WT2OU4GI0F0gFSqt1jCAy/e99XREwXci50tJT
X-Received: by 2002:a37:65c3:: with SMTP id z186mr21250553qkb.484.1586881574243;
        Tue, 14 Apr 2020 09:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586881574; cv=none;
        d=google.com; s=arc-20160816;
        b=Ri0Ml0FWxHA6BtM+CyAdTf/hq22spZyZ24+2RyOsxxgWl18bRB3RmrJYV9niwU7AFm
         Q4F/8RcAIdVROPJ3NaGlbhP/aMtQdNoncCUfyd7f9qrJPMyXRlcywTdMlqTaznnKzjNY
         6+bhwA91jgRlSUPdKNgrJzTIwDsj1Zxh0l3OoloOwXj/f10tCjDlvang+sJv8LqJOWDj
         IlJtIuwiEq/xMtWJfNYnHs5jbBroe7OE60Cal18pHGYYTkefsFHBxX0nloE2yU9Y7KKV
         UaBInjuRg5PUA/a5qu65saOjRTmS0kkJl8jda57hXg6ZfevEixsGxsqxClLFb3wIzMqm
         RLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y/rgFY7WNEMopOTmHlFa39Xjz5jZHofpKGPcxFb/Lr8=;
        b=NRu40XBJvsBJDm6n0aMSf5rYM7JLnCpLOPQYahqBuJupcpbEY6ERXzh3HczeTuiWw7
         OoBBDSugMRHLjkDiYZxbZEjQllecKPmQ2YkyV3tqesKglNso2/FR9/m/rNyjq0MSOoSt
         1pJU8g1UTULOa0llhzRC4UzT8yHyWhsYZYUECJQb+vXNu1eO5Q8ZxK8YX2W/D988xQvl
         ylEGrXO2t5KiN82uVdX3ELZJcccUlX+E4mh5JtV6B5BF21/1zQm1PpuYDOwrmtO1t5m2
         dcX+u5reTS6diQFwm5h4SrdNF1bEhoM9HzYp375x/oA3SRTNgtJNFAjN1SpkSxcfhV9d
         ePJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qmeltb+p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d44si7906196qtk.291.2020.04.14.09.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:26:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qmeltb+p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOO5-0004ZZ-K6
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOON7-0003rh-EX
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOON1-0006iF-8b
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:25:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36205
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLeq-0008Ff-Dm
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/rgFY7WNEMopOTmHlFa39Xjz5jZHofpKGPcxFb/Lr8=;
 b=Qmeltb+pv+hSwqGqUeblQePyK/3g6YyiuxOOH7hGw/bOlF09gqpZhM7lpSEOnTtDYbkLWR
 irXG/MLGKX9CakEN7eVhc2GLqNuD/xZq43DlAy4qAY1rXazK3xwywCvBdckASrY+3wBJYC
 HG9KRdK4ejWbwoScXmbloBcUL4otm04=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-kBqa8BUDMSKoST0di2BHZw-1; Tue, 14 Apr 2020 09:31:17 -0400
X-MC-Unique: kBqa8BUDMSKoST0di2BHZw-1
Received: by mail-wr1-f69.google.com with SMTP id y1so8684609wrp.5
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 06:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBqRmHSNFWw2QuttdTKpWx4Ao+NBp9FCppR6Q9xcm8c=;
 b=sJqvrGQENkwAg2Eaz/fev5S3ZLBMUXeer5fwwbTdX/RiY2EpwXyAgisC1KHzr7EljK
 8K908bA67tBh4bmj9E9hWi8wAdsBXjZYx70zRVqCsznLCbKh8y8EgPvHVMjh0uCMolWo
 d4v33iudgzoPZlMsvI+3Pqhsynr0158IVz4Sbk1QztOw632lUD/CfE0nvk9yb9L4aBOW
 OKRHaGSUuH/tUS+x6e69jZjJam3EUgjM82L4B8H94zRUGTQ/wLletLSHEBRGLCOLOvI6
 OE+6SL9PnXL61wh2eDRrn85K+HvIOp1XE7A0X+cTvi3ZqeTbPikd/uv6JUkInBv21tOM
 Ftpg==
X-Gm-Message-State: AGi0PuY9NHY+gJ/4C/0vM+0eXmKSd+Rj1T/oZWTnv3gmcoNKQggHhurB
 6pd/OVtw7eZucGjbQ9H12o8eJYzF70Vk/+mK/iRHoLfIIV4PLx8mVjxJt1T47yQW2dPxwF7gyLr
 1oxDEB9ycEJdTUY8=
X-Received: by 2002:adf:fe41:: with SMTP id m1mr23553728wrs.52.1586871075983; 
 Tue, 14 Apr 2020 06:31:15 -0700 (PDT)
X-Received: by 2002:adf:fe41:: with SMTP id m1mr23553695wrs.52.1586871075712; 
 Tue, 14 Apr 2020 06:31:15 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id n124sm19188823wma.11.2020.04.14.06.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 04/12] qga: Restrict guest-file-read count to 48 MB to
 avoid crashes
Date: Tue, 14 Apr 2020 15:30:44 +0200
Message-Id: <20200414133052.13712-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d4MBg22vfLfk

On [*] Daniel Berrang=C3=A9 commented:

  The QEMU guest agent protocol is not sensible way to access huge
  files inside the guest. It requires the inefficient process of
  reading the entire data into memory than duplicating it again in
  base64 format, and then copying it again in the JSON serializer /
  monitor code.

  For arbitrary general purpose file access, especially for large
  files, use a real file transfer program or use a network block
  device, not the QEMU guest agent.

To avoid bug reports as BZ#1594054 (CVE-2018-12617), follow his
suggestion to put a low, hard limit on "count" in the guest agent
QAPI schema, and don't allow count to be larger than 48 MB.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg693176.html

Fixes: CVE-2018-12617
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1594054
Reported-by: Fakhri Zulkifli <mohdfakhrizulkifli@gmail.com>
Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qga/qapi-schema.json | 6 ++++--
 qga/commands.c       | 9 ++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index f6fcb59f34..7758d9daf8 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -266,11 +266,13 @@
 ##
 # @guest-file-read:
 #
-# Read from an open file in the guest. Data will be base64-encoded
+# Read from an open file in the guest. Data will be base64-encoded.
+# As this command is just for limited, ad-hoc debugging, such as log
+# file access, the number of bytes to read is limited to 10 MB.
 #
 # @handle: filehandle returned by guest-file-open
 #
-# @count: maximum number of bytes to read (default is 4KB)
+# @count: maximum number of bytes to read (default is 4KB, maximum is 10MB=
)
 #
 # Returns: @GuestFileRead on success.
 #
diff --git a/qga/commands.c b/qga/commands.c
index 5611117372..efc8b90281 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -11,6 +11,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "guest-agent-core.h"
 #include "qga-qapi-commands.h"
 #include "qapi/error.h"
@@ -24,6 +25,12 @@
 #define GUEST_EXEC_MAX_OUTPUT (16*1024*1024)
 /* Allocation and I/O buffer for reading guest-exec out_data/err_data - 4K=
B */
 #define GUEST_EXEC_IO_SIZE (4*1024)
+/*
+ * Maximum file size to read - 48MB
+ *
+ * (48MB + Base64 3:4 overhead =3D JSON parser 64 MB limit)
+ */
+#define GUEST_FILE_READ_COUNT_MAX (48 * MiB)
=20
 /* Note: in some situations, like with the fsfreeze, logging may be
  * temporarilly disabled. if it is necessary that a command be able
@@ -560,7 +567,7 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, bool=
 has_count,
     }
     if (!has_count) {
         count =3D QGA_READ_COUNT_DEFAULT;
-    } else if (count < 0 || count >=3D UINT32_MAX) {
+    } else if (count < 0 || count > GUEST_FILE_READ_COUNT_MAX) {
         error_setg(errp, "value '%" PRId64 "' is invalid for argument coun=
t",
                    count);
         return NULL;
--=20
2.21.1

