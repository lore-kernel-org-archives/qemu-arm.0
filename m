Received: by 10.25.21.96 with SMTP id l93csp2427934lfi;
        Wed, 22 Jun 2016 04:58:15 -0700 (PDT)
X-Received: by 10.200.48.46 with SMTP id f43mr36963051qte.10.1466596694038;
        Wed, 22 Jun 2016 04:58:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p89si3376653qtd.69.2016.06.22.04.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 04:58:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFgnN-0004HF-Ff
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 07:58:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFggp-0005RQ-Nj
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFgge-0002LP-8U
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:51:27 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFgge-0002LG-4E
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:51:16 -0400
Received: by mail-vk0-x233.google.com with SMTP id j2so58379420vkg.2
	for <qemu-devel@nongnu.org>; Wed, 22 Jun 2016 04:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=LQKb/7O+rSr7XOsfTLpekz2oLMUOe+lyLK1cKHj8BvE=;
	b=X8fG0pQVCCco+1Q7gpBw9pH+RV25Bb3Tjfi0hXt8/8/TPKNnCKMyEOSfwHfIcxITSs
	HNOKO3lcYBOwFtPQOYX7nRh4mxNieQGm0c27zmiucS5Ta80hq9WqpS3ez/6XP7mx2kPM
	lXhJ0tHe4bqbsZ8TZY7twZc7gkXfh6yxDk4Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LQKb/7O+rSr7XOsfTLpekz2oLMUOe+lyLK1cKHj8BvE=;
	b=TG+TDUSokXIQm/rlpLuykpzR2qjKwZk4aBacQX9TF82ZIyrfczvCalh7qpEnUXcd/V
	omtzLNmbPa09l9GaROUw5Owu7Qxrt+LtIjQ4u2c6jhKw7Pt/gPBuvsO3p7E5kVC1lYuh
	T/xb2M3in9ee2rD2Z1vlV1yxslLsDecZCdOMGCMg3BiE/nImUNCeN90TeG9zMtaKP4CO
	pgHd5kO5nBfuXuMCNSRG6y0DsGpZtypYOVDPn93TR9vvKx7X5/Lw6/zedqL85rnRtnKR
	scl1BjHh2NXKwl6FQKPDAezWQKWUmAlO8giKbg590YoTX2WfFvHIykf0ODbwJy/GFbUP
	ujGw==
X-Gm-Message-State: ALyK8tLAzxag9rHF+TO18wKTdB32nWqVbkG7ncPJ00qiFYf4e9Iu+yKYIcsGpn5hQTUCRPlrbwk4EKPG0kvmQC0W
X-Received: by 10.31.153.139 with SMTP id b133mr11714714vke.64.1466596275313; 
	Wed, 22 Jun 2016 04:51:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.68.228 with HTTP; Wed, 22 Jun 2016 04:51:15 -0700 (PDT)
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Wed, 22 Jun 2016 19:51:15 +0800
Message-ID: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] Question about a qemu Aarch64 error when adding
 several SCSI disks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IeER5qE7hCYW

Hi All,
       Greetings from Linaro. This is Kevin from Linaro, and recently I
have met a problem of qemu-system-aarch64 when I am working on virt-manager.
       I have reported a bug here:
https://bugs.launchpad.net/qemu/+bug/1594239

       It's mainly bout adding several SCSI disks to Aarch64 guests.
       If you have a moment, pls kindly give some advice about this.Thanks.
