Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4987357wrm;
        Mon, 21 Oct 2019 12:13:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuxVeg0nq4L+VrLMzlo6AVW4Tfr8a0KN/HHycxo5wqNSkUox1QTEOHYjyuLX/S4GyDivV9
X-Received: by 2002:ad4:5004:: with SMTP id s4mr4620109qvo.87.1571685228997;
        Mon, 21 Oct 2019 12:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571685228; cv=none;
        d=google.com; s=arc-20160816;
        b=c+JqhLF6yCDtN88FhuOSDisT9Q4jL39ra6J3qsU9YiMdIGrga9ZV42D+ob5Wor11L2
         icZBZZ6l28/xmOpuMj1IEvMrDQCl9qVLRRK/s8x1IHYoqY7ImuzNHWojIWsv8Km7kGUp
         +pq/8JftiQg4fYwJB70Z2cGwD7njcOyb9yFhOhGWlL40guQ86aNeIbpCqZ60eeCSzPA9
         PRNSGFRQNL82F019wpwg5sw2Kj9uqodiNupx16LXNlSmZkl33/7aQDWqu4sAGjZuMM7u
         XIIZxx7FRdQf0x+W4QyYgAZCzZkuG4L7ABlvcfnIfW+wLTfrMUx3GdjDtiYjD5GY9kPk
         DahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pG+G68WgVMUlBSMG+FIA/vBrrchUsd+YdC6zcPuCWtA=;
        b=rP4WpYWBD+wFt1cUcbrrY7t4Xv1sGztV2Zw7ZSsSpKR3F6o73iBzoAnAmiPXb7eFGs
         9JiOBS3N2cfLy+qP8p21nsRdohyV29W9U0SGstDCrGIqX+4uFGwo2yAhgnIRjOpRMPkJ
         XDkt9HRlzLkIGS2dLZr+SWa59wPpyJpzgh+ZutRaY4sSk6X28oV9bIshgM9kvoG/77eP
         g+5rjpBEv6qXHEM2aDqiGdm3uzPSrOWunSsu3q34b1dX3EZyCPrrGpH6uKZZme2s2+XM
         xPl4AF0BUCYZRoswNXE2IUVOlyubFNZ0Cpd2Ak8iB0uTbgR19kqk9yU9lSJZgzezW5iP
         4eXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fJzDAezY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si10177777qkf.261.2019.10.21.12.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 12:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fJzDAezY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMd7k-00029J-3t
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 15:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1k-0004Gh-Fq
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1j-00021Z-Fd
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27764
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1j-000216-C5
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pG+G68WgVMUlBSMG+FIA/vBrrchUsd+YdC6zcPuCWtA=;
 b=fJzDAezYZZRwyImsdZtzyalnSstsSmA2kw802laYSBoV9oR+Swr431bbfqjkL84Y1i7JeI
 rux54uUfGfdQdpEcpPH7LAhftUxdFSJNLarzHdDt5UQcLAC2LK2CHh8koWYBxokDsp0sR9
 A2FQz6lPtbtI1jmtG7elQl9zyrkxZaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-nHKXP7i_MtutRMk2-T7ZUw-1; Mon, 21 Oct 2019 15:07:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C51647B;
 Mon, 21 Oct 2019 19:07:29 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4981171C6;
 Mon, 21 Oct 2019 19:07:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/6] hw/arm/digic4: Inline digic4_board_setup_ram() function
Date: Mon, 21 Oct 2019 21:06:53 +0200
Message-Id: <20191021190653.9511-7-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
References: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: nHKXP7i_MtutRMk2-T7ZUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4ZD8Y5oYb6O

Having the RAM creation code in a separate function is not
very helpful. Move this code directly inside the board_init()
function, this will later allow the board to have the QOM
ownership of the RAM.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/digic_boards.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 304e4d1a29..ef3fc2b6a5 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -53,12 +53,6 @@ typedef struct DigicBoard {
     const char *rom1_def_filename;
 } DigicBoard;
=20
-static void digic4_board_setup_ram(DigicBoardState *s, hwaddr ram_size)
-{
-    memory_region_allocate_system_memory(&s->ram, NULL, "ram", ram_size);
-    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
-}
-
 static void digic4_board_init(DigicBoard *board)
 {
     Error *err =3D NULL;
@@ -72,7 +66,8 @@ static void digic4_board_init(DigicBoard *board)
         exit(1);
     }
=20
-    digic4_board_setup_ram(s, board->ram_size);
+    memory_region_allocate_system_memory(&s->ram, NULL, "ram", board->ram_=
size);
+    memory_region_add_subregion(get_system_memory(), 0, &s->ram);
=20
     if (board->add_rom0) {
         board->add_rom0(s, DIGIC4_ROM0_BASE, board->rom0_def_filename);
--=20
2.21.0

