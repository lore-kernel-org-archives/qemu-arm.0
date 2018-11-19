Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1496921wrt;
        Mon, 19 Nov 2018 15:46:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5dxYtJOEnaqjHxstXUVv/s4YTPseZ1f1amYUAFfw0q9ECGVp2wokLnEmTz4HQgMrTVilOzO
X-Received: by 2002:a81:3150:: with SMTP id x77mr16167756ywx.180.1542671205795;
        Mon, 19 Nov 2018 15:46:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542671205; cv=none;
        d=google.com; s=arc-20160816;
        b=z6/rDXMCRAN0uwJ5Tb1IUVDLcmVB9aNtW/eCARrvgTR4s+nZscNiKm1Z4w5s/K0fVH
         juPyDiBmbutFC+sRS6oW9J4K4JIWox8qfQZfje0uR6+ssKgOx4+8OEUNCJdTyOv+vdF9
         3exs+iymObyAP5Z6IjR3YjMJVDUBmMY1W6YRRpS1VpIRrGVEzLD5KS7V0uWoZoKVZ8q0
         t5T0DO6k0rjj+Mx7vKhp2vyddmJs72VXWdwoXDuzz+kKEiJS+Rz1GcMZSIlszuaV6QSh
         8AgG1fn5JVpGVHtkQE4KgUntWd+C60JOBwNBoaIlZQXBTVT8C1MTWoba9SXILalQdshT
         8t7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=WacBpSXTGVag3R7QfmsDHOY3Ltxakzua/Yf8xfkVs+E=;
        b=p/FTeaJaqFKC5LNuKVxIjz3GLM7YiRD6Mj6+g4ZUHkFSbN/ZKmDxLifOiXRORzrkKa
         6qExLg7fT+HmBQCHG4uOC+U2oK10t+JCpy2IL+5kWfJR4VbOQGZBabIqAac8hSRs+Oyj
         4l+H/y2o06o1AkwbSSl4bMB+01kjBL1w4jeyzUGwZCN2/o466BPrVFbqMBR1Z6FBU600
         n+AmqpWZjHWlfaI616c+xCVOPlquU+5ihErtcKLMWdEwZgtaj29HqpEn1nbmTd1NgEun
         7pLMauLo29WGwFEarW4T6b1NjDHK375+5RI4v9Ea6f8yWc815rV/Mp+uD1dUqa/1w7Ov
         wT2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=ed8404z8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t129-v6si25273821ywc.416.2018.11.19.15.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 15:46:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=ed8404z8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:59508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOtFd-0004YI-9A
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 18:46:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1gOtFV-0004Xp-Gb
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 18:46:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1gOtFQ-0008FQ-Gt
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 18:46:37 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:46551)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1gOtFQ-0008EZ-BK; Mon, 19 Nov 2018 18:46:32 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32c1430c;
	Mon, 19 Nov 2018 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:from:date:message-id:subject:to:content-type; s=mail; bh=GZac3l
	9h+dj0S0shsvm4g+9RmM0=; b=ed8404z8egGemhBhRXm1vTAZ2EwhXoKpaTuEE1
	R/Eerqa3cqBz0ZhYwc8m3FKV63KzXcwo7cqf1pP3xx8ACyG7HaK7IlCmRz/N63aw
	UbGLiNjt+YnqBFhbr2CoQhoVIkYGGkaUEz+xah57N2v0lFUZy/Xw8mr+sbVFZcH2
	myPnWEsiAlnCmIJlbYeRhjO/+mK0HOrNMQsNDTm3RZxuV/feIlOw++njsztqJ/r+
	m/yf41b9LqGEMAJTnYuiFbNIG73CAjRTwT5D5LTK4V84hS4+E7LxuKq5W/mbJoaS
	0DesOv4uN1BJXbqmHji9EFw24BCTf7thrdsT1oAjFZHCawKw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6b8631dd
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
	Mon, 19 Nov 2018 23:40:27 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id v6so76402oif.2;
	Mon, 19 Nov 2018 15:46:30 -0800 (PST)
X-Gm-Message-State: AGRZ1gKmg8t5UNUQprIXhXmWFEfuxYtSpERDy4M01OA8um2BZYuKqivP
	rWUc0kLqGRCIIuHUwIQesydA9UTcGYmq9+6f1o0=
X-Received: by 2002:aca:c650:: with SMTP id w77mr7660249oif.122.1542671189797; 
	Mon, 19 Nov 2018 15:46:29 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Nov 2018 00:46:18 +0100
