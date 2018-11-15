Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7086512wrw;
        Thu, 15 Nov 2018 06:43:03 -0800 (PST)
X-Google-Smtp-Source: AJdET5e0MNqtGmpombZDeJytSJs/zeSgAn4hCjsZSy60VY5zvTTwrlcy9ifaUDtJX3adgZH/bk3U
X-Received: by 2002:a37:9cd4:: with SMTP id f203mr6304395qke.155.1542292983255;
        Thu, 15 Nov 2018 06:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542292983; cv=none;
        d=google.com; s=arc-20160816;
        b=Ykppu071uZy60iyg+M2ERRVHl9xryCZIxFO9U2nwQR4YqZq+aPRbbUlZ7eyVJn4PU2
         ZfRVRYNmajtQkyVX3JCIGbZ1XLwa5+EbzagM5h/sixIUzSAySVcyTixpV/4zdhXt9Kmv
         UgMuhwQEG2duhOp+SWjYQ3Db6OaNxC1PLvVjjlRIoI7P/eJ5nKSvqbcwbcnolN2JSF95
         e+F4XvFIvit+OTRI07b8Fg6v7oCRXiu8SR4+aLnfHvH+fq4YS9CgAomgkb5DylxAR0Vb
         p3WO5D/s5rQQkSzcOE1RGvRzFEv+Ni2qOxAv3J3AABfLuMs1HhzBNxgrozeP73S57vpO
         T4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=uE6euOpFyxjm+43erCfjMnsjSwMWvWM0xp/0PGeHwi8=;
        b=mYyX1trfxjUFsJEO0ThMidaIyY4qoPOmgU5pFQaMZLtfq8Ud5Zz5Y812JJeeIvj+nl
         BHaeLDiMJe4gHvSYVhX27H5Lul0+//gEdwY8gENQNP+dgcosNAbvK6NYnCad2lcvbe1/
         1abeSfDt6CwPE5KqKHDUCuNK1bqyY80mT9YtHMFzgovKmFq4G2eTLjSagdKVR9+wFAGj
         Q3n9wX5D+50+78A6u81UwMatPD351b3rZZWmhbe2aIvP7FY/zsu7KjMORBFW+9lM16e9
         8kqoNXNsymTz1lAOEoJi+yk2pBT2YbYUD+7gNn//xsGYYQkBnR2gcAJKB9XaLMgEYUco
         lhDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si3069829qvj.128.2018.11.15.06.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:43:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNIrG-00030N-G3
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:43:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gNIkK-0005TP-V7
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gNIkK-0005ug-9I
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:35:52 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gNIkK-0005m2-2d; Thu, 15 Nov 2018 09:35:52 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gNIk6-0001Wd-LC; Thu, 15 Nov 2018 14:35:38 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 14:35:33 +0000
Message-Id: <20181115143535.5885-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.1 0/2] hw/block/onenand: fix out-of-bounds
 read
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
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3aWn7ObiIAKV

An off-by-one error in a switch case in onenand_read() allowed
a misbehaving guest to read off the end of a block of memory.
This bug was revealed now that QEMU supports execution from
device memory: if started with no guest image loaded,
"qemu-system-arm -M n800" will now try to execute by reading
from this device's registers until it gets to the offset
triggering the segfault. Previously it would have run into
the "can't execute from device memory" assert first.

As a followup, patch 2 fixes some reporting so that we don't
trigger a hw_error() for reads of unimplemented registers.
With the two patches, execution now successfully results in
QEMU emulating the guest being off in the weeds...
    
NB: the onenand device is used only by the "n800" and "n810"
machines, which are usable only with TCG, not KVM, so the
segfault is not a security issue.

thanks
-- PMM

Peter Maydell (2):
  hw/block/onenand: Fix off-by-one error allowing out-of-bounds read
  hw/block/onenand: use qemu_log_mask() for reporting

 hw/block/onenand.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.19.1

