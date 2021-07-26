Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2647690lfc;
        Mon, 26 Jul 2021 01:21:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKD7T605fgC1V5aE9+FANiT2mTsdKZ6HLZ9TKxgzqoprhdw6+l+oFYzfhcC60GDixBXutk
X-Received: by 2002:a25:2688:: with SMTP id m130mr7201468ybm.146.1627287662895;
        Mon, 26 Jul 2021 01:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627287662; cv=none;
        d=google.com; s=arc-20160816;
        b=wm3SHIdaupJzbnTXBq042Wl+rtF/BTpvAmYY5LDaZLAq8s3WRK6nZ3wmq/P1F0lH/T
         vaiOYIQMyHlId8H/oiYRf3txsyzW/+xOKe6jxBDbFUPANTYwtkJB2GkhRrF620UvowVn
         vQ5FEWS6UGIkOtqoHj1IhzD8iidrFTy5YEkj/3g97+JDyeAJRyurVzILUhlCJPdcNzFD
         48nAe9QPak2U0rOq6CqIcfrNJrt9/LBf6JUDvUxExnje+DPN2j3oEbnLia9MNCKnyDmH
         iNfl54dMMUTbGmcQPskTqLSOkTJEwgUa1N2ErQ/z6lJr7tQiY+3jm7OzEVaBbmyJQbpA
         gBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :ironport-sdr;
        bh=g0q1m2azKIxyg4L7n/onBHj8oeXECH44QBTpFYRElII=;
        b=qmK98AUR5LsOeNBcW7lBoZVSG4CIrZx7mGGrFeKaUxIJeFs46i/jJjvtUsEFDQUl0L
         RVju95yjd4+bAUQk3jESp5/GvSs3RPTb8ANtEOA1bsNThX8cSoitugsZ57xORkHgKWFy
         HfiKH3l8YSvWa2/TRsSWSfCWVAnfYTCDHAUN3amuxRegJJCMhrTG4UGG7U9LMGtKV6wu
         MSNHbktnxtvvuN9bMowZ93G75PDdr/F+Yw9qZOnF9kD52RNxeCXISPt2CMRZ/aFnxJNb
         D+DF2JYr2KwgKSVBEOUV6iCEdqqBKfvPUokRR3RkDXFhQEcq9W9YCpXqY194qu78mCcB
         koXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k82si21624466ybf.21.2021.07.26.01.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 01:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m7vrC-0008DJ-5t
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 04:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7vr2-0008BP-EV; Mon, 26 Jul 2021 04:20:52 -0400
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117]:11836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7vr0-0005qa-KM; Mon, 26 Jul 2021 04:20:52 -0400
IronPort-SDR: Zf6za24ZJxvhESduMWU3Hr7SJM5MqiiwZtddL/2SLnZ79uNfDqKjht8XfNua8zmnRcAHco2WNf
 pFif1JDVAscb7k9LORadvrNma5b9pCtMBVRL+tevOnr2Ex3Xvs6WR1nOClqYMp96j573BaLpPS
 VWsB0jzkc/r+0JoEuAiJzmWrLRhce8IWNcuPMhlEsv3JZ0N6K0FR9/PC/BgncxHg+y4ksv9Wqq
 jxQ/pZPypUICUIifc3FfhSE9Ige3xaUPOuHrvFJNbI5im0LWuumA4N1yLUgwPppGCIKU07c3fy
 5SbqRpHIJlvMUusqRPlq6iSv
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="37752777"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; d="scan'208";a="37752777"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 26 Jul 2021 17:20:46 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FAE96CCAA;
 Mon, 26 Jul 2021 17:20:44 +0900 (JST)
Received: from oym-om2.fujitsu.com (oym-om2.o.css.fujitsu.com [10.85.58.162])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4176F0A28;
 Mon, 26 Jul 2021 17:20:43 +0900 (JST)
Received: from cn-r05-09.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om2.fujitsu.com (Postfix) with ESMTP id 9613D400568AA;
 Mon, 26 Jul 2021 17:20:43 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] This is a test mail
Date: Mon, 26 Jul 2021 17:20:31 +0900
Message-Id: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.117;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa4.hc1455-7.c3s2.iphmx.com
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ru4W4ojaJcZ/

This is a test mail to check the behavior of my mail
because it is not listed in the ML of qemu-devel.
I may send several test mails.

I apologize and thank you for your patience.

Shuuichirou Ishii (1):
  Test mail v2.     This is a test mail to check the behavior of my mail
    because it is not listed in the ML of qemu-devel.     I may send
    several test mails. I apologize and thank you for your patience.

 test-mail.txt | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.3.1

