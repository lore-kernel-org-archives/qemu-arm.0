Received: by 10.25.205.13 with SMTP id d13csp179597lfg;
        Fri, 13 Jan 2017 04:36:07 -0800 (PST)
X-Received: by 10.233.216.7 with SMTP id u7mr17497797qkf.220.1484310967056;
        Fri, 13 Jan 2017 04:36:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si8320651qtw.163.2017.01.13.04.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jan 2017 04:36:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cS15S-000618-HD
	for alex.bennee@linaro.org; Fri, 13 Jan 2017 07:36:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cS14e-000607-U0
	for qemu-devel@nongnu.org; Fri, 13 Jan 2017 07:35:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cS14e-0006QP-76
	for qemu-devel@nongnu.org; Fri, 13 Jan 2017 07:35:16 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cS14e-0006Q0-1A
	for qemu-devel@nongnu.org; Fri, 13 Jan 2017 07:35:16 -0500
Received: by mail-vk0-x230.google.com with SMTP id x75so32350832vke.2
	for <qemu-devel@nongnu.org>; Fri, 13 Jan 2017 04:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=ivEOU0TN7Fje0hN5q81zvarAfE7Eld+f1zt0hHuB15I=;
	b=HdbKgjQZ0eO6x7MbJkewgZ3ee9W9Od6W6NvyYGmbODfkZzoNiJfkI44LCo6bVf3qmW
	3sA7ELewyWavGnzYe6afO72L1IF1L5CRETZN6Zz3R9neqzwzWw0+viJo8us/7DYox2kf
	hahBZIwNTU3PNGQi1nXlZQYSMVYFrw7XohATE9R6IwEIwExvgmfWl334Dm0rgPFEOHEF
	Ux00UkMLTAh3FID3ISXOsZ+ebHi3h3Gvi02n2zZL82nSyW4yv2mmb2OO66eEyiFlztcb
	oX2rV61O6urxZKKPovnSve/lMMSnt5q+4v0CRygPwXRz7r6aTWt3LqiWu7R3vd5CAJ6T
	lvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ivEOU0TN7Fje0hN5q81zvarAfE7Eld+f1zt0hHuB15I=;
	b=l5/FNxfkzrMBMKIw8qdyUXfTBmWRsYbIscQwN9PkcsvBk0ziBr8hluGD8864DBJFtv
	39NGDDGdLp8q8cUkrxXXoeYQVBxECD18OEqf++yU0GOZ86UQz1R+Z0avqqUqNx1NQL4g
	NxSL8rXS7z+5nibP6MXBTN7RTUYWhKUjm9T1Ui41PZG67oJBfUCualZCfiJsM2yudYFL
	OSUb1CEF7/p83vPTjUBOel9JMsN0YmDClfMYy6YzQEiKYs3gurYqq5nvhsLI9G4Lsi+x
	gaS/54Fk+u+kyf0LqWV1Tkm4TvqlPuDb5kyFg5417jqU0HhXUaVTSIUO1r7odTlbbvUa
	fGIA==
X-Gm-Message-State: AIkVDXK3IPpO0dPJ1ZKe/tufhuLwJ7Zne5Vr68xzbtfIT6aN7Sq4YNoinfYKjm75fxNbqcjYqYwdKmvf2Joa6w==
X-Received: by 10.31.95.73 with SMTP id t70mr9436481vkb.49.1484310914990; Fri,
	13 Jan 2017 04:35:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.125.151 with HTTP; Fri, 13 Jan 2017 04:35:14 -0800 (PST)
From: James Hanley <jhanley@dgtlrift.com>
Date: Fri, 13 Jan 2017 07:35:14 -0500
Message-ID: <CAF++6AOnuOzwiiPRJEGatzX7LuoJKU5ij2xWRLkKbxhytJscqA@mail.gmail.com>
To: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] system_clock_scale unset in hw/intc/armv7m_nvic.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTepZQbbwjEO

How should system_clock_scale be set in hw/intc/armv7m_nvic.c - there is no
API for the global, and I've defaulted the global to SYSTICK_SCALE which
seems to work, but is not obvious.  This was needed as this value was set
to zero and the arm firmware was selecting the external clock source
causing zero to be returned from systick_scale() and the interrupt to run
continuously.

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 06d8db6..c15841e 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -70,7 +70,7 @@ static const uint8_t nvic_id[] = {
 #define SYSTICK_CLKSOURCE (1 << 2)
 #define SYSTICK_COUNTFLAG (1 << 16)

-int system_clock_scale;
+int system_clock_scale = SYSTICK_SCALE;

 /* Conversion factor from qemu timer to SysTick frequencies.  */
 static inline int64_t systick_scale(nvic_state *s)
