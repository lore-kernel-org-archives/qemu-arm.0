Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368206ejc;
        Sat, 9 Mar 2024 11:24:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1GyjzmFVBN4eR6DCqByAICDur4gsiAcodzQeD3e/K4sy5Oj8WaA4Dai3/SoX3qykGC6R26HaD4BYlcCWDiB84qXn9ewnj
X-Google-Smtp-Source: AGHT+IEhqwRf5h8TYAjxAMFyeBN895Wbsc3AcO2g4s9VmnEeHoPFcwJg5PpGDsZEMOIRlqceQSKS
X-Received: by 2002:a0c:dd89:0:b0:690:ad9f:e3dd with SMTP id v9-20020a0cdd89000000b00690ad9fe3ddmr2245268qvk.63.1710012273284;
        Sat, 09 Mar 2024 11:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012273; cv=none;
        d=google.com; s=arc-20160816;
        b=WZ60UVCtgQqdfILtd2vSJBHKjC/bgz3aRuIthK5SIoGtRAp6AD7RNnZPHSElBCg0xP
         z0OXtY6WC9nchbor8jzEi/CnuDnu5t5qdQwsUZdz9r/R3SRckIRGRON7pZqp1U7didDK
         2BFxpXaVtaUwl76cuiATPEcrZ++XfCvuhS9aNMG0KceZHZdWU1XCRPyQfmvlx1QEOvmv
         5DGztA6VcpFnCtReMzvM/xSlGERCLp8IBJJgEpKBk1so4YTou5C3f2vQJEu0POgDr+no
         BGmrzRNi79c11YIQPHpTfw7DN1dDsZt5z/wVkd8pcwJShJAPY5a/NkqBg/NsBVppgkSw
         15Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=ZjbUGqOjGDJ48BD/FCrBKjFot720kk8N7cpG04DHyuw=;
        fh=0ioWIRnjs5rg0WZYiDuFwoe5Yy0bAPrqy5mLcsmd3+U=;
        b=P/X7rCRlgypxyrlo2c3TBLGu2B8bz96x8WvNtiEVccolVMOptrwNb4MRHVuOppRBs4
         culg/SssW2Cdr4sA0xAFqCVZh3ckEf6Y7oi5lYjbMvDiYCgEGbw0I8qeKAOfcRxBWpxf
         Rc0dhiLa9tsLOBCoTh3QKyqm+vckI0mg9a1sroG3mv3mwR4Z/G+CtbWegu25NTbw0JoB
         ebJBjI3x74YVmglg4SZBNq27LPkINip+Wg8oJDIWAIZ+DoaPBCQZ3YQIjlo8CbbMSfpC
         cnjstndpVJWDxWMYtAvW/L06xTrdu+7ZImh7z5RghojY41TMuw0OBmzZp7LqW4JRlJ08
         DJtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbT2qHxT;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id oo25-20020a056214451900b0068fc2ac7f59si2154552qvb.462.2024.03.09.11.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:24:33 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kbT2qHxT;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.690981.1076765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2IP-0005Ni-Ts; Sat, 09 Mar 2024 19:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690981.1076765; Sat, 09 Mar 2024 19:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2IP-0005NR-Px; Sat, 09 Mar 2024 19:23:49 +0000
