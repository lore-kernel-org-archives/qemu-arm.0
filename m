Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp581416wrt;
        Mon, 26 Nov 2018 16:47:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5earstMcuG0zzF/y/s8TMmq9ZOLE9+0kt+LwScFrTd72aqWg/lF+YPsB/CqW9pGMqL+GGiq
X-Received: by 2002:a81:a311:: with SMTP id a17-v6mr31836064ywh.240.1543279654266;
        Mon, 26 Nov 2018 16:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543279654; cv=none;
        d=google.com; s=arc-20160816;
        b=zMZsUlS1g0KIAXwZ0ciDFX8q8k4+qsKZQQO/Mdn58cVri7Q4TI9F4RJcHM9ci3UoAI
         gDK4izkrRgm4PuXUmhR5gNkqy0VeXi/E8Z/2YpwUoPrk8KC1g0AVomCNBd3aDdfcK6AZ
         9cw/Xn8uv6OgEGCVDUb5DmsiW1KXzbAc1T6yfzUVmgFj+TduZA5hEDV9Ll91Ltyz0ju2
         vaJcyedSELkrZySFr9X0EI2o9Ab5EI8MEr2NbUFgfgx5zTKPhDf7/gzWqYL/Sd1yPe2M
         HxEY7q16x2qqpgCJZLTgeFfZn2pJjxsoHkjIskx5CDA7NFwPe8d8pU1D7NKT03exz5kr
         Ez8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:mime-version
         :references:in-reply-to:message-id:date;
        bh=evTzWFZyBMKZEQmxv7FKf+tYAY2kT2FFRdhdM4vrcuo=;
        b=Czl3GqP2nI+rLcYha/y+ADXvGYJegCi422QHkk9q7UgngvQaDSgHtOqIzVq03+pVDK
         5LzGTJWM792Lyboc89o37lykCFOZfJLkusWahaIJs7qROTr2zQ8S35x/R7ZcUlYtIkT7
         YII/dKJHsoMVhLkw6W/mSY2HDguKUKNSG4WUBHpzCmh0SnNWp2pT9sOLMiRzrubIZrFF
         xW3QWKW5h3TvupxQ37ipXgyKPq1pPU+VKj2DuGX1S1SkA0PhWghtGYb4rBQzTatCPqfp
         p1kceHLyzVsJPS8Ah+Nt7uuuzGqksTB/H1OGphHj5uoXhi2TXHKMnbIPkER0pPnreAdV
         UDDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2-v6si1523450ybk.262.2018.11.26.16.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 16:47:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRRXJ-0004T3-Nl
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 19:47:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRRUn-0000wU-3x
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 19:44:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRRGM-0001hU-7m
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 19:30:06 -0500
Received: from mx7.zte.com.cn ([202.103.147.169]:37412 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRRGL-0001dT-TX; Mon, 26 Nov 2018 19:30:02 -0500
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
	by Forcepoint Email with ESMTPS id 4FE77C73C682F17649CA;
	Tue, 27 Nov 2018 08:29:57 +0800 (CST)
Received: from kjyxapp02.zte.com.cn ([10.30.12.201])
	by mse02.zte.com.cn with SMTP id wAR0TsZM066246;
	Tue, 27 Nov 2018 08:29:54 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from mapi (kjyxapp05[null]) by mapi (Zmail) with MAPI id mid14;
	Tue, 27 Nov 2018 08:29:55 +0800 (CST)
Date: Tue, 27 Nov 2018 08:29:55 +0800 (CST)
X-Zmail-TransId: 2b075bfc9003d712f36a
X-Mailer: Zmail v1.0
Message-ID: <201811270829554678209@zte.com.cn>
In-Reply-To: <48580284-d439-456b-2c6a-a10c0a9280ea@redhat.com>
References: 1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn,
	48580284-d439-456b-2c6a-a10c0a9280ea@redhat.com
Mime-Version: 1.0
From: <peng.hao2@zte.com.cn>
To: <eblake@redhat.com>
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL: mse02.zte.com.cn wAR0TsZM066246
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.169
Subject: Re: [Qemu-arm] 
 =?utf-8?q?=5BQemu-devel=5D_=5BPATCH_V9_9/9=5D_pvpanic?=
 =?utf-8?q?_=3A_update_pvpanic_document?=
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
X-TUID: AggDe+Sv2bmL



--=====_001_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

Pj4gQWRkIG1taW8gc3VwcG9ydCBpbmZvIGluIGRvY3Mvc3BlY3MvcHZwYW5pYy50eHQuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBlbmcgSGFvIDxwZW5nLmhhbzJAenRlLmNvbS5jbj4KPj4gLS0tCj4+
ICAgZG9jcy9zcGVjcy9wdnBhbmljLnR4dCB8IDE1ICsrKysrKysrKysrKystLQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZG9jcy9zcGVjcy9wdnBhbmljLnR4dCBiL2RvY3Mvc3BlY3MvcHZwYW5pYy50eHQKPj4g
aW5kZXggYzdiYmFjYy4uNjdmNTU5MSAxMDA2NDQKPj4gLS0tIGEvZG9jcy9zcGVjcy9wdnBhbmlj
LnR4dAo+PiArKysgYi9kb2NzL3NwZWNzL3B2cGFuaWMudHh0Cj4+IEBAIC0xLDE0ICsxLDE4IEBA
Cj4+ICAgUFZQQU5JQyBERVZJQ0UKPj4gICA9PT09PT09PT09PT09PQpbLi4uXQo+PiArV2hlbiBw
dnBhbmljIGRldmljZSBpcyBpbXBsZW1lbnRlZCBhcyBhIElTQSBkZXZpY2UsIGl0IHN1cHBvcnRz
IElPUE9SVAo+PiArbW9kZS4gU2luY2UgUUVNVSB2My4yIHB2cGFuaWMgYWxzbyBzdXBwb3J0cyBN
TUlPIG1vZGUsIGl0IHdpbGwgYmUKPgo+VGhlIG5leHQgcWVtdSByZWxlYXNlIHdpbGwgYmUgNC4w
LCBub3QgMy4yLgo+CgpJIHdpbGwgY2hhbmdlLgoKPj4gK2ltcGxlbWVudGVkIGFzIGEgU1lTQlVT
IGRldmljZS4KPgo+R3JhbW1hciBzdWdnZXN0aW9uOgo+Cj5UaGUgcHZwYW5pYyBkZXZpY2UgY2Fu
IGJlIGltcGxlbWVudGVkIGFzIGFuIElTQSBkZXZpY2UgKHVzaW5nIElPUE9SVCksCj5vciwgc2lu
Y2UgcWVtdSA0LjAsIGFzIGEgU1lTQlVTIGRldmljZSAodXNpbmcgTU1JTykuCj4KCkl0J3MgZmlu
ZS4gCnRoYW5rcy4KCj4+ICsKPj4gICBJU0EgSW50ZXJmYWNlCj4+ICAgLS0tLS0tLS0tLS0tLQo+
Cj4tLQo+RXJpYyBCbGFrZSwgUHJpbmNpcGFsIFNvZnR3YXJlIEVuZ2luZWVyCj5SZWQgSGF0LCBJ
bmMuICAgICAgICAgICArMS05MTktMzAxLTMyNjYKPlZpcnR1YWxpemF0aW9uOiAgcWVtdS5vcmcg
fCBsaWJ2aXJ0Lm9yZw==


--=====_003_next=====--

--=====_001_next=====--

