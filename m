Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp761770lfb;
        Mon, 21 Mar 2022 06:21:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGYSKNRFsajEGb/Rsi/fHwFgfzI8TK6skaC4UYD87uXCy+CuO9xwFaPM1wKqJFrPJLH85f
X-Received: by 2002:a05:6214:23c6:b0:433:8a2:c244 with SMTP id hr6-20020a05621423c600b0043308a2c244mr16275510qvb.88.1647868912654;
        Mon, 21 Mar 2022 06:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647868912; cv=none;
        d=google.com; s=arc-20160816;
        b=0Uv6KYH0bPqTHORkvT05wOUcZ9ejDIy6cNhVG/vRHfWHNGdlVo3PJ1PPbyx0J2sW4g
         4LSPpGCdta+fjrSqxd5aZOQzpiuWslUM6vK9hP51SocpRAEzMog0GwsjhUzBj95lrw1S
         luBMEOLu7CESUP3Pz+Kh7EXGIJ5ngYsCLYem2M/m5vfE6wzjJOS8zfhxxke/TxQj+3qn
         cFC3LiYg3S+oUZ+2qThBB0ha2poIFCvs/r7PEsg1Cj/V0MMP6jh5FqO3i0YRx+fJo/cQ
         HFMK6jiJCSN4CbspJWTY4QCWN3nXcAIo5PTNp5J479dbn1irQQE+tNPhur5AS95obuk3
         8OyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=+yntJYSclnZyk7YIGdlYIMxPsjRodTPhjlk5etotO30=;
        b=mLj2A2AvqJ17B3lL8dOiP48SSvGDgxGxbvWQ0KXmnxU8kabAG53bWyy03efvbD7Qj9
         Q/zApCdBO6+0252abe4Im45uzmJvM2RGUVxkHQjt3GcWV6HTDE/BC0SaBuDQUtI8T6B7
         Nqmg3D1adkv0kEK7mZXkQeqInFAbO/XRz7oFinyUIHq6vdY4L5GAbNrUdV2rrlWYsh73
         In+v1bM9nDWNlgGPTZhQNgajvfMPCwsITQxsC9Gw+gBmWZPE8JrnMOiRYqdZrShl/0lR
         MaMOoRrmKVbplMAgFeECoY0VuwYYcPzyg9+xY/mHVYzrL71alXzfE1SaDS5r7JLtqhqT
         jeHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a05620a248100b0067e4be23898si2223520qkn.221.2022.03.21.06.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 06:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWHyq-0003hQ-4Y
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 09:21:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWE8s-0005Rc-Os; Mon, 21 Mar 2022 05:16:00 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:38253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWE8m-0004Ow-T8; Mon, 21 Mar 2022 05:15:57 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22L94Urd075169;
 Mon, 21 Mar 2022 17:04:30 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Mar
 2022 17:14:55 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/1] hw/gpio Add ASPEED GPIO model for AST1030
Date: Mon, 21 Mar 2022 17:14:52 +0800
Message-ID: <20220321091453.17113-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22L94Urd075169
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:18:18 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Af1a2jGUIHu0

1. Add GPIO read/write trace event.
2. Support GPIO index mode for write operation.
It did not support GPIO index mode for read operation.
3. AST1030 integrates one set of Parallel GPIO Controller
with maximum 151 control pins, which are 21 groups
(A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
S5 S6 S7 ) and the group T and U are input only.

Test Steps:
1. Download image from
https://github.com/AspeedTech-BMC/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip
2. Extract the zip file to obtain zephyr.elf
3. Run ./qemu-system-arm -M ast1030-evb -kernel $PATH/zephyr.elf -nographic
4. Test GPIO D6 Pin
uart:~$ gpio conf GPIO0_A_D 30 out
uart:~$ gpio get GPIO0_A_D 30
[Result]
Reading GPIO0_A_D pin 30
Value 0
uart:~$ gpio set GPIO0_A_D 30 1
uart:~$ gpio get GPIO0_A_D 30
[Result]
Reading GPIO0_A_D pin 30
Value 1
uart:~$ gpio set GPIO0_A_D 30 0
uart:~$ gpio get GPIO0_A_D 30
[Result]
Reading GPIO0_A_D pin 30
Value 0

Jamin Lin (1):
  hw/gpio: Add ASPEED GPIO model for AST1030

 hw/gpio/aspeed_gpio.c         | 250 ++++++++++++++++++++++++++++++++--
 hw/gpio/trace-events          |   5 +
 include/hw/gpio/aspeed_gpio.h |  16 ++-
 3 files changed, 255 insertions(+), 16 deletions(-)

-- 
2.17.1

