Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2305769ejc;
        Wed, 27 Sep 2023 21:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb2UJw3gvxp41/Ulnohn2nF3Sj6+t8KpSL6RYZb21+wzpz81/2KVA2edauxCwhiV48Cf+c
X-Received: by 2002:a05:622a:1a24:b0:403:e895:155b with SMTP id f36-20020a05622a1a2400b00403e895155bmr188494qtb.34.1695876672449;
        Wed, 27 Sep 2023 21:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695876672; cv=none;
        d=google.com; s=arc-20160816;
        b=HJVZ1QzkPPATiSbNgiEx65yg8JnHAYEHhxIM3h1vGbNSqSZZtIZNupQMWnrcvr2bDj
         /32isNajAYvT9bLO0qLBQHYX+sa86Bd2xSYYVEoIWdpKAVgfWLh6Z6tMJZxlFra6yb6D
         8tz7Lj3A5lDoBu0D6jrryc3ccT6iw18vR6EhVeOJpEr7i2sXHLYY+PDvqDARqMjd09C8
         Jdtdh8tmHUDzfGAUxYm6Lj55tjLC+ZX3UloBcSyL8fYYQbr0Ir6VFkTVzaDtpdXZBM0e
         lcuEyFfV/VxJpOZk4lMNEsuKY80j0MTksnFn83BJaNqDW9cYKJedV/QNq9WHoCrCX6I/
         o3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TmGgHENgntSbtlCsa0BEcNYq7zJ9XbDM4SQJ++ZpvxA=;
        fh=SlnpYl/apPGobcNY8vCsr8ux0b+PCiuAYFwDQav0GZQ=;
        b=v8hjGWvuqd3PenHKrzxb+cFqi+Fv46yA7rHAEqdNNw9yfGnBO8DPmT0567wf/0JlCT
         sfD48+oA+mbBjD068JF5LatMOcDG/mEWhES+rgVtGUtRQLL1GLJbt1zJIEdtxXsjjwPn
         REofDI7nSNtynTwF16gXt7Toanf0xtLfyrrz0fWi0liiHY9iyjNLfRH99LsZV9xRlHHi
         dZ8PbPPFlkb9OftTyq+KPNposCAELfEhjP2UzBjibGsxJW6aXKcDLYkxGsu8ui4qp0Xp
         +RfJ+tn5PrfhVOhzl6vGAnT0THj3nOaNZYrCqd1xch7vXH3BguITrhnJ/4KRS+/UfXtL
         5d5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eYhW6yJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05622a174400b004151e5a9a15si4894604qtk.66.2023.09.27.21.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 21:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eYhW6yJY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qliyg-0002RY-2W; Thu, 28 Sep 2023 00:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qliya-0002P0-Uh
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qliyI-0006hj-KL
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695876593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TmGgHENgntSbtlCsa0BEcNYq7zJ9XbDM4SQJ++ZpvxA=;
 b=eYhW6yJYiTFeO4H9LTMcg4f1E+3dTjpnHp1xgtcPyG11elQm01AgqGkIoJgaa+8wZTVfZI
 uLcN4dV9DJYxHpOHNCq6qBNboZfoMhnI/Irf2dvAxazPpcPnMqaC6/87ZtIl5JZGCBUYld
 Io2xczg5+GdV3ZfIH21t6MpQw9XxvHc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-vCZji-f5P2SDuUOpVMFcpg-1; Thu, 28 Sep 2023 00:49:46 -0400
X-MC-Unique: vCZji-f5P2SDuUOpVMFcpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF15B80349B;
 Thu, 28 Sep 2023 04:49:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D1111004145;
 Thu, 28 Sep 2023 04:49:45 +0000 (UTC)
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
Subject: [PATCH v3 2/6] python/machine: close sock_pair in cleanup path
Date: Thu, 28 Sep 2023 00:49:39 -0400
Message-ID: <20230928044943.849073-3-jsnow@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nc9S1LTTgT7n

If everything has gone smoothly, we'll already have closed the socket we
gave to the child during post_launch. The other half of the pair that we
gave to the QMP connection should, likewise, be definitively closed by
now.

However, in the cleanup path, it's possible we've created the socketpair
but flubbed the launch and need to clean up resources. These resources
*would* be handled by the garbage collector, but that can happen at
unpredictable times. Nicer to just clean them up synchronously on the
exit path, here.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/machine/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 345610d6e46..e26109e6f0e 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -396,6 +396,11 @@ def _post_shutdown(self) -> None:
         finally:
             assert self._qmp_connection is None
 
+        if self._sock_pair:
+            self._sock_pair[0].close()
+            self._sock_pair[1].close()
+            self._sock_pair = None
+
         self._close_qemu_log_file()
 
         self._load_io_log()
-- 
2.41.0

