Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1512538lfj;
        Thu, 5 May 2022 20:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0NSAOWhdWMPfUXqTYaQUX1RC7WvZ/WzpPkiIJ8AZcnByO6KRqio7LKqBKhE0ihyyFn1gB
X-Received: by 2002:a05:6214:2342:b0:42d:7c8b:9eac with SMTP id hu2-20020a056214234200b0042d7c8b9eacmr911141qvb.5.1651806998925;
        Thu, 05 May 2022 20:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651806998; cv=none;
        d=google.com; s=arc-20160816;
        b=uQf58hnGsG8B6XE8iTkxnYIuctjIQWkINT5s0BONndPyHg3pWXWKXfh0hQ6WcRSebz
         9ce7QAey1oToBQXzk5GY46Zi3J5SCK/FUfWPZTfWhLW6ioXiAJ3eLFyGHJ2nszqyBv8s
         /vxDjVW93RDelexD3YJEdXlkRJjs1Hmm/FaeHUMr2l0wLYB1WjA1a4FnRiNvT0cAGedz
         TYceiMvx+m5KZIcoUg0oi8q72Za0ikwpP5XomN10RFdVHmFZdeH8PYIK1RK8H7cBlBw0
         ZD9qfcRPBMOsCAkVrYW33/5+FFpY7jIT4GOiUOZVBU89TQKsGNbDS5EtYP4A69jqiMlX
         Q35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:cc:to:from;
        bh=C4xBmqh66towBalAUwZJAP2jvhetuIdE+0VMquTORf0=;
        b=VB63VoUeNeFPgRVQTRd5bXKXOyKZuoy0sJXg1V9iLRX4rVYS4R6aTHBkGeSe24nsJm
         byZyv6QOQHju177DXjlLiVM92tdYfhNgvLss1g3QPiV0g66xK2CE5YIE1PwoanWKT7sH
         Bu2arDmfm4CwsMztxfP7JMpd1AtOkBVgfdEB/FV2vbKjaImZ2PWlvV8QfCsD8BMVXDpN
         Mooy3UaEBW8gHsoHMKnkmAwnNS0o0XoUuNMQW/s2WNohEZa4kmOTv2uIKXGLD/kgl7r3
         p9NT2VHRvtMSTZxfpHhHgXSlAHue4NjBjICkFXKhsInb66oSZrVvTrP/zwtjo+dVXFku
         9XAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05622a118700b002f3c5f05d2asi543235qtk.527.2022.05.05.20.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 20:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmoSM-0007M7-Dm
	for alex.bennee@linaro.org; Thu, 05 May 2022 23:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nmoSA-0007LL-MD; Thu, 05 May 2022 23:16:26 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:3035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nmoS7-00073b-LS; Thu, 05 May 2022 23:16:26 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24632OM7041962;
 Fri, 6 May 2022 11:02:24 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 May
 2022 11:15:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 0/1] Add minibmc section in aspeed document
Date: Fri, 6 May 2022 11:15:20 +0800
Message-ID: <20220506031521.13254-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24632OM7041962
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ni77a4oA1Bs3

- v1:
add minibmc section in aspeed document

Jamin Lin (1):
  docs: add minibmc section in aspeed document

 docs/system/arm/aspeed.rst | 61 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.17.1

