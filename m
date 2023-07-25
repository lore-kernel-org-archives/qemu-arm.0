Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp7671ejb;
        Tue, 25 Jul 2023 11:03:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGrpEKfI6jh24JOqHBBKCoE3xR4yTEfz6W1PsP2GnR+MA3bNqzrhuStRdmvxb2LRVEBBMhA
X-Received: by 2002:a05:6830:3a16:b0:6b8:9705:5035 with SMTP id di22-20020a0568303a1600b006b897055035mr80585otb.33.1690308238364;
        Tue, 25 Jul 2023 11:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690308238; cv=none;
        d=google.com; s=arc-20160816;
        b=YEjooj1KCgNpDtbw7HH0hlbIDb0Gbr4C5bUdbHGSKQtQvWH0yktqS7wSqFLfnAbWVX
         vV+99eI6XjmjqmJq0vaUIkbdIgWtYNTKE9ZpdnrT/AY678w7g2RCh/mbwbFJKWd0XtP1
         oR43qCjXBxE5QYE1sVNqfmClYbyxDsMPl6PRl+29M/eUEaNInY6WMw4r99s+0o3T6VKb
         BBzpmRAxIdW6UUJrux1SN9TJ8n/KoI5PO9j9bI16lvRjKgJe9uIst86QcHAQtorwFj/+
         IZc1b24SbYr52uQ3rGYVHO46H76nZ4PqPEnNNisNDPMH0dLajfDMfPFK/g1FMJzG/fb2
         xOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZQEjaImajQCAJb63at6vX9mIrvur84gIvRAOOVxPJco=;
        fh=VIjqXItD7ovqYEXpyxuqPkaQsOkVw6zkSP5vf471ryI=;
        b=jbagOtffj9aKazWFqSZDLwN+sXGNqSZozBQmIFuMGLSzZFKY6x+l8jskSFaFiYr1n5
         GtgoiwksGeyhttVAd9ZicYl7cWVXIZdBHSIoj417ClL++TYjj1TzzQampRhsHeBpbYaQ
         X6QyEt2AAIrQN6CRRwog522Fw2Q9KsN0zcVaZznoS9CX1XOVtQUOKp7QhYKWlRSdTHeF
         /BY2sw1PPIN18oLG2+j0zmjAyYtiw+nkthrYq5R+zWH6NThDaUVvfLTeAyE/9ggmmkJN
         ZnK8crhpySwvpvJsczV8q9ZFlQt+HeRabMi31jM3Z/s2LjYwNPdRJ0HOmRfBFRv+hfd7
         CaKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fFpxv2v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020a05622a118100b004035c106304si6924240qtk.470.2023.07.25.11.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fFpxv2v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMNw-0002gI-Ek; Tue, 25 Jul 2023 14:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNu-0002fS-Ip
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNs-000138-ND
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690308223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQEjaImajQCAJb63at6vX9mIrvur84gIvRAOOVxPJco=;
 b=fFpxv2v4UZ8Z1jhwGouGczo02G1KKb+oQ6TDkw30jVmHjNtyT8yyLjoeijmz7kM4/z0wd/
 VaxPoW4zdDEw537RwJNHnPlV3dSN0/Ip1dzIo/gYezF2aUSztuHHaeIyRzqEVpGoyNG+L9
 gWIeVgLSBB8RPWz+quA93NMXE9fkN0Y=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-_dPqLpDvMYSj9nqYIl4GGQ-1; Tue, 25 Jul 2023 14:03:40 -0400
X-MC-Unique: _dPqLpDvMYSj9nqYIl4GGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74B753C11A06;
 Tue, 25 Jul 2023 18:03:39 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D17C41454150;
 Tue, 25 Jul 2023 18:03:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 1/6] python/machine: move socket setup out of _base_args
 property
Date: Tue, 25 Jul 2023 14:03:32 -0400
Message-ID: <20230725180337.2937292-2-jsnow@redhat.com>
In-Reply-To: <20230725180337.2937292-1-jsnow@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LnQ1b5nYfSIP

This property isn't meant to do much else besides return a list of
strings, so move this setup back out into _pre_launch().

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index c16a0b6fed..8be0f684fe 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -300,9 +300,7 @@ def _base_args(self) -> List[str]:
 
         if self._qmp_set:
             if self._sock_pair:
-                fd = self._sock_pair[0].fileno()
-                os.set_inheritable(fd, True)
-                moncdev = f"socket,id=mon,fd={fd}"
+                moncdev = f"socket,id=mon,fd={self._sock_pair[0].fileno()}"
             elif isinstance(self._monitor_address, tuple):
                 moncdev = "socket,id=mon,host={},port={}".format(
                     *self._monitor_address
@@ -339,6 +337,7 @@ def _pre_launch(self) -> None:
         if self._qmp_set:
             if self._monitor_address is None:
                 self._sock_pair = socket.socketpair()
+                os.set_inheritable(self._sock_pair[0].fileno(), True)
                 sock = self._sock_pair[1]
             if isinstance(self._monitor_address, str):
                 self._remove_files.append(self._monitor_address)
-- 
2.41.0

