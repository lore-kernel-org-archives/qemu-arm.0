Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp469716wru;
        Wed, 25 Jul 2018 02:04:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfsTJy7w2JCfC6SAmwK1KWuT7oKEnH/kZjpQXbLgJYwZ6SJoxQaeDe647rSBXXclgU8gokG
X-Received: by 2002:ac8:1631:: with SMTP id p46-v6mr20481829qtj.72.1532509499479;
        Wed, 25 Jul 2018 02:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509499; cv=none;
        d=google.com; s=arc-20160816;
        b=Ba/PsQ733O3arSKqewO2vwZhUgCIVxYUGCwBWXw+JHQ91l6DzZ2RDeAsQsTWknIdmR
         CiL64UIY2WlOwHLJuEbzJ2AdHypDONTUGqzjbgomPVLnoJRgO7dlyI6QG0PrZU1/CMV+
         QRONs5VW98/sgSKfUfpsj5iEA3mL6U8kuqtzRgGJoW1BVfybxq3aZaOvGTn4hA1EfT2p
         gQ0V5MOK9kJk72VmCkUbcqaupmIbTK8fVjykP4KJAIQJUp9ATuHBOk/YI7tnt16d8pHR
         NDWpnkxIwcDFbVI5Pc7kYqvshpv419K6GV/+YDEXi8oQwOZfrsoRcF7rhLEUh7FpBvu9
         yaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ftvIkUFamieBAlpfgHN6BsZdGxVrgmxLA5yAupOb5h8=;
        b=g4WoCez/ZSZFq4WRdr/GkuoG3Zrsgvs46RafM6ssFaj0bKXj8MGiPapXhi2VX9Tipn
         ovn6Z1DJUODCttNnDf0XPeQi5UcwQobJa0LNrDS6LZwaAGnizaPr9yIBCmmygH8O6Cle
         1Trdbq4R0x8judknsQDon6f2+4k8vgu8ZFL2xWJTuG0McYnOT4PQZjBybh+BYZ74youY
         73C1unHa8NLkFyAZUPmsS2DI5NDx5r63WmqQFZOZciL7BhW21zI5iQ3wlVZ1IQaGlIK5
         /Wai9PwEWs/34pHJsxO6vf50tk/erahrU5Rfhakp8GkGn0pdHVw1yeo9DBgQpAE945lA
         e52w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="g6If/p9L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si11802948qth.269.2018.07.25.02.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="g6If/p9L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFj8-00042g-Uj
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:04:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fiFin-0003oL-PK
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fiFik-0001Lu-Ny
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:04:37 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:35322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fiFie-00014n-8a; Wed, 25 Jul 2018 05:04:28 -0400
Received: by mail-wm0-x231.google.com with SMTP id o18-v6so5218650wmc.0;
	Wed, 25 Jul 2018 02:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ftvIkUFamieBAlpfgHN6BsZdGxVrgmxLA5yAupOb5h8=;
	b=g6If/p9LKys37nD6Ak/5IsbpKV4aod0P10symjgtdHFaoC5yieamFuacPnl6BDGHFm
	DvM6jZB/VZ9ZfniT5YbSZP8pKoHRPXLc8E48qUyBZGSXaNTZTUCDzJOzm4f8COdz5sNf
	Sz7gMHNBPh8uocGrpxjyxwnYhcsH4pEMAVG0fg+hSeW0eWEQAV/Wyn3zcmJYA1swjcol
	Vr6mheEFxgATkh7FwWh5TCpYjIpD2BVI4vbXxrN6pELkXDs9tLOeTpwgT55mDN9fB90W
	jOtyTpBLuZTQX4I/m4wNZxFjg1makKWfygble+xzKs9MXVHrWMhe7QAIOhG3xOP1COII
	LAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ftvIkUFamieBAlpfgHN6BsZdGxVrgmxLA5yAupOb5h8=;
	b=jHhl+34kRV7eHvhiVcjtiukrSwSz2uKcxglL31lGoT/fV6MPvI4LThkV4uLAKu3JRA
	OAIkV1SlJsgQVQO0LLS2nVVRkZKSsl/tuRSR8ZPGu9kkzPTYYZN+wGchuaNBVwj1qC3s
	j6qCEUv5kw8rYx21rE4ka0VHJGZt4MFQxDxbOzAQM/kra/ZVMh+/yonn80PF5nJEq7sB
	oMNhiPndxJ4cCCDH0XMk0RpKh5PI1Esl+LfulZuJlKHmuZIJsGXQ/5WteiCB/2QjQdTi
	JXoqhFWbd2bJ2WsZx0NbE12NciZZHtmqDxBqXRhuhxnGI60jMlpnM6d+71zXJL4vxMpb
	H+SQ==
X-Gm-Message-State: AOUpUlEA2aa6xlYnvbvRyRamNgGTeomzbJ761UoaRQ85ujuNzjDilbwg
	QAyysvA80+TeMfka4aatxdlLIweU6yG0pYIuOJc=
X-Received: by 2002:a1c:af53:: with SMTP id
	y80-v6mr3863099wme.55.1532509466959; 
	Wed, 25 Jul 2018 02:04:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:8505:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:04:26
	-0700 (PDT)
In-Reply-To: <20180725085944.11856-1-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 25 Jul 2018 10:04:26 +0100
Message-ID: <CAJSP0QVAAD9pyxJ_gocLVNt7DOkcJsqgMwm5vvJjVaVfa5yp9A@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 0/7] arm: add Cortex M0 CPU
 model and hex file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xa7q6pege/Fw

Based-on: https://git.linaro.org/people/pmaydell/qemu-arm.git target-arm.for-3.1
