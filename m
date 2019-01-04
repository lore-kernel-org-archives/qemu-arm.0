Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp471130wrt;
        Fri, 4 Jan 2019 02:48:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7luLEH3YpVvBZVpWtu2ArSLuYl+FWKOXASM8LKr0AeSv8v3FXp60lRkFQqDmFGdJ89Hw8v
X-Received: by 2002:ac8:7518:: with SMTP id u24mr50034318qtq.75.1546598897607;
        Fri, 04 Jan 2019 02:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546598897; cv=none;
        d=google.com; s=arc-20160816;
        b=hOh9Gmwb0/YyEpywYp9l9whOLcOyoYQgbytsRSV2Wbj51D9mA7U8T68cIn1kf449e7
         yNXhbLaDT1/aUx9LAf0Lk7II/rPUfbVPphdjrO0LsJdGq6TNclMKU9O5+UcHYtyX9g85
         MIcGYGzjo5IZrNPCCP57We2Ln5TElK2U637Cg86u4DEplfSB2NIqfByldssS+9dZ1xkJ
         cUv8Bm5TvvtukMCQxcUL3eN01nwdfjntgrLkGZxUPyAYpe5sompxHn5YF+hGDj3BvC6M
         kUTa2vsbomaFM/jSu6BYS+dkr7yr2boZWTBvnN3ff6OEwjOiRYTs/PrfS8ssqwkmXHiN
         QmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=v1W1ynEMdJJTgBN8DDXtdsjPO8eS5e0tY+lpPlPkWpk=;
        b=PPnH6nK3/UIhtkAAbIPZAp+Xw6s5JwNKvnRbTWgDQkarxQC3m6sqBwK1xgkHTftqYm
         s2LXlMT3C4BXKMJVlZHnGpPD0SW+ZDskaZPli3rlSnDblHtj2PyF/0yfy5saEYCoEinH
         qByGOl5Ldezgkuyjzssvk7u0DXX7z/GMePR9cDd1LoTxB/N/G/WrRbkt5iCyU3K/afqK
         uKkWjmT1qdlhHqNb9OYDEEZGpt49/rqSpDan9MJnmJaph4GwHhf84y3gfgpmyWFXCLDP
         zq5rUqk7kfqhYAViY7u+6WubieiE3C8RaN/f13s1xI7DSPHSRdhMHUKmfzVqNQufQw2E
         zECQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ED7SCyMl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v60si514726qtd.31.2019.01.04.02.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 02:48:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ED7SCyMl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:34013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfN1V-0003tt-7M
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 05:48:17 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfN1A-0003tT-Bz
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 05:47:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfN17-0000Am-N3
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 05:47:56 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:40852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gfN17-0000AV-Fs; Fri, 04 Jan 2019 05:47:53 -0500
Received: by mail-lj1-x22b.google.com with SMTP id n18-v6so32095874lji.7;
	Fri, 04 Jan 2019 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v1W1ynEMdJJTgBN8DDXtdsjPO8eS5e0tY+lpPlPkWpk=;
	b=ED7SCyMln3PKz9AaiPjQOBjTG/tp2S+MhNbAt971M5tMY6sYIeZpC9nUYinDduGR2A
	FgzMfbQjKyfYF/rPyseOzyPYKdVRLhBBlEhB892Fpe32kVSK56SVuyAalFuPlNuBAKya
	zLjQDh4zuKCOQzlNr2zKEqJGaDav+A090T6v0rApwHvIIHEG/vv6ufRNYpSzUnWWJxCU
	/WijE/8lZHwPFp8oPW4I8rZFj9KYlqPb3VtKjf58N8CisMPE3Z99WtMCISggVScPONJN
	oQJvlEqEjFed9ImwJjo4LUlnnQjRHyDturYuNajpRyFWJlt8Az0/EbJfXbtQNDa7g/14
	1KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v1W1ynEMdJJTgBN8DDXtdsjPO8eS5e0tY+lpPlPkWpk=;
	b=jraHxfjocdouQ8blYWLu4NA0+1YZ3KZS7UdRuc8GYBp0PEG6+gHWK1JA7eFZbpOUfH
	xf7eRAMJqB1MqAhj/M9I5DwiQFYdgEMfqBeRF626qGykLKymuo6vspHRusM+WW5UjjoO
	+c8GR7fH1W+0GLtQoeiIsPdO7/3Yw+9vZ/rneEun6BR7EHIH17U41eMF2W1lcuiPB3Ch
	zRqPZIxwxxvHPmUgOq/BMUV02pOEO6gLuanCIxfxaQHmwxfofjolauHue3jzgwPETynm
	MhS74EKkg4jDHs+9cypZY8G9UiTMZrE1f/xLNrNL9Rcr6n6Bt7dyk0HISciprrc3GwgG
	T6Nw==
X-Gm-Message-State: AJcUuke4jO73e8uSWGDERdkLlG3YwmQbtZlJQLYrtbBEiLOpgMiIJ7Ri
	CTwup2/sSjOnsYej+jB8XJP6c48ZOXQ=
X-Received: by 2002:a2e:4503:: with SMTP id
	s3-v6mr28729416lja.44.1546598871557; 
	Fri, 04 Jan 2019 02:47:51 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	x11sm12410011lfd.81.2019.01.04.02.47.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 Jan 2019 02:47:50 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  4 Jan 2019 11:47:48 +0100
Message-Id: <20190104104749.5314-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::22b
Subject: [Qemu-devel] [PATCH v1 0/1] hw/arm: versal: Fix memory leaks
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FOKRxZ3pTnrn

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This series fixes the memory leaks in versal board creation
reported by Peter Maydell.

Best regards,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal: Plug memory leaks

 hw/arm/xlnx-versal-virt.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

