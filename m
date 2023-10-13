Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1334988ejc;
        Fri, 13 Oct 2023 01:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcUHpyO5EAsd9oZI1M1A+5bIOXJS59nF3aSRY0OzqXKWoxvxpqMt2np0v418nhqdrOmEJS
X-Received: by 2002:a0c:e9ce:0:b0:641:8df1:79e3 with SMTP id q14-20020a0ce9ce000000b006418df179e3mr27516363qvo.29.1697184097988;
        Fri, 13 Oct 2023 01:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184097; cv=none;
        d=google.com; s=arc-20160816;
        b=Opgyv2IAe/RRVe6TtZxnC+Ub9ixhgenEAGLCKAO1SYcZ6F5Lvavko5CTgUFDNJdCpL
         ODOttqBid3vDChfq9Ysda+uH/JgqZ71Hy43kJ+KKYNyX2HO46YthPjPdrZw9kuA2j1kE
         h2/sDxuRu8bRtMf1UW//k8Bx+mROImoYeVzkX7T//ITan7bxqW5qDYVEf08Hdh3MXbeO
         fKmWrbQ8LLRVqcV0tkbQO0NV1RD3LIFV8NPl+tPa8nsub8BGxTup7Xy9HbfCnEOd54UU
         eYL2cPl7pc94ndhH+nXdmQA/x6Yn9NXQ9KVl3XnaBy5dCQ3ehv/k2zUXQEyiuAbfEnBb
         m+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+v0a8pnZb92e1dablGQHGKBr6F9eqtUoE4xNiVhEhd0=;
        fh=jqhdg2OssQ/bA/kc4CpqO38PJpQpeWUskwsxLc35AF4=;
        b=KOtBqe5vIQ/dAH8RO3SqLrWWhjjbVpSpm1MW+64uZn4ONR5GxYxHh+SykSpATWP03V
         OSR6FlNXOJbZwrFXB9ymH70TXlwRS1q2iZVS51RbqopO/eP8lbteBytewdjBb5KftUm7
         MTz15zREHyIhCTo7TtIwRJWdaFQ3pdLf5ijX4HjQbn7kHzO0RWYxP1rK1SyxhQnAp4TK
         h96BmjYjmcVSaV3wY0DVWPQzC1bLV8jIlrM+fRHgRY0mETeTEqcOYHyyQWeYYN1Mjq6g
         xMtBFrRoAOtqoxooy6nRtyvdtINmuPOuHayapfABZlZTlISUFsHOffF2Fj4mSuDI5xB+
         g0Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xrIXeJ23;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mv9-20020a056214338900b0065b17b925e3si837276qvb.444.2023.10.13.01.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:01:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xrIXeJ23;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCyZ-000438-Dj; Fri, 13 Oct 2023 03:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxt-0001Bt-Pi
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:52:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxY-0005F4-3e
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:52:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso18718535e9.0
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183506; x=1697788306; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+v0a8pnZb92e1dablGQHGKBr6F9eqtUoE4xNiVhEhd0=;
 b=xrIXeJ23wa4xQuOc9WasPJMSXkPxwf8plHS0ZdpH7ptMCMprCixf6HIYWUlKIm3VwI
 zp0Zt5gSSYV7yoqa+uCPidQR/rsS/FA+51JP7wlHhodjA7Iwq2u3yAFblOHdan35pkL0
 gwIRQbwkLmjFWpQvPmeykHF6txZg3lKljRQhO62+VLQ7qNKacDolVxv3PbWiBTYJfFJO
 f9EJcKk6gSv7VyD6PkHu/+lVyXFjJjUMPfcjLNdfQG6P5aPcgqfVTiMYU0z94JSwmaIx
 mmje+O9iMrGgNfnq0x6Op2GbUEYDi3jlmShpUiRpt1gJMPns3SXPv/11uXNTzPcLmENR
 lhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183506; x=1697788306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+v0a8pnZb92e1dablGQHGKBr6F9eqtUoE4xNiVhEhd0=;
 b=ltkKVZUEnSDotAKc+LYrgo5MY8L+RukIrsYmwUY/rtk5acUuuOoKCPW9yzc1pcUWkm
 b4GFhXRPV9105nTr6l6zMo07ddlykfPpfPIEcskPbpzjOIDrMTVFQnVKkETEdobF1twR
 /wrnKFbGt+RPt6HyOflFBILReHxg9Q+70jJyAJCBklyRQ0WGWqCOLxVEAXl/STvzy9Bi
 ozbaJCow8dKgEmg+e/tDzLIJPxxNsx19bU+73oAprNh7oTE+2JTGou+xYm7zIafGHDcl
 2hajuxVlf7A+T8MXN330K+fYFAjssGlWO8P4nYp0D40ya053s15vBlcD9kb57B+wq0o7
 UXFA==
X-Gm-Message-State: AOJu0YxfCO8pROtYNMGbqnXRqfabZZaS7U551vKEpwcyEwQPRFXcekNv
 kQO5a2uJEcWCBtIzEzJpUF8iB30LXn4jz2xyTJw=
X-Received: by 2002:a5d:668c:0:b0:317:6579:2b9f with SMTP id
 l12-20020a5d668c000000b0031765792b9fmr18235316wru.30.1697183506421; 
 Fri, 13 Oct 2023 00:51:46 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:45 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 50/75] chardev: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:07 +0300
Message-Id: <a2887799d324dbf24bcb947c21b78b551577f7aa.1697034504.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
References: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: R9ot76brDcV9

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 chardev/char-socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 73947da188..1562e066a4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -549,34 +549,34 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 static char *qemu_chr_compute_filename(SocketChardev *s)
 {
     struct sockaddr_storage *ss = &s->sioc->localAddr;
     struct sockaddr_storage *ps = &s->sioc->remoteAddr;
     socklen_t ss_len = s->sioc->localAddrLen;
     socklen_t ps_len = s->sioc->remoteAddrLen;
     char shost[NI_MAXHOST], sserv[NI_MAXSERV];
     char phost[NI_MAXHOST], pserv[NI_MAXSERV];
     const char *left = "", *right = "";
 
     switch (ss->ss_family) {
     case AF_UNIX:
         return g_strdup_printf("unix:%s%s",
                                ((struct sockaddr_un *)(ss))->sun_path,
                                s->is_listen ? ",server=on" : "");
     case AF_INET6:
         left  = "[";
         right = "]";
-        /* fall through */
+        fallthrough;
     case AF_INET:
         getnameinfo((struct sockaddr *) ss, ss_len, shost, sizeof(shost),
                     sserv, sizeof(sserv), NI_NUMERICHOST | NI_NUMERICSERV);
         getnameinfo((struct sockaddr *) ps, ps_len, phost, sizeof(phost),
                     pserv, sizeof(pserv), NI_NUMERICHOST | NI_NUMERICSERV);
         return g_strdup_printf("%s:%s%s%s:%s%s <-> %s%s%s:%s",
                                qemu_chr_socket_protocol(s),
                                left, shost, right, sserv,
                                s->is_listen ? ",server=on" : "",
                                left, phost, right, pserv);
 
     default:
         return g_strdup_printf("unknown");
     }
 }
-- 
2.39.2

