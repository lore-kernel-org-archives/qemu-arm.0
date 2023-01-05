Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp639315ejb;
        Thu, 5 Jan 2023 14:46:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuQ/M9NyGZc6MhHRzZhSU/3U+yEG5BzJC5ydIrVoBXOhKWal5BV+fvhnLkh/wRUxvsQ5zu0
X-Received: by 2002:ac8:4602:0:b0:3ab:6312:f306 with SMTP id p2-20020ac84602000000b003ab6312f306mr76314349qtn.4.1672958801030;
        Thu, 05 Jan 2023 14:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672958801; cv=none;
        d=google.com; s=arc-20160816;
        b=0oP/C2eZ88yMpyKM64qrQqreQvsW0xl0yCTvwLArV52nKKYHpkOkaqfHyte6XOYLj9
         XcRmK2z3V+po1QBdJJe12OsW7HLATOejwEYrBIkkhBvvh/ArwmIQu98Gbm7EJzz79AMM
         d9s5C07XpsZ6gRb8AniL0cJEloBvzbPHU5fRt9MmPiZeB48mkT5WxKJdwIqiPyn8MHww
         /RkRmvUn4Rx+4baCOmbd2+pPDK6HNFyrsvyRIvdX4BzrEjRDkM9+OsMsTi45M/MXPBpu
         4AFFZ3XQOidrg94lO+zjSnkHkVLqb27lfN/CN9MR/eCrLAcdATZubBVouhWhJAX1MsB5
         smDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=jQ4q+u2yS/x/Fw8ksJ7eBzcNHHLms6GmSqzp7SxVes0=;
        b=bk5TYbqNyFmHHUjS1cEnNV9rdhmhNECnms38xqD9+u+OmqOZBOJ72rxICBHofP1ZFC
         esq4lG0q8oJ1NcZOqt9E7cs6dQzPZCZ4Cyw6bH/8uJohEh0WLziwlYr8nQLRr7ED97bU
         c1mK+RIRNlDWZmMOz1RxMiIjmbzEY++nJ8rZ3aWFHU/wfMm8ILkm2gm1Wrr4wJpprd+p
         nTdb31ZxBhKwQdAnU66Sko56iFXqk/THf2uV9PWKYIR97LaE38nGuUoLyNbwXjRfx0WS
         gwYz15VHFuAutHtwgZNf/D0DufIH+2TrXHPX+v4EnI1s/7ALAJkJQ9PDt9X1eDe3r+Y5
         ggjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XJ6j9zhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b006fcc8de31a7si11116027qkp.396.2023.01.05.14.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 14:46:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XJ6j9zhL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDYzm-00018U-O8; Thu, 05 Jan 2023 17:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTs-0006gU-W0; Thu, 05 Jan 2023 17:13:01 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDYTr-00022e-Fa; Thu, 05 Jan 2023 17:13:00 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id A00D920B92A6;
 Thu,  5 Jan 2023 14:12:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A00D920B92A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1672956777;
 bh=jQ4q+u2yS/x/Fw8ksJ7eBzcNHHLms6GmSqzp7SxVes0=;
 h=From:To:Cc:Subject:Date:From;
 b=XJ6j9zhLavI8oiYfvGjrl4RAz1VYssouc8IlqDhcr8cbnY7cGRXhxqS+7K8/tCuzb
 iFEeX8tMxbVX8o0AhoIF7A4pySurXilZTtyXcd5Si4CIKL5CfBOuXLVrMBk9sXcNou
 uvh2UDR/JdrsZxOkMQfGU9aeI6IC75cZBRZQmEG4=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 0/3] various aarch64 fixes for running Hyper-V on TCG
Date: Thu,  5 Jan 2023 23:12:48 +0100
Message-Id: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Jan 2023 17:45:47 -0500
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IF0Sn0FvbOOC

Small series of changes to aarch64 emulation to better support running
Hyper-V as a TCG guest wtih EL3 firmware.

Evgeny Iakovlev (3):
  target/arm: implement DBGCLAIM registers
  target/arm: provide RAZ/WI stubs for more DCC registers
  target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled

 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 39 +++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c       |  3 +++
 3 files changed, 43 insertions(+)

-- 
2.34.1

