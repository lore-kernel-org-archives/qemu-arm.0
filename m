Received: by 10.80.163.71 with SMTP id 65csp475921edn;
        Fri, 30 Sep 2016 16:20:08 -0700 (PDT)
X-Received: by 10.55.72.212 with SMTP id v203mr9526119qka.291.1475277608630;
        Fri, 30 Sep 2016 16:20:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s26si5079491qki.249.2016.09.30.16.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 16:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47543 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bq768-0000md-2f
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 19:20:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq764-0000lO-89
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 19:20:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq762-0006fU-CM
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 19:20:03 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:33919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq762-0006eu-86
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 19:20:02 -0400
Received: by mail-ua0-x232.google.com with SMTP id l16so88671172uaa.1
	for <qemu-arm@nongnu.org>; Fri, 30 Sep 2016 16:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TMxTuz4vYqHm5LkBgrjb0jBTyDJr33/4IVsehL3doLg=;
	b=dJw7IDmvLa11XQ4dLx0iAvgb0olVY0xFoAJUwmd1hB79GItb+gDkTLO7JxfYYyQR/V
	Y5u/tpd3LSAZXHrAtC0Z9NuYN5n3rbdqeJaquh/LI4SoFKHSURHR58rCAMIS8+BDt7bl
	keeOO0VPw80jzYCq4NxHB8UrcoZK3v+oi6rsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TMxTuz4vYqHm5LkBgrjb0jBTyDJr33/4IVsehL3doLg=;
	b=HHfPledx7IZ0/f3iDQ6i4eTUo7n3/SiZ292mwPQUH+GVI3bJV2sKRs37NIDmr5cxt0
	/sAHXd8bz7lh+8QW9SE4ivwbrI5chkfUSGWOvYVrZ9IIy+RWchh206Dd+hvL97ZUD72t
	bC0/QOCgSDl453bsIzOhTNn0k1iipotZBvTt60wxp0DxH5/69Yg2klmEm4bJoUOKlEYI
	epW1v2fPWY2Kkrbt47zQ1ye0qYhrgDPFFwC4LNfEIKZU2GiYRxIUxQg+iWFzCs+v5cmB
	psCwzAYYFKveazZ54y6rqydHb/N4Qmidg1+q7bgXE2JpcqBxYNJ/Y34AvywJ1SIJYC1C
	hS+g==
X-Gm-Message-State: AA6/9RlU2ZBlTDuss9nmkFClMHWzCywfe47LBXqRSfTJ7j0zsVBb5cyGAkW9oK1XjvQNmAcGcnlhcC3x67ZjtMit
X-Received: by 10.176.69.238 with SMTP id u101mr4526077uau.175.1475277601886; 
	Fri, 30 Sep 2016 16:20:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Fri, 30 Sep 2016 16:19:41 -0700 (PDT)
In-Reply-To: <ooog2kweegxy6dqxygrpngkt.1475271750691@email.android.com>
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
	<4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
	<20160930104909.GD9606@toto>
	<CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
	<ooog2kweegxy6dqxygrpngkt.1475271750691@email.android.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2016 16:19:41 -0700
Message-ID: <CAFEAcA96zY_e_ZsgYZNedWYKq329rkV=92ptLGh_VOofaBkWEQ@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix
 decoding of iss_sf in disas_ld_lit
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UcGgj/lM+erN

On 30 September 2016 at 14:42, Edgar Iglesias <edgar.iglesias@xilinx.com> wrote:
> Peter, feel free to change the syntax to whatever you feel is best.

Applied to target-arm.next, thanks. I picked "iss_sf = opc != 0;"

-- PMM
