Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1301314wrt;
        Tue, 11 Dec 2018 17:55:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VjwimaPyh5ZVlEWI5Tq7q9mtJ9Ymunerx+lXhEVvB/sl5IlDyAGylw3BWm89SnmCE8faL4
X-Received: by 2002:a37:360a:: with SMTP id d10mr16511247qka.40.1544579708102;
        Tue, 11 Dec 2018 17:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544579708; cv=none;
        d=google.com; s=arc-20160816;
        b=YTNx/55wPJhdfT8Crjcxpl8FkNI8RYxBbmrcA1fYGWHlLykghvCHySk57qgntpsK+k
         8xJ57dN8qmK0DNzDOPngeJtB8hDINEeQDjvezIyPPHc5MrzDAo7Eke7wY0ARDJqzRiYI
         K1Qr2oT4uA4uRLtkOYI8CunCKeAhOx/pCAocvQz40ci+5gQpRD9N4SstIrMAlIjB4g58
         uiCHrOHIztgjY8N35vFtYuNY+EHo9vNJ6KhlwvOV45QvFYH26yCYAaeNyvRHfogZ8tBw
         pxfwAWooAaf5j+p2UbNNe2OQK+XPXMocj6cOeBS5viqbKWqucKVp7vXXo2fnRC+201i0
         6Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=BgOL7r5p0ivwiDQq/Qyjp2Ihos8wjE64eKhM/LY9LxY=;
        b=oW7OYCpQDaRcftnovianwjGUJKkvgzSmu3bAe+3DxeZMjZnclS1541z9qLEQeu5kiI
         vX2qHAj+96l/nZkqlpFwzE9T2aW3mcTE8UW5HTaPxMwJYOvVap6n/swXYke2c/OyCe30
         sk4G1yb2lckUaNy115OsJNm9rv2L8mrVIJmuR4d5OG/RUlVwXVddQXXINXqD06i10IoZ
         pYZ7YO0hk9qmytfI179VqI8a1q5ybQL6BSWuGK5DoVUb8toNfCTepo1bSh/CWF2IJZGO
         jEvrsM90m7MHXjRzNB3aISCm16PoWELB0GZfMjPREwWDZf3ItMlrCh6P3PR37wRZEQCV
         tJIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2si3917339qtc.147.2018.12.11.17.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 17:55:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWtjv-0007mG-3E
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 20:55:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gWtjm-0007m9-UH
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 20:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gWtjh-0006Oo-AC
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 20:54:58 -0500
Received: from mx7.zte.com.cn ([202.103.147.169]:46670 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gWtjg-0006Lo-SY; Tue, 11 Dec 2018 20:54:53 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 39B2DEE1AB2BDB542EA0;
	Wed, 12 Dec 2018 09:54:43 +0800 (CST)
Received: from kjyxapp01.zte.com.cn ([10.30.12.200])
	by mse02.zte.com.cn with SMTP id wBC1sZbQ057761;
	Wed, 12 Dec 2018 09:54:35 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp03[null]) by mapi (Zmail) with MAPI id mid14;
	Wed, 12 Dec 2018 09:54:36 +0800 (CST)
Date: Wed, 12 Dec 2018 09:54:36 +0800 (CST)
X-Zmail-TransId: 2b055c106a5c2f4a096b
X-Mailer: Zmail v1.0
Message-ID: <201812120954362374357@zte.com.cn>
In-Reply-To: <20181210162048.zjio2dr7ffgntlfg@kamzik.brq.redhat.com>
References: 1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn,
	20181210162048.zjio2dr7ffgntlfg@kamzik.brq.redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <drjones@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wBC1sZbQ057761
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.169
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_V12_0/5=5D_add_pv?=
 =?utf-8?q?panic_mmio_support?=
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i3wd2UgLCzgd



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pj4gdjExIC0tPiB2MTIKPj4gICAgICByZWFsaXplIHB2cGFuaWMgYXMgYSBwY2kgZGV2aWNlIGFu
ZCB1c2UgdGhlIG1taW8gb2YgcGNpIGRldmljZS4KPgo+RG8geW91IGhhdmUgYSBwb2ludGVyIHRv
IHRoZSBrZXJuZWwgcGF0Y2hlcz8KPgo+VGhhbmtzLAo+PmRyZXcKPgpJJ20gc3RpbGwgc29ydGlu
ZyBvdXQgdGhlIGNvZGUgZm9yIHRoZSBrZXJuZWwgcGFydCwgYW5kIEkgaGF2ZW4ndCBzdWJtaXR0
ZWQgYSBwYXRjaCB5ZXQu


--=====_003_next=====--

--=====_001_next=====--

