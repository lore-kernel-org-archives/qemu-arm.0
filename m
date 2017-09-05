Received: by 10.223.172.38 with SMTP id v35csp1981181wrc;
        Tue, 5 Sep 2017 16:10:51 -0700 (PDT)
X-Received: by 10.55.109.66 with SMTP id i63mr889969qkc.19.1504653051054;
        Tue, 05 Sep 2017 16:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504653051; cv=none;
        d=google.com; s=arc-20160816;
        b=sw4nCiVjWgcaXhzYv0+yh/RT4qCtYGcFQ4aR5e13MilT3lIk+K2OtThzdXnYH+1AJu
         LQe0WgpsFREdtgUMV1/mnekjK5vogYXHnPPN9RCV0CKwX/lTIrxXp+3QciFxMMdYBNHS
         U/GxDpuIiuuMg/fgxiqKhcqmCrNvvbIYRtPiuHt2WbUcYpnhbGHr5TVjddjCured5mXg
         AD6wOnCNqJ9B6t+RU0OyQ9Xl3eY7av09U6BETFvr7g5VwNmIfqXW5esdkNRbd3PuXGvG
         xS5Pb6HEgn6MYeHVQ3q7T+Rjbee+1Ph7o9wtxCqvVHDWuo4DjS9q/XTSQ9oBWSwUyGeM
         rfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=AZAErz25dzXNI4C8am/ELvZ8EmhtXj8mBb3f1g9NtZ4=;
        b=afX6HPVynceVApHGzHiq4VmqvG/hRlfsH/P8yzpxIDJIAKO4i3a+Zyc8BFyLU5Lqus
         6iW7wwy+JIe2YkzkLTfybvjXOJAMbEAv9KiKPonaU5YbgfNEGgyB8ZheUwEfuOwHFMHb
         f3xtFZATHMTYd3u9YWAfXEzfzpChSCvP0LSrt3yGPxrodrQLJ6AGY5LFXTG1fR8VxpL4
         NoyMTxrOKpTGPrgE/sWiq+2JmD51ovnVOsmm+p9KwXgFv8KZSOWHxfJ7zyI/faWer8Pt
         Wvaj2HV6tkeh1FOmiYbOMPh8+54zvFhmqj1urCPM3yI/D+cwzKL+XvaPaYhBM/GleS7y
         RUtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vNvkNQVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v48si1356046qtj.524.2017.09.05.16.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 16:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vNvkNQVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMzY-0008OT-QK
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 19:10:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMyc-00084r-D2
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 19:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMyX-0000Hb-Ga
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 19:09:50 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMyX-0000HV-C2; Tue, 05 Sep 2017 19:09:45 -0400
Received: by mail-qt0-x241.google.com with SMTP id h15so3073060qta.0;
	Tue, 05 Sep 2017 16:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AZAErz25dzXNI4C8am/ELvZ8EmhtXj8mBb3f1g9NtZ4=;
	b=vNvkNQVkyhyA4Rgh9SfjwI8/ploHWVVQJmQRBgnF8+Y4RHPzBLgl9ZJ48vyK7qYvvU
	j0yJvGejvTtSqluysBa1Y+GKVQHKIiklf6PLX3p/VYv6QlQrQTU1MCriaZhQxuZrtuME
	aByDpkcK3LVNUCmve3Pik7eLvGkS6/XXvs/U4vCe2KguCyOQy335HVdbbtlaxog02jsO
	QYr6C3waou4yxcv9BLtXno/5eDE4k7KJ+hZFQpqEHOdBScezbLzMR+5LxR3QxBX3xgQj
	VzphFjffp1agSzvEkQAGeOfZp4lxzfhxV1u+9Ol7POtsSv00AKYYNoVPQziDMb1AjD+w
	yzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AZAErz25dzXNI4C8am/ELvZ8EmhtXj8mBb3f1g9NtZ4=;
	b=lDOYCBYopSBbAsaQaLKpac540i213r/CdqzEn3O9YYPMeGs9JKcxWM2YW0LJQMAdt4
	ok6khL9uaCfsEaVsB5APH8vZtDqhT6YV7A1z2RtkODTf0WclN5Zahe8FXOglKySW24iz
	eoni8jxQ0tUlKOqdKzz1KckdlUU6EePHpU+rpqZ9rsD3yMXH8fvhzerbLsiOqJVqqiie
	91UxPxINlfkDDBTm6Ywr4yJO65U67lQYxo3xvL9jzQvY5+KDD4klmnMtq1Lr3YUf1OVr
	gVu0oAg2C0oWQpqtRM395eCsgZitgb/rYzZ0jQB0Uaik1v1LVzx8B7/IBrgRdsB4rdky
	TKSQ==
X-Gm-Message-State: AHPjjUg+K4+54vildLB53X6p6cLoPR5pPhyp1H29cURLGSdqq/7ZrSmA
	u0SRroiIM6aZ5w==
X-Google-Smtp-Source: AOwi7QDqRxivFXvi2P+cyXA0h8LlVwaJy9bwM8LGdeQom/8PxuKjvcUBHz+A9kBYq/OeFjVVk3DJ6A==
X-Received: by 10.200.25.78 with SMTP id g14mr1029232qtk.48.1504652984960;
	Tue, 05 Sep 2017 16:09:44 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id j4sm1228022qtk.15.2017.09.05.16.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 16:09:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-4-git-send-email-peter.maydell@linaro.org>
	<9af3401e-031a-3ae3-d2fc-315dab3ef9e1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3495db71-0325-29be-1943-b8344a023984@amsat.org>
Date: Tue, 5 Sep 2017 20:09:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <9af3401e-031a-3ae3-d2fc-315dab3ef9e1@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-devel] [PATCH 03/20] target/arm: Add state field,
 feature bit and migration for v8M secure state
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 61rBePcHMiI9

On 08/29/2017 12:28 PM, Richard Henderson wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> As the first step in implementing ARM v8M's security extension:
>>   * add a new feature bit ARM_FEATURE_M_SECURITY
>>   * add the CPU state field that indicates whether the CPU is
>>     currently in the secure state
>>   * add a migration subsection for this new state
>>     (we will add the Secure copies of banked register state
>>     to this subsection in later patches)
>>   * add a #define for the one new-in-v8M exception type
>>   * make the CPU debug log print S/NS status
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   target/arm/cpu.h       |  3 +++
>>   target/arm/cpu.c       |  4 ++++
>>   target/arm/machine.c   | 20 ++++++++++++++++++++
>>   target/arm/translate.c |  8 +++++++-
>>   4 files changed, 34 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
