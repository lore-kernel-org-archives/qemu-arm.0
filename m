Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2138162wre;
        Sat, 2 Jun 2018 17:11:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK0AQ9faO5PyfP7jlFWeKtydU8hW5T/dfVK8YSClKF4lOYgQqfAkOUgqbUaHI6s/SENens0
X-Received: by 2002:a0c:d972:: with SMTP id t47-v6mr15453176qvj.128.1527984660469;
        Sat, 02 Jun 2018 17:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984660; cv=none;
        d=google.com; s=arc-20160816;
        b=fWfLz/o+MVFvPFfc1GKImyDCfWYixJiOj/YAH2eOzHfX1gB6uJiJQC4XNwLJesTKrm
         wQYQjEkgI40ALJfoADMUdoc9EN7qLz2oeow8hUpU+8+stCWkyd5Fpv/uTp62M6XLby6B
         NdWO4VnKJYep27cRJ5QjgTTtftMn9b93XatuXeUf89xNSjKH+X9olche/20d90c/X9GU
         JNACRF2cNBR6OWNsOhJr0aLQedvK0IkbckKoZ8QAEBAOgN8fGHf6TGKWtfCtn7jkEaEw
         HqivzwNRiYcDmbcNB3P//UUY7Qp7agY+H/WLRDxjSvxHMosqmSTJPZPkARwQ79Zq/Fgp
         XtuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=lYqORAeBOR60kftxDzsqKcM1RvY4t2/mfmz/HdSEF3U=;
        b=gng2BGPMEK2MuyXuyiIgpWlU7aJsyljW7gADpVoL4uWgzoI2n2bxEE9e4FmiSHYhmR
         qOJLGd1dspOWlTMS5eawtvgKGW6J5vKZ7F+jyfIveKSYG5EojTkk4qtekJJCSZYySvK5
         VhSgcg2VErzykSIWrRmxPPYkNj5FviTz1bVcPWmxFe9mXBnqjsW/A/sS9HAf97sT6lea
         J1falV8q8/PUBI4FWjqmJLwJ2/JJR2+EzdjmIVlWRn/WTS/5shNAlRD1d4BSJr41hMls
         PZWmqVW/NKXCLpAUd85ltV+tPULdvIwgji8spcHM47jnib5baw90UHiB7ackHzJtfDhr
         Uj8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D0Mc8ojj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65-v6si3685725qkq.344.2018.06.02.17.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D0Mc8ojj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGbr-000537-Ug
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:10:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZc-0003oP-9f
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZZ-0002r2-46
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:40 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:46174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZY-0002qp-Vy; Sat, 02 Jun 2018 20:08:37 -0400
Received: by mail-qk0-x241.google.com with SMTP id k86-v6so22643594qkh.13;
	Sat, 02 Jun 2018 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lYqORAeBOR60kftxDzsqKcM1RvY4t2/mfmz/HdSEF3U=;
	b=D0Mc8ojjtSfaNlUEHxutXngGPJPZHBZPax1vWrIQvLj1kfzJOsIYJmtOgWfryaSQ6C
	hFWmCkDfDVGxcpfRujM452AOeMY3fInBvIJQStN4eFj7YJFB0D1cRSarsK1U7Qgxj5Fr
	q1QnkHyCeqlDBN+5DNCN5SdwcZ+jVEh6JHvzzHuuGxlbU014+qwIUXaEAMHArQEh9XFt
	FV3DA096AD9G9UVVd0KNs2TwaJAKPoD+ljrIrZFw5grLxsnbRuw9WKFWprabfa7iRWjo
	1Gfk3GI3onS1p1bSzQlpPC5GRLkWZjmNOSo1FVAV+ZI/6kbn5LnNBzuF7BclaJIWNUIP
	Ak5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=lYqORAeBOR60kftxDzsqKcM1RvY4t2/mfmz/HdSEF3U=;
	b=aSQZT1iv2Dp1EhzT/DPSyWI7Rf6unnpycCe5mCHcX/+CY2V7FZirTJT9HQcx4az7xz
	PJf3UiIjd4QgzsIqAuv2XV6ovxbrTsFms4OVyTjpo1z8mTxuk+Eh1i+mxWepzgsbX3D1
	CrYLh+3r/HonIBRRiLVvEB+o6r1VfowSjufKSW8FErZ9BjLlPKgJptgQX1CTNHWNrgNc
	fM1HKl6THZ7HlcCGlnaMzyliG2tYrlAmlTZ4nqO375QG+ixXvpU+wEhaCCRTLQZuAxth
	b73k5mzNXyBSopwfqvU94KU+XSCC/MWkcryu/xYX3bt2psdzpw4MB6o8Y4R5Qy+vha/3
	aKbg==
X-Gm-Message-State: APt69E17lW5/bJXK2qp5rlFP7QrKeeEVGXSl+a5F/jrpckFBoAw5o82I
	ek/xj1YrkM4Lz2AHCbxlMU0=
X-Received: by 2002:a37:9782:: with SMTP id
	z124-v6mr15033539qkd.214.1527984516426; 
	Sat, 02 Jun 2018 17:08:36 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:19 -0300
Message-Id: <20180603000827.30872-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH 0/8] sdcard: cleanup the SD_SPEC version
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paul Brook <paul@codesourcery.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G506mD1b1lbH

Hi,

This series adds a 'spec_version' property to the SD Card device,
to allow to limit some commands to specific spec version range
(some firmwares use this feature to detect which spec version the
card implements).

This restore the SSI/SD support of the Stellaris LM3S6965EVB board,
which allow to stress the SD Card code with a nice integration test
(waiting for another series to get merged to add the Avocado test):

    $ qemu-system-arm -M lm3s6965evb -serial stdio \
      -kernel sd_card.bin -sd sdcard.img

    SD Card Example Program
    Type 'help' for help.

    /> ls
    Open
    listing

    ----A 2012/04/25 17:44        12  README.TXT

       1 File(s),        12 bytes total
       0 Dir(s),      61182K bytes free

    /> cat README.TXT
    Hello World

See:
http://lists.nongnu.org/archive/html/qemu-devel/2012-04/msg03790.html
http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg00353.html

Regards,

Phil.

Philippe Mathieu-Daudé (8):
  sdcard: Update the Configuration Register (SCR) to Spec Version 1.10
  sdcard: Allow commands valid in SPI mode
  sdcard: Add a 'spec_version' property
  sdcard: Set Spec v2.00 as default
  hw/sd/ssi-sd: Force cards connected in SPI mode to use Spec v1.10
  sdcard: Disable SEND_IF_COND (CMD8) for Spec v1
  sdcard: Reflect when the Spec v3 is supported in the Config Register (SCR)
  sdcard: Disable CMD19/CMD23 for Spec v2

 include/hw/sd/sd.h |  6 ++++++
 hw/sd/sd.c         | 47 +++++++++++++++++++++++++++++-----------------
 hw/sd/ssi-sd.c     |  2 ++
 3 files changed, 38 insertions(+), 17 deletions(-)

-- 
2.17.1

