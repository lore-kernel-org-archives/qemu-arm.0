Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451228lfg;
        Fri, 7 May 2021 07:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRsI0B47+udjtP9dNN1LywNOzw9l8GxJAT9PgwYb3uIJwe7vvcWf0/7+xT29UERsq8WkCO
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr11740207edu.359.1620398632140;
        Fri, 07 May 2021 07:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398632; cv=none;
        d=google.com; s=arc-20160816;
        b=cUeMc6MlXDEoe6xayg2l8aDFtitssNmu6p2RX6o5tpgj/DWSKelkhzdYO7hYMylR+d
         Xoo8RxG5AD3jS3nVm9BqrODvhpTwpsIlKhuzi2JOpK5o2gcLRDGqvjtx0hSZN2N6JOBa
         4TofxygOPoKnOaHiqME8fujMyI1AxgKkwDXxNJMGONCR5P9edMwvlm2ksNCDVkjDZLxW
         JzZsNtXn4gEmy34d9eDJU1OwLBOgMmxvDX8oSE4GpU6f/vRK511yKwWUlbxpYXPDN7ni
         YlFOeJfIXrSw4xwrHgdNF3yzZfvILDbRuH3ZfaRam8SzXREzEiY3WpRMlk9a9UEvxbPB
         8yXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2L5mr2b7hhw5EkGSTWl47QqXXqBmVyFmMYU/e54ubTE=;
        b=PZ5gx1aVyCBBGkIPzWOMdFdNNBYT4dXCDhx2B9OWjseLgNt3mdCl5lkr4ZkRfGedYQ
         7WGW4LXNAmYPoyvg8GN3q+PXaZwVNRBhZ2a5i+1wpFFazoV7Cvuklc0J3vNAB9OzMlil
         ZVoNRIBRxqFQK+iW+KWtDufz/M6oFfMthmPNjDyKG+I5JZgjNFpH+T5tdYI7pE4Bq3Nm
         n8Cp9ub+yLHmyrwwgxmao4legeDsZiUeIKf4XG3ijt2lWaANnTm4PY0jCA1rVpKoskfS
         M9ZiojLtvWmzB67wnpQM0gMiVmOzdcsD+82fAEavkBUb0aDiYPwsRJMm8YkIHTz6X+Dw
         3Vwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I57o4PLQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gn39si4687435ejc.405.2021.05.07.07.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I57o4PLQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2L5mr2b7hhw5EkGSTWl47QqXXqBmVyFmMYU/e54ubTE=;
	b=I57o4PLQwLVg0l9EbJOpmAZ5g90+5fEAYUpN4pct7tAyhXRl0q5qgQE4GzdjHzo6NHKlXU
	P8BQlcVyQl0f0uLEFWS6YDbB27fXRHqSeXsYozGVCWEAWGnUqk8uvS3USCGtJUIlvaKhoO
	lSTAni7Ahe92WhuxDjBYLcgh20Ah7Ag=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-M5FdkWriPG222X2StOZNPg-1; Fri, 07 May 2021 10:43:47 -0400
X-MC-Unique: M5FdkWriPG222X2StOZNPg-1
Received: by mail-wr1-f70.google.com with SMTP id x10-20020adfc18a0000b029010d83c83f2aso3695530wre.8
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2L5mr2b7hhw5EkGSTWl47QqXXqBmVyFmMYU/e54ubTE=;
        b=c+rg3TnlT7SRbusCF3NqQO6DkwCZvudU6omRMqB0mAXCeCE1dSrWMqlnOTCpZPDO25
         HJuTzFcb2utDOr7nO3MP5tS8tkdKoi0VPMqhg32E24zBot1N0oZ2pngK/R9cCYFQ15p4
         fm/JN1WiYtNTodUy36H346bN3zty90e9SGgH8vYpPNzOCPEa96ki04yqD1xJuAQ7B0Yh
         yE68me36ypFw47zCl56ApyzkGh4LQfNz0EM6RL2DWwqV3Mn6ktgbqWCMRLJMo/MWps5o
         iVE5oGO3JQA0kYg5iw5AuUIsXZtK3ZlDGE7yYBLS+htAP1puR1lFv3+z197rfIdglYPh
         TA8A==
X-Gm-Message-State: AOAM530mtXivO5ZPL+qCAgUgWGsUhFKumGoTxHl1x+oRquw8Irux9Czm
	Kx+rYkwegocL8bg+SyXPIpuZdgR0Ureb88g4/BAv3VRJt2m61p8vdiQa9hdszmK97UcQfZIG7Q9
	5TLQN8HZCqdm9D0Ai
X-Received: by 2002:a5d:6682:: with SMTP id l2mr12867706wru.15.1620398626336;
        Fri, 07 May 2021 07:43:46 -0700 (PDT)
X-Received: by 2002:a5d:6682:: with SMTP id l2mr12867692wru.15.1620398626166;
        Fri, 07 May 2021 07:43:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id f4sm9261707wrz.33.2021.05.07.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 06/17] linux-user: Replace alloca() by g_try_malloc() in setsockopt() syscall
Date: Fri,  7 May 2021 16:43:04 +0200
Message-Id: <20210507144315.1994337-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IZof4T/3eok4

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0bf4273fc7a..a263aea85ff 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2191,7 +2191,6 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
 {
     abi_long ret;
     int val;
-    struct ip_mreqn *ip_mreq;
     struct ip_mreq_source *ip_mreq_source;
 
     switch(level) {
@@ -2235,15 +2234,21 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
             break;
         case IP_ADD_MEMBERSHIP:
         case IP_DROP_MEMBERSHIP:
+        {
+            g_autofree struct ip_mreqn *ip_mreq = NULL;
+
             if (optlen < sizeof (struct target_ip_mreq) ||
                 optlen > sizeof (struct target_ip_mreqn))
                 return -TARGET_EINVAL;
 
-            ip_mreq = (struct ip_mreqn *) alloca(optlen);
+            ip_mreq = g_try_malloc(optlen);
+            if (!ip_mreq) {
+                return -TARGET_ENOMEM;
+            }
             target_to_host_ip_mreq(ip_mreq, optval_addr, optlen);
             ret = get_errno(setsockopt(sockfd, level, optname, ip_mreq, optlen));
             break;
-
+        }
         case IP_BLOCK_SOURCE:
         case IP_UNBLOCK_SOURCE:
         case IP_ADD_SOURCE_MEMBERSHIP:
@@ -2492,7 +2497,8 @@ set_timeout:
         }
 	case TARGET_SO_BINDTODEVICE:
 	{
-		char *dev_ifname, *addr_ifname;
+                char *dev_ifname;
+                g_autofree char *addr_ifname = NULL;
 
 		if (optlen > IFNAMSIZ - 1) {
 		    optlen = IFNAMSIZ - 1;
@@ -2502,7 +2508,10 @@ set_timeout:
 		    return -TARGET_EFAULT;
 		}
 		optname = SO_BINDTODEVICE;
-		addr_ifname = alloca(IFNAMSIZ);
+                addr_ifname = g_try_malloc(IFNAMSIZ);
+                if (!addr_ifname) {
+                    return -TARGET_ENOMEM;
+                }
 		memcpy(addr_ifname, dev_ifname, optlen);
 		addr_ifname[optlen] = 0;
 		ret = get_errno(setsockopt(sockfd, SOL_SOCKET, optname,
-- 
2.26.3
