Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333171ejc;
        Fri, 13 Oct 2023 00:58:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw2jG6EIQ37/ChOgpR23yV9Ikn/nz5xRqhaOWCFAV1VzMKuNSaFHvC984v//yO2elPS8EY
X-Received: by 2002:ad4:5c67:0:b0:65b:4f2:13fa with SMTP id i7-20020ad45c67000000b0065b04f213famr34143089qvh.2.1697183891903;
        Fri, 13 Oct 2023 00:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183891; cv=none;
        d=google.com; s=arc-20160816;
        b=DMhK+foWVaavG3+3qiixBM7vr1z/QWYjP6IgHA+ASaVn/4Ugwp85xMzC6QwXpdjqCk
         ObHsSGjrNfdAndsvzskybboCk0+TPyMMyQU7RZ1pguerF69PdLp8Se1D6Y0O3RiJLYZV
         s868j2WTZAo6V+8GVY0986seFGXEm9NaGXLl9QnVDq5aO02UejFhmGsdpzV4aQN4AXBG
         AKDa6uaq7ihaNY7MtL1VTHmQIpMYofYinGWzSPpIug5LFFz5nXeBjvsBbxn1DuVtf7fb
         uuFTTdmTcposy3/09OWRhTaKR0BdNCD0IFT/0qhTUck4PxvTRuJrTuqPH+/RSme7WEC8
         MNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=szRY5OVua4jMraaGx0Wxad48cfHGRUEd9LK/mYhb6Xk=;
        fh=jqhdg2OssQ/bA/kc4CpqO38PJpQpeWUskwsxLc35AF4=;
        b=b4Fk7hm4rBvUjbq4DN+1vlKPdQU2r1mw//Ybmla+DtF8sfGlYdkLI/qmvVGWpK8KnG
         kUfgrAxlUFPKaSpLAiI093a0chEBPgwmUY7Iv8otUs2iVg+FnhFj1orqL9rQPdUbXep4
         aGkqzpFDD6ncCuhucBJ4zTh5MhUGnOfIiXOTo1oyFX6BgE5uI1gxpvgNLuog2nNFdzrO
         b9OhMfM+sQ8dktOw9ANNq2IKt8j+ynS1eIZQfuqLhshdQ7cMgJ0gCqoLpP6U2RMEdCnf
         7oDV7fBdBzKiQYMC9E/9Ww0T4+A4owoSo+L7f54leBVtVy+xsjX8TthTObDwxai2to0M
         gzaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ublIUZfn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pz3-20020ad45503000000b0065af2518773si820264qvb.89.2023.10.13.00.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ublIUZfn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCzE-0004iN-7q; Fri, 13 Oct 2023 03:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxv-0001K9-4B
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:52:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxb-0005GV-Iw
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:52:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-405361bb9f7so19252315e9.2
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183510; x=1697788310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szRY5OVua4jMraaGx0Wxad48cfHGRUEd9LK/mYhb6Xk=;
 b=ublIUZfnjQ373T60q6lqe4wIPkNPgdjSk0DLd3+GyCZzFX4pQITcJXVTjhFAV6BoOt
 Eaiussk+J+um8UPYQn5+0xS7VPFR08bCjuAyz6JzMDlcBnyHulAM+HNffUveR0PGaPwD
 rNhSxHPD0ZJQFDPbb3bo6eQwCx3QLvQTUHwi43+XOe/ycd3LGi2MY+5uPnguoCx/cUXJ
 eE2T0VgVgSLfWndfdFybxkY01wz7dT8CCiZvLqPFHpOg1TNc0JVliJGv22rt6kPEvjsB
 mBtLMx0M8YxzzoihwuSSO71okcCbqDhkaMmV+2jJrNLn2GW/NdsmdPyU9VqgOpvgedm6
 ZZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183510; x=1697788310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szRY5OVua4jMraaGx0Wxad48cfHGRUEd9LK/mYhb6Xk=;
 b=QhgrFkoK+wk8rF+W4QAyEJvhBuV6mKgWytOZUDUiAETSW4Ui+f79lJ5XV3LOmuPGH5
 0KhfrKU+FF77Zbmtb6S6X+nbnA0wwupK99cjOU6iUWMF/yHkTmjwmeTtEszOJIrwi9Rm
 Cfvb4IoSchhcmyTwkAgP1XDwFYG1q+odkBPc8mOKfrHuSfDt2RM85+2IamRn9jwK6riH
 xGvb8p5hxQGd9gIeH+xqCSyOvbJXd5jCdd+flQEYWEGurA8Ku1Wlz6YxANZEk2JkKvCQ
 LEIJRcyjKYUEiMQyyXGuDha+amZXUF/rLj2QYFs3KV5VktQAg6MKRaQVb+M94lZVywXd
 CwBQ==
X-Gm-Message-State: AOJu0Yy3b3IQmTqzAHXvWviZPjFA29peSomSVzBmyADZLybx90Pci8YC
 C6RIQf/xzFSnVd6zb0bh0gRWu7ULyUMVbXwBwzA=
X-Received: by 2002:a5d:4b0c:0:b0:32d:9524:386b with SMTP id
 v12-20020a5d4b0c000000b0032d9524386bmr2978347wrq.32.1697183509935; 
 Fri, 13 Oct 2023 00:51:49 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:49 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 51/78] chardev: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:48:09 +0300
Message-Id: <7f3ef498c442a160fb72d745b975decba7e4bbe4.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DEKwLWCfBDbf

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

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

