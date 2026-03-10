Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD8EB1076
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 21:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w04cZ-0002Nq-Ml; Tue, 10 Mar 2026 17:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1774596582@qq.com>) id 1w008P-0001Ne-Pk
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:40:41 -0400
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1774596582@qq.com>) id 1w008K-00054d-FN
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1773160823; bh=mbCTTOApFOG3TDTmxgfasqGqHqM4svuoOiNdQ73KCcQ=;
 h=From:To:Cc:Subject:Date;
 b=G7uHyihQH6KUB+mrk5xoQZB1PiTIIugnBt9lQ9JkykE7JUpJmU79o8u+3W5uCaQJ2
 aDqwzmwoTYR5lN9LU7p3OoK183Vzs58zudw+3J87YH4tlgZ6apLswG+GRVm5VFZ7/b
 wzLr+uG6+dbDcO7ZrRVnEdbD0YN2BpKan5hAIpnA=
Received: from dt-VM.localdomain ([175.152.130.74])
 by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
 id A151D2EF; Wed, 11 Mar 2026 00:40:21 +0800
X-QQ-mid: xmsmtpt1773160821tfauccqjy
Message-ID: <tencent_9DDE59F8423A88DA68E378777E694AD22009@qq.com>
X-QQ-XMAILINFO: OZebYClYfzV+bm8ZWwKXZfAZ83gFt0G/Yf9lRfQWiONAt/QxeR2REVz8KHiGB1
 smFvnF/lJS6GXL4Lbcn0QiIR/kYx/bBdTWeS/9S7g2GyktmlajDPoR8zxlpyewqtTN69d7xWFxVa
 d51IILaFVlaSI7Uu6VRXlsaKTJxd0EtX9a2nXRAcfF1sLOo9lXOm6imCjJxRGfcJcVyWh+c+Kkkq
 ERybgcMgoWEvPTW/K9/WFbr5Q2u22rnAfHlfs4+x2sCBX8rHK0qShcXZQAFzM5ipI7dA47/3fOvn
 5DIh+iuowxlwvxvNL5JM+gli5iJoXO1uDLK+MC+Z//5PFQpQAB2rcFoor+G5SqxbmnEUXWMrAp/k
 X3USASz8pDOnx/j4ytifKoUufScXGJTvVdl92ciWY6kk6otq2/Jw1vvmYC722DrBJrpQkxInVXm0
 Jb437U9ygMm+yAPx4+wVPA5fNCKz2LWm1+MiDLdHEFSVxgnfGkdIGTkhUtmLkurp3b25EE8mZzcd
 09tLE+7Km54X/hrDNA27WBSI0JdEa5K7F3pKJteeLPdynUqQqNdiomYQppnDwOWCQdnog7ezQv3j
 z3KTVW6ZNbtu8LOXINBOeLgaSNN8PI4WuFMrXUurOACtZZMl3lYtcMUX6d1Utemib0Vh3Pf6UsBJ
 CtWpyr0yfbDxC4vqwA0fxHobriQ5G7eNa3EznICet8IECwatUWThnpq7JhTuHtHVMOlcRakyXQKC
 3yrLK+YwmABvX6bwIHvqnQbEbs/J60IwGEzbZd7VfYcjOauQVmXu3zU/ihbHhdet0Mv+fh3rU73N
 +JxOxw0902HGR0+XtvGREhPb9jEdUTBIWSRsN3r4QdtUO/JYa5hn6/2C97L3keEdM3ClYdrZ288Z
 HHychorYAs0IPApRM+oU64EAI383hLLqtEaO7SUmk4unRzpgLBg2h0mhZo/AlkofGOlCOHocsrR/
 L2uzP+OIi0F8h2txDqNL6T7/JpbjzVnWMYIzydjxSRwgem6i0ltA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: 1774596582@qq.com
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	TaoDing <1774596582@qq.com>
Subject: [PATCH v1 0/1] Fixed bugs in pl080
Date: Wed, 11 Mar 2026 00:37:25 +0800
X-OQ-MSGID: <cover.1773159339.git.1774596582@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.62.57.210; envelope-from=1774596582@qq.com;
 helo=out162-62-57-210.mail.qq.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HELO_STATIC_HOST=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Mar 2026 17:28:04 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: TaoDing <1774596582@qq.com>

