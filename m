Received: by 10.25.159.131 with SMTP id i125csp158129lfe;
        Tue, 6 Dec 2016 20:31:44 -0800 (PST)
X-Received: by 10.55.27.141 with SMTP id m13mr68050731qkh.28.1481085104118;
        Tue, 06 Dec 2016 20:31:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id g67si13501062qkf.319.2016.12.06.20.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Dec 2016 20:31:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cETtP-0005QJ-Ir
	for alex.bennee@linaro.org; Tue, 06 Dec 2016 23:31:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cETtG-0005PI-G6
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 23:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1cETtF-0006c8-Ny
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 23:31:34 -0500
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1cETt9-0006b4-L3; Tue, 06 Dec 2016 23:31:27 -0500
Received: by mail-qk0-f195.google.com with SMTP id h201so46621749qke.3;
	Tue, 06 Dec 2016 20:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3rjG2fDwGmjYJDi4hE6S57bbPSkf01LOBtyLA4cCOao=;
	b=eDDJ4Cf1tJ2/NUEPsyjZFBKbGbqUgKR7IXSTS/rTY/8PsngnEDRW3fofohHlAIO2T9
	LWaggzSqxHuNq5fD1YqjdWIlT5vLZ9l+FovSj0fhTdCObdK9fWfWVNApsQ0N4S1o6odv
	1Hyaa+wJZ5fXbJfnQe0S8BYfb0KvskJXE8XdkX6nKVDPx5eJUdB+GLhBiL92/RJsnjw/
	xTBzDgfl7ex4f89L0RaQHa3mOrWTgWQy5MoYZ5Ou0QXpFdGAWnUJxgoU0xFQCWI5vJPe
	VuWa8zm+vaX5hb4OOrm79uQxpN1/YfwypkPdFBEaLbxf0Z1ngjY2t98pvoMi22QRnNl6
	xWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=3rjG2fDwGmjYJDi4hE6S57bbPSkf01LOBtyLA4cCOao=;
	b=JuZ7qS2PPo+azaB393lPba41p/brgpLiSRITpAZhun25KmAuMlOSg8OgWzM7q92rfE
	WnNrvBL3J/4tfeioVCMRyiB2MnB2QVH3NUGtZFVJA7dO8Eeir3nK7Ic8dSlP4u8qMSqP
	onx3514unGP/psVOOOc79w51lLzXv3GnQPfP2iQZ6pKTK4xem9kELBulcqhz5jVxwbFZ
	hbjxbpj19BdcJ0ywPZQhCxXCdFCjUntRwxSuqBFcl9oeSw+suR+FIABY9ckG5JgQzRLT
	1X8RWKfl4eC4RN68XPT5xhzq3lldWszvzWoT3KSO+/XowWcnhl37jBgSA2zugP80NFFZ
	+gYg==
X-Gm-Message-State: AKaTC01KsQeSQCyV8fkjnQFt2eYYME5D5lcwYi9ZqLERl0ifihTx31ZCzu6fYnig8aZqUA==
X-Received: by 10.55.70.67 with SMTP id t64mr65881528qka.78.1481085026853;
	Tue, 06 Dec 2016 20:30:26 -0800 (PST)
Received: from bigtime.twiddle.net.com
	([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.gmail.com with ESMTPSA id
	i41sm13911947qtc.18.2016.12.06.20.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 20:30:26 -0800 (PST)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue,  6 Dec 2016 20:30:20 -0800
Message-Id: <1481085020-2614-3-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481085020-2614-1-git-send-email-rth@twiddle.net>
References: <1481085020-2614-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.195
Subject: [Qemu-arm] [PATCH 2/2] target-arm: Fix aarch64
 disas_ldst_single_struct
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rWDIvE5CAwjU

We add s->be_data within do_vec_ld/st.  Adding it here means that
we have the wrong bits set in SIZE for a big-endian host, leading
to g_assert_not_reached in write_vec_element and read_vec_element.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target-arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index ef7601b..f673d93 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2830,9 +2830,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, tcg_addr, s->be_data + scale);
+                do_vec_ld(s, rt, index, tcg_addr, scale);
             } else {
-                do_vec_st(s, rt, index, tcg_addr, s->be_data + scale);
+                do_vec_st(s, rt, index, tcg_addr, scale);
             }
         }
         tcg_gen_addi_i64(tcg_addr, tcg_addr, ebytes);
-- 
2.7.4

