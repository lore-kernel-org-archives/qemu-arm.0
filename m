Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152381wrq;
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL0vG8zhJuxcfRlrESU+RiOi+UXtnsDCqsnCZ+IKKPaMORUrSduNpcYn4W7p3OSAWJ5bGoR
X-Received: by 2002:a37:444c:: with SMTP id r73-v6mr2609871qka.351.1528800300004;
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800300; cv=none;
        d=google.com; s=arc-20160816;
        b=dpY2DmtO93i4LC3WgI9beDPwmQ3ElSTEyrGbuoIBET0dKCse5NI6fBi5l74GWbqUbA
         bFtaCDSy7x5+aAyyumhcUJTmJKV58OUJPESnX780PNwj5uHmMKnFhfqnldOvqlVst5JZ
         k55+uCNdUSvcozpZ29hpcXOk7IEG2Z2xKBT0ifbNnjJQ4WXydtVObNCE4kt/MUxSqbNO
         WbH8fTmDOuaXvRjPk0QQ0JxbQkYSEVrb2nyTOpD3MpP8xd4O/5HvBKelDGwSBtB6DFxE
         lSNIcLYLAmksPHFMw2Q38Yv8aMYUs0BkgREfTKP0SIAERgKAXVncMpv3qBoKq0bn84aZ
         g1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BHxqy+ZIEGsXIHjHWI/lrdrJjGTNDbq8siKexpztT/s=;
        b=eM8824+kgrvTbrvzyaMydVp6Ik6nsoPtzac8Ls9CKq+Dca1a21S4+FnUF7ehfVTp+Q
         jhyfwX0vQp7nReYUXe3qodRZHup/cKjOtCaV7+e3uB+aAbm4sI1G8rB7pu5nqXyPMOB3
         UsFX/8xBLJJZ2OxR0yMH7aSknAysrSfd9U+SQwCb5FjuiiIqXytdLdKixFuG11gOADLp
         5fA9j2cn5cEKPN8FPlaYtisbLt1DYTc4tXrc9bqDwQCntZ/1ou95opQvbWYHvm4USU2Q
         ypRHfCaw8lZ1ykj+HrNw3OrOAgZ/On0234Cn48CQ159VjGPxJb89zCx/iLZB7q0Sb4dC
         QWtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m55-v6si295033qtc.214.2018.06.12.03.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnL-0002oo-FX
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmy-0002nf-7i
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmw-0007sW-3h
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41628 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmv-0007s8-VA; Tue, 12 Jun 2018 06:44:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59653401EF23;
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 162822024CA1;
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B82E8422FF; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:29 +0200
Message-Id: <20180612104430.25745-8-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 7/8] usb-hcd-xhci-test: add a test for ccid hotplug
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MiEXeKvc9eO3

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20180531195119.22021-5-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/usb-hcd-xhci-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/usb-hcd-xhci-test.c b/tests/usb-hcd-xhci-test.c
index 9c14e3053a..5b1b681bf2 100644
--- a/tests/usb-hcd-xhci-test.c
+++ b/tests/usb-hcd-xhci-test.c
@@ -35,6 +35,15 @@ static void test_usb_uas_hotplug(void)
     qtest_qmp_device_del("uas");
 }
=20
+static void test_usb_ccid_hotplug(void)
+{
+    qtest_qmp_device_add("usb-ccid", "ccid", NULL);
+    qtest_qmp_device_del("ccid");
+    /* check the device can be added again */
+    qtest_qmp_device_add("usb-ccid", "ccid", NULL);
+    qtest_qmp_device_del("ccid");
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -44,6 +53,7 @@ int main(int argc, char **argv)
     qtest_add_func("/xhci/pci/init", test_xhci_init);
     qtest_add_func("/xhci/pci/hotplug", test_xhci_hotplug);
     qtest_add_func("/xhci/pci/hotplug/usb-uas", test_usb_uas_hotplug);
+    qtest_add_func("/xhci/pci/hotplug/usb-ccid", test_usb_ccid_hotplug);
=20
     qtest_start("-device nec-usb-xhci,id=3Dxhci"
                 " -drive id=3Ddrive0,if=3Dnone,file=3Dnull-co://,format=3D=
raw");
--=20
2.9.3