X-Gmail-Original-Message-ID: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
Message-ID: <CAHmME9qhe0ZemTkc2jkEO=_hu6PhvKUKGHC9QYTj2j+QHhNf8g@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/mixed; boundary="00000000000046243d057b0d209f"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.95.5.64
Subject: [Qemu-arm] more serial ports on arm?
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jhHBPVUGDeef

--00000000000046243d057b0d209f
Content-Type: text/plain; charset="UTF-8"

Hey guys,

I sort of lost track of the discussion, but what ever happened to
adding an extra serial port to the arm virt machine? I'm still
carrying around the attached patch to run build.wireguard.com and I'd
of course like to see a real solution upstream.

Jason

--00000000000046243d057b0d209f
Content-Type: text/x-patch; charset="US-ASCII"; name="virt-serial-ports.patch"
Content-Disposition: attachment; filename="virt-serial-ports.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jooykdm00>
X-Attachment-Id: f_jooykdm00

ZGlmZiAtcnUgcWVtdS0zLjAuMC9ody9hcm0vdmlydC5jIHFlbXUtMy4wLjAtbW9kaWZpZWQvaHcv
YXJtL3ZpcnQuYwotLS0gcWVtdS0zLjAuMC9ody9hcm0vdmlydC5jCTIwMTgtMDgtMTQgMjE6MTA6
MzQuMDAwMDAwMDAwICswMjAwCisrKyBxZW11LTMuMC4wLW1vZGlmaWVkL2h3L2FybS92aXJ0LmMJ
MjAxOC0wOS0xNCAxMTo0ODozMS45MTQ3NzIyOTQgKzAyMDAKQEAgLTY3MiwxMyArNjcyLDcgQEAK
ICAgICBxZW11X2ZkdF9zZXRwcm9wKHZtcy0+ZmR0LCBub2RlbmFtZSwgImNsb2NrLW5hbWVzIiwK
ICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9ja25hbWVzLCBzaXplb2YoY2xvY2tuYW1lcykp
OwogCi0gICAgaWYgKHVhcnQgPT0gVklSVF9VQVJUKSB7Ci0gICAgICAgIHFlbXVfZmR0X3NldHBy
b3Bfc3RyaW5nKHZtcy0+ZmR0LCAiL2Nob3NlbiIsICJzdGRvdXQtcGF0aCIsIG5vZGVuYW1lKTsK
LSAgICB9IGVsc2UgewotICAgICAgICAvKiBNYXJrIGFzIG5vdCB1c2FibGUgYnkgdGhlIG5vcm1h
bCB3b3JsZCAqLwotICAgICAgICBxZW11X2ZkdF9zZXRwcm9wX3N0cmluZyh2bXMtPmZkdCwgbm9k
ZW5hbWUsICJzdGF0dXMiLCAiZGlzYWJsZWQiKTsKLSAgICAgICAgcWVtdV9mZHRfc2V0cHJvcF9z
dHJpbmcodm1zLT5mZHQsIG5vZGVuYW1lLCAic2VjdXJlLXN0YXR1cyIsICJva2F5Iik7Ci0gICAg
fQorICAgIHFlbXVfZmR0X3NldHByb3Bfc3RyaW5nKHZtcy0+ZmR0LCAiL2Nob3NlbiIsICJzdGRv
dXQtcGF0aCIsIG5vZGVuYW1lKTsKIAogICAgIGdfZnJlZShub2RlbmFtZSk7CiB9CkBAIC0xNDk3
LDExICsxNDkxLDExIEBACiAKICAgICBmZHRfYWRkX3BtdV9ub2Rlcyh2bXMpOwogCisgICAgY3Jl
YXRlX3VhcnQodm1zLCBwaWMsIFZJUlRfU0VDVVJFX1VBUlQsIHN5c21lbSwgc2VyaWFsX2hkKDEp
KTsKICAgICBjcmVhdGVfdWFydCh2bXMsIHBpYywgVklSVF9VQVJULCBzeXNtZW0sIHNlcmlhbF9o
ZCgwKSk7CiAKICAgICBpZiAodm1zLT5zZWN1cmUpIHsKICAgICAgICAgY3JlYXRlX3NlY3VyZV9y
YW0odm1zLCBzZWN1cmVfc3lzbWVtKTsKLSAgICAgICAgY3JlYXRlX3VhcnQodm1zLCBwaWMsIFZJ
UlRfU0VDVVJFX1VBUlQsIHNlY3VyZV9zeXNtZW0sIHNlcmlhbF9oZCgxKSk7CiAgICAgfQogCiAg
ICAgdm1zLT5oaWdobWVtX2VjYW0gJj0gdm1zLT5oaWdobWVtICYmICghZmlybXdhcmVfbG9hZGVk
IHx8IGFhcmNoNjQpOwo=
--00000000000046243d057b0d209f--
