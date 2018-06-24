Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2447328wrq;
        Sat, 23 Jun 2018 21:10:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfweAln5a036mIW8mlEKZmOyz5i5YOwfxfCx2bL49+yPm3CE60GCl766I64MF7uGTG4O/0D
X-Received: by 2002:a37:b4c3:: with SMTP id d186-v6mr6380162qkf.400.1529813448138;
        Sat, 23 Jun 2018 21:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813448; cv=none;
        d=google.com; s=arc-20160816;
        b=IWD73f5pGtScej3FhzM9+t53/yO2vAl/kqSc+vPsU+b2iS3Zn/4bsBt/aUY3/dHLPc
         IaW6mRW8AVS1t2CweFftyiNNyBEOsomR1L4QUuY7zEjeLbvPYY90o5o2KOk9RHFvdUas
         K/OtIFBljaL9R3yQFYZ/dh8i0dyVrgggeZpOkjCAyxSwmcUt4pQmPQx5min6K6hfJvDF
         FBXGRJCXaFc4nxiD9L0UX8zKi2kzMZg9GMCwp3I4v8Bdip3u375jLQgYyl9NPATku43W
         n4Yt1fqaNtr+AYK2CP2EJJ2PT8SkjkZ+G0MI9tPCwxgVVkUBNifJcnHA9eDcIaXlpAlH
         2HFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TIXNmx8bHFDGQeXkU9pywFHui8WZcwIyPpPA/o4klWw=;
        b=PVhg2bUpyWem21wyTKZ6+J+cNBTsNhFLv6V9oHaMrKPx0EaMR9odQ2lI9JQ4RMpKfN
         zXL7YEYFxCbhJ5H6X4wTUpWkHlYuPUIduNTB9Oa1EV0rjNXjEm0VdwyUWjL0kgBNCzm2
         1i9UJ37pRlrBoAfXdf+ov2o0DGtWPWJROXB0Yfo/OXcfuv9Hteo93g8J23xdGiRAeBlE
         kmlL3dDYdWB+gnNa8BMQ+TC95et42JMpRS3SAxTtdrdxkN4/z/hs7vOcadacZXv4rDBT
         3LbxYpeeaRhM7zTeuGQ7gtKyPCNZMvDS1gRINnqmK+opku/KMuiRz35f1Vg2gKkbiLlW
         KQaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lfjZBlJy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j12-v6si1773284qvk.13.2018.06.23.21.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lfjZBlJy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwMR-0006tY-L3
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:10:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIf-000463-LG
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIe-0004Bt-PU
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:06:53 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:34044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIe-0004B4-KB; Sun, 24 Jun 2018 00:06:52 -0400
Received: by mail-qt0-x236.google.com with SMTP id b20-v6so116064qtp.1;
	Sat, 23 Jun 2018 21:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TIXNmx8bHFDGQeXkU9pywFHui8WZcwIyPpPA/o4klWw=;
	b=lfjZBlJybsLxH5E245eMIN8lxm+xpXOCXptjC+VJ7a06Hi/furEaEXwcRdKLIq/HgD
	y5pT6KJJmfCPGIB67s5LRmE/qHTrQZQXFveHy3KPdzL19wUELUtlLpBimVvzmqeqRmHM
	z037QUs0vl9yCSUe5XNjhD/Fi6ty6FhrkjQqEkkxo4S7ekKyKVaEIWzCBQJJcA2XuFYn
	Rg2+yPLrrkZN+pEOcsP3cD9aGGiDM7PJKeDaUrZJyRVcoxIJyQmXvO6dQykbOihSqq6D
	15+pBpAd36QDxm/dGTn3RzgofEnJt+rBPz63vUGS2wNkYK9uygT+DV7gcV8PTcqYK39L
	wKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TIXNmx8bHFDGQeXkU9pywFHui8WZcwIyPpPA/o4klWw=;
	b=mOA2/mdh5ipbVKihqMonZW3bUVTAXYkn0wYkOZTUQU62i0FNYyrOfxrnTuS1aA3shQ
	Wc9zKbCD4TR8mQI3/6/oOiB7sC/pnO2zoHumghli0vjlOIs/F0ANYwavOXMaOUb8PrwQ
	opAM792hssBcL27FQ3o30QFVaVdpelsGefSmryk8CA3fMHyIl4/+P86D143kqeZicFum
	srlhi44f2EaQDMLLdh4tEhbYnMdwso+O5pJfAwlSpXtvikytqpTFxRX1QRhBRfdTSQSa
	VD+e3PGpDPuYQp/Y9o0VyLQCf4lC3gFs+EQnUiXbW+oK/ZTwZ9GYqR4Ub5qvVpCcOBPy
	G8Dw==
X-Gm-Message-State: APt69E1RKGTWSlvsIc0bQ7iWPy9ZY+40zDgOaku5TbTPpZLHM1xFrrSF
	yCbtxpOhkDXzgw2lGzn0fWo=
X-Received: by 2002:aed:3bab:: with SMTP id
	r40-v6mr6466419qte.96.1529813212102; 
	Sat, 23 Jun 2018 21:06:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:03 -0300
Message-Id: <20180624040609.17572-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-devel] [PATCH v3 10/16] hw/arm/stellaris: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wcb6n3wVkVyF

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/stellaris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a8f1f6a912..d06e366402 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -560,7 +560,7 @@ static void ssys_write(void *opaque, hwaddr offset,
     case 0x040: /* SRCR0 */
     case 0x044: /* SRCR1 */
     case 0x048: /* SRCR2 */
-        fprintf(stderr, "Peripheral reset not implemented\n");
+        qemu_log_mask(LOG_UNIMP, "Peripheral reset not implemented\n");
         break;
     case 0x054: /* IMC */
         s->int_mask = value & 0x7f;
-- 
2.18.0

