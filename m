Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722518ejc;
        Fri, 13 Oct 2023 12:10:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCPJyFYyU+lWKNBvfQs1kNbVZ2ZvAASzs7mriSf8LvoxESsLfRLtK742cftKkiNi5XIlVU
X-Received: by 2002:a0c:ab06:0:b0:64a:a5f8:6314 with SMTP id h6-20020a0cab06000000b0064aa5f86314mr26105572qvb.0.1697224200383;
        Fri, 13 Oct 2023 12:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224200; cv=none;
        d=google.com; s=arc-20160816;
        b=tIaRFHbQqWczIbFN5V66bL9OMAyR91tGtJHtLt7fzInpH2LQtRoWhTaT8k6Xs/bKrj
         vJU3FRT6Dghth6YSPDEryx1RZn1KD2lzn3iWNaoyOTQm4WVVkbtdq+hJUd3+3XZhde8g
         yZbiWuh1CbAEq0emoB4T1LEINJKlmY/sOduCL/P1c3POluJ0JBs1tIQdupl229+cne7r
         ZtVxwI0pIvdyC2cjl3/i9DjZWZGxD5iFEHB1hPpkbG7Dey+FWO+MalqddRtwed5iaeLR
         vWLLapLk0+NyYo8yEYdjeXUp9tqVlqxtFXAuTFQmkINSG9z1nKXwbd5hfL/5eIaDFsVp
         c8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MmkD59q/P21wa9VckhVCoRBedLwAP1Ul151IgE+jaUE=;
        fh=D6q9Zl84lh9f35IkUo72nHtoK2p7pHS0kVOpFtZg6qI=;
        b=rOVQh+3ULO2k4VnYyLG3FOKnFIrDuYdcnvSou9KZmPh7rmgRzdnLZmEobePCN/J/o/
         kS0nute3kf2d4HpB2c8/LBCIPGV/icGDovpCnaXbT1SBErYoONDiVNX4UY6f/K6BboJr
         vN0SMXUm01whuIdTI5TQDZVb4M08Wk4h9zTtJ5hEP7YYgT3xfN/UwAH9xcAasIIaeB+2
         S6GBpE+xXo0YFs0A4y/mh8SH0GadE8C1Gbl1CKJB5aTVtLL9qzJxLjtWzu1Kx1souBY2
         f8w5WcfK4uO0cMz0xKnDeQsCHoZjlxnR3NhlFLztVzx8g1xKG6fifQns+nlsnBl0WUvV
         juPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CkGopXVR;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g10-20020a0cf84a000000b0065d1380dd16si1615566qvo.336.2023.10.13.12.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CkGopXVR;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmkD59q/P21wa9VckhVCoRBedLwAP1Ul151IgE+jaUE=;
	b=CkGopXVRDDkFq+uJBPTtIyYZCejdcAm9tNhSJ/ccZyjtuCmWlPpdcIVLAPRB0L3vebb9jg
	alI3E5O7U+c9HXT4JjpOw2ej0K5gGypw6QqP6+jmgNFYVIbl7mMshRTLIAChFCbDDf6MT2
	7athgCuLrssiRZDCpVdor0XvwI59DUQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-3t_aLIL7OL6oQFFMP4eJEg-1; Fri, 13 Oct 2023 15:09:58 -0400
X-MC-Unique: 3t_aLIL7OL6oQFFMP4eJEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DF6E1C00D1B;
	Fri, 13 Oct 2023 19:09:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A11B40C6CA2;
	Fri, 13 Oct 2023 19:09:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 11/25] python/qemu/qmp/legacy: cmd(): drop cmd_id unused argument
Date: Fri, 13 Oct 2023 15:09:26 -0400
Message-ID: <20231013190941.3699288-12-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: 2O8ftuHYKG8i

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

The argument is unused, let's drop it for now, as we are going to
refactor the interface and don't want to refactor unused things.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20231006154125.1068348-2-vsementsov@yandex-team.ru
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/legacy.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index e1e9383978..fe115e301c 100644
--- a/python/qemu/qmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -195,20 +195,16 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
         )
 
     def cmd(self, name: str,
-            args: Optional[Dict[str, object]] = None,
-            cmd_id: Optional[object] = None) -> QMPMessage:
+            args: Optional[Dict[str, object]] = None) -> QMPMessage:
         """
         Build a QMP command and send it to the QMP Monitor.
 
         :param name: command name (string)
         :param args: command arguments (dict)
-        :param cmd_id: command id (dict, list, string or int)
         """
         qmp_cmd: QMPMessage = {'execute': name}
         if args:
             qmp_cmd['arguments'] = args
-        if cmd_id:
-            qmp_cmd['id'] = cmd_id
         return self.cmd_obj(qmp_cmd)
 
     def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
-- 
2.41.0