Hi all,
I added pl080 to arm/virt, but when I tested it with the Linux dmatest, the test results did not meet expectations.

I found the following issues with pl080 in qemu:
1. pl080 did not generate an interrupt after data transfer, causing dmatest to timeout.
2. When swidth and dwidth are inconsistent, dmatest data verification failed.
3. When bit0 of the DMACC0LLI register is not 0, the guest crashes.

The proposed solutions for the above issues are as follows:
1. The interrupt should be updated after pl080_run completes.
2. The amount of data moved by pl080 each time should be determined based on the remaining data, swidth, and dwidth.
3. Force next_lli to be word-aligned.

Modified test results:
~ # modprobe dmatest channel=dma0chan0 iterations=10 run=1
[   28.637273] dmatest: Added 1 threads using dma0chan0
[   28.649934] dmatest: Started 1 threads using dma0chan0
[   28.664846] pl08xdmac 9001000.pl080: src=0x43bac1d2+/4 dst=0x43bb00e6+/4 len=15863
[   28.667140] pl08xdmac 9001000.pl080: mbus=dst sbus=src
[   28.668419] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc byte width LLIs (remain 0x00003df7)
[   28.670659] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc max bytes per lli = 16380
[   28.672871] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc fill lli with single lli chunk of size 0x00003df4 (remainder 0x00003df5)
[   28.676198] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc align with boundary, send odd bytes (remain 1)
[   28.679140] pl08xdmac 9001000.pl080: lli            csrc       cdst       clli       cctl
[   28.681999] pl08xdmac 9001000.pl080:   0 @000000003a57aa5b: 0x43bac1d2 0x43bb00e6 0x4337e011 0x1e03f002
[   28.685286] pl08xdmac 9001000.pl080:   1 @0000000080658250: 0x43bac1d4 0x43bb00e8 0x4337e021 0x1e4bff7d
[   28.687560] pl08xdmac 9001000.pl080:   2 @00000000ce9a3773: 0x43baffc8 0x43bb3edc 0x00000000 0x9e03f001
[   28.691012] pl08xdmac 9001000.pl080: allocated physical channel 0 for xfer on memcpy0
[   28.693065] pl08xdmac 9001000.pl080: WRITE channel 0: csrc=0x43bac1d2, cdst=0x43bb00e6, clli=0x4337e011, cctl=0x1e03f002, ccfg=0x0000c000
...
[   28.941126] pl08xdmac 9001000.pl080: src=0x43bad504+/4 dst=0x43bb1848+/4 len=9233
[   28.943821] pl08xdmac 9001000.pl080: mbus=dst sbus=src
[   28.944726] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc max bytes per lli = 16380
[   28.945643] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc fill lli with single lli chunk of size 0x00002410 (remainder 0x00002411)
[   28.947219] pl08xdmac 9001000.pl080: pl08x_fill_llis_for_desc align with boundary, send odd bytes (remain 1)
[   28.948248] pl08xdmac 9001000.pl080: lli            csrc       cdst       clli       cctl
[   28.949171] pl08xdmac 9001000.pl080:   0 @000000003a57aa5b: 0x43bad504 0x43bb1848 0x4337e011 0x1e4bf904
[   28.950958] pl08xdmac 9001000.pl080:   1 @0000000080658250: 0x43baf914 0x43bb3c58 0x00000000 0x9e03f001
[   28.952028] pl08xdmac 9001000.pl080: allocated physical channel 0 for xfer on memcpy0
[   28.953107] pl08xdmac 9001000.pl080: WRITE channel 0: csrc=0x43bad504, cdst=0x43bb1848, clli=0x4337e011, cctl=0x1e4bf904, ccfg=0x0000c000
[   28.955467] pl08xdmac 9001000.pl080: txd 000000002cf18c89[b]: marked complete
[   28.960501] dmatest: dma0chan0-copy0: summary 10 tests, 0 failures 33.59 iops 359 KB/s (0)

TaoDing (1):
  Fix the bug where the PL080 transfer complete interrupt is not
    generated. Fix the bug where the PL080 LLI is not 32-bit aligned.
    Fix the bug when PL080's source and destination widths
    (swidth/dwidth) are inconsistent.

 hw/dma/pl080.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

-- 
2.43.0


