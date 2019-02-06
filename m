Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6070551wrt;
        Wed, 6 Feb 2019 07:29:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYAT02adPXqWYZZ2ZOGsQTekz0WTVt/xwfbAzcQxumEXkSLkmRlOGrcUcrtRajNCBBJaieA
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr8044922wrs.86.1549466962201;
        Wed, 06 Feb 2019 07:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549466962; cv=none;
        d=google.com; s=arc-20160816;
        b=g6l2N1f4Vyra0SgioLY0iWtSXMVPPu+QdLJZoEiNYLiPeFzIz+qwXVz0DBpX9+STmC
         6KdTY0CcMdaOa0wr/5bTt4Jd3/3HLTQefFP0X8JmnaLlop5vNCtDvsdy+MOPjqVnKgWG
         nDd8aoC1Pa/gHkp0FBzR5R0aJ1kxSKnCaHh3JYqiy9Dxl5+LDdoOoF3MPei0RiXzgAqF
         aFsTeF95lGZo9Z1q4xF6O6eyL48+MGOgdz59w4jjAW9qjISMiDbn/+BPDD6x40ajZ0gv
         unTFUITaQkXZ5TiHVrEWbhbS0BIaMjks0Yt52Tp6a/pa4BF6DjZpnCckeo/IK08hC+rY
         9ETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+iEU9ktImVcmEA9vczpJG6zlNK6xvxuJ2pvgBzFuaw4=;
        b=Lj9HdM+qlpuGqULjZlx+0cHHDjmT+YY6weAEXHpGOfLcRaDJxrkf38oOZng96GBb4o
         3DKVHP67aOEcxCYRcz0C7N32abuyeYDhjTBegGgeHlApfLcqGjIXjIbN8LXLsNGQWYgO
         pXd5JPwzW+o5rmY/pHf892+mkSEOIC17vJaCIJRvF+qkAztzgLayEC7PIdyRAfoEtJbf
         cIwpidvk+YP99nruuPXwMUNU8g9WPhr4+RcILCQYIUA3K72fF9geVW0joT9QDsmMfiQv
         k8pAGmmMY9LZwQMwykUngxFgC9F9J04jqfm+IsYd8Hjc4UXa6U0cfe9x74YtWfBUjXz9
         Zkow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u62si12767621wme.199.2019.02.06.07.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 07:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grP8b-0000ew-6C
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 10:29:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP80-00007F-5W
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grP7y-0004Ok-3b
	for qemu-arm@nongnu.org; Wed, 06 Feb 2019 10:28:43 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:39701)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grP7w-0004Mn-5i; Wed, 06 Feb 2019 10:28:42 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MGQaz-1guuhR0FnZ-00GroH; Wed, 06 Feb 2019 16:28:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed,  6 Feb 2019 16:28:06 +0100
Message-Id: <20190206152807.31896-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
References: <20190206152807.31896-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iH7TvnHM38z1/6cxlo1cF6tH0prcGWKywSJfD6wk1p6glvnKHGo
	+f41ev8cv64xgJLwtLFO3TLWh4Wf9XJnFZJV2JsUPwnAgO7e/FXcB1U5sH8JuMnQ6OqR6Vx
	4BBAxGLBeEQ26ZG5ly50DvbdQP0hu9ukvJx4PJMBiEAOhp23Kz4z2tE7bSuVzETs8s13WZO
	E9Nu7k3xIawLVYOLvfQyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wS66bhI8fKI=:hpycvEs1pT+hfG2C6EnRXG
	YuXez5QyOm8WVGa8+ub9Kv17A0SQJbeMqkzgvqKkq9ICSdN47t5HweOr+YtJl8vzw6R7EJ/P+
	qyd91ZBlbcZMqUE/tI1ytk2ib9GWCQUiPNLnDGN41GximCxwANRIlab59aUSWNRzqx9D3powh
	WNmDqr9G2A2QFfhpilU4D8gd6mNxKvuC24hmJRvKdNsq7QWG4/wtZ2jwigb6e+F8zQWrtz3Li
	MdeXISdJerTqYxcpSH82wFro3EMMbnE3i5hvLjegz2wQJFS1P8s9q1mQD9NQTcM58W4R3/iIY
	j0oMcn3fa/LJSizR6QFJxYztbpHjdpm6JGB3hBXwqXeQa6X76AMxTKkIUTkRPZCjUHGbBTZ3V
	FfAw3nnIs+MA66pqps0OOKN4ppOWMJtA1jUYK7FBxgjQ3EFXxpeM8tOnwEqAgAWYPfphQnA8L
	oGwTE9gAg0ZqszaLSfZX3tp0PZidBNDEYXIbLdCjIXcZPLiYyKFWQBt8GGUW8qEQF4cjs7j4S
	EE6xEmqrikwqM3hqHMM/YnIR62TbgIlSBuWxnJfhyHOTV2DH5CFhNfbTririLFL50hxrBxlaA
	Q0zhrRnERz8h7UA8Dc9P70Sd0bW4hVdMhUYMyAjW+Tvb13i568T1CbEPh1MhPxV1ehbBhovrW
	ivqMLqi36RxhQpHT5TxTHqe3PCw75k4coo6s0OTURLyhMEUBYTo+ALQ9cZ3KeLKl8mB5DwMI8
	Kc6ntktSLKZsF2a06X2z2+cwEaa0VqHn2VTm3tchOCe3b4CNtPvzxx44VwE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-arm] [PULL 6/7] hw/cpu/cluster: Mark the cpu-cluster device
 with user_creatable = false
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Luc Michel <luc.michel@greensocs.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQyltRj4vdne

From: Thomas Huth <thuth@redhat.com>

The device can not be instantiated by the user and QEMU currently
aborts when you try to use it:

$ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
 Assertion `cbdata.cpu_count > 0' failed.
Aborted (core dumped)

Since this is an internal device only, mark it with user_creatable = false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/cpu/cluster.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 25f90702b1..6f5f037b3c 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 
     dc->props = cpu_cluster_properties;
     dc->realize = cpu_cluster_realize;
+
+    /* This is not directly for users, CPU children must be attached by code */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cpu_cluster_type_info = {
-- 
2.20.1

