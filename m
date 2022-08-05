Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1106787lfg;
        Fri, 5 Aug 2022 08:20:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ej59A5eQKLTJtewPpSgdv8q7I7TBz6c+RqjsPwtqMeQomM6PzRqAwTL8wSYMh4PwMsNyN
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id s26-20020a056402015a00b0043171b986f3mr7078814edu.249.1659712831985;
        Fri, 05 Aug 2022 08:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712831; cv=none;
        d=google.com; s=arc-20160816;
        b=q5sYEm9D/iejYaaOX4gKF+f+Frz3g3ZPSv0qyLuF+PJqvBsD6IS+IEHYMIgmXKZ/ul
         JkrhrZHpAksuLlXDqUwyNJoseRSbEbXkkTBJEoG8K6fAqW1TpgB+0ReUZ3Ow1sCtmvGs
         o9dOmpY7UYcBGud5R5g7hu8IGPjANQG0UZvhpNeQ0iP3d7RT07MLtXoPXs7QQWxhp6HZ
         B2w6XbKKiIYyC9gJpY94ZXzLQiVI/xLN6vwn0sJay+gRvYaGZoyGBF526lUab0TkW8VQ
         xePoaUhuBqLsnKDJXTQGEpanA+oCjvHbs4SZ5z7dCLWyxDaeCYGxRlpb3PCt4BpY/KKR
         dsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oSMr73zQz43CzVBTEsg8WelO+8OR5Phlmmi7IjJzNKI=;
        b=R1MAXZ8fARaacS26nVmSv4gFe/dSkd4Cyfj09iyrTo0RiqTqLPCQwgT0h+FeCD0Bpm
         nic6a5xkxygOamyTG2kiqM8V7iw4dQUZTR02wkGyvPk5uwQ9155SN/x3e0tscg0/eFxr
         qc3citXcVLp0cQTx7mObQWW6Elus6f6jxnhiY4ygqxsQOfFK9RzI0e0alf0hjtT0Q2pk
         i9ILR1RPQL1LP5u1A286L/7yL/+vwh3L/DosriWgDwRS0E96KzAJuSF8L8XHRWJnQevu
         leODZ/bSd9QdXmslyd7eDrNZXKloWx27UNSMBv/VfD8aCJxPavzlg1ACQClfa3H0e/1A
         0oXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UMwQavp6;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q26-20020aa7d45a000000b0043bba5ae2bfsi26251edr.409.2022.08.05.08.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UMwQavp6;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oSMr73zQz43CzVBTEsg8WelO+8OR5Phlmmi7IjJzNKI=;
	b=UMwQavp6X+hM9t77uAgMQpL0BWXm+EncWy3CetwgI1ZB5BjaI8FTW/CYSemnSII0VllWZx
	H6vq1/hiGwgmWLZG/JIcNuNCRJBh5M8F8jZMR1Q4KDCfcOculS0D2i7KdKULZu6IQ45rWY
	g9Xae2FkMaUFo8LhhnX9cIbyArhzEEM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-2CBFUhDROhm3e6n657oXfQ-1; Fri, 05 Aug 2022 11:20:30 -0400
X-MC-Unique: 2CBFUhDROhm3e6n657oXfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 470DB3C025CA;
	Fri,  5 Aug 2022 15:20:29 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB592026D07;
	Fri,  5 Aug 2022 15:20:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leonardo Bras <leobras@redhat.com>
Subject: [PULL 2/6] QIOChannelSocket: Add support for MSG_ZEROCOPY + IPV6
Date: Fri,  5 Aug 2022 16:20:10 +0100
Message-Id: <20220805152014.135768-3-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: TSVcAiXvNHC3

From: Leonardo Bras <leobras@redhat.com>

For using MSG_ZEROCOPY, there are two steps:
1 - io_writev() the packet, which enqueues the packet for sending, and
2 - io_flush(), which gets confirmation that all packets got correctly sent

Currently, if MSG_ZEROCOPY is used to send packets over IPV6, no error will
be reported in (1), but it will fail in the first time (2) happens.

This happens because (2) currently checks for cmsg_level & cmsg_type
associated with IPV4 only, before reporting any error.

Add checks for cmsg_level & cmsg_type associated with IPV6, and thus enable
support for MSG_ZEROCOPY + IPV6

Fixes: 2bc58ffc29 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 74a936cc1f..b76dca9cc1 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -746,8 +746,8 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
         }
 
         cm = CMSG_FIRSTHDR(&msg);
-        if (cm->cmsg_level != SOL_IP &&
-            cm->cmsg_type != IP_RECVERR) {
+        if (cm->cmsg_level != SOL_IP   && cm->cmsg_type != IP_RECVERR &&
+            cm->cmsg_level != SOL_IPV6 && cm->cmsg_type != IPV6_RECVERR) {
             error_setg_errno(errp, EPROTOTYPE,
                              "Wrong cmsg in errqueue");
             return -1;
-- 
2.37.1
