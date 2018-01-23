Received: by 10.28.71.27 with SMTP id u27csp3548481wma;
        Mon, 22 Jan 2018 19:11:48 -0800 (PST)
X-Google-Smtp-Source: AH8x225SJJbKi2nWUWwfTlJIpgIY3tNG2C5yiHrGrlKLjgbtjRMEB3zDJmgCXZOrhLFeRJdkgMRC
X-Received: by 10.129.106.4 with SMTP id f4mr968335ywc.424.1516677108631;
        Mon, 22 Jan 2018 19:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516677108; cv=none;
        d=google.com; s=arc-20160816;
        b=l1pFVfwTUZbFfrM0gpVref6Rehm1ljox2NcdGIJFWCNS7Oe1qqYH+GL3gYsuaY7+Jw
         SPQI//AbYblOppb4BRkKJByiU3Islb36oenrRGYFj6fm4OqfmORtvHwJ/0SYWsYfcyAQ
         91eiT9WKITWUY1DY7TUUfrTf76Se5XlewmllZRY53BqxOuxBsbSOpA1v841KKc6c7WNX
         dq95LtijRYUjLhY1J4oUxhCFJgaKT0nN6JQtXnTrX4llJ15RKMRR0DTxgPnyZij2OaTo
         9r0vYy3vqN03SjtOfkaY1+PmU50nbigx2CEejA8HntHGunPoQ/sN+WXlgAQeBewfURtz
         FWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uU6xlNGqRk3Y0Go4DqbmuXNwS7wce52tE9hHA2Kr1YU=;
        b=LKu4HdfvSA0hIteU338wsWgzPdxTH1yb5ZZuPqwFA3JkJvNbvsNBH0bTvsRlxclYaP
         BdnX1OwvCma1uADMAiBex+Erqp9kSbfD124s83eTjgz6BZSvduBVLqMVTo7uJkpVLW1g
         FJ5VQUz525un464RGnidHCy5TY/yPjleAj0v+tVWcWRS4RnF6M7+49Vlz7rh5Vpx1QrI
         HzCov/YUX8Ec7yX42QcfScev5vIO0Mt88ctPEvTEHsPYOUjr+pQOhV0gXz40wcCKL5dS
         QsaCSngT2+SU/NYZqNrYFZBCx72Hr8sIyJdvIyMxpczSfKxQutYMEqIfvrSvVVVQqKnT
         8Ksw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufgiPfie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b123si1593781ywf.496.2018.01.22.19.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 19:11:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ufgiPfie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edp00-0004a7-11
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 22:11:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovf-00012i-JO
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:07:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edove-00050U-Qr
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:07:19 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovb-0004y2-0f; Mon, 22 Jan 2018 22:07:15 -0500
Received: by mail-qt0-x244.google.com with SMTP id o35so26349508qtj.13;
	Mon, 22 Jan 2018 19:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uU6xlNGqRk3Y0Go4DqbmuXNwS7wce52tE9hHA2Kr1YU=;
	b=ufgiPfieSf7oSbeBVAA3vyM9nfOHdPUbRKKsPecnE66WyOC74TyivqjqDnkzwQexLj
	wY7GwwnGO6d/Itg4rsflg6b2wzwT+gPSzAmfhTMGVeFvGu3Tp6oIhMCUJaFTZJXGMqwf
	8NQkDRV3TJCAfA2jKO2jGU8OhA9BQfsBE+rWhTIrplHAMx65OKP6mW12/BQKegBHiHw+
	M6HbEg6ams0pYNviAhxktE9YE4Tp0eBnKaEVhr6fvYFr4RY0vnRcRMM9ePtnuc2mLVFo
	cv7j22qI/MQ0s23BAQ0I3lA5KRxAegaCI2PW5tsooFqB5nsN4DhhiKZHxiw6eBnghnBD
	jxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uU6xlNGqRk3Y0Go4DqbmuXNwS7wce52tE9hHA2Kr1YU=;
	b=f9wr2sTWSNusowHyDtdLJwBCl9cQCIkWlXyGpV8bHmuSlDisfnvmHu96ZVNJsMZpGf
	FNkLavSfEvtb/cK9cQ6JXTkbMVL4izU8RFS04S8rIRCR2KLmBkEouEwoFxo0mxv47TgN
	a9yBFd7qH3ZxNZ7e06Wo3nQY4Gcg6s7pwJsxk6RuU4xhJxqWLO5kCTTX8N1jyNxZN9Ad
	ZFkNFp6OheKBpn86AAC5qQp1lv4E06942AyDeWcQi9wjrkpIDcv/qvphOIQV6ON6E7S9
	1uwixxQlWzLrU0Eq8PAe2p6QC7IvEb/6EIeRPjjfomTLVlpNQWJPZWLUQQU8LAwrEVjh
	tZmA==
X-Gm-Message-State: AKwxytdNHMYXWk6bCKLkjSH3TRwXetPMyebEsKZDVKyBgDF4DCuORgGp
	RHtnlg6utwDrFulIrP52YeY=
X-Received: by 10.55.127.197 with SMTP id a188mr1506207qkd.10.1516676834659;
	Mon, 22 Jan 2018 19:07:14 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	v20sm4174785qtg.79.2018.01.22.19.07.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:07:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 00:06:27 -0300
Message-Id: <20180123030630.26613-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123030630.26613-1-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v8 11/14] hw/arm/xilinx_zynqmp: enable the UHS-I
 mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1v1DQaQGQ+lT

see the Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 33d5fe53d8..bb4265a4ce 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -394,6 +394,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
          */
         object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
         object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_uint(sdhci, UHS_I, "uhs", &err);
         object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.15.1

