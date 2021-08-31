Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5492941lfb;
        Tue, 31 Aug 2021 16:34:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsZ4JmxfOZ+OVdE7Fr8ps5H5fP/u/t2BTxTapvQxRHPAM10mxw+yhIgpt7cJIK/4NfeDfU
X-Received: by 2002:a92:6803:: with SMTP id d3mr21116122ilc.145.1630452852093;
        Tue, 31 Aug 2021 16:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630452852; cv=none;
        d=google.com; s=arc-20160816;
        b=ieDVKEJGvB9+8DR/3G5/SgQVGdf4+dN+civRlfyp+nBJlVpVRM9bJIRDADh98e6yL1
         vBS09QnKoOH3ofZDaOsWF4ciUC1TA3uCJs8bwsed+sm33Db1K6o37mzcrRG0KcoPrLDf
         XwTKRk6J5XmzXWJDOGOYB6Beni7KHnOrLmBZ41AdL58Az3MurB3o1RCpumjmRNuqnDEs
         uCT18UKGMVYoZ+zB/STWjmPP7MREfBXwu9T+y1cmOINHRY78inF/X2FamLl4xTQS4I9w
         Gp2O8Edh8vsgGFz2j3pvS22QR4nOAgVrx6ZUvwFNOnsbkQ8CWLKaVhW1Y8mgHwThHEX/
         Kcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=COYQZgUu+2/LsBlUJEGDY6klb+xepGIgFiTm3f0oRdc=;
        b=dm1N4p9yTYl9f44Lwro8ZEPhYQT6DGOnrMiMMMNbKpWVUgeC4L0ZvfI6ih34zEg6X5
         BlIFbINZdpsaKmYMuBGgA6heNOWgCJLSEDc0gJelMVYFW62QxVJMuz6L6/KxZbNLjbo+
         hYVT9R9sxH04EWgIGVKBPaPpPXdCxKJwVjSAtGHHTQhx7ftCB8KqWzF/RDAAY++UY4bA
         DspfAIHeTsEa9DBiSrCiRZQAI4gxd3B0r7vyuPwcRzupIRQe4MuI9U/gfFqNa1/uADxF
         RNRkIhSE/eBgTRTg+K7oB3FPGMYi8ROeo50aTfBIvLnDjIRnNjcEjW8puP7w2R/kKPBV
         kDTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=cHWz4RYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si21773802ilt.54.2021.08.31.16.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 16:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=cHWz4RYT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLDGd-0007tg-F9
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 19:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mLDEi-0006Ib-Vi
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 19:32:13 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:25268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88771d3da1=pdel@fb.com>)
 id 1mLDEg-0003VX-Sc
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 19:32:12 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17VNW6SH020494
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 16:32:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=COYQZgUu+2/LsBlUJEGDY6klb+xepGIgFiTm3f0oRdc=;
 b=cHWz4RYTNsCfE9MidAkrrnJodey2dBcB3Jb7z1BIV2+GRw99dodeyyEsLl/CYChycUyY
 xN6hd0aVAQoJb/p3iNcWznJnmCPSwD+EVDDZpFLnHbpjJ7kHwWL8KuponqxHqPAXZT1e
 8N/5tV/TVFi898XHXoALLiV41D74MqMKv80= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3asrgutba0-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 16:32:08 -0700
Received: from intmgw001.05.prn6.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:21d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 16:31:59 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id AB442172C90C; Tue, 31 Aug 2021 16:31:51 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <andrew@aj.id.au>, <f4bug@amsat.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH 0/1] hw/arm/aspeed: Allow machine to set serial_hd(0)
Date: Tue, 31 Aug 2021 16:31:39 -0700
Message-ID: <20210831233140.2659116-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: VfZCqqenL6HbovrVGowifNFv1ynwXT3u
X-Proofpoint-ORIG-GUID: VfZCqqenL6HbovrVGowifNFv1ynwXT3u
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_10:2021-08-31,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=756 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108310129
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=88771d3da1=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uoOiUVOKHVaM

From: Peter Delevoryas <pdel@fb.com>

This is a follow-up to a discussion in a previous series I sent:

https://lore.kernel.org/qemu-devel/20210827210417.4022054-1-pdel@fb.com/

I tried to add a new machine type called Fuji that required the ability
to specify the UART connected to the first serial device on the command
line (serial_hd(0)).

After some discussion, we concluded that we could add a serial_dev
option to the machine class and the SoC to support this:

https://lore.kernel.org/qemu-devel/a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kao=
d.org/

I didn't follow Cedric's advice _exactly_, so let me know if you have
suggestions. I used "uint32_t serial_hd0", because I think it more
clearly indicates that this is the device to connect to the first serial
device, serial_hd(0).

Also, I didn't know how to transfer data from the machine class to the
device state, so I just added the attribute to the machine class and
used 'qdev_get_machine' to within aspeed_soc_realize() based on some
code I found in hw/ppc/spapr_cpu_core.c. I expect that I'm missing
something, I've just been having some trouble figuring out the QEMU
object model.

If this patch is accepted, I can follow-up with another patch adding the
fuji machine type with "serial_hd0 =3D ASPEED_DEV_UART1".

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Allow machine to set serial_hd(0)

 hw/arm/aspeed.c         |  1 +
 hw/arm/aspeed_ast2600.c | 11 +++++++----
 hw/arm/aspeed_soc.c     |  9 ++++++---
 include/hw/arm/aspeed.h |  1 +
 4 files changed, 15 insertions(+), 7 deletions(-)

--=20
2.30.2

