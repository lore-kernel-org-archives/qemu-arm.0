Received: by 10.28.173.206 with SMTP id w197csp3730736wme;
        Tue, 9 Jan 2018 06:02:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBovIz0/M4W16QcFUYr77a9MM51XW1xzGHCfb2nB/HtJEf4kF0NxgR5KHGejxmRaAn/tsKTU/
X-Received: by 10.37.97.210 with SMTP id v201mr1596032ybb.511.1515506537075;
        Tue, 09 Jan 2018 06:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515506537; cv=none;
        d=google.com; s=arc-20160816;
        b=QXoNDDY+pc9aNwxWTaekm3xkHnL8zn+lKqiJaajF2p75qHWBBgGZk4X6w5IU5UBVLL
         lwQ03Zxernu8YPnLPgG7errH51zhAS9KeGgND9+50ULHdhKo4v6uZtib/TOQobv/i6Sz
         HPMlBhv2F4DvXWexLs1Z4XhJJMV7zx0OKMijTHX1HIIGyVhPn5g+/+gzDiXc7yEii8Ju
         Lh3+o88ncs6xPia1tTySuXa+gK2/y+NH94Mso0o7hAfKjkqOptrS2vilo2zecF/PgWBl
         nDqIEol3h37sjXy6ucuX73QYRaPFtwZhnskuPdgQhUrdu/CqwfjrZ4kFBQOqVyWbXDKZ
         y6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=wDEYJyrKE6FKPOH2pV0uTir07F29CnHuFXfP21KwkFs=;
        b=SC7uLCgs0iHOfU/N11jKcjvGU347auqHpIs8BQSA2FuGFCLu3pbK6UcO3Nwr5dpWzg
         SQ0z/+UslqcCxmaAZugQ/ohmDIm21/FfVNrtOxh/2wGucgaxNVU6kgt4yAdwzWxl6Fu4
         nja7795Gmk3gRkOzbsXGFjcXH1NMsX3oPujXGV9R+Ng5ktp15Hy8ne3Oz6fXqhg1OfEL
         /Qn3b6iMprE6q4cCeeFZNdsToX0ysKi/4AuATu/YQE1CGV09fYVhsJCXGkHYhU5SvQr6
         e8vfuPsdUVO0qk/xGmkAiMYslU7rpiRc9UgnSILbG4l8BAmOzP0CxjI2IjeLrM6twX+P
         e3ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si2969450ywb.790.2018.01.09.06.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:02:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYuTo-00075a-Fx
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:02:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTW-00074a-In
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTV-00015x-GH
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:01:58 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:45792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eYuTV-000159-6l; Tue, 09 Jan 2018 09:01:57 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eYuTS-0003dy-E3; Tue, 09 Jan 2018 14:01:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jan 2018 14:01:49 +0000
Message-Id: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/4] Reset SD cards attached to legacy-API
 controllers
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TRUxiziO0SPh

It turns out that we don't reset the SD card model if it's
attached to a legacy-API controller. For new-style controllers
where the SD card object is attached to an SD_BUS, the generic
qbus infrastructure takes care of ensuring that the card's
DeviceState::reset method gets called. But for the legacy
API where the card is created by calling sd_init(), the card
object has no SD_BUS to plug into, and so the reset function
must be called manually.

This mostly had no ill effects because a guest OS will typically
perform an SD reset command as part of its device driver init
sequence. However it does mean that migration won't work, because
it's in sd_reset() that we set up the wpgrps_size field, and
without that the migration struct on reload won't match.

This patchset fixes up the four legacy controllers to call
reset on the SD card device in their controller reset functions.
The first 3 are cc:stable as migration bugfixes.

This fixes https://bugs.launchpad.net/qemu/+bug/1739378

Philippe: this probably clashes slightly with your sdcard
patchsets (and where you've updated devices to the new APIs
it becomes irrelevant), but I think we should apply these
first so we can have a simple patch to backport to the stable
tree.

Notes:
 * OMAP doesn't migrate anyway, so isn't cc:stable
 * for vexpress-a15, you also need "-machine secure=off":
   a config with trustzone emulation enabled doesn't
   successfully migrate (haven't yet debugged why)

thanks
-- PMM

Peter Maydell (4):
  hw/sd/pl181: Reset SD card on controller reset
  hw/sd/milkymist-memcard: Reset SD card on controller reset
  hw/sd/ssi-sd: Reset SD card on controller reset
  hw/sd/omap_mmc: Reset SD card on controller reset

 hw/sd/milkymist-memcard.c |  4 ++++
 hw/sd/omap_mmc.c          | 14 ++++++++++----
 hw/sd/pl181.c             |  4 ++++
 hw/sd/ssi-sd.c            | 24 +++++++++++++++++++++++-
 4 files changed, 41 insertions(+), 5 deletions(-)

-- 
2.7.4

