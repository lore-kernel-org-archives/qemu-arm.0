Received: by 10.223.159.74 with SMTP id f10csp5660610wrg;
        Wed, 13 Dec 2017 15:21:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBovCKmGZzsyTGAHU0NcQo9EXuJ8e+YnR8weicr3c0qC1D7sWtbYCQ10esq2yrcJsEY06Dz/K
X-Received: by 10.37.128.204 with SMTP id c12mr1966513ybm.426.1513207271620;
        Wed, 13 Dec 2017 15:21:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513207271; cv=none;
        d=google.com; s=arc-20160816;
        b=txzP1V4+Q98kO7cZ6x/kBjxMeVkCBsTCUa5x2V3HE2EpqgUK5/BN2HN+GS9LpGCp9i
         tZEUTkznvG31VCU13bq0cYX07ZRvUVGfwZgO9dWFQINb/dm3FEJSKM+Ty4V4W5+nhjew
         olqlxO5bB2WqYRf/3THJ3ao11T97VvXaOgCi9EIJ+BqhtvFUCjVNnYFmQwztlg6s/aux
         5vOnHnqsN06FkT6tTpjwdI8ic7PaiBCcFefyF5pzYQFFusePhnWPsD3jR+Tu51hAQ1Io
         MTe0fDGgald3swTwOImgCIF+QzfvpBRI3L1+oPpMBeNZKANScVeTGhkc2Nx+7OPloKdG
         1BsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=7YOzH7Voi5jLw3zCe3RMnWtS11E21hWLonnJtPtcVhM=;
        b=spKdjxADBvbUIwmBagNU1GTV9OA5cP+bmtH/k3x67obNeVypsKHSrVQCm2Aj2NFWfJ
         4ueJt1qMCADUJURFNCI6R31RX2lWlpth6rE735HGcPpr65q1yMT3KbdQ0lR3Tyc1wPAU
         lDVvZKpwTyNcxdVSna/sTf5xUHUzXC2G8JxZFEXNazqSBGRKCANwxxMo/Wt4W6vcpvtU
         +MeNLaXnPLSQjJW+Gx6k/KRblryZi2QKNeuFq8UBKYxsK4pkUyXxJZKEbEqht7MxXTUJ
         VeUSRSV7YFD8Ik/hL1rsXcqKU5WnfCLny+cXyalEkmPZ6bxK76rwg4/kLI4dh2uWT04Q
         z5Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MTy1NQzU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r14si222689ybb.637.2017.12.13.15.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 15:21:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MTy1NQzU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePGKt-0004di-1L
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 18:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePGKg-0004cM-LJ
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 18:21:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePGKf-0006Af-9C
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 18:20:58 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:32847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePGKX-00061h-4C; Wed, 13 Dec 2017 18:20:49 -0500
Received: by mail-qt0-x229.google.com with SMTP id e2so5916333qti.0;
	Wed, 13 Dec 2017 15:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7YOzH7Voi5jLw3zCe3RMnWtS11E21hWLonnJtPtcVhM=;
	b=MTy1NQzUKB9sRf/FsJatkqfT8P6yEyYhet0G8sIiV6DvlyYSWQAneRzDC2PwKU9tgb
	4/jNex0X36U+BlzTqPl0Z3KbsL3HuEffDENsgyA0CiDLKgkjqUziTpM0z0791L4XjLM6
	TBd7wD1h8sQeCN6zVxp13bKx0J9IQhTTMC/1PkPF5DZ9Gau+9EZ61Z1CJpD8K0+J+qOd
	7hoRGaQjlDkfeEzUyQzBNEa7tZxyxn3Kpv9JTH+SnX3l+uLTdOJVhDNNfr+sJED+ZRiL
	AKyPF9rc/usp/CTjtDwWlxg0HzVChLzlzT5u/JBKL6oXDMqiTU94jsqblNBkUWACB2Rz
	hD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=7YOzH7Voi5jLw3zCe3RMnWtS11E21hWLonnJtPtcVhM=;
	b=Pc7TkBRzB+frGqNR17P1O+N+uXywktuyr9dzqeddHgRtB8f7HN32Wn6PHIA9LmKlwN
	11luk1IjajFXxwm+tB55nRkIEZa9CudofWpPD7O2AxwJr7R39tGrkKTiCAk6kFS684iW
	ixEV8vurfahX/r+bgsUBkGTT6165mU4C9aOFCjAlMqdzCS0HoJRyz3E8JRJJyx1ZW/cC
	sgQ44vrH91XJ4m1PmaQR8iYubLeuAGieT+uX5p7RHsXy10e7OWd1WNBi+d/WSaRmtF4S
	FmYC91Ls73C5hGS4jZnf0HvS7MQCvciR/VFDDhDUKi2o7d2C/klBD1yQSJIwaGl3WYpm
	ITTA==
