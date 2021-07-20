Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5283774lfc;
        Tue, 20 Jul 2021 16:53:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEgkoR+lTmJv/n9ND6sXguM+E+UFKG8Vp3l4N4xPh6efr8l4QbHgCRO8vNTg1XodOh6VAa
X-Received: by 2002:a25:a20a:: with SMTP id b10mr42501859ybi.478.1626825206029;
        Tue, 20 Jul 2021 16:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626825206; cv=none;
        d=google.com; s=arc-20160816;
        b=TFQiYM1KM8LhU0CJmHumADETbou++sAsjT75vP8Sfjup93M6K336JTN4Tq3lEm426P
         FdOV6Y4JIH8UU57d3p87nbHazfmA/tEkHhFGOwxzFXx+om5Oystw62BwJaPmUysKcIvW
         pFl5xO01aAiThM7pZ58QmtrRe3I5inJJh1hZh/8+2tWRDwQcqgPtOwmKL2j6riWCf76w
         FEAXAp6q1KfT1lNbJQDKb0p9V9TP0RVaIr/5HRkup3HoxAyMvi2JSLawRSG+AcFLVuTs
         +5WedJ1TAsuKRhUIPtBQNc2XeqloJErCb35DDnNOQZzm/blYN3uxW/cf3hGHKD6sf088
         DeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :ironport-sdr;
        bh=lBZPy20vhuQIjPVKoOYXaOQjhWZl4aq17XBHz5fdvRQ=;
        b=Hn+TMKB3t1az3WRUYYjL6Tjsy574jfKugBZQJLbkxYJSsa3gW3ggb9rTMB+iLQGLH/
         8uYunwXX7ZmMNNL0NTLYe79TgtbjqWkzrjoPnx9oc7QPZB95hsS86K09go0ILs+Q1Vj3
         2m+j6hnMlBE7z5yKqHxNI6P4Mllpv3pm4v1hY3CcDN+fEtaTOZnS6vDxOJ/YPFUZRrA5
         mHPwsWimG/xd/lL05tW/6rytei4jr4LbpYc+XLLEXsJFXUI4y6t9cTGc1K1fx8aU5rGP
         iIZlfGSf3gNj/gf1HVTRq/jMG6v0FtW5RmkcSoG2VeBcL2NaDaCrMTOlQd0xV62WfkUh
         xluw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si21643827ybl.177.2021.07.20.16.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jul 2021 16:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5zYD-0006xG-DF
	for alex.bennee@linaro.org; Tue, 20 Jul 2021 19:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m5zIa-0001hz-8d
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 19:37:16 -0400
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139]:31472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m5zIY-0003V8-2B
 for qemu-arm@nongnu.org; Tue, 20 Jul 2021 19:37:15 -0400
IronPort-SDR: 1JrnhsBcAl+ucbSdByyHOFBlybf7x4uHHtMFqroSJo8uAGZ7pyUh23845+TNNDmYqq1yznxQVR
 Ihx8KVeDaj2Gv6Z8LacRpgCM/i3+OS+niL1Rx3V1dB7nz0eGDJN/k9KJQ0owUZr4BXWb7TQWQB
 JehRplPk7n29oslCOy9T8CO92jigD72fCULhdsn+48zHEkNhfFCQZuVQQtkVDZAtGV68XtaOoH
 e76yZ5u3AnpJEIcTycAmAUnRj7HljF8zIlHdDQ3d7MAh4xUTOCiDINIgtH3eSDpqs9bn3umaXP
 55LG1fh6VBREO2LhZ/ONQQjZ
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="37473168"
X-IronPort-AV: E=Sophos;i="5.84,256,1620658800"; d="scan'208";a="37473168"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 21 Jul 2021 08:37:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BEEBE1F5075
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 08:37:10 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 097CCC9CE9
 for <qemu-arm@nongnu.org>; Wed, 21 Jul 2021 08:37:10 +0900 (JST)
Received: from cn-r05-09.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id E09E340012B72;
 Wed, 21 Jul 2021 08:37:09 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] This is a test mail
Date: Wed, 21 Jul 2021 08:37:00 +0900
Message-Id: <1626824220-19415-1-git-send-email-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.139;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa6.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: , qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ujoAJzMZT2Nf

This is a test mail to check the behavior of my mail
because it is not listed in the ML of qemu-devel.
I may send several test mails. 

I apologize and thank you for your patience.

Shuuichirou Ishii (1):
  This is a test mail to check the behavior of my mail because it is not
    listed in the ML of qemu-devel.     I may send several test mails. I
    apologize and thank you for your patience.

 test-mail.txt | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 test-mail.txt

-- 
1.8.3.1