Received: by outflank-mailman (input) for mailman id 690981;
 Sat, 09 Mar 2024 19:23:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2IO-0000Lp-Lv
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d0d55fe-de4a-11ee-a1ee-f123f15fe8a2;
 Sat, 09 Mar 2024 20:23:47 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so3903295a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:47 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 lt10-20020a170906fa8a00b00a45ab830eabsm1179687ejb.51.2024.03.09.11.23.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8d0d55fe-de4a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012226; x=1710617026; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjbUGqOjGDJ48BD/FCrBKjFot720kk8N7cpG04DHyuw=;
        b=kbT2qHxTeQyHAtrzgnXBb0Yhs4phmhmYBxX5jYmdvYUaR60c1rt75vUgqpCJ49yDB2
         r8ZdfOkw1AJ5k+DwIW//Pw6avF7aqrgPQBOgQmDjoTsovPYDggJUnYORbDwI3O1aO2eK
         Ye0B33LvKVDWxjklWkBiR/Ruc3cUcRPtNeqol3Jq4UWPdsDffKGl/lBOqBi2kI8rahuE
         ilyC2KTjjzHHyXX4Ix95kb9/7K3K6FK46mHj7RQtghaf+vmNKoBhJ2BjmCHtoS6R+HNn
         +w/MOJwbTubXdJ0mvJFG5l5PFTnwpRl/r8Rd5HSAg2l6m6kkUalTfPsUfdoDMMaQ1RZJ
         WV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012227; x=1710617027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjbUGqOjGDJ48BD/FCrBKjFot720kk8N7cpG04DHyuw=;
        b=FTEFM/SZYEXL2r0657aFGHm8YVA5yo0LPXNnLCJnlkva2TQC64MvynneycL/q1hoTJ
         J/+uT12atWspLmuMIqfrrO5PvGm0YvT6xNukrMqxXSt7JoEvQHU7yZUgo5w555I7kXBa
         5KvZy7UtJ3DKGi9uRBYnRQVW0s7w9xcfW3CXu3Jc8eXfSUgBVHEa+w3pvCEz/PkH7LIR
         8C10/d2LZLelYLMq/1fTpXnMBz7IJApaOPl/z5WTVhv+fmfa1YRTYjuo8i9vpQXI8rvl
         U0mZIg0GpTWF60YDyJy/pzcMWGSEzY4oQCw5scThVEcYhJOSzlR6Vi40ghOCyGn+qTuu
         +O7A==
X-Forwarded-Encrypted: i=1; AJvYcCV0+WSyO0sNv1hlL3cf0/2T6XbQK6yQkBLIDwPyogFd6R1qalyVvm+IP2r5TQ9OBcwDj1/S6EmiJeIHHoiMowRcZOCT+9W5b0PQ4D8H7ao=
X-Gm-Message-State: AOJu0YxnLooYvgbPRIS7IwR6HDgY6JDwN17Un9K2ysbGid10IJszhhjr
	4KsG8m0gnOEBUxumswW72Dnjqps+z2OZzUmBLP3CDRlepguVH9quU6sqQHQSkVudw2N1bZR+an0
	j
X-Received: by 2002:a17:906:b0d0:b0:a44:8c1b:8877 with SMTP id bk16-20020a170906b0d000b00a448c1b8877mr1523044ejb.50.1710012226664;
        Sat, 09 Mar 2024 11:23:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PULL 15/43] hw/char/xen_console: Fix missing ERRP_GUARD() for error_prepend()
Date: Sat,  9 Mar 2024 20:21:42 +0100
Message-ID: <20240309192213.23420-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WDF0LQ/RP+sY

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, passing @errp to error_prepend() requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
...
* - It should not be passed to error_prepend(), error_vprepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.

ERRP_GUARD() could avoid the case when @errp is the pointer of
error_fatal, the user can't see this additional information, because
exit() happens in error_setg earlier than information is added [1].

The xen_console_connect() passes @errp to error_prepend() without
ERRP_GUARD().

There're 2 places will call xen_console_connect():
 - xen_console_realize(): the @errp is from DeviceClass.realize()'s
			  parameter.
 - xen_console_frontend_changed(): the @errp points its caller's
                                   @local_err.

To avoid the issue like [1] said, add missing ERRP_GUARD() at the
beginning of xen_console_connect().

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20240228163723.1775791-15-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xen_console.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 5cbee2f184..683c92aca1 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -206,6 +206,7 @@ static bool con_event(void *_xendev)
 
 static bool xen_console_connect(XenDevice *xendev, Error **errp)
 {
+    ERRP_GUARD();
     XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
     unsigned int port, limit;
 
-- 
2.41.0

