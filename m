Received: by 10.25.208.211 with SMTP id h202csp2704739lfg;
        Thu, 3 Mar 2016 05:44:44 -0800 (PST)
X-Received: by 10.140.196.85 with SMTP id r82mr3094232qha.60.1457012684103;
        Thu, 03 Mar 2016 05:44:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c134si8908159qkb.124.2016.03.03.05.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 05:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abTYZ-0006FF-4p
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 08:44:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1abTY9-0005pD-1y
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 08:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1abTY5-0005NB-A2
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 08:44:16 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34237)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1abTY1-0005M8-0M; Thu, 03 Mar 2016 08:44:09 -0500
Received: from smtp.codeaurora.org (localhost [127.0.0.1])
	by smtp.codeaurora.org (Postfix) with ESMTP id 6353760CF2;
	Thu,  3 Mar 2016 13:44:08 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 52E3560DA8; Thu,  3 Mar 2016 13:44:08 +0000 (UTC)
Received: from [10.228.68.87] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F1D36024C;
	Thu,  3 Mar 2016 13:44:07 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1457007078-31387-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA_+dZYr=m3ZYOR+qfwFsXn3QuLyMxgrcAR2_FfX8RFTrg@mail.gmail.com>
From: Christopher Covington <cov@codeaurora.org>
Message-ID: <56D83FA6.6090507@codeaurora.org>
Date: Thu, 3 Mar 2016 08:44:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:43.0) Gecko/20100101
	Thunderbird/43.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+dZYr=m3ZYOR+qfwFsXn3QuLyMxgrcAR2_FfX8RFTrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] linux-user: arm: Remove
 ARM_cpsr and similar #defines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qUTKH1WEq/OY

On 03/03/2016 07:18 AM, Peter Maydell wrote:
> Typoed qemu-devel email address again, sorry. I must figure out a
> way to automate "cc the usual suspects"...

git send-email ... \
  --cc-cmd='scripts/get_maintainer.pl --norolestats' \
  ...

Cheers,
Cov

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