X-Gm-Message-State: AKGB3mKp6d/XDuFXk4n9r0dVbcyB4VOLNNXD2R9fxHQC1N4DigOUg7s3
	X808wtGJ703pSSXzxza3qLk=
X-Received: by 10.200.22.91 with SMTP id x27mr13384998qtk.226.1513207248519;
	Wed, 13 Dec 2017 15:20:48 -0800 (PST)
Received: from x1.local ([181.91.222.165])
	by smtp.gmail.com with ESMTPSA id l1sm1666918qkk.74.2017.12.13.15.20.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 15:20:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>
Date: Wed, 13 Dec 2017 20:19:59 -0300
Message-Id: <20171213232025.24503-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-arm] [PATCH 00/26] SDCard housekeeping
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Fam Zheng <famz@redhat.com>, Isaac Lozano <109lozanoi@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SWV4PQEDN3cg

Now that we have a way to write qtest in Python, lets start with a simple test
to perform basic card identification, covering many functions of the sd/sd.c
file.

[patch 1]
When a device is not MMIO-connected but rather plugged into a Bus, it is easier
to write tests using QMP.
So we add a 'sdbus-command' entry to directly operate on a SD Bus.
(Note this method should also work with all other QBus).

[patch 2]
We write a simple pyqtest, which
  - resolve the SDBus QOM path in the test setup()
  - verify default values for SD Spec v2.

Since have a test, lets run after each patch, so we are sure we don't break things.

[patch 4-14,20-23]
Add a bunch of trace events
[patch 3,11,15-18]
Aesthetic changes mostly
[other patches]
Trivial changes

Once this series applied, booting some Linux on a vexpress-a9 with few
sd*command traces enabled result in this outputs (which result useful to
understand/fix the different SD implementations):

