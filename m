Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A3606A321
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZlLUgLw+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQP4R-0006Er-J7; Mon, 09 Nov 2026 08:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agarwaljayesh03@gmail.com>)
 id 1xQNsu-0001mu-NX
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:50:00 -0500
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agarwaljayesh03@gmail.com>)
 id 1xQNst-0001XN-60
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:50:00 -0500
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-36fc0a3fe93so1569868eec.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794224997; x=1794829797; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AlQmBPEd0JcShGBzMn5GnTY6hinG9Q58GkeEbJMACAM=;
 b=ZlLUgLw+nk3MMtWlOMXSqp/7aVRnSC5OkGan1fbcbuAWXaed7sd5KBt0J8pJkMA5wb
 SBD+GlGWSNAJrKXLjuHmRWLhg3NPz+LUUGkCzV7qVXXoZcy692ucPjtg8LtDjasP2yQd
 MQxw1Lk2RU5QpCBLI462HnxJC2U7Tz7TQHrZCI+RB/vL3HzM7XHrBk+4up0mQ+Y05kGc
 TK14db8YiMCsyzRK6NrYickNd1VRVs72jhO1xFIGnWyKlor9Ap3vYcIFsaVG5o3wgR0g
 FrghG/PJcOoTSClWBFUEuEY0mvUJWAgwfOCSix06jdi6NJ2hzuB7XXGZkO50TH2Vv1Zx
 1ORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794224997; x=1794829797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AlQmBPEd0JcShGBzMn5GnTY6hinG9Q58GkeEbJMACAM=;
 b=kiHgmaAzd983I0F89bJ1frdh2OVPBxVjohEGe3/lqKPxMskOi5IjuSL6+Zm6TfKDox
 bDkFTDfH3BoFmPAb2QhPsYq7/Oc1fZNr4IQjMXeddqF3RIp3SX0BEpYbi9ZR/c2Afx0x
 AzWYY7YxQT6TI2+U4vBLZ/id5ak6BABxpkt3gYYinQKer6KSc+UCd8lTRFbbXsuYs4Ny
 9MKrxGR4enx0EhrCCQHyRsgX52xmBzpgQtIvRgRcJjtu2kdVatoGka4F0nbs5Q35T91v
 KRs0J9QL4okkVx4Krx1AbrSKhyPr6kXjp6OfWpjkSHFVRDo7qCJFUklNPL2IFqIv7yzK
 oroQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFFKotIuZonBCbF8xTGAN2hwizJj2H/BouGo2fsGN7uIz7R7LwFAOXxIlM539tLqABK4qjGteabAw==@nongnu.org
X-Gm-Message-State: APuU4Z+fo5UtbDFnqzBnz0ujFuFbhCm0qeYpB/a/jtXHI8dvpjXp2z6N
 0t5U8Uy+y3yNHpegBPIuqMuUU/y+nNrWr4i1upnEmigReRhu5pPDBgzD
X-Gm-Gg: AYBFou1qYLU2frr369PbwLn1udCaiX+uCHtSoMTzy6hvpEFGtdMwhfmgKOZubKIvAZz
 OsUBl6Tcr8Cpx7x/kuEhckeab2NFqWl9fH58VX20p022iYsteIBXD5E7nTHXczGG4ujNU0SKDlP
 GGjETxezl7EqCPL+QvdE4QJiOkI76/TYyGyDDrvR7xn95ALDI2YthXXjUHWqBipo6mp/no/APf/
 G2Fs3C0R3Td5+Y78imgunDZR9dyNBdDb9WWkZ0KahJZnIDEMkfKmsRDRENSSBiwVCkoljQ0AXzA
 18HNgZep1RdHGeY8w/zfeTBNauo2RKqfVapPELaGsDSleSHAdugOUjbzaDjO8iZDgwUzOgSdOW1
 XgZDVf+bm/B1FFxzGX42H1QzImz1dqES4oUiqtcHUgJC2El4P7v2lPhqm5YrjX1xBfachkkR9ag
 XgbB1po6DTOXq1GLH5yIF5rOmYlEEN+EJbz2fWNHOKYVatjpdo+7f9BX7AJ1yUXTt49/dXabpQs
 2ZcbAIJif6EW5xxH26q/98/F0x/+wMSioPppMpGQ+Dh9Udq60ABSXIMqhdFVZZLy1YimMhrsfJ7
 Aj60cZJJ2cWm8lQbrmmL2c28+H+igOzG6ZbQbklIunvDyrWHsvRAm13oAUZfyGsIlK+rd0A5qOe
 xKIoPKL/X
X-Received: by 2002:a05:7022:3c0b:b0:160:a80f:3ed2 with SMTP id
 a92af1059eb24-1b39fe886e0mr5244869c88.10.1794224995418; 
 Mon, 09 Nov 2026 03:49:55 -0800 (PST)
Received: from LinuxMachine.bits-hyderabad.ac.in ([182.75.45.16])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b375603ee8sm12302639c88.9.2026.11.09.03.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:49:54 -0800 (PST)
From: Jayesh Agarwal <agarwaljayesh03@gmail.com>
To: s23adhik@csclub.uwaterloo.ca
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] bcm2838: Add GIC-400 timer interupt connections
Date: Mon,  9 Nov 2026 17:19:44 +0530
Message-ID: <20261109114944.21801-1-agarwaljayesh03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
References: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=agarwaljayesh03@gmail.com; helo=mail-dy1-x1329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 Nov 2026 08:05:57 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sourojeet, Peter,

There has not been any follow up since March 2025. I would like to pick 
it up using the TYPE_SPLIT_IRQ approach that Peter described, as done 
for I2C in commit fb3e0557. Your work will be credited. However, if you 
are still working on it, I will step back.

Thanks,
Jayesh Agarwal

