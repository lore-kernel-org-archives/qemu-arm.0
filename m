Received: by 10.223.134.117 with SMTP id 50csp12820368wrw;
        Thu, 4 Jan 2018 06:41:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBoufPJAaqniZlNsAS+Xo7oD+Dh/0+OoZAwxyxDnHrtRkk1RIN0wbcPTlirPMu21WswK1sIlP
X-Received: by 10.37.9.65 with SMTP id u1mr4359913ybm.64.1515076890763;
        Thu, 04 Jan 2018 06:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515076890; cv=none;
        d=google.com; s=arc-20160816;
        b=svWh6lxnVBtYdf0/WGQjU8xuDgxn5kzQML/CP1Qrv1xdF6AuFtyLRUjYQ5gNBnsOhE
         5Nq17A/oX/USTVxgrRczao9KmRmyLedBSnVqIcTdABewHWQB/DKhwguUaYykz6/X3eCl
         s4Cbuk/yY2byqLJi+Xh9SaTBdQTd2KRt6cHnXpGGCA6ULiWR52T3mN2GNKEZsiiObY+z
         aUxbVhGWvMN5C+73XsG8Mj/9Wu2u5ojUgwxSjfFT/lDpyR5ydawc9CeUBdPp+/ZcZO5f
         IYPrwxTgXHFTFdtN7jxWhZrd7hsyVgZyW9U4EeS+Wife5sC05rRBjmSLCJNgDPwSeYQa
         Pq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=E7jPqJjm7DqYzHu3lff7/yJkGYfEVXUxwAmQ1+K5HkE=;
        b=FWIRyq62SPeQ3zQHLslnPvDrmz+GnPQjSevRIQ050qzhTk5/PLusgIgVvlBaBJJqhP
         mQcjMhlZt4infzNfa3DLktSbx4Iwt/NHPyFEeihzKrhbrSCA8rqjr69Atk5AIK5d4xUP
         H/xKnmUUiTg6ueATRsBg1cPg6sEo5YNRHOP8EU/rcYRoeolH+9XMzYXyzkOpCFQ/kWYM
         uXFSePjrjPrabYdKstTqg3CplZ58/tqvPyQFu4RN6plqD0huxMcGH/67pURqx6dzv+cf
         J4CfbsrTnhj619OaOX0RwgsoGihVjynODFXS2FWxlwlFnjclQH6W7ObRFl6rCCsme1+P
         ccTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LhMqGGI+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si737938ybg.484.2018.01.04.06.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:41:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LhMqGGI+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6i2-0000co-6Y
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:41:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hZ-0000b1-Mq
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hU-0002fk-VC
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:01 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:39078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hU-0002f3-QC; Thu, 04 Jan 2018 09:40:56 -0500
Received: by mail-qk0-x242.google.com with SMTP id c5so2137958qkg.6;
	Thu, 04 Jan 2018 06:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=E7jPqJjm7DqYzHu3lff7/yJkGYfEVXUxwAmQ1+K5HkE=;
	b=LhMqGGI+biTuGyDbkRIFE66YQRX31oHCiF+EFJXInQfZYtolOsUPis0+DBFvr0bCIC
	jvJ7XntAvhao2z3cYcQtbRuZ7tqBKQP5VHdQ+ImJUOYsFx6xCYRDR/gTv5m82MV4F7yb
	qoeVVXse/CIUgrMSYV0Kdck4iCtQBh4crSwv9kArwvC0IAVvyimQukXKFLjoGsEIA6gZ
	Km5mFekQEEDjpLL7KiQOd1K6uaKjR3I20woPYQLqv7799CTZuyQyfMVcMMCNhyZALgbI
	P7lzuf7OlVYUXKqdI7M2RV8yU8md889HwHY08CZlFwbvtRuQGxSi0K2FWincqc5PE8Nj
	FG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=E7jPqJjm7DqYzHu3lff7/yJkGYfEVXUxwAmQ1+K5HkE=;
	b=dy0N/1rVkg3dhSc0zGa4jPgm1w4Up/14106Qgl6NRZ0kmUflN+0OlQMeNTmW0Ek4j8
	+QCYT6bnwrMdHmXieMBdBjkXuev+hT99PDEEU13LXG+KwH3BYmntnDGu3WvKffFA1sbR
	MtRDfnzUt2ECFNiQ+Tj73fU6nbPbIp19qBvkSlzZw8ohHdMGIs+653RmI+syZB0L+Qrp
	di/g9qzlX1htXzb8iY7eOT00erWV5RxjDzC8rgdB+9L7MIjvtNm1R+P8cPnUNGS3phXP
	5S1TkBVRDG51VK6WfF/bQ/tgB8myXXZ+DFek3FvZnh17o3NppMX/AMDmnLazqhhuI7YS
	ff5w==
X-Gm-Message-State: AKGB3mIYzj7BMzevKKr35X/D61Vbfvo6MWZp5Yehht7/ifE69LPLXC3c
	T01ALxumClrAIee+dZ3F+50=
X-Received: by 10.55.159.133 with SMTP id i127mr6593850qke.34.1515076856165;
	Thu, 04 Jan 2018 06:40:56 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.40.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:40:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>, Alexander Graf <agraf@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Thu,  4 Jan 2018 11:40:40 -0300
Message-Id: <20180104144046.30793-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [RFC PATCH 0/6] qom: introduce TypeInfo name aliases
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
Cc: Fam Zheng <famz@redhat.com>, Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YDthMm3DBiza

Hi,

This RFC series is intended to simplify Flattened Device Tree support,
in particular the 'compatible' FDT entry, when Linux names mismatches
QEMU ones, but this is the same device modelled.

Eventually this might help to remove the QDevAlias qdev_alias_table[]
in qdev-monitor.c.

So far this is only a 'proof of concept'.
To see how the qtests perform, I only modified 3 devices, 2 used by the
Xilinx Zynq machines (Cadence), and the e1000 (used by the PXE test).

Regards,

Phil.

Philippe Mathieu-Daudé (6):
  qom: introduce TypeInfo name aliases
  hw/net/e1000: real device name is 'e1000-82540em', 'e1000' is an alias
  hw/char/cadence_uart: add FDT aliases
  arm/xlnx-zynq: use FDT names for the Cadence UART
  hw/net/cadence_gem: add FDT names as alias
  hw/arm/xlnx-zynq: use FDT names for the Cadence GEM

 include/qom/object.h   |  3 +++
 hw/arm/xilinx_zynq.c   |  2 ++
 hw/arm/xlnx-zynqmp.c   |  4 ++--
 hw/char/cadence_uart.c |  7 +++++++
 hw/net/cadence_gem.c   |  6 ++++++
 hw/net/e1000.c         |  5 ++++-
 qom/object.c           | 18 ++++++++++++++++--
 7 files changed, 40 insertions(+), 5 deletions(-)

-- 
2.15.1

