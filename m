Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7853536wrw;
        Thu, 15 Nov 2018 20:32:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5fUnFLXu9s5n0Plwp0oYnloAxUX7JOWskkLJZLiQS5v3Tf6xPoRfhq4zl/xXqgTkqpV169L
X-Received: by 2002:ac8:2502:: with SMTP id 2mr8812556qtm.53.1542342721624;
        Thu, 15 Nov 2018 20:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542342721; cv=none;
        d=google.com; s=arc-20160816;
        b=xijNhTM938TY9ot8SQ0TKzCqhjstbMmTmaXUAJLf2hYThk2RLxNIYZlWUk5rQFBQ7W
         CiWHqGdVeD2Owv8jL3Cp+cCBBw4PxGqNfOGljHsCEEMTf18c65jbtof08c4U+Q4lQvPQ
         F4Q1fHvx1IHnsQQEgiiHkxdqsG3yllE6NZHPCEG7yiep69JFrLhmAq4QoFqEsb3I1IAO
         1kQQf1wvZTE/QjVVaa9La9jPty/XXJb9HjyqQRb8EbkVO1pra1uyqXKla+njCzsWhvXo
         rc4nbfnkhSH/SymWVAFB54V+tf9Y0JUmlQlQb6bZDS30U47yYKEKvb03dzuXCkRsEv0P
         x6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=nAAbjcpNFi/NKzViundycx6ZRGNW/4o7C5Q0Ew5RYXI=;
        b=oTo9qkmsOtKyYY/rY3QZO6dfIRKQQK+NI1+CSobCDgz9CWw+UYXWl4KLioBcRg44kG
         BkiRi26XDeXdj2mN+1d0AGIzbyE4/YX1E7Y2o8hm5sW3pW4xIVKDzsuhVr+8X5uVEUQ7
         yif0zUAAkmgDACBcsz33VF/u1nk+zit0OLgfC1grqpou/lK2rZt9pfeol/vItTmUTBTZ
         pgbLrLZ1X3X0aysUAIVlO749pGSBfSrz4XyCZ29GTqEchMF35M5hzFzqxO8sTvABJ8TZ
         AVBOJgkA0oOGbZK8xXSKF9t0tNwJFYRCdiewn/UvpBJ2IrBZpOIFBrJ0rBL2shEV5men
         Hy8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si29926qtd.29.2018.11.15.20.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 20:32:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNVnV-00039v-3W
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 23:32:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNVnN-00039n-Oq
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 23:31:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gNVnK-0005S7-Lf
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 23:31:53 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:57734 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gNVnK-00057i-A1; Thu, 15 Nov 2018 23:31:50 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 41B16275841426FEFB48;
	Fri, 16 Nov 2018 12:31:23 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
	by mse01.zte.com.cn with SMTP id wAG4VHwf090795;
	Fri, 16 Nov 2018 12:31:17 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Fri, 16 Nov 2018 12:31:18 +0800 (CST)
Date: Fri, 16 Nov 2018 12:31:18 +0800 (CST)
X-Zmail-TransId: 2b055bee481689763375
X-Mailer: Zmail v1.0
Message-ID: <201811161231180773533@zte.com.cn>
In-Reply-To: <28d47b6b-acfd-3e24-2926-84e9fffee6c8@gmail.com>
References: 1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn,
	28d47b6b-acfd-3e24-2926-84e9fffee6c8@gmail.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <shannon.zhaosl@gmail.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse01.zte.com.cn wAG4VHwf090795
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BPATCH_V7_4/6=5D_hw/arm/virt=3A_Use_the_p?=
 =?utf-8?q?vpanic_device?=
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rhUEd5S8C+j3



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PkhpLAo+Cj5PbiAyMDE4LzExLzE2IDE4OjUwLCBQZW5nIEhhbyB3cm90ZToKPj4gICBBZGQgcHZw
YW5pYyBkZXZpY2UgaW4gYXJtIHZpcnQgbWFjaGluZS4KWy4uLl0KPj4KPj4gKyAgICBjcmVhdGVf
cHZwYW5pY19kZXZpY2Uodm1zKTsKPj4gKwo+SXQgc2hvdWxkIG5vdCBjcmVhdGUgcHZwYW5pYyBi
eSBkZWZhdWx0LiBJdCBzaG91bGQgYmUgY29uZmlndXJhYmxlIHZpYQo+LWRldmljZSBwdnBhbmlj
Lgp5ZWFoICxpdCBpcyBhIHByb2JsZW0uIEkgd2lsbCByZXNvbHZlIGl0LgpUaGFua3MuCj5UaGFu
a3MsCj5TaGFubm9u


--=====_003_next=====--

--=====_001_next=====--

