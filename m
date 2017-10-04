Received: by 10.223.197.9 with SMTP id q9csp5931586wrf;
        Wed, 4 Oct 2017 11:44:02 -0700 (PDT)
X-Received: by 10.237.61.49 with SMTP id g46mr15228502qtf.239.1507142642166;
        Wed, 04 Oct 2017 11:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142642; cv=none;
        d=google.com; s=arc-20160816;
        b=JJtYsANABrs1SgSGmNxLh24yRcAwesn0bSelWPAwVsd6wXZ5LgSpEWOOhuakp+g9zP
         sbsV2K1qrMZRLQVjliQx3z1Id2v0+TzbvDc43BsU7A0c+MP68utVaLJ01uaQ0MlVDxvI
         b2mjbsdhEBhjzxPQVCZ68JFfnSXhor0SGubJ4np1+OJmSJE5pXe/wzP3TTC0YjlZy7d9
         7ILtwLvDn+3JyzdnZiNQ8P/kPqurrh6WPjrxvuQ24Gp3O4mxIEIWQ4rOWOlO6DAAuSQs
         RnmTLZjcQrqzleUCyFc0yY464nwxKPSuheQDNu3RMosesUEY7AkaHcAg+0f0QpkIOCFK
         Rw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=i7Fh4Se9dhiIADl4uo+noxozSwwCiMMdLHubKWZEqJM=;
        b=xg1NUKEyRcN3stuEJJRVdsd22rfc6Wmvcdh9VBEQ6+r+kHrleMbtNMSpIkPOsFVSpF
         oTsiK2SvqqqAAaLVwgpbyh0Ho3J5Tfmi3t6j9+baQzXxC1xMJ3Mx4MWJgzuwZsaGiRo4
         0XM+ch4tmSVBISf2l4aWe0PkEik1KdvpTKyGgyxr6mk9ZjaJaQvY76c+XmotZCWT/IMq
         VxVWofRpVj8Fs+9/5JLfBNNXRCMt4ZLZ+mz0LtFjs7SY0icFWk728lFEmJYWdFcp6rxD
         +en/JAo+Li6eDDv/5ZbvrXPtTpRJtEQdd5PYRR4t0aPz9SAOZvaw/6/9IRgAT8Cb9KaK
         uw0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DgGDMw5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si5407280qkg.64.2017.10.04.11.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DgGDMw5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzoeH-0008Lx-JI
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:44:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodo-00088l-PS
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodo-0002YX-8G
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:32 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:44155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodo-0002Y3-3q
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:32 -0400
Received: by mail-qt0-x22e.google.com with SMTP id v28so12226461qtv.1
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i7Fh4Se9dhiIADl4uo+noxozSwwCiMMdLHubKWZEqJM=;
	b=DgGDMw5c3G0cm5BvurzIH6nzZS4GV6+pVnNdE2G5MOWPWuGkwSY7HItaP8kM5Wa132
	jlxKXZJ3ztu0Nzr+TuZRDRloIGom/1ElmsnAvkMsx2p0lyDoUkcqH72AV4DUrO3Of8A/
	JMmmQ8h0N38JvqyIuL5WAST3K5ipQxKCscj3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i7Fh4Se9dhiIADl4uo+noxozSwwCiMMdLHubKWZEqJM=;
	b=CM3+KM327+JZXx9Om/hGc/tHCEU0X2B6MUBTXbpPX+orrZe/2xMBSslN48tG9qhq5z
	l9u/8r//CX848Aekne1MG/gNcIDaGKfj1pHneY6X04p4ZZvg2bf4z4wMQYikaoDMCO5M
	3FncevbvchRW4qtc0px/CFXdfC7q9uGXHczrTATAdOd6jHWkytDku5MJLwGfdATaP+Nu
	vW/cKCtNp+evFicYomv83BO+QPpisH56J7zLRCGeIODtWb7ItReDxii91QgzI7v/x7MX
	zMmNTGbL7sZtsYyECbn9x3A+fuhMywCfj/4nL9aMwoMoT/fw1hB1S5zJZmnGEwkWKYAE
	YjgA==
X-Gm-Message-State: AMCzsaU4Wb6HSWUeRenAPKXqYibq0UvFtVL+rg9Sj+Al7k2dMUHz+Cax
	REDhGVnIkC6wM7TyytpqCjAD4A==
X-Google-Smtp-Source: AOwi7QCjK3NnwXwGEveZYyIahYPZdxmXIGlHJ+DUs4Pjnx42//F73W+MVseoRPoPZJsddc7WWYlAzw==
X-Received: by 10.37.50.149 with SMTP id y143mr5024186yby.240.1507142611489;
	Wed, 04 Oct 2017 11:43:31 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:14 -0400
Message-Id: <20171004184325.24157-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: [Qemu-arm] [PATCH v1 01/12] HACK: use objdump disas
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
X-TUID: WQ0Oe8fhXO4W

---
 disas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas.c b/disas.c
index d6a1eb9c8e..69069a85ca 100644
--- a/disas.c
+++ b/disas.c
@@ -231,7 +231,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ulong code,
     s.info.disassembler_options = (char *)"any";
     s.info.print_insn = print_insn_ppc;
 #endif
-    if (s.info.print_insn == NULL) {
+    if (1 || s.info.print_insn == NULL) {
         s.info.print_insn = print_insn_od_target;
     }
 
-- 
2.13.6