48.687227:sdcard_normal_command         IO_RW_DIRECT/ CMD52 arg 0x00000c00 (state idle)
48.687233:sdcard_command_response (no response) (state idle)
48.689237:sdcard_normal_command         IO_RW_DIRECT/ CMD52 arg 0x80000c08 (state idle)
48.689244:sdcard_command_response (no response) (state idle)
48.690877:sdcard_normal_command        GO_IDLE_STATE/ CMD00 arg 0x00000000 (state idle)
48.690890:sdcard_command_response (no response) (state idle)
48.723486:sdcard_normal_command         SEND_IF_COND/ CMD08 arg 0x000001aa (state idle)
48.723507:sdcard_command_response 00 00 01 aa  (state idle)
48.723886:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x00000000 (state idle)
48.723892:sdcard_command_response (no response) (state idle)
48.724019:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x00000000 (state idle)
48.724023:sdcard_command_response (no response) (state idle)
48.724110:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x00000000 (state idle)
48.724115:sdcard_command_response (no response) (state idle)
48.724178:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x00000000 (state idle)
48.724181:sdcard_command_response (no response) (state idle)
48.724999:sdcard_command_response 00 40 01 20  (state idle)
48.725214:sdcard_app_command         SD_SEND_OP_COND/ACMD41 arg 0x00000000 (state idle)
48.725225:sdcard_command_response 40 ff ff 00  (state idle)
48.727113:sdcard_normal_command        GO_IDLE_STATE/ CMD00 arg 0x00000000 (state idle)
48.727125:sdcard_command_response (no response) (state idle)
48.729206:sdcard_normal_command         SEND_IF_COND/ CMD08 arg 0x000001aa (state idle)
48.729213:sdcard_command_response 00 00 01 aa  (state idle)
48.729339:sdcard_command_response 00 00 01 20  (state idle)
48.729412:sdcard_app_command         SD_SEND_OP_COND/ACMD41 arg 0x40300000 (state idle)
48.729419:sdcard_command_response c0 ff ff 00  (state ready)
48.729786:sdcard_normal_command         ALL_SEND_CID/ CMD02 arg 0x00000000 (state ready)
48.729797:sdcard_command_response aa 58 59 51 45 4d 55 21 01 de ad be ef 00 62 19  (state identification)
48.730825:sdcard_normal_command   SEND_RELATIVE_ADDR/ CMD03 arg 0x00000000 (state identification)
48.730835:sdcard_command_response 45 67 05 00  (state standby)
48.731221:sdcard_normal_command             SEND_CSD/ CMD09 arg 0x45670000 (state standby)
48.731228:sdcard_command_response 40 0e 00 32 5b 59 00 00 0d 47 7f 80 0a 40 00 00  (state standby)
48.732012:sdcard_normal_command SELECT/DESELECT_CARD/ CMD07 arg 0x45670000 (state standby)
48.732021:sdcard_command_response 00 00 07 00  (state transfer)
48.732419:sdcard_command_response 00 00 09 20  (state transfer)
48.764983:sdcard_app_command                SEND_SCR/ACMD51 arg 0x00000000 (state transfer)
48.765000:sdcard_command_response 00 00 09 20  (state sendingdata)
48.766951:sdcard_command_response 00 00 09 20  (state transfer)
48.767159:sdcard_app_command               SD_STATUS/ACMD13 arg 0x00000000 (state transfer)
48.767168:sdcard_command_response 00 00 09 20  (state sendingdata)
48.966731:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg 0x00000000 (state transfer)
48.966763:sdcard_command_response 00 00 09 00  (state sendingdata)
48.974869:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg 0x00000000 (state sendingdata)
48.974877:sdcard_command_response 00 00 0b 00  (state transfer)
50.044308:sdcard_normal_command          SEND_STATUS/ CMD13 arg 0x45670000 (state transfer)
50.044330:sdcard_command_response 00 00 09 00  (state transfer)
[...]

Regards,

Phil.

Based-on: 20171213213557.26561-7-f4bug@amsat.org
          (QTests: use Python to run complex tests)

Philippe Mathieu-Daudé (26):
  sdbus: add a QMP command to access a SDBus
  sdcard: add Python qtests
  sdcard: use ldst API
  sdcard: replace fprintf() -> qemu_log_mask()
  sdcard: rename sd_set_mode() -> sd_update_mode()
  sdcard: add sd_set_mode()
  sdcard: add sdcard_set_mode() trace event
  sdcard: add sd_set_state()
  sdcard: add a sdcard_set_state() trace event
  sdcard: use more detailled state/mode trace events
  sdcard: use warn_report() instead of fprintf()
  sdcard: replace DPRINTF() by trace events
  sdcard: add more trace events
  sdcard: use qemu_hexbuf_strdup() to trace command response
  sdcard: use PW_LEN define instead of '16' magic
  sdcard: let cmd_valid_while_locked() returns a bool
  sdcard: rename sd_set_REG() functions called by sd_reset() as sd_reset_REG()
  sdcard: move Memory Card registers together
  sdcard: add DSR register
  sdcard: add/use SD_CMD_MAX to check valid SD commands
  sdcard: add sd_cmd_abbreviation() to resolve the SD command id
  sdcard: reduce sd_cmd traces
  sdcard: add ACMD trace events
  sdcard: use a 16-bit type for the 16-bit RCA register
  sdcard: add/use a SDCardCommandClass enum instead of magic numbers
  sdcard: add/use a ccc_spi enum for the commands supported in SPI mode

 qapi-schema.json       |  41 ++++
 hw/sd/core.c           |  43 ++++
 hw/sd/sd.c             | 519 +++++++++++++++++++++++++++++++------------------
 stubs/qmp_sdbus.c      |  11 ++
 hw/sd/trace-events     |  17 ++
 stubs/Makefile.objs    |   1 +
 tests/Makefile.include |   2 +
 tests/sdcard_tests.py  | 172 ++++++++++++++++
 8 files changed, 617 insertions(+), 189 deletions(-)
 create mode 100644 stubs/qmp_sdbus.c
 create mode 100755 tests/sdcard_tests.py

-- 
2.15.1

