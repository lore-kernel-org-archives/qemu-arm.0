Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp562423njc;
        Mon, 24 Jun 2024 18:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX04RRQdhli/f/XracJ3RU7cZxSYxiyo1nt1RRy3NvRM12wkvWQRwzF6sV2fIYKif+p/fFSaBlDCSrobRSI/PA3m+klEkS3
X-Google-Smtp-Source: AGHT+IHTNTXcbUxsFEVAEXSkXI58bU6PZ6A3qRRlmgqMs1L8EiL1UZOja5hQehgGo5XfEw1bLrM6
X-Received: by 2002:a05:620a:4252:b0:79b:ea85:9f9f with SMTP id af79cd13be357-79bea85a042mr651162185a.2.1719280309098;
        Mon, 24 Jun 2024 18:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719280309; cv=none;
        d=google.com; s=arc-20160816;
        b=baKdKg8qLhzJtMCVM/uKThry/FSoC8Tmz3rLuD93qp6HH265ng+q7RbjTn2h6OVPJI
         fML2pxYU1PWO6gg1pi1bSPHG7muuiGNjzca4fol+bMkQnXZGp3S3Ymlt4+l2lgFsEUpQ
         xm+LmnAciuklbOqYQpfjFkVdofC9hxMW6eTRny+q9ZFabOJm7Tu6uK6ihlOAm+pHatQd
         Uv7kieBWKF7Ob7wytwiP67OVUMClbYBQzzxX84y85ZVTpqVsy3969vW+qM+sH3gOXu9A
         fwv09kzmqOWWoPC76niWDAw/Tp645AgJbX5dl0UKBCuEF+QUMbxBv0Il3f7SXoc/l5av
         RE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=556UwNOCEDY73+YmleRjNcS5ZeHYfcHgGnyyh9gKb5o=;
        fh=HrGJUFnZHz7hWxi+LYnD6UY3P1PFtgkIHq6jddVMKYw=;
        b=Tc8lAN5tVqLJiUb2GdP9iLdQ6yIYdVDc0C+QQA6Z7IqpvrpEe8n6z/knuHz9zyn0Im
         ApRRIDDLNmXVhtPpTRxlISDc/0TLN55NUtv8qnT9kbidbiTpAX+LLUkwuASTnCC9luzT
         oBaqviMgPG29spa6HFeK8+IDo+0eTJCHeQ26HCAtAnOtIt2t3uCdoM/VskQy2OW7lbz7
         D94PrYit0/EHMAX2WTr1xFTrWIIbZVC+kUtBJQKIoYp7PqCYUeWi2FoVbiRMwXVghgsQ
         8MiXoNVNhAy+7IBoRYQfK0Fo3cLQ4+IANFR4k7hwTnUNwCA2dHDIyrOohpktIvIqbN3d
         /EoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce914698si985973285a.329.2024.06.24.18.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 18:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sLvKZ-0001rQ-VP; Mon, 24 Jun 2024 21:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sLvKY-0001qN-6z; Mon, 24 Jun 2024 21:50:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sLvKV-000106-RR; Mon, 24 Jun 2024 21:50:45 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 25 Jun
 2024 09:50:30 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 Jun
 2024 09:50:32 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Jun 2024 09:50:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 2/2] aspeed/sdmc: Remove extra R_MAIN_STATUS case
Date: Tue, 25 Jun 2024 09:50:28 +0800
Message-ID: <20240625015028.1382059-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
References: <20240625015028.1382059-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NCLePAxgSjnz

Coverity reports that the newly added 'case R_MAIN_STATUS' is DEADCODE
because it can not be reached. This is because R_MAIN_STATUS is handled
before in the "Unprotected registers" switch statement. Remove it.

Fixes: Coverity CID 1547112
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
[ clg: Rewrote commit log ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_sdmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 93e2e29ead..94eed9264d 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -589,7 +589,6 @@ static void aspeed_2700_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     case R_INT_STATUS:
     case R_INT_CLEAR:
     case R_INT_MASK:
-    case R_MAIN_STATUS:
     case R_ERR_STATUS:
     case R_ECC_FAIL_STATUS:
     case R_ECC_FAIL_ADDR:
-- 
2.25.1

