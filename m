Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp470094lfq;
        Wed, 23 Sep 2020 06:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw91OL/SGW7uSNPVopfTWYT+IV4AlWY6k9HNEx9MWvTQlywZjnHXE0eM98UqzoWQ2t49SuR
X-Received: by 2002:a25:8312:: with SMTP id s18mr43725ybk.456.1600868410084;
        Wed, 23 Sep 2020 06:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600868410; cv=none;
        d=google.com; s=arc-20160816;
        b=jq0c9zXod0/2T5S2dyVToSGXDFRMQ/ddk8d+NvUaR0ja1C4fHhoNHiOihH4STzr4tI
         ltWmp/2vXZ0N2I2AQdUXse8lx2+gpP2siA3pdOJC+32axxXEF+WChC4BekBC67Bh/bdO
         +yqutua3K3EaTTLMcoJX4PaWjkWO3YmZD69NC8js/+Lc+VAkdOMIMffkGTiGbww3sWkk
         NKzTcf4ToiMEQjxcc/G4IPjvwgHG+RM1f8n81Gtcxkz9tkjdj+EMA/uxJ5zyBWM5wAmr
         9uX4otA3QxAjp4StBYdQO97rt66Fe4nZpYcTZF9MGiG16iwgKCtYpbPxHwVcEljY8WTg
         AUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eFPkbYxA6FaaMTGJYUsKcGN1xs97j6/u2JzPLhfib1Y=;
        b=VwXL9OEYbfAQ+DlOoxK5W5zrN+x+cgWAMIYsMYrEE6I/jnW7zAhkrPy2EX7UEStSzo
         xVMSBr+xZpzDT9gj8Ry+ue3UJvYq8k4Pu08MFtX2u2rDkMjfNDgNGY2mAJPBIMw1c7C1
         sTRlUbXeZh0jGJvVm9QTXpmQcHhP8gVilbGtw5w5vpgUAW9xBCiyFXVfFmhpSbsv6Njt
         TUQfQJKjWUfoEZuNvCkpbb900khms08wDO3YmQnD4XOTohj3Fq6dqwI/bY1ZVV3oYZPR
         5moto44N+HQJjXjuP6eVO+2IswRu38oRCMdEiDpl9p0vlUb2519vRpVMSlaOkGQui9dy
         91cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N3VTtTia;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f73si39670yba.86.2020.09.23.06.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 06:40:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N3VTtTia;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kL50D-0002LC-5d
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 09:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL4yq-0000di-VP
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 09:38:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL4yo-00061M-U4
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 09:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600868322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFPkbYxA6FaaMTGJYUsKcGN1xs97j6/u2JzPLhfib1Y=;
 b=N3VTtTiaFVLyJQ3bc4ZgLj/k8hbEDidg1q3Fptg1QRLVoPbDq9BcCBt9YE80k55j6sqV3V
 GbvGIPxkvQ0DzGlpjlDuyJWxaZ0ganCqLw02U1YXOOBZeRcnS95Wy6GiK35xpqPk9ckyxm
 +HXFjmoOHLHz4ROaXoemodIrgd7a8Gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-IwHhFhHRPsKkIfVh8Dmcsg-1; Wed, 23 Sep 2020 09:38:39 -0400
X-MC-Unique: IwHhFhHRPsKkIfVh8Dmcsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7B2F8ECE40;
 Wed, 23 Sep 2020 13:38:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-73.ams2.redhat.com
 [10.36.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9769E60BEC;
 Wed, 23 Sep 2020 13:38:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] qemu-options: document SMBIOS type 11 settings
Date: Wed, 23 Sep 2020 14:38:04 +0100
Message-Id: <20200923133804.2089190-4-berrange@redhat.com>
In-Reply-To: <20200923133804.2089190-1-berrange@redhat.com>
References: <20200923133804.2089190-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r+SXY67DPzfA

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 47f64be0c0..2cb034bce3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2296,6 +2296,8 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
     "                specify SMBIOS type 4 fields\n"
+    "-smbios type=11[,value=str][,path=filename]\n"
+    "                specify SMBIOS type 11 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
     "               [,asset=str][,part=str][,speed=%d]\n"
     "                specify SMBIOS type 17 fields\n",
@@ -2319,6 +2321,45 @@ SRST
 ``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]``
     Specify SMBIOS type 4 fields
 
+``-smbios type=11[,value=str][,path=filename]``
+    Specify SMBIOS type 11 fields inline
+
+    This argument can be repeated multiple times, and values are added in the order they are parsed.
+    Applications intending to use OEM strings data are encouraged to use their application name as
+    a prefix for the value string. This facilitates passing information for multiple applications
+    concurrently.
+
+    The ``value=str`` syntax provides the string data inline, while the ``path=filename`` syntax
+    loads data from a file on disk. Note that the file is not permitted to contain any NUL bytes.
+
+    Both the ``value`` and ``path`` options can be repeated multiple times and will be added to
+    the SMBIOS table in the order in which they appear.
+
+    Note that on the x86 architecture, the total size of all SMBIOS tables is limited to 65535
+    bytes. Thus the OEM strings data is not suitable for passing large amounts of data into the
+    guest. Instead it should be used as a indicator to inform the guest where to locate the real
+    data set, for example, by specifying the serial ID of a block device.
+
+    An example passing three strings is
+
+    .. parsed-literal::
+
+        -smbios type=11,value=cloud-init:ds=nocloud-net;s=http://10.10.0.1:8000/,\\
+                        value=anaconda:method=http://dl.fedoraproject.org/pub/fedora/linux/releases/25/x86_64/os,\\
+                        path=/some/file/with/oemstringsdata.txt
+
+    In the guest OS this is visible with the ``dmidecode`` command
+
+     .. parsed-literal::
+
+         $ dmidecode -t 11
+         Handle 0x0E00, DMI type 11, 5 bytes
+         OEM Strings
+              String 1: cloud-init:ds=nocloud-net;s=http://10.10.0.1:8000/
+              String 2: anaconda:method=http://dl.fedoraproject.org/pub/fedora/linux/releases/25/x86_64/os
+              String 3: myapp:some extra data
+
+
 ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
     Specify SMBIOS type 17 fields
 ERST
-- 
2.26.2

