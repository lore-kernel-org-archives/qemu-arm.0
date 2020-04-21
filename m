Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5024945lfm;
        Tue, 21 Apr 2020 05:16:29 -0700 (PDT)
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr4508301wmi.78.1587471389532;
        Tue, 21 Apr 2020 05:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587471389; cv=none;
        d=google.com; s=arc-20160816;
        b=VvB5n6Q8RLmB3G06CvbeAn+JQQ2Y1HlTLd6CsxPy0Ajtlws8eFFpOOyR8JI4r1p1/D
         OI/R3LWRX5BL0heORBETwfFjsrhkLxeyQsyHa1uAC9rJJAZvuQ3+tA+IHyB3fJH9tHxK
         7EwwFlye3FgsYf3gEcJ650Jd1FVpwCeWUqzwF4ogEjVn9PERJIcQmB1R3WQI7dVINyw4
         rqScsLncd9Q9MFXW3QRREQ3BjFGNhppNrgSsy9eml5YmiD+vh5Fnyq0RQwNvkxXr2+RX
         aAWXJwfjgJA4zdD/gGgyz4foCpekVfx08gjrDFdbX8cYV0KNdCcxqvOAO7bPXFwGlppA
         B5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:dkim-signature;
        bh=huvSKrhwbgnnyBc8SFTyGesgTCOFYnJW8oU3B5ttXk0=;
        b=TJQ0pdULMthWLlKgV0pki6RKyR/2QRSw0g81to5NcJTH1XB+j7O+jlc5gfx/GurgjJ
         QlhobjxzIRoAA1VQs2BKM874pdDtG6wjo/rFD+W2ILNU4bYZai7Jm9fp5Xh1fB0ylPpO
         7sMi81IsC5oEkphnuT3Yfc3hF3leJy6Jw6PJwr/2HGqg3lGTvMWQCL7wxi1bplJ/3mGS
         UH6FkJS3kYU/i3FhnvBiDao9GKY/yAwdXpNHXnOlHkuoVFVyAGyLA0l0YhMQ6KushoMt
         J8bCEjLVIlFDDWSBbMtfmuRRMZGXD5YY8CzwxZtLLwNPV5G/yCFEoI6St4TAZkgwtijh
         hA6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIjbl7cO;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3sor1536250wrx.32.2020.04.21.05.16.29
        (Google Transport Security);
        Tue, 21 Apr 2020 05:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=iIjbl7cO;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huvSKrhwbgnnyBc8SFTyGesgTCOFYnJW8oU3B5ttXk0=;
        b=iIjbl7cOzsklTG+yNcO4jW0X1JPwvYVJNIZwUhp1uGHocVcQnia//77Oo/Q9nss+GF
         ZGovnobWbYyp2Bz0lbvG3xd1WaR1J5vMiGottxN7V23Rptwz3K7HzrLkr6Az7cIbWxF8
         sLoCVuj2r59WGbT2ikrCVHBNebBqUPS9T12uLc4SrXCq1qFUQsq2fXYhXuCQPd/WpOYm
         dmbJHi0ow6T+nhDbeMs1euBJ1SI1Yb2KRMtIkEpeQzkd2517IwyC2bfjeb1Rs62tOAuf
         rooRt3reLDP9Rjb2LYjnk9ZlP45qeq/SEGuf6Sc/eoChneCfoXfeN/Fwj+IsRaMpb7aj
         UQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=huvSKrhwbgnnyBc8SFTyGesgTCOFYnJW8oU3B5ttXk0=;
        b=JAI2NJUcMeL3Yvo2Mrcx3k6pLA9AilxWneZe23wg0poRGEnOl6iw+etH38/zp6Xajm
         ta3r/9C004barJoW7gpkd3o0JFqA7QwzahLnKFXM9NbabLRyPMgemN7MEAt8fBkuhTmV
         lg6WbgqWluZfSXTZuRu5LVLhwoHe9V6FDZzUF7VOSZq6y88ASJ2E7FMs4CJRYEPkVh6D
         FibHYpgAAQpv5k0cF2IgRWE3h9ujyMIbQckQyM2lifOp0NxWMPimkiwkFEUh+29l2l8Q
         /UoMVqWqHdzu92c5adcVJqh+QIQqYZ0sWaJkk7FHwO9imvIPXiUhSs3wyrmBk82/OzPe
         U8rg==
X-Gm-Message-State: AGi0PuZi5j3d3ZqYQIHfwP8WKtEurWgud8WHXDTSQioTI/IxEkhP3aF0
	lMIoICrXVSDdOqAEcdFNLU6IINDCcs4=
