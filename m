Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3194460wru;
        Mon, 1 Jul 2019 17:15:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGeQrqqJhSMP+YvCY7ehg2RYZwPciw2xakRDVRw04Oo+LrnA53fRldp9GzliGhgShXOQNi
X-Received: by 2002:a0c:d1e2:: with SMTP id k31mr24263417qvh.173.1562026529105;
        Mon, 01 Jul 2019 17:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026529; cv=none;
        d=google.com; s=arc-20160816;
        b=l006+2zHvGio07jxcZjkK6DwzEE85f7kvah5ZZ7neAhrpcyA4mqWn9cOZEqTv4rGtx
         mNnAvCPjVI+EB+jIraINmyOhLJ+kXJ/LAwJEXouSCnqrMdRP90G1eQEoKWGn3wxrgzdT
         zHNzV+/l9IoD4nO5rTgYPZbThnssihqH/kFo7MRZnKAiFwaRHdByfuv5JKP/mqJS6byS
         mH837iqfCoQ3m3RgtcB8pd1rxOVsd3eKNLwZ+P4X3VS6a+athMJhO40y+8qkCnkvylZU
         YlxQNkl1ivvo+YikJZizVpDpt37dP03hrZySIakGOv/OsMf5N/3GHIu8k3AzBYwaE4qm
         KFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=yff0XpuNrzKOow1CNpTsCFfBvFIYeKjHhV+Css2AqAc=;
        b=xXS92LSaPRWILxOTxa5mElriSgKdPydon35OXjAfMrCOL463ersEQBVNzS6v4uu9Om
         pzPVbBDVeH7vrVO5oPqUDeT74fIh2nKOLgILlLsqdAmV+aMB9un2M/7p4RR1l/q/Iikn
         zhmGMrzElW5S5RXJJ3QFq9wDqb6SvkhU/TTnTJatZ00qQJT72UkxL7tCFa++2B/l4koT
         6qfe+tBfL0fc6QJzYAXAAeHjt3ulFbUbeEFxH6nYO9EpJ1mGfREdWg/SNK88K0BNlol6
         Xhauk0yJSFpmVlwGvh14vNWotdeWLLwSkVvybEW27++ogo2nD6IaRvOvZQ089xWMxMBv
         fyaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l5si8549862qve.23.2019.07.01.17.15.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 205313079B8E;
	Tue,  2 Jul 2019 00:15:28 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F001001B01;
	Tue,  2 Jul 2019 00:15:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Markus Armbruster <armbru@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	qemu-block@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [PATCH v2 6/9] hw/block/pflash_cfi01: Simplify CFI_QUERY processing
Date: Tue,  2 Jul 2019 02:12:58 +0200
Message-Id: <20190702001301.4768-7-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 02 Jul 2019 00:15:28 +0000 (UTC)
X-TUID: +fNxgLiMq5Ah

The current code does:

if (write_cycle == 0)
  if (command == CFI_QUERY)
    break
  write_cycle += 1
  last_command = command

if (write_cycle == 1)
  if (last_command == CFI_QUERY)
    if (command == READ_ARRAY
      write_cycle = 0
      last_command = READ_ARRAY

Simplify by not increasing the write_cycle on CFI_QUERY,
the next command are processed as normal wcycle=0.

This matches the hardware datasheet (we do not enter the WRITE
state machine, thus no write cycle involved).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 8d632ea941..c1b02219b2 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -492,7 +492,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
             return;
         case 0x98: /* CFI query */
             DPRINTF("%s: CFI query\n", __func__);
-            break;
+            pfl->cmd = cmd;
+            return;
         case 0xe8: /* Write to buffer */
             DPRINTF("%s: Write to buffer\n", __func__);
             /* FIXME should save @offset, @width for case 1+ */
@@ -566,13 +567,6 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                 goto mode_read_array;
             }
             break;
-        case 0x98:
-            if (cmd == 0xff) {
-                goto mode_read_array;
-            } else {
-                DPRINTF("%s: leaving query mode\n", __func__);
-            }
-            break;
         default:
             goto error_flash;
         }
-- 
2.20.1
