Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3216684wrg;
        Mon, 13 May 2019 12:58:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3fmlyz0dHMi1jlpUsLCfdVFmaxo4cnpH79uUIPdQNIkMaLBxblgg9zmk+86skad+OBPZc
X-Received: by 2002:a50:a951:: with SMTP id m17mr30494143edc.79.1557777491649;
        Mon, 13 May 2019 12:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557777491; cv=none;
        d=google.com; s=arc-20160816;
        b=PaXVjt0g2VIdyBrMg8IWOGYzXmpFWY15ionyUQZAnkyvs78GyhCXSXxTcBQshmj4oO
         dLL8wEMR+AyDiEupV/I3ECLDG3pOUrO0z+MN//YOfNyW3Sh84tRBvt/KYvs+ikTHMLoG
         S1Ss6K1PnVrE/PAKE92EJNi438I09ByCRMcyeXU/UkuAwLVy9kNwYKRJdzf2tVm+M6dI
         3yE7UxSrS/5T8voxAGG3IUgnxiaPEOFdJelVllSu13ymH4Z+67a8jNwGf1bpoR3UEcOl
         UARJeYFIXB6uFRnuDPLyK0CTPPL2tyvWTo+d2XvOkTAZ+E6TTjI1UcCPh3baG8Ow9lMG
         MRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=JFArtSKxX6WxWKnDEeGgk0yfPgX6AyEApuoe0fykhQU=;
        b=BpzwAznbD5J5o1fvzP2180vo9ZUSWshS5D6uUzauYhY+RQqctz2W0oIhtVy0HX+tCr
         WxinGJ2zh8RPH39rS6qb4AbVvVKzAkIe67B7e85WxNsVpXaHPYkSwkYT1YL1SuKPKiM9
         ZlWwDAn9OsZe9h/45sEsnHx7RgmjOy5o5ZPvKw6Q/btuPCCR3obLX3DDanS6B67rDoqK
         rui3f3YiehmgPFvhlWA+ckj7OqFmG3GSltVC9zaOc/FJbFhqSj3x1dPk0R5oo970exuA
         JQNFJWBltcsNO5Ly++EoHPKQgbZeZFtYAmytm3Am1zHZ6Sh5hNifBI1RjrSp5IWx8mv/
         Fx9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@fintelia.io header.s=pic header.b=iCGNNjFG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a47si6626602edc.171.2019.05.13.12.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 12:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@fintelia.io header.s=pic header.b=iCGNNjFG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQH5O-00041A-Pf
	for alex.bennee@linaro.org; Mon, 13 May 2019 15:58:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38969)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hQH43-0002pf-Ql
	for qemu-devel@nongnu.org; Mon, 13 May 2019 15:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hQGs2-0006DQ-29
	for qemu-devel@nongnu.org; Mon, 13 May 2019 15:44:23 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:35386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+cf442f.9b4e76-qemu-devel=nongnu.org@fintelia.io>)
	id 1hQGs1-0006BQ-ON
	for qemu-devel@nongnu.org; Mon, 13 May 2019 15:44:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1557776656; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
	Date: Subject: Cc: To: From: Sender;
	bh=JFArtSKxX6WxWKnDEeGgk0yfPgX6AyEApuoe0fykhQU=;
	b=iCGNNjFGvqSOur+4PA2HWAJUMHkGuaRttAPFSZPY5A8mjB1OMTgKa5Grbqz64TkkIMkdYdx+
	8GG5FOaioRdFsLPXqcSg3cs+FWtSjT7NTYXhHcTgdeZ+f8Q3xtz0vdO5XVc59gnCMF0rAKW2
	4upQ7YL4DB/QjGTygxu16BTPlwFQxZSepy6DteOD7rqZ/3UORVKri/9/y7gXaP0aLSUSfCPs
	l612nxvNcAcKQfSKxKD2CADCdKWNVCE+syO9F7Cg5PEJkH1tScV1uPwa1KVurwkRShoeSa9i
	NgzXLuNitL963+hZQt0z+3dFrAo4WF2I0WAOAS5PFn1MLSyEB+vX4w==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJlMGM5NSIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cd9c90e.7f66b0793030-smtp-out-n03;
	Mon, 13 May 2019 19:44:14 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 15:43:28 -0400
Message-Id: <20190513194328.11045-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-devel] [PATCH] cadence_gem: Don't define GEM_INT_Q1_MASK twice
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Behrens <jonathan@fintelia.io>, Jason Wang <jasowang@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Jonathan Behrens <fintelia@gmail.com>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tse0I96LHWqg

Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
---
 hw/net/cadence_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7f63411430..37cb8a4e5c 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -146,7 +146,6 @@
 #define GEM_DESCONF7      (0x00000298/4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
-#define GEM_INT_Q1_MASK                 (0x00000640 / 4)
 
 #define GEM_TRANSMIT_Q1_PTR             (0x00000440 / 4)
 #define GEM_TRANSMIT_Q7_PTR             (GEM_TRANSMIT_Q1_PTR + 6)
-- 
2.20.1