X-Google-Smtp-Source: APiQypKbLPg5jAwERC099E5WmYT+SzxtZFkeWcINgt/NfsldvPgF+bmSPcaHNuupechgDfhpPqDO9w==
X-Received: by 2002:a5d:4dcb:: with SMTP id f11mr23469392wru.174.1587471389101;
        Tue, 21 Apr 2020 05:16:29 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 05:16:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Keith Busch <keith.busch@intel.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Guenter Roeck <linux@roeck-us.net>,
	Joaquin de Andres <me@xcancerberox.com.ar>
Subject: [RFC PATCH 00/17] hw/misc: Introduce a temperature sensor interface
Date: Tue, 21 Apr 2020 14:16:09 +0200
Message-Id: <20200421121626.23791-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: x+gDf51XfZYZ

Hi,

This series is part of a bigger one I was preparing for a GSoC
project, but unfortunately no student got interested.

The idea is to allow device with temperature sensors to use a
common API with temperature operations.

While guest are running, you can modify the temperatures to check
the guest reactions. Some devices can trigger IRQ when temperature
pass thresholds. Somehow similar to inject NMI.

Some devices could also modify their temperature regarding their
workload.

The tsc2xxxx devices are interesting but can't be converted as
they predate QOM/QDev.

Temperature changes rate is <1Hz (not enforced in this model) so
using a QMP to get/set is acceptable.
The query-temperature-sensors command is for informative purpose,
also acceptable for QMP use.

Next step might be to publish QMP events when temperature change.

The original goal is to better interface ADCs with real world data.
Here using QMP is not an option. Here the idea is to use the
AudioState and audio_sample API from "audio.h" but it seems not
very used, see: https://bugs.launchpad.net/qemu/+bug/1861677

What is not clear yet to me is what's the best way to externally
set a specific sensor temperature. The TMPxxx I2C sensors use
object_property_set_int(). I could move that to the temp-sensor
interface but it seems a bit overkill. Any simpler idea?

Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Keith Busch <keith.busch@intel.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Joaquin de Andres <me@xcancerberox.com.ar>

Philippe Mathieu-Daudé (17):
  hw/misc: Introduce the temperature sensor interface
  hw/misc/temp-sensor: Add 'query-temperature-sensors' QMP command
  hw/misc/temp-sensor: Add 'info temp' HMP command
  hw/misc/tmp105: Extract get_temp_mC() and set_temp_mC() helpers
  hw/misc/tmp105: Implement the 'temperature-sensor' qdev interface
  hw/misc/tmp421: Add definition for SENSORS_COUNT
  hw/misc/tmp421: Extract get_temp_mC() helper
  hw/misc/tmp421: Extract set_temp_mC() helper
  hw/misc/tmp421: Implement the 'temperature-sensor' qdev interface
  hw/misc/bcm2835_thermal: Hold the temperature in the device state
  hw/misc/bcm2835_thermal: Implement the 'temperature-sensor' interface
  hw/misc/bcm2835_property: Hold the temperature in the device state
  hw/misc/bcm2835_property: Implement the 'temperature-sensor' interface
  hw/display/ads7846: Implement the 'temperature-sensor' qdev interface
  hw/ide/qdev: Implement the 'temperature-sensor' qdev interface
  hw/misc/imx6ul_ccm: Implement the 'temperature-sensor' qdev interface
  tests/qtest/tmp105-test: Trivial test for TempSensorClass

 qapi/misc.json                     |  24 +++++++
 include/hw/misc/bcm2835_property.h |   1 +
 include/hw/misc/bcm2835_thermal.h  |   1 +
 include/hw/misc/temp-sensor.h      |  69 +++++++++++++++++++
 include/monitor/hmp.h              |   1 +
 hw/display/ads7846.c               |  38 +++++++++++
 hw/ide/qdev.c                      |  14 ++++
 hw/misc/bcm2835_property.c         |  39 ++++++++++-
 hw/misc/bcm2835_thermal.c          |  42 ++++++++++--
 hw/misc/imx6ul_ccm.c               |   7 ++
 hw/misc/temp-sensor.c              | 102 +++++++++++++++++++++++++++++
 hw/misc/tmp105.c                   |  51 +++++++++++----
 hw/misc/tmp421.c                   |  74 ++++++++++++++++-----
 tests/qtest/tmp105-test.c          |  18 +++++
 MAINTAINERS                        |   6 ++
 hmp-commands-info.hx               |  11 ++++
 hw/misc/Makefile.objs              |   1 +
 17 files changed, 463 insertions(+), 36 deletions(-)
 create mode 100644 include/hw/misc/temp-sensor.h
 create mode 100644 hw/misc/temp-sensor.c

-- 
2.21.1
