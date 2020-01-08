Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp921490lff;
        Wed, 8 Jan 2020 08:03:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYYdcjwExP1HAi8OMze3/J0UyEYwadtVsVP91AAYT3wo8AK9dx37gAa20gPN3N8EeFZ957
X-Received: by 2002:a37:8e45:: with SMTP id q66mr5051980qkd.129.1578499436733;
        Wed, 08 Jan 2020 08:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578499436; cv=none;
        d=google.com; s=arc-20160816;
        b=EDKxRk2NfGj2offi47eJ3FUvmKQ4Q8EemTaDv5i9RIXDpEkWKWw2th8Ol9N2SJU6eO
         3Y3cfgxueu0FEkFivOf7VWqMERScKwTtj+6EMzrR4xUldD/b5sjRv5xUoVloz5OTjfqv
         Lj56mHUkepagJjPXT02eLqLFTVmHGTPl+fJH72qekbPJfG6tu1vO1RhTeDXHYXTLDLx0
         hvId/RRoDm7sjASp/ywRUYLCW0Gf2nv1B5JekRIlabmPqEYmP+gcrAXWCuS1f9wjMPg8
         LVS3o6Pip1W1R+ZzMFqt5xtGLiSiV9jzTLnVvxOeh9sHnCPn0TizQ+lfTCcn0HRjsCg8
         NBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=K5lf8rAVqNF9ElplaUOTOLYy75KyIUQum23wpb2Ofuw=;
        b=m4jsRazHvrQDF6wXtWQJrB6edw3LgYl+EuEZhtB1qSwS99AkU2JE/UPIakbn00frRa
         NbitSKN4SlpF0J1E48DWqLT5t6BMxTnkSH0/NOfknYJQWv91yYxuLbbdhkkrkFXobi17
         J+d8MMTUdJa+5D9YZ+ZbJAPfDriXL/Z3AswGPS0JgtIBw95Z9tvjRl5UrXllVuhHLMeN
         cjCMY2TrrCKQaC3pAFjAJI7aNF0qURWla5e534QUFvQiz+NLWZae6ueaXCVVKHg2kdo8
         3dynUgqkMREm/pdnghPGnHFgBPW2Wdws7P/3fDqoue0SNfztKOoOr2xgSNgPgbigB6Cw
         Hsxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si1723519qvi.17.2020.01.08.08.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipDoJ-0006TU-BX
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnN-0005kj-L5
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnM-0001wu-HV
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 11:02:57 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:39255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnJ-0001sA-EB; Wed, 08 Jan 2020 11:02:53 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8GhM-1jkA294BG4-014Cq3; Wed, 08 Jan 2020 17:02:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] util/module: fix a memory leak
Date: Wed,  8 Jan 2020 17:02:30 +0100
Message-Id: <20200108160233.991134-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hS/W2JMW7nZSLC0eATbtBj6PivLfM45GzikAafYooWqOMTH/Eae
 7iyfqSvy+QZsEMwCgFBCGdCN2lO3755qEwf2A5s5iXi/c55NekWtqO0o0nj+XgneyWcm9hR
 zOIYvWOmuyGgG52AKn+Zmz3+lbmUtietPv2AGLu2vrEzB4Aslp1mK0Fi4HTEmmgoboGYb6S
 RLjOe5BZ9BPh5XSKddV9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V2H1zfct0lA=:qw+R8WMdzOZiTSvJHc7vHG
 0SbNg+CnBwgIfzQ6uICPhUe1nt5EiS5WbesfBq40iXKc8RsxsfKdNnS3XazU6XXDoeXve6/gx
 VFaQWVkz8ZXDCCIUNaTgKmbMb8Ma2UPnNB6LxbwulJ4BJP+L/nhHw7/VAgha1PqxLs053MEUV
 RUE0YjMChw21AODNGbTDHmXrIdHKnS1o/Jp8RE/3vrexJ44V4LQCH+7RjHBNF89uIpVhRWnaP
 aG3tbu9LrfivyxRCimlQQ6BpGbI3ZXZKiNFwqelxWzPjeOmRQtBZwHPjOa4JKhAu4N1qtDUeM
 XozihjDBOMx7JNagAyVH5/lMwz7wJpKnLWkcK4oJvu96xGr0qcg08Ksq9PieDqZmK+0XHOvQb
 WWHlR8BqKMxuOCwz4RXh+IoUSfLyOTNIyFPi9/cEhmPGSPUltFQmwOD//uAF1wZ+FenhXa8p4
 xcZg/Pc3XgKabGyeYEF+2VjE0X++MXlgB3ZEkds3d0EVXMB3D5HkI16KWdcDsZWRGNwH59Oav
 C1xkKXwzafLAEEvP7BPKKA5QDt5Z2kFOjlPU2dOHyxfFlGqbvXu0zss0NF5scM1sKB+KFXUg3
 dX2HB9Gtx2DOxkotJV5j8gICaqMLtM0f/kj58Rl3CfSqm2gw8cZDTY+MYt/PklueajohPfVJa
 82UWDJYPF872CWXvVlC9F/RqK1L9gQLzGoq11TQNsiMSggwSYHVXZSqUgCqsLiRllc/0Ow/ne
 TEpK6sBtSI3LZ6i9MGy8EgXkXEpz8eiYySjWWe8MGegy3tnJGz1cPoqex/7oG21fbP/delnX1
 tyzMjoLJuhFVIkzWrviw9ckMoKF4mQPOzBvHMbmaH8RovYW4RiweZ9X6S2u1hy4AmUDvBXnse
 sx6i+5LUo6PLNg5iivWg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A7GcjEJUBTyj

From: Pan Nengyuan <pannengyuan@huawei.com>

spotted by ASAN

Fixes: 81d8ccb1bea4fb9eaaf4c8e30bd4021180a9a39f
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <1576805650-16380-1-git-send-email-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/module.c b/util/module.c
index e9fe3e5422ad..8c5315a7a307 100644
--- a/util/module.c
+++ b/util/module.c
@@ -214,6 +214,7 @@ bool module_load_one(const char *prefix, const char *lib_name)
 
     if (!success) {
         g_hash_table_remove(loaded_modules, module_name);
+        g_free(module_name);
     }
 
     for (i = 0; i < n_dirs; i++) {
-- 
2.24.1

