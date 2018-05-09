Received: by 10.28.4.212 with SMTP id 203csp66065wme;
        Wed, 9 May 2018 11:12:28 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp//0YUiOks6ouZoVUhPclxlTLlxN0hqRWRxldl0H6O/defmakEbI4gfJkLo9MJzBuDY3ic
X-Received: by 2002:ac8:2e04:: with SMTP id r4-v6mr42065685qta.266.1525889548741;
        Wed, 09 May 2018 11:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525889548; cv=none;
        d=google.com; s=arc-20160816;
        b=TiXJhOo2JtNLrNR4aXBCt0lS0MnPhBCtf7Zry93yvI+9ndk/IsBm6qk/jt6WS0TCtr
         pAS+avCbxgrXpoPhObXutCKNFI4KVUKP8296Ywjq0kbmXdpx7HL1O2Xh2pFBbSBBT36r
         Elil+N9HR7Idj5WYnr8d5k9pCXLx7i4cIYwZukh3+9zhbV8biH9kathblfG9f3mS8Hgf
         F9Wq5bx4VULal50wZdl5S5zYtfhBPZRaXf9vCCCNestjLFH722ZycGD//2RHSpYzfbyE
         opQYOftTV8jwI+PFuNPG07HvvaVvlpywPuZTRew+3SxbgdmZmj9NlwDu5fc3e3PocJTJ
         ykDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xOwSIH2j9Catn/Erb0X0rVdV8iOEx2AqnZ6acvM/W4Q=;
        b=OEEuKMUyZEFMHk+C/uZIFglioDCOEj2zhQO1TXyLyZ3JN2BWqr1nZQKLNiQewj15ii
         10P9zaq8gXRpBWSOtBCcQJFVsM23PQIMXpj42HWnP2wpa00qKteb/dADH4zdaQSPc2tC
         PtgWMMq3UC0k1g8NfnJKKwpmB8uFLfYZs3Tcz12riWRShbgNB9k+9fyS8JIh3+PYpRLC
         i7Efx+G4QGw2tKhmlhFMnKTjGmE/FR7f1rny5lRWp4ojy8FSEJhpapn0Xx+dQdlLuEP8
         9+R2cKb905AbSpsV1RCZeaESVX+PxUK0ALQPifaFQ03uT0cov5sr+sJqqqFFxcMOs8Zn
         kUQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmsFtRsD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17-v6si16621629qvl.117.2018.05.09.11.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jmsFtRsD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58227 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTZk-0006Om-4o
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJN-0005Cu-5E
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJK-0005rD-IH
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:32 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:36005)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJK-0005py-5V
	for qemu-devel@nongnu.org; Wed, 09 May 2018 13:55:30 -0400
Received: by mail-pf0-x242.google.com with SMTP id w129so20577734pfd.3
	for <qemu-devel@nongnu.org>; Wed, 09 May 2018 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xOwSIH2j9Catn/Erb0X0rVdV8iOEx2AqnZ6acvM/W4Q=;
	b=jmsFtRsDJ4osZMlS7ZZhq95umXdITwm5HTzkCwDLxd/uxfeRPno7QIBholxd3Qy7mT
	OASFzV8zLArbB/ZIN4B0fzWtUHj347jZlCQexAypZvRHTjWlpXT4WjDM7TpXDV4BCmrL
	XRiK5+5bkly6knVxDHQiVe/dIIzXjVpGv7Vy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xOwSIH2j9Catn/Erb0X0rVdV8iOEx2AqnZ6acvM/W4Q=;
	b=tig8h4xUPzvJ3gPrjtOmk8k9SfVTYM6jZZDuODUjrPDGnbZS8BblDOia5QY5msq1qP
	Vzi6RiReuVkn+m6XNYKZM3UEmfUrxtOhXRZ6LMFmvIUJy/o9R8UNNM0mHO0J+v/iwB05
	2zZ/Lk58fzPf4pK8rNJUvda9Gz8rijIgWTuZedgV+2kOPl7S6nkIN0a2H3DMWYx/WKJB
	cL8royGV47IeDwEBfwZtEPO5hj81RGQ3njkj7lpCwZgnVmSlmFVemJJ6yx+Ob4+U1teL
	LeT5tdulnmbXhnYESD7RTXO4oVc2/yeMZRjOVS3UKHYxlju6t3TWX6LbEgWFuTTUgNA9
	51iw==
X-Gm-Message-State: ALQs6tBGUw1qgXrMJpQRo/RZm4Y1BE1E0U0V6z56WXjKv4Cy8bhAKHR1
	SMddqkmpt27lW1mhPuOkgn+HV7bNevQ=
X-Received: by 2002:a63:6e84:: with SMTP id
	j126-v6mr37088654pgc.310.1525888528793; 
	Wed, 09 May 2018 10:55:28 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:46 -0700
Message-Id: <20180509175458.15642-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PULL 16/28] target/mips: use lookup_and_goto_ptr on
 BS_STOP
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
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U4lF0SQppa1r

From: "Emilio G. Cota" <cota@braap.org>

The TB after BS_STOP is not fixed (e.g. helper_mtc0_hwrena
changes hflags, which ends up changing the TB flags via
cpu_get_tb_cpu_state). This requires a full lookup (i.e.
with flags) via lookup_and_goto_ptr instead of gen_goto_tb,
since the latter only looks at the PC for in-page goto's. Fix it.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index d8e717dacf..69137d0b3f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20343,7 +20343,8 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     } else {
         switch (ctx.bstate) {
         case BS_STOP:
-            gen_goto_tb(&ctx, 0, ctx.pc);
+            gen_save_pc(ctx.pc);
+            tcg_gen_lookup_and_goto_ptr();
             break;
         case BS_NONE:
             save_cpu_state(&ctx, 0);
-- 
2.17.0

