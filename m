Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1618545wrs;
        Wed, 13 Mar 2019 06:00:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzY5Mp6dbOeJYtcvIIEHkq/Rrnryekn6E03gDg55nIXZTovZtJWrMEwC3jgI0RsSvI9jUts
X-Received: by 2002:a0d:ebcc:: with SMTP id u195mr33666284ywe.132.1552482013258;
        Wed, 13 Mar 2019 06:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552482013; cv=none;
        d=google.com; s=arc-20160816;
        b=BUNlRLOi7FVolKvETjSCaVwot1g+xIIFkyXhTh0aEXJv70s894//gm6XgHzYSxapWN
         yhqQ0KwOLnRQ2IcZX6jst1/AmAMlI+USzajkzXeAt79nh3QJERh0oPcutunv9o3UrjyR
         j4b5yIe4gWX+IYaJxIuCsJc6bhgXayzLyUWMQc/EXdBgXlKY1abdnZFEYm3yGbRnQUvW
         GRoar1DGcArNpdHQN3NK6+J7l1ya9V6TJsqT6pCGBOWuai4EZJ+jfTQKrzzRhEybAjJk
         k8jceS15XAGdwNUIzVXXVAYESA0qAFwL08IKvIBzuBsvB57UNPha9p/Ir9WOE9iSjEht
         qNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:date:message-id
         :mime-version:content-transfer-encoding:from;
        bh=0QEMcL4EFiqWAsIZse2T7N6RL04aY96booEw51F524g=;
        b=NqZydCxI0QOMwp/BWHvMPDLHOuRYdjrys+n0faUj7JjKrbSvHHPD+oIkxxxmDAWGyP
         0Ut4x9TOu4MYmzLaQowRfgiOd3tAMmodOUDBUJ7ZKgrqoK4OkPq/jFhNuZSIup8zQ6Qu
         93EOP2fr3o4n7pqOrMpx8/OMhcU7q49+MbWPkh58vC4pStZqj9v15+/R7Ge7eHeems4o
         DOPTEzlUPz9PmTb81uS5jR3v3ZIaBk8TVyiJyHNu5MixJhk00uO421F7jx5DBWi//sRF
         SkWP3Nxt0yVlRMzs/4AJnjnTTRh8sOkVzeCMyqtUpHHsR+DbA/VwPmyfABhsgPntdG+a
         Fd8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si6621880ybb.87.2019.03.13.06.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Mar 2019 06:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:44198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h43US-0005I9-Pa
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 09:00:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <heinz@soft-t.de>) id 1h3zMI-0008DZ-Pd
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 04:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <heinz@soft-t.de>) id 1h3zMI-0007wK-1Y
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 04:35:30 -0400
Received: from mx00.pcom.de ([194.25.152.16]:46253 helo=mx20.pcom.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <heinz@soft-t.de>) id 1h3zMH-0007vm-Mt
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 04:35:29 -0400
Received: from soft-t.de (unknown [149.172.163.132])
	(Authenticated sender: soft-t@smtp-auth.pcom.de)
	by mailsrv.pcom.de (pcom E-Mail Management) with ESMTPA id 103132047A
	for <qemu-arm@nongnu.org>; Wed, 13 Mar 2019 09:27:45 +0100 (CET)
Received: from heinzs-mbp-4.fritz.box (unknown [149.172.163.132])
	by soft-t.de (Postfix) with ESMTPSA id BEB0EE0337
	for <qemu-arm@nongnu.org>; Wed, 13 Mar 2019 09:27:45 +0100 (CET)
From: =?utf-8?Q?Heinz_Br=C3=BCderlin?= <heinz@soft-t.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Message-Id: <B0F38A27-6C7B-4E9C-B026-A6FB732D321F@soft-t.de>
Date: Wed, 13 Mar 2019 09:27:45 +0100
To: qemu-arm@nongnu.org
X-Mailer: Apple Mail (2.3445.102.3)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 194.25.152.16
X-Mailman-Approved-At: Wed, 13 Mar 2019 08:59:51 -0400
Subject: [Qemu-arm] Tracing and modifying memory access
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
X-TUID: NjXEQPhrRtXI

I want to emulate memory failure for a special ARM hardware.
What is the best way to start ?

Regards Heinz

