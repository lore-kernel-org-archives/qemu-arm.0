Received: by 10.223.172.38 with SMTP id v35csp3253917wrc;
        Sun, 17 Sep 2017 18:12:43 -0700 (PDT)
X-Received: by 10.200.8.67 with SMTP id x3mr21900154qth.327.1505697163575;
        Sun, 17 Sep 2017 18:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505697163; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9l/IRNJ1WICQqSkuprMcFl6ZfqyKI2MtwxbGZTdYAurjPrXv4AUhzwSwHuzzB7/Uc
         4qGO35U/Vyy1RzAFDeDYYu9440dPplkNHIMWP45i4RJ3KakA9bl1Hk27YrPuNcWs7tJI
         qnBmWTOLx/snWmje0zkLtE1TsxWfykBbiOq5MS1AVQcPqe6FPexp83PRkRiYLqrBdFjz
         Am/ODamF2Viy1S9cHD4X9kp4LJMe/smR/41SfW/n5NH+/Vc2NZubm+BzI1EYdZ3U2djl
         oiuSjTJm1aUkrQOduFCa8OBSMF+A91lEN38m9E/5zMj9sf9lvcOZA7VhSQnMV65Ke6Zg
         tCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=bdzuvTlLRw/NZ5W14jPD3zC7QRIlGqiDkgW2nkRWMTA=;
        b=Xfan9Jco/Sj8tlB8WrdVCoKdt7wx0EiGBos79uOC973Dww6+wLuuLLV/PGTmltPmUJ
         bqj9PXP496w2dc+zpDkulr8WpS+ECMKlbiDx3anW83m1YbTVqO6Eq2chX14cceu5qqyB
         qZj7GCk/cqkwQuX4pLJLuMLj6+4hoMT/tvwvcl0TSt2i0tNwUus679SR4ysuwSfPCWsx
         I9Y8Mn2XPLLT+N/1g2rf8tbxFt7KYYparL7t7hA4cVN2aoNG3CtjfqYVsxMrBXJSgXqS
         UDspiutggLSOm2r58wfjsOrNAvUBA0mWjzSZUtBv7YDwBZsbfrOG0a2o7KUgScSapFhM
         1ayw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWFD4wyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j184si944455qkc.92.2017.09.17.18.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 18:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sWFD4wyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34193 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtkc5-0005yN-AW
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 21:12:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkbs-0005vW-6H
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkbn-0004WQ-7a
	for qemu-arm@nongnu.org; Sun, 17 Sep 2017 21:12:28 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:53617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtkbn-0004W3-4h; Sun, 17 Sep 2017 21:12:23 -0400
Received: by mail-qk0-x229.google.com with SMTP id t184so5997279qke.10;
	Sun, 17 Sep 2017 18:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bdzuvTlLRw/NZ5W14jPD3zC7QRIlGqiDkgW2nkRWMTA=;
	b=sWFD4wySzvDbq65xCGKSW2DB+O6qNeJ9Xkv//DGAPWoE2HEnqxgLJHWvAtEUPoXs61
	B4TSMvFgMBNAmK8eCQL+3ewA72EVF7/G9MN1VckUqROOjMmbeOyDqEXP1hf0Wvnc6HpC
	KXqIKtZ9YMKql0mDmyiEEqxCppjkEghLU4WR3UNbDUwdEbj/EqeyswZLIZtV042zZstB
	OG4cqxK7GsCE7XhiaYz+h0UQq/vGciO1v1DHwTNATKaA3wqIFamzK650tYZli+ST8NU2
	XmJ95Cp/of3xRtzM09BuTJQI8XQRd82N4+hIq0NU7Gk5mXuGPXsHiT0WK58rtJrQrEsu
	3lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bdzuvTlLRw/NZ5W14jPD3zC7QRIlGqiDkgW2nkRWMTA=;
	b=hIfo2IIibo5NsreqxNBkKE7HJKnsVnqBiTZwBSX9XkjXLn5IUMb2RQPFE9dmW6JA4C
	+i2Hgo0YvT0qTIhXChFvaO+MphRMHPMeYsufOYLOFCQ/8OXNWV5U964uHQdOXJddHhoo
	0E5ymzsMg3NxVFktDTE1cwwMv+9JcvP4dd12SKmSw51+yjvWb3Lqak9syZgvqJiFIx2I
	ZyTMV4kU62+v0ZneZqr3O9/ziCIPTL1whgKIU6FohjVRfIuAxG7unXxN0nJjLIuPfkSZ
	Ylp6+UQUtiNZHjPepAWoDzKT/5zuh4skBRkuzkzDTi4ub8eFuAw34oqd2AkAQFheURt+
	t3uQ==
X-Gm-Message-State: AHPjjUinhBqPTVVHiEnNXE1J1hpJEJnQUmZku6SL5oG2wckq0yU6uvUI
	/AQsK19oQl6F/qrp9ueJMQ==
X-Google-Smtp-Source: AOwi7QB+8XFhM5236KCHPK9StrVXPAOBXoanuGi9pspGpYLVDZgNZU/aQkEP7NQ2THh2a8WsYRn+aQ==
X-Received: by 10.55.147.197 with SMTP id v188mr17891948qkd.350.1505697142753; 
	Sun, 17 Sep 2017 18:12:22 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	b11sm4696571qkb.75.2017.09.17.18.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 18:12:22 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-2-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5e5f2374-ca32-0221-04c9-492fa245c053@amsat.org>
Date: Sun, 17 Sep 2017 22:12:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505494753-10837-2-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 1/5] msf2: Add Smartfusion2
 System timer
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BaTlyI+NKOrd

On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
> Modelled System Timer in Microsemi's Smartfusion2 Soc.
> Timer has two 32bit down counters and two interrupts.
> 
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
