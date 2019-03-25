Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3720223wrx;
        Mon, 25 Mar 2019 04:10:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQWy1PcKKV+y149RcNr6PPENlhAAuiY9O1Y+rPwu4V3g+aptvQLynDaDezpltxXtI34rLD
X-Received: by 2002:a25:d882:: with SMTP id p124mr20194684ybg.72.1553512248303;
        Mon, 25 Mar 2019 04:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553512248; cv=none;
        d=google.com; s=arc-20160816;
        b=xLXbwRQ8P69iL6w3nV1L1zG+Cxln/FRZTb+TQq96HGyMiHf9MH3BSo5Ef/DLGPOaSO
         ORIRgTAV1PblvV3SJ0zOl3ZVY1KuZRPTNHOEN8QsYYv3tU/WukT05i04Nxs4OvVBzSct
         IkaG/m7xrLNd8OzQzAaBOByDKWl1/bDmwRpukPJvYM8dPFrUxNDiwBaxFM1b4OA0IDn3
         VQiIYsqlh5/2XUiWJf4/XXIW+KYh/7NU6nWeUFM9vcL+ROy5h6fMdijAprIqdqGo3cYT
         gfjBhRHcmwmAf0SUxZxgGjCJfSXANip88f/7pd8DgQ95T6f8SgOgc+QZlCNNZO1/w+lq
         xdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=7wAGmhoCeM6YBemifgdJMgJYmDsBeInNsJBLjsjE2+w=;
        b=nHOOX2ksRhleKUb2f7+nBSJWPr9ABZDUMLlWLwaieK9p/eRGNA7x75CrFbyDK/HQnq
         LTqAalD46X6cNdFtT0GV5uAH7FRCpY0NYNtgvIyAGNJvDomvJQTlLDZrqTtsvu26A+Es
         FnTLc4TsLJL0/XSp0UJnYA5wH/ZVHkZoyxcBO9kaAkOMi531GjzKYZVR/1r1BMvhGTX9
         rf6eeGFOSi0nzE6eV3Tk2yk8JnxlpECfyb9gcKjzpqZtP70BvusKzpjegPgB2GnFA17r
         7Nh6bmzXZPBircVs0v/gEkP/PfQw2osuW/hkoUYQY/7p6E9w0LHpvONUMGEImEjmJKmQ
         qBNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="k/qPQnlk";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FHy3TTYm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FHy3TTYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si9197091ybr.366.2019.03.25.04.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="k/qPQnlk";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FHy3TTYm;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FHy3TTYm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NV9-0003o2-Hh
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:10:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNa-0005QA-6W
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNY-00082v-1R
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:58 -0400
Received: from greensocs.com ([193.104.36.180]:38354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NNU-0007oM-QZ; Mon, 25 Mar 2019 07:02:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E767A7D78A2;
	Mon, 25 Mar 2019 12:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511751;
	bh=rS5NuPH0KWejCxspweaZSHPWSe35AiD/X4xqIKnJC4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k/qPQnlkJ+WSN3Kn+OS3zzZhIGG9OT8z/AF6siM5470/Th7NreyGv0QhMSugEIVZY
	b4kZO4Q9k/njuv3BI7cF9ifT7PN8eiutug1rJBqohXAbt35282CNvpmXFNjY69OLdA
	YAFdaxLHeuHf9FNFvMTgK4QpVJ2i9CpQfSrowqrY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FHy3TTYm;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=FHy3TTYm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AER6rpO7-4eR; Mon, 25 Mar 2019 12:02:30 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 7E6FA7D78BB; Mon, 25 Mar 2019 12:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511749;
	bh=rS5NuPH0KWejCxspweaZSHPWSe35AiD/X4xqIKnJC4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FHy3TTYmUKxF9JwyHjYXRM9a9W4opoCba8Q7JpI957jCmriCcS3S0fTm3jTQqA3SQ
	MJT9HZ6TJlMVKHsbFTHU9lssd1hFwJiQOSwxpPe+14eUpbpxrgCb3tEc8g1JRkYSKd
	iIAETAsXJyqfa3395AKsS4zZkOeC5TCL1TdLkikw=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B43537D788E;
	Mon, 25 Mar 2019 12:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511749;
	bh=rS5NuPH0KWejCxspweaZSHPWSe35AiD/X4xqIKnJC4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FHy3TTYmUKxF9JwyHjYXRM9a9W4opoCba8Q7JpI957jCmriCcS3S0fTm3jTQqA3SQ
	MJT9HZ6TJlMVKHsbFTHU9lssd1hFwJiQOSwxpPe+14eUpbpxrgCb3tEc8g1JRkYSKd
	iIAETAsXJyqfa3395AKsS4zZkOeC5TCL1TdLkikw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:55 +0100
Message-Id: <31208397390bc323ec002cb8a3cb395cbd6fa9b5.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 12/17] Put default sysbus in system reset
 domain
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SqCNDhhsD4JH

Switch from reset handler to Resettable interface.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index cf081d5264..e67f6e6c50 100644
--- a/vl.c
+++ b/vl.c
@@ -4537,7 +4537,7 @@ int main(int argc, char **argv, char **envp)
=20
     /* TODO: once all bus devices are qdevified, this should be done
      * when bus is created by qdev.c */
-    qemu_register_reset(qbus_reset_all_fn, sysbus_get_default());
+    qemu_register_system_reset_domain_object(OBJECT(sysbus_get_default()=
));
     qemu_run_machine_init_done_notifiers();
=20
     if (rom_check_and_register_reset() !=3D 0) {
--=20
2.21.0

