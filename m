Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2449296ejc;
        Tue, 17 Jan 2023 07:05:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8iszlzIG9CE8Bh/KWaSFeCCz/QX+NPuqLjUjF2B0R0kJfgp+eQO1NAEZ2wEMI85zq6w4J
X-Received: by 2002:ac8:5157:0:b0:3b6:302b:7dcb with SMTP id h23-20020ac85157000000b003b6302b7dcbmr3801915qtn.61.1673967906671;
        Tue, 17 Jan 2023 07:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673967906; cv=none;
        d=google.com; s=arc-20160816;
        b=puDLV+cnSLfNzMXdQYaqxB5nPqR5cf2JyLJ5XtXkeH6IiJPNH+60Ss59O/Xr+kDOFF
         jpC0C1zYhIFsdwobIvNlwJ8Nq4/1ahDrXPs9cQHM4NfbzPNt4RToq32riRv7E8PNDERN
         1pJEmC8PoN+6cyAg0+RKIWNpOoHBK0Dcy9xStnu3H3B/j6Mo70gb4o48nSO53LcBkLNi
         h/PFVKG1vBkfATmpeCrkfRkEOr3CwCWvER7qBdZWfgnHAYzr35KssPMJ3gvwS86W4XAl
         INS3aW9V9AMOurfX2SouGnGUO9TKn1aHxP+1DeFWQ0dkTfQzC0ycx/+Asqgl1iZLlQ0S
         UxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=xoCupwzcUn9uGTy4/bF1ofZYnlcZwe3TJL0GgoZwm78=;
        b=WIej9jRlC9H6zhZNh9z9qMj8FINxAVecu6sGSQe5L/s3WfDXmYWya5ocoXa0grQmvl
         aSXNPg+pyNerWWfajbOpfMNpfURbll4h8bmpm1bpqkxTEM14QWfKsdSWRZa6E4CVJ8ZW
         LDQjukrKum5fFZvblq4zxyCpVOoLesJGPg/PVZmHN9HUEhvVCU6UKA3wHUG1tfCFO+0D
         8LlJALfXPB+s4whXkNKHQJ9XpO0xq3rSonW8NJE49W0ksPX3mMDA0HP4krxpWtcWbNtn
         Kgc/5WlZz0XABhlBVNV5f/2ChKG7dKO6NCLm5Z1A4bmtnUcyU1x1qkGM/iMyEyrXG/9X
         xDHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=YhoJggy+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22-20020ac81416000000b003a54cd89f0fsi18194291qtj.170.2023.01.17.07.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=YhoJggy+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnVh-000650-JS; Tue, 17 Jan 2023 10:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHnVW-0005zY-0U; Tue, 17 Jan 2023 10:04:16 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHnVU-0000Vw-A2; Tue, 17 Jan 2023 10:04:13 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id BF8CA20DFE98;
 Tue, 17 Jan 2023 07:04:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BF8CA20DFE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673967850;
 bh=xoCupwzcUn9uGTy4/bF1ofZYnlcZwe3TJL0GgoZwm78=;
 h=From:To:Cc:Subject:Date:From;
 b=YhoJggy+Lz6spOrmcJC+Wt0B7gmecTkPPZblrq10Adpmtfn4ihbIEwf2hK3vZjPRL
 1GCFgT71vLkMwB3PC/lK/h9z2pxHGZeYZGc1s4b5wuEcCLuLSG861Be5yy/hWvp3/J
 D842NFgUN4e7WqEfr7vcDl8vJre1oF89S9lfVeaY=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 0/2] various aarch64 fixes for running Hyper-V on TCG
Date: Tue, 17 Jan 2023 16:04:03 +0100
Message-Id: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b6PDhJIpv9jV

Small series of changes to aarch64 emulation to better support running
Hyper-V as a TCG guest wtih EL3 firmware.

v2:
* DBGCLAIM now implements a (trivial) raw_write handler
* Added comments around ignored external debug registers
* Patch 3 is dropped because it was manually picked into target-arm.next

Evgeny Iakovlev (2):
  target/arm: implement DBGCLAIM registers
  target/arm: provide stubs for more external debug registers

 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 59 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
2.34.1

