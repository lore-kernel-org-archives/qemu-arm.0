Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2305896ejc;
        Wed, 27 Sep 2023 21:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdA7/2pdSAvdX+fgyxCOJgoJnT1GOFde7W0P1XLCxZL3JBnFFJuGScjkb+Rbi7fbMdO34e
X-Received: by 2002:a05:622a:199d:b0:418:bdf:f4b with SMTP id u29-20020a05622a199d00b004180bdf0f4bmr170659qtc.6.1695876693574;
        Wed, 27 Sep 2023 21:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695876693; cv=none;
        d=google.com; s=arc-20160816;
        b=IYm+l3NQ60tBY2wmqdEqcjS9aVxgD+cstTAiv8oSEgr9SwOSARj6gb1znLKs7IxeGc
         nwVpwVEs+aLuoo2r3IDpAhWx6o75mQ1XU0w2mIhLrDEYXNsrRtcvFO2wMABBcLRNWh8I
         cnby4dAI5RhYNDprflVBSj9PHNOpISytDKFQNC7/QxWAvykHwc394/JeK/JEr7Q9ytKt
         XLawDMGseDyxeJIZfiG8HGrXcfPV/BOn7Pen1x3paM9QqP4aldR0lg3gcMZzQqLLYu6h
         axTrNfDyOBixFyX839lYYAZwDxxUpvHsHWW2JYtwcYhAber3PYiScISi3x+cK9+EljH7
         oXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dy8Zz5j929cTC/y/42t0TFxD3CDCAcfegC9aBb/EUvQ=;
        fh=SlnpYl/apPGobcNY8vCsr8ux0b+PCiuAYFwDQav0GZQ=;
        b=s72U+LiTFCBndYXZ/2SPsA4/REnYNeO5SsbqghWxTMpf0E6f3jL1BTq8rLhSlCgcfX
         NE2u8Bo11wJRWerE4VU2rO5JQcV2GDm3OpQ1CPOFminJkSaBh6+VTmxN6KsF3XUJlNqF
         t5aYIfTqoXsq/3IACOhuK69tDWLkUhoI/4de6uDnMFKKw3CD441Jy5LnhzH3JeEb9QyT
         cFkxOOQJfmOc+u4V1SZdcfQWE5EkU9VfkdjgugfCluecUSDNuo99VIzAmwcOMt7uTlhi
         0Hj+1WXIVAnCGSN6sVI1xvO/e7jyju2pcIxk/vC0DJZJVSZHMw59cu4YZzgoLnRMJbvU
         mqew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsofJWXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05622a05cd00b0041812c417f8si4845353qtb.763.2023.09.27.21.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 21:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsofJWXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qliyR-0002L4-09; Thu, 28 Sep 2023 00:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qliyM-0002I1-NC
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qliyE-0006gS-Ng
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695876588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dy8Zz5j929cTC/y/42t0TFxD3CDCAcfegC9aBb/EUvQ=;
 b=NsofJWXsBhlnyjiK1ghZjMpg4Q2rDeWNKRyACu+nazt36UZ2XEscobyGXAJ4GXzEQ5K4xs
 /dOpyFlLx7ELrlm3G0W+207grp/SHR2N/Jg+tkETdjlpzO+osT/34Oa2zoeFCFug42owMV
 tk49mXsrbcVA9MCARQJgMxJF+ig24Ug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-ZE-PBl7uN4KUi-Sdc_ECEA-1; Thu, 28 Sep 2023 00:49:45 -0400
X-MC-Unique: ZE-PBl7uN4KUi-Sdc_ECEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D107802C1A;
 Thu, 28 Sep 2023 04:49:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54A661004145;
 Thu, 28 Sep 2023 04:49:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Daniel Berrange <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 1/6] python/machine: move socket setup out of _base_args
 property
Date: Thu, 28 Sep 2023 00:49:38 -0400
Message-ID: <20230928044943.849073-2-jsnow@redhat.com>
In-Reply-To: <20230928044943.849073-1-jsnow@redhat.com>
References: <20230928044943.849073-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BGkT/+0s/cJW

This property isn't meant to do much else besides return a list of
strings, so move this setup back out into _pre_launch().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/machine/machine.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 35d5a672dbb..345610d6e46 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -301,9 +301,7 @@ def _base_args(self) -> List[str]:
 
         if self._qmp_set:
             if self._sock_pair:
-                fd = self._sock_pair[0].fileno()
-                os.set_inheritable(fd, True)
-                moncdev = f"socket,id=mon,fd={fd}"
+                moncdev = f"socket,id=mon,fd={self._sock_pair[0].fileno()}"
             elif isinstance(self._monitor_address, tuple):
                 moncdev = "socket,id=mon,host={},port={}".format(
                     *self._monitor_address
@@ -340,6 +338,7 @@ def _pre_launch(self) -> None:
         if self._qmp_set:
             if self._monitor_address is None:
                 self._sock_pair = socket.socketpair()
+                os.set_inheritable(self._sock_pair[0].fileno(), True)
                 sock = self._sock_pair[1]
             if isinstance(self._monitor_address, str):
                 self._remove_files.append(self._monitor_address)
-- 
2.41.0

