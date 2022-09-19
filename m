Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1440115ejy;
        Mon, 19 Sep 2022 16:19:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nVNEXKFJd0QH0rv3HPAjfQYVg89inIn9+DMFaHzZ1lm5z8ogwvbLn1Clt+oJLZZc9BaWn
X-Received: by 2002:a17:907:2cf7:b0:77a:9707:bb5b with SMTP id hz23-20020a1709072cf700b0077a9707bb5bmr14822635ejc.655.1663629574618;
        Mon, 19 Sep 2022 16:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663629574; cv=none;
        d=google.com; s=arc-20160816;
        b=nvMZKtQTveJNvRKZzV2IRxg6NVIB8zncftHMiZ+buce2zVjAvRQOy2/6Exlh0Y7NWB
         tPC6fKT1KAUwh1tmD9cIhCIN2cjDvWJPZyM+m+w7AurhsMamqD0fJRJMf2byJSaLJia2
         sfVMbJHgS8zDKFB28ka587tWTu/LM4rAItD4WF+f235yWsVjv2UZS/y1Ag1qeWKrzgBf
         aHX2gdamQkYFF/8/cQPEfgAJkW6JJwde3Cu1JkwSnAKfyAxtIKy4bTRWZe+0+PUzjMUw
         Vr44Z1Z2CwiMU3QGNSWEh2VLL3gWha1xYwOzC1ZF+UVh7lfA8r9BYaKkuTYc7jhi6dxx
         uSMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
        b=qhxtpwDtkzL1ieQfgttEyrXVidqY3pZBCkxImOIe9QsnG+R/ENkouoh0uNeOrdj4Ck
         GEFjwyG/BQTpl+SENqazwI9OUr52A23NypiJumD6r4I7wHnhKNqrPZ5mlKT0305PwML8
         5tbWoYyKsC6zFY/FfoWaCo1cwn0vgreqXBxZ3qaFhIlHE16eRcBsX6MYrvKubLYHiT2R
         AN2jT4kKF5NHnnjaZEA2nPzaGUQbj8WgTToJXJU6X9TNDK5ZQmgXrO8KzKY9VMrq6qSf
         yfDSYokREES+Y81D0R0KpFLRJQz7OXXg65agTySTpBFElnxV64I2KKC1Jr+awSuTXSz0
         A1EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1Xkq1+a;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id hs13-20020a1709073e8d00b0078049ab4bbasi13406517ejc.526.2022.09.19.16.19.34;
        Mon, 19 Sep 2022 16:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1Xkq1+a;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiISXTc (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 2 others); Mon, 19 Sep 2022 19:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbiISXTD (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 19 Sep 2022 19:19:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF624501A1
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 16:18:54 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id e17so1381478edc.5
        for <kvm@vger.kernel.org>; Mon, 19 Sep 2022 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
        b=V1Xkq1+a6hse0yYR3fG7QmZf7eJLZ9IHXShDEimvhNxJCgJXQZEhiB7rS29v8mOpv8
         P6Q/NgzpGGR1zjQswFV9oVsIkApjiLp/TuMLa8asbQeDVSJ9xcqsRDBMPPfvubQ/ud8M
         6dma9SHs8xseeoX1geC075YVhTJkg5UYKK9V145qBxKkDYQso+5CEuESYbx9GpS5ITt/
         geAPZY2mvKURWXNpdq+82LS5ePfVg2MiJ8HHMrB93gDn3YIy3WMpYdI3RCQ1Wj2jPwFe
         D51PhycmYQXgI5PX3syysunfpaQHEnp6cVcDiO8I65JrGDV+oaRZA47creHSMX5+vVkK
         EpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5XlQ1VpPqIV9nkbL5heHBJQIeqw1Mqo2GOdHAQq5+II=;
        b=MunTEGyP8Y5LnVYyX9qFgGn9bOI+m+ql89nolT7EGK17E2GvNR49xR6pqj5p4GQalI
         ybPbNOKhSsmdtzzfNVqap58fGWwfFwQ0OA3BIpwQzzCP8bZVnHuZuO1X+JsWc2Wb+VaJ
         TB0woI9rA53b/Gtu4adrUO06eLlHwnVrGoWuLZ+p405j63bZ6g2yJpjCpkcMrlTdQkey
         wcNPOBlZjaD6TeIfipqRm6E9Y7F30wOVMn/bdz2hWTYlGE0vhrSNwSHOk4xD/Jzt43ia
         4sZ7RMhO6twaXT8kZGeICKbd1VOonhjrSiGSP/dRU2Co5oMfj05IJzU4oKMoCrxyj4RB
         9OjQ==
X-Gm-Message-State: ACrzQf3rShCU86KmdHo3dobWep+n4Qb1xpi0+3sSnqg6PYZ9C9tO0gra
        SSEjHmle70Vvj/47h8dXAOY=
X-Received: by 2002:a05:6402:2711:b0:451:327a:365f with SMTP id y17-20020a056402271100b00451327a365fmr17131653edd.315.1663629533162;
        Mon, 19 Sep 2022 16:18:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-078-054-077-055.78.54.pool.telefonica.de. [78.54.77.55])
        by smtp.gmail.com with ESMTPSA id rn24-20020a170906d93800b00780f6071b5dsm4800926ejb.188.2022.09.19.16.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 16:18:52 -0700 (PDT)
From:   Bernhard Beschow <shentey@gmail.com>
To:     qemu-devel@nongnu.org
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Bandan Das <bsd@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Sergio Lopez <slp@redhat.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Xiaojuan Yang <yangxiaojuan@loongson.cn>,
        Cameron Esfahani <dirty@apple.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Song Gao <gaosong@loongson.cn>,
        Jagannathan Raman <jag.raman@oracle.com>,
        Greg Kurz <groug@kaod.org>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Markus Armbruster <armbru@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
        Eduardo Habkost <eduardo@habkost.net>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Helge Deller <deller@gmx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        qemu-riscv@nongnu.org, Stafford Horne <shorne@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Havard Skinnemoen <hskinnemoen@google.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Alexander Graf <agraf@csgraf.de>,
        Thomas Huth <thuth@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Eric Farman <farman@linux.ibm.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Alexander Bulekov <alxndr@bu.edu>,
        Yanan Wang <wangyanan55@huawei.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        xen-devel@lists.xenproject.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        John Snow <jsnow@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
        Qiuhao Li <Qiuhao.Li@outlook.com>,
        John G Johnson <john.g.johnson@oracle.com>,
        Bin Meng <bin.meng@windriver.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Alistair Francis <alistair@alistair23.me>,
        Jason Herne <jjherne@linux.ibm.com>,
        Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/9] target/loongarch/cpu: Remove unneeded include directive
Date:   Tue, 20 Sep 2022 01:17:17 +0200
Message-Id: <20220919231720.163121-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919231720.163121-1-shentey@gmail.com>
References: <20220919231720.163121-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ruD7BlQIWiOF

The cpu is used in both user and system emulation context while sysbus.h
is system-only. Remove it since it's not needed anyway. Furthermore, it
would cause a compile error in the next commit.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 target/loongarch/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index dce999aaac..c9ed2cb3e7 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -13,7 +13,6 @@
 #include "hw/registerfields.h"
 #include "qemu/timer.h"
 #include "exec/memory.h"
-#include "hw/sysbus.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
-- 
2.37.3
