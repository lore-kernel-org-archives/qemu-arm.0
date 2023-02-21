Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216945ejb;
        Tue, 21 Feb 2023 04:49:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8HBziIXzYn6YbemLjPoE7DxpdRLodo8AgJnOLU67Xly7OBo4yEO2JWGf317d8/IOI4NZkj
X-Received: by 2002:a05:622a:1747:b0:3b8:6bef:61de with SMTP id l7-20020a05622a174700b003b86bef61demr6549882qtk.34.1676983793082;
        Tue, 21 Feb 2023 04:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983793; cv=none;
        d=google.com; s=arc-20160816;
        b=DK6fk+ZssamcDitw1FuhQPgN4V+SFIWjc4N7WwHx1ufTe3w/y4rt92Or3zoGrAxIH3
         AEer2heWH/AKvOU8zXF/2m6kDWHX36nHVN3iwDXaITBZM3rMCVrwoEKmEFkMXiXoVP1I
         sWMPGZmpF+EGwpJ4GVuWRNVWDkUQOVgx5IU/avdgS89KaPS2GjJn35RsDj4wJvLOBr2X
         nI9sBrdq6yZ+dFP++S8pmb6SYavKCKfG4E+HRF9UX0mYR/b6zjk7MxD5jUi+hZR7Z7DD
         UOtQMe0amNe2X22H0ZR7+Z2Ouaeb/Wrcd8vQLi4uqbZ6o3lbvXnrOMNPNmjZUMJX1XFi
         IeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZBzSWYI24EKAE1mLV6wrDdw/35SEPCMSXQIUJYzTtA0=;
        b=wyp0sm8XnFu0QRgIocspUGHor8way4gLsJEzCitIF6X5kOjjoKVe0L2sHsYH+Lbcp6
         F3BJcQn2+pcDmVzbd3u0Fjtk96Jz1SnVfcfIdiHKqIrR1MmISfTmwahlpJT7yuOJ/vhR
         wtaBn55HKys5VyMORsCNZMzd7CDc+rjqe2qzprKy07DUgQbUTZx3Qf00ZqqMETE6mr4y
         usY2rJULliTC9Cvb7tduUdfVaPblXLrqf/LZsIhi0otLvW4PspMBWphs9rxyzibd0/nM
         nYsg9PmGYytJ288aaQD5hVdQzYoqzoOHduuT7xsuFkFYB9ZMedLBbLwv4yNDpIo8e77a
         Pxng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b+UB06Kj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05620a25d400b00716641078e4si12294129qko.508.2023.02.21.04.49.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b+UB06Kj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS5F-0006fT-Hs; Tue, 21 Feb 2023 07:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS59-0006IH-1J
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS57-00082r-Jo
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBzSWYI24EKAE1mLV6wrDdw/35SEPCMSXQIUJYzTtA0=;
 b=b+UB06KjagD0hd94GskMliufa++IAh/pIVee5kA5mA7VJBtA3qpMjk7AZ7OjTrNn7aSBlU
 cdH+bbA5+baC7eiQlH0WBgWuN6cdiL9Vh/lEMUdZYm87EVQZ9EMRG9yJyFGSZn/V2iI6Qu
 +teFl4fKCOcedA6XOK4WBBlETabnYfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-9kHZfYzDMvargMVJfSOMcA-1; Tue, 21 Feb 2023 07:49:12 -0500
X-MC-Unique: 9kHZfYzDMvargMVJfSOMcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD16811E9C;
 Tue, 21 Feb 2023 12:49:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 863E72026D4B;
 Tue, 21 Feb 2023 12:49:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 15/16] os-posix: remove useless ioctlsocket() define
Date: Tue, 21 Feb 2023 16:48:00 +0400
Message-Id: <20230221124802.4103554-16-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Lh6h7WbcI9kD

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The API is specific to win32.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/sysemu/os-posix.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d..378213fc86 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -52,7 +52,6 @@ void os_setup_post(void);
 int os_mlock(void);
 
 #define closesocket(s) close(s)
-#define ioctlsocket(s, r, v) ioctl(s, r, v)
 
 int os_set_daemonize(bool d);
 bool is_daemonized(void);
-- 
2.39.2

