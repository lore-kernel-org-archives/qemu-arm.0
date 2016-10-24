Received: by 10.80.166.35 with SMTP id d32csp2730746edc;
        Mon, 24 Oct 2016 09:23:39 -0700 (PDT)
X-Received: by 10.31.1.212 with SMTP id 203mr8796800vkb.99.1477326219236;
        Mon, 24 Oct 2016 09:23:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z6si5507566vkz.228.2016.10.24.09.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 09:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byi2E-00075K-0S
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 12:23:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhTE-0005u4-NH
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1byhTA-0003sq-RU
	for qemu-devel@nongnu.org; Mon, 24 Oct 2016 11:47:28 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1byhTA-0003s2-LE; Mon, 24 Oct 2016 11:47:24 -0400
Received: by mail-qk0-x241.google.com with SMTP id n189so13450020qke.1;
	Mon, 24 Oct 2016 08:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=PKa69m9Vpo918rsOdBgcSMxkRHnGOguZJExw/9z0IxE=;
	b=DlTTaDA6wAxMBh+gSeZYJAPITfqSicu1yREzGANuQ1VmNTtK9eNAgWnxCzL28jKKi9
	jRm7xaCwb4jrirOpXknooK+kLaMMGHMznSL3meqt08Bhs+Dt4M7kQBG78dB2Qvs943BQ
	BRijsYyQKr5N1Nr8CFH3gvkpfA2+xginLlqQwfNDhOYfhnLyJAm/S5KUdntFcDGa6ga6
	ZPdM9XYYdx6fUHDUk1Vg2Ze4eZFloZhFsDpq4XgA1tyW1eGBWE0t4n5Lirk847acpxGd
	oe1XmSxogfXECHNXQr4RV2kHLPufNpqo4HmQ+Z4K/2wbhgV9M3OpWm9lTdvqI4J4MJQ3
	phoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PKa69m9Vpo918rsOdBgcSMxkRHnGOguZJExw/9z0IxE=;
	b=Y1ogfJgU6XWx1ngyUQcJ14Km4RJYZ9FfJ1GfOD8mvbb+bds+9ppnkZyAH6pFMIoYyU
	4rhhxRlAVQ51AllnF0bA5JpSg4tNWYlJv0I+u+KBhRcfxuXQwWaD1bE0huCmBzGIN6uX
	4AMXAH0neuhnyNCA1WOKU9tXi+oL5bTm+PAKX6Ougw8cfo+Oqq52zzRWsphBND91r8Rp
	Zq/Y2ohhl/RazfHz2CsyWuI5XB/YaRK8i72xi/zl/+m9qPR7opzlk+7FjzyLe2RcviLZ
	/+9mq7u8mLWrOLZ+U9hLYMv5P2JMi23ue2KgFJuAMcYadSSQJv2h8DHav8wGwZve7bcO
	2Zdw==
X-Gm-Message-State: ABUngvf1zsJEDMQsj/kHfAujgENzYo2JQRHEcC22L90XEOo4kdqyXfvV1BzBGgYM5rvp7Q==
X-Received: by 10.55.137.3 with SMTP id l3mr14986832qkd.128.1477324043621;
	Mon, 24 Oct 2016 08:47:23 -0700 (PDT)
Received: from anchor.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	f46sm8695864qtf.30.2016.10.24.08.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Oct 2016 08:47:23 -0700 (PDT)
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	pbonzini@redhat.com
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9b61799f-b9ee-e535-6c91-dcdb9b5582d9@twiddle.net>
Date: Mon, 24 Oct 2016 08:47:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [PATCH v3 0/3] Live migration optimization for
 Thunderx platform
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
Cc: qemu-devel@nongnu.org, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5j98L/Sk+Hwp

On 10/23/2016 10:55 PM, vijay.kilari@gmail.com wrote:
> The results of live migration time improvement is provided
> in commit message of patch 2.

It's no longer there?


r~
