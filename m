Received: by 10.28.71.27 with SMTP id u27csp4580932wma;
        Tue, 23 Jan 2018 14:12:26 -0800 (PST)
X-Google-Smtp-Source: AH8x224/Mr7NuIKu8qjcWQJYpSkWfVNHQDCMzFnGm/RmSOsTDCS5pTqJgwNC2zM4jLbTTSrLM6ky
X-Received: by 10.37.189.207 with SMTP id g15mr3896536ybk.509.1516745546394;
        Tue, 23 Jan 2018 14:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516745546; cv=none;
        d=google.com; s=arc-20160816;
        b=vtWP4ZwJ/MRUb4Wo3vQYWmP2fYPkfasBlE7BMN3+q2f3ONG5fnA6UdulEnoZ84JyG5
         XO/s92LQhed/g8BT+a0dG6hUIcIJImFLQySFtlSxMAJ4EvfH6Vc61OzXx9QrmDuynOBs
         O1wBf7x2IoBolv03NXrgOZ0TgnVgXOkm2MwTSTEijWoX/ncJhy75P0PfOfQ9Cg87tfjd
         gPc716pL62MlhGodh6KvOGCteFwcCfG5emyugl64wzBl5y44ZC5bFPVInWx7uDpmcjcb
         Wy1LIBBkPxU0PD3wYnm/nF7+kWfzkkn1tSjbfhsP0ovb1KfuwQAfu67p/VIwB/TE/LuQ
         /PmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Eooq2hn1/f3FijZetfI96nla9vC5f7fLCZRfIZjRsYc=;
        b=KzVBHgQ3oJe5mxIE4OvTlCNw8NJ4mt+fB0nUDTd+4Vc/vZywEhIkhOfKsHIGvGUEdY
         yqVAetqObOdcgHgLu+oDFOUCzSaqBLivO177lrVCxIC3soUrAJeuxqqqEJvGI4pHEgWl
         bYysh/W8TU+V23ZIUvv/c07OeUTHVHSYmVSdSBIULFdLedM2/Y3N+R7Qat6XZPoJIxcJ
         S2VW4cVQXbetKzCf7Xr5E+RYrhJXe23XFNNV46cq2+67cGvSyZFruexc9fS6oEr2oKGR
         iWTSs6oH1AfteRBJMs2Dx5iwFW/okJcq2lOj+O0M3wynH4JSyyj6Y2kG/miYrV7hSCXf
         lfWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si4198675ywc.60.2018.01.23.14.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 14:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee6np-0006kh-QU
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 17:12:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee6nd-0006iw-0T
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 17:12:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ee6nc-0003qo-8J
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 17:12:12 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ee6nX-0003ks-PB; Tue, 23 Jan 2018 17:12:08 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0M7Knm-1eyNG42K6Y-00x5TQ; Tue, 23 Jan 2018 23:11:34 +0100
To: qemu-devel@nongnu.org
References: <20180118193846.24953-1-laurent@vivier.eu>
	<20180118193846.24953-2-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a6bc9bdb-57cd-4b9d-eb60-0feec05bcbf6@vivier.eu>
Date: Tue, 23 Jan 2018 23:11:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180118193846.24953-2-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:VURuKj6Mj847YgI5OwCFKWFPTGgdSxdmA93Khji/ljDCgVLx1JB
	pWF7tdWEddaTTjDxBY6dqIt3DKUnAmy4zahK7ZIp3HpalYd6wqqO2qgxyQVHWM9I/PunGRB
	Jfz9FNlqQUlK9bpE8loyzmHaD1WC+5mrVSBFS80cmIVPKmokGiafvtU893D2frhER3i8YLp
	sHaKV/e/ydqWLBcYyHhFw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:S3wJhnbj/ww=:67sLMkZUN0KUG9GDhSSHgz
	9dnNzNoy5jPyDCwT1CcRM3bvax+xI9PxWh52tdcoaohGJKVuDjhy9X5QbedVeBbAQWxIbO0md
	xkHSJ4BqmTshEDOaPpojaZRLPItvRokcg4sdiAzvipOaav2z50io7jr5CkomUfAAe20oDn2q3
	LS0Bb0Imr5oVkqDvvrfkGFPgLb4IWFICz4GVH7MAYtiGDplyGGpZiCDCMqqdREjhl6z3eM6lN
	6ghPWQXtSwcwroZ715If/vDzTPfF1XNj1jurz6PuyLCsqJLw313Y9vyFAqgp1Lc4nTZp7JmTU
	UOEWTE1v9AScNgoDR19NyoBwsGcd/g/3BkDHVLCEvNfwcBZ+fiJ+VlGE0gZwU5BwQqBYwzH/K
	Ww1OzOjKLvqHgG/T7SuQWSKKAaZ0mRSpndaUrSLNTBJ10dIyCTD842sT+AWOEviBBt5i4bJO5
	Xzb25756RuWiwM6NOVFrr206Z48+Taf08NSUvbyVJWL/UwbLbz/NlTc8ldE2RYwv/RkvmzS9d
	Py7YPZoSWiDWY9yJdzwezAnGa188tve8vFVzQg7vRw9AO3Yf5nKkC+xpfHvqssR3VeWNmM6sb
	JX10V9Gr5T8msWIqoI0dGCZ13E/Lj17ME+/dGuJ4647/6WmBBDgacITN5wCWu4zvpjzi9JKgX
	JxLWtlUBUkYKbvM8VN2hLK+khTQeD0ZlgZs7ryUJ6vQpNDhdm1LpgQEEq4VkX3EIvSmBacSrp
	L0Ab63WOtopEmhrfJAXM7AGUwJkdKm+KR6K4OLZ7XFuiF+bcviDgqI11MAc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-arm] [PATCH v4 1/7] accel/tcg: add size paremeter in
 tlb_fill()
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LpvaGBRPWM06

Le 18/01/2018 à 20:38, Laurent Vivier a écrit :
> The MC68040 MMU provides the size of the access that
> triggers the page fault.
> 
> This size is set in the Special Status Word which
> is written in the stack frame of the access fault
> exception.
> 
> So we need the size in m68k_cpu_unassigned_access() and
> m68k_cpu_handle_mmu_fault().
> 
> To be able to do that, this patch modifies the prototype of
> handle_mmu_fault handler, tlb_fill() and probe_write().
> do_unassigned_access() already includes a size parameter.

I'd like to send a pull request for m68k MMU series, and 68040 MMU
relies on this patch.

If someone disagrees with this change, it's time to say it!

Thanks,
Laurent

