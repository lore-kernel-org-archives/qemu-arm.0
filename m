Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3870596lfg;
        Wed, 26 Feb 2020 19:17:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKx9uxdgCEEuHorgB/D3HBAfl8W1f3gTtkLU29jTOb8d+LNZTfgoMAyeYFyvIuN5lOXamg
X-Received: by 2002:ac8:7103:: with SMTP id z3mr2413604qto.172.1582773475963;
        Wed, 26 Feb 2020 19:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582773475; cv=none;
        d=google.com; s=arc-20160816;
        b=lHJYPPiIU0ZbbRjQQTecwrD4f5GIuESYvF9CA7W03zcH3v/I4ygZ8gZkWz7mLXOQLw
         R1kKMD+Tts8fhrBtrlCx1LEs3JHm3fgsZUDWqVuxV56g7d5ZRKAsFmFAAey+F654Dpxh
         eTwJVSo4aRizpoLzP3hSnIx7nRVn/N/A9/KSxOjjvXRbb1DgXJEKkBe1Y/gdmReXrx+w
         UKNmYthFTBsIl8nF3J/l5qt9+YmCpnPY8BrMsLpVnE/OZ0gYfc2noh7sLAOWo8dqsJPW
         8qDsHsiCAwUYfYRhUdL6vrlq3qlLPf3/jjAUqEtk4BMkjc2LRUZjGX37ZWuUnu23FMZz
         8+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hSejYaCs7IfHJXCU0iAn87QmN7uPaTvX4osKYJJq1xk=;
        b=JQIZo+WliZYu1rztzh4XBZIa9i3UJ7fzvidHBK4aZDoovLGm8LvvKKAMm0Wuyx8ufd
         6p7+lwIP963vu05pjrTBM2pNa/vwZaQN0NM+kZucNRvjHKk2y1rCILRmkbdl+1KOo2jE
         lceYrPAphlyv43NjjvQczgRUJU2zONZY9s6fAoN0B9varMEZWy7k/mNA20b/GPQLBoTp
         Jdjb6WRnjHcwAKJfid0CagMuR/i3ZIyGP/5KMJjwsrsqcTTLOYR+rFbvhDZOMU2v97W0
         D4GsHA4O4qob0a2cuv/b7vR4Kv71abMngjSaQcENkS0Sy524doFLZOz9wI4yOiPd8GSJ
         TlZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ezzIEn34;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si703908qtq.227.2020.02.26.19.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 19:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ezzIEn34;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j79gR-0007ni-D7
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 22:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1j79gK-0007mA-0A
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 22:17:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1j79gJ-0003HE-55
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 22:17:47 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46629)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1j79gG-0003Ac-Rn; Wed, 26 Feb 2020 22:17:45 -0500
Received: by mail-lj1-x242.google.com with SMTP id w19so1557369lje.13;
 Wed, 26 Feb 2020 19:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSejYaCs7IfHJXCU0iAn87QmN7uPaTvX4osKYJJq1xk=;
 b=ezzIEn343OXbejVpX3wulBzsw+ibzl1CS18pRis9PGLFpMExdOuzsayXKCueU5+Yl1
 GiSyrrJGztYgzNj2qwcSYYbVtWm9AYLn7TFIFqYOYQqMW3zoVd9ha5LqVC1bf1kaYCD+
 ii0cM64tboW9MxFH4mnjJw+uqEBLCB5vUMIn0x5aG44vAQO70Gf1K4CFWFDzKxNhDY9s
 p6Ykq8BQkjNOPTTgjxIWy4CjCr30ZrpEbxQEWt6H5OJxqotIhOOXzJVInKRdvWBULHq2
 D7laDF+I88CBM1lzi7Uxy/rM4FxQKv5nyiWX9yny/SlAlWvsxu6mVfTZzUljtX/Qyz97
 T1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSejYaCs7IfHJXCU0iAn87QmN7uPaTvX4osKYJJq1xk=;
 b=VX9WV74Q/wkvKTIK/OBquNYA5EcrquMW6YRRMzGUHq5cim9QOSu8s6eEmX3OAuCOt5
 dngV35yMfwjUI8uGaz9pMtRPgEu3Qvc7ttVoQlZrY6Ij6ZSaWq9SHVYXTp2E2tC/ZSmh
 AAvA/knWXoh9I+OYD2qcAbShOrMsWm/PoZmPN1lxyqElTJgFwcDE1iD35WGMEafqZ/xC
 a6jNzmFSZ8uOmfWfaiYG5urALg89VyVapHGxY7w6BgflxEp5WZKIkaLVmlqJYD3QAhZm
 PLE7/LnzPZt5tq5Kt2qENrxigx3PqANIIWSdGUezpnz0np5Lzrky/6hIJmDAk1RyWX44
 Xjlg==
X-Gm-Message-State: ANhLgQ2zrVx15KH5S02j/7ghUepYX/wMcNQPwzkOGLxCEKeStWPgvb91
 TDiDeqkjfjtTCqSUCPsgKZ7SgLUQsRCgZw==
X-Received: by 2002:a2e:9d92:: with SMTP id c18mr1400542ljj.265.1582773462465; 
 Wed, 26 Feb 2020 19:17:42 -0800 (PST)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f9sm1895739lfp.24.2020.02.26.19.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 19:17:41 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] hw/arm: versal: Add the LPD zDMAs
Date: Thu, 27 Feb 2020 16:44:22 +0100
Message-Id: <20200227154424.6849-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kKvuzt+BjCTY

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Instantiate the Versal LPD zDMAs.

Cheers,
Edgar

Edgar E. Iglesias (2):
  hw/arm: versal: Add support for the LPD ADMAs
  hw/arm: versal: Generate xlnx-versal-virt zdma FDT nodes

 hw/arm/xlnx-versal-virt.c    | 28 ++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 24 ++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  6 ++++++
 3 files changed, 58 insertions(+)

-- 
2.20.1

