Received: by 10.80.163.71 with SMTP id 65csp499282edn;
        Fri, 16 Sep 2016 16:01:20 -0700 (PDT)
X-Received: by 10.55.133.67 with SMTP id h64mr9117644qkd.293.1474066880817;
        Fri, 16 Sep 2016 16:01:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y124si5486535qkc.181.2016.09.16.16.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Sep 2016 16:01:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bl28G-00085u-AZ
	for alex.bennee@linaro.org; Fri, 16 Sep 2016 19:01:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bl28A-00084Z-H9
	for qemu-arm@nongnu.org; Fri, 16 Sep 2016 19:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bl289-0008Gz-Pc
	for qemu-arm@nongnu.org; Fri, 16 Sep 2016 19:01:14 -0400
Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241]:36628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bl285-0008DY-26; Fri, 16 Sep 2016 19:01:09 -0400
Received: by mail-yb0-x241.google.com with SMTP id u125so2965527ybg.3;
	Fri, 16 Sep 2016 16:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XkpdmetxNArMPtoGt0bFN3KWah1leWacoHfWLkx9V6o=;
	b=azrjq1N0HCe4VYB5w2WCqPEPs7gFg1A+cId/eMFoFQQqYbCafxrumAyhmemYNSSmHY
	Xd4CXTVSS+D3KXzAb+q7LwnKiJcJMlmOJstp9dcDqt7tPae0Tlez0syPAlbK92GPlnEC
	tKVSTlajkiSTjsP8/RDXK7SmCLWvAgn916G//8UkZKlK5aYtCjIfbYfQbeXImFSUV+Et
	9GzILOwyTBpgT13dlG+hbhQikk1o3mwGKxisU6rJt/2wIGpDX21BlhkDYBRKCu9bw52z
	2ZsNJjsBUN0S5gDK1Qosh8Sy7KePpQIF5x/W+jwz1uExSIYbQwhGgVfVUu1FEPO1IVoR
	pRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XkpdmetxNArMPtoGt0bFN3KWah1leWacoHfWLkx9V6o=;
	b=hex6vPvU5GJUlWiHc4LNvIWP9SOc3SBK2PFKeQUp+HysM1QCPMPKGyOjpseO9o7/O5
	0WSSfVummoNsP59Bsj4PsJF3Fg35DlCTABSxdAUP02wk8eBU8aBuvpMl9uhM/yxfBDsD
	3RrDQSbUasXyuZvMo9feymErMamCvtJCfzNeZth7bVc0mOQVs2GDdZUCawseH3Wwf8Kg
	sHYqs/rguUIWYvxayeTnW0jVUn0w9nzixbEEOH+TCPtvaTKA65/1m/QZBBTknCRDr5ok
	9WCFcQeuYAYMyABhhDfeMuB1kbA8ab4/3wbUdRwsKSxV8fexE00/fb4MxKXN8/2r5ucL
	zxvw==
X-Gm-Message-State: AE9vXwNvOYlV6HhhMZ44HM4n16OX/cEgmX6l7f5QyLec7NIXEcmZ8Xuz9ievYJTeOSqs3g==
X-Received: by 10.37.215.202 with SMTP id o193mr16649410ybg.95.1474066868523; 
	Fri, 16 Sep 2016 16:01:08 -0700 (PDT)
Received: from bigtime.twiddle.net (174-24-157-40.tukw.qwest.net.
	[174.24.157.40]) by smtp.googlemail.com with ESMTPSA id
	u6sm1838873ywf.20.2016.09.16.16.01.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 16:01:07 -0700 (PDT)
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	qemu-devel@nongnu.org
References: <147342618684.13303.1583142856242164602.stgit@fimbulvetr.bsc.es>
	<147342619232.13303.3267934500669032492.stgit@fimbulvetr.bsc.es>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <7d457b8c-6ea2-8bf9-6078-0dd0fcb72208@twiddle.net>
Date: Fri, 16 Sep 2016 16:01:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <147342619232.13303.3267934500669032492.stgit@fimbulvetr.bsc.es>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] Pass generic CPUState to
 gen_intermediate_code()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, "open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Leon Alrae <leon.alrae@imgtec.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Jia Liu <proljc@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OmiifNTl66q+

On 09/09/2016 06:03 AM, Lluís Vilanova wrote:
> -void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
> +void gen_intermediate_code(CPUState *cpu, struct TranslationBlock *tb)
>  {
> -    AlphaCPU *cpu = alpha_env_get_cpu(env);
> -    CPUState *cs = CPU(cpu);
> +    CPUAlphaState *env = cpu->env_ptr;

Why the variable renames?  I.e. why CPUState *cpu instead of CPUState *cs?


r~
